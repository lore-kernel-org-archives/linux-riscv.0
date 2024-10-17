Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F748D2F7DF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqyOQ6Jo4htboVxJmGFO27XYJtiZnAFZYCLCg2difh8=; b=r3OE33i7VlIthw
	DBUHOzD20rIozpnlDqHVkrsD9MLGF8nimVrG6cdZ1qSM4SEq6j2QcMEhupxzLtcL+s9sevHB9HHJL
	faRoYKfJoXl14eHV2A/3ykpznabytxPD2Gdsye/GJeahcPmnf8WEHktFxLhuOZc3QW7b29bc306Ij
	YYOhGtl97MIIRWOJ5pWZ1Vt1rNB56qZTG2EgXCUyhCUQYQTInQM+UDXGVUdnfl3QNl7oq6L7i5pzl
	Y4LDgyjH/crgD9aSKZAEVs+XfhZo6Z8NSvFHXTfd0G6egGJePvTNy/jQvEUjMJSD9UUaZ4oo+SQDg
	Uzn5aemF3TnI/H2vyNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GHy-0000000DYgM-16kR;
	Thu, 17 Oct 2024 02:30:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EqI-0000000DPRw-09KE
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 00:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+xzsoLjsBfwusEklaj61R5Uo3anocunfPETWtAtlm4w=; b=GzV+7WCKjd0gNQLYFnJNkRZSEz
	kIZfJgda+e9RTieEJ2ZRASEw1k2419HRbGNmewFP8gGPVcY/Ho9fR8UN2qme2BbnqIaGpyg5KRBx0
	t97pzMcIm4021AHsecG4/oDqHz+p0ZLBIPtftUxXGB56qHJIh4tFSf8oHd2Lb4EkolVAlznsCrdpN
	hZ63hkEOkRyughy6wNTxC9q+eMetVanpnjKYkAnUyUCfnKqxEhM+UV5jeKmNjb+fMyxQCE/GQ3r2S
	qeQlaiLueWxR+fd02NqAb8aZcMjhL0GiiQrgscfuOXUh45a1jUE95TNQLnK/Vv486BVUS+3R7jotg
	S5LDOpzw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Eq7-00000006z13-0qNq
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:58:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e585ef0b3so301991b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729126683; x=1729731483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xzsoLjsBfwusEklaj61R5Uo3anocunfPETWtAtlm4w=;
        b=irywOXyRYgXyI/P7V19WQ4FT9xJ+HD1N8qh7KloF9PuHMJzePqvJ5swQgKzAsutHgv
         rhFiTspCd/HMU6dH/aP4MPdYMCER+ReFEovNH6upqZfWk9FFo/mMi1eObjTHt1epE0Cv
         FlWqC0CbBGYMdSs9bY4/epVWDTBF6b+4WWwLU9hpgEsesD5qvQIXlS4aaWF8T+FL4AU7
         WfV5784HC1kzRI0axfbZBs3gzjROihSVT+JJ8vMR4oQHJtfRFvHX2cjo+ioI/sMCzvMe
         FkoI7JzNXUB4fO2I3NFuWLFtOJvrdK2y6L882ZIyCyEul78vSX7azH1red5j/SSFJ4Od
         G5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729126683; x=1729731483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xzsoLjsBfwusEklaj61R5Uo3anocunfPETWtAtlm4w=;
        b=GPyeOEhIq/QjwbRVf7YYlfsh70QhCaTimlQ8sveynaJwxddnzNsmWz28Hr62otRCp6
         ZmYTygmy+OPHHIEmLiE0R8lYBwb/GR6xAiB4tv+u0ieAzaV0OB/V8Mf/vyap9lHn32F/
         Wu0Tl26SPtdkTq7NUFPTfx/BkIVvshYrhk9V4f/ZeKQ9LnHXmcrW+l7lWVLmnt7WhJ3C
         eOQjDybF4ogVu36EAR4u1wQoQgLG/4iA00jLZkiWp1pff5r8X5c7bupeqJmQVqB78i5y
         l2sjyYoxmTbcxuP1tNTFWV8UB8JFT7rL/vWRuwnyA2xpBt1alhfcis8ESlVmFmMNEOEB
         XMeA==
X-Forwarded-Encrypted: i=1; AJvYcCXTBLrIb7LUqjkwhoATIoQsbRP6p+CKLhUpR+4k0z6/Afs3wdNfuBzayjUwVMRMME3+FsAgs3onSdyToA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6XQO40K0h3urZuGmqGUR55kaXS75thGSxqrp9oxqB9E0Q2+IR
	wsIN4PXL/bRTLCbgLzmU/iZ+/kxWkoTGQwbZGL8CCuSq2rR0WO2LRkZ0gTi3DK4=
X-Google-Smtp-Source: AGHT+IFI5+8g1IH2PEm3dnUF8kWImgREgaaIoBfaxKZbuFwo/Iq7b+tVuBUdCdwUiID1rBG7ZmL/ig==
X-Received: by 2002:a05:6a00:10c9:b0:71e:5f2c:c019 with SMTP id d2e1a72fcca58-71e5f2ccbadmr19417242b3a.9.1729126683343;
        Wed, 16 Oct 2024 17:58:03 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e7737178bsm3678688b3a.36.2024.10.16.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 17:58:02 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:58:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v4 06/10] riscv: Allow ptrace control of the tagged
 address ABI
