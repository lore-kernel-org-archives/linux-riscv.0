Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB08CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTxA8/wIGxvBTaa32AersoQOho2YW+4Y38dtiSPC14E=; b=oiNeuN+rg6QWUI
	AIq14zoAPFywTqZWzqEONlsG/rsPbACvxCTtuTOYCuyTnB4D5wWZ+ZhbOvR/LGTYazbLGybOOmLS+
	gbCExHhyJFaP8qSOVKu1X35Drn1uLRBAj1mNIL6ZBmJSNu2azeRP7tJR+VUzriupaEPHPqH4zJ+Sw
	mtlzzL/N+IztkNgG9etsCgxWQ7OuNHhTlYRJ3GPNoEJ7VNP+dCFmW6v1tHGcALCMA35I81iCW56PS
	IQwu6M3KQ4EK8cKycyPPhUUoGiCc4+1Ij8nUbQuoaHlApPUSWL66J3Ahb566yQcXdw3Oyx1bEhMto
	uMyjCNubiM70UyWGZFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvD-00000004BgA-0CQq;
	Sat, 23 Aug 2025 06:40:15 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-00000003CVw-2Q2u
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w07fWnG1K0Gryl5GMhz7Hm8TVCp6AISzSEimVrkw/Wk=; b=BPdkCBxK9aPaOkhvuHkNDrTOIE
	+63b7lCLeH+6ith3duc9oeD+bGg4e0N9vrBnDCOgt65QHmcNhmHiA7DX0XmVF7ylg0CiYmAtphMJH
	FUPKhmF87N/QUnuFVeo6JZdOAPtPqIahIOnYYyGcG+qaaBP6J0qdOn81dIeiT8Czc6Pz0gziANOQs
	BFznf5JxeTSt4B15QMleYNyvwxLCCOSX/JDjz+P4GgwShMAu7QIYfT7haKrFbmC98W88A5KrgILUX
	QlOkY1XOWmMwB5axtvbCXF/7jXAcpziOIf/fIBX7WJwR3exvmUf8H57hsCU0sfk53nYEjIiRLasM4
	h8Bpms1w==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NH4-Ls; Fri, 22 Aug 2025 17:52:51 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPz-3H2J;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 16/18] KVM: riscv: add hstatus to allow endian control
Date: Fri, 22 Aug 2025 17:52:46 +0100
Message-Id: <20250822165248.289802-17-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095258_630640_1C5066C1 
X-CRM114-Status: GOOD (  11.54  )
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

---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da1..4cec75665f55 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -81,6 +81,7 @@ struct kvm_riscv_csr {
 	unsigned long satp;
 	unsigned long scounteren;
 	unsigned long senvcfg;
+	unsigned long hstatus;
 };
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f..25c1e43f80bc 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -484,6 +484,7 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 					  unsigned long reg_num,
 					  unsigned long *out_val)
 {
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
@@ -493,6 +494,8 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
 		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
 		*out_val |= csr->hvip & ~IRQ_LOCAL_MASK;
+	} else if (reg_num == KVM_REG_RISCV_CSR_REG(hstatus)) {
+		*out_val = cntx->hstatus;
 	} else
 		*out_val = ((unsigned long *)csr)[reg_num];
 
@@ -503,6 +506,7 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 					  unsigned long reg_num,
 					  unsigned long reg_val)
 {
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
@@ -511,6 +515,11 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		reg_val &= VSIP_VALID_MASK;
 		reg_val <<= VSIP_TO_HVIP_SHIFT;
+	} else if (reg_num == KVM_REG_RISCV_CSR_REG(hstatus)) {
+		/* for now only allow the S level endianness */
+		cntx->hstatus &= ~HSTATUS_VSBE;
+		cntx->hstatus |= reg_val & HSTATUS_VSBE;
+		return 0;
 	}
 
 	((unsigned long *)csr)[reg_num] = reg_val;
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
