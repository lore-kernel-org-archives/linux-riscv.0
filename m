Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D53D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3LckTz2M1CucM/bD60OGn9zknespQVe4quZthjDaRc=; b=WcC473x15ZR/d2
	OTP0Wu9BKnRblB/2viFZrnUvduuHVnSb5X3Amo9WuR79vaAYXaGL361QcySUKEYuUjvjYc9Trkp1x
	5ezYWtHqM5xmpT58HxROuS7AHRK9RmGljqeVq9KYRKH/+EzkG//OTOTAHNEzBkW4/wxNSFZ2wp3v+
	hubC6XrdoBFhC+DCON8Vhzw0q36KDM5iz0Y/eJjLr1wlDuDcCWptSLOOjF0bAlTRCjFcf7xPO3/O/
	St6TPyKSt9FPPwJXxvHB155pdgXeSe4cb/pMU8TlL3HCbFaqN4A0S0KxbbmCXvXs/Wdhiy+4GdoHI
	MQwpIup9I741T9y0q4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzos-0000000EGuI-2gna;
	Thu, 10 Oct 2024 20:31:34 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxs6-0000000Dr5y-2QWU
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:48 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7c6a4d99dbdso297879a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584805; x=1729189605; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
        b=M+42XwPeNm2oSLyAg3Vl9WyPEJno5UFR5cRhnp+qZDz+0cqpTMt6YrirrABxaPv4FV
         X5sXr42pqnv6G1sQWDVLbO442GXAXQG2xyM3M6hcjelKEbRIy6LZO34fqlWHgsRi7Dn5
         pe3x97wUmaoCQM1ZXS/3Vl1pXCclzZ79Oao4ekCGwyg+ntTW5kORcLutbnMz2yqINPCW
         e6N8R1w5Gma7o0kQmT4SxmZY4nm22nwQ7NlqJ5SdPUEv2jT5Vm9fPfwj7eK0gmVTDy6p
         /bUqBoiqtFPjelGUsNSKXHemm2iWSIzBddpPfZJioxZ+Ky5Ja03rjPcof5VsFg8VXqyr
         vjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584805; x=1729189605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
        b=AP2xdsWPhr25Qw7/1r73MVwDx6tRhFcXmJ0OXm+3v2i2oxxbCBQG4JfpJXj/nfUuCh
         gB7g9LI7sd2t4PgbWGvsXjsAXtzqcRyLYT7ELjYIxx1njeXiK5yhS+V8bKRD1F71BMzK
         KPkCjYB/M6h6GoheI0O3NMCz24CN6z/MgkMoai/N2DDhiG1IiiPLaxbgyM95LLMz+EIO
         uz7o0eRL3hw5Qz/6q9ir/950ek2gJJYYKMO8Ve1leTm5c6o3PXnkgbUeDqBggZn5O3QQ
         78HRmOjUNq3ZHVgb9DJsfMDWQ5zy1Jy32DCEVc/mVgpDpNeed9XBgn9iLU3bYpyNmKeb
         vkKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlZlEuePTjArCWdC+n3UGRtmiVnbexWnJFaeByrxR1KzYb/NbZkd/zK9doijtcSC63NufSprQoe7gBTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1xB6eGo7izxxGU3tUz5/hFtkBKpNKIvWij7BmwGgIjBUGU4Rc
	2bQfj01yKZRtOBVNHbhSJ6F7u/auzti1XYJ2d5ZVTgCa6RhTDxKJeTkzYSYCu4JK1VeASH/Np/G
	/fg==
X-Google-Smtp-Source: AGHT+IH3g+or1uGKI8zaqA7g6VjAId1uToioip8sNGZo/KyXggeZoODfUOK1q5z450FXHERnWYgwR7EwX2I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5107:b0:2e2:ca3e:10fe with SMTP id
 98e67ed59e1d1-2e2f0f88a54mr24a91.8.1728584805241; Thu, 10 Oct 2024 11:26:45
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:55 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-54-seanjc@google.com>
Subject: [PATCH v13 53/85] KVM: PPC: e500: Mark "struct page" pfn accessed
 before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112646_752411_B05B90BD 
X-CRM114-Status: UNSURE (   8.22  )
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that shadow_map() can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.  Marking pages
accessed outside of mmu_lock is ok (not great, but safe), but marking
pages _dirty_ outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 5c2adfd19e12..334dd96f8081 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -498,11 +498,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
-
 	/* Drop refcount on page, so that mmu notifiers can clear it */
 	kvm_release_pfn_clean(pfn);
-
+	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
