Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D08C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fdg5qaBCq5Ii1lxKv8PlfA1zIyK8yK6MEJY8Jve/Fgg=; b=fTjWOBWks5iDmB
	AsLOVWadF4PJI/OJ3cVfMB7N6GJsIMb8W1A79wEHJ0kAEVft759OEfBAwUYqmJ/emBoZOwRYCL9jA
	R54RB4iVw3VYgyvBn+KvjbuwTYyNmjXQmkQyUvxQZl5WKTd3wdJyyUVYFpyc/Fc5rXCS/vA/8VhM/
	mSs1p31NC8Q+wr5o6+tGHrXNc0Zp7E8sl0Xcg/c2SJ4MmakNn82ClYDy4KhoKA9UJ/W3x5YNldQVv
	R+I/jfbS1NoXEJ3Hkh/Gg4AEadUhRyLH/UIRPQESNxuulyITXRG2X46x4GFXa2rul1CpVUYhcJ/3v
	Apc5Ic6F68Y9nypu82uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCnd-00BkLC-DX; Fri, 19 Nov 2021 22:56:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCnW-00BkGI-RE
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 22:56:01 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so12042715pjb.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZmwgkqEaqsNB6eacHx7jGF/Uov9dTZSX+ljfrl1HKM=;
 b=V/IOvaCPhLruyYv/u2Pwu2NAOOo24zKaeNHGVUHXALOkFK9Pwu8No8GbinVvdCrgTP
 ug4Vi0nd4UzDVYnYLpI4WJmWOrNw/nkJrXv1T82n5t3XfkPIP2jTpRAXSZjDliM+5Bbc
 QuOYAJ5EVj+AOyTmdF18djuKSKaC3+NTMOq+2WFMXWZd+Ej4bSlyuobr5YZtKY1Sojcp
 nE7sjHSQ362M9iksil66vUXNXsosL2nd53i4/KQfJD6MEcWdQYjUlrnt1xFCfl91dRfA
 /lkRUxljcAmAr9f2sKAuShrXFsKGgglbIrG7lSPdhgx1cgWbEf6huX/7mDzt7FN0ontm
 TuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZmwgkqEaqsNB6eacHx7jGF/Uov9dTZSX+ljfrl1HKM=;
 b=ALUKI3FwX0qvdWAHjvjF6neE93AHuybko3/u8inobQm54zIdhAPbEu4Yh4iYCUePY1
 O9UXpx77rYuLJnCJ84uupcZfijFlUUM4rCB0B6TbwIXdx+8C0uo/Bc02lfrNp3Gyms1c
 fWLtpNWHZ0F0Jr5NoO7x/Gdsd1jtG3uxsMspgEV3MpwIzZO4sGBcF9OXhrHg2uHKUDba
 4VB4BPoyj5hVXYQGz3nX8yKmkRso9PjCG01hssjgLhsOqzsLbANWSnZw5fbgRQQ26D3y
 lPGG1b7yrstnmWIZyqzX2WVX/JL4JP5GP1Ay7BtcLpJw7EYBCzTRREgGi0TbkXQ3SxsS
 v1sg==
X-Gm-Message-State: AOAM533P4xqQUBTDjBkh5etIYyrqeg6IKb8F9K1WkaiNpLKUjDWKeVes
 +2LuV47keKv1CAcmTYMwAHU=
X-Google-Smtp-Source: ABdhPJz95l/urJMhGxpdaJPNfeHFnuLnqGtNyiFrtqE2iDlD9RvfTthWn9SEdWafPaD5FVqbnhABhg==
X-Received: by 2002:a17:90a:7004:: with SMTP id
 f4mr4103477pjk.156.1637362557584; 
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from localhost.lan (p4857108-ipngn27301marunouchi.tokyo.ocn.ne.jp.
 [114.164.215.108])
 by smtp.gmail.com with ESMTPSA id f21sm658610pfc.191.2021.11.19.14.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 1B297900921;
 Fri, 19 Nov 2021 22:55:55 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v3 1/6] riscv: dts: sifive unmatched: Name gpio lines
Date: Fri, 19 Nov 2021 22:55:37 +0000
Message-Id: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_145558_914220_28B235ED 
X-CRM114-Status: UNSURE (   9.66  )
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

Follow the pin descriptions given in the version 3 of the board schematics.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

---
Changes since v2:
- Fix end-of-commit-message separator so change lists do not end up in them.
Changes since v1:
- Remove trailing "." on subject line.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 4f66919215f6..305a086e5207 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -245,4 +245,8 @@ &pwm1 {
 
 &gpio {
 	status = "okay";
+	gpio-line-names = "J29.1", "PMICNTB", "PMICSHDN", "J8.1", "J8.3",
+		"PCIe_PWREN", "THERM", "UBRDG_RSTN", "PCIe_PERSTN",
+		"ULPI_RSTN", "J8.2", "UHUB_RSTN", "GEMGXL_RST", "J8.4",
+		"EN_VDD_SD", "SD_CD";
 };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
