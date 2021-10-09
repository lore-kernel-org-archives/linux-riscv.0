Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19F9C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:29:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC2560F94
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFC2560F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DTTxoSosVm02IOAidImus5JG0ChDJe3d4ME5OAN7qc=; b=EtFd71I/xwb0hP
	RFe6ZNqaUJC3syxa9vxJTaOXTxnTBUv8UJx2W8SxlivtjpiTEuQ10EqUQI6jyOAMPBIT+rUvmE6AB
	BVzs8HzuI90Nt9cvRpwqNHv8tyAjN4jTEfHioQzuNUyPMmsBRGrBLsMN9h/aRAyQG+S8ed0oe39Yf
	jARG4exDKFKH75OAmD1YXWaDrUbmgNtxiy8c/9qivK39QLUjQXPAAd/8SiYz2Xmo6JVuFDSnnIjo8
	HpZ5fAEbBIo0Ze7z2cTL4ApG3Dd+ZFODpfpxEWNIKQ+0orb9RIu84hvM+XqMa8izWSJzev6TKmdwG
	NhuaFC1VpmiR+Z83lfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ26l-004b73-DG; Sat, 09 Oct 2021 02:29:07 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rZ-004U9T-Ee
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:27 +0000
Received: by mail-qv1-xf49.google.com with SMTP id
 u9-20020a0cf889000000b003834c01c6e8so3141252qvn.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=w/H4oIWp6aPNo76SoohcXjeRifcTKNkaEcXswmTfvS8=;
 b=Awo1FqukPn/eCDkoZYrOLJ78QMIWErLo3T1JPAM+azHfyRwj0C0I0SMNEn5GIB2txU
 M8xcuGBE4Pj+vf0eSl8CB+c5E5sQbuIMe89aP9EQE621aganA5V6HDgjMAcaBpBwJFVX
 C3SGKwbSwf16LR8Vkae/cgYp5NG8CH1ijTNN50Rr4HoNERkD2EJxcY2vp85daVtbnuQv
 ioYQxPegF+Cfcf+3bUPz5AVa6rlii3Hi3Y38Qqp1tDmmH+PsFzX9zPNBKfVsQyV5sVUN
 4rGOba9XFbRiNbe1iaNvpJun8hhwygJEEzJPw9IjWbImWyRqKAUCmWW3EdcHL3Zmyd05
 +drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=w/H4oIWp6aPNo76SoohcXjeRifcTKNkaEcXswmTfvS8=;
 b=t8qS1L/DAl5mvteTjDytJjcrPIF+WEAZIn11fPIY39eQvume2cbKm1UIxZACmnXtLu
 vytK6niwaQoIN6U5LJnNs0GPh8y+q62h5M8W084NfXW5n4p84whRoEd13iW2sZWu+kgi
 8aBIsLsIfmX12HY34Qy47ZIHolRZqdbiX97+CkQEGjrodtwHCHwcL5xX23zXRmiBUaOP
 0EbEnzjJsju5ZEHigHL96wijxQp9Mbaiz/wiKgnaDkAl5JTGmrlyK9CyXS8jV7G5BKIf
 k7dMSHBYfx+2gfy5Tw4vk3Zq1q3mQ5u0sYX16Rd7emR3LLt71YdX+Os6r3AID8MeW4fS
 MgQw==
X-Gm-Message-State: AOAM53386M8u3AyARstzlESiIsCtFyKhmKDJL6VMDeucjce7cVhsgnG7
 mzfmmjbmBau7F2qehlaNzKlQMBsPM9c=
X-Google-Smtp-Source: ABdhPJxfQ527bwjQfHI3Ui/hfU27INsXtrHgzCKRUD4Jie98v/tpcQf1vSHG80RTY51lGOqh4HTdLuZNSsA=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:4b57:: with SMTP id
 e23mr1849346qts.328.1633745603486; 
 Fri, 08 Oct 2021 19:13:23 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:10 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-18-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 17/43] KVM: x86: Directly block (instead of "halting")
 UNINITIALIZED vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191325_528758_05905786 
X-CRM114-Status: GOOD (  10.52  )
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

Go directly to kvm_vcpu_block() when handling the case where userspace
attempts to run an UNINITIALIZED vCPU.  The vCPU is not halted, nor is it
likely that halt-polling will be successful in this case.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e6c17bbed25c..cd51f100e906 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10133,7 +10133,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			r = -EINTR;
 			goto out;
 		}
-		kvm_vcpu_halt(vcpu);
+		kvm_vcpu_block(vcpu);
 		if (kvm_apic_accept_events(vcpu) < 0) {
 			r = 0;
 			goto out;
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
