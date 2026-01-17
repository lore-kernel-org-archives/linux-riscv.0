Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8063CA5FE8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88YWy+ZJ6zJdb+QhdlG71K1UM3FQLvmoRHKY1UG04uA=; b=GnXMpM6qweIBca
	QuRn5Al883NySkUj7KQ/I8o9MW13DHBnRjNUj86ZhtfY89+7A4qHvPqmx5QE4n/PPkPUiqU7UllGJ
	u1K8+lBTtNT2NKagS5DbfiRy8CFkrm2DnjTEwGtKv4n5eShcPNjy/+I5pTyWEZmH9pvgWICNqJddY
	8nxgtPaPVg7EA2JCLAgJgbL+Meouox4kks39JkvdUds9p8fKsGUwbLyxwENOZ8fW+iE428+ZtFSnX
	QTajyLTuxe49rt4d1ktKyEYAc5ayaMa/O+PAh1ALZPO3cD05njqXEBbPPloft9vNieC5qUZpj8rvU
	7MnbYmPrSSCXxTvaHaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhFmf-0000000GDGu-1mua;
	Sat, 17 Jan 2026 23:32:45 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhFmd-0000000GDFy-0PPF
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 23:32:44 +0000
Received: by mail-oi1-x242.google.com with SMTP id 5614622812f47-45ca0d06eddso1174365b6e.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 15:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768692761; x=1769297561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QCMS+eF83vmFIaisSFMfMqnhtdmha//28PB8xvwFi8=;
        b=A2awtrq1av2uWOlKOFN9dilkzT+Hrz77nRCNXG7FRFyqnlcf9EOe8yAZdETbTZEPmw
         5BGA7+58BwOHdh6fhNOGv+DGi6D1AxDwXllqem0RjA3YCtyIkJCVbjgdnXNYF+wx46Y0
         pUkFSWBI2zoE/oFGNiuigjquOAiFZXBDO0cUOxFsQOAvL2bxrHQ8FlQKdix8pNEdtvkx
         oyq2GJ7JGJojbR8UIJbikCWPmP5DMXmYCqwQZFh7Xeb3dxDCdMc5okoo2iJKOXzEoiu0
         jtCUaYpaJyFQYasjbmIwg4KAhN2qm3j4vVqNs+Lb7j1+12Hu4XXnkOvmP3n8AiL/5sKJ
         HkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768692761; x=1769297561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9QCMS+eF83vmFIaisSFMfMqnhtdmha//28PB8xvwFi8=;
        b=gzkiZOzxOhOMb+RTSB/q2D0IxiKhJpiHDCAwQ696dC4snipnBxa5IZXoVTjWYbwwXJ
         Lg9TrLgrtV4paYbOCXgwlFzQd35KKeitxgwz1m3yK/QsGuXl/+7yMMqLQ7vO+K8hMFAN
         5c/mcxZ9F2omZJICHw85+h+nhp9kTXEcQZrG/lRZc4v5/qHmw81rB8/0h7d5U9Z5RJl/
         KW3ioIG4e9mG0+kUzz/0F6QgXJvV2YaAPF2wz2gvyYtzpfDLC/9kGUH+XpxOm0D4FjTq
         ZXVw8CG6unscWktcNP0fm+CqXaq7yo4hXc1HSaN+Lew0vay1nUbEIpx3oUkgS+ITE2Iv
         rmHA==
X-Gm-Message-State: AOJu0YzBoaRWjZPywWEFPFJtNdgWKlu7CTrCqszibygItTTttdT7CuZa
	heiKH+aPlargyQ0Ch4sZcREv3qc4k9pX8sh8Tpp4A6u+vriQtNBHl1WFKfiE82AVRv4=
X-Gm-Gg: AY/fxX5W/vl0tZ1hc1bkGprLZuy7ssrCJ3BgLPIkQ2n7gt+dw9b2Y0NZZ6w4lU+Cw1n
	VSEUEmFJW9MZ8L4uLO9kyZVKRYty4DAPDqwKRHJTgASExWwKIgJjUzuNZcb/A5mv+6EdiX/RZYj
	G4t1GAecFoxIpYEousZERsufe6Al8e1qiJPVGqNi5+6cb3WwvcPd9pfgH62fLXX3bo2EH+/XdKo
	NdVonH4Zsoht4IijXYsBJd/xs9SqpqwxXb0pB/cfgoicB9VWaTroqWjtm1gSHN0puNLL8NaHHot
	F3UtxB9uvILmOzg/2zp66027+Uljiq3y/c6ziAU4GTgK0z+BeFJ5C8MZICpGtS5WlknAF2V6+vs
	+k94NmK+FSqzge3v+2dNA+CaF/PZItLpwLjUfE5rkYsex1nxUbXtI2TjjBWOGN3KUnDxk71aaPb
	gAUGmHzt7g2HVBIWmgO0ORRzDv4V94H52R9HHhbYd2
X-Received: by 2002:a05:6808:30a2:b0:455:dfc8:46a6 with SMTP id 5614622812f47-45c9c018560mr3951786b6e.28.1768692761657;
        Sat, 17 Jan 2026 15:32:41 -0800 (PST)
