Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E93EE208F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjmluh25u/EM+M2lpBCx7oh2O82eK5DRsGJ0gTkj5JY=; b=bLMRv+Sv+/I+6s
	faLbQdfxVQfudUCIZCFq4HY+E0qtVFXYRoCS5s6RS76I6JpMJiEwYuUO2O40b2w3j8kmYzwCdzfN4
	PXFCIebrIbR/A+OJ6r+hMWSxeT/1Hy6wMcGb5bBcG32Pej17KjE48iv198CsDgVIrMmGLwNenpNKv
	u5huHwLINN80cJSVlqj61VOz6irdpqr3GTI1Iz6vxls3vuQDW+10UUeAoHgWo9vTWJIXnrjwp2mJ4
	K5F2Kbqq50q76WEfndUVAgggPmI+k4U5mcH8+n6op0nHmlDOq5Vpw2Aekt4tbxTUIOIhxVYxyxDT+
	CfByyWFivYtthX1vSYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJvN-0000000BEqr-37Jp;
	Fri, 06 Feb 2026 11:22:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJvL-0000000BEqb-3Ek6
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Feb 2026 11:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZOGJGKrpqPlBb/+T0CmxW+QUXWrV/vAFFiurN1Z9B+I=; b=YqhxtX7p1rDAO9+hrPPS50GAtS
	V0I7tXmB8uTwlzndn4YeWSMmK8c8Z8MmEWgbF1SAxzQCjLW2EZxBDp+2qY9GxNnIuZDgcsU8argWN
	m8eseIDdEaluU5prB7LabSxH6JsyAbgbodt9npzXlZbWx31sFJvwBuU8jFTCRCGfgNpf3zMwCUObR
	Oggrr1GPVFg1B0tu3zkzHnCGRwo27sxN+Ym8QTcGDIHToPHxCrPyeKACyKKnqLGSiVWR0NHQLZIEY
	k8PV/zG0aNohaCgMLpShPkfVNVVwPDJ1UBZ7wv5QokCMrLvaGTIJtbyiYdWHOYtAC3D6L7o0oyMH4
	iXkqY0TQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJvH-00000003iJz-2yaA
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 11:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90680444C0
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 11:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3AAC2BCB9
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770376967;
	bh=jy4Q3CUvktfn8+VAW0w3P8Xq8m5PLzowEM5TQE8oNLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gOR2D8gah7tPFdqCVM2lLqGUwLBe8mb7P8jpg62WJF//xgVMkTMami+8Edpb87qDs
	 nTuxoklE19h1cmxJrMQHi9MoO8JbKb9C+GVrviLxq2rP1NOVMNMfO7tT2atKZRRl0Z
	 pzgYBWsizLwZHoFBNSukOJd0Ak9nxse3AlRbvrKLprmOERcSbqtILCZ+++ck5oSoX6
	 SF49Ie2nnauhUH+VvSs/nu2SpNISBTMa2K6g67Vw12dgmBSZaf0GW43n8FC8OtUSHJ
	 Z9p+VBfIz01Hcpu/NLxhaywVIow+XKqNNKixvp7RzH3ozoLs4CBbJqX992QUjZEZON
	 5oLy+igf6Ptvg==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c9eedc2363so197511485a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 03:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqje0+d4Qpjah5Vc2twAt8w0ogn3eL0tvAOu72XdLACQ3piDmXKDbR+c7nM0tqUaGkihtEy7tyUbcrlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVxNQjWKKGgqWvKILFIlnBQMgRivjuKOvZnhK9TL4TqUJfzoVR
	0aD1rTfJ4CAuQ3ftL4fyCeBHvO5/AWUJnWRT/7dJFmutOx9kACNbvZ9dvqZV09+kLHqITRjyF1q
	evMLCbQ2JMmEU28sOEBU1tOOQTDK3oXA=
X-Received: by 2002:a05:620a:1926:b0:8ca:2baa:76e with SMTP id
 af79cd13be357-8caef9df080mr272076585a.19.1770376966398; Fri, 06 Feb 2026
 03:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn> <20260203055231.1088479-3-dongml2@chinatelecom.cn>
In-Reply-To: <20260203055231.1088479-3-dongml2@chinatelecom.cn>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Fri, 6 Feb 2026 12:22:35 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNizNFc0j_eUNFR3_kO8diQzbjce8oLzBEOK2sWnG=rGhg@mail.gmail.com>
X-Gm-Features: AZwV_Qi-cIeIbB3tOT4yAHDZ8Q5KmenkkMoVK9VhYOy6pdcKzr_V1uBLBKbKtek
Message-ID: <CAJ+HfNizNFc0j_eUNFR3_kO8diQzbjce8oLzBEOK2sWnG=rGhg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, riscv: add fsession support for trampolines
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com, 
	puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev, 
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_112252_627923_42EABC37 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On Tue, 3 Feb 2026 at 06:53, Menglong Dong <menglong8.dong@gmail.com> wrote:

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index e4f45e2e7e2f..f10418ff6a9b 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c

> @@ -1042,10 +1067,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>          *                  [ ...               ]
>          * FP - args_off    [ arg1              ]
>          *
> -        * FP - nregs_off   [ regs count        ]
> +        * FP - func_meta_off [ regs count, etc ]  always

Nit: Please remove the "always" comment. It's not helpful.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
