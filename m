Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF73CC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ihUUbI9wkjYcCrZ5KH5i/JyP0td8vKSrNODbubkghts=; b=p6Mx3DjogezABx
	iJXnxYElK713O1RY2cMoabfHu8aiiqC9Dkk+mDmE9XOcRW9mJjqkI6Sd+h4ZAzTQYcgclsamCNR+K
	oxRpIZmLKKyW/DDRPPGvUb7n6fYMXY77/28lEmhi3bULtdAFH2xaofE1gJRI0axkMVRqyja+gDa77
	JYhavVZat0dRmjG0wlx8dACTj5hfJdFj6Ep2Gr8lyDyaEL6wblrNu/+YxtVamz++mPjsRhx3Us92i
	SxL0xc9MSDzDw20WBGnlPVKIRptrYYqTTh9krzzJO1OLACzrOQblbbWb1KUvS5j+kzNpFvem8CpuQ
	6ugEGvaghsXMzWxL2f0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMTQ-0000000CCWk-4Bat;
	Sat, 27 Jun 2026 06:25:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMTO-0000000CCW9-2Rpm
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 06:25:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c99672293cso5834435ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 23:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782541502; x=1783146302; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlSOMhTDKBpSUMp6QuOl8t87qQoC8w5yl7v6n/HjOig=;
        b=gxGR7GB+X19sRYp29rbByQJyCuA9M2euci72um2RjzvyICLoMuvamwrPDixobmKOZM
         i2stH4NghlqHg+jkeIWc2R4ObCjtHtL5sr4F66MKF4Vu04xgKAztGMHQjiGwk3IK8TS2
         CH8yIy477A9rCQ7y/TFVHe1hQm6QC5uNvpu91d1t2M4ALraGL0CGYxqI8cH+TX0/gY/z
         U+GtTBTPTk6iCrHjCzlyqhpvXx7YXGWI1/PqG54rHzn1S4MNyYXCVAm7et7YTZaJ4yi1
         wO1k5+qH2D1xd/iaSqehyEoDKZTxi/PuxBwgoo7viFJ6I1zwhgM4weWNUfVKKGBifLG7
         xRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782541502; x=1783146302;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlSOMhTDKBpSUMp6QuOl8t87qQoC8w5yl7v6n/HjOig=;
        b=YCC0JwNqkBK3fdtLiOlJZZD6u6U74CFZtuYhkbU3Pot21/jgdB38Yva9m6IiQI65Pr
         WbziOcrBiDs/ZKFonLkgJ3AFiYCxUI6yPZKG8xqYzTsc/XUGypJP5wKkpZvMVv0TqS7J
         a2bU7Gqf72IKxTX3WD+AxjOz8gKHQ0x4T1XxzXbROlEHkK5npILVN+ulvAVDUryIl1nD
         SCMaVOC5wMWNKDncd9WLy2X3yM3ILeYyKAHmgDWJvf6dwPXB4FUbLKji2G9AExiAjLuy
         97NZa+7f1zaBFYithguBFWxhjJ5s8klO5scSPnh8XMJTdEZnEgAy7SAsqRlDv380JfFa
         2DBA==
X-Gm-Message-State: AOJu0YxbUin2jTPmjyaSO0/5vo8lF49Jv5EsrVcmnCO+NPDPHPYlxOyP
	A0CMjPK1LKxgVCXWQMgt61yTAllIKgGl/7cHDJGzSJgwsDQ54anTG0XB6kM6d2+0
X-Gm-Gg: AfdE7cmvdNND80jPDzeByii3PSO/wIEmJ+yVRBA7cFIgmXN/LE7wEhSdAzORpO4mzGU
	ft0lfc5MiYEc6HAAuQJrRUCnLGN/BJaI59mAqfTp5TiFk5Oowxh+Pf5YKf35/wJJJv0KdjC/EpD
	HElU6R1C0xPYMj2vDZwiaJ8FN9Fx8iA0oshBkdfz7Svp2A3a0uTl5hJGKr8thsrA7FD5vMkP8sf
	2STi4bCzWaoUNGkK22dNhHtFXFSz6CWOm/OBIHFzIexGu1P5dRBz9pbmyvg9b3b/zPcxNWQRpYr
	fd36AItLKbElj087ZGYg9ap5cr4Y/UJCqY9JZIeNgKZ4PgixMKcAxhJg6K4waPREplM9wrLS833
	gm+fwDKK5fVCzQyw8hmp8RlrviaA7yXyvrZp/GPfko20efUZt0gkJkHY9fm4YaG9vjCzBoJznJi
	eupEToXkS+uZ9a55qNGXIz5AsLoF7J+RFKydsi7gc=
