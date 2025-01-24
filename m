Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CD2C0218C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 04:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9Ker27qX+Ur2jDnHiMQ2WMhBf6PUfx6F/g3+6m2xm0=; b=phrLiK//d0eCEn
	ZolzXK+cXxe1ShTHqvNh5uVCIaAJuyFO6I+KbkWdYQUrgzcQ6upKMcXTrXG3AS7e3MuIfasAkZudt
	hz48Eq9fJVaXJ1VYj1tUFSzccZPUi5Iz+dBE70QkdzaxXp/IvaOpnXkFl7C1It7VFE4muroddBRlb
	E18KuEl+eYqFnYAqR0/qEaWVyzmQSFqpLEhFDMnPhN4/JfYlyRAE7ca8GX/I0BSFGqiWEROc75nZH
	A5SBRvsJQ1VcyJXAAZgFgO7tWR7Sdh1DcUUPMC+4bPTUaM3SBq7ZhpBsP8Cugd2DvOuIlXDmnV9Mr
	2KJzl4CQKq/CimfHUr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAsU-0000000Dqmw-1hWU;
	Fri, 24 Jan 2025 04:01:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAsR-0000000Dqlp-3ark
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 04:01:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216426b0865so26952115ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 20:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737691263; x=1738296063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=ONfg/KkhnEJ5qJ19yPgmamI22hylkxgzUmgMs5NL8UhkeMauJz66z3p4wPPDMhosTd
         DnCtOV6yRaWIkXvJkzd0EBuA66Rx7v+Ihm4KQOzkNg47PRV3GoPoP0Mf2RYVVbMF8Op4
         zpPm0ZCClxOkwJ17PEdCkEYAXFuVYuS5StyBKjA4mzLp30aApbrOxILw7z+E/jksI/Ju
         RzTsqk0guH4vndZdZw9G2lw0YhnB7SFZplGuqaCqiSAWNpi6ls/w699aMjjM6Opd+tgp
         HoASnzz+4pTMJQ7o6L789WMTjWSta1suxB4IDL+nXg7EsosBvI5dYdpnZaT9jeOk3xY6
         0Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691263; x=1738296063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=NWLZQEL1ADOLFso9AGt30t1YLp1ZLKMdus86+rqVlF4SBjsN7/a5I3eDJ62MwqU6MF
         jIeGwsx45xJ0cnx1/JssBIImHRc9gdbNkh70hC6kHQhqpWI0WGLZhBAgYuUT241GrUs4
         N0vT8hllXHywZ+eG8mTNpGkfcaOtoePmQEeGg1xfNGj2OsjKwlYK3yFUbkkFyiKYkkLG
         vohwvDYQsYhMXs6IwmL/zwo2KEke3o1gHLIM9OmtjMAAeBZF9fnvj9YNKPU/okMjQ/Nq
         A4rit9pprkFypE+EKRLOXvc81sLs6lCAb1iZ4D6i3tGMhAUWbaBkVKmfEN+F72KefkLq
         93YA==
X-Forwarded-Encrypted: i=1; AJvYcCUrfYHd15peGuAw9DQG4Lfwc0ft7ckh8mRRYj2wNLs3P22khlIrCmrvMx0ZRluRvBh3waP+lM/oVz1HLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyib8GVwuNzoeCKfa4xTbuUv1ATi/YqNI1TcJJXOcT6tmStse0Q
	vgBs6dR4IXz9CSilKW7CI9IydI3Zs5JbQGBq+0HS+ZBiS34HLrTV1h7szsrMMag=
X-Gm-Gg: ASbGncsylJiCdzdjVelxrd9zhowk7xadzIJt6uM6146Rh6htOuLM1FOit6KE1Rmb3jM
	FGVG1B/2YJjzVPeElSnnlqaYHKLTsoZYhUdSRw0gDPgnh350mLRzi1iERMdZANvWQwIQM/OQwEZ
	SbHUn1Aje/WbaWxkJELOI1L+72udBMU8RmEyUHhn0cNPKSBVo6ltffsm4bjhP6eNi49BNfQ/xj8
	TLwOXqGm5tV4IfJuoLaj4jkjc0WloPxF08xaulab5AZgpFE3aSgGpRMKPysdZWgM6i4eP1GJkVG
	a16sH03uOsQxonK7eABfnFGgOal/C7TmpuifWbMDnj+Z6RsjWA==
X-Google-Smtp-Source: AGHT+IHEVuIwXoOL2BRMckKQdUn6rThK8+gCeYIzAbtbkLa2fGtpENXBcF3NVF3avHHuHE184wgyUA==
X-Received: by 2002:a17:903:8cb:b0:21a:874e:8adf with SMTP id d9443c01a7336-21c355dc4eemr425518995ad.45.1737691263230;
        Thu, 23 Jan 2025 20:01:03 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8406:78d1:bf49:24c4:f518:9b3b:36de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141d67sm6758915ad.153.2025.01.23.20.00.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 20:01:02 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v6 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Fri, 24 Jan 2025 11:59:57 +0800
Message-Id: <20250124035959.45499-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250124035959.45499-1-cuiyunhui@bytedance.com>
References: <20250124035959.45499-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_200103_896383_D3287A79 
X-CRM114-Status: UNSURE (   9.70  )
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

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..60d180b98f52 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+		current->thread.envcfg |= ENVCFG_CBCFE;
+	else if (any_cpu_has_zicbom)
+		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