Received: from localhost.localdomain ([50.24.139.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e0086a4sm3424232b6e.12.2026.01.17.15.32.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Jan 2026 15:32:40 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	pjw@kernel.org
Cc: Andy Chiu <andybnac@gmail.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 1/1] Documentation: riscv: update Vector discovery for userspace
Date: Sat, 17 Jan 2026 17:32:27 -0600
Message-Id: <20260117233228.36088-2-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20260117233228.36088-1-andybnac@gmail.com>
References: <20260117233228.36088-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_153243_166265_CD89D591 
X-CRM114-Status: GOOD (  19.82  )
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

Make it explicit that users may use both HWCAP and
PR_RISCV_V_GET_CONTROL for checking the availability of Vector
extensions. This addresses the ABI usage concern[1] arised from the user
space community in supporting Vector sub-exts and multiversioning.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=220795

Suggested-by: Zihong Yao <zihong.plct@isrc.iscas.ac.cn>
Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
Changelog v2:
 - fix a document build failed reported by kernel test robot
 - rephrase some sentences and make it easier to read
---
 Documentation/arch/riscv/vector.rst | 51 +++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
index 3987f5f76a9d..47513edfa879 100644
--- a/Documentation/arch/riscv/vector.rst
+++ b/Documentation/arch/riscv/vector.rst
@@ -13,13 +13,14 @@ order to support the use of the RISC-V Vector Extension.
 Two new prctl() calls are added to allow programs to manage the enablement
 status for the use of Vector in userspace. The intended usage guideline for
 these interfaces is to give init systems a way to modify the availability of V
-for processes running under its domain. Calling these interfaces is not
-recommended in libraries routines because libraries should not override policies
-configured from the parent process. Also, users must note that these interfaces
-are not portable to non-Linux, nor non-RISC-V environments, so it is discourage
-to use in a portable code. To get the availability of V in an ELF program,
-please read :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
-auxiliary vector.
+for processes running under its domain. Changing Vector policy by calling
+:c:macro:`PR_RISCV_V_SET_CONTROL` is not recommended in library routines
+because libraries should not override policies configured by the parent process.
+Also, users must note that these interfaces are not portable to non-Linux,
+nor non-RISC-V environments, so their use is discouraged in portable code.
+To get the availability of V in an ELF program, user code may read the result of
+:c:macro:`PR_RISCV_V_GET_CONTROL`, or the :c:macro:`COMPAT_HWCAP_ISA_V` bit
+of :c:macro:`ELF_HWCAP` in the auxiliary vector.
 
 * prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
 
@@ -91,9 +92,9 @@ auxiliary vector.
     Gets the same Vector enablement status for the calling thread. Setting for
     next execve() call and the inheritance bit are all OR-ed together.
 
-    Note that ELF programs are able to get the availability of V for itself by
-    reading :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
-    auxiliary vector.
+    Note that ELF programs are able to get the availability of the standard V
+    extension for itself by reading :c:macro:`COMPAT_HWCAP_ISA_V` bit of
+    :c:macro:`ELF_HWCAP` in the auxiliary vector.
 
     Return value:
         * a nonnegative value on success;
@@ -138,3 +139,33 @@ As indicated by version 1.0 of the V extension [1], vector registers are
 clobbered by system calls.
 
 1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
+
+4.  Vector Extensions Discovery
+-------------------------------
+
+Existing kernel supports running user-mode Vector code on hardware implementing
+various sets of Vector-related extensions. Zve32x is the minimal subextension
+required for hardware that implements 1.0 version of the spec. Or, full v0.7 if the
+kernel is compiled with ``RISCV_ISA_V && RISCV_ISA_XTHEADVECTOR``. When the kernel
+recognizes and supports an extension on a hardware implementation, the kernel
+indicates its existence on ``/proc/cpuinfo``, and the corresponding bits obtained
+from ``riscv_hwprobe(2)`` is also set.
+
+The existence of an extension does not necessary guarantee its availibility to
+any given process. The user process is responsible for checking if an extension is
+available before using it. Traditionally, :c:macro:`ELF_HWCAP` is designed for such
+availibility check. This remains useful for checking the availabilty for the full
+set of v1.0 Vector extension, defined by the isa string "v", by referencing the
+:c:macro:`COMPAT_HWCAP_ISA_V` bit.
+
+However, even though the kernel provides compatibility for flexible hardware
+configurations, the kernel does not report the availability of "v" subextensions,
+nor pre-rectified Vector in :c:macro:`ELF_HWCAP` to prevent exagerating the
+limited bit space.
+
+The bit in :c:macro:`ELF_HWCAP` is designed to serve as a quick check to see iff
+the standard "v" extension is both **pressence** and **available** to the process.
+For any non-standard Vector extensions, the ABI guaranteed way to identify their
+existence is by going through the hwprobe(2) interface for the existency chek.
+Then, ``prctl(PR_RISCV_V_GET_CONTROL)`` serves as the availibility check to see if
+executing any Vector instructions is allowed by the runtime environment.
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
