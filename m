Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD73C25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z08Cs01IWTc0bUpFjhEiZ3a7+4C3EZUi1Ju+PRHTpBQ=; b=tppu5lIrVt30OM
	kx6XXu/2DPlElEjc7y6Z4mOeOZ1yAcqbXAeRb3BzouMgQd3RTy/qCHpzdjB8y5Uqffp/1fZ8LxImK
	zPVrW1psvj1xdTIoPOXljl4GhLy3P0R686U57mPYCZKTcJlTYvCaQnNSwTeuxlQ5tpVv2jlv07g0t
	5gNqunMzV8aQcN8jZU18CdHaXplRsvm0/ROUhAXSt2Ybb733bEytrYFluyMnlW3TmSMWGvNVYrDPe
	4HXMZjxSE2qpNkgXk2lHJ9fgbgPlnoztlpN+mp4nZ8eIIYUKm3k7RomEBLR6e2Ab5GH0bR7HL0TJ4
	TI8D9fOCViLG1zdl6Yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUa-00GxmU-3A;
	Fri, 27 Oct 2023 18:23:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTw-00Gx49-2f
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JgU06SXMv6nm3bYLetCIh2Atkw0AeiFtLr3TWBcGDvg=; b=d74fjVRQhghWVfKzWUzmpQC6KN
	4ZEpV8KMIzKV1QtVBjZmt+H1bXuYQoWBUEyzpQPTy01HlCy/LHfSM4j8+mpZmbcw9kQHEChv9GNLG
	ix2gVxcu9sRpLklipHMhLzdbwgZh5lxNdK5P/xbLQ0KrRkOgNDOKLEMU21dMbxX1GttTnP12ERO2/
	+joPjM4+1jGlMpZ15CGJubbKrPg9nup55jnSMNNs7L9D50Ic/qZCDcxJ7okhvhAXCIvTe5fzlsXuV
	BRyWINa43b5dqCUFF6J26DA+gD/ahpV2FNgF05xUGz9EQY99t0XQHCspq+NR6VXhTd7lyViS6j9rn
	Hf9GU3+Q==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTp-000uTc-2E
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:48 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc20955634so8186945ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430955; x=1699035755; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JgU06SXMv6nm3bYLetCIh2Atkw0AeiFtLr3TWBcGDvg=;
        b=BNoupBy/TEFcEITjuECzNdp46mtd59xTs5ZUgXf3C0owu5DWSucwTHSc6DEWFJvM+7
         +l9UXt04msoNMiPGOKjOUWIazj55qVmGHwDO0lT5lOE1qSMX4LrptGs8IfEcoE+DiemA
         IoKpKatGuJ21ovmIYpcm1Svk6qfhCQvUtvrVxAy/HsdelVMDFAA7/QtTzCICkshC3IGS
         7xB7uKrejfnafZhqwRrwBgOpHI2GJ1rWhjfkFspBJ09wXBcbzCGG8nIEzG4SBavnY66v
         1CtEOc8no1TYrdrJlWrZuxV+6luv3SMuuQwPK8XKzPmtKGl7SyRt8HiKG/yMD52Gm05t
         8fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430955; x=1699035755;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgU06SXMv6nm3bYLetCIh2Atkw0AeiFtLr3TWBcGDvg=;
        b=d4JWNKEhLQR2tcE9PIBky9LBfe89Nz+TKwGZAdoek6u6zLh0ycF7NePMGbB1ZbZIJK
         acb7pb50w8f2l/82ykgLSDXngfcEMeYjuBAhacQTX/Hw7UTQurtz4yYE7Qk8g1oxLzkq
         oiTEBbYqX6tcVrbpm3KFpJiVkuoM3euAX1dNNd+8TBtsNChbMXsGmbrHuiDWqFenpGkw
         sdjOQ++mqq1RXaU4382YEkKNrC0oa04rPtMrGK+L/wTbCJZ4+IinhvlNeHaFMrWK59EL
         5n2gZq048maBEEkAmgPtE72/3V59smb/AZCzX622akyeuAey1UFLE3pt5btIGmfacNVg
         TteQ==
X-Gm-Message-State: AOJu0YyyTy8qIe7z5eBDs5leB/2CFf5MPQ3MW1ooEFqfY9ZhnZBePoFU
	Rt+nXaOCQ9zbfKCUXySFekGr3P4BDgM=
X-Google-Smtp-Source: AGHT+IGtvUvxtvF0vLnhcz0wuwQy/3Gylfgr5sP9pToido+ZyPcnNi9qskOerQDKma1HuMTn89KXKiciq2s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c144:b0:1cc:281a:8463 with SMTP id
 4-20020a170902c14400b001cc281a8463mr32525plj.7.1698430955693; Fri, 27 Oct
 2023 11:22:35 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:47 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-6-seanjc@google.com>
Subject: [PATCH v13 05/35] KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192245_882333_619A7699 
X-CRM114-Status: UNSURE (   9.71  )
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

Assert that both KVM_ARCH_WANT_MMU_NOTIFIER and CONFIG_MMU_NOTIFIER are
defined when KVM is enabled, and return '1' unconditionally for the
CONFIG_KVM_BOOK3S_HV_POSSIBLE=n path.  All flavors of PPC support for KVM
select MMU_NOTIFIER, and KVM_ARCH_WANT_MMU_NOTIFIER is unconditionally
defined by arch/powerpc/include/asm/kvm_host.h.

Effectively dropping use of KVM_ARCH_WANT_MMU_NOTIFIER will simplify a
future cleanup to turn KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig, i.e.
will allow combining all of the

  #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)

checks into a single

  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER

without having to worry about PPC's "bare" usage of
KVM_ARCH_WANT_MMU_NOTIFIER.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7197c8256668..b0a512ede764 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -632,12 +632,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		break;
 #endif
 	case KVM_CAP_SYNC_MMU:
+#if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+		BUILD_BUG();
+#endif
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		r = hv_enabled;
-#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
-		r = 1;
 #else
-		r = 0;
+		r = 1;
 #endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
