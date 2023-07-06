Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14185EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Gtvf66sWCyrPM8PtwEMQJHF2QuI4lDE8/VLwu87p/54=; b=gN7wFMHijr5RTD7BZbx4m+fgz/
	mTR3gRpicGzeQ/2CuBgnjE+3C3MSkaAOF5nksnocj/bWi0b6kRrFXTB6wcT72UIeuaNJ1eDHHzpPu
	uLHhK5MnRdMGrJw1G4K7nh3G78ewlW3wWdmf8LP/d+Jf/lqNZgs2t5FreZ9bhjFPCFuJfV/5xC4Xy
	zVIFDLMzt8mEaZnxxvu5AB+3FevuqMIxkNv0lA5Jw+oRHv2JsotaNdu238yE5jJTBCXMjgbdPtSPB
	n0jJAogdjyDYQ6Us/SOuljCAqivHzCujLIb9jux97uKv/txWhxWvjou1QcVCMN3M4teeZF0r2sv5j
	XzLnos/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSmJ-002Hgj-1Z;
	Thu, 06 Jul 2023 17:28:27 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSmF-002HfY-1q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:28:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8303cd32aso6089585ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688664502; x=1691256502;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoegTGI95fKsumkjS+1XKRjfkhTKVtuLfXaAI29e2nU=;
        b=fFkDhgyCA0h5hBjqZP4h8HVpET+hv2BX7SaQZ64GEuGt0wv+dWAw5NyctKmq8MX8OY
         vZXoQ+vcDSJxc5woLqhxqljTSCoW2hq05s+nXiwnq+PQAtgaean1O4M9SF9AWqdjWKmW
         CTifhxP/VOgAolCfUFIcHKLnX6xjtCADxoxc4n4WlslLfSzAjWFZCjht3Pcc1TSiy4Om
         Mf5yNWDLLxni0GQMupk5KBufxvn+PP1XSXDkLvoIRFTySX/tvpn+NX7Qn/6dKYpUMbAB
         O68zYqeVhSUIQfsTRPJmavCMtXnD2VuNPktqx8cF2mkvaKc23ioTzruUCFM8c7EPcOhI
         s3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664502; x=1691256502;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoegTGI95fKsumkjS+1XKRjfkhTKVtuLfXaAI29e2nU=;
        b=WPHygC1hcO0aIhT7x9IcwBNfVFi/dRarFJY7zrRfQFQjR0n1+eMiD418oyT2+UHgy8
         Lcp++lxC57Q3xGc3MHhKIlWgBZ/7MJcYcUOfc0paJJHARBC/mp0Gs/BetK3jTdPshuDa
         OevhiwU+dlnhJzYUWT6NprZpIZUJWiWfiAM4LKbsaZIjSZ+m6MKPK3uzUDWGium6rtpf
         cObtHoG9HDOQk0jMA3q6B170+GAXgtT0BR3Tw0H8bfGwaa5lRgOgwV6gBwWclLMq8ElN
         gnGNHbKmywv+8IqkzeFmerIym26RWD+wH7N0bTQe67Se5lRNFs7333PjbTdaoAFtOv5T
         qaiQ==
X-Gm-Message-State: ABy/qLYl5/khyXP9r+ULBJ19OZm8ijT0IZ3NOXDdz8Q3ubGwydlhr7mx
	RFx/jQoMf/uffJ5Z3AbuPBBwEen9KS0YN1/JLP0=
X-Google-Smtp-Source: APBJJlGOfDRhyAQa6rJARx0bdx07ftb9xmMGQc/MESpC3WNCF0QMus6CS/b4byPiCEYcCxgbZ8F9AQ==
X-Received: by 2002:a17:902:b20b:b0:1b1:9233:bbf5 with SMTP id t11-20020a170902b20b00b001b19233bbf5mr2416751plr.57.1688664502046;
        Thu, 06 Jul 2023 10:28:22 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902ee4100b001b88f76616dsm1685933plo.126.2023.07.06.10.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:28:21 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:28:21 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:27:35 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Provide a more helpful error message on invalid ISA strings
