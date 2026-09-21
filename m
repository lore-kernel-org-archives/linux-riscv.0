Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F132C982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ea6cj+wZMf40P5p2dzA4GCq2IjXnzPXC13l66EiFc6c=; b=goVD5E0Qf6RyEB
	QG5F3oK1MqjNGtIqB9TNmePooY4sRG9dLC+En8ExWx6tcd9SeDV2z3FGRHWgcaHyE2rX0yoTtJmD6
	FCJ/dMWxjejcF7UQ7tCGv9npHZLaExxluZq2Lg27TCZ5YwpwjtTyWdFV/nNjvHTqFrzaiHnXm4JT5
	Dh8em5s6J49w9wKxIEE2rFa+eI+OaHGXd6NMUWG47ilMuPx5PBOoiDjC9VTeEHYtw9zH2SXWd51hS
	i9/Kl+StiXw6hE96eTzkojY/pinrE6l65Zu/Jyb3H9v3pyEQb/bs40ENvhiH98umYqOIOCU5a7iEM
	30650BtjHTSgSGAB64jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4Z-000000031g7-34Eo;
	Mon, 21 Sep 2026 17:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4V-000000031cY-3BeM
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hyb3zhkpLvcha2XPZl3y4VqrXuYFCx4NQzeWMijbr/g=; b=NB7AVkYJoYekdLw7mSW6/PGs1I
	g9/aN5P/6jK4YfIggx/Z0M7na5UK6go38jK+XlzFe9F3FApSTaqcvhC54MzD7oKMCOtx7v29vipXB
	xd4EkOEAQ0FoR7LUv1Q8Ksp8gVHrk20J1V63/jdeAXGtyluhpfiaKP9o64Ov1+X+JS81v07VPFfKO
	gn7m8B/fdhl0jwlYQVkZzyGVtLe9vcwZXWyiOW5lZ/9IudRzqpzJGx9+imImA2QPirzEI2G/Q4p0A
	EyNjLrAOfVlAuhqViKoCs/+IHidQGTk+9BnJlt/XqqNgin0T24cIH0WFIFIjPtPFdWaxuBh5pbKEs
	CK4nNmLg==;
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4S-0000000CdoK-2tgB
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:54 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2db87f759c5so62960895ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012690; x=1790617490; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hyb3zhkpLvcha2XPZl3y4VqrXuYFCx4NQzeWMijbr/g=;
        b=o+TSgINKP2JmpZmGlfsVFzzsm7D+NermEnQctPhijMrn5k2d1mqx3YjNEfaqJd0xo2
         /MPdjzabpC28UDWiDtAkBj9p59fj1vE5HfbWkSg715B8KWrZtlFyL2dp/Bb8WVNw4Z9R
         THETFc+AsWGa+V2LsbVGaQnNs2zOtPH0ny15+qxC6SKulyC/O12pFBitlUdpWXSifmEC
         7850rhzqUEaZ2l2Uc5rIS1XqFdK+Ztv6ySHbdRlQ/qmW6a6GhL5CRqC/x8iSUCoGI71a
         Md+Rt+n3NSp+zhlnWXstGXRpy0l2jwTLqs7KIXcjnRliLlWXxiP4d+dQmfNN1Y2hGsCr
         LA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012690; x=1790617490;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hyb3zhkpLvcha2XPZl3y4VqrXuYFCx4NQzeWMijbr/g=;
        b=cuaaEYL+kZtcmnUGMZ+qEPJoJ9QRV/ym+sMkPFhUIL5L7T4xycj9NZze7y+wFrJwc8
         PNFNDP+6x89GuIn6Z+H2EmYVYm+nR5ONhzQAWVVJInNVw8A3Ja+/wL7P73Ue07R0Tb0T
         JlMry/Gio4QWAE7XbntQthosy23gqPhTjhxCpKdrRADnIW4dt5P1+G/1Hsm8HFVam+A1
         W13KCZ9PcBJPqDj8sWR+tFgDYpeT3VfB5irxgXnLi2DJb2qRFDUZVCNs6G0ntZo5rCSa
         3y23ukvq78MBMuGiUa5L6ka4CL6y9cean9cDqJb/qszYRy5He/OYmaT4NO1A5NASL7yb
         f2gA==
X-Forwarded-Encrypted: i=1; AKwUvBxIc/8wRvsmOKVDPVLiRLdkvyrgdvRqCwLeXEiYLHKd6Z242c1r5kQohgaLT4BukoKl+JktY2wZrT43IA==@lists.infradead.org
X-Gm-Message-State: AFuF++md1OjcnFJsP70KyITZDzw+N6uw5dFTWOHX7tR6MU2y440FlL5C
	erL4yuQQ4NpP9BLQ6ji5eaS6iLuEwPs3/yD8jy1wG3JSKJZDk0QjD3/tch6EiXQ9sM1aIU41v1J
	UW5P7KA==
X-Received: from plaq21.prod.google.com ([2002:a17:903:2055:b0:2dd:1daa:a60c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54f:b0:2dd:c053:c207
 with SMTP id d9443c01a7336-2df560d81a4mr14415165ad.35.1790012689572; Mon, 21
 Sep 2026 10:44:49 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:40 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-3-seanjc@google.com>
Subject: [PATCH v2 2/7] KVM: arm64: vgic: Rely on vCPU creation check in
 "trylock all vCPUs"
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
X-CRM114-CacheID: sfid-20260921_184452_856666_9EC9063D 
X-CRM114-Status: GOOD (  12.59  )
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

Now that KVM's APIs for locking all vCPUs return -EBUSY if vCPU creation is
in-progress, drop the manual check for the same from vGIC creation, and
update the comments accordingly.

Note, while KVM arm64 guards many vGIC operations with its arch-specific
config_lock, holding kvm->lock is sufficient to guarantee a stable result
for "is vCPU creation in-progress".  So, no functional change intended.

Note #2, the open coded check in vgic_init() is racy when called without
kvm->lock held, e.g. via vgic_lazy_init().  I.e. that check needs to stay
open coded to avoid triggering a lockdep assert.  Whether or not the race
is "fine" is a problem for a different day.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/vgic/vgic-init.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 4012df6002ea..a58575df36e9 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -97,6 +97,9 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 	/*
 	 *  - Acquiring the vCPU mutex for every *online* vCPU to prevent
 	 *    concurrent vCPU ioctls for vCPUs already visible to userspace.
+	 *    This also ensures KVM isn't in the middle of creating a vCPU,
+	 *    i.e. that there are no vCPUs that have been created but aren't
+	 *    yet fully online.
 	 */
 	ret = -EBUSY;
 	if (kvm_trylock_all_vcpus(kvm))
@@ -105,18 +108,11 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 	/*
 	 *  - Taking the config_lock which protects VGIC data structures such
 	 *    as the per-vCPU arrays of private IRQs (SGIs, PPIs).
-	 */
-	mutex_lock(&kvm->arch.config_lock);
-
-	/*
-	 * - Bailing on the entire thing if a vCPU is in the middle of creation,
-	 *   dropped the kvm->lock, but hasn't reached kvm_arch_vcpu_create().
 	 *
 	 * The whole combination of this guarantees that no vCPU can get into
 	 * KVM with a VGIC configuration inconsistent with the VM's VGIC.
 	 */
-	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus))
-		goto out_unlock;
+	mutex_lock(&kvm->arch.config_lock);
 
 	if (irqchip_in_kernel(kvm)) {
 		ret = -EEXIST;
-- 
2.55.0.1082.g2b9226bbc0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
