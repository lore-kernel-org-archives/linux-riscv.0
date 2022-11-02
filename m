Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D45C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsSDFcj7CIfJ75zTM9aMS3odVqyxBPuXjv7q6jTjBJE=; b=DencqqG/fWWWXK
	atZeXR7vpzlTgSQTMRVwl6awjCT9CGxgVyrPJuTbCFVeUw676eO4amwo3DS+mRFYmSYh1N/38V+IQ
	NUz/YsxyidgS6GYQx4AzhjJXQRHCCu7LLURgbG4BRoc4e7K445YKJJZE1TZMMez5AkihEx7uctDj4
	fSpIQ2uGgpxfsLhkacCsI9cMMpjfU2jU9/b5HHDsgQxTldCMQbocJ6EjVdG05/mu856IHIpeQ7nJb
	xoUf42/IreoADvoApeSBUAH15BX/dMKgMnJ2lYD7LBWNyVV86wMgBTXzbd+EDz5wCT13EBK4R7/mK
	tJS3XXl2IggpYXAZS8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqOEx-00FNM5-3F; Thu, 03 Nov 2022 00:37:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO6E-00FJ6v-NN
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pp3PbLfGlbPMUpUfY94YYIKSvd3QEyEjimXY5GHh7Do=; b=bYLaPxjIOMtXdCSEiMbJHX8tqN
	xlmcvX71gGylnA5boq/oIRjXAm/ZO7Vlj4Wx+UVhKOkI/wBMXYTe8yqnk887b4XGok40WSeEkFsQs
	7Url/Ki471hQfVyiBIGq56VjDhxegKn8u5fxncVBFBy6e88yqe0M79Dv8SMUcPRlN8tuATK7X0jaT
	dtORIaD5528bvHsHwcmphiM9nKRIKI1/l9JzIir+VR5WhSe/4TnicvCWnMCwxwlQWHmbF3bpHiyJX
	SBi18W6aPgebvyPBEsstyo1Bwkkl4AqoG528TV9Uy5xfSetG5QJAx7saGuR2HBrLfwZhPd1qn3YkI
	IACvZvzQ==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN15-008Wsq-9P
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:30 +0000
Received: by mail-pg1-x549.google.com with SMTP id p18-20020a63e652000000b0046b27534651so82515pgj.17
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp3PbLfGlbPMUpUfY94YYIKSvd3QEyEjimXY5GHh7Do=;
        b=UkZGnXGmq2elzgV9DLUz74QXF30iTWbFGDiWfdaXhQTrFX8aiqCFVBpq5xcu6/5CJ0
         6CAeS4zBndyLbi6uL4aOTOJPom/GUXPjp+wnaiLNi/IOKHaUUiAdDM0lQqJcKi8lJ3vx
         vnARJXxit3idHJ3CVkd3Epv6mh/Uh5po1QC+vmSMzcdxDA+trq8VPV/HTVpleuhXsuBJ
         gB5evBsfkJOotXoUamKJrE8Yp7t9k0CZooSYyZMUGEw+wssTud1LYZ35nFOFQX6SsKf7
         8kThfTBVhIqoMM2+KcJViQg4ABdkLDTwvbAbS0YvwKJ8JO2nHVa2hjZQKtmcKqW09CRW
         6M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp3PbLfGlbPMUpUfY94YYIKSvd3QEyEjimXY5GHh7Do=;
        b=mQdvyeB6PrE/6Vl/BWmwcgkxNH+1CLb9ugFWQ/S98Sjz+FKKA9TZeOxYhbsFe//5EN
         BG/4QKaB6gHMv+In6DjbbfIzF1bjEgFy1kYYgpyO19UzO3JN2FnLkjTmn/cU1/y3oE3I
         b3gk+I+H0vxCNxMcUjENdklB9dDT7EAKsplC/AymACu9N4oWieyKYRmXv7QbW0mJcIhf
         Syv3kaphgJW+Oc1n7I6OrCsWGnl4JXh99pD85nRscIIDseD1ehonU24hZByH14r0SOBr
         QvpGTffd6dZczucHgXm9mIKktBnv5K3WuVz//5mx9D1aX0VS15+mRyhGfmvgpElVAQ2k
         6fWQ==
X-Gm-Message-State: ACrzQf1bZArK2A+0WOR2PxVRvdJgjKmGh7NM3v/Bs1kVWfclDUAYfqRN
	7/z7SlLljnnc4/c37PjlDQTFDrh84Is=
X-Google-Smtp-Source: AMsMyM5BN48AgcZOI4nVxc2uFg8TXUQwjAkA5TEHVSI5KiQDtZoUe78o5/c87/pf9J/oxQANcuw7e+pFPCs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:1206:0:b0:470:18c:1489 with SMTP id
 h6-20020a631206000000b00470018c1489mr6904894pgl.357.1667431164538; Wed, 02
 Nov 2022 16:19:24 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:33 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-7-seanjc@google.com>
Subject: [PATCH 06/44] KVM: s390: Move hardware setup/unsetup to init/exit
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_231927_548779_86BA96CB 
X-CRM114-Status: GOOD (  10.21  )
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

Now that kvm_arch_hardware_setup() is called immediately after
kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
kvm_arch_{init,exit}() as a step towards dropping one of the hooks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 8395433a79b2..1aaee15211f2 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -323,21 +323,12 @@ static struct notifier_block kvm_clock_notifier = {
 
 int kvm_arch_hardware_setup(void *opaque)
 {
-	gmap_notifier.notifier_call = kvm_gmap_notifier;
-	gmap_register_pte_notifier(&gmap_notifier);
-	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
-	gmap_register_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
-				       &kvm_clock_notifier);
 	return 0;
 }
 
 void kvm_arch_hardware_unsetup(void)
 {
-	gmap_unregister_pte_notifier(&gmap_notifier);
-	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
-					 &kvm_clock_notifier);
+
 }
 
 static void allow_cpu_feat(unsigned long nr)
@@ -517,6 +508,13 @@ int kvm_arch_init(void *opaque)
 	if (rc)
 		goto err_gib;
 
+	gmap_notifier.notifier_call = kvm_gmap_notifier;
+	gmap_register_pte_notifier(&gmap_notifier);
+	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
+	gmap_register_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
+				       &kvm_clock_notifier);
+
 	return 0;
 
 err_gib:
@@ -533,6 +531,11 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	gmap_unregister_pte_notifier(&gmap_notifier);
+	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
+					 &kvm_clock_notifier);
+
 	kvm_s390_gib_destroy();
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
 		kvm_s390_pci_exit();
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
