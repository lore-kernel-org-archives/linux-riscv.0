Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9944AEE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyAOe1Di9IYnhKsRwsOXbn0yJ464AdElBMmZGmPqLA4=; b=AXQag15RQe+BpM
	Xb/zJSOgi2IEMEmIIEbiwwyLgpFQAqAXfPjhMuB4er3ucMyFkxc9kcF1CmruTvC/olBuhtZTeZO93
	biHDBnmU5+TQe1PZcpFtuEs4Ie/6k8olYI0UbVn9QCTVHw74rLhNGL+bUzP+iKhHczI/zgmxb+Wuf
	dAAr9JuYlH1vUJmrbsWhiHy0oT1bplmDzAacFJneZ+D37ksSJnlob2klSPf4ZekmM920cNPLVDJOf
	IZhio0fUOqftXoSNzOhzVCkTAKcIb94ZfayMVFc2oPjvddj+Sano2Jhic/hQBaFteTPAmIIqDiILO
	TDPT2/i47RflBu5yhfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbbB-00740J-36;
	Thu, 14 Sep 2023 01:56:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaI-00730L-0J
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=; b=BQjQquKbzkaeLXa4Vl1JVWXPeL
	vxedDalA0XrpkhRm5zSBUA2xSZgAs348Fer4+bzn7gr/S7mc5qO1mDo75YPLEXsiu/+PR15Q7TmIA
	zHL6Wyr+jVE7CfgQfj6WxoJGzR7a2lUJYbjKWLrSf1x4OsZWqjBQENdCg3rTre8GR8D1/97ne4nju
	8Z1rgDoOYwm5rPEIMQVo9n+LsGXTwL13QZPoSS4qp3vldwuGitmX9cTUM4Vy6qs5paEsIHw2HdV4R
	DcxJL9szax5ZnPBQrgMKLcJqQodKEWP/HO18ry9+TYmcVpXOaYhVZ00M14bXA33qC2wtd9t26f4mC
	P9SZv8og==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgba9-007TUI-1F
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:55:56 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7e8e12df78so539516276.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656544; x=1695261344; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=;
        b=xGgPdrApNNsYcbj3CG+T6beOVHOS8VkhZhCErrKC8Pv31bcB6pnu8sgWznYKJ4V31T
         KxpAULCIJZCWYds4kS4gnbOBGu1cTWSsumdg8sySCIIL0gA8IxV26Fdlf4GFwGt4ft94
         V/lN7jfmMHmXUxNpqYXsMqy/27P798mZN3KNPWoyyBlUidRx/8+jvag2kfX5mb4bPTU3
         xWTqptQs0t7ew1fPk53Jhw8DM4eNcXpZtrGbdPkEdkXbJIcyX2A2qUtuFOxkN3LfRkDA
         ToLfOhHU3mRqcxOzLJ/6FzgXxQ+70nJ5N+yrUyKNMr2F5e0Pi2AebaSxfu6qph5toeoX
         Zg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656544; x=1695261344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=;
        b=niU+AB479GmMsHepcecSRwp4kdelDHEp//R/EESEwo+dm6He7M5h7j0GrMzerfHgwo
         D9KgBwFIjoizzNsIiaMsYxH+qzLZQHa4GJtVkw80woXOr5//bFqztTxxzYJKNiUf6DOn
         GBcjzsxh4SgZO/HQ9RT+5b9JUspSIzpAwFa2g9lBxdQWmp4eNgUTMNpmMll3VIWncDst
         sKHXCYuN2xbKR+PtodkvVKGIn3zQOSUHpRMwAH43CyPuLV0TyXQLIcM3B8t0AiruUMV5
         Rl4VQ2lAjcqrIBOFDoKhjavZVdEZey8NZiZakP2HOHedT9vj2Csvt9OQu7GehnMQjy2N
         G1VA==
X-Gm-Message-State: AOJu0YxF0qlNo5YPWOyCd+zueXKRohkbj+Equvixfe/I5yf2p4YJrSiu
	kTCL4QZeA2aY0qH8udlxeBSTRPsm9x0=
X-Google-Smtp-Source: AGHT+IFAWDIKY3pID0CrDZgtjj2bXptPteu0k42w51y6Ps+oH46knUj2OnzhEQTEbd0IbAu5MzXei5K4JBI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:684:b0:d81:8e4d:b681 with SMTP id
 i4-20020a056902068400b00d818e4db681mr15248ybt.12.1694656543919; Wed, 13 Sep
 2023 18:55:43 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:02 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-5-seanjc@google.com>
Subject: [RFC PATCH v12 04/33] KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025551_808822_DAC6BF72 
X-CRM114-Status: UNSURE (   8.91  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Advertise that KVM's MMU is synchronized with the primary MMU for all
flavors of PPC KVM support, i.e. advertise that the MMU is synchronized
when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y but the VM is not using hypervisor
mode (a.k.a. PR VMs).  PR VMs, via kvm_unmap_gfn_range_pr(), do the right
thing for mmu_notifier invalidation events, and more tellingly, KVM
returns '1' for KVM_CAP_SYNC_MMU when CONFIG_KVM_BOOK3S_HV_POSSIBLE=n
and CONFIG_KVM_BOOK3S_PR_POSSIBLE=y, i.e. KVM already advertises a
synchronized MMU for PR VMs, just not when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b0a512ede764..8d3ec483bc2b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -635,11 +635,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 		BUILD_BUG();
 #endif
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		r = hv_enabled;
-#else
 		r = 1;
-#endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	case KVM_CAP_PPC_HTAB_FD:
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
