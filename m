Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C0EC282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 17:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 679272081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 17:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJH1a92X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 679272081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9pQowYwc9PXfofrS44pqDEflp3z3XRODJDVquH9zMY=; b=mJH1a92XPmq9xq
	acd1OBzyscSnaUMgSntMQ+D1YyxGm3sIrsFqjcfVl6bVrj4knDmX83LQ1kHoHz1yT8irAVQIRO+lC
	oU27YhpAh398p/gaRJm7CWhBPCAXNfZH2RFaXM6B+hsbS7AX7HxztgJNvE4Tw3ZdfCiCyZr/s11hv
	ZN0VuodEbDq39JJ1fr9QRlpxuVGTT7LIBde/GQXqcIVLZVRhRbLZFjUFuJBHxQm1CAWEBFbCIVfAK
	q+qjtq9seNNFQeUXZFu1n/JzcegTQRae6JF1s6wKVt1gI3azKjM5PwqoU2jEBf2/QamXSAu2a0SR5
	2gVu6iv+KZMoAif7bZeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr4kf-0003wL-MV; Tue, 05 Feb 2019 17:43:17 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr4kd-0003w2-7z
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 17:43:16 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84AF2B60D;
 Tue,  5 Feb 2019 17:43:11 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] arch: riscv: support kernel command line forcing when no
 DTB passed
References: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
X-Yow: OKAY!!  Turn on the sound ONLY for TRYNEL CARPETING,
 FULLY-EQUIPPED R.V.'S and FLOATATION SYSTEMS!!
Date: Tue, 05 Feb 2019 18:43:10 +0100
In-Reply-To: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com> (Paul
 Walmsley's message of "Mon, 17 Dec 2018 19:15:12 -0800 (PST)")
Message-ID: <mvm36p22ksx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_094315_428737_CDAD4B30 
X-CRM114-Status: GOOD (  11.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, paul@pwsan.com, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Dez 17 2018, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c290e6aaa6e..e6b962ff39b1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -171,7 +171,14 @@ asmlinkage void __init setup_vm(void)
>  
>  void __init parse_dtb(unsigned int hartid, void *dtb)
>  {
> -	early_init_dt_scan(__va(dtb));
> +	if (!early_init_dt_scan(__va(dtb)))
> +		return;
> +
> +	pr_err("No DTB passed to the kernel\n");

Isn't that backwards?  early_init_dt_scan returns true if it found a
DTB.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