In-Reply-To: <20230630-valiant-chimp-ba079aedffe8@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-62c3565c-43f5-4a17-940a-e02483b19c33@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_102823_802628_3147B987 
X-CRM114-Status: GOOD (  29.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 29 Jun 2023 16:17:27 PDT (-0700), Conor Dooley wrote:
> Yo,
>
> On Thu, Jun 29, 2023 at 03:35:03PM -0700, Palmer Dabbelt wrote:
>> Right now we provide a somewhat unhelpful error message on systems with
>> invalid error messages, something along the lines of
>>
>> [    0.000000] CPU with hartid=0 is not available
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] kernel BUG at arch/riscv/kernel/smpboot.c:174!
>> [    0.000000] Kernel BUG [#1]
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00096-ge0097d2c62d5-dirty #1
>> [    0.000000] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>> [    0.000000] epc : of_parse_and_init_cpus+0x16c/0x16e
>> [    0.000000]  ra : of_parse_and_init_cpus+0x9a/0x16e
>> [    0.000000] epc : ffffffff80c04e0a ra : ffffffff80c04d38 sp : ffffffff81603e20
>> [    0.000000]  gp : ffffffff8182d658 tp : ffffffff81613f80 t0 : 000000000000006e
>> [    0.000000]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81603e80
>> [    0.000000]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
>> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
>> [    0.000000]  a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff816148b0
>> [    0.000000]  s2 : 0000000000000001 s3 : ffffffff81492a4c s4 : ffffffff81a4b090
>> [    0.000000]  s5 : ffffffff81506030 s6 : 0000000000000040 s7 : 0000000000000000
>> [    0.000000]  s8 : 00000000bfb6f046 s9 : 0000000000000001 s10: 0000000000000000
>> [    0.000000]  s11: 00000000bf389700 t3 : 0000000000000000 t4 : 0000000000000000
>> [    0.000000]  t5 : ffffffff824dd188 t6 : ffffffff824dd187
>> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
>> [    0.000000] [<ffffffff80c04e0a>] of_parse_and_init_cpus+0x16c/0x16e
>> [    0.000000] [<ffffffff80c04c96>] setup_smp+0x1e/0x26
>> [    0.000000] [<ffffffff80c03ffe>] setup_arch+0x6e/0xb2
>> [    0.000000] [<ffffffff80c00384>] start_kernel+0x72/0x400
>> [    0.000000] Code: 80e7 4a00 a603 0009 b795 1097 ffe5 80e7 92c0 9002 (9002) 715d
>> [    0.000000] ---[ end trace 0000000000000000 ]---
>> [    0.000000] Kernel panic - not syncing: Fatal exception in interrupt
>>
>> This adds a warning for the cases where the ISA string isn't valid.  It's still
>> above the BUG_ON cut, but hopefully it's at least a bit easier for users.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> I haven't tried this yet, but Conor posted the log as we were discussing
>> the DT deprecation at
>> <https://lore.kernel.org/all/20230629-angled-gallantly-8fe7451a25fa@spud/>.
>
> If you are gonna apply this for v6.5:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Otherwise, can I take this in my series? I probably need to extend it a la:

I forgot about it and it looks like Drew pointed out some small issue.  
Do you want to just clean that up and pick it up with your series?

> [    0.000000] CPU with hartid=0 is not available
> [    0.000000] CPU with hartid=1 is invalid, this kernel does not parse riscv,isa
> [    0.000000] CPU with hartid=2 is invalid, this kernel does not parse riscv,isa
> [    0.000000] CPU with hartid=3 is invalid, this kernel does not parse riscv,isa
> [    0.000000] CPU with hartid=4 is invalid, this kernel does not parse riscv,isa
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at arch/riscv/kernel/smpboot.c:174!
> [    0.000000] Kernel BUG [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00098-g372a21066d8a-dirty #1
> [    0.000000] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.000000] epc : of_parse_and_init_cpus+0x1de/0x1e0
> [    0.000000]  ra : of_parse_and_init_cpus+0xae/0x1e0
> [    0.000000] epc : ffffffff80c0580c ra : ffffffff80c056dc sp : ffffffff81603dc0
> [    0.000000]  gp : ffffffff818a9538 tp : ffffffff81614680 t0 : 000000000000006e
> [    0.000000]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81603e40
> [    0.000000]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
> [    0.000000]  a2 : ffffffff818b01f8 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.000000]  a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff808fc878
> [    0.000000]  s2 : 0000000000000001 s3 : ffffffff813675bc s4 : ffffffff81617520
> [    0.000000]  s5 : 00000000bfbe35c0 s6 : ffffffff818b0090 s7 : ffffffff813e1cf0
> [    0.000000]  s8 : 0000000000000040 s9 : 0000000000000000 s10: 0000000000000000
> [    0.000000]  s11: 00000000bf389700 t3 : 0000000000000000 t4 : 0000000000000000
> [    0.000000]  t5 : ffffffff82342188 t6 : ffffffff82342187
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.000000] [<ffffffff80c0580c>] of_parse_and_init_cpus+0x1de/0x1e0
> [    0.000000] [<ffffffff80c05626>] setup_smp+0x1e/0x26
> [    0.000000] [<ffffffff80c045fa>] setup_arch+0x6e/0xb2
> [    0.000000] [<ffffffff80c0036a>] start_kernel+0x80/0x81a
> [    0.000000] Code: fe75 85ca a0ef 98b2 a603 000a bf19 00ef 97a3 9002 (9002) 7159
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Fatal exception in interrupt
>
> with something like:
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 99df12262a3e..708ff4757413 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -64,25 +64,34 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  	if (of_property_read_string(node, "riscv,isa-base", &isa))
>  		goto old_interface;
>
> -	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5))
> +	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5)) {
> +		pr_warn("CPU with hartid=%lu does not support rv32i", *hart);
>  		return -ENODEV;
> +	}
>
> -	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5))
> +	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5)) {
> +		pr_warn("CPU with hartid=%lu does not support rv64i", *hart);
>  		return -ENODEV;
> +	}
>
>  	if (!of_property_present(node, "riscv,isa-extensions"))
>  		return -ENODEV;
>
>  	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
>  	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0)
> +	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
> +		pr_warn("CPU with hartid=%lu does not support ima", *hart);
>  		return -ENODEV;
> +	}
>
>  	return 0;
>
>  old_interface:
> -	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline)
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline) {
> +		pr_warn("CPU with hartid=%lu is invalid, this kernel does not parse riscv,isa",
> +			*hart);
>  		return -ENODEV;
> +	}
>
>  	if (of_property_read_string(node, "riscv,isa", &isa)) {
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
