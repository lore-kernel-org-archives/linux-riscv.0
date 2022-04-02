Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2D4C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnQ1oId4aZ7e3ruJVT9YOnM7Tf1HIbA3K3QqaX/5GUA=; b=qt70gKpqtlE0vs
	0GHYWr6Kyef0kRxdY1EONdm1LloAD2lJlHdpn2mQynfgXvWPA9x3I0gMq+MPIlXp4bR89kZpIMFSG
	Fs4HU7RMtixOSSoILrszJcAooJt5wUbeakFGnvV4GPbl/+aE793ODvLk/yOhTbFxPrbSU5U7njF1H
	1ACIX3LD7ot2XeQtaiHkN7caGfNZ6fb0rUpf+iTC+wkTAa0ge1FLEZetWsJCmV6+o1/YkH1w3z2zk
	FxY9qoGUqFEWxg2qbHD6aiGkv87DfOAMPdesgBc9sjf3Y9iwWmgyV3Jun9HbEMXTlnkxrI0Yvknvl
	HfVQBWryXLxZtsQDQp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naVvn-007zit-Cv; Sat, 02 Apr 2022 05:04:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naVvb-007zdx-If
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 05:04:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so367605pjb.0
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 22:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/fso4SvqY0T0Qc0lJoOtYLQfWSaSLReduQ9sUe6VaJs=;
 b=uGosKXDu+hscZuRzge/vediHFAPVq1SdtFOr9eZrABDXdNBO3pgfgBZx3uaSYpNzRp
 wz/ApkQxH/EQ3IcY8ZFNK7Yl86tb8BPAeLnIkdrpUPE6MhuadxjIX2zpFo649gdl0Vo+
 jKsMsnJGU1g9eQz8donGaVhSVWFuVDE4wmf6nSnoAmdqEugZjfK1wl0Asf5wUQoHSwRn
 xaXNEx+ALURQymZzxaGvkpArTOs/7xFXrZ2LVyyukJmNZZUIP85mHp1aws9F+GDbcPEh
 nwIuw6dCr4BMYt2EAyITAOsrkWIzDsHVR8kvbGsXbqU1cmjjNVy3ll+C5CMH51m8YxW6
 bvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/fso4SvqY0T0Qc0lJoOtYLQfWSaSLReduQ9sUe6VaJs=;
 b=1gzm+hVQ39c0wofhndBEG9lgTabd30dEWdJyltoI9nl21rNBCvCHHgj+4893XfDjIp
 iEtsB7YfW5yWfrlTEct2FlvBllw65Hu2l7D1LaTekUtokdVz7mr4TgqlHQ5OqCg9kM65
 5xAft0PreG3AF3x9mbWMJnl7h8VtXAF2IzPnmM2wumyx7SdlZ83d9sr84Rc15qaG3ijJ
 ZoNFxEIuCxXa5RICFyjs1EtzKVqgOKWjV9mlu200Er9B4RAR6TKBhSNt9HwK3f6CMO5g
 3gwGkGROUxzlMzhOuGTU9q0kPGs5uad02EevXpynnfbKxKy3altLrdmw15w+dNCzXXky
 G6PA==
X-Gm-Message-State: AOAM533ys69PX7XofkWr76YMi7SgAeYPHTTq8F0ogUH9YxmiGoDMS/JS
 1oDIn5WXeD1EXdnqcUTc5kukwg==
X-Google-Smtp-Source: ABdhPJymdt4noevXnrvhSXtRg7cNfDareVVHTnYVduYX1299M3qBHo5UqJ8QZ4RN5IjJvLAivXOqWQ==
X-Received: by 2002:a17:90b:352:b0:1c6:77e:a4f7 with SMTP id
 fh18-20020a17090b035200b001c6077ea4f7mr15403578pjb.77.1648875838401; 
 Fri, 01 Apr 2022 22:03:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 j8-20020a17090a060800b001c7936791d1sm3959110pjj.7.2022.04.01.22.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 22:03:58 -0700 (PDT)
Subject: [PATCH v1 6/6] RISC-V: Add the Zifencei extension
Date: Fri,  1 Apr 2022 22:00:41 -0700
Message-Id: <20220402050041.21302-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_220359_652898_45723354 
X-CRM114-Status: GOOD (  10.62  )
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

Recent versions of binutils default to an ISA spec version that doesn't
include Zifencei as part of I, so Linux has recently started passing
this in -march.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target-riscv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-riscv.c b/target-riscv.c
index afd6fafa..ff4dfba3 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -18,6 +18,7 @@
 #define RISCV_FPU	(RISCV_FLOAT|RISCV_DOUBLE|RISCV_FDIV)
 #define RISCV_GENERIC	(RISCV_MUL|RISCV_DIV|RISCV_ATOMIC|RISCV_FPU)
 #define RISCV_ZICSR	(1 << 10)
+#define RISCV_ZIFENCEI	(1 << 11)
 
 static unsigned int riscv_flags;
 
@@ -39,6 +40,7 @@ static void parse_march_riscv(const char *arg)
 		{ "d",		RISCV_DOUBLE|RISCV_FDIV|RISCV_ZICSR },
 		{ "c",		RISCV_COMP },
 		{ "_zicsr",	RISCV_ZICSR },
+		{ "_zifencei",	RISCV_ZIFENCEI },
 	};
 	int i;
 
@@ -132,6 +134,8 @@ static void predefine_riscv(const struct target *self)
 		predefine("__riscv_muldiv", 1, "1");
 	if (riscv_flags & RISCV_ZICSR)
 		predefine("__riscv_zicsr", 1, "1");
+	if (riscv_flags & RISCV_ZIFENCEI)
+		predefine("__riscv_zifencei", 1, "1");
 
 	if (cmodel)
 		predefine_strong("__riscv_cmodel_%s", cmodel);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
