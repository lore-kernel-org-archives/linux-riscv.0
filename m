Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918F0C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TujCnrRgQ5aZGBO3ZQGhdynC13uYstL6rkTABsedko=; b=gXWAqbjVur1Onm
	QzGpJYbjfi2Y8ue4g6tvgh0fy+P/B5mkrO9r0oELx1nqzGiQiDfkSZid0iB59yMwm4DIbIoeDVymb
	vl1xvj+DE/7WRxrgVFg+mPjpqEbSwh8pb41vmO41aYsEkCSkiFPDGFV5YPfdzLriv4k/kKw4aFdhB
	spk1kNJQDHhYxAsXidr5KlBQ7+Yee/LmO8VtXjPboNxpDOO+7xNozYu9JtIUztIoq91NFCTvg6gwH
	2C0eH5A+/8BW/cSwgQDUSpwT451tlTOtq0zLuVKuj0BFOlstAAi4dUoHIJgzgaVCewlsMX/SHUo2G
	xLyQfTbvOAyo0QeQyuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpxX-00000000Emz-3L85;
	Thu, 13 Jun 2024 19:18:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpxU-00000000El4-1OL2
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 19:18:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f6fada63a6so12060555ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306283; x=1718911083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lznOWuT3zuZ+7YZNo94Ic++y7Z2ydYmmMFGw8gZ0Wmk=;
        b=K91+dDHeIZ2qDtXmf5F6n6t9oj/W/l8YawyRY9tM/LE3oVKTRWVTZxPfxqqyy6v0PC
         cgWaMDxNgK7IKsoqAvVQC9CObmQjR2Wop0XKPqSn3qHXCYyKwUnnoaZdp3qTiWET1/jM
         Y1+4AlDNEGqm9KJA6D41P7/5Hsy+F/AkCnkGIhg8/N4ikgdUIr58OIfHcDaQxop73ww9
         oUR2WM3saBOOs93kFVwHmR9MDffGDTHSiMjH1O9Vl//A/h0Ljq5iic06bGauTZ9O5Ed6
         HniyLCX1SCT3GYOqUb0pb41B0m0GdShmkxqtRBW/dsalOZq0FPffB8GofIMsQKB5fxYK
         c6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306283; x=1718911083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lznOWuT3zuZ+7YZNo94Ic++y7Z2ydYmmMFGw8gZ0Wmk=;
        b=vMHxo0R/SAKC7d9pwlrJkIimFaVWfG7xcbwNDx9DW9D6sUKWAtJ3SZ9Uq8uB1vb9p+
         lrQjxMrF8co5Zsweb5szkvzvn9zOeXf3jwb3KzH4sSsL9XMyHFrAcSQOFh/8IyF6QpLB
         4WkkbW2tcViMFn3DIypWausioYT+1TOJFoelM3F69Niej2a311O/0YfACG0YdYztpw0K
         r8fh1iLGiSb1pA4jU6Ewv8T/hmuC3XAT0pO5eN1TRJRS5sYgAdEF2g4mVm8MbxGdLkT1
         Vb3W9/OhHp0BZIElZnSww3bX2e99Pw8sWGZWBtztf8SK9IraBehwrx8z8ijBdyfiE+v9
         S4Kg==
X-Gm-Message-State: AOJu0YxFDu4Fk9ZP9ecjMpjEvDUiXo2JNG9xuILWw6U7npQK21RW1oXF
	h1Hflu84kySirIszIqqIOUo6XLghfLPZrJhWtZL5QmnyjXbkkNGW3N8IQa+mtzn81GMjEnc8HZ3
	dEPU=
X-Google-Smtp-Source: AGHT+IH16Z30xWnnVCPD+SWE8CuZmhFACgLpQTZU9/kCBeM9FuPyEaJYp2X2ogoYFLKkXmxabg3ZrQ==
X-Received: by 2002:a17:902:f68b:b0:1f7:1706:25ba with SMTP id d9443c01a7336-1f8625cf2b0mr6158425ad.15.1718306283241;
        Thu, 13 Jun 2024 12:18:03 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:18:02 -0700 (PDT)
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
Subject: [PATCH v2 6/6] RISC-V: hwprobe: Document unaligned vector perf key
Date: Thu, 13 Jun 2024 15:16:15 -0400
Message-ID: <20240613191616.2101821-7-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613191616.2101821-1-jesse@rivosinc.com>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_121804_495895_8D1D334F 
X-CRM114-Status: GOOD (  11.55  )
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
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 7085a694b801..344bea1e21bd 100644
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
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_SLOW`: Misaligned accesses are slower
+    than equivalent byte accesses.  Misaligned accesses may be supported
+    directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_FAST`: Misaligned accesses are faster
+    than equivalent byte accesses.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
