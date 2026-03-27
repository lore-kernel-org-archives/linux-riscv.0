Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1CD10BA436
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFfNRuB57H3+qeHA3zGgJ/RH0+jsOBzca+q2ZPDkjfc=; b=18Rsq5FlTNXZT7
	bcnve+HgMbxBb5h49ZTHDLhIsqAapU2DGVUHUUMLczXwpgfaS1eGpi3c8DzQyg9PINzD3r7zv1N2s
	OYDid6cfjEpN6NxbwFIxPgHwurBp8jd7qXJov83zMQtmwvIXsTCIUhv53Qm5+VSYAa2JXdfILvdSp
	eC3jVMXSmNebk3oUmsz62t67Oy0PXL9zeFdhXz0MiTyKBLuLAwdW/TjPFP/MQAJiiBaH7VNoC6UzM
	1UJeR2i20v26nG5AgLE1XcNHSJ4W3sCP11eCdTV6wEiQMq8XoTZYNJPffAYwGIE6oRH9Sqqu197d8
	DRcoukAlPFZhUilQZ3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6287-00000006vEi-1Oxj;
	Fri, 27 Mar 2026 08:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627s-00000006v7i-2r3Q
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=; b=ZR2kAfA6DeEPpVOs8xU4BVrm8v
	a6SKAHk1F31LiiR3IkPtBMviOAJaEzT1F+UHWmyuWr1++qTRe629wZklvD5wmrARKkzTLCJt7eiDf
	6lMW8R8oa1/7h/u5mdBIk6k2CVoNihR+37GUzT4ZbnaE0vb8B209K7xrNqMBTNV4ajv4PCuCPoJQk
	aPMfaeperZvnf4cW1LNJeG8i9aKAb38yO3CZoiFLf74lYrpdBkMX6WTM/l6e7KiLkjMAL66e9e1vq
	CMZkroIzt3z+y+clWWcs4boAokz2tE7qa5jCku1OvnC3GttjBXcni95LO8QW+/Y+Tzq7YcuGFfkVz
	QSa34uPA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627o-00000009vKY-2Hma
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso19829725e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598459; x=1775203259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=;
        b=Plu77CUATJP79Ph8b81mGg7OgnaCJkWtBA9YAOSwPfvgXuxaBBIM4Y3YXte/6jzHf7
         tPEYpR0Ir0tZOTAQMJaISfny0kw6CwwemVOwc88En1IkiBzf7D7fsCwgojcl8xZG1JoJ
         jcaT1kl1u20A5S3YG/vaCsF+AT2g+rreodbFvo7t36/tIa6/Cd/M30OZDc7WcFQPRz94
         0BjNQpMf+l9/lwtSFmMqzk6DDVLpp66X7Vpl120wUtUMiOpZ6uCCWtYYlhXbU1SzOu6v
         jnBjjD0WOkg8GWHWZNFbnQRkqS/4285wBN45dk7PfCBDx5Yq5bYynzVp6hmoYCI0tsnQ
         kmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598459; x=1775203259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=;
        b=BFDtXf1buYsWUyQjucHQL3fhNtZx3BXQ3rO0zpWsJc4nWzMCvQA70ZuNAErLNU6sXl
         f9DDRQZaQdQVZOOmZ0m21Ap2xM+H875DnNLb11tYvb1Q6KiUG+KB8He7desSlU5WyPsm
         ups8m1/LsuuX2/009LtLBlCSVFS0xv8BG84M9dDPnAG704sGEXtaP+sTAQgC2C5TJB5C
         2qaMXuhCh0jkuZVdBFRW5gtY8DfCDdxc1AQaASALkAK8CAex/xhmH12zrEP71iNYjRDI
         GjFMtchbAV0p8prW7Rbf5lJWEWaVhsoUMEoJw38jZQv43Gfi3hQ65Il6F8yZj+YMULcN
         KcWA==
X-Forwarded-Encrypted: i=1; AJvYcCVZKXn+aP43wwziXpeipbRsxLJofXzw3jiLY8iD68XnwbrfE6B4x48LMFdFNd8iLfe5YOcnmXDau5JQMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxalU705Lq397ca9PqgFgX4oucw+bqgk1wwTowSAZeO/3UGXL
	sJ720h+/yNxPLqV6eT5TUIWpnp00aT+4SxzrQLSRfXtQV/IWOw42k34KSX8RMmgB9G4=
X-Gm-Gg: ATEYQzwjgYQ2cEjhe3YbmBIXafiE1MjoprSWHy0RXyuLTmsvuYGmus5nEGnG712yBVi
	e2mGFFX+alufMYbQdCz3snXoFxsGcNjhQ/JsPcLCDAi3pYFIZC7+zHDBbmX8LzuHXMAMEimW2F+
	U7/30lk0yTJ8fLsaHKZXFMVWL8CLuA93T0MCsE/AyIWjqgI3qEwMxdLI0ces4SG2gR+r4FS/aQR
	Lv2VnObuvPFNckpqSED4InC7x8S/8wmn8FQlVIh4EU/RFPRft266ga6/M6IjsXpwOjksf6wuRrX
	p7ieNwY77upTvMPmsLtW5lgFapKC/ZJO19A22NaHckX+i8/IjUa0vovD7prhz3luoobDsiYrAvi
	n0bCG3no7y/q2PigQBAzTzMVTbK79dumQJkYmpS2qyIwCZVr7VziZe+iweytKkT3U0OM1dQP3/d
	dWq/s/Jlx/mT34y9oN3KUFc2zXu/8BpXZXYWlud76Q
X-Received: by 2002:a05:600c:5304:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-48727d67a43mr23844745e9.6.1774598458837;
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] module, riscv: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:03 +0100
Message-ID: <20260327080023.861105-5-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080100_951166_DA056E66 
X-CRM114-Status: UNSURE (   9.24  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all riscv-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/riscv/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
index 1075beae1ac6..9ced27c8ccb6 100644
--- a/arch/riscv/include/asm/module.lds.h
+++ b/arch/riscv/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2017 Andes Technology Corporation */
 #ifdef CONFIG_MODULE_SECTIONS
 SECTIONS {
-	.plt : { BYTE(0) }
-	.got : { BYTE(0) }
-	.got.plt : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.got 0 : { BYTE(0) }
+	.got.plt 0 : { BYTE(0) }
 }
 #endif
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
