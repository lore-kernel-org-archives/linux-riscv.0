Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF21BCD37B1
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zD1+eVffCNfcXElZqHFL6+iXegiN+IPVEsb4GIA+Mg=; b=KzLtseZKBk6L/b
	QxxE/eEtdwgEo8WPB78FwTOIjwM/RUYCl1Ase9SUvDsHjbUWb9BXW2GPdE5+CwqC6jNUR7PljpFad
	/aLiYsiS5D69xb9N1uztvdlTQiN07JpRIpzeW/uQ9q4tK/uYdywPXGg7PZcpCyTg4KJwh7sZxB5if
	zTVUXLTjmpvfs6ax9EzAusoPyknphsf6q2OStxnKyCVV6xxbFDo/ypsUPmcTZloE645q2PvP4swPO
	d8RnFA7l64pRalvAkUhofsvu7J1Xvzuma6PMXuYFsNzALnZCTpHHLO41gJJmfR03KaiZPfkotUV3H
	MaLkL0Z13pSjyijovm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJFl-00BeVO-0I;
	Sat, 16 Sep 2023 00:33:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE8-00Bcyj-1s
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PzobvpQc4vWfR42iy4RjYEgAb/kHLuzC5INLwcS+RqY=; b=f8ihytYxFeydf39g9xKvpBiXdF
	UU5DcZurmUDOBPSWnhdNSxezPcxo/ppBHdELFow3auFDvA74IE/Ig38RDlgvfgzG1ubpsKTxpb4JX
	QZe5YvETln/hZ/Zw7bjaMQacS6c0VYmcMVcd89c3uH1BEPksEqQUJc3rW/iTDR1H2KNsvnpsKUk83
	lNAPked2j6jclt5F1S/iPnM9rDUGrqqENsHS5dcVfeCnAwvHWoDpu5qQOSlutJ4/N66eHBak3JvF+
	Njw85SSaLn9U0LTAl6lf5EqZED2fl4ZoMUVj0UYdQMefKLOUgOYZb+zvYCg4X24FoMhUfegU/rEJJ
	8QESPyGA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE3-009jpj-1z
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:58 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58c8b2d6784so34339937b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824315; x=1695429115; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PzobvpQc4vWfR42iy4RjYEgAb/kHLuzC5INLwcS+RqY=;
        b=Cwz60IBh7+h00iMqdibbVDV+aj9UEQhYdkyQbUodv5GfjMyU5emAsQvaMsNgCnP06F
         vPmA2Ii/phEnYUKbepTebPaaO9WI/kGX3ojn6Z9DOHl2Ypo+izb9/hRIBT+1NukV1pry
         JVdPXMsb9O2iZbeI1xEYeMJPVkxahV8Wp+Jelx4XxDUxpq5K5jLBgpx3DVFaRKkWTMYU
         B3zLwpxhLvR2ABu8extRHT9G8HeIUBbjs+dJ5d5QxcheC7BWmRDmv3ykYgH9OQR49KfS
         UzYrb3byjBh9W5SN/pPdNZ5xpfxsixnlqvI0nTfbDVl75agV4m7y+diy41P201k+m8G+
         ntoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824315; x=1695429115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzobvpQc4vWfR42iy4RjYEgAb/kHLuzC5INLwcS+RqY=;
        b=t4BkjUNIn/RWiaQsKIx9sf4XkxpLIHB23wtTQ0hpmn60ykTbzuNBGldLQuu4ECKlnD
         f9QqK/YREXTLJLJf3LDKFxmP4/CdnzUwJADM/dabdBpZyZFjc2SLfkhrlYNHCS6b4T9a
         dB81Qp3UKF3yhBLukH+ryidIKtN0/JiVbBlsRPsZyfboxJ0X/IX2Y4OiOKM+pyduQBGk
         fyEukxmOyC11Q2fE7U9/ordjBswkvXTLER9CjzprIViwx1akKC2FL3NIR+BZz14uSxa3
         uBhyDBp8lLlIzv9TJgrIiSNqgE3NuLDRev3O0OYbEKo/Muk4E3LgEhUcKHlO6zuII9Sw
         zglw==
X-Gm-Message-State: AOJu0YxSPSX/I7ZG7ZbMWiHdsTtBKaLGw2pNrJNLfbf3x3kKptH+M6xb
	0XsA47IyMd3cIAv8K/0LfMsV8zC00KM=
X-Google-Smtp-Source: AGHT+IEHyBaVn0yDFSDy5XyxKJ2PGYyocUtrZpuSTqYnDVflp7SqStNr9ZpB4/OYXqxtlzASuEez5Ye4vGU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2e06:0:b0:d77:fb4e:d85e with SMTP id
 u6-20020a252e06000000b00d77fb4ed85emr78448ybu.6.1694824314795; Fri, 15 Sep
 2023 17:31:54 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:09 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-18-seanjc@google.com>
Subject: [PATCH 17/26] KVM: PPC: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_013157_311138_C65907F8 
X-CRM114-Status: GOOD (  11.55  )
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

Don't add virt/kvm to KVM PPC's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that PPC *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when PPC support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 5319d889b184..08a0e53d58c7 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
+ccflags-y := -Iarch/powerpc/kvm
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
