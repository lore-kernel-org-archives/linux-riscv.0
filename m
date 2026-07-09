Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A38C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx6GpNnyoEddPnLtB/8KaQFuvxIA5lmIxgvT6AdXzXg=; b=dp7W7vc1sGRolw
	vpd15eu+pgpB3aIAe5JUUxqHPklhm6y/yjg3GJjlFjw8oDBrcOq9C2C7ub+gAv6vqahfVeWlKDr+Z
	jIWLMNoLri8TFP7o3dlxO1PJeIInlzt2lDmPURUVLhOEgr1pJPEnIQhR7hhTUi5vuYOsVAZiDNmGZ
	Oi24yudjDtT/0DVB/yeXbMsOn+eIQDniO9IKzoNQLYFuMrV5fuGNZeUAjnuGFPn1A9fokN4gIB+fc
	qAE3hJIouuqQD/9cPySGWYL8SPpHQYJb3Lgw7A9k+qigYznxlBk2XJLi6wiegpm/Wkhrck/+J3Ug8
	MF+B3X6o/6B7o3H6NH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj32-00000001GC5-1PP5;
	Thu, 09 Jul 2026 07:19:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj30-00000001GBT-1JME
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:19:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84830c774a0so1552197b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581589; x=1784186389; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sHb0UngxXwJZWQ+SW0DiW47/EFLVWbDeAGeKbL3an5s=;
        b=OTxm2pRbWBTg9BUTWZp2dVPDueJshHitrLwj/yvuW8quOmgkLl1HJ1xVjfwf+G+hY2
         rK6SgAKFrwrYvUpYlb1PoE3/GNgZOpwAgtgT3IrCYlzZeaZXziXAfge+S5/8+eAUheqY
         ZSZpPi6CnpudolslLm0kZvjpvusrt/BVsq1iwQgKeRhqiNCqgP9bRq3TOIYDaZG4gRoe
         0RA0P1L9eKlBTW06E35O6o7SNt+aXw3D4EfWSQl78b2dvSZ/XirdMO6wc5eEAZgvsT2B
         TryFlrplF8RvEBIJknQNmk4T3fabTGIy7l3alO2+D/l+SdfWztJ6vQnC6XYjp+gzvmvK
         HI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581589; x=1784186389;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHb0UngxXwJZWQ+SW0DiW47/EFLVWbDeAGeKbL3an5s=;
        b=pbSyZUsLbvJYuAIDeo1NBVv69x7S7MrZ7R4VxeQFujGNwroBEMr3uPV+kJnjvrjHS7
         dytDnOvU+1cl39Pas/CV2iIwz5CzWKTaNy+xAC0q+QnvlSTAXarzU8JTE4xEmPXKpVTE
         MM+oDaq1S14aU5jTHqnobn3BPOTNFtraFNH6G5OsJZCnwo2lPINVSGDtOnnL+LyVyXo6
         vYRgiuMpYkKRZAShpmH7bGCD0pr+dtImthpBTPb9I6xF3qR1T5KAqRysQLWWA+QihjBy
         YJC5eIy8QBpAnOTLQinXUJRkrzW1lY2v4zm+9my2mUipC2GzgezLYQ56fRRqcJYn4LJj
         2psA==
X-Forwarded-Encrypted: i=1; AHgh+RqHEj81sN2mbgF9a/1rfLd+61u6sFq1I283FBSHmNQe5rtuboJqFtZz4DNZJWfGsDnC1kIAng/rSVveFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjbc3st1OVhu0Af/JUZaNQRnmeoh2awjRr0xlJZWvqzPO1ZIx4
	bkeH3dSoIPpGFnVbZlPQitmJz78lDppewACJbsbVBDT3BXXBgcK76rff
