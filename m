Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0E2E743C9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 22:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWaTddBV73VquCdS2kJZ1NeLxxi2Gozi6T8BqoSRPlY=; b=rcoBGV5nM5Fn4F
	xfmcdit0GhDcihp16UVAU+I2QThW8gOXSv39cGNEsZXpAjnlSSDMRxhvflGz3eMTrKtywEaIkwD3x
	vYC8zoyqMNyGjt+dKnmuepUDh3h062/fL4bd9SVj4So+YSZ/VK1rKkwrpGnSt0mZ1nFgMet/10+u/
	ic1K0l/JeYLtdwn4KoIXK/tWovTMpRvPevJGjre0ofFOO5TvWaRhGXB0W0IRQSh/1Z5EKV6HfapWL
	Nf4c/ZsxVbdJv09sbx5vv0wX72FeXoJ/+l7qPndxG7UWtQ9BztBdWsdxSkEzxxYYPDXx+YJudXKi5
	kPzDy03LH1+L9Ake+SUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlzOX-006mIP-0H;
	Thu, 28 Sep 2023 22:22:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlzO9-006m4x-0v
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 22:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695939700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT9am+jLmHorOzbZRxZ3QKMwJmosafd47BiiQuOc1Lw=;
	b=QA+HHJyeaunrjw/djzFpf17HR9Zm7duzNgs1aiynKGmeM5MoIh8hkWlfYwaSnIQNPreaKl
	ZTxMhRt57/kVrEQvpfaO7uAC89Qmt73mdplGrLJQhvUSzWvNtKshygRjRM6EvWnmPLiZJL
	ZwstCLX/GVTwzcrwjWawuf/l3w8XP+I=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-eb6m09xhMe6qlxBxkQAFTQ-1; Thu, 28 Sep 2023 18:21:37 -0400
X-MC-Unique: eb6m09xhMe6qlxBxkQAFTQ-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7a25e4045c2so83766739f.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 15:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939696; x=1696544496;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rT9am+jLmHorOzbZRxZ3QKMwJmosafd47BiiQuOc1Lw=;
        b=lt2vZ7K0nxZI70yFrpF6FUKEPkQWYkBjjJN+9g1j8PaKvI3EUjnKdRh1PilU4DhCpo
         7vMSx0rHxo0rPbN7dU18J3bLXdUJ6q79dwKoBlK+X+PeGwLOEofJ1YvqHf4Jki9/b9vc
         QvKUEO+AtGJ51fiAJQhhbqFsob24l2zy78UFKg6KJ7jUFtyY5wdOuHBLI3ZQy5t2hFxQ
         JgylbHB4BUDk3uvrvCn59XXFBfKfObN2eq6ounihdePT/VoTwQ21QzqpHaFtDqoyj1BY
         on01OVXhxx0LDrGbafcIzWLIpA9kqzndoRwPw4BDip6f4jQufYJuR6fMBUCTOqmoJeNx
         CB7g==
X-Gm-Message-State: AOJu0YzZgapeRedfsYIX5DTSuON+xjhvKITQl0T/DNRrwAn4xAjfc7xu
	inj3b8HtW+bSA3q1Ejv35sBZ/UruG/kqh/1oIZ+mwnO0kP6qtYKgtHU2gXaD/ask3Ety5zyRPLj
	gbmA0IRtoaA0h8bRbg5IxtpustfP+
X-Received: by 2002:a6b:a12:0:b0:792:792e:6619 with SMTP id z18-20020a6b0a12000000b00792792e6619mr2822977ioi.2.1695939696193;
        Thu, 28 Sep 2023 15:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvHyy/Hemz69W4ceT0BNd5Cdmv5i7C45WBCarFFElXolFsYoe8vV4yGo1CGx8WsH3XpWDdNw==
X-Received: by 2002:a6b:a12:0:b0:792:792e:6619 with SMTP id z18-20020a6b0a12000000b00792792e6619mr2822961ioi.2.1695939695939;
        Thu, 28 Sep 2023 15:21:35 -0700 (PDT)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id t23-20020a02c497000000b0042b10d42c90sm4610172jam.113.2023.09.28.15.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:21:34 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:21:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Halil
 Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Harald
 Freudenberger <freude@linux.ibm.com>, Andy Lutomirski <luto@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Anish
 Ghulati <aghulati@google.com>, Venkatesh Srinivas
 <venkateshs@chromium.org>, Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of
 CONFIG_HAVE_KVM
Message-ID: <20230928162103.433f03db.alex.williamson@redhat.com>
In-Reply-To: <20230916003118.2540661-2-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-2-seanjc@google.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_152141_426535_AD521553 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, 15 Sep 2023 17:30:53 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Wrap the helpers for getting references to KVM instances with a check on
> CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
> NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
> to get references to KVM based on whether or not the architecture supports
> KVM is nonsensical.
> 
> Drop the guard around linux/kvm_host.h entirely, conditionally including a
> generic headers is completely unnecessary.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      | 2 +-
>  drivers/vfio/vfio_main.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)


Reviewed-by: Alex Williamson <alex.williamson@redhat.com>


> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 307e3f29b527..c26d1ad68105 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -434,7 +434,7 @@ static inline void vfio_virqfd_exit(void)
>  }
>  #endif
>  
> -#ifdef CONFIG_HAVE_KVM
> +#if IS_ENABLED(CONFIG_KVM)
>  void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
>  void vfio_device_put_kvm(struct vfio_device *device);
>  #else
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 40732e8ed4c6..80e39f7a6d8f 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -16,9 +16,7 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/iommu.h>
> -#ifdef CONFIG_HAVE_KVM
>  #include <linux/kvm_host.h>
> -#endif
>  #include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -383,7 +381,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  }
>  EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
>  
> -#ifdef CONFIG_HAVE_KVM
> +#if IS_ENABLED(CONFIG_KVM)
>  void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
>  {
>  	void (*pfn)(struct kvm *kvm);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
