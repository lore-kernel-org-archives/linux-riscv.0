Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ABED3C52B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2wgi/etVs/MO+16SrvlBJHm/k+bflFbcqQJP9QEkNo=; b=VcuF2aFhrBsDLP
	O270U+tI8NFsmiYmm/cIkPbnqRumblVgmjxPmPJjCvzXgNpwv6h0hYnhUmybwkCVodly6OfN9BDX0
	7Qrf1ztmvkDunMuywUSXD5TDTYUTH1UaaYeVDYjjgyvqIO+mGuEBOVT4LbbBQ1OxjGyitURd9id8I
	iJTmCM9zZjG+5CNKtQJhbs3HR6kPEFSGQAM1ScZ+7oQP1l9am5AslDh4yrH58jBPr5Wma09vpXA2u
	TYZHHYCQTTO1KlTJm4viu5GrUtMJJ2G+2yRZ3sFxq+My83UPY1XdZm3OrVEfjM30eltyoxH0XnFdL
	t7KFPNGp6NXVmmTYNxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vk5-0000000FxvW-2vGD;
	Thu, 17 Oct 2024 19:01:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjn-0000000FxiO-0Qsg
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:00:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so956970a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191642; x=1729796442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPAVzZvGNC+Cq6OJdsBvlbMk1hqGCWfC5CF15zw1LQ4=;
        b=kxXTvyZ8UNqwEfLFZ49NAiGfVdM8vkPEI03ACrifVvcyE/NkqO+i/xK4RftgKm4G3i
         G/8zkaJRMNqOC0hYrtnIfgUhVrWU5edJIr2hF0KS0TNRflG+qfAU1joJSGrXOS5c4Y4z
         aet2GCQ7xEf0mrKEF+4EFdkxSwc6UCznBiAcXyWdHudh40GzE1y1hGqbNwTA+isCSFdj
         jpXPF5i+6ZfzAGrZRPhVN0n9xk8Qlg8AxsCKU4Pz++M66XNWa+2Bor1sjGdOC/gEcvgg
         AJxUex5D4tQUwcArtv4zJDl8YRYdnkwI7wUpkN4aMixxTFBqnC0lVlYz+ZrTebRMtD74
         sc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191642; x=1729796442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPAVzZvGNC+Cq6OJdsBvlbMk1hqGCWfC5CF15zw1LQ4=;
        b=gWwa5viM06u6c32nIoPvz0KX0Ls+euVZZhIuFqJJm3DtPUC8y3rnq9AC/t0Bv2UYmO
         b79S0luV+Kse6s2nfVtk2wZFlTWg/Zk/FIxgjPsAIEfWkcrZvubUIakG0fsbObTY/s+G
         uvE75NoGH+1/puLchizPapQr5iskMi8tutzFlO/jybMpfFHIluW4pqsFQ4Xh2Wx5Zi7u
         /oEfDo3OSw7gf7mkoBhmauV61xbtg7JP0yJqpxuwqBqhEF8hQ02VYIbH5peF9KEOSm/U
         mD2OVoiwak52daEwp5f/HMVTuqv8GV2pOAwrgH0sFBky7DuLVE02bVoqkDzBk82pCfFX
         A5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWup2ipDQ7jCQRDy9qxYpwNrRyS6xg3y22Z0XgIRIOk+lX9xZMwMyc2/+edxoiGyP7PahkEsPm08lnVqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45qqg2VlpODgrjLZzflFXWlu+ronhShok9mC4rhn0pOR+gJUb
	ABLwyXwiraAjtYdfK3hJnlipC20SaV5zamVP1kcrwJ3bsrjrSNuhABx7T9IvO70=
X-Google-Smtp-Source: AGHT+IFD1K8hfsHUiXmeZVKeW3p91vhUvYABl1u9xDphtGLBC6BeVBFQofI8bMkXBvRW+A2mzRSPUg==
X-Received: by 2002:a17:90a:4585:b0:2e2:b922:48a with SMTP id 98e67ed59e1d1-2e3152eb165mr23708976a91.18.1729191642337;
        Thu, 17 Oct 2024 12:00:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Oct 2024 12:00:23 -0700
Subject: [PATCH v10 6/6] RISC-V: hwprobe: Document unaligned vector perf
 key
MIME-Version: 1.0
Message-Id: <20241017-jesse_unaligned_vector-v10-6-5b33500160f8@rivosinc.com>
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/YcsX6Aye3XfW3dwDX4ZxhR2Fq2M2Cb82ITWD1NVBc4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3Lm/exUD3h5QadOSa7lsvbWryzJP+451LBOPRnu9h
 ezD1ZM6SlkYxDgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmMixfob/Ybvvu7JPbPxxakkK
 52NZoaVP+WYuZD43/8YZ27u1G2b7NzH8YnZ3CrKSLvI3Fp8iuH/Xu22zq1/tEQpnjWl99cPU7PR
 yRgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_120043_291779_17BEA842 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Jesse Taube <jesse@rivosinc.com>

Document key for reporting the speed of unaligned vector accesses.
The descriptions are the same as the scalar equivalent values.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..ea4e0b9c73e7 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -274,3 +274,19 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
