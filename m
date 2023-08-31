Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE6C83F32
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFwQE6YKZ29G5GHK6DsFNndsfPTLWnhu/RcKmzDljSk=; b=xtc9WTUP49DdKh
	s5j8vhg4tgisYPJssYnyozRnxFJa0IbFXXxTuFsj/3pDYnIHDFtrg/er90KLrUn0UqtE2jpasxEhA
	LrNlARZYt17f82AkXMsATgG0XatOQ6ppV8lgor/rPbMHhxczsuqmcGQKRMXB8Booyf2azbWIEJI8s
	coIlr1PTwppheanujz7ypkAKKJZqkP6ewfSMbXLiTJkXT4Ahq+1FBlgv6PXvT7HBFtNFn92xyXurB
	4Zd430og8JVgPWyyxvRSleyAhpqGFJJ3VF2YHZeNPKYklORE9udFRlylcAORs3uxQbIf0a/uI5WD1
	5ANaP3kHcC4Db9zSuTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbl6e-00Fc6a-15;
	Thu, 31 Aug 2023 17:05:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbl6b-00Fc5e-0n
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:05:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso7495895ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693501510; x=1694106310; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Pfgsvrc0Cq27hkjNFeSrt/ZRRwqRHUfzicJWZVHKsE=;
        b=WmNphYc4aJwoDtYFO2uQSaikxu74pCeS8R44y0rXV2oSi/PzxyKGdUH4ryYr9ErtXZ
         Yat4gB9YhXDKWlMcVf+ba2kTlDvs0fx5cAIMuRMXjaOEu76V0ioTUYmnXkE6m6F9FNWG
         A3obigm/XJj57owdEyIlBCbhU9H5zK4RchefsMUvlijRuU/FwT1cYbDoj2rn/w0UewQ6
         pfje5AJA6L9dpj86kKpil3mVAiVf3t9xngrvjyxn2gXUA48HTqd5x+h0/t8JyfSHNeiL
         Dj1NzU4I2PcXZyZ3ZJ4nJWzCmjVhB5rTjgFWYOWWwtqFgCvy/rI83KHYXb1Ao+plDxsQ
         RliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693501510; x=1694106310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pfgsvrc0Cq27hkjNFeSrt/ZRRwqRHUfzicJWZVHKsE=;
        b=WHDvSQYwvN4kDlsdQSv/cgqWsbKF5ARC5s5i4BkAwgyCbN5Nrs6mWfLtWmdFiuZ1/Z
         apGSnYIlSYF2jSvNo5CP7rb6oMu+m1W2EakhEfQC+Oehwy5lrN+ECf5xWmWXet4wr8Oj
         rEvO83Q48WEr3jE9qH4TSHs5jkQIiEwf8EpjobJ9NIfZh4BT38ygwwMqtlQaudQX792c
         /+LofDCDI+Ur4RbIbpryBHF4aXTkLdw9VuMKIHbBYhbR+cS1B4wfOW6+sdlaa0PLwuSy
         rvDUyiU7ZTb6fZyuoVAkj0BvRlNiDLuJeiTYfSyJxe5zyedLJ1Vd5m/FMnCsjcYVjfIV
         TCBw==
X-Gm-Message-State: AOJu0Yz8JA2aiuWH9nzKfcflyc4HQ6jqckJFTYShGHuK8xozDhv/4nQM
	fFYNcpkPHxij0NcqRODWmP5JQuskpDNR+cwYhS8ZXg==
X-Google-Smtp-Source: AGHT+IEZpQJrLUAw1zvueub9KSo50xfn8glzjY4X7tAZK7QAtkNzy8u/SGkRxjDte9gslzgHknYZ+Q==
X-Received: by 2002:a17:903:1cf:b0:1b9:e8a5:3699 with SMTP id e15-20020a17090301cf00b001b9e8a53699mr288895plh.21.1693501509951;
        Thu, 31 Aug 2023 10:05:09 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:892a:3b04:5286:6211])
        by smtp.gmail.com with ESMTPSA id jo6-20020a170903054600b001c1f0b3e900sm1477603plb.229.2023.08.31.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 10:05:09 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:05:04 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>,
	llvm@lists.linux.dev, nathan@kernel.org, regressions@leemhuis.info
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Message-ID: <ZPDIQEVaEJHXR5IW@google.com>
References: <20230825050248.32681-1-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825050248.32681-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_100517_290353_60158AD5 
X-CRM114-Status: GOOD (  23.46  )
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

On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
> This patch add back the ptrace support with the following fix:
>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
>    conflicting with gdb's NT_RISCV_CSR.
>  - Use struct __riscv_v_regset_state to handle ptrace requests
> 
> Since gdb does not directly include the note description header in
> Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
> conflicts.
> 
> Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Hi Andy, this is causing an instance of -Wunused-variable. PTAL.

Please use the following tags on the fix:

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/

Let's see if I can get the regzbot tag correct; first time trying it.

#regzbot introduced dbe46b094026

> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 487303e3ef22..9a87e5d490b5 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -81,6 +84,71 @@ static int riscv_fpr_set(struct task_struct *target,
>  }
>  #endif
>  
> +#ifdef CONFIG_RISCV_ISA_V
> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +	struct __riscv_v_regset_state ptrace_vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/*
> +	 * Ensure the vector registers have been saved to the memory before
> +	 * copying them to membuf.
> +	 */
> +	if (target == current)
> +		riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	ptrace_vstate.vstart = vstate->vstart;
> +	ptrace_vstate.vl = vstate->vl;
> +	ptrace_vstate.vtype = vstate->vtype;
> +	ptrace_vstate.vcsr = vstate->vcsr;
> +	ptrace_vstate.vlenb = vstate->vlenb;
> +
> +	/* Copy vector header from vstate. */
> +	membuf_write(&to, &ptrace_vstate, sizeof(struct __riscv_v_regset_state));
> +
> +	/* Copy all the vector registers from vstate. */
> +	return membuf_write(&to, vstate->datap, riscv_v_vsize);
> +}
> +
> +static int riscv_vr_set(struct task_struct *target,
> +			const struct user_regset *regset,
> +			unsigned int pos, unsigned int count,
> +			const void *kbuf, const void __user *ubuf)
> +{
> +	int ret, size;

^ arch/riscv/kernel/ptrace.c:123:11: warning: unused variable 'size' [-Wunused-variable]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
