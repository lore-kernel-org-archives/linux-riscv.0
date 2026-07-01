Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97E0C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNOt4qTsyl6hSTetUYlBnGLQJmCTr3IFgB+DsVjtHZg=; b=WV1e1TMDQdPukH
	IzRPFesxx+rqugxsj78RNvqSpl0L0WLQSb/TenT5I1gbI/f4x+5n2+hP2bJ9VSON0Gk2AJ0uGLfG/
	pMc/BBVEG2QWaXVZAw55LaFElA/U1/IeXIaXRVKNnjf7uoHMGtm16kC8qjYgwgg4YKacFxt0skaKX
	wi+EGNWg6p3DED88Ug0tsfF7WYpfR9rluqAD3hvtfnAMyZHXT6+xxeoCj/gUknMQrVdyuVSjuwR6Q
	VVL9Y/GbmMFdC2UpQvllsV+SZ8Y07kp9H48ktXa3/xFDX2t1lAZH2AYI42CjKcaDBzap+WYyIvu9M
	DTs6jSjNL3+b1+x/paxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuR5-000000023QV-12kv;
	Wed, 01 Jul 2026 12:53:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuR3-000000023Py-3CQY
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XiNCgtbo3m8Zp/pgdT1MbOQLedTs5vAYbDe01+rEH+o=; b=hFfmg0J4/zQCk8KNeVKzw9Whac
	1l0LhRx4II8PJjLWRgNN60EAR2kP6bFEiq5MFf4CbhiRusn6Ut4MPGi9oNRs+W9icd7Y1B4ErJpsn
	2VrMTELMuSxfFr/YDgDEWrFggqvwwjKz3F6O9GcVqfzYlU3nL5rUcpFS6iK8rmDj65wt0AmAGP6Zm
	mmSFUA/YqXyhHOCcWtiYHCxgoGDSV9/IgnROXwbG+DkF8sGZgDMluhIfjoVURea+9yZleksMZDNXC
	592FoGWw9hUNius6bSHcgsgJoHzC7z84Jy7mJoZjF0I6EdDlDNsZrFsZiCZXhoJY+ZSuLq7IAEkA6
	XFkRWryw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuR0-00000002mPa-3Fzo
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:53:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-847921eed4aso498229b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910376; x=1783515176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiNCgtbo3m8Zp/pgdT1MbOQLedTs5vAYbDe01+rEH+o=;
        b=LPR8vYDfXtk+btZeqMNWLXDcZ9eT4SQYOC23w5BLaJQrp6W9gRIPdQJZmjT0QufEZg
         fzKrq0K/X6htewY677RnNVaaB2xDzDf3nlUYMEo053fxuYaBKez+sk8GeBQWa5tR4LNt
         +RtXIaDxGnyojNTuCpIVUiEZ+GgPNMcw1iO4jb+ZYo+RprhWDgkzWHm0/iZJs4azyaHV
         ryH8bXeSNi6R2pJ+SGzcry1YePrm/bwF99pj3Zw2Sog5VduZdLLzF7GrYbRBSCEW/esP
         tYknNJH51LPe3IFQvMJYg032q/kesx8r4g1zDPX6g0y9jcbgnsehtg6GawEBg7zukQnB
         nrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910376; x=1783515176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XiNCgtbo3m8Zp/pgdT1MbOQLedTs5vAYbDe01+rEH+o=;
        b=lkXAhRepQ6L2zhrz16XaOhXVJWzpCe+xh7IIyA/7KfCfDub1LWl4sCxeRMyM80cxvA
         dvHHCI9e3zOWvnpcx9YonGWG0elveOffn5c4gL1QBAMglDbYN34G8Sb4qf/VgvhY+lYU
         NKvD9tJ2IiqBY6XHfSvA7dHqtLX+vmvjJ77ZzTM5uOAGJ1MRD5xULPYypzZrtHNDDdZ3
         Rr3SwqSxj+X5//MYbZZk/c61tDz0Vhmp3UAuHdI4noAD0yKM3KD4b2lXCDFo7pjCXAmJ
         yJEewe3k0Ud6yjnfv/OXgQjjP4d1NAttCU1nN31iosC4HhQFbqTSR7etBUNpta2e/pN4
         9tew==
