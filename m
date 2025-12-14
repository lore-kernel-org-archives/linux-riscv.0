Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5738D5B16D
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4zXAhtZZtYcAuJ2Fs4p8xi4sUgsnqXc3EDwx2WHJ8g=; b=RKi/V+VRqYNaq8
	sHLcd+2wRxgWpF2ppNrLu6KrqNZqK8rF83snLOJbiLdLa1RWmDZKVwuiyg9vu3HOrh8igJ6pjXIN7
	9mz59mW4CpcWyd5g8V3u01eB1AQEAePPsGlMaQnoX/vK4pGcGaDWV9BvDXCtDwehmHcRmx4vZBx4/
	za/KPPznG2BGL9kldvgl1WZlwlFywdwXHdJZFxSeReveMP25h7HutkXbSeb1NNjXykrG0MhEj2dFL
	DlxXmYALY+UXRkb7bB0qiZC6KFGNgwpR/TKF3ts/+h94lZQBVBhPoeCFKpg5IEXm94KPqHCKMh2oU
	wTzq7QhodnBUhYX0Vrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4i-00000002aGH-0xUq;
	Sun, 14 Dec 2025 16:36:00 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4a-00000002aDS-27yc
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:35:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-598eaafa587so3223564e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730150; x=1766334950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSza8k/VWcFFoMSfwlhWsVuvw7zo5x41+rEafb2iuhE=;
        b=SzNd5E9S+W4fkcdxfoMxyFtCRTI3uWXpYosAHF9i6jhx8pfJe2bbzNR2977Dhwh/hW
         /eK0qG5//P0KYpFkkW0/P9dG1zQf4p8aCybxsfJyZ+dLxJPNS8/v7Th4KwTqWvOqQeIk
         BFUT7WVK36uTzUe2qiuZS+Jg47OsjSjOKHBx2EGMgsJeQPpppcCbkg0RypNRX3ZL5ONb
         Ct4Ot6coUbRcq4wxrRiZHk9MRgBRO1WFq5xjs8EdnfhAhgNqks9Ncc9NK+eaw/g/nGPE
         MIWWfhyG20pPaxpD+7gntQ92qBdypOHIDPKlEKzt93YvX0gOAO/8N1gkh7Hrkx9Ni+Qy
         KrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730150; x=1766334950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSza8k/VWcFFoMSfwlhWsVuvw7zo5x41+rEafb2iuhE=;
        b=Qqjp0kZ1ePKfw/vP/aCNbXXdCDwTGOwpUkzhqG3rT7liIR1pelZk55+BDYhhQUVGmO
         CHXsECUHk3D0CUtML91zhv1P9KOPV2QaEfoNqekyoVj0is1fDUzxoWp/+t5H7h/9eMKy
         yaOreAOyFVUDeDMG9CKmOmWWjSgfTyVBVen3Zt/dMTHzJVNhu65pHQgLBQrL1fwdzts6
         M2ygtbPj3/Q05MHJ6AWTC+8VQ6gQvnOJzXZeUhBI12gT4EI7AOmZs1TGL81l1XxPksOW
         aau9YlQwbjCobTTXNjDVt4w5dWytca+KIdMJLCb5k9Wl8Ju+uIoK3HSf+H7EQsgrOR1G
         F5jQ==
X-Gm-Message-State: AOJu0Yx5r2enjDAkfwklFM/6WzlhC0TBWtscWatzUbiJV2wvh/c3GMUA
	mHWfmOJjoDK+AFzS0qFhl33sYHgOFWOMNTHsRXlkwP1peFW1ovYMUWSep96oTiGz
X-Gm-Gg: AY/fxX7gP194qiE7TIgsYSeFxetjVKUgptHUA4GvCohbVH01UxlcjxkjhZkOel41p9x
	Upqz8BI5VUyFGDBsIqp2guzNXSXmxvYcMS0fs1UlR3f+vmLN5nH3Y3DVWJYz5Elx0NO3STgcT1g
	XLceSId+F7EpOtb4NrzvJCbVo3LGU98Q9QuVhGgwYu3HEXHlfxdi//xbOS+1OFvW3IFYWxmEXIj
	Wh7P9wF+QKZkYwwDRpORoO0vhBGORMjwmUgrxZhp1msQtZL8SBc1nMSukQ6YjjA1GNEiarSLYsF
	lmJHmMznUDv/eF8+53kiEZ9wMUzRwu5ZnORR9bBZmCZQu4K53J6Dj+/eDdklNxM2tOCRxXpoiyb
	/WKr7VB94pkfplV0HgjTRtRmQr5fAsWfecwrQESDwMBQ7B+/sHsz5KWzTbRFI7MhItd0ad24ZOy
	zLXg==
X-Google-Smtp-Source: AGHT+IHboafEprMTLQwXHxj0Id+1cWDu6+3jBn6YkXp7nlFJBpxpKVNyj1NgGkyCkOnkNopnc1J00w==
X-Received: by 2002:a05:6512:a8c:b0:598:e92f:7ec9 with SMTP id 2adb3069b0e04-598faa36090mr2426928e87.6.1765730149812;
        Sun, 14 Dec 2025 08:35:49 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:49 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v5 3/9] riscv: csr: define vtype register elements
Date: Sun, 14 Dec 2025 19:35:07 +0300
Message-ID: <20251214163537.1054292-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083554_201973_7DD316EF 
X-CRM114-Status: UNSURE (   8.11  )
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

Define masks and shifts for vtype CSR according to the vector specs:
- v0.7.1 used in early T-Head cores, known as xtheadvector in the kernel
- v1.0

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/include/asm/csr.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 4a37a98398ad..38f16538b35c 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -444,6 +444,23 @@
 #define CSR_VTYPE		0xc21
 #define CSR_VLENB		0xc22
 
+#define VTYPE_VLMUL		_AC(7, UL)
+#define VTYPE_VLMUL_FRAC	_AC(4, UL)
+#define VTYPE_VSEW_SHIFT	3
+#define VTYPE_VSEW		(_AC(7, UL) << VTYPE_VSEW_SHIFT)
+#define VTYPE_VTA_SHIFT		6
+#define VTYPE_VTA		(_AC(1, UL) << VTYPE_VTA_SHIFT)
+#define VTYPE_VMA_SHIFT		7
+#define VTYPE_VMA		(_AC(1, UL) << VTYPE_VMA_SHIFT)
+#define VTYPE_VILL_SHIFT	(__riscv_xlen - 1)
+#define VTYPE_VILL		(_AC(1, UL) << VTYPE_VILL_SHIFT)
+
+#define VTYPE_VLMUL_THEAD	_AC(3, UL)
+#define VTYPE_VSEW_THEAD_SHIFT  2
+#define VTYPE_VSEW_THEAD	(_AC(7, UL) << VTYPE_VSEW_THEAD_SHIFT)
+#define VTYPE_VEDIV_THEAD_SHIFT	5
+#define VTYPE_VEDIV_THEAD	(_AC(3, UL) << VTYPE_VEDIV_THEAD_SHIFT)
+
 /* Scalar Crypto Extension - Entropy */
 #define CSR_SEED		0x015
 #define SEED_OPST_MASK		_AC(0xC0000000, UL)
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
