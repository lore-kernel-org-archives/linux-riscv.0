Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B92C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 00:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcol5XGA4zfu24eiJwoHSQFzapySWYR9kD85VsxBiUY=; b=UmDktHzd4py74S
	b5OV7jTnkoyG8+s4kvTcj7j2zXV8RoRmOxEGS+iBn+iL3C0P1GHs3FGRqX1kWgPaHQSx8dOKov/xs
	lS9vu+y6lFd7oeuHhwHJIMqtylIygZ7D+Pcr7QwvzC25sucKtDG9BzBAgQcXKldKmhDkYnFaQ9/8r
	SvV8lCXRteini8cbCbxPu2TlHhSG2gp8dqhZT6bmmNal2ikY8G2Hk274Qoche9vc5RznpuCdeGNTD
	U31YzQ0cZaTCyfKeoiiWdbSCSGvj9eW55uH3rG6axaiiAHDzSZSK29B9y5ftXWLUV+a67Ybxnc4IZ
	MUywnlkANUXj1/7uHj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1zj3-00C6jb-Qh; Mon, 05 Dec 2022 00:52:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1zj1-00C6iB-2v; Mon, 05 Dec 2022 00:52:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 968DDB808BF;
	Mon,  5 Dec 2022 00:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D822C433B5;
	Mon,  5 Dec 2022 00:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670201568;
	bh=jib82Q01YLW3qx/1zSi+9r7M6nVqOE5J7EtK6lVWsFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c4OG6YkZrqiaTLIU3ys/J39EJHbE0hDlBhlf+ojGPQYhfQh0CYGbbMnVKCG5tJF2l
	 W3T7Je3F86HVLFO/ukr9uJ4fBrxq7dl+BfPjdQdzPltQ4BuUHyuBAhaddRA+GYu8Ow
	 m8zOfWR0d6CP3dXSDZxmcMCpWTfmya6+lsRPiX3cHEERrT1AwrdhYAj2ICX3XBncRb
	 h8PK95kI+/xvvUw/96dBh1ytcCsrlXCsk7x3k8UDjq3xEywThzN5vOT7RhIg/2JYNx
	 Pblx1hVINMQSVbiNNbcOo5BZHmjm3d/blXgf50K6+p6nvGZVe8C/nETLnKKrYyjUoX
	 lPdOwhP515c6A==
Received: by mail-ed1-f49.google.com with SMTP id m19so13681118edj.8;
        Sun, 04 Dec 2022 16:52:48 -0800 (PST)
X-Gm-Message-State: ANoB5pkgxyZ3mxCBOSwYiItnPe4uMdbNtUpihKLXkYGahfbSTkE9bp8G
	FcbMKJfyxK4JrjWsejb0JOKVu4jHtX3yxAH88k8=
X-Google-Smtp-Source: AA0mqf5VP9XfCfgCkhATJpcc8UvnyeJpKoB1by9S6CKiv7vkMNqEOi5vgUQwxDp/IlwIZ8hrm8OQHac5gGxCl45oatQ=
X-Received: by 2002:a05:6402:538a:b0:458:fbd9:e3b1 with SMTP id
 ew10-20020a056402538a00b00458fbd9e3b1mr15849493edb.6.1670201566654; Sun, 04
 Dec 2022 16:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-13-jszhang@kernel.org>
In-Reply-To: <20221204174632.3677-13-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Dec 2022 08:52:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRRjnnQLvCtvmwf0rGJgoc08s3JGq4PSe4sYfrq2bsqDA@mail.gmail.com>
Message-ID: <CAJF2gTRRjnnQLvCtvmwf0rGJgoc08s3JGq4PSe4sYfrq2bsqDA@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_165251_286514_89F392FE 
X-CRM114-Status: GOOD (  14.30  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> From: Andrew Jones <ajones@ventanamicro.com>
>
> Switch has_svinval() from static branch to the new helper
> riscv_has_extension_unlikely().
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/tlb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 309d79b3e5cd..aa3da18ad873 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -15,8 +15,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/insn-def.h>
>
> -#define has_svinval()  \
> -       static_branch_unlikely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVINVAL])
> +#define has_svinval()  riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>
>  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
>                                           gpa_t gpa, gpa_t gpsz,
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
