Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74004C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1bbMbuQMS/h5pH31bmFfROhPvU1bkqFMN4pbuofyEg=; b=g/OiQ2BAN84oOA
	SUj3vfYVHKS8hJ/UF/0gVGYvIWJ/GMezFbgRrsxrgFAR8wkknwUxVSaWUU5VCxGoL1aXa7LvuRucN
	9G2jsT8h2lmaFQhf6IVkFKq9syvEhJ7KKHmm+tEu0aGNlUMlVa/eJ5sLq/WPfA8cIswjyq8y4w6u9
	QX98+e0r/Gp5O+8iZfXtMJlHMOFym+Fh73/1wmx/9sZMhnrpQlr/PHoR9SYRAzm7FBChe55XZDkjl
	iZVZKF+9W1HAIvOeteXNvhDcQQng+14LFpRvoXz/EjV1h4gPpPqEwcg+zWKGD8bms6gV/XRto2ug3
	Paspwro7BSl2PL1/ISXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6ik-005JBa-0k;
	Wed, 19 Apr 2023 12:15:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hh-0058A4-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a814fe0ddeso8931095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902622; x=1684494622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl6ZZPHDkI9/+UU2TcDaa7qsesK/iY8UwQlFo2pnRGU=;
        b=teXl9sZA/vikfdnyID3OxKrmidpT4xgl6Dzon/dM8dfFMedyiwryINMJF1Ivem0Ntw
         9eg4qqI0ib3racb7edyRvjU0vYn7vHgSUpIDQeg8WtOLg5oElpv+znRGFB0uo1y3FaE5
         8DSuROEgor7W6zjph2142OtZ9pV5uYq83FEvjYsly8hshW1K5QBY1HsOIpvv1LQ1zFQU
         y9mwCdPTo37EzbUCFWZsZ0vqtVaFDqjPYdj/gKjiYkwJgCDWMN8t3LMTNLRnkrUzTTVu
         v9TDsLX6+Yz2HkWVQqGwpd7PpXFdpgq+TaHrzHWnlfXSYvptMWnaKAyv6Mxbehoj4Rxt
         LqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902622; x=1684494622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sl6ZZPHDkI9/+UU2TcDaa7qsesK/iY8UwQlFo2pnRGU=;
        b=WE1isdNNryOyXB2yTck+EoQFU59PXf1D1LAhjyHVFEBj3241fVV1pr0sMQKHpyVEiZ
         1zaGWRvskRspAdLRpseltinIW1o88TYV5DhG0z3g0AThi6977rTT56LoNMFXgT1CH283
         toeofGnBXpOS6WstYvPcIicipZBxVP50aNG+cCBDTuFCTatjJs+TRBwn0WCrRf+zwTYp
         KE99Mtvcfv8N7bQejddQbpIwdGDEqXzNkYDnSW/i5P/1OKSow4O0+IggHKahgNiujSLV
         OYWiS2O/A5qLoNY1T36V2+EzqU2zlOvKzOP3216IBMiH84K/uht5SuS9EDtUIx9U8W6l
         70ow==
X-Gm-Message-State: AAQBX9embURSUofJp+P7RkU2AZBHXu79++2XWTOKyvenjRKwD6GrfIjQ
	cyxswsvKzSKNj8LSrovV8oZOi8vIvLN5Z+Hoo9U=
X-Google-Smtp-Source: AKy350bNAAjh2WZPLBif71YYYSuewAeEIsbLtcoFmPJ/ErtgNLYslU7rMW2Oz+4DNRkcioOfHCCkiA==
X-Received: by 2002:a17:903:22d0:b0:1a6:74ce:9bed with SMTP id y16-20020a17090322d000b001a674ce9bedmr5688908plg.46.1681902621989;
        Wed, 19 Apr 2023 04:10:21 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:21 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 08/21] RISC-V: QoS: expose implementation to resctrl
Date: Wed, 19 Apr 2023 04:10:58 -0700
Message-Id: <20230419111111.477118-9-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041025_165041_56A09D00 
X-CRM114-Status: GOOD (  11.05  )
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

The generic resctrl header include/linux/resctrl.h includes
asm/resctrl.h when CONFIG_ARCH_HAS_CPU_RESCTRL is set.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/include/asm/resctrl.h | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 arch/riscv/include/asm/resctrl.h

diff --git a/arch/riscv/include/asm/resctrl.h b/arch/riscv/include/asm/resctrl.h
new file mode 100644
index 000000000000..7d247d87dab9
--- /dev/null
+++ b/arch/riscv/include/asm/resctrl.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/riscv_qos.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
