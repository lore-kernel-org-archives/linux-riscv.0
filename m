Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF1CCCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9cAbJ6rrKc2pmyQQ1e0pUsjqyVcTZ6jvp4BCNkAMKE=; b=r1lCZGdQ4s+tQ3
	nK28DPy9UUmSoMGsS7wfJVYdVmZzXfj5Q/gClHT6sGyQpsT2qSUw1jIvHJDzeObcnJIoeXv5Gy1bY
	kErFXp+jNaMv2TJ5UN6ZGAqqbbz1Aa5Q35rk0xuZyW5zz6ofCh80fyvb7xqHbur7GAvU3+yb803xz
	3E5g+ezwQG4uKZDM/q6DyKW1H1fpH/Gkr0I4wBsspE/eHFiAPApTniKdAV511F1lM7MSu/X/1fk9v
	8CrUJbTZeXBLUw/dbk2IkQcNldFLrrgLLQ7VsXEveQ+x+29G9htj0o6zlx2l1ETuuyFG6IS7qsl2w
	DRpMx2FPw4KQyDEzC7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopb-00000003Ouf-1Mn5;
	Sat, 08 Nov 2025 19:42:39 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopY-00000003Ote-2ZSF
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:37 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37775ed97daso14758761fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630954; x=1763235754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltV9lBgfXlitcw6NuoPhmSgpPYayy6Pa4t7Popjv7fk=;
        b=PBwxoZlb1wzzEU4twzY95sYeiMPK4PiRbcxKDs0uTg1EDTC+qSByRJcn+6C1oKYv6Y
         wiKi87cFMnNpVujhJFr+er2WrHNmEmCfIbwN8vRIxRAHzVJ044K+VYNU+VOMARbZmddb
         eSUpRKTHHcCwTL7LoOWgvX4Q7htY/nXbpswMUwEraK1LAsH9WBNQvKCQfYEL8zA6CxtN
         FovGwArtUmuOFyDeKNggbyWvld7i9YZBgiMePNz5/PaA4fF0LzovclD46mdgpkhVxijU
         erl/PucpKLcrKt3WaNpq55rXn2i4v2BTpy+QrhbKse1yiFzP9HKW1mgfg2VT4//eNzHG
         VbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630954; x=1763235754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltV9lBgfXlitcw6NuoPhmSgpPYayy6Pa4t7Popjv7fk=;
        b=aMMQZ8RnwwEvBeWmUZTGBVTG2KXXgejvEL29xAgmc5safSwXFkpXtLkk1nd9uKozXJ
         M6h/JQ3ZXGYFJgKkARksCmi0iIBfXCBl93lTV4r3GAUVNJ3fmF0TypIM4Xij/fx3cAqL
         aDZybFvHoc4bW2WT6xw2d8TQQoNPl0710He1CduydhZ34S5FehqgY36lra3y3+gPEUHz
         f0JVXv8/rFQgwI/s+nPcrmt43LQxW3qr9f6fZRDIInT9Zz+p2XZzRsm4k1sSp4ZyJlbf
         kW2DB0IZTG9pAx+tJ5qdNAsl020cAhjpIzbVIOOhTpddGCZ2eybgRthxHjlzbeH073F9
         CvwA==
X-Gm-Message-State: AOJu0YwGivhHoEqP7jvQkluG+D6ZxOBWoFXSZa2Cc4rfG5OKWhNM8OJd
	pMR4ZUqpW7WOsSkStZgmVQ7LtlMxJ6ak2ys861x8S8Hw+XqKu2h3crGOElRaD7zYGvk=
X-Gm-Gg: ASbGncuZa48C9ea0ccnoq4sqW30sBmIbITv+IuZyxzx9uyLDZeg9VC9eoo3urMyhB80
	sOLy6aT2LOw1hrtWO0ugVnu49lABLaXoGBBkjOfCL/yHwTDRNTDt2YaZV8gOdIXKkFEqF5bmNdd
	ZAkMaBDjS2T9SNirStlaL06rHXVoiwCwTQHrNG0sNUwLHJoyYsQIWbwOUoLMQk4GG5msKqVd/th
	0Wc7jWMR6oiIEsdimzUvvY2tcn4UMoYfdVJtPB5OLiurr9Ac6eL5NI9kPQ3wfypD7AZP/UOtE0a
	+dgiZkZR3aSxg3B7LWf1KmyV++wIYLOSZbm4A29etA0Dtw5x1ppK4Fqb3eDDfCDR6hMaueSOQFj
	q86h5SfDzYumo+AOiObNZ+Y1yIcHO6iyRocnBaTwYushQYXzBinUGkqwd02fem9orNs4=
X-Google-Smtp-Source: AGHT+IEnp2oCa8v72xcKOc9ex+oyKcuP8x4+4rtHE2r1uNJigvtF1xOkKOxOtbzS+RRziZBzol+Trg==
X-Received: by 2002:a2e:9cc5:0:b0:377:c556:68b7 with SMTP id 38308e7fff4ca-37a7b282782mr7624071fa.17.1762630954001;
        Sat, 08 Nov 2025 11:42:34 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:32 -0800 (PST)
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 5/9] riscv: csr: define vtype registers elements
Date: Sat,  8 Nov 2025 22:41:44 +0300
Message-ID: <20251108194207.1257866-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114236_657284_5ED6609D 
X-CRM114-Status: UNSURE (   8.67  )
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

Define masks and shifts for vtype csr according to the RVV spec 1.0.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/include/asm/csr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 4a37a98398ad..4f55dcf86627 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -444,6 +444,17 @@
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
 /* Scalar Crypto Extension - Entropy */
 #define CSR_SEED		0x015
 #define SEED_OPST_MASK		_AC(0xC0000000, UL)
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
