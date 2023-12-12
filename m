Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C63C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DxxmEQj2InAxCXBsU+chfpzruzGdPGZ82KGkOUlFPbg=; b=242
	q90Ql6Fylr86x1X8uj1tEpTqk2LmKc/Bcb+p2SPdTkMDaKVSQ/r/1m/UBijQhBECrd4PFY4N9C34l
	xDCSyTrqgt7TRoAlLjneJWGIMNPd8fxQSEENk27F5oUAGIDhNn4P8cZNJgZHQoNf9Yh34+UOgf9FM
	wKP8jbAMiNHYzvlt4We5/uLkSq9K9tj7E3e+qTYA8XktL1zeT8f87dD4PONhe6k9empeycU9bXfh4
	QJicIwCuSg3amcyPfqDVAegC5KEBkFyjq8qJ/1oGs1k3zWIh5QdWjB+eTElVIGLEzWZ4aQzaoz/4B
	Ucx9rhLlAdwzovzDst/wjCx94odh/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqVj-00ABmb-1w;
	Tue, 12 Dec 2023 00:20:31 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqVg-00ABjh-2R
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 00:20:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1d05f06d312so26027355ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 16:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702340426; x=1702945226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qx7m9vRzp56qZzBiDq54IglkfWGSk4qU7xvtkpwu46k=;
        b=v1EhM8ZhD3Q6vvQhCHCPSFm5DovKrGAwQsV1Qh+iLkjjCZSFuqqYdbPei9P/bFheFb
         kvaH+Xzvk5JIj2AHJjNvHvzvx5CGqaQpUMC8fHeDCOVtL+5q3qOsWFOoM4HU8SdKB+3U
         5pVNBSel48AMjBonoBNkZwlhVydLJMod75vkDXhzsL1hHyhIi8LRDxQotS0RN0aeWbQd
         J2JvU/dheLduBObzf7KJxBmc9LgcMWdEtDahuMJ/R/cW1KsaFiFAT91uJNkfFkJQ6OR1
         SwGILtoiqf2zLszFjE+Utk2g6TsmosEivuXOMfb0kzCfOAbMXEfjS27f99xVhvrfrK2Y
         9U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702340426; x=1702945226;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qx7m9vRzp56qZzBiDq54IglkfWGSk4qU7xvtkpwu46k=;
        b=jqYjQiYzkFe4G8roXCCtxMVGvjlKmzhfAfT9UAhgPPTQf26p5TMiLTlqpI3u6J1FT6
         ZfnWGh1lidNFHZaBy+ttG+3Rvn4AQeXdBGNqaMG5Uuj7pCRwgdd+pzRLBQyRdmnLCQo7
         afvEY0XFjFYXjxLu52e/SigCYh6Ys3x5aRYY/votHcC9jJEbvNTkYt6kU8IB3+3UgFCM
         xUss+Jnj29z9gsV1ewSK59z2h1zr5mWUd4rsuHF7w1PqlCKYdyKb9RZMHKxNuSUlD0x8
         eWpB2/OxGw0NgW91McfHAQuB+qYVek0fRACEwURrw6StVxASYg+dTJpcMH73UbkSY6/e
         KC9A==
X-Gm-Message-State: AOJu0YzKwOy6Lpld632K0zme81B6FmcFW/cymzcJz3xB1Cip63o7kwc7
	xu3PXhke1aSn3XhUwhIuS0Vi3JM5PVcn
X-Google-Smtp-Source: AGHT+IEQkbdDIljwjMioFvyc1cxwo2xErwu6uT/g4NnGKyVsAd4qaF0of9asKVrfJantMA3+6h/L049nRoOU
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a17:902:cec5:b0:1d2:f388:6def with SMTP id
 d5-20020a170902cec500b001d2f3886defmr42116plg.10.1702340426511; Mon, 11 Dec
 2023 16:20:26 -0800 (PST)
Date: Tue, 12 Dec 2023 00:20:14 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD2nd2UC/4XQwWrEIBAG4FdZPNfiqMlqT/sepQe1oytsYtEiL
 UvevZOcWhbqRfiF/5vRO2tYMzb2crqzij23XFYK8unEwtWtCXl+p8ykkAokAK+4lI6uLQlXqgY
 eZ4+gnJZ+9oxqHxVj/jrI1zfK19w+S/0+JnTYb//BOnDg2ssoBJgJgr+kxeXbcyjLbg+KTsizR
 kOnsZdUSrrh0dzX6HI0WpIgBJrzLNAGYX+NPgA1AhQB9BmIIKJEiw8r6JGgSbDKzTpEZ4x9fMQ 0EiYSvFUTBo8OlPojbNv2AxOaRE7xAQAA
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702340424; l=1046;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=MGLaiGsynrvaDSNN1tr+dE3u0Z9QSFrYm2m2LgINKqo=; b=Ag5LoG3LmarazrPJQCeL9+7ZPXoR1L4scDRe/vYQ9PeC8tuSGxCGnOUNuFfkJ7kn5faHE6yhe
 bkCm+AO/4ChBY9yRb1jSK9cJCHsBKXIoteKgcRgccRry0BZZu7v4rNt
X-Mailer: b4 0.12.3
Message-ID: <20231212-removeasmgeneric-v2-1-a0e6d7df34a7@google.com>
Subject: [PATCH v2] riscv: remove unused header
From: tanzirh@google.com
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <nnn@google.com>, Tanzir Hasan <tanzirh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_162028_799463_B0F1C492 
X-CRM114-Status: UNSURE (   8.38  )
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

arch/riscv/kernel/sys_riscv.c builds without using anything
from asm-generic/mman-common.h. There seems to be no reason
to include this file.

Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---

---
Changes in v2:
- Changed name to riscv: remove unused header
- Link to v1: https://lore.kernel.org/r/20231211-removeasmgeneric-v1-1-a0274e802789@google.com
---
 arch/riscv/kernel/sys_riscv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index a2ca5b7756a5..ebcaf386ea62 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -14,7 +14,6 @@
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
-#include <asm-generic/mman-common.h>
 #include <vdso/vsyscall.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,

---
base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
change-id: 20231211-removeasmgeneric-f6be13a42b6b

Best regards,
-- 
Tanzir Hasan <tanzirh@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
