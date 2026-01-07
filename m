Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4D4CF6BE7
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 02:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=te3SbJq0pgmcY4uMjavk2sXMtZYAWHwx4ymoLfS2Yvs=; b=xB/vbiUBoyCbWK
	s803bGT7BHV9dIpKSszlNJ8ojAQ/AZdehIqL0GXXHbs+zbGDnwtwE4NyW06TFtJjNoYfXVumrbbI0
	18ArmdzKhM2gx0pEuaJWQivmBNuDKTgiwBmHIq+xrDavtU5ZgR18TBG7eIEViMFagwdfEDYXi/oya
	9TYbU3oHfGvB4oEs42uGBOueXYwsgMGbHp0vXZ3y96F7YUdyFIz7f4aCRSgKvv5CTWsVe+AuxLiiv
	0pGvoOQqpsSB+ZfCdK1TrfL7Kc1oehqjJMTGp+MUKmb+McOwxMGwrl0e/Qb5R5M1bsYuSQGqs8DNB
	j17jo6e0FoGa1ezhqz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJOj-0000000E4jg-3TgK;
	Wed, 07 Jan 2026 02:35:45 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJOh-0000000E4jM-1cSf
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 02:35:45 +0000
X-UUID: 8914bed6eb7111f0a38c85956e01ac42-20260107
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b31f22fb-db5c-43ab-9dc1-e6ceed6df590,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:81179816ae89821601ad50a8f3b60a69,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8914bed6eb7111f0a38c85956e01ac42-20260107
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1792954441; Wed, 07 Jan 2026 10:35:31 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	Jason@zx2c4.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	charlie@rivosinc.com,
	ajones@ventanamicro.com,
	nathan@kernel.org,
	linus.walleij@linaro.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/5] riscv: optimize string functions and add kunit tests
Date: Wed,  7 Jan 2026 10:35:12 +0800
Message-Id: <20260107023517.46840-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_183543_737063_9972AD36 
X-CRM114-Status: UNSURE (   7.95  )
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

This series introduces optimized assembly implementations for several 
string functions on the RISC-V architecture (strnlen, strchr, and strrchr). 
To ensure correctness and prevent regressions, it also extends the 
string_kunit test suite with new cases.

The patchset is organized as follows:
- Patches 1-2: Enhance lib/string_kunit.c with new test cases for 
  strlen and strnlen to establish a baseline for verification.
- Patches 3-5: Provide the RISC-V specific optimized implementations 
  for strnlen, strchr, and strrchr.

Testing:
All patches have been verified using the KUnit framework on QEMU 
virt machine (riscv64). All string-related tests passed.

Changes:
- v1: Initial submission.

---

Feng Jiang (5):
  lib/string_kunit: add test case for strlen
  lib/string_kunit: add test case for strnlen
  riscv: lib: add strnlen implementation
  riscv: lib: add strchr implementation
  riscv: lib: add strrchr implementation

 arch/riscv/include/asm/string.h |   9 ++
 arch/riscv/lib/Makefile         |   3 +
 arch/riscv/lib/strchr.S         |  35 +++++++
 arch/riscv/lib/strnlen.S        | 164 ++++++++++++++++++++++++++++++++
 arch/riscv/lib/strrchr.S        |  37 +++++++
 arch/riscv/purgatory/Makefile   |  11 ++-
 lib/tests/string_kunit.c        |  53 +++++++++++
 7 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/strchr.S
 create mode 100644 arch/riscv/lib/strnlen.S
 create mode 100644 arch/riscv/lib/strrchr.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
