Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050B8C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TYuxYGB/c5HQmZ1eTRT00dBrRwubxoSgH4AyUmkLwJ0=; b=qdND/+rNNvjfBFDrbCMp1QO+hX
	qsac+LeQDhG+0iBZMEmno2c2zaewp+YjzNRYI/DNovQM6bFamwdbP5LA5X/nrQtBKnF32yrF7+wFH
	hh24bfB4248hisA9JYJibRT77JRVC0FT5TYG9PltyPDdMXR2+OfQmcRPOkQxJyZICOaQMk6oian9H
	nCXTS7voZA6bwwF116inluUAUrUc99n8mlYfeMTJjz6+g+xSR/CXP/ope2/inIGNYtHlb9FEXDq5o
	PI+czTGC2U8Q/WEDG2L97JVA7WNtexnDpj7MSygspbf0DkWcpmINzKny+IG9rhT485Y/dirAdohmg
	F2dM8YUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQarH-00HRCj-2n;
	Mon, 31 Jul 2023 21:55:19 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQarF-00HRAL-1J
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 21:55:18 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bb982d2572so31501455ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690840516; x=1691445316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxm0zlWAhsdwPNs5iJKIB42nBu2Sipk2tDe8KMVu/ek=;
        b=ytmpshOAB12qGqTyFlWk5nuibqbjszjzG8HlzRak1nXLBRIW7mqhUOB3pdnUEqnw9p
         ULxnWPLZRD2mRlVyB/5q0bX5aw1YvfLLdUMnRf4zI7SyNr0EH4R4tqZ2ZiseNI/YvKYQ
         OZ7Y8CSXug8EnjUACyUdgtTfIF4qmkOQgAhYTbRl3Yf5EpZjTT6Y30q2mELLLrGNzfAI
         TWHiUWWZhxH6y1Ge+v/UQbVXBXj23ItOQKCwVAD9/GNOUpV5F9QWb/vBOmkWUJSZ5ia8
         2yt2+GgEWjOZeaHfuSn3YEhuGE3VZrD7PEIEAsa/FVk3PFxtUHAMyfY0BGbbF9GkdiQc
         vKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690840516; x=1691445316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxm0zlWAhsdwPNs5iJKIB42nBu2Sipk2tDe8KMVu/ek=;
        b=JRNcoUabuNT0lppLzURWXoeGsuFmlEx0tOJE5zFqi91obCO9zllbYnYEYeWjdx84NY
         zftW2Hea1eXS/hhGJh8B6N3UNh2D7hJmOxu+CbCDXEJnd7ARx7fufWJm5ovcsUaOAt6b
         f6Q9mHphbHxzgARXsW/qfOzVk4019mEv1Jtds3dN/lRm4R0Mj74Psk4FoTKY+MPfVt8F
         w8yAS4qHEGYoI04jbo9umNwaCbAMZ/W5v0hVsh3XpnWdd43vdHCrLE+Bq60jb+fIyfXj
         YMtcgtYpYlhGBblAUuaO2qunlWEqsIr3D8Tt77mgHNRAEPyW/vDhBESKOmcbcdxKWLUe
         lQdw==
X-Gm-Message-State: ABy/qLZiPXZqDs9HCfn/pgWcH25pf52/0oNrvoAoJwWOBhX0RvSFrdyj
	cDaOK392vDdgr5HzeOaIgb1QsUq6hzk=
X-Google-Smtp-Source: APBJJlHx/oZJ65GqvDqk2V7Za+tbO1+mKQOFTUapwiCiODu7Ma2pbwshPhgFtt7G52AjT0XsLIyUCa+03cU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2309:b0:1b3:bfa6:d064 with SMTP id
 d9-20020a170903230900b001b3bfa6d064mr49693plh.1.1690840515767; Mon, 31 Jul
 2023 14:55:15 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:55:14 -0700
In-Reply-To: <20230722022251.3446223-5-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-5-rananta@google.com>
Message-ID: <ZMgtwp/YCZciRvdr@google.com>
Subject: Re: [PATCH v7 04/12] KVM: Allow range-based TLB invalidation from
 common code
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_145517_447205_BC57BC56 
X-CRM114-Status: UNSURE (   9.05  )
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

On Sat, Jul 22, 2023, Raghavendra Rao Ananta wrote:
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce..eb88d25f9896 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -278,16 +278,15 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
>  	return kvm_x86_ops.flush_remote_tlbs_range;
>  }
>  
> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> -				 gfn_t nr_pages)
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)

Please keep "nr_pages", I have a very strong preference for that over just "pages"
as the "nr_" makes it super obvious that it's a single number, as opposed to an
array of pages or something.

And it doesn't truly matter, but IMO the gfn_t type is more appropriate since
the gfn and the number of pages need to have the same type.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
