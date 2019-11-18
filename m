Return-Path: <SRS0=Rdmy=ZK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CEEC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 16:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D166218AE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 16:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsIu8fkI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D166218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=virtuozzo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Le6AOC8fgIyNCIAteFsPUot5fsmKbV/G9SJoZmd8GJ8=; b=UsIu8fkI/WF2yQ/7VaHeqLekH6
	E96dQeOCIKqrFzwMs6QswLDomfXWO03W+wxME/WnjKpJqcmg+hSaII9c8stoyOhS4hyLvZCW9sC2t
	cv+CMHfsyzBhGBBB9dXoaSEVqwpoF3pHyOqYQQ1AfrcwYZf4QbYxXK4r3MkOgsYTfb6jhIp/fMWX2
	LVWVoHoIQDGgSJti8hcCftd2KSp/wv3jeiBFeabCYT+Xw+4A0kHeJ338WFep6fRsGove51uLi+vQR
	BKAVhCPbqgT8MqT9t/MKJUounMfFPVm2mzMik0fg0EbmdFIIhIvo7n5p1hpJwIxjiAG3LxSvLwxN5
	p8qRanNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWjnx-0002FX-9c; Mon, 18 Nov 2019 16:23:09 +0000
Received: from relay.sw.ru ([185.231.240.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWjnu-0002Da-2Y
 for linux-riscv@lists.infradead.org; Mon, 18 Nov 2019 16:23:08 +0000
Received: from dhcp-172-16-25-5.sw.ru ([172.16.25.5])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iWjnP-0006u4-8v; Mon, 18 Nov 2019 19:22:35 +0300
Subject: Re: [PATCH v4 1/3] kasan: No KASAN's memmove check if archs don't
 have it.
To: Nick Hu <nickhu@andestech.com>, glider@google.com, dvyukov@google.com,
 corbet@lwn.net, paul.walmsley@sifive.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, tglx@linutronix.de, gregkh@linuxfoundation.org,
 alankao@andestech.com, Anup.Patel@wdc.com, atish.patra@wdc.com,
 kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, green.hu@gmail.com
References: <20191028024101.26655-1-nickhu@andestech.com>
 <20191028024101.26655-2-nickhu@andestech.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <73f11f1e-6df7-c217-e05d-049d04717600@virtuozzo.com>
Date: Mon, 18 Nov 2019 19:22:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191028024101.26655-2-nickhu@andestech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_082306_121750_63C32395 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/28/19 5:40 AM, Nick Hu wrote:
> If archs don't have memmove then the C implementation from lib/string.c is used,
> and then it's instrumented by compiler. So there is no need to add KASAN's
> memmove to manual checks.
> 
> Signed-off-by: Nick Hu <nickhu@andestech.com>
> ---

Acked-by: Andrey Ryabinin <aryabinin@virtuozzo.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
