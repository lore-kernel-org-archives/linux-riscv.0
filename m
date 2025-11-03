Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C8FCCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LZn99B6CKWY9hMRbol4PuwY8J/au4shGfUfzuQZj3k4=; b=G5xHJDBxUn3HKG
	cYjq0ceVMBkdbv0ySQuWFKKqPbqxaScRDgkZ0siHltdPt6HJu8YJQma8ieccd9ZwgFsJguodpki2I
	MFGfhEr9VXsDGZyQMfueH85DvbiD5hjWfeXxYf+lch/QPgBEB/fjHk/gDEr314hn4tYGyFNxhfB9c
	NX7mRvncD/15OCnAkP+UZeUdf8C8jzRV3eEw+T2j9kMzGo2aBcCTmfC4aZUpS1AxSuUI3B9TDGDkY
	6l3xQQz1uJ69PX1mDB5UvhHJSTiES609PpIFuJeYSoCmUsmZwOH+ZBDYFyaV097UHMAFtNyjAKTwi
	4La3VnizWE5/rZ2SH5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw8L-0000000A4vf-0ufd;
	Mon, 03 Nov 2025 15:06:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw8J-0000000A4vF-2Qmp
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 15:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADBEC6013E;
	Mon,  3 Nov 2025 15:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5616BC4CEE7;
	Mon,  3 Nov 2025 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182370;
	bh=baDm2VqEOdN0jCEUpzXO5wRW1mZqbENh2wIatZtOiw0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=V0jXFkQgg79lri4jgYsr6IJS4cDNC+4iCc68w0O/pp9woomcRJxiDEMGvpo1hQmUR
	 YPbfjuYCcbxwyeufHBCvq4In1xAgWZMzH//6kPA6RLjWOVXd+jvI+br0txPreWdh7C
	 KRawP8fGjhYZepRnqBPwT5cZEOxvcMDRUBg9tk5CeCzSc745JYWP7Wgzr+UUEpVkO0
	 YF1FlNnAFCItQCia2HdwlCOvmEPjezWpUAAMHRNsYVyvM832uMKd1pEKf5yF1Q6Z45
	 nsUV6IH/pGJhpfg4/mi4I+eiNyT/EjiUUyehDeb8xkDmdua/hgcc07a2+EveFEK96b
	 l+Dgkt07O2VFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465E3CCFA06;
	Mon,  3 Nov 2025 15:06:10 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 03 Nov 2025 16:05:48 +0100
Subject: [PATCH] riscv: Update MIPS vendor id to 0x127.
MIME-Version: 1.0
Message-Id: <20251103-mips-vendorid-v1-1-4fcb5f4d53fe@htecgroup.com>
X-B4-Tracking: v=1; b=H4sIAMvECGkC/x2MQQqAIBBFryKzbkCNCLpKtJAcaxapKEgg3r2h1
 eM9+L9DpcJUYVMdCjWunKKImRSct4sXIXtxsNouRs8GH84VG0WfCnv0QaIjgVlBNrlQ4Pf/248
 xPmYzIjhfAAAA
X-Change-ID: 20251031-mips-vendorid-df103aedf117
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chao-ying Fu <cfu@wavecomp.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762182369; l=1072;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=3SOEHxo/iLuGukJm8WAmBVDY7Kaj7mnCfvYaKbPje/c=;
 b=4Kkbdn4PPtXv972XSyF6kf21wrzTj1bJorDUmNmTyjB4IwTbb7oxuMvedD8ZLszZ2g9Nqoo7u
 scJ+8ITMU60CBZIIxKx9oqKbZ2ibIQMpBlaBbdfTKqGsbYUHHuWe1DK
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Chao-ying Fu <cfu@wavecomp.com>

[1] defines MIPS vendor id as 0x127.

[1] https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Reference_Manual_Rev1.84_5-31-2025.pdf

Fixes: a8fed1bc03ace27902338e4f0d318335883ac847 ("riscv: Add xmipsexectl as a vendor extension")
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/include/asm/vendorid_list.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 3b09874d7a6dfb8f8aa45b0be41c20711d539e78..55205f7938055ba2b744dba5118bba935bcac008 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,6 +9,6 @@
 #define MICROCHIP_VENDOR_ID	0x029
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
-#define MIPS_VENDOR_ID		0x722
+#define MIPS_VENDOR_ID		0x127
 
 #endif

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251031-mips-vendorid-df103aedf117

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
