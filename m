Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4742C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Jnv9d8jWRo7JWEBn2Kx75YYhWLiD3fPSNE7xED06Dg=; b=IxaHmySQ4xd1P7
	3of31B79wrZgPvncX34l67vYmbqh4lXFgzobzoirQ2lC1saJvxL+CrfJ81QzoeMRUD/8v7Vvr2d/l
	rFPTIbecFwPman1CqOKqsVF4b8vYChcejvx+oMUDndlbHY+ZGYI6ckZlSWBeBAyodakG/OAVZrbfX
	iy57Ba1wy9UTjvTQqNwkigo3BH7SPvkJOma2DLN9DNu//67aiiwiL26vdfbt6ppBNCd1E2cnVliz2
	QkexcD96XbOIl61DEI2MTODrM9Pg0c64FRajZfKclhDtBkVZP8JBI+/M17hxyJCGJE28uL4+0fh2f
	7sN0Crw3hR/HLVKKO3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwI2k-00EAq0-Hr; Wed, 01 Jun 2022 06:41:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwI2f-00EAlQ-NH; Wed, 01 Jun 2022 06:41:19 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LCffC34bpzjX9f;
	Wed,  1 Jun 2022 14:40:19 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 1 Jun
 2022 14:41:09 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <rdunlap@infradead.org>, <palmer@rivosinc.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ebiederm@xmission.com>,
	<kexec@lists.infradead.org>, <linux-next@vger.kernel.org>
Subject: [PATCH] RISCV: kexec: Fix build error without CONFIG_MODULES
Date: Wed, 1 Jun 2022 14:39:24 +0800
Message-ID: <20220601063924.13037-1-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_234117_960737_624B96A3 
X-CRM114-Status: UNSURE (   8.49  )
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

When CONFIG_MODULES is not set/enabled:

../arch/riscv/kernel/elf_kexec.c:353:9: error: unknown type name 'Elf_Rela'; did you mean 'Elf64_Rela'?
  353 |         Elf_Rela *relas;
      |         ^~~~~~~~
      |         Elf64_Rela

Replace Elf_Rela by Elf64_Rela to avoid relying on CONFIG_MODULES.

Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>
---
 arch/riscv/kernel/elf_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 9cb85095fd45..0cb94992c15b 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -349,7 +349,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 {
 	const char *strtab, *name, *shstrtab;
 	const Elf_Shdr *sechdrs;
-	Elf_Rela *relas;
+	Elf64_Rela *relas;
 	int i, r_type;
 
 	/* String & section header string table */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
