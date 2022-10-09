Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53006C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 08:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3BNLnrkWIMBYgoDf3wB4Z2+YbexefmdRhQtdtJLdKE=; b=3c3VwNfff/UCZB
	ctKNi4olsrquSFDc677qlBXcstx/QTHDfpwMMLDMmYJIG8PY7f7yWlH8hn4uUS01dQ8VcPaEqdAGR
	kWsDuEWlx9uY9kTIU7NiJfrvdfFqeuN2bmC6VfXcTSPbezZjpzJsLQH5yA5MnatcWMikyMMDn4X6t
	U4jlb+BbsAqaNladZ1HHgceQdGBH/r6inzuVgczu9KU1uBd0GUU8Y59wpaZ08DheMZyFpbaL3EPDs
	cck/FSbBUPiWz5TzLLKgn38ewE/CGxKmse6x4UIICErUqnAJyoRI53K08qAlW5TBioSvUiAvQQgzi
	xO6E2w/QO02+BeJF1rKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohRiR-00FCDL-T2; Sun, 09 Oct 2022 08:31:19 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohRiO-00FCCl-Dj
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 08:31:19 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn13TEhkJjUWXsAw--.35583S2;
	Sun, 09 Oct 2022 16:31:00 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: atishp@atishpatra.org
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
Date: Sun,  9 Oct 2022 16:30:50 +0800
Message-Id: <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
References: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn13TEhkJjUWXsAw--.35583S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4xZw4DJrykGF1rCF13twb_yoW8Cr1xp3
	yDGFWvvr4Ivw1kZF1fK3s8ur15t3Zaga4SgryUtanxJF13Wr4vv3yq934kur18WF18tFyF
	yws5tFy3uw4kJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwAKzVCY07xG64k0F24lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjfUnfOzDUUUU
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgAODGNBi9F-hAABsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_013116_872356_7380F194 
X-CRM114-Status: GOOD (  10.88  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

Hi Atish,

It seems that the panic is due to the missing memcpy during kasan_init.
Could you please check whether this patch is helpful?

When doing kasan_populate, the new allocated base_pud/base_p4d should
contain kasan_early_shadow_{pud, p4d}'s content. Add the missing memcpy
to avoid page fault when read/write kasan shadow region.

Tested on:
 - qemu with sv57 and CONFIG_KASAN on.
 - qemu with sv48 and CONFIG_KASAN on.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
---
 arch/riscv/mm/kasan_init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index a22e418dbd82..e1226709490f 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -113,6 +113,8 @@ static void __init kasan_populate_pud(pgd_t *pgd,
 		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
 	} else if (pgd_none(*pgd)) {
 		base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
+		memcpy(base_pud, (void *)kasan_early_shadow_pud,
+			sizeof(pud_t) * PTRS_PER_PUD);
 	} else {
 		base_pud = (pud_t *)pgd_page_vaddr(*pgd);
 		if (base_pud == lm_alias(kasan_early_shadow_pud)) {
@@ -173,8 +175,11 @@ static void __init kasan_populate_p4d(pgd_t *pgd,
 		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
 	} else {
 		base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
-		if (base_p4d == lm_alias(kasan_early_shadow_p4d))
+		if (base_p4d == lm_alias(kasan_early_shadow_p4d)) {
 			base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
+			memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
+				sizeof(p4d_t) * PTRS_PER_P4D);
+		}
 	}
 
 	p4dp = base_p4d + p4d_index(vaddr);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
