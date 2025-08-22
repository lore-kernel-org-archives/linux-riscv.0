Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A67CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QDSqTBx0tUTqyT3yKzab15Ygq6j+VgdZgyORRbibS4=; b=RSmw9c6m/oTjOm
	1ds9O5BYPaQVi7ei4Yo76rY8s5O712wulqBPsamtDv5VyeCXyDO18hMo36xLal+r0W7Ae5sUID2d/
	ckkzbrwkUj55aSxS/DvQYEDgK+glHb7MQsQ1RCwY5vCF5Rb3mwkqE/B4hLzu1yDFFiteXMwfAmLm5
	yfic+HTV7htb7bG/bzbpfsTcWO5OFgYs+W7y3oYkFUrLL8j3tE1sTE6AXsuiMywU3TzZeCal7QRZg
	FoMHlPqYeB7P8jyY9exYRmGNMLRi+sD1huSsV2DIl0UnXQvm9SVrs+T+dXRMmwqlpDmDkgzZ5Z+3r
	+S2SQa656509Rj0BrspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvR-00000004BwS-2Tlj;
	Sat, 23 Aug 2025 06:40:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0h-00000003CZO-1I8Y
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tAcMXOZCiuNSewhMcqMsqvIp8GhUHazR5B2P52Io8Pk=; b=A9I6B8I3JU4Crxx3KfoEjsojhb
	SVeQdDN9F1IuzF174TnD65fmHdrLFSVqoBerT6Y4Ro1FUqALxPAU8lvle8CsQshdtOBvaeCgv4zAy
	s8DHX2xwGCGRq+vhlj8gHYOphjXh5W7oiDymXggfFJdGoKn0Y2AmUgI7tQ2RMm93gzjbMRR2TF8fX
	tZUpAA4pzoAxuBqDiADM8LhJ566PP3Ynqc8TmJ1bXzjz9F0jMq3+hfSsb8clTKzWHTzNTgQRDhODl
	Py8Td1EhwjTk5OywtxIQrsSAu3R3HUCQUscD+FZ6x4n/Vz1OPlxVL8iYJOa4o42IAYK7rP+yfDtNp
	IO/+dQGg==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s7-02Dr
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tAcMXOZCiuNSewhMcqMsqvIp8GhUHazR5B2P52Io8Pk=; b=cbAr7iHPdfN0ye+hkLzefwamwH
	vuqcFAk0+oADlOEuXVjFzJ6BcI8/MHvXIm37XevzW+F0oxuHa2MAplH5gVmOlOKIFWxuafpOf5eeg
	R0z3d8vv8cNMtBQp8FS0OG6VNgd/NxKS6ss5P1VUQ3j2fDgwH9eIrq7RGjPIF9B5sIVbySL/fgkRc
	N76gCAdT63Agu9lQFZU3rTBoXzNRYd4xTyqAVw8PQ+/tG+Oseqa212yRicZa8AR9lJ1d+c0zVTdsG
	ovz7th2ffZpVhJK2GY3mnQu3/RPtI1OVQfmALiWZqE7D1P4p2yCK3YFh1/AGr/DBzmT7zmNhh8Eml
	qiZO4Gew==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-0015cq-5o; Fri, 22 Aug 2025 17:52:51 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DQ3-3N2F;
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
Subject: [PATCH 17/18] KVM: riscv: instructions are little endian
Date: Fri, 22 Aug 2025 17:52:47 +0100
Message-Id: <20250822165248.289802-18-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_248270_0350DCCF 
X-CRM114-Status: UNSURE (   7.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The instructions are always little endian, so ensure the
correct instruction endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kvm/vcpu_insn.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..b1edc7b10d7a 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -453,6 +453,8 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 				return 1;
 			}
+
+			insn = le32_to_cpu(insn);
 		}
 		if (INSN_IS_16BIT(insn))
 			return truly_illegal_insn(vcpu, run, insn);
@@ -509,6 +511,8 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 			return 1;
 		}
+
+		insn = le32_to_cpu(insn);
 		insn_len = INSN_LEN(insn);
 	}
 
@@ -635,6 +639,8 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 			return 1;
 		}
+
+		insn = le32_to_cpu(insn);
 		insn_len = INSN_LEN(insn);
 	}
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
