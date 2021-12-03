Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686CDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsyY2cWyyuUIxed9USueHtQFQtmEkzsex+cf4BOVs+I=; b=hdrR8Rk1MrZ6QJ
	tSKB+ks9TPyM+NRi0QwOfDIBrPzvrGE6wj5oM9p6ZIP3nmcNTbSZL0XwcL9AImtrnYFNLRB/FJT+S
	l3qOHbJbveUYHgci751FvWK/MlniizHzcO2YGNgpudnCtiBeSRfq8Ux0Vc33FqtFKx7M+5FkRrm+e
	qLWNiFoJ8ZGArat51QVPxTxwQHBvCEQZBvBpiZEw4hVfbREf6L+ehtqJCnn9/b6vluwfVee2laK1e
	aZ7FjL6oq95WdCMI5ROBBf8AgwAuP0+UKq1M173z12WxaSSqo9265DL9o268DpVZra8nGuN5l5Iim
	IyEuVOLRoIUsXf353LXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8XK-00FvO6-FU; Fri, 03 Dec 2021 13:23:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8XG-00FvL5-Gc
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 13:23:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso4848654wms.3
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 05:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lR8aeSNSNLSRJzVlwsyGcPcDwOiHsBURE+5SKLZfSus=;
 b=6qJDAtvDHsWsCS6gT+mxqgayP1XkZWPCGcSc4oQn7JcEH/9ttXWpQWHWlGuwMdmi4E
 43pIhjFbvu2fWtth1sComt1QTHASYfHZure9BVnwM7ACgwj7iayHGCV+j02eTu7KvdfC
 AuvuUOv0SFRCk6iel2jqGqVnzfqXPX3B2ZIEUWfxa63Grif5TDwUc2/xXikZIac46mrW
 kFWGsT/yphAFQ6N2hcl2Pq0TlQR4eCO3tFdK6xWhCid6Ge1Uo+GkE8+4saVIeRgFtwHP
 uIFNu7s4yhODqkB/SCWW/N/osvsqSgf3pJdw3mgG9gyUomdu0EtJf8TzRK8yBq/TChxX
 Q2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lR8aeSNSNLSRJzVlwsyGcPcDwOiHsBURE+5SKLZfSus=;
 b=LdAcu25RPKIRI3saWR4vTm4UT5svvd1nPoTeiimBqzNjSiCOPXs9pPp0f9vq/MtOVO
 n7qEcQ0K03LR2KzOgK+K3u6WSXitynvlD7YOC6q7ekxcTab472eQvg1sM/Zsp8boRDPH
 X5V3ozvEGHVGophpZ63sS1JaoVi8XW539ZLuCJh0TiiXHRjiDiUoIOnieUP40WtxPdoD
 LzH6RGxoM2x740sxiuJpaNLN75wdaDrPj5UiKZbLZNiJz8gmnhiIbND1mDOYzsm2NSiV
 zaY+zV+xrkNOJ2vmhA0QoSv5qRGT98M9SrH8Mpz3gNCA4I4gRjNtQ11RnGnNTQRaYAK1
 nNVA==
X-Gm-Message-State: AOAM531C3d4Eb+1IBJ6EeD4slyz9+ATfmf2Eg9ri/4IXBnYqQzAW9VFp
 5AtabjE6pzAMumYpgwmuUpnGe/tt0+/4Lr65w8uh7Q==
X-Google-Smtp-Source: ABdhPJzAviTqyJhhuy+8EWcURnRhUhc+e5w/j54dpEC5njH38p4a8pfE/ForU6RfTu/bxPY67H+3bjNgiRiD4nbdK9M=
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr15086969wmq.59.1638537812348; 
 Fri, 03 Dec 2021 05:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20211128160741.2122-1-jszhang@kernel.org>
 <20211128160741.2122-4-jszhang@kernel.org>
In-Reply-To: <20211128160741.2122-4-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 18:53:20 +0530
Message-ID: <CAAhSdy1ChQ6A0_zkOFFCO1dJypaK3-9RndRNLn-sNK1hNJKQEQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: kvm: make kvm_riscv_vcpu_fp_clean() static
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_052334_585707_BBFFD029 
X-CRM114-Status: GOOD (  14.16  )
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

On Sun, Nov 28, 2021 at 9:45 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> There are no users outside vcpu_fp.c so make kvm_riscv_vcpu_fp_clean()
> static.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

I have queued this patch for 5.17

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_fp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
> index 1b070152578f..4449a976e5a6 100644
> --- a/arch/riscv/kvm/vcpu_fp.c
> +++ b/arch/riscv/kvm/vcpu_fp.c
> @@ -26,7 +26,7 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
>                 cntx->sstatus |= SR_FS_OFF;
>  }
>
> -void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
> +static void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
>  {
>         cntx->sstatus &= ~SR_FS;
>         cntx->sstatus |= SR_FS_CLEAN;
> --
> 2.34.0
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