X-Forwarded-Encrypted: i=1; AHgh+RopgKy71opJOZgU4wQ7Ow0PSwEOPnKrJQu1WwP5/LYR+m1WOqFzGCbx5z+5o6zsy34CUNS1XTv7clHCtw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5VJ/jimqHxYSmhnJCBfyFAL4i9/1mXeld65uP9Z5w6XUUTqgH
	koJcXT4M3JKVVeChTBVDvJegek+KkqV61zhjWENt1RZsln2yROSK5XD/
X-Gm-Gg: AfdE7cki25vlNNso6mgBSe8MX732G9yLdr/Z2TEptVtqSxDyEP/M3qWfEUG6b4zl0Qb
	Pv+ZvIPpyHSD/OXuWeb7S7T+HWDMssmhxkEsj5oGao4W/xeIhy5w5TBuZLBKKf6/x9qRiphExjP
	/csVohI2UoAN6G1Cqute2wXXxHnTtkYeRTJINqR1YZPdg8BgCXdWTx51rHGMOyvCElBYFZTQr7X
	f0PlMGPetPNspDQh2/tK15/3NVP8TpgyqC4p6TdSd101epLZdIB6S3MgqFRVksDvgXfr3wO/2eb
	Tn/1AlL2GUgZRTddPR/e5W05DjnV1LRp5SVKuFI405HO13oPRGj8P3g0qXegSGe3ehUoc6LRON7
	WZZ6elb0d73sNw4O0wLf4Lkk1YvEZMlkc2rwpeZi+x3S6/UBSqUIFZHsqnzbxmkPjvWkCQpHj0N
	Y79d7WDlItbQZKj7V3zhp0AK+mDF7A4K0=
X-Received: by 2002:a05:6a00:f0d:b0:845:d650:b75f with SMTP id d2e1a72fcca58-847c4fc2ac7mr635537b3a.8.1782910376318;
        Wed, 01 Jul 2026 05:52:56 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:52:56 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:15 -0400
Subject: [PATCH v5 02/17] riscv: hwprobe.rst: Make indentation consistent
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-2-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=20540; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ubRAs1mx0Pqw7ohjvd1NhXi/Ten5PlHxmGQHGPb+Xuw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3uaCmXNz169U+2i77ruBywmugmnuCp9vvrC6JPdXT
 PrV9eNbO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiET6MDJ9keIT4mp86rYpi
 mbzWXdmkUyjqzAfPrSv1TCS3fvve2s/IsNfk90wN8aXyIjpPDZstDfIr7YLuMVoeWnZJ6fMT3RM
 d/AA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135259_071356_FADB9E9D 
X-CRM114-Status: GOOD (  12.41  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

A handful of vendor-extension entries indent continuation lines with a
tab character, while the rest of hwprobe.rst uses spaces.  In addition,
many list items align their continuation lines under the 'm' of
':c:macro:' (column 7) rather than under the item text (column 4), so
the file mixes several indentation styles.

Replace the tabs with spaces and align every list item's continuation
lines under the item text, giving the whole file one consistent style.

Whitespace-only change, no functional change.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: extend from tabs->spaces to normalizing all continuation-line
 indentation across the file]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4: No change.
v3:
- Move to the front of the series.
- Extend from replacing tabs to normalizing all continuation-line
  indentation, so later patches add documentation on top of a
  consistent base (Andrew).
---
 Documentation/arch/riscv/hwprobe.rst | 194 +++++++++++++++++------------------
 1 file changed, 97 insertions(+), 97 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc68..a09a8f16bd16f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -82,121 +82,121 @@ The following keys are defined:
     version 1.0 of the RISC-V Vector extension manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
