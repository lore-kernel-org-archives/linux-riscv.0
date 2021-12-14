Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A22C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=16Mj4ecFszMraEG/Iuf26U7ovT85xSVthxyEhFoPm74=; b=kTq8rrAcHydlxE5j0gEH7Fvlhl
	WwFXghL69SkMf9HdOeHRZXssDLY4p0GE+hJXB4yjntHp/o/gMd1t5Lj4+hAUqnKbeR6DZ8vMReziA
	atKRVIIxqMCVF4ybuqtyZefeSMfYTC1M8nP3CjJ2H6uf7rIHOxMzhmmiEu9OKoUL0Lr3RL8u29zcp
	ZW3oD5Ztw08RsZXDx0cbaUaKU+xhpDn4aDQXRIRMrS+p0C74RUCdmI7KgwG81uMS1jd7yiMPC/nAw
	VS55YGPDkpA7rjYlzNo//81Ea7hZ705OH8zX7C7lJ5CAn6H+G+uDMHaRjSJZeymGj6a98vgi8SAQt
	wxCBiN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAgt-00Ess1-3U; Tue, 14 Dec 2021 16:30:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgG-00EsPA-9e
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 n15-20020a17090a394f00b001b0f6d6468eso1116568pjf.3
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UtzwvPGJGsxSlX5yHONhsOG3Z07A2+rV1SqqO3BO/EM=;
 b=NQSXVVpuoBWD7LQqRbZceG6VsWT9sGdtZlkIK0WEDUWkm79louNmrWzV1akuEiO9C6
 DYmhBGdiTdKCEMizjZ4l02g6uJJ6J7N+pCUb86uV039Trb6DxUEjtXgZQ/GaXYoILF/H
 WyuFcp2Pj1yecgyjU/ZdHEzsFKNB2rvJYLeD4JL2/E/u2oftX3xhqp75L2M48qe43Rvw
 PLY8ZuKFiISF8J1Z29ThfWkgHc56zgQnO16XgRd3FsQIyzK3dRDNbCtkFwfNUf5J4c+a
 IAW3735BLWBnqwmCcwS0TBXv665M2Bk/XMl7wGsoWMWhU1k17wWIog3EL+ezo7irH9an
 kEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UtzwvPGJGsxSlX5yHONhsOG3Z07A2+rV1SqqO3BO/EM=;
 b=PjQd8AW81ATDMy+gi6/9FiDuHikAAWL7aCtCbnx6Pz4N3YZg2C1TAgaAtCItgD6spR
 goLMSct4j/ecs0OtZfNYHx8T4VgUtf/hMgMnNbHb+i25R17TngeL72eDEuMxgRavea9Y
 n3hbOS346qS24V1bE4VvM0Kd3x5KKgHWoC0eCNwa3yan0Vy0uYR10Tw1QMaT+Be20vbT
 TTv/sJo6QzuDzcyCBZApfMt/rGyKT2f2yefPuNv/JB7UTJnrTl0gEEYbzAL+xgnxFkGA
 Ci2mr2Qz+P9KL0F0gvC4uGVbll0HQ/aj2Np0grM1Zo2OwhS+kEOhPV5TFelGPWNT834n
 ohrg==
X-Gm-Message-State: AOAM530LbXaxwhFLaxSc5UqZlR1YeK6itK6kp5HumFOIvDigGb3khKpM
 OJU6zgYkRBXVK2R4HeHexrvrQg==
X-Google-Smtp-Source: ABdhPJzZfZK8Q8jExHWiMImmlWW+dHRzTFrYTgGnuAbNJwuBTr9CHS5VVcJ0wUjgObTaDPXiKaCBhg==
X-Received: by 2002:a17:90a:5d98:: with SMTP id
 t24mr1068496pji.109.1639499370924; 
 Tue, 14 Dec 2021 08:29:30 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id lb4sm3200381pjb.18.2021.12.14.08.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:30 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:30 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 19:41:25 PST (-0800)
Subject: Re: [PATCH v9 08/17] riscv: Add vector struct and assembler
 definitions
In-Reply-To: <15d09938180ee45bc5481c4a2d41ad656ca23c82.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-a7a94a37-5791-4c76-8f2d-072130d71819@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082932_402014_F685728B 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, 09 Nov 2021 01:48:20 PST (-0800), greentime.hu@sifive.com wrote:
> Add vector state context struct in struct thread and asm-offsets.c
> definitions.
>
> The vector registers will be saved in datap pointer of __riscv_v_state. It
> will be dynamically allocated in kernel space. It will be put right after
> the __riscv_v_state data structure in user space.
>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/processor.h   |  1 +
>  arch/riscv/include/uapi/asm/ptrace.h | 11 +++++++++++
>  arch/riscv/kernel/asm-offsets.c      |  6 ++++++
>  3 files changed, 18 insertions(+)
>
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 46b492c78cbb..a268f1382e52 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -35,6 +35,7 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> +	struct __riscv_v_state vstate;
>  };
>
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index 882547f6bd5c..bd3b8a710246 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -77,6 +77,17 @@ union __riscv_fp_state {
>  	struct __riscv_q_ext_state q;
>  };
>
> +struct __riscv_v_state {
> +	unsigned long vstart;
> +	unsigned long vl;
> +	unsigned long vtype;
> +	unsigned long vcsr;

Don't we also need vlen to adequately determine the vector state?  
Otherwise we're going to end up dropping some state when vl isn't vlmax, 
which IIUC isn't legal.

> +	void *datap;
> +#if __riscv_xlen == 32
> +	__u32 __padding;
> +#endif

Why is there padding?

> +};
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 90f8ce64fa6f..34f43c84723a 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -72,6 +72,12 @@ void asm_offsets(void)
>  	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
>  #endif
>
> +	OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
> +	OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
> +	OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
> +	OFFSET(RISCV_V_STATE_VCSR, __riscv_v_state, vcsr);
> +	OFFSET(RISCV_V_STATE_DATAP, __riscv_v_state, datap);
> +
>  	DEFINE(PT_SIZE, sizeof(struct pt_regs));
>  	OFFSET(PT_EPC, pt_regs, epc);
>  	OFFSET(PT_RA, pt_regs, ra);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
