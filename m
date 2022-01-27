Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD2BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 23:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:CC:Mime-Version:Message-ID:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LaTTaia8BjhuDDvbUN6NzUSlJ6TYLpKHq/A+lrZdyAM=; b=K1WeF0uIssSZfd51EFExI/2HKr
	fvBOfB9LeLflCD1OsiVfqt2SjdFwscS13qOAZqEpJP2UhZX3RODZfs+YfX7Z6xNUwvXPS6EgMUbBm
	zh+H4xGAc9D0wTf6tSSvZAIvPcBUwc1k7d2KbYxbQjmquIx45yADl7WWPywCdpTAJ9hR2ZgERPMYB
	6kk3WjxUSukqI6mUGZQdbpjk9W/QbMn+NfkHfVo7AfcKpr5qzFjVpSNNkODxgdAboHJ/4PrfBgybV
	graeMGXPfN61Z0RQF40TTJaHimTyoYkX6s00CadSXvdc7rd+Qbh/7R3N+/LQ0pOB6WQMpJU4V3Ru+
	CNXQuUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDDkf-00HFjA-IK; Thu, 27 Jan 2022 23:00:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDDkd-00HFig-A3
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 23:00:24 +0000
Received: by mail-pf1-x42d.google.com with SMTP id i17so4323022pfq.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 15:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=tq+t6dQQFVkt1ehPK5dsRce++PeJ+NkaC2Fr9danrFg=;
 b=BuErwWWlO434CFRs160cmmmqeCVMq4U++BxGBAu6HZFmRUHzvqVMu04MGgHnuraFMr
 +33ZFKW7NH/vlk9bvSxkNRocThdzS/IRyMqFLFO9/tOscGu00GpVN7ZhTD0Dp1SUeBj4
 Qc6OjS2Eqw3oE5fbIKOGFCmwxjuYpzdOZ77cT+fMRNZHpwmOGruueSfZCC2pe6ppxq2S
 yMgzFP7Gag5dFOOGRWd2PWjFIyiet/vHjfULH+d+DdEHSLfndWouf399u229H5VpZ8xn
 uV4pWRwMgylNSDJPHf06RZsMeb+VTt+lHv7clQbT9zHBwYjOW2iMcHBnXrYdc/JKWp3D
 TF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=tq+t6dQQFVkt1ehPK5dsRce++PeJ+NkaC2Fr9danrFg=;
 b=DYCdxy2baSPmvpgjcTq0Bi22kyXtGqU41BAIcg3LjQSrSGtBA7wVpmRpqxU3TQ4vSu
 xuh0tTY0tu4raSAf2h8xbGkEvej/rVFNDIbVckBLeftswVWxzQtPVjlQzjYTNfjK0W/W
 3+pWVMUUOH2Q6DLLbTtbfBuAxKAzrKgSknEJ/nOKa5xobT3dFHbwqXVBCen4Nm56j1NH
 AInK9v2IFDz+zVjzHwwaXSES83sTjoTRhf9BVdbK7L/vPsAYKQWSvmzBJma2ThTmKPY9
 YT7FVumCw4dRqJXY/gXC1QaujsYtjKKkQnb5J9YHjjnJktA3ZsBE4lFxXkHj1tGdPeXk
 dcpQ==
X-Gm-Message-State: AOAM530FeTtWTJPmDA4jcA4gkKAfbxC/dhklqaqO3jjBSBCGe2pK92BC
 UXl5tAo9KvQ9suW5YzsfJ2mhtqbUJ2P7hA==
X-Google-Smtp-Source: ABdhPJxpcmPb3nGBT2wvGe/q2isQrAKpZg2RNFkHBXl7+vTN26uFcrQDHHCG5MC6e3PSipgfXYj0ig==
X-Received: by 2002:a05:6a00:10d2:: with SMTP id
 d18mr5119105pfu.2.1643324422178; 
 Thu, 27 Jan 2022 15:00:22 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id d18sm4610605pfu.127.2022.01.27.15.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 15:00:21 -0800 (PST)
Date: Thu, 27 Jan 2022 15:00:21 -0800 (PST)
X-Google-Original-Date: Thu, 27 Jan 2022 14:59:18 PST (-0800)
Subject: Re: [PATCH] RISC-V: Prevent sbi_ecall() from being inlined
In-Reply-To: <20220127195554.15705-1-palmer@rivosinc.com>
Message-ID: <mhng-a2eafdcc-50bf-4947-a52c-e7c89a0f6c86@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org,
 Atish Patra <atishp@rivosinc.com>, jszhang@kernel.org, 
 vincent.chen@sifive.com, sunnanyong@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 stable@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_150023_439174_4DEC50C5 
X-CRM114-Status: GOOD (  26.89  )
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

On Thu, 27 Jan 2022 11:55:55 PST (-0800), Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The SBI spec defines SBI calls as following the standard calling
> convention, but we don't actually inform GCC of that when making an

As per some discussion on the SBI spec, this definition isn't internally 
consistent.  I've got some WIP to make proper inline SBI macros -- 
that'll be necessary either way the spec goes (ie, to get rid of all the 
zeros), but I'm going to leave this alone until the spec gets sorted 
out.

> ecall.  Unfortunately this does actually manifest for the more complex
> SBI call wrappers, for example sbi_s, for example sbi_send_ipi_v02()
> uses t1.
>
> This patch just marks sbi_ecall() as noinline, which implicitly enforces
> the standard calling convention.
>
> Fixes : b9dcd9e41587 ("RISC-V: Add basic support for SBI v0.2")
> Cc: stable@vger.kernel.org
> Reported-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This is more of a stop-gap fix than anything else, but it's small enough
> that it should be straight-forward to back port to stable.  This bug has
> existed forever, in theory, but none of this was specified in SBI-0.1
> so the backport to the introduction of 0.2 should be sufficient.
> No extant versions OpenSBI or BBL will manifest issues here, as they
> save all registers, but the spec is quite explicit so we're better off
> getting back in line sooner rather than later.
>
> There'll be some marginal performance impact here.  I'll send a
> follow-on to clean up the SBI call wrappers in a way that allows
> inlining without violating the spec, but that'll be a bigger change and
> thus isn't really suitable for stable.
> ---
>  arch/riscv/kernel/sbi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f72527fcb347..7be586f5dc69 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -21,6 +21,11 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
>  			   unsigned long start, unsigned long size,
>  			   unsigned long arg4, unsigned long arg5) __ro_after_init;
>
> +/*
> + * This ecall stub can't be inlined because we're relying on the presence of a
> + * function call to enforce the calling convention.
> + */
> +noinline
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
