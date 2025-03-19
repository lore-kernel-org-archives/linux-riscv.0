Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDA6C36001
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZONZa/K8B5K6U0TD13/BizQsB8zMUmhUv4JJsK1UeQ=; b=XEnZj01XpSYDuO
	rpavuuHusJYCWy2BRa41Aqk+dLFTD92tC50qz7H8zj/qLfLLrdoC4TWJge84BLtUaLSeSvVjJZJT6
	FT5kkbDpwApkeKIHPonTxsje9yTWMcKoGGNM53buQT2VmCCHRqDNaVnf7JkDKzyaSpsrPeA/e8Xhc
	eWfLnkuWNPzVdzdjpCUQJwbIVL5oe/8ZPHYU/l19UvQyga7xWWee/aux2aatSl6UcpMCnXd+42nJQ
	w49NXjVgeQDd3K0USATIgBzHKmCvzu0julAKgquB7+J5y7fPXcO/n38Cx1cCC+tRBkUXiqr6NsDzQ
	hcNm/SqlT9/34ceAmWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0g3-0000000A7Gt-1hz8;
	Wed, 19 Mar 2025 21:10:15 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0fy-0000000A7EK-3C5Q
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 21:10:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742418606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6qfnQE3B76r0ibOdpJTcF98zCUlANBRyP53o9I/sYaY=;
	b=AM+sIw7u+x9pDDK/T/jqmq19frHqxhqQVlgS9Yy8IHFm60uP/c50tC0EeOBLs7uhIXb22o
	C1fMvKQxt493RfVN4WKu/q4/gRTkCVtYoEiNDcB43xuT2VfL6+c8yuHdsnjC2pOb0G/rMR
	RtDOGOwtC1NGBJSVHqVoQYqxYuxi2IkN7chcr/7B7LQTUCBe7/aABznwOoeflT79h/aRT/
	XOIJbtoriN5sn0RyaO4crG3Wp7RCtAElipSXjZpvkVzzSEfC2u/LeckBkzVpT2LP3+kndf
	aAAOqYLKhgwUBA+OD7ZDlQHgGdLKz/ml35GqC/uiSsX3xYZTs4HvYZTwWVqFyQ==
From: Ignacio Encinas <ignacio@iencinas.com>
Subject: [PATCH v2 0/2] Implement endianness swap macros for RISC-V
Date: Wed, 19 Mar 2025 22:09:44 +0100
Message-Id: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJgy22cC/03MOw7CMBBF0a1EU2PkcT4QKvaBUthmQqbAiTzIg
 CLvHRNRUN4nvbOCUGQSOFUrREosPIcSZleBn2y4keJraTDatLrWBxVZfFLytE65I7q+sb316KA
 clkgjvzbsMpSeWB5zfG92wu/6Y1D/MwkVqrrpWkMjEvXdmSl4Dlb2fr7DkHP+AEC2x9inAAAA
X-Change-ID: 20250307-riscv-swab-b81b94a9ac1b
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 linux-arch@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_141011_149670_92ACC915 
X-CRM114-Status: UNSURE (   8.25  )
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

Motivated by [1]. A couple of things to note:

RISC-V needs a default implementation to fall back on. Such
implementation is available in include/uapi/linux/swab.h in the form of 
___constant_swabXX macros. As include/uapi/linux/swab.h can't be 
included from arch/riscv/include/asm/swab.h, the default implementation 
has been moved into asm-generic in the first patch of the series.

Tested with crc_kunit as pointed out in [2]. I can't provide performance 
numbers as I don't have RISC-V hardware yet.

[1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
[2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Changes in v2:
- Introduce first patch factoring out the default implementation into
  asm-generic

Patch 2:
- Remove blank line to make checkpatch happy 
- Instead of duplicating the default implementation for swap macros,
  leverage patch 1 and add an include to asm-generic/swab.h

- Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com

---
Ignacio Encinas (2):
      include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
      riscv: introduce asm/swab.h

 arch/riscv/include/asm/swab.h   | 48 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/asm-generic/swab.h | 32 +++++++++++++++++++++++++++
 include/uapi/linux/swab.h       | 33 +---------------------------
 3 files changed, 81 insertions(+), 32 deletions(-)
---
base-commit: a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
change-id: 20250307-riscv-swab-b81b94a9ac1b

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
