Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EE7C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCwx+lQIzigTLXinkWh/ZYKjzTX+NdTBKRKt5w4Ey8E=; b=GHmDkEVWVrhPLS
	TZHPfLcMl0ZYn6cDm+ga1tn7pJel1QDZS5SmNFNAlkTnr/ddlIPRrFcIk/FaZAIT5mcF1d2UYkvGO
	bt/mTvdfNgQEd1QtggnctZqWYAMIBVNoCnsevj/j1rz8wOWR9sl5yqyYmfZSZUd1zH1bzyDRXNPb8
	6eC/52rEzPgipVSopkqcRlaDGHQCLJF4rwQYVXWAtcrmFKKWb1zxIE7uH/ivJxisgH3ilm0arBZPl
	x9TEYFJ5ROE6qGPLlEytwcIacp9ZdHaAk0MvDAlFGAREsVygA5rnKuwM0p+DuTDw/WPlGWixqAMEh
	GfTCxOSn6orrRcjdhtHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKN6c-004pQ9-PR; Tue, 24 Jan 2023 17:29:10 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKN6T-004pOI-Cu
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 17:29:02 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-50112511ba7so169407697b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 09:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sHQzscpqG9TR78740t1qks4GROeGMyOxwyGqktGwJE=;
        b=Wv/Y/FHqEIrZHr/zsNPKlIP0whUgie/P2KEuD/n0uk24KW6tZ8c5E2dlYQQksvdoXc
         MIGHEBlUyUiurRHKw8Eli/ImV02k9ot4n+oIcF3KHN0Eg97UZIY86sENWVWQU92/wEku
         tC53N+VqDQm61+7t4vsGLZJKabtV7K36r+12kp1mA/pYMQNNe9IENQSoeoOTDJhNIfIi
         pwMTsdVKm9K2Zr4mYwzujPCEe6yuR+ktXBivdEw3X1L9xQ34O0xjHOv/b0Y/qsZO4lf3
         CRYLcBg/1JEoF9JDtZGWN8+JUGWeccq8WSx3xvS9w95XtQVb/oCmR3pU9VOfVK3eaNRc
         R3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sHQzscpqG9TR78740t1qks4GROeGMyOxwyGqktGwJE=;
        b=lm9W0yw1xgzutpe9cpzVkOUaKxzJ2x+XAHHDyCyLHg7FI8PkiWKd2Fta8jAdnbd6qU
         A1PD97iDqkmqF/iz071Csj2RqC7D/RsRw+Iwdjh9eg/LuAExh40BdxcMrnANfF0MBDHN
         8HvSpAZnWPNcLbcFl57qapzhPXCcfqv8J3C1wiFCJI+wa4vFQC+NiGW4GNrFGqLkFP8g
         AjGzUBdJUE5D/ANHf/wvvqrTMXYTZGFGc65OzqT1txEkGFxpmcRskBGXOrQJGOIN+SF6
         nB5wjorca+Dk7qLIU6XMTG2RzvhaxqRryyMTgb/+U5qkhlO3+uNq3KgBKqEZuh2TY1yC
         WiTQ==
X-Gm-Message-State: AFqh2krxP7mbIE409vpaYi9FmFE5f1FsD7vSttgjyEIjrA0I3UXeeM8Y
	GCmt7WNRfe1+unV+XfEyE3c7s9wvJsfyna2zyOfXEA==
X-Google-Smtp-Source: AMrXdXtoN51iKqcC09s8NkQ+YBm6QxH/37ZW+Hv6vzsZE0mZGYF6ccuLxsS+T0REhESD+5OAPgve9W78T1Q827MM4i4=
X-Received: by 2002:a0d:f807:0:b0:477:b56e:e1d6 with SMTP id
 i7-20020a0df807000000b00477b56ee1d6mr3560086ywf.188.1674581336255; Tue, 24
 Jan 2023 09:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com> <20230119173559.2517103-3-dmatlack@google.com>
 <Y9ASmOvJutgGLVnT@google.com>
In-Reply-To: <Y9ASmOvJutgGLVnT@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Jan 2023 09:28:29 -0800
Message-ID: <CALzav=fbzgpktnCX9Z7G_gN=yVVLuwB5Of3_pq3LHrQGySbHsg@mail.gmail.com>
Subject: Re: [PATCH 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_092901_439900_1EE7A03E 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Jan 24, 2023 at 9:17 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> On Thu, Jan 19, 2023 at 09:35:54AM -0800, David Matlack wrote:
> >
> >  arch/arm64/include/asm/kvm_host.h | 3 +++
> >  arch/arm64/kvm/Kconfig            | 1 -
> >  arch/arm64/kvm/mmu.c              | 6 +++---
> >  virt/kvm/kvm_main.c               | 2 --
> >  4 files changed, 6 insertions(+), 6 deletions(-)
>
> I think you're missing the diff that actually drops the Kconfig opton
> from virt/kvm/Kconfig.

Indeed I am, thanks for catching that!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