Message-ID: <ZxBhGJ0-hir0gFor@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-7-samuel.holland@sifive.com>
 <ZuOoqTfKs/7G075O@ghost>
 <2e25597c-6278-4bc6-a0c2-3826841c2ac0@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e25597c-6278-4bc6-a0c2-3826841c2ac0@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_015807_841508_CAF3D4C6 
X-CRM114-Status: GOOD (  29.13  )
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

On Wed, Oct 16, 2024 at 12:50:32PM -0500, Samuel Holland wrote:
> Hi Charlie,
> 
> On 2024-09-12 9:51 PM, Charlie Jenkins wrote:
> > On Wed, Aug 28, 2024 at 06:01:28PM -0700, Samuel Holland wrote:
> >> This allows a tracer to control the ABI of the tracee, as on arm64.
> >>
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >> ---
> > 
> > Since this code is identical to the arm64 port, could it be extracted
> > out into the generic ptrace.c and ifdef on either CONFIG_RISCV_ISA_SUPM
> > or CONFIG_ARM64_TAGGED_ADDR_ABI by adding some generic flag like
> > CONFIG_HAVE_ARCH_TAGGED_ADDR_ABI?
> 
> Yes, it could be factored out, though I don't know if it is worth the overhead
> for these two trivial functions. I don't see any other code like this outside of
> arch/.

In my ideal world there is just a generic header somewhere so the only
"overhead" is creating the generic header. But I will defer to you on
whether it is worthwhile.

- Charlie

> 
> Regards,
> Samuel
> 
> >>
> >> (no changes since v1)
> >>
> >>  arch/riscv/kernel/ptrace.c | 42 ++++++++++++++++++++++++++++++++++++++
> >>  include/uapi/linux/elf.h   |  1 +
> >>  2 files changed, 43 insertions(+)
> >>
> >> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> >> index 92731ff8c79a..ea67e9fb7a58 100644
> >> --- a/arch/riscv/kernel/ptrace.c
> >> +++ b/arch/riscv/kernel/ptrace.c
> >> @@ -28,6 +28,9 @@ enum riscv_regset {
> >>  #ifdef CONFIG_RISCV_ISA_V
> >>  	REGSET_V,
> >>  #endif
> >> +#ifdef CONFIG_RISCV_ISA_SUPM
> >> +	REGSET_TAGGED_ADDR_CTRL,
> >> +#endif
> >>  };
> >>  
> >>  static int riscv_gpr_get(struct task_struct *target,
> >> @@ -152,6 +155,35 @@ static int riscv_vr_set(struct task_struct *target,
> >>  }
> >>  #endif
> >>  
> >> +#ifdef CONFIG_RISCV_ISA_SUPM
> >> +static int tagged_addr_ctrl_get(struct task_struct *target,
> >> +				const struct user_regset *regset,
> >> +				struct membuf to)
> >> +{
> >> +	long ctrl = get_tagged_addr_ctrl(target);
> >> +
> >> +	if (IS_ERR_VALUE(ctrl))
> >> +		return ctrl;
> >> +
> >> +	return membuf_write(&to, &ctrl, sizeof(ctrl));
> >> +}
> >> +
> >> +static int tagged_addr_ctrl_set(struct task_struct *target,
> >> +				const struct user_regset *regset,
> >> +				unsigned int pos, unsigned int count,
> >> +				const void *kbuf, const void __user *ubuf)
> >> +{
> >> +	int ret;
> >> +	long ctrl;
> >> +
> >> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return set_tagged_addr_ctrl(target, ctrl);
> >> +}
> >> +#endif
> >> +
> >>  static const struct user_regset riscv_user_regset[] = {
> >>  	[REGSET_X] = {
> >>  		.core_note_type = NT_PRSTATUS,
> >> @@ -182,6 +214,16 @@ static const struct user_regset riscv_user_regset[] = {
> >>  		.set = riscv_vr_set,
> >>  	},
> >>  #endif
> >> +#ifdef CONFIG_RISCV_ISA_SUPM
> >> +	[REGSET_TAGGED_ADDR_CTRL] = {
> >> +		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
> >> +		.n = 1,
> >> +		.size = sizeof(long),
> >> +		.align = sizeof(long),
> >> +		.regset_get = tagged_addr_ctrl_get,
> >> +		.set = tagged_addr_ctrl_set,
> >> +	},
> >> +#endif
> >>  };
> >>  
> >>  static const struct user_regset_view riscv_user_native_view = {
> >> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> >> index b54b313bcf07..9a32532d7264 100644
> >> --- a/include/uapi/linux/elf.h
> >> +++ b/include/uapi/linux/elf.h
> >> @@ -448,6 +448,7 @@ typedef struct elf64_shdr {
> >>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
> >>  #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
> >>  #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
> >> +#define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
> >>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
> >>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
> >>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
> >> -- 
> >> 2.45.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
