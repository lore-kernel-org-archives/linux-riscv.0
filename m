Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1A60A3827
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dd5WdH30;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d31qrwmQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IAD244sLIgfIHsEtBdYsmGZvWy73e+xSvQmHY3OqebY=; b=Dd5WdH30lHL0eaZcgNoHcdV1Td
	ts0VaVIkO2/YtBGEkamTNYEFk99N7A/rxBTVsbrTUpF//nJODT2ULC30RzBVmMVXrlhX0xBH/Kk8a
	0bKMBprLoCOpntZEyUFE71rPN8/7mDIaBUqusCh5TJrQOLs+VuVY6kX3Gz7XINPizdYnMZ04J2F+R
	B86c2S11wo/HcR8yIIhASTOU6ZAZGtboUJ7wOMzmgNdKQ0J7CHoRlQuapYzCzrMOXiiqDdzXrZCF3
	7etoHRe+EGUpjZnM/VLcu7mWf7KQahoivuyujBcJ0G+qm9k8vwXEV0W6FRM+wb7oXlfn/2tkxOv8I
	E9jvTghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnP7-00000004JHk-1Ofe;
	Tue, 10 Nov 2026 15:04:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnP5-00000004JHc-3lIb
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 15:04:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CBFF469A6;
	Tue, 10 Nov 2026 15:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004E1F00935;
	Tue, 10 Nov 2026 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323095;
	bh=I9eNLNHnnsZymMi+Ov7Sf3KUgE/w+/e3nuXMzPXdo7A=;
	h=From:Date:Subject:To:Cc;
	b=d31qrwmQaRvK/ADa3U0zOM+VzAuREe6D7CuqyI4wn7eIoIWsiJowlhGpP1tO7EC4l
	 OtPyU6NlkxUOon36x2BTMdPqIzkLQLvwU7+G+n8ljd32Nf3/cpnLsa4l8zIjFKm1h8
	 2Xavaph0dvYw0BhpbsOXHGDhufOvzQ9FSM+5iaPR/0TjD9LSDUoOBo/zMYa006tKIC
	 /9EaTGMhaDfCGx4P5AZ0SKp4ow5rzMwxXkoSrUQ+riWDCT/SIrlzKjmf7TEs5El0d7
	 BKxdId7pwoQ8E4CbbdSh+O5RRcJIpOiTxFrTxDkIDmMDdhfEYJ6TTXzrx5vplGxAo/
	 7BbdJ4q5ADu7g==
From: Troy Mitchell <troy@kernel.org>
Date: Tue, 10 Nov 2026 15:04:49 +0000
Subject: [PATCH] riscv: pci: allow write-combining mmap of PCI BARs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-riscv-pci-mmap-wc-v1-1-1d16fb8c74b4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQBGLRq0gXdhztCNGQaVUQ7
 260y7f4fwflJKxQFzskXkRlnjLsowD6tNPAKF02OONKa02FSZQWjCQYQhtxJex9yeTZOu+fkLu
 YuJftfjavv/X3Hpm+1wiO4wRWHpRMdQAAAA==
X-Change-ID: 20261109-riscv-pci-mmap-wc-f56ec5e12557
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=troy@kernel.org;
 h=from:subject:message-id; bh=zLbxZxQzl4eEu3cEA0QdNlkw29aWNgLaoGnwM3MjuRo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfjSYr3/vT7b2Vx/M5zybhwAlvXRbflziZe8te7cLir
 Oh39+WUO0pZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACain8fIcOGk9F7D4uKJpvd1
 nRQN5nXeFe263eB+dB5Dc1zQxcU2FowMy839/okaxyetu9Y544GP4cPoR3UW74WPnzA+rT1R2nc
 HPwA=
X-Developer-Key: i=troy@kernel.org; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Define arch_can_pci_mmap_wc() for RISC-V, so that the PCI core can
create resourceN_wc in sysfs for prefetchable BARs. Without it, the only
sysfs mapping of such a BAR is resourceN, which uses pgprot_device():
with Svpbmt or XTheadMae that is the IO memory type, where every access
is strongly ordered and nothing is merged.

resourceN_wc is mapped with pgprot_writecombine(), which selects the NC
memory type when the kernel uses Svpbmt or XTheadMae. Without either,
_PAGE_NOCACHE is 0 and pgprot_writecombine() changes nothing, so
resourceN_wc would get the same PMA-defined attributes as resourceN and
no write-combining at all. Make arch_can_pci_mmap_wc() true only when
_PAGE_NOCACHE is non-zero. On 64-bit this is a runtime check, as
_PAGE_NOCACHE is chosen at boot from the CPU extensions; on 32-bit it is
always 0, so nothing changes there.

Signed-off-by: Troy Mitchell <troy@kernel.org>
---
 arch/riscv/include/asm/pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index b2f91abebd61..2b2db5533576 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 
@@ -32,6 +33,14 @@ static inline int pcibus_to_node(struct pci_bus *bus)
 #endif
 #endif /* defined(CONFIG_PCI) && defined(CONFIG_NUMA) */
 
+/*
+ * resourceN_wc is mapped with pgprot_writecombine(), which gives the NC
+ * memory type only with Svpbmt or XTheadMae. With neither it changes
+ * nothing and resourceN_wc would be no different from resourceN, so only
+ * offer WC mmap when there is an NC type to use.
+ */
+#define arch_can_pci_mmap_wc()	(_PAGE_NOCACHE != 0)
+
 /* Generic PCI */
 #include <asm-generic/pci.h>
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-riscv-pci-mmap-wc-f56ec5e12557

Best regards,
--  
Troy Mitchell <troy@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