-       supported, as defined in version 1.0 of the Bit-Manipulation ISA
-       extensions.
+    supported, as defined in version 1.0 of the Bit-Manipulation ISA
+    extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKB` The Zbkb extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKC` The Zbkc extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKX` The Zbkx extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKND` The Zknd extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKNE` The Zkne extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKNH` The Zknh extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKSED` The Zksed extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKSH` The Zksh extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKT` The Zkt extension is supported, as defined
-       in version 1.0 of the Scalar Crypto ISA extensions.
+    in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVBB`: The Zvbb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVBC`: The Zvbc extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKB`: The Zvkb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKG`: The Zvkg extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNED`: The Zvkned extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHA`: The Zvknha extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHB`: The Zvknhb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKSED`: The Zvksed extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKSH`: The Zvksh extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKT`: The Zvkt extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFH`: The Zfh extension version 1.0 is supported
-       as defined in the RISC-V ISA manual.
+    as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
-       supported as defined in the RISC-V ISA manual.
+    supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTNTL`: The Zihintntl extension version 1.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFH`: The Zvfh extension is supported as
-       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-       ("Remove draft warnings from Zvfh[min]").
+    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+    ("Remove draft warnings from Zvfh[min]").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFHMIN`: The Zvfhmin extension is supported as
-       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-       ("Remove draft warnings from Zvfh[min]").
+    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+    ("Remove draft warnings from Zvfh[min]").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFA`: The Zfa extension is supported as
-       defined in the RISC-V ISA manual starting from commit 056b6ff467c7
-       ("Zfa is ratified").
+    defined in the RISC-V ISA manual starting from commit 056b6ff467c7
+    ("Zfa is ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZTSO`: The Ztso extension is supported as
-       defined in the RISC-V ISA manual starting from commit 5618fb5a216b
-       ("Ztso is now ratified.")
+    defined in the RISC-V ISA manual starting from commit 5618fb5a216b
+    ("Ztso is now ratified.")
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZACAS`: The Zacas extension is supported as
-       defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
-       from commit 5059e0ca641c ("update to ratified").
+    defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
+    from commit 5059e0ca641c ("update to ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version 2.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is supported as
-       defined in the RISC-V Integer Conditional (Zicond) operations extension
-       manual starting from commit 95cf1f9 ("Add changes requested by Ved
-       during signoff")
+    defined in the RISC-V Integer Conditional (Zicond) operations extension
+    manual starting from commit 95cf1f9 ("Add changes requested by Ved
+    during signoff")
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       d8ab5c78c207 ("Zihintpause is ratified").
+    supported as defined in the RISC-V ISA manual starting from commit
+    d8ab5c78c207 ("Zihintpause is ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32x is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
@@ -214,84 +214,84 @@ The following keys are defined:
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIMOP`: The Zimop May-Be-Operations extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       58220614a5f ("Zimop is ratified/1.0").
+    supported as defined in the RISC-V ISA manual starting from commit
+    58220614a5f ("Zimop is ratified/1.0").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       c732a4f39a4 ("Zcmop is ratified/1.0").
+    supported as defined in the RISC-V ISA manual starting from commit
+    c732a4f39a4 ("Zcmop is ratified/1.0").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
-       ratified in commit 98918c844281 ("Merge pull request #1217 from
-       riscv/zawrs") of riscv-isa-manual.
+    ratified in commit 98918c844281 ("Merge pull request #1217 from
+    riscv/zawrs") of riscv-isa-manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported as
-       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
-       ("integrate Zaamo and Zalrsc text (#1304)").
+    defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+    ("integrate Zaamo and Zalrsc text (#1304)").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
-       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+    frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
-       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
-       ("integrate Zaamo and Zalrsc text (#1304)").
+    defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+    ("integrate Zaamo and Zalrsc text (#1304)").
 
   * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
-       defined in version 1.0 of the RISC-V Pointer Masking extensions.
+    defined in version 1.0 of the RISC-V Pointer Masking extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
-       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
-       riscv-zabha.
+    ratified in commit 49f49c842ff9 ("Update to Rafified state") of
+    riscv-zabha.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZILSD`: The Zilsd extension is supported as
-       defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
-       load/store pair for RV32 with the main manual") of the riscv-isa-manual.
+    defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
+    load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCLSD`: The Zclsd extension is supported as
-       defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
-       load/store pair for RV32 with the main manual") of the riscv-isa-manual.
+    defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
+    load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
-     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
-     mistakenly classified as a bitmask rather than a value.
+  :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+  mistakenly classified as a bitmask rather than a value.
 
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
   the performance of misaligned scalar native word accesses on the selected set
@@ -326,7 +326,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
 
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
-     performance of misaligned vector accesses on the selected set of processors.
+  performance of misaligned vector accesses on the selected set of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
     vector accesses is unknown.
@@ -348,7 +348,7 @@ The following keys are defined:
   * MIPS
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL`: The xmipsexectl vendor
-        extension is supported in the MIPS ISA extensions spec.
+      extension is supported in the MIPS ISA extensions spec.
 
 * :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
   thead vendor extensions that are compatible with the
@@ -357,8 +357,8 @@ The following keys are defined:
   * T-HEAD
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
-        extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+      extension is supported in the T-Head ISA extensions spec starting from
+      commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -370,20 +370,20 @@ The following keys are defined:
   * SIFIVE
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
-        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+      extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+      Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
-        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+      extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+      Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
-        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+      vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+      Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
-        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+      vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+      Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
