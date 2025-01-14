Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D515EC02180
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 02:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9Ker27qX+Ur2jDnHiMQ2WMhBf6PUfx6F/g3+6m2xm0=; b=KGtWMElFxlALRq
	CkAAUgCtrxE4+LaJYWwqqA2alnECAbCq1ppOU/5TbXijYJjvlTkOPv0DJEh3KbXd+D1p0/avsfKrU
	H5H8+hG92CsqTo4nH8bDlYL005lqrO+rdhmcAvd0C0uTlHb+rXJS00j6puIDiVf1Wtr80CycQYVl7
	VBGNmee7NfCDuLhc10CmB9e4YsR+6otKQw4XCk2gxQA75luDFh3jxYP0JS8wj5I4laZMUy5d2YFSY
	vBkgoffXbEW2pE7tkYX0+fqdMtQfSCubxLt1+gIbXLjx9b8xG4xic9Ov+viwFx15M5nnSCXUAulx4
	zH+mSZVnhAuSCQZKrTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWXX-00000007EHS-1HH7;
	Tue, 14 Jan 2025 02:20:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWXU-00000007EFy-2Qoz
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 02:20:21 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so7455718a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 18:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821219; x=1737426019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=IRFbqo50UsYaIXmFjKzLwbsBaZfL1zdB7IInetUFXImzNHit5QIL+UFznp7Z1inGGE
         zjBc0oo/cyDblxVdAN7fcy5opg/5TcZ9ViAVcAp58ywo6Rt/yGTYRdUrYdrAhBw3LJlU
         YLTtAMVsDiJOeXjA7J8UwhJBXQjZyQPM8c18ZIzxyW/YBvVat84ETYSJi1eHyxx8M6WP
         73LOCTUkqNHmHV8ZsWagtY7srz8wJu40N8XI2C/g3rmMqi0+SzAzlATxT2XDzJ04jlI5
         wcglv+sQblbzBLeftabZ4Kd2DNVlC2lWzDt/30ZZQPbF//0CPWZF1NB2Jw4WMq8nMDlW
         7izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821219; x=1737426019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=Pkr1EBJunLlVu7QclPYNQAWxD6hyv+PPR/+cQ79mmMDcev416JKcBbY32nXTdfqiyj
         cBCv8OXmx/rmd/vJeod4SryqRjWvyZreWzl/xWH9uN3vFtZ6FHLJUOCoPm0/7eSI409u
         5Ku/TiJmdcZ7j0sbJruqpvV5qj6wAvELo9PBGWxjavQTyKSHsyJ6fzLXnCHoxnOfMayo
         Vm+EGLd4LSThN4Jw7NeezDI4fkMfmTF6FIrFk4c5P9BdAi/gq7dqK/LEcBKIqG7s4284
         uvNLaXpPBMH+UAiUl0mgogpFeF2ezl13ut6g4FxICce5rrPRPW5WTpH7ao1d84I5bGdE
         bLow==
X-Forwarded-Encrypted: i=1; AJvYcCU8+Vtzxhtmyp4J44sxB8hh8Wx8eW7KLkY2omIIlMqY44qlrLn6EHAul6Pa8BwJ9wCUmDisnicW4Qs9dw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/O0IafKFG3b2ejws8rtra5YDYMzVvS8iioM0K2F4VZr80qG4O
	ZWhDlTEqoB0F2+2GyS9dAkfGaulgVpSXuWEWrNi3E1sEAJy6iZout4/bMfiM0EA=
X-Gm-Gg: ASbGncsbFNbPHTcFWuJ1EyD9QxsRXFpX2NbdJjSZYypReeBJEm4Zo9CH0ypKxaCVvYk
	/fTjKA3Sy2Ax+eFNWCBJ9qFmz1l3YtS7ls82dgGkUs1g2EZUARCwA2MiF/gHGa11J0cIaNUcWvm
	U9GUp6yNPRRR9+hcCXOE1kmeFsCxCL59GOQtG6QhjVIoa2wPbJwyTi0T/opOQkK+KwPAcEYdymj
	Cly/vwdjS+hhq5rq9vEqc5u6jBUr935lPqEVRDIFqmANdufQOUgLtauZnATv4yTdV4u4SZlDMiD
	YPCmLkVhjDAwrgc=
X-Google-Smtp-Source: AGHT+IEpY8vThDWOwMPEtXiB5G1hpEHBvYVE1WuJdpEosAMMRWGkN1c3leoGAuLEHJ1SaSfa2zx7OQ==
X-Received: by 2002:a17:90a:d448:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2f55838d0eamr27670389a91.14.1736821219527;
        Mon, 13 Jan 2025 18:20:19 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217b38sm58948065ad.145.2025.01.13.18.20.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 18:20:19 -0800 (PST)
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
Subject: [PATCH v4 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Tue, 14 Jan 2025 10:19:34 +0800
Message-Id: <20250114021936.17234-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250114021936.17234-1-cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_182020_613798_FE09FC6C 
X-CRM114-Status: UNSURE (   9.79  )
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
