Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32E6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 22:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=L9XkNcWDqZu8Ry0i/LtBeqjfOYpzHfPhJzd9y9MmTgc=; b=CEl
	AZyQ5/5pH+MnR1Hxd+XcFXuDadHwxiwhCUzQF3ogqeiqhT48g/7j8wh42foR/ZCBpU3SjTKjmtpXC
	e7U/5Vzna7d4j5clCXQB7hDWlCQ5CGxlBp1nxq+agaMsiaumiRtV9DpeUYnV/foqyxbmEbp4hECv8
	ujsNPdR2pgDUQBvtkmtJSFJp5Nn22dzXg2+9KwkS5u6f2rxRTaOtweOlWL1QEkgFc2nYQBoaISx2B
	UmMkSMCE5r8xNUkmr7oy4i+yRW+vW8Jk+c4KI4b/dq/nUNqSDxzpMIzXpf/u2RiouSZyERxaa7jEV
	hkMuV6z0I5Wl14vHa8GAJMcxDI0P6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCp8k-009NP0-21;
	Mon, 11 Dec 2023 22:52:42 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCp8h-009NJN-0u
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 22:52:40 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5de8e375768so42749017b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702335155; x=1702939955; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B9ebOHKT7ubdCD5+hQDSD8eq6ojeprFgMPVNOjVnCG8=;
        b=mky6qUykdnNd0ZWqWbmCBh1pjFjkcsScmLpAF276B9EahdcE/ZxO13xKiDq6uXLp1Q
         7udcko6OQES0vS0iRCJFMwpXoxP566Hx+hwCanKtDbgxkQgzqRQF9Cl/XNw4DuCu/vfc
         JqhlZOd/71rWywKmKyV4B+yQRxLAal8rR0mUlDSje1djGMMJ0eqD4/CF4nMAWMatwpMX
         B6tS+n61RTfep9zPoYbovot7Xn/nJtncP+ffNCZZdu8sfj8Tn28/edbKOvpxv+LXMc40
         9xUpT1DvMBjjIN4nIUEUMFyBHwpeNTbu4Ff/KkaxkFJb1+mzR8hFYlalicvHGZ7sD4TA
         u2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702335155; x=1702939955;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9ebOHKT7ubdCD5+hQDSD8eq6ojeprFgMPVNOjVnCG8=;
        b=LgoKNcoEKYx3Xrq92zBl1guGfRtOVz7kopvaMP/EtKYlG96YpOWwNMji471V3J/nYo
         beF8WzWIe3zaRB8xdGZriK8Ws2I6cebqjnQUItnhuyiUrBCsvzJbE35eev9N2ay7VA4H
         fz5Ya3dYVuWX2p5115GG52xzaTNr2gxNFd+OArvrpVlAT4PX1Dl4QYkiK4XJ6lU0MKln
         C2swROp1rzw/WSvIjmMUGoLeavHbcfRz7YJhAZRWayOv4eQ2Um4YaD6nPMyLPfr8xXxJ
         ZhIMCgQunimaV2BhBQq6/l8BV8JqXmyEVe2tVQD5v+kFXTxqfI+xB6mIBt3X/9MUg3DA
         T5OQ==
X-Gm-Message-State: AOJu0YwLiy1cOwrsq1TQbgWFvjja/ez5KMCYeOgKP94zeq5ZWY40WCxs
	mzXYip5Ep9zro0ErwV1m0mcoztrqPaCo
X-Google-Smtp-Source: AGHT+IGsrJP5MwOhfiNyz2OKPJOAqglVB7R2Jud6wtKYGBu0YDJXzcKpaWV2UlZbYDwuPYUO9cfoNhGAdE0D
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a25:b90e:0:b0:dbc:1c42:2d4e with SMTP id
 x14-20020a25b90e000000b00dbc1c422d4emr39340ybj.8.1702335155628; Mon, 11 Dec
 2023 14:52:35 -0800 (PST)
Date: Mon, 11 Dec 2023 22:52:32 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK+Sd2UC/4XPwW7DIBAE0F+JOJeKBeyanvIfVQ9AB4IUm8hUq
 FXkf+8ml6qtVB9npXmjvYqGtaCJ58NVrOillbpwoIeDiCe/ZMjyxllopQ1pIrlirh2+zRkLV6N
 MYwAZb3UYg+DaZUUqH3fy5ZXzqbT3un7eFzrdrv9gnSRJG3RSiqaBYjjm2ZfzY6yzuGFd7wGaA
 aUwPY0KLir3GzB7gGGAXwJIJQ2HY641n/Et2D3BsuCMH21Mfpqc+yMMe8LAQnBmQAzwZMwPYdu 2L2VpWta3AQAA
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702335154; l=882;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=A2aVJiix4clFb7X/1Qv26DmYyS9huqwRq6TucutM9l8=; b=Atw+9+xOK54xIt5bcfqJF5/wLLnYZYUHButs4pynDb3A9boCboW8uw4pnJv/IQFiSAUcVEAv7
 hgQ8l56jQVpCLWxFf41bSu1Wvl7YE5QvEJRFS2f68436QH5YbQ6SDpU
X-Mailer: b4 0.12.3
Message-ID: <20231211-removeasmgeneric-v1-1-a0274e802789@google.com>
Subject: [PATCH] arch/riscv/kernel/sys_riscv.c: removed asm-generic
From: tanzirh@google.com
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <nnn@google.com>, Tanzir Hasan <tanzirh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_145239_348568_4DC3D1A8 
X-CRM114-Status: UNSURE (   7.61  )
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
