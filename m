Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C0C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgkJBv6j+Pdn/YSYLuAdHGG9irWpk1b6UQiLjJnAFxU=; b=Ln1uVnqMIIwcP3
	ojj0fh9QJPiImNt7eWinF0f4FsQIIGztV+GX/1Y7sow4M/kJyhL2soLCPCnGee6kDhfhrhIk064ZI
	9EKQFa4G27iJFD4tXXd3XY2VEvLJdKIQ3BkjZ4nEjTGoL/Y0VBtgiBlvZpNARe9CcucZtXbfysLD7
	iTdX8JLaWqijDree7KhE7bKBQFeH8sUvTXTqBwOegw7gEdwhbclYFMI8WkugS/ALBATQ0QJlqso6s
	lTINKmQ1LmU0J6jz9Mt4/PtsG7r7RJApO3Rp9XNa01XC/m+glpnnv5041ViIvpynU4ZijqCOYQ60y
	1cgAa1+gwWlwqRRKZKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQ2h-0000000CR8F-1sJo;
	Mon, 29 Jan 2024 11:43:11 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQ2f-0000000CR72-0MbI
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 11:43:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55f12332350so655942a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706528586; x=1707133386; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jll+xDGWtNinZyXQQxr9XYKpco16f8UDTOTc59xvHik=;
        b=SzEaguqDsCb7Oa2RcNi4CHE4sgX4uSBtBr2A27HDVwZroRh4Hso3oHgXhuHFsZV30N
         ZlaV/mxdhDBuYcTJ90MM2JyY5ldnSo5sMhOsCU8DF4H1pUSZmtle6HlPVCnnCTllJQ+N
         RBGA0XrYkdUx+tUcyzvMhSgNwYm68hTX5zcZGKpIpJDTUCWSuvP9oIc+3I1Yc3abajOr
         VSCUeQwAI8JgFMGpQVwZPmBzCY7ihvHqMc8+PlVY5xwNYiYtdMgLQpV3F+c7vTLPRqdu
         0x7MpTzELM0lHhT90DlPCUeQdFRZl937bRtjkDGvbJrLlSW19y1BBTEZDbYPy9gAHZ0k
         Y1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706528586; x=1707133386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jll+xDGWtNinZyXQQxr9XYKpco16f8UDTOTc59xvHik=;
        b=pr4Rq/VvZW7rQ4yde4KolG1+WrxHh/z9SwUxISZdy/HJZseKqPPvIEQQndECd95epT
         cFIV8dzS6mgTwizi9W4lJRAL9szgfkqiGhPN0S38ECcvbEEhMVTJSnc2vHEXIrlCFJx/
         X5O+CMJLt3rJ6KyPZ8eOS9KxDjKgtqKwHAml5XKFVMrh0BfRk+Dy7N80eBb+jerpluB7
         XI0weE96linBWkqd17i3bJsxFlxdJWtMm4Sxbm8ijyrIqJYgpap4J7ZCiVDlzz9Kd/85
         VEb0SZlk6API7ydTh5xT1P+t11AbbrebRH3k6Kwp0/7ASFBvAU45ivV8nrD6AIxaVZwF
         m31Q==
X-Gm-Message-State: AOJu0Yx13K0A87sFWFVftwu/6JqxYHjF7hrTtXWlrlAzc854zQIRuskt
	L0YUhGd/ysbBpOZEaYorYalcm7BhXjQoihpcdfkL5eRZTl9ZmeuLjq8gDJ3uVeamdl34CK99Pz1
	L
X-Google-Smtp-Source: AGHT+IEH86+9YzoszcB0Vw77R/3cAt0Y76DqSvHQ0Vzf0hiKE1eyYrhFeBRHNrBofYY00RvjvRoY9g==
X-Received: by 2002:a05:6402:22ea:b0:55e:ed35:ffce with SMTP id dn10-20020a05640222ea00b0055eed35ffcemr2148019edb.37.1706528586113;
        Mon, 29 Jan 2024 03:43:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fk1-20020a056402398100b0055d19c9daf2sm3657333edb.15.2024.01.29.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:43:05 -0800 (PST)
Date: Mon, 29 Jan 2024 12:43:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
Message-ID: <20240129-d06c79a17a5091b3403fc5b6@orel>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qa2zog6.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_034309_171531_5183C435 
X-CRM114-Status: GOOD (  18.14  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 27, 2024 at 06:16:41PM +0100, Bj=F6rn T=F6pel wrote:
> Pu Lehui <pulehui@huaweicloud.com> writes:
> =

> > From: Pu Lehui <pulehui@huawei.com>
> >
> > Add necessary Zbb instructions introduced by [0] to reduce code size and
> > improve performance of RV64 JIT. Meanwhile, a runtime deteted helper is
> > added to check whether the CPU supports Zbb instructions.
> >
> > Link: https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/b=
itmanip-1.0.0-38-g865e7a7.pdf [0]
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >  arch/riscv/net/bpf_jit.h | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> > index e30501b46f8f..51f6d214086f 100644
> > --- a/arch/riscv/net/bpf_jit.h
> > +++ b/arch/riscv/net/bpf_jit.h
> > @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
> >  	return IS_ENABLED(CONFIG_RISCV_ISA_C);
> >  }
> >  =

> > +static inline bool rvzbb_enabled(void)
> > +{
> > +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely=
(RISCV_ISA_EXT_ZBB);
> =

> Hmm, I'm thinking about the IS_ENABLED(CONFIG_RISCV_ISA_ZBB) semantics
> for a kernel JIT compiler.
> =

> IS_ENABLED(CONFIG_RISCV_ISA_ZBB) affects the kernel compiler flags.
> Should it be enough to just have the run-time check? Should a kernel
> built w/o Zbb be able to emit Zbb from the JIT?
>

My two cents (which might be worth less than two cents due to my lack of
BPF knowledge) is yes, the JIT should be allowed to emit Zbb instructions
even when the kernel is not built with a compiler which has done so. In
fact, we have insn-def.h for situations similar to this.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
