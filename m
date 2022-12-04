Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89142C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Usn126JrlHH5LwHGWDLqBhARYko1GdpNfBlYue1CopI=; b=3EKEeyFPhfgelw
	P2UUfUXqSax8INnZdCf2erO2oAs0cyDl0y677TxTVtyLi2MCoyt60Kf9fJ3j/afCwA67JnS3vmCua
	MlqBut5HabNXdIXZDtLGvRkDOVSlITCpHYu3Ed14UjKrFz37/6yjpRfzdlOkAeWmZhdAx+lZVZvwN
	lHjaj913TKNzCf05HmlvQ4rlzb4rfxveIMPKK3G5RhG2ZjTSTn+5oC6xpZtM3i4yPc8Phjk7WmRDd
	10t5lvdLeEoqIriRlXCzMxP99uPlUmtII4UAGhdbrcBeNGVv7GAu74WS7vJXIArPss/Ey3bsuGdQg
	MkpUJZcx8dOD3Dw/GLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHr-00A7gu-Fn; Sun, 04 Dec 2022 18:00:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tER-00A6fK-UE; Sun, 04 Dec 2022 17:56:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8763260ECE;
	Sun,  4 Dec 2022 17:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10D7C433D6;
	Sun,  4 Dec 2022 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176611;
	bh=sX7eLjihdTEqkiDlYvFCMfPbXYIdW7Xa2twESHG3S88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A/2ud02wVj3AntrLDgXV0TMafTMGjJrHrjz5M4xq+uqbVe/3omaXZ1udWvlW9BlZ6
	 PAsPswuWOvZCfFNV51kdLJhjjbzbfAGbCVA/v69EBkbq4RVACpxzWdQfvl0qAV+Wrn
	 lMtZplOrd4VdW/VMlBEDQoUrj+w8U06eYf3ILjqtUwn1BfR3fG4u6uXEZndvhD5Qlf
	 eSMasLReRUDLwGVhKMuGcO9aOCVzZUdeGpVO3zLq81Qg7vLiQt6tmfdAAoFd8kC9Lt
	 STVfGVxOH//GN9xM6onwtQwRbYrhwZjMjHU7BowoE6fudNHf4jIatgeaNoJukKyeJp
	 HNxCB0PN8Vzwg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 08/13] riscv: module: move find_section to module.h
Date: Mon,  5 Dec 2022 01:46:27 +0800
Message-Id: <20221204174632.3677-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095652_084866_680501FF 
X-CRM114-Status: GOOD (  10.77  )
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

Move it to the header so that the implementation can be shared
by the alternatives code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/module.h | 15 +++++++++++++++
 arch/riscv/kernel/module.c      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 76aa96a9fc08..78722a79fc59 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -111,4 +111,19 @@ static inline struct plt_entry *get_plt_entry(unsigned long val,
 
 #endif /* CONFIG_MODULE_SECTIONS */
 
+static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
+					   const Elf_Shdr *sechdrs,
+					   const char *name)
+{
+	const Elf_Shdr *s, *se;
+	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+
+	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
+		if (strcmp(name, secstrs + s->sh_name) == 0)
+			return s;
+	}
+
+	return NULL;
+}
+
 #endif /* _ASM_RISCV_MODULE_H */
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 91fe16bfaa07..76f4b9c2ec5b 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -429,21 +429,6 @@ void *module_alloc(unsigned long size)
 }
 #endif
 
-static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
-				    const Elf_Shdr *sechdrs,
-				    const char *name)
-{
-	const Elf_Shdr *s, *se;
-	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
-
-	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
-		if (strcmp(name, secstrs + s->sh_name) == 0)
-			return s;
-	}
-
-	return NULL;
-}
-
 int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
