Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80627C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 03:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT1UrcYXCkC3h9izRxjg0UH6EmDmmz3v12a/JUSkSjw=; b=RbshRdYmmYsSCn
	ivNfbf6vsXpS53+KOLdCzAqGuxIuXYNKp16YiUgla+5J1oFTFNzi2p2MK1bHHPisK7c4Ep9bxvYOT
	iWOgXCG9H9/mCpeWNrIxkm02ldsPLwP86UDCjnjlU0QF2pBE8vq9zhJUIgxBasDwfWySKuZ6XAVB3
	mHig+fHe4BCmikQR50Ys3MztwsCpC9nQ7jOgi+uOK1Q996UP9txUah9GSvCFkAWEblbJhXzcs5uZO
	VNWdolqX5gY1bW9zStZRdlgtcbsjw/D3VGuAfR2+m1jGpTl0XXUITrQQWT2ZN+O8lhz+Z885UHixu
	FtipU35m8uu7QeVPLOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrtQg-00AJuB-5v; Fri, 20 May 2022 03:35:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrtQd-00AJsW-D3
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 03:35:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id r30so9702750wra.13
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iz8E9Wqores9d4slLEwkkQTwfUp3b5sNzXx3GlKoN9k=;
 b=EoiX9X4PjQip6/zwk77Ut0DguWoasyzn5/OBwNAW3I9FzmI1K1Ji6NrthZRSi9y1Tm
 76OZlBbw67XKaNWnz3MkXHg9IuDWHrq06WXp4UJ7aQGXuwdDv3Oxv6VoG2zmW1Snox6n
 qPYxyq2Y/Rv8Fs9dfUoaai8/ElIphdTQbKTz8LW8E9Zf+gh+cgurelf2hG2tGzjoXPXN
 yZmc5nFgW0QX78GiATsewfOsEs5xzh/V29aprpfe1VfDDTe5EWoYNkioi11o5Wm/xkq3
 wEs2Ftd8pKjqo2QQZADKoltdFDtdnzoa7eQ+chCxu3RMCn7ENNwqZ/A8uYJcSj/I+/Jx
 mSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iz8E9Wqores9d4slLEwkkQTwfUp3b5sNzXx3GlKoN9k=;
 b=I1oTtStCS4OD8FyWIB17/izZLi9nxNPyu306HPeQI/X1l9tTb2jTKIvH+9ZLnv/Lev
 I9Bzk1LrBq82FScgAu2WAzrvEq4xaT83DTIpsj4AIyOX23XhU6+WkU+XDgVVtQ7eVFyT
 8mXG+IPeBKoHlmW8B4urD3p0j60ZklHRDWdQTMaltLli04jgvYxjHNSsM+pvtL/46sMQ
 fe3GFNYdn3sSemgs+LFC+vKEiPEhGxU++cqLN5jNjYUzCDoXIg3uhwPPrCslxcEAzu/H
 QCHX3ArJc13mUUMADM7bTH1VEwUXXHBufwgmDyeto+UYvqShMdz59IMkQobrmGDL7Zo5
 Clzw==
X-Gm-Message-State: AOAM531FEJOgnOty/OrplbhCFFGbsj0nVvKeAceR5A+lb4gUuMxwLXc9
 RYjgmsSlMlqRFc2AXAluPeg4kzzbph0grz2SVa5nUA==
X-Google-Smtp-Source: ABdhPJzhhw/Q0jnXkep8oUbRoAi2MJltN0zmw2yBi9f0WP+hU3Xv1uItHJl9OBgXBdOC/a5JfDnvxXRwcMjJAW/4cIk=
X-Received: by 2002:a5d:6489:0:b0:20e:549b:4414 with SMTP id
 o9-20020a5d6489000000b0020e549b4414mr6391740wri.86.1653017748963; Thu, 19 May
 2022 20:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220509060634.134068-1-anup@brainfault.org>
In-Reply-To: <20220509060634.134068-1-anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 May 2022 09:05:37 +0530
Message-ID: <CAAhSdy0MQ+Wq-r7Po-OOpVDdPP7xbucz+j4V-zrWGKCt76V9Ug@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update KVM RISC-V entry to cover selftests
 support
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_203551_670284_0782EFDF 
X-CRM114-Status: GOOD (  13.22  )
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

On Mon, May 9, 2022 at 11:37 AM Anup Patel <anup@brainfault.org> wrote:
>
> We update KVM RISC-V maintainers entry to include appropriate KVM
> selftests directories so that RISC-V related KVM selftests patches
> are CC'ed to KVM RISC-V mailing list.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>

Queued this patch for 5.19

Thanks,
Anup

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8c52d0192a6..ee73a71c1500 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10767,6 +10767,8 @@ T:      git git://github.com/kvm-riscv/linux.git
>  F:     arch/riscv/include/asm/kvm*
>  F:     arch/riscv/include/uapi/asm/kvm*
>  F:     arch/riscv/kvm/
> +F:     tools/testing/selftests/kvm/*/riscv/
> +F:     tools/testing/selftests/kvm/riscv/
>
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:     Christian Borntraeger <borntraeger@linux.ibm.com>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
