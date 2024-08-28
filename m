Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B0DC63798
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKv2QP16WTC3jVEmJm9hydeUNO6k96+4j87GXL0uiz8=; b=DR5sj/iSzfgCRy
	bkvk34F/grk1G9fP/M6zQB3H8WkSLNiFYGJaxdPzVdrPxqW9kXe7J6IKwB1hPba7TmtsE3YcEV2ww
	4oTKXEDj+4YfUXnNafyPNhNUQjJZ6JcciI88q6MuaNiO3A+biZHqULSOzr4aO7TOBYlhwHw02agdB
	5LLF4wgODvCWIC8vp+a+46+BnQmaJTKnnS1br0j67PPpsWDBi3jmGK4akzCld7jHYQI3wcrr7za4p
	V7K3Yq3yGNCCNOfRf5K2SX4g9ii/YvYaloam18yitwjTw1pISzbR+zm59VKLe/LjwOUoEtjjUa2BZ
	XCXrgmqOUua7XPvHvjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNC8-0000000GVnM-0gk0;
	Wed, 28 Aug 2024 18:15:00 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNC3-0000000GVju-0wOt
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 18:14:56 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so9342388276.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724868894; x=1725473694; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g8CEH7SnnSsHaiw39Cx2W/imrlcDKaVqaPZKBSnVoqE=;
        b=RebIUt5SF1fsC8ZAp1F/pqy9MtxbQykK2gucLz4ZvvWLIu84RzlcS/HB10SHk6iGzc
         CT50DgDuLLF95BTnxcJ3ydTXF9C2oBBDu87MB34fPOFImOKKik3q07Rz4j94k1KFSY0M
         8uPkT492ODOgt/W8riH/JUCQtGA0z0K62dfMVVWdAEwSDwzFI7EwOZgu76gKv0tbl7B/
         RDMHkeLawcuaXEfUKhU/pyxlPsNZo6XEzYm1/m1mnzkdjTqFJonOgs15R26b6bEghGbC
         dCbqUJbBklhwhXwlVs2an2zHcJi/o2i6+6bQdEjX7PhVYDxBgO7UwKOGD/c/NZuToRv0
         RxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868894; x=1725473694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8CEH7SnnSsHaiw39Cx2W/imrlcDKaVqaPZKBSnVoqE=;
        b=evnGvtqTMuQzQTDv02KphK/reYc11er0yHm50ile7uAPIgojG7lavvGIB1tLHXRTne
         wLPwOwzzp7w2HMUiOBJSL2ZvemeT7d/p8m8y9A9GmvW4MLRV8nu03QL3Kj1e8fgsDmFg
         vWCifTVWgIRJ9TPit+2n+kMkqnotWBRvT2c9YkR1gZkZJMcOeF+dsCiaGv/KvkyJU2cm
         kmCzf5aoR5ZN1rLSPrDXFVERFeB0yV06BbYqn15I0y0Uj6E+D/Cjd/fg47XPuenO1cwq
         gaJLIndiAGfMcuHE7WuK2ISLmn/LBb6cpcL+3M4YicZ5CjyU/i9tEJEtI0FK3zbgRfuj
         2cog==
X-Forwarded-Encrypted: i=1; AJvYcCX0W4RyLjI8rlJjsXVIK8WyTlEmZp1WTpJehCEH7iGzjd7YpPkOEbOTmT9WduEokPLHIk/eZwg0TCar1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyOsFRBiM+IeuqO5znWhrw01sCPUFVuRC89zn/2pu6gYFkUfFz
	QFUAlaKZUc0vhvtpFSQpgNb7XfLSujOnkI1QWju68a5t+q81Cx8+kar3lMawnrFzIHEoPevIhNh
	UAA==
X-Google-Smtp-Source: AGHT+IHNeuQKAVCun7jGA+4F4NSXhmCTAL6hk/rIp4B1oyD7UZlqqmU2e4hcnFIXLWY3/GKLuflJ7LotGs0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e304:0:b0:e11:7112:6b9b with SMTP id
 3f1490d57ef6-e1a5ab3d138mr6965276.3.1724868893779; Wed, 28 Aug 2024 11:14:53
 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:14:46 -0700
In-Reply-To: <20240828181446.652474-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240828181446.652474-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240828181446.652474-3-seanjc@google.com>
Subject: [PATCH v2 2/2] KVM: Clean up coalesced MMIO ring full check
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ilias Stamatis <ilstam@amazon.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Sean Christopherson <seanjc@google.com>, Paul Durrant <paul@xen.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_111455_283939_3BC8F672 
X-CRM114-Status: GOOD (  14.96  )
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

Fold coalesced_mmio_has_room() into its sole caller, coalesced_mmio_write(),
as it's really just a single line of code, has a goofy return value, and
is unnecessarily brittle.

E.g. if coalesced_mmio_has_room() were to check ring->last directly, or
the caller failed to use READ_ONCE(), KVM would be susceptible to TOCTOU
attacks from userspace.

Opportunistically add a comment explaining why on earth KVM leaves one
entry free, which may not be obvious to readers that aren't familiar with
ring buffers.

No functional change intended.

Reviewed-by: Ilias Stamatis <ilstam@amazon.com>
Cc: Paul Durrant <paul@xen.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/coalesced_mmio.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
index 184c5c40c9c1..375d6285475e 100644
--- a/virt/kvm/coalesced_mmio.c
+++ b/virt/kvm/coalesced_mmio.c
@@ -40,25 +40,6 @@ static int coalesced_mmio_in_range(struct kvm_coalesced_mmio_dev *dev,
 	return 1;
 }
 
-static int coalesced_mmio_has_room(struct kvm_coalesced_mmio_dev *dev, u32 last)
-{
-	struct kvm_coalesced_mmio_ring *ring;
-
-	/* Are we able to batch it ? */
-
-	/* last is the first free entry
-	 * check if we don't meet the first used entry
-	 * there is always one unused entry in the buffer
-	 */
-	ring = dev->kvm->coalesced_mmio_ring;
-	if ((last + 1) % KVM_COALESCED_MMIO_MAX == READ_ONCE(ring->first)) {
-		/* full */
-		return 0;
-	}
-
-	return 1;
-}
-
 static int coalesced_mmio_write(struct kvm_vcpu *vcpu,
 				struct kvm_io_device *this, gpa_t addr,
 				int len, const void *val)
@@ -72,9 +53,15 @@ static int coalesced_mmio_write(struct kvm_vcpu *vcpu,
 
 	spin_lock(&dev->kvm->ring_lock);
 
+	/*
+	 * last is the index of the entry to fill.  Verify userspace hasn't
+	 * set last to be out of range, and that there is room in the ring.
+	 * Leave one entry free in the ring so that userspace can differentiate
+	 * between an empty ring and a full ring.
+	 */
 	insert = READ_ONCE(ring->last);
-	if (!coalesced_mmio_has_room(dev, insert) ||
-	    insert >= KVM_COALESCED_MMIO_MAX) {
+	if (insert >= KVM_COALESCED_MMIO_MAX ||
+	    (insert + 1) % KVM_COALESCED_MMIO_MAX == READ_ONCE(ring->first)) {
 		spin_unlock(&dev->kvm->ring_lock);
 		return -EOPNOTSUPP;
 	}
-- 
2.46.0.295.g3b9ea8a38a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
