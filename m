Return-Path: <SRS0=7SDv=VY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BC2C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 07:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D5020838
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 07:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UrXsKVct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D5020838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjfZBtQKSZqF6/msETF98qR1rWvHhq4N4BIBK/IFqjI=; b=UrXsKVctr9NGE9
	pNFKQh1/3daI/l2uOCIUo4SSU7nqxx/EkDozIsvzJUw0VF/Sy6b+2GxBoLYC7FFkJbonSv8hOX1On
	4S6wUscN3MMazafZ2UOq2m1hCuBpcZOCZrCZczD7TFVPDTdIe3ID1jhDl9f5uY5dtbFeJILjUxP3I
	C+gbCsZZ6REVBIthz+NpejbU504aMOKNTOdWsEAVKJ51HGEsFR/yUhWdD0kWr0lzuYUkKFSs0AvT5
	mYMt6M/8OOVVRAMUVisNROsIto1dlm+m60CKG51FzytpD3WLd9AQ8ibD2RE00QWbnE8Mpm7oU0iuE
	N5RRObiXE9VmCs+eQDCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrGoc-00010u-5q; Sat, 27 Jul 2019 07:08:26 +0000
Received: from smtp180.sjtu.edu.cn ([202.120.2.180])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrGoZ-0000kH-4R
 for linux-riscv@lists.infradead.org; Sat, 27 Jul 2019 07:08:25 +0000
Received: from mta04.sjtu.edu.cn (mta04.sjtu.edu.cn [202.121.179.8])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 9574D1008CBC3;
 Sat, 27 Jul 2019 15:07:44 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 8321C180610F1;
 Sat, 27 Jul 2019 15:07:44 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta04.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta04.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dd-pSmgDG-fH; Sat, 27 Jul 2019 15:07:44 +0800 (CST)
Received: from mailstore19.sjtu.edu.cn (mailstore19.sjtu.edu.cn
 [202.121.179.19])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 5F9C1180610E8;
 Sat, 27 Jul 2019 15:07:44 +0800 (CST)
Date: Sat, 27 Jul 2019 15:07:43 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <1838295604.6938933.1564211263752.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <alpine.DEB.2.21.9999.1907261353330.14300@viisi.sifive.com>
References: <20190726043549.18034-1-xywang.sjtu@sjtu.edu.cn>
 <alpine.DEB.2.21.9999.1907261353330.14300@viisi.sifive.com>
Subject: Re: [PATCH] pwm: avoid disabling clk twice
MIME-Version: 1.0
X-Originating-IP: [180.158.210.73]
X-Mailer: Zimbra 8.8.9_GA_3798 (ZimbraWebClient - GC69 (Linux)/8.8.9_GA_3744)
Thread-Topic: avoid disabling clk twice
Thread-Index: qCx3UE3ab5wIP7iyJ5BpcP0nIHiFkg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_000823_666581_C8C0C5A0 
X-CRM114-Status: UNSURE (   4.10  )
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



----- On Jul 27, 2019, at 4:56 AM, Paul Walmsley paul.walmsley@sifive.com wrote:

> On Fri, 26 Jul 2019, Wang Xiayang wrote:
> 
>> Similar to commit 63fd4b94b948 ("serial: imx: fix error handling
>> in console_setup"), as ddata->clk has been explicitly disabled two
>> lines above, it should avoid being disabled for the second time.
>> clk_unprepare() suits here better.
>> 
>> Signed-off-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
> 
> The patch looks reasonable, but it needs to be sent to other people and
> mailing lists.
> 
> Running "scripts/get_maintainer.pl -f drivers/pwm/pwm-sifive.c" shows:
> 
> Thierry Reding <thierry.reding@gmail.com> (maintainer:PWM SUBSYSTEM)
> Palmer Dabbelt <palmer@sifive.com> (supporter:SIFIVE DRIVERS)
> Paul Walmsley <paul.walmsley@sifive.com> (supporter:SIFIVE DRIVERS)
> linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM)
> linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> Thus Thierry will ultimately be the one responsible for merging this, and
> linux-pwm@ needs to be cc'ed as well.
> 
> 

Will do. Thanks for your suggestion.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
