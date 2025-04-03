Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1625AC3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WIu6B9EqUso7dZ4OUteIVvOcun1u+Ot2wSYeZFfn7HI=; b=xt4xLJLZpdxCBk
	I6pDrtHoTBXpdKdD4S8HbjUNwV3gd4B61pNLMjTM+Hq3oeNp61lL98pvP8dU678nIkL576cleFzuF
	7uj/XsyLRRsoI6MGrR+bzSY1xKMyUo6k6vJbd2oR4UwB8+fNd6KO1i7DD86Rtes4xsM/IqmwNeCZ9
	I68XOa2uhHjWgtMiDFflgo+dWdJjKrTfzFRLmjkBWq4a9beMEqjHwqY0Zn4nMx9qpZhkWKXeaRPq+
	tAODOO7pyGmYptUvPq42RdX7gkIf41oHs24U6Z//fyKtzRLZgsJDzx4iOBvXOKnEunmPGGoTsiOdM
	YgXa4AFs/XuYcASwfy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RHK-00000009yxV-1wa3;
	Thu, 03 Apr 2025 20:35:10 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RGu-00000009yrT-3jAK
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 20:34:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743712480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UDfYL4ErdunlNmstrEsdYuv+0FhmfCu6RIMjgekzhfE=;
	b=fipwsY+d+b6rrvO4vtfMK74We5DLTRxmJZCjFxcOm517hPj64VLEIduGp6NAUPREU89bjd
	xZyKMR6nFCAMifx9XV1LmHzDsR58ZHEpgkfL4NkP+YcXqsECMzDYu5cQOnOEs/sUaH9WCw
	ukcacLOEs519U2x8Xudi91EKa/cOBqF6WZ3YK8xvOjpS0qw7m1lnGoaB9bFBtJj7rfyaiJ
	jdKLSDWnzKX12KL7x71yizY4dCcT3195iwvxltXgU7Q31Xyvw/0YkVQLNEmuAXzopXQl9u
	hkfS8CjuyPo/Xascx/5iTJ2qdB8qF+NiTZrWIn+LWV/Zk2l8svIVyF5ej0JqTA==
From: Ignacio Encinas <ignacio@iencinas.com>
Subject: [PATCH v3 0/2] Implement endianess swap macros for RISC-V
Date: Thu, 03 Apr 2025 22:34:16 +0200
Message-Id: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMjw7mcC/13MQQ7CIBCF4asY1mIYKCiuvIdxAXRqZyE1YFDT9
 O7SxkV1+V7yfyPLmAgzO25GlrBQpiHWobYbFnoXr8iprZtJIbVQYs8T5VB4fjrP/QG8bZx1ATy
 rwT1hR68FO1/q7ik/hvRe7ALz+2VArJkCHLhqjJbYAaI1J8IYKLq8C8ONzVKR69r+1JIL3mrlT
 Wuct6D/6mmaPuSS1UflAAAA
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
X-CRM114-CacheID: sfid-20250403_133445_288505_21563652 
X-CRM114-Status: UNSURE (   8.66  )
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

RISC-V needs a default implementation to fall back on. There is one
available in include/uapi/linux/swab.h but that header can't be included
from arch/riscv/include/asm/swab.h. Therefore, the first patch in this
series moves the default implementation into asm-generic.

Tested with crc_kunit as pointed out here [2]. I can't provide
performance numbers as I don't have RISC-V hardware yet.

[1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
[2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Changes in v3:

PATCH 2:
  Use if(riscv_has_extension_likely) instead of asm goto (Eric). It 
  looks like both versions generate the same assembly. Perhaps we should 
  do the same change in other places such as arch/riscv/include/asm/bitops.h

- Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com

Arnd, I tried your suggestion but couldn't make it work. Let me know if
I missed something in my response.

Changes in v2:
- Introduce first patch factoring out the default implementation into
  asm-generic
- Remove blank line to make checkpatch happy
- Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com

---
Ignacio Encinas (2):
      include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
      riscv: introduce asm/swab.h

 arch/riscv/include/asm/swab.h   | 43 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/asm-generic/swab.h | 32 ++++++++++++++++++++++++++++++
 include/uapi/linux/swab.h       | 33 +------------------------------
 3 files changed, 76 insertions(+), 32 deletions(-)
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
