Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78378C982F8
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqGaAwlMLDYS7qZc4tHVPaDsstGDQVGH4GM+espPItg=; b=gVl282o2oxLYDP
	QKge2M5COg9Ynju3xfwUJ7cTWH/IQdju7/SlF8+nV7OlzX4Yaj1LzNjRV+v9Md/pB6RwSv/JcuUYa
	J/IRL8FRTq4aT2d8ecg/ukKofvUbdcBRabrl6TD13J7UlzvA8sZGvXN9jsbDDEFHONqC1sZyxdsBF
	8TrEjso6+0yKNxXrsuz6lEl25uKhU7V3nnIKvctxZLXb5Vyg5x5EjSSSL3nHXu6eNKDaHBxJo9cv0
	j8hR93HH0OK/kXYaiiTjWiaJT0LkGhhMwF5ppF1l3ePn2nbcc05oz9hjWzVFOFXX+fKRFciAdHADq
	Z8u479CPLc4NUjyl3sKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4Z-000000031gG-3k9Z;
	Mon, 21 Sep 2026 17:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4X-000000031dS-0f8d
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=; b=c/YV7KlY/jlEHtoaHI/ICJGllQ
	q3l0BLpg8sfrjBw2hgjQOfzxFds8YjfLgQdQsz2v2hjY+qmzSnrkyi7X7hFivI3rr7mdMoWts09/Q
	k2WGwjXb9q3g+KwcxF4HfLXSljDLJeDi0ZX6cDwGs65YNI8UR0bLomDDJSHEBotB3iVPusG6TqVUc
	9eMb6c3E2fe4fLmoa3tOlOg15Q1o3D8WwDR37SvJh+mSVrSNRIl0t3H3LsT4e7Pi9qMfKH5tz4llQ
	7pfd4buo1RvU6UYvujHM9gZtSUWiuOiM4hsnNUgSi+Q924C8TPuU254fJ2A6Ukv73hoR2pdjePJfD
	MHROlQIg==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4T-0000000Cdp2-1qTj
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:55 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso2826939a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012691; x=1790617491; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=;
        b=kfJz29Kje/A3oInSeCZ4/WNJGOz/KwJtH8NpsA4Q0ElZTgkudCSaAickBpae7xMLpO
         4D9o6cKEJDxm+qYHPmpDb9DVYr4qWBXdHH1Fwq18m4bMGrPvV81+5kgfnHaD9tfuWm/i
         il24IJKuFQxGfDEhyn0RpBU2ds7erIDovcPtnzCkFPUnIKyf1DXCymeMF7dnCPVUg9C6
         qKMBv3CHGwa5jotEz3XzTVmsz4O+mnrFFEuxAs+7/qcrySAAA2cfS/DH/AP3S2hHaB6u
         wGMJGqnuMM6716QxVy9YJZDUBuAaCm6XZ0rR0nwIhBibZF/YQlohcVYGUC3f2uXWu35z
         H05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012691; x=1790617491;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=;
        b=AWI7F20pnM1bbtHH3fINdkpYoJ8jIUHMolFnD5fGrVrjzBuDicSsv9ufRaRCndu6vY
         N5H7pLCt4Ei+ADZ7O/W2r+DAMbnXAGY2tAeIaUbPdaTncXvcLVM57Wx4K4bZCCuWF00Q
         3r+eHjWTlJVXgMZvpdk9A4nhEtFp0OBihndcD4zK7VeCZu/kkQ8aoX+V05/W2KNl3yUx
         AVb3+PDEtB39nZ8xj4ODwivQqLEaMXA3V9lncTXGtthcEkZ/ZTnkcFIpM7Y1fN9AMOAe
         LQR1Eo4cWT7cEgpL+VdbB/MiYoaxPWDEYXD5bR7Trvop0Pc08z7Hq87GuPpeSikFKA6F
         Yb0g==
X-Forwarded-Encrypted: i=1; AKwUvBxsMokrbhfxL3RMD0lnXyqefTib7pcovYS25SFqaYKTWY2/slpzDX9SMc4H2m86r2awZFBU7tKv41C8Nw==@lists.infradead.org
X-Gm-Message-State: AFuF++khbZ1HM9rdjIG7PgI5h727YHcvfyJIEL1yMr7weuKQ8lUn9nwQ
	83a2LEti6wLtTW3TuYMwrPv8hnhEPJitwK3W2Mz1NizNfZrhT/Q9t2YoMGEHnWiafxx9ct1BpF9
	wi5Y2ww==
X-Received: from pgvn10.prod.google.com ([2002:a65:63ca:0:b0:cc4:5907:21e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1b81:b0:3cd:8bba:824f
 with SMTP id adf61e73a8af0-3dd8c3d3acfmr19085095637.4.1790012690700; Mon, 21
 Sep 2026 10:44:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:41 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-4-seanjc@google.com>
Subject: [PATCH v2 3/7] KVM: RISC-V: Use kvm_is_vcpu_creation_in_progress()
 instead of open-coded equivalent
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_184453_664812_BDED8328 
X-CRM114-Status: GOOD (  11.40  )
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

Use kvm_is_vcpu_creation_in_progress() instead of an open-coded equivalent
during AIA initialization.  Unlike similar vGIC code in arm64, the relevant
RISC-V code runs under kvm->lock, i.e. can use the standard API without
hitting lockdep false positive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/aia_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index efc7c0bcfba9..97833a04268a 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -237,7 +237,7 @@ static int aia_init(struct kvm *kvm)
 		return -EBUSY;
 
 	/* We might be in the middle of creating a VCPU? */
-	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus))
+	if (kvm_is_vcpu_creation_in_progress(kvm))
 		return -EBUSY;
 
 	/* Number of sources should be less than or equals number of IDs */
-- 
2.55.0.1082.g2b9226bbc0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
