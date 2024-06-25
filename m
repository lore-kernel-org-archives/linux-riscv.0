Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5B6C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/6uAjfKUgfnUmKz/Tn8YxNtfXWQh/AcyZEL5lYZ/Sg=; b=zuCU6oZAS4fzJl
	rSiKsy9HvQ0VimRA7rvS0gsIaVmClyGdOlwekQA45hPL65kB/ngBadATajiw3aIZ9CZ2x136LUD0G
	hRbFlJ2S9tdsRU7zVVAVhWTyDljYxmfAMo0MsqbpmlU9cvI/uhgC5ftcatrQZ/d3MqvCJm/sI1XuC
	4KwYj+zw+5XQ3NmTIFp5mPKgVH69YxLot8IEcaoiv3xCi6dROHxx6wsp04T7lnYijqlFHP7O0JgDV
	qjm1PlaRNGWQrQC84sYzj4nUcvxNkgT3JSUEoO0rTZco2JuE3sWL40oNCIQcwER4gHkayBfgfPlSH
	zjl5udUjgzrtE9qwN7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuPz-00000001921-1FRn;
	Tue, 25 Jun 2024 00:52:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLuPw-000000018zI-1LdL
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 00:52:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70699b6afddso57016b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 17:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276735; x=1719881535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPS8Htynt5YVDBSwFV34iezZtSuGdE5NHFiA6AMckwQ=;
        b=ODoqQi90n4lMHjPP3ZH8Lcedhq0jGTEWxtRKoVINq9jfyY/dfIMhbgEL76mMI185iU
         lDwMVdazkW/U9aSemsidHZsSmryUbrSSNiPQzkADHEizJ5pVF1ci1LXBQN7jguP6XOcY
         gj3+C3Ad3IgHcR4MLUoPgbHw3SPXjeFJbyCagQ6S/QsXtc8Os6JwIyd2nwnorq7nan96
         LUgb/dBuHmx2hgmCuZefrqNqYMEVMHFMgedTlGVoZ2g33rmtrc//7Z+YN+Tds7Q9hBe7
         5prU61bf8W/80BSn+z3II6A+ukbhgcoKkGBYKsWGic6fljWsk+w/dekGWUWp+7jkx5nl
         u5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276735; x=1719881535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPS8Htynt5YVDBSwFV34iezZtSuGdE5NHFiA6AMckwQ=;
        b=FTYWt6Np4F82AipdrlW3lYHDh0EkUICZ/jK/euZc0HhRWEodE2T5TJ8o8sMzFveTEG
         oRZa7n4OS1YXul+ZpXGFdO02nBDI/AMljHoKVJ+9Eu1VuTxS0Ag/avW4/u3+pVeOz2qt
         9NhxO3citCX1t/WJHSaBlLJJtgiNi7jIfccqIOM3A9fC74mrS5QqdKLPwX92z+lOVAFn
         cgrPpBpiepWzJp0u59R9+i1AzjujCDbrqFuMXsw+6T13aFa4qMmPSLEbRknKKXSqt61S
         SGifCGQtuDxRDEIQfQjZwohQQdUDaNNT18erb44deJQyglSgwmb8VSVv0TK7dP493bOJ
         LVRg==
X-Gm-Message-State: AOJu0YwMFm3lFR6QRYfJb8E5gHODHVWDXeHZlsY8NqkRTeD1/9O0TxvR
	AIF6t4fNBEbfc7Non1034WNUV4aKY+e+A0RU9chyI3DM7j9Dje8Av2lwZaCM9dxGmxYwUgeyyPe
	D
X-Google-Smtp-Source: AGHT+IFXUAdJamg8ygnbLMv1f2WUsJYF7iboeHyAr7Z6Y+bevFXHoxCdZstz+th6Yy52wYFD6MOksg==
X-Received: by 2002:a05:6a20:da96:b0:1bc:fd7f:4545 with SMTP id adf61e73a8af0-1bcfd7f49femr6118715637.8.1719276735396;
        Mon, 24 Jun 2024 17:52:15 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:52:15 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 8/8] RISC-V: hwprobe: Document unaligned vector perf key
Date: Mon, 24 Jun 2024 20:50:01 -0400
Message-ID: <20240625005001.37901-9-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625005001.37901-1-jesse@rivosinc.com>
References: <20240625005001.37901-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_175216_385123_84F237C2 
X-CRM114-Status: GOOD (  11.66  )
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

Document key for reporting the speed of unaligned vector accesses.
The descriptions are the same as the scalar equivalent values.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 7085a694b801..d102b4a16d55 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -236,3 +236,19 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VEC_MISALIGNED_PERF`: An enum value describing the
+  performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN`: The performance of misaligned
+    accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_SLOW`: 32bit misaligned accesses are slower
+    than equivalent byte accesses.  Misaligned accesses may be supported
+    directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_FAST`: 32bit misaligned accesses are faster
+    than equivalent byte accesses.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
