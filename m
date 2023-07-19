Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1922BEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o1PE/oPIvTN8fk8Z96Kf+AbFsWin3gRyXuuXuqqRfOY=; b=cHpRBMgKiPFn5CPvHn96ss386L
	WR21/zLj5iMgtCUiPYMArt4tG7mmW1XJdJrroPj+kLqmx0xW+6lAVP6MeXJmXUmFYfeXIGMUZUchT
	+DCoIYnO+avbWESgOi6n+cJAjCxy8N4R1YsTlxkMQFfo0RfoQY1LZLZBWQRu6/WTkSm8YxL74ojVD
	dMIiITtr91DCsHuVUbOj+pu6xjU30xveAqjp1GwxSMnp3Y/R7wYdhM2v6qq9cihmCZWclOB7kLVm/
	Tbf0ym8TEQlRXo8C1TcXZ78RYfaNhbW6VAjI5fNbFGicsXD/JxcrvcsFkTsxLQGxubr7K+OIUNJOb
	FOnEaGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7xV-007gkx-17;
	Wed, 19 Jul 2023 14:15:17 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7xR-007gjA-35
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:15:15 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8ad356f6fso36967075ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689776112; x=1692368112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpT1srfgRytmcGt7uikxVNkA3BifxPUMvb756SCoWfo=;
        b=j6O4A4Kn8RrMiTsmWugcLoaBmDhdEOi6nm13D61dQWbrv/4yDEEVo/KZUz/JqdfsPo
         ZnKg9K95Lj7ZE2/dyLjlrZe55VZWZdtTVn9fgyfdtCrw5ElGnLLq/Qm5V23hi657OpUr
         Ebqn7DpgmWmZ6MQquOf5BjnPEIp0JeTMJYNB26HnYKqlFJQ9PECoKhiIFC6MpAGppjwD
         QEmzIJjuF0aS8nAXfMaVCs/HL9rulvVWCoWXejxaQyjwn7Vpfe71Kirx4tiYJoYvfJy1
         s3tsizGDD9BtrGq0rYlfmNI7dH4xGaeqfoCnPAOEbyXtpSJtpl3/bu64M8d1b+aFanZ/
         4psA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776112; x=1692368112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpT1srfgRytmcGt7uikxVNkA3BifxPUMvb756SCoWfo=;
        b=hCljH7i+y2LvH8/yVu6gylyl8ayckjz7NQljO7YOXo00f6jjkWOsd6nb4YBPMpCw6h
         2HCOiifcnidzNDKv02NOuNO5Vgyq9YE+M8F22RvjrOTitrmsgv6qJdLJNEr3Hg2VgcHc
         eiE5SiJ6Wy2W3vUaTZhH8ZUOlY3CjGd8hHSmt60Is55VUPrm2Mp5l5vLNvskMd5pDhby
         ZOqZk0hUUcYEzOiru//R+lG7msHZ950FSp/Wr2S8RZVrjAvDC0NfMVOHdKQKPNMEHbJO
         jji5XZP1vk8So81ktnAVhMdpgH6rZWQRDrwOCLbwRF+0D7kI+RhO8gOmRy7BUNV9BIlA
         O/gQ==
X-Gm-Message-State: ABy/qLZPlkUSyeNFNoXc1pIh7F9DoX119qp/mQaUs7QW4AWD+J3FndCj
	G+zyNDbN9PYYBVkmIow/XCd5Dzh1mQI=
X-Google-Smtp-Source: APBJJlG/y4qA2BEDL4k7hIJJKli+sdbNpvQf/prgfQp/iya4mlyKn4vdU0WvDm35KgLLUXfLwfwgiDZvoZw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e812:b0:1ae:6895:cb96 with SMTP id
 u18-20020a170902e81200b001ae6895cb96mr14210plg.5.1689776111918; Wed, 19 Jul
 2023 07:15:11 -0700 (PDT)
Date: Wed, 19 Jul 2023 07:15:09 -0700
In-Reply-To: <20230719073115.vuedo2cf3mp27xm4@yy-desk-7060>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-6-seanjc@google.com>
 <20230719073115.vuedo2cf3mp27xm4@yy-desk-7060>
Message-ID: <ZLfv7aRq5W52ezek@google.com>
Subject: Re: [RFC PATCH v11 05/29] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to CONFIG_KVM_GENERIC_MMU_NOTIFIER
From: Sean Christopherson <seanjc@google.com>
To: Yuan Yao <yuan.yao@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_071513_998382_75A213BC 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, Jul 19, 2023, Yuan Yao wrote:
> On Tue, Jul 18, 2023 at 04:44:48PM -0700, Sean Christopherson wrote:
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 90a0be261a5c..d2d3e083ec7f 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -255,7 +255,9 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> >  int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
> >  #endif
> >
> > -#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> > +struct kvm_gfn_range;
> 
> Not sure why a declaration here, it's defined for ARCHs which defined
> KVM_ARCH_WANT_MMU_NOTIFIER before.

The forward declaration exists to handle cases where CONFIG_KVM=n, specifically
arch/powerpc/include/asm/kvm_ppc.h's declaration of hooks to forward calls to
uarch modules:

	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);

Prior to using a Kconfig, a forward declaration wasn't necessary because
arch/powerpc/include/asm/kvm_host.h would #define KVM_ARCH_WANT_MMU_NOTIFIER even
if CONFIG_KVM=n.

Alternatively, kvm_ppc.h could declare the struct.  I went this route mainly to
avoid the possibility of someone encountering the same problem on a different
architecture.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
