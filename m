Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8771BC282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:25:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B80206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7pncwBb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B80206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBo8wVjX8CpjjUc5TeNW34nDiKLeE59BePhHMNLlxTQ=; b=c7pncwBbPUFULc
	RcxLmIwLrKvwJi2emK8PNKCEEuex8yBEymEwXfx/Xtin0jcG5PEV75A9EbGNtMPRYARo06nBn34uK
	spHq94fTU0bVoYo2gODPHyYurdwLqiW2yy7+ndvsbAgNwzgQmaszyQwKbMBisn5qh3zTxt/8yacAi
	m61DKJvLC6mgpAevKlKsPBAyylhiAtKfA8X7e/DXg3f9gv9DmiZlmcsJdP3IHPqoVVTleFlamupus
	j4MwvM3IbYRPO84s7b8/7hK2oRwCqNvMid5HaSJ2vORgOpYyo07M3xgjNrVyQZwf1PpWLXrNP6SRh
	hVbYiLBuA0SJEaaXIWYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtWCC-000395-Jh; Tue, 12 Feb 2019 11:25:48 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtWC9-00038b-9Z
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 11:25:46 +0000
Received: by mail-lf1-f67.google.com with SMTP id n15so1712769lfe.5
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 03:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lhvGX1o+vxxf5Lqqc1aR1wxCxsaRLfHTlWErhsSrynQ=;
 b=pCLU8jMz0Mpqj6QhHMsifHlqM0dhkDISmGAaYjVbq36Z+rmh5Vbbvu5Vc3si3QZnlL
 UNQxcvVDHOScu6+CBXE2CHZ0eOI1ND5y5MRYtXmkYRIKxZemW9NLGb9qGbe6pS5NITHx
 gANw+wjsRuhjdw8PxXE+u5Jc27Djr7v3gJJuPJxuudVmHrOZ1BRk0vaqY26nbD63xsmM
 gW4zxbDJt7KWKgmyh81AR7+iRru1agysl8fc+l0c7dNP/MKQP3aetpyawHuMT/FlNkm7
 g4d6f/XDJZePWKdCja4U2aY/7FYQsjqHSFNctUTCDvof2yOMO0cICybzNUqVO/vnqvGV
 VP9Q==
X-Gm-Message-State: AHQUAub/BhLVkmRhbeD4PyLtHab3yZLTrhBUd18Y7LAZUC5msUjQ1EnW
 Lf2gk4UO0F/Agjr+oLHNnoU=
X-Google-Smtp-Source: AHgI3IbMK0/0I5K2Yvctlr3ogxzo33+W9x4iykN3NsGLcKHGGGhESJPMsIZKnBXYkb7Tg0eS9h0rig==
X-Received: by 2002:a19:4f15:: with SMTP id d21mr2099389lfb.86.1549970741912; 
 Tue, 12 Feb 2019 03:25:41 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id v29-v6sm2618417ljd.44.2019.02.12.03.25.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 03:25:41 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gtWBy-00053z-HI; Tue, 12 Feb 2019 12:25:34 +0100
Date: Tue, 12 Feb 2019 12:25:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v4 PATCH 8/8] RISC-V: Assign hwcap as per comman capabilities.
Message-ID: <20190212112534.GB28278@localhost>
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
 <1549969812-22502-9-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1549969812-22502-9-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_032545_330305_A05DF08F 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 03:10:12AM -0800, Atish Patra wrote:
> Currently, we set hwcap based on first valid hart from DT. This may not
> be correct always as that hart might not be current booting cpu or may
> have a different capability.
> 
> Set hwcap as the capabilities supported by all possible harts with "okay"
> status.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index e7a4701f..a1e4fb34 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -20,6 +20,7 @@
>  #include <linux/of.h>
>  #include <asm/processor.h>
>  #include <asm/hwcap.h>
> +#include <asm/smp.h>
>  
>  unsigned long elf_hwcap __read_mostly;
>  #ifdef CONFIG_FPU
> @@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
>  
>  	elf_hwcap = 0;
>  
> -	/*
> -	 * We don't support running Linux on hertergenous ISA systems.  For
> -	 * now, we just check the ISA of the first "okay" processor.
> -	 */
>  	for_each_of_cpu_node(node) {
> -		if (riscv_of_processor_hartid(node) >= 0)
> -			break;
> -	}
> -	if (!node) {
> -		pr_warn("Unable to find \"cpu\" devicetree entry\n");
> -		return;
> -	}
> +		unsigned long this_hwcap = 0;
>  
> -	if (of_property_read_string(node, "riscv,isa", &isa)) {
> -		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> -		of_node_put(node);
> -		return;
> -	}
> -	of_node_put(node);
> +		if (riscv_of_processor_hartid(node) < 0)
> +			continue;
>  
> -	for (i = 0; i < strlen(isa); ++i)
> -		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> +		if (of_property_read_string(node, "riscv,isa", &isa)) {
> +			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> +			return;

Did you want "continue" here to continue processing the other harts?

Note that you currently leak the device node when returning.

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