X-Received: by 2002:a17:903:3201:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2c8248a6466mr39164775ad.7.1782541501389;
        Fri, 26 Jun 2026 23:25:01 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5b04be8sm51928135ad.35.2026.06.26.23.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:25:00 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Fri, 26 Jun 2026 23:24:46 -0700
Subject: [PATCH] riscv: Add "g" as an instruction alias
MIME-Version: 1.0
Message-Id: <20260626-g_ext-v1-1-a9aa7ab9d109@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMz3fT41IoSXYPkRPMUMyMj47Q0CyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQDz/rEVaQAAAA==
X-Change-ID: 20260626-g_ext-0ca7d6223ff8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782541500; l=3339;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=xeZ88cCw0AVxXyfg5BT/1muyWeASEAuy7R39IM6a6qQ=;
 b=QwknmJYRUI60tVNQa1pfwNIozumGaKdgkCSuYFdZqXhIAtlDzlvSqflzFFBupEMNisLCi/SHh
 BQg6diJ2A2pARy6lEEeUHA5+hYTr5eBUSsEavonnp9wEaaiRSn+esN0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_232502_664766_DB48E785 
X-CRM114-Status: GOOD (  13.09  )
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

"G" is an official alias for "IMAFDZicsr_Zifencei" [1]. Many common
tools like LLVM, GCC, OpenSBI, QEMU support this alias so make Linux
follow the status quo and allow users to pass it in the isa string. In
the ISA string, "G" is expected to written lowercase as "g" like the
other extensions. Since "g" is a simple alias, follow what OpenSBI does
and expose "imafd_zicsr_zifencei" instead of "g".

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
This can be tested with a device tree that passes in "g" to the isa
string like:

riscv,isa-extensions = "gc";

or

riscv,isa = "rv64gc";

Example test case using qemu:
	1. Run QEMU with the additional arg "-machine dumpdtb=qemu.dtb"
	2. Decompile the dts "dtc -O dts -I dtb qemu.dtb -o qemu.dts"
	3. Set riscv,isa-extensions to "gc"
	4. Compile the dtb "dtc -O dtb -I dts qemu.dts -o qemu.dtb"
	5. Boot qemu with "-dtc qemu.dtb"
	6. Look at /proc/cpuinfo
---
 arch/riscv/kernel/cpu.c        |  7 ++++---
 arch/riscv/kernel/cpufeature.c | 11 +++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..0a2df97a1fd6 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,9 +81,10 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 	if (!of_property_present(node, "riscv,isa-extensions"))
 		return -ENODEV;
 
-	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
+	if (of_property_match_string(node, "riscv,isa-extensions", "g") < 0 &&
+	    (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
+	     of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
+	     of_property_match_string(node, "riscv,isa-extensions", "a") < 0)) {
 		pr_warn("CPU with hartid=%lu does not support ima", *hart);
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..f78cbf5ade1e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -322,6 +322,16 @@ static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZALRSC,
 };
 
+static const unsigned int riscv_g_bundled_exts[] = {
+	RISCV_ISA_EXT_i,
+	RISCV_ISA_EXT_m,
+	RISCV_ISA_EXT_a,
+	RISCV_ISA_EXT_f,
+	RISCV_ISA_EXT_d,
+	RISCV_ISA_EXT_ZICSR,
+	RISCV_ISA_EXT_ZIFENCEI
+};
+
 #define RISCV_ISA_EXT_ZKN	\
 	RISCV_ISA_EXT_ZBKB,	\
 	RISCV_ISA_EXT_ZBKC,	\
@@ -495,6 +505,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
 	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
+	__RISCV_ISA_EXT_BUNDLE(g, riscv_g_bundled_exts),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),

---
base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
change-id: 20260626-g_ext-0ca7d6223ff8

Best regards,
--  
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