X-Gm-Gg: AfdE7cmaym1O+ZxceT163EPHcQxdpSjtlafewTQZkCHCWdXPBf5R0NsyUc+nPpbJhkX
	2VPMdGVnghW+v5EFh35sZgHFsdy7PIwNQh9RDSPNkJ354Q9CMtx39z17YEFm+yIQwqbCLluHPj4
	ciL1M81ZMzYfpz6kny9l7Qj1ccrGv7yXK0jpf9Ik4InwDZSVnDhwWeO748u5CWzeAs+bXWwAyHG
	Ng8n5UX7cU3JKieSoCfeuFFRsBVKLamMPOTi6IQ11esHA1acKi0IxBW0VRDBZJn51zX1Opm7co1
	CMKSS+XJGWy19ByD+ksrcHih1kYmAeelhl4l8+saxzAyxdbJUam3xhTDAIFY3X2oa2JOfLLIARQ
	HLbWnmNsybhiIdUTojBM3ns0yZcKSekqpjl3rNLR9hWCpB+KDpZt6mgXI+W0KeOxvLxWC1DBwAx
	U1nJYZRj+ma1gLj64Nodr+FgIX6O0m0AIiakmW9oBT
X-Received: by 2002:a05:6a00:2e24:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84842ede32fmr5769007b3a.24.1783581589023;
        Thu, 09 Jul 2026 00:19:49 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847d4134fsm1852159b3a.0.2026.07.09.00.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:19:48 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/2] riscv: probes: simulate c.jal instruction
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260701081033.49871-2-xiaofengmian@163.com>
References: <20260701081033.49871-1-xiaofengmian@163.com>
 <20260701081033.49871-2-xiaofengmian@163.com>
Date: Thu, 09 Jul 2026 00:19:40 -0700
Message-Id: <178358158037.977550.10342416507496007508.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783581587; l=3521;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=0DxzxkuK6pSp31lLCWgUp6xy13qXdHpJmn1rjaI4peI=;
 b=blSV8LrY+5dki/OlbnUoS7JhIGqHSWNpK7P2XM0sWNjKlNIOvOqQPmtNq/ZWtQVaemNCEPI/H
 o1WyA59zJ2NBK9fJaP2kgQj1G+SFQ1i/dulr9cncGfT5x3qnJI7yhqV
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001950_382604_A014735D 
X-CRM114-Status: GOOD (  17.35  )
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

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> The c.jal instruction is currently marked REJECTED in kprobes
> instruction decoding, but it should be SIMULATED like other
> compressed jump instructions.
> 
> Add simulate_c_jal() which saves the return address to RA and
> sets the program counter to the target offset, reusing
> simulate_c_j for the common jump logic.
> 
> Although c.jal is RV32-only, the function compiles unconditionally.
> On RV64, riscv_insn_is_c_jal() always returns 0, so the simulation
> code is never invoked and the small overhead in kernel size is
> acceptable.


> 
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
>
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 65d9590bfb9f..433d9035b888 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -29,12 +29,12 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	 * TODO: the REJECTED ones below need to be implemented
>  	 */
>  #ifdef CONFIG_RISCV_ISA_C
> -	RISCV_INSN_REJECTED(c_jal,		insn);
>  	RISCV_INSN_REJECTED(c_ebreak,		insn);
>  
>  	RISCV_INSN_SET_SIMULATE(c_j,		insn);
>  	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
>  	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
> +	RISCV_INSN_SET_SIMULATE(c_jal,		insn);
>  	RISCV_INSN_SET_SIMULATE(c_beqz,		insn);
>  	RISCV_INSN_SET_SIMULATE(c_bnez,		insn);
>  #endif
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index fa581590c1f8..f8a2f6857877 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -163,6 +163,13 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
>  	return true;
>  }
>  
> +bool __kprobes simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	regs->ra = addr + 2;
> +
> +	return simulate_c_j(opcode, addr, regs);
> +}
> +
>  static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs,
>  					 bool is_jalr)
>  {
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> index 44ebbc444db9..b89e1bb01842 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -25,6 +25,7 @@ bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
