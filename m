Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C378C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 03:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMMsbc58U9hQFE7dnduVS7jgEHJb6C1j5UTMb5j5Vpo=; b=XTjsnCfXIiyCVU
	YrL/4ZuKLQ0wRRSRWViu+OlKd8pzfDSKjn8BVxLkHF7y3sneGgHVOETxMJ1L85cUS0ZKS0K40iJXX
	QJd2o1Obr2YCMnhtGzEehSQVFbWr1NYEf6kiqyL6dJSGiqRFbaMbwBMceEPGWyAztPSP0PZMhVP8q
	VSVXexUWpdyrCCgt9IZqe/5ltXlEq6axJd0SBXLTkrtAd1zs90dHfzVmL0KbYUUaZFEZd2KsVWzfC
	G7P+b2jFd9PupsAYgGyI3na0JTWnuaj+IYf5varOJkE6r/u+Rsu7Bmr+4mXWbPDRhMLcHaaI1EAa6
	qBEay4ngXFy/ENYl/12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLFlq-00DDBS-Gg; Fri, 27 Jan 2023 03:51:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLFln-00DDAR-B0
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 03:51:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id bk15so10379457ejb.9
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhXH+LjnQJy+TeeqGL7rkW4DgM2MxsYFE7DG5vchcB4=;
        b=B+rvX7pOPdV39M9bsZ5xmu8dal+4X8Dr2wK27ARpXKBZ9kCTugreLcVmkwC14GBYIK
         K7Hl+gvoQConiXD4xzaPTWkQQ4q4RqDvOyff4kLX6KliTYCaHFe3MpL7b4IrxD9+i65o
         WGTVg9zfptYSXi+4pboUALk01gTvBU5PTLBsU3GEy8W7VPH/Sp8uDPTscQXdFz9tNxWu
         n5/C8eS5NCw9fTouHYJB7BybpsVGHipyytc0KhI0MxHlJCFcpjX8BM2RA/NKob8pYscl
         gTnn5yBNrWnIkfH7VoYdmOyOSy3xiiCSL3Pu20GqzTaAVyTDcs4yrcSpqaQxvqsT/ZuS
         p93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhXH+LjnQJy+TeeqGL7rkW4DgM2MxsYFE7DG5vchcB4=;
        b=npFReMzp6IcJOdGuv75UxDdRbtHrXFzO7d8CN0zmWAX0CphrctECs1MNQ95YM0EhM9
         sYkap4CoKOzYb/M8EfQXrsFZD93CrscJGTwUGn+pIs0raMoSiKGvs8kGPoNL2u5wSon9
         l0pdOSqSXAVhdvaAT8VpgsdKCwOvbFthqDvB0SLLBHwiycx4OFJu+QjVtIJKfBWwFL4N
         oo8BumrzTQfVozeUXyzGA7mR9HmBQVIHftsoiiv7jhn6eF4GzI5I5bfEwyrpQR73PqhK
         UYu77RBTP+82EQ2wA8r9vqVqfoMb4i0kV9aThQiY4DHH3axoYSgKu8RVxqEpplc2o0T3
         g6Nw==
X-Gm-Message-State: AFqh2ko1Xhn/T6rzJXi9Y5QX06IybqbYXtdTsEzIuPC74cyvGQhdJllg
	QLL1fZ1N4L8YJFzCrbzt/zVc3ugxC8fmYDgVwOfvjw==
X-Google-Smtp-Source: AMrXdXum5zSZENCqc9aXWct0JbjZ6VxCYt8cvgWug1VNIFkR20MtvAjaz8ZeEdwf9D5wKNWAd8lJDuBRkh/bbbmtkEw=
X-Received: by 2002:a17:906:3799:b0:781:541:8f1d with SMTP id
 n25-20020a170906379900b0078105418f1dmr4914571ejc.117.1674791475248; Thu, 26
 Jan 2023 19:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20230115154953.831-1-jszhang@kernel.org> <20230115154953.831-13-jszhang@kernel.org>
In-Reply-To: <20230115154953.831-13-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Jan 2023 09:21:03 +0530
Message-ID: <CAAhSdy3DmSt1-i5AoeOt0e9snD+P8XpazAUTr0LoNfFCuA3+pw@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_195119_426462_99769A8D 
X-CRM114-Status: GOOD (  12.50  )
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

On Sun, Jan 15, 2023 at 9:30 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> From: Andrew Jones <ajones@ventanamicro.com>
>
> Switch has_svinval() from static branch to the new helper
> riscv_has_extension_unlikely().
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

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
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
