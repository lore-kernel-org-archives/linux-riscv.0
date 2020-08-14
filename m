Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFCEC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 22:36:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2570E20768
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 22:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sKK0avHz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lJ/o+2Nt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2570E20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=HCGn+6CMEyCIJQT/mbcFrsEdOLZ3N8f57zBes6p/4Fg=; b=sKK0avHzXE6iqpGG/VudyhZWS
	SBLVsJD57MarsfKqyLpqF278CGL6Lp1C57eXCQtyB3HR3QZTEpx8hbl37c6yrwc/HDG05SbwBqk1s
	uQLeyVvau3FjfUeu8PMF6YtmplQICYbYliVGnpJJZw/Z+gPA9ezAZ+dnPDlo08jjwY3rGwFCyc68x
	SXNjcxRdgaDppAlOZ/A4MnN1mXJw88vyNgFEa67AZ/55GXKrTY7qJIxJe6Pml9Nizbo6K8G3Il7zp
	lF5xY94Yexbe6qnqzmTUvaHCEy48TMupG5XX5MqNi6KoLLPZMcLTrdf5INk6dvkQRBOMh/qPzxmcS
	8w5qvfLTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6iJ3-00037V-0Q; Fri, 14 Aug 2020 22:36:13 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6iJ1-000361-3x
 for linux-riscv@lists.infradead.org; Fri, 14 Aug 2020 22:36:11 +0000
Received: by mail-pg1-x543.google.com with SMTP id j21so5190328pgi.9
 for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2020 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1Gm4DBq2aKiHPSTyt1FIj1F/+D7DhQ4fc8VI2sz0rsI=;
 b=lJ/o+2Nt05U5e0lpQPxqMtSE2E7+/KYFBl+vbHoFZ2b2zxLWZnJaieenezGM3PFgTq
 WS2o0XYtew02RQO3Fd3ntzN3idtpMBg32SI8dHA0ztqWw69TIOjST2gfSC8jAUJorrTJ
 Yv9s0ID87nAT1oQeJlbkb94alXD2B7X3/r31NItPQ6CRyvJo3ldLKYRYnLfgcF4j8O1f
 dDNlzXtKLL+W5OA2dV8LS14ife/GCS6TNLWHktTsZnc7Qust4yLgCt2iMZUHD8FTMNMi
 9arAaxIiI44nVNEMtTQexxiWc4GxwcBIonig4orLKuXGeyBIHvx2FvE8ilEYTpWG8I5e
 a3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1Gm4DBq2aKiHPSTyt1FIj1F/+D7DhQ4fc8VI2sz0rsI=;
 b=tOI07TClRKKqhGLXyVOvUKMfW6Ri1mFWRhK7H2WfBaiqTVX3aFX2NfcdZQJhYhQN7Z
 kKJOYbjS0mhGSU6D61GQ/nAosThSDG2oT8qVqL1xEUztW6ahqyrtv5zEsiVNAHJGRnD6
 Gp93wjRGc3M2BOLt0F3yrmXwIBjBNAYi+IQvLMgqtREH8uygLKr7DSS8qWVKprYGMmf4
 0Q6qr7m7jh4l+lRMhYdAEobJtvsyr3THGXYp/5Z4m30jhyF0UOX1sUsL7mXusYBGZts3
 SdcODKLeYOKmAcqSzgPDJB0YpxQpkhidz5sW6MjdN54Wed0mMF0t3A7zky4awAtopKK6
 2cmQ==
X-Gm-Message-State: AOAM533FB5sRoQvM/SD1p2yJi9zp8h4qCIml3NqmXbMKvpkY1Aq0nts+
 9gUkMtTS1OBGWYaYdYxn+d7i9w==
X-Google-Smtp-Source: ABdhPJxSggPlmWg3KIB8rUnjcpOCqr5iuQ37qtyRCNb+C/Wl89zCMHW8/n9UhEL046/uVKT0MxbZQQ==
X-Received: by 2002:a63:1e65:: with SMTP id p37mr3058000pgm.58.1597444567189; 
 Fri, 14 Aug 2020 15:36:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w6sm8540368pgr.82.2020.08.14.15.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 15:36:06 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:36:06 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 15:34:49 PDT (-0700)
Subject: Re: [PATCH v3 3/7] riscv: Fixup kprobes handler couldn't change pc
In-Reply-To: <1594683562-68149-4-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-296dd63e-71de-4d30-acfb-df374d12388d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_183611_208017_AAEBFE89 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: me@packi.ch, guoren@linux.alibaba.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, oleg@redhat.com,
 guoren@kernel.org, mhiramat@kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, Bjorn Topel <bjorn.topel@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 16:39:18 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The "Changing Execution Path" section in the Documentation/kprobes.txt
> said:
>
> Since kprobes can probe into a running kernel code, it can change the
> register set, including instruction pointer.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/kernel/mcount-dyn.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index 35a6ed7..4b58b54 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -123,6 +123,7 @@ ENDPROC(ftrace_caller)
>  	sd	ra, (PT_SIZE_ON_STACK+8)(sp)
>  	addi	s0, sp, (PT_SIZE_ON_STACK+16)
>
> +	sd ra,  PT_EPC(sp)
>  	sd x1,  PT_RA(sp)
>  	sd x2,  PT_SP(sp)
>  	sd x3,  PT_GP(sp)

So that's definately not going to be EPC any more.  I'm not sure that field is
sanely named, though, as it's really just the PC when it comes to other ptrace
stuff.

> @@ -157,6 +158,7 @@ ENDPROC(ftrace_caller)
>  	.endm
>
>  	.macro RESTORE_ALL
> +	ld ra,  PT_EPC(sp)
>  	ld x1,  PT_RA(sp)

x1 is ra, so loading it twice doesn't seem reasonable.

>  	ld x2,  PT_SP(sp)
>  	ld x3,  PT_GP(sp)
> @@ -190,7 +192,6 @@ ENDPROC(ftrace_caller)
>  	ld x31, PT_T6(sp)
>
>  	ld	s0, (PT_SIZE_ON_STACK)(sp)
> -	ld	ra, (PT_SIZE_ON_STACK+8)(sp)
>  	addi	sp, sp, (PT_SIZE_ON_STACK+16)
>  	.endm

If you're dropping the load you should drop the store above as well.  In
general this seems kind of mixed up, both before and after this patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
