Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1469BC0218D
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSETPQONVSixhOItI4gPS+yEijGCF+aInlq2xKGRCe4=; b=VpzM9ns/fq1TGk
	/7ozBoQeFQDSEeAYfbZTfP69VAG4k59aXn6WtrgGLuL3ubBVaXzYnC70LDQG9hRz9UUZcoMQVTad9
	+OT6d/zBF2tJbmNtbmtusMD9qJSAoDecHaculf8CTUaUJ1eNiuLO56bkzW1dABRT+GLcI88vh5OWe
	XKEYzRFRqebNCQDtjwVym1cyNxyme1hAMBkWVfhRBEfPg7FiMUteJJLAVX9jPjepR3Qicaap2Zsfb
	rf3P8PWGGlSVgJJhPbRt19U8vUUrZoWL3lpj/m6XTd18uFL92QxN7C65ch5PoNBUjITVH95adaDsx
	9cT+a+Tpmf5gMbyQ61CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc8fB-00000000qo2-2QhQ;
	Sun, 26 Jan 2025 19:51:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc8f9-00000000qnT-0SBp
	for linux-riscv@lists.infradead.org;
	Sun, 26 Jan 2025 19:51:20 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-218c8aca5f1so89600455ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jan 2025 11:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737921078; x=1738525878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdXvSFO+L4iwC2LmmccPPY17BASnWEA3/Y0WvP5825A=;
        b=p0mDtLEeGOF7FSm62vvW2WnoBnShuJg46uDevjOoSgGWV39s+zJrKPgiVPEQKBxW7Q
         3tRSTCCG7DDOns/ci1ckdu+F6k+ikOQK2a/hC8oD33Y86yo27d3IVL8UZahmiAxvpW/G
         tem9x7zqk472tvE8C2KkROd9X6crU8BoWDKyFUSi7nmg7ERzpq8NCxhKKB5k7oqcxB6b
         mU2cYN06PGCmd/Qw9bskhW0xTqFM2yYe8nLyQKQCcyr4VZKRBz+UC+qy2JysfSfVX3W8
         QtFQ2O0xJ8w0r3+Q9JOnM82tSXyeGLLv7o09HNEwjCXv+CJO11vCsnZXMpQW10DvAQCy
         mz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921078; x=1738525878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdXvSFO+L4iwC2LmmccPPY17BASnWEA3/Y0WvP5825A=;
        b=pjfHFW0P+Eqa/pwY11z+sPvYdcEWdgK4qlGniCGi5BRWEAdwmfQO25+LMkIIh9/93c
         0ErkK+W2Y89eYPBATgcB4Vnd+cN3UtKvs2B6qwHVaTrtMK5hSkbeCqn8AwchXkk1PJkH
         lqkEkc12qCM/8aLsEWAStIL2W3gQDikJrTToFpOP1vU8+5xJSx76S8EZBGbCCyB02uHX
         j0Ppy0QUMryG07RMbP6BgmjJs52eXQZ1znMYY8hkEIvLz4tDAUnQ1/FWABdFbbt0BCbT
         3J8Vt/RKST+sR4E8LuaypzXCnCXCt7Fg4VEsmdL5EFkMKpwTDPwqan7jDcGTyZLJNp6M
         Ohjw==
X-Forwarded-Encrypted: i=1; AJvYcCV3UY5swO9YLKDwd8PF4gb4sDOn3UMaL791jWrIphseXzPsSOZAXp4jDPmCpxWAQhIHNwAldQPO0YZdWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfSGQVBERY4qWvq4eZ1SANCh0j/wChIwouC/KbDdqiJOhQhrOT
	4QjDr4Sb+uiipnQDQac9bUEndGkWzFDUJaVYrxyaOYuw2nF1U+dsZEYMS8mdaQU=
X-Gm-Gg: ASbGnctOd9/K0cZ0mqn7i1exFPc29ECSFFWouRbm3seZkXJNijkslfeRPh9W/Disdll
	aCOih3V5/xyDHuBV1K4M3tVnnCuA4guCCd395bJ1nwYdBaGSDNVzXxMpt0swBpB14Rbd26S9sKH
	PH1q7blJievO/BOn34O/qbVfXRM/pDILrOBl+y4IpcMqvA+fUFhpkpXFseDBxI5HmcHGpdb9YSv
	AdnCyzAsWSsZlvIovoExbqqsYRfB/tPdQiGYLlrAKcRIrmtfhk90ArpORcsoxSN9MTWA6EA5g==
X-Google-Smtp-Source: AGHT+IGoSk4mYu17VQ+itknZWL14N0o9mebUHaIoovydNlfjrIPinqMagEZkniueh88np/z9Ikm2NA==
X-Received: by 2002:a05:6a00:180c:b0:725:e309:7110 with SMTP id d2e1a72fcca58-72daf9a53acmr50924580b3a.5.1737921077810;
        Sun, 26 Jan 2025 11:51:17 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:6c5:2e43:4ce6:45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48f897ed3sm4969089a12.29.2025.01.26.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 11:51:16 -0800 (PST)
Date: Sun, 26 Jan 2025 11:51:13 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5aSMVZLMwmyCp9k@ghost>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
 <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_115119_416033_04590A05 
X-CRM114-Status: GOOD (  14.15  )
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

On Sat, Jan 25, 2025 at 11:30:09PM +0000, Maciej W. Rozycki wrote:
> On Wed, 22 Jan 2025, Charlie Jenkins wrote:
> 
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >  ASM_NOKPROBE(handle_kernel_stack_overflow)
> >  #endif
> >  
> > -SYM_CODE_START(ret_from_fork)
> > +SYM_CODE_START(ret_from_fork_asm)
> >  	call schedule_tail
> > -	beqz s0, 1f	/* not from kernel thread */
> > -	/* Call fn(arg) */
> > -	move a0, s1
> > -	jalr s0
> > -1:
> > -	move a0, sp /* pt_regs */
> > -	call syscall_exit_to_user_mode
> > +	move a0, s1 /* fn */
> > +	move a1, s0 /* fn_arg */
> > +	move a2, sp /* pt_regs */
> > +	call ret_from_fork
> >  	j ret_from_exception
> 
>  Wouldn't it make sense to save a jump here and make it a tail call, i.e.:
> 
> 	la ra, ret_from_exception
> 	tail ret_from_fork
> 

I don't believe so due to the return address stack. It was shown in this
patch [1] that a 7% performance improvement can be seen on existing
riscv hardware by performing the extra jump. Doing tail calls should be
avoided on riscv since the hardware can be expected to predict the
return address incorrectly every time if the return address is manually
changed.

- Charlie

> ?
> 
>   Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
