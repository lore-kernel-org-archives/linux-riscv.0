Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0489C12002
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 07:23:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C201B61019
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 07:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C201B61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvWdAcq1o80m+gSLmpQ0acSKe18Z2+SLuD7rrlc9zHw=; b=ve+G6BlFCh3n/1
	9T0bZuB3XOsFEWc63JNQt6ii6w0TuCuGJhKsZDnOfB3Xm6lTebG6wmN15V0OsqLGKzPNbThecgRwU
	DC+FRILR5qzPtSLuXdfyWs+TjSgluYcmJWDu0PFwg4HOjt8SD1eIpwQbQ8Vm7jNMRU55hRXXdKwS3
	egUkJ+Fthn/orUphxMdu8E1UtGrazM/cGpmVHSTMD6DyrsSSWgDS6w+2dxdfl8xE+Uk535bTWYDLs
	0/S+5/rc76ULdA7CFYBBaifvi/ATxPpOeXV7GB1RlpWuSAQ4/+XIbK+81CjA7W1DVrLK+8Bbb3p36
	4kzFtJQ0hjTYtfhvofLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Ncb-008bFc-B0; Mon, 19 Jul 2021 07:23:25 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5NcX-008bD8-TE
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 07:23:23 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GStbw4pHKz1sV5l;
 Mon, 19 Jul 2021 09:23:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GStbw3hpYz1qqyd;
 Mon, 19 Jul 2021 09:23:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id aRUODCvb6Yuk; Mon, 19 Jul 2021 09:23:07 +0200 (CEST)
X-Auth-Info: 1CstQ3u+O2HFe6LzD1x0TTLWObtmaqWeNE8K1bc6w4modteebGK53/t8CZlh0FL4
Received: from igel.home (ppp-46-244-168-116.dynamic.mnet-online.de
 [46.244.168.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 19 Jul 2021 09:23:07 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id A37E52C1DCD; Mon, 19 Jul 2021 09:23:06 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: tongtiangen <tongtiangen@huawei.com>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,  <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
References: <20210621032855.130650-1-tongtiangen@huawei.com>
 <87pmvjtumc.fsf@igel.home> <20210716205332.5856df78@xhacker>
 <871r7yz241.fsf@igel.home> <20210717101805.2afabacb@xhacker>
 <875yx9qvih.fsf@linux-m68k.org>
 <b9a2143b-a258-4404-704e-a94605b68eca@huawei.com>
X-Yow: I will SHAVE and buy JELL-O and bring my MARRIAGE MANUAL!!
Date: Mon, 19 Jul 2021 09:23:06 +0200
In-Reply-To: <b9a2143b-a258-4404-704e-a94605b68eca@huawei.com>
 (tongtiangen@huawei.com's message of "Mon, 19 Jul 2021 11:27:50
 +0800")
Message-ID: <87bl6yrcmd.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_002322_152761_A098D9E7 
X-CRM114-Status: GOOD (  11.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 19 2021, tongtiangen wrote:

> On 2021/7/17 14:55, Andreas Schwab wrote:
>> Please use
>> https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/jeos/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz
>> and run it in qemu with u-boot as kernel.
>>
>> Andreas.
>>
>
> Hi andreas:
> I used today's latest mainline code and .config provided by you, and I
> can't reproduce this panic.

Did you test it like I said above?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
