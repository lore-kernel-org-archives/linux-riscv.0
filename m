Return-Path: <SRS0=2LT1=HI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3EEC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 10:02:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F4E64E5C
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 10:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0F4E64E5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oVQLau4QxcuL3qM3dL8qUeahv8MNHwZ51BKD1PPCnao=; b=L7BiTvc4GlK4vFA3NiRb+ZnSYh
	OA9oIbVtL/obcmTLNkjP0TZGrecqfv4R2nqujgDlmZpAvA6H0VdPpC/uvXdYEensEL0hN+VbmqOOR
	UCDlgAfAZW52qDj6/d++lyh8SmAYfN7/F0Oqz4Fm9d+l8XvRWW3IIAnINg3dmGmvvQi7Z5JE1R+Wg
	CZvWvfrdXiEDPGU0jDfVVHVM+koGKv8FOgdilHF00gPArzFZS0mFJU0Qis9Ir/cZcloMy5Kbw1t/I
	HNefYEJ3QQ5WhGQgVwHpr088E34XVc3q4CR7JaboF+Z0WDdeK8oCyrYiMDAc/xPnoxJve0+Ed01C9
	0eWFBCug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8KPa-0007JT-Ac; Sat, 06 Feb 2021 10:01:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8KPZ-0007JM-Gr
 for linux-riscv@merlin.infradead.org; Sat, 06 Feb 2021 10:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Cx9VL93k3tyxQYx5WuPJE6jphHlH1ur0iw5UkEru2nc=; b=TwC/TzLLSiFsDYZBgP/JqPsw4a
 6x7JsAoGYc1d4zsp2A/6sK4i8+uKPb/8XA7jVk2sgHj+iKitKRhzVOoWUQwvVTQVI7YY4yyCIHZ6G
 ordPuJLh1c/e8a5256DrQoYpBUUzZ2NK6y24UiYwnxi4ECT5BSHNUkyGcO7OMo1RkC22fFIBYalYs
 onJJ64mTdWFfzNeuzZ/Fj5gMmNKwmVJp/8fa7fNrIAHk5zmYkGUsk1yv8R4nOx3cZtyQm6CKyyU0k
 IYJT0YqIrflOjG6s1FtE91sMKd7nV6Ldo3gjhjvyVvg2ajYMmtpxGOVY4Imuvz1SezeNURfEtgtpR
 tgWA0CvQ==;
Received: from mout.gmx.net ([212.227.15.18])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l8KPX-003R0p-MF
 for linux-riscv@lists.infradead.org; Sat, 06 Feb 2021 10:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612605694;
 bh=iRGL7FWGbS8lM2q90/wYQp1C2YaJp0pAX99Mh1ZkBJI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ITSJlgqOgnjlBmQSI7u5Tr0R3RoM1ekTI+Kw9Frjs+1UxxjT1Ym1t4Gz7nXPz/6YB
 D/6TiWN9pDTE1rAnzF/WVYBCGA+5n9KSF42/Y3807m0w4s/1Hk+Q+3wX3qQk7KB7oW
 z6pB2ygKLow1Rb1l6S7eJNt8BHOMrptMeZw4airQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.246.89]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MOiDd-1lHtpZ1IPH-00Q8xK; Sat, 06
 Feb 2021 11:01:34 +0100
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs: update EFI stub description
Date: Sat,  6 Feb 2021 11:01:15 +0100
Message-Id: <20210206100115.58074-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:l8qcEMLM+q98tifEQUVifOqzq8mbDrZvtjXPzNpOcEs3ylpjSaY
 0iyi/6lmi9OUYa+jAPiVe7IobgtHDytWHPyNmBOCEVLXXnux1DTBFV3YN5/0PJWvjWcEykY
 Jg6c5v9urzKjZBsOMr7piX0bND0X2dE7duA5WNtQzp0/yG1LJvBn3OZ96ay/ix05biNDYyy
 3ZwWD4BCotPG5LVLY7T7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4MkptHc9bXA=:IiEAiAK9dOtd2NTs3c2Pem
 lSupszveXV4JXmeXK88kELbCIbnmwWJj9VL8eJl0pATLDAsYR/GAesRa2+69r92u5+jwMyGU2
 TvpdKL/EvBoUTfUoHvr3zNDnhT5KBjcufVZGxMEgQ1zkFTJuFYxp1v+3BRqLoH2gUIMlQn9B7
 ZHuMvhIpqWHvN813SqvlocCtyN9RdiW17KKnvKZKXi4Yrt2hEayK1BE8zoqCgXa/VHjGIsrDY
 U+VOqnXhq5deeEiaW7KUaSmvjIjg900irbNLfB1e7capIjXMOzPHl0uZcNHOjxCvB/n077Msq
 IjwBroqZKU9xbGZrwJwcvWZ4S2Wxh0Mb9P4t4B2Tf+hrvBXGM3gJ0Wk2oeRuLHqJhddtAniI1
 d2NdyNQShAEEv7pc0vWq5S96ijmcJA0yd80Go+0C/U3uVLF15x7jDvU0uMGRFrqF1gecq4lML
 txjlt30Rzmp+qJ9A27JWyCWVT8xUsPMAljzXoYwo/XqeA9T5lhdvQQkMy/KaEm9RND67sP878
 3vtv+bzEsHx43RdTbQKiwkbjCVKnzz9QODLS4in4fom5RQHikS7aeLfY9C93zxCbgBL8bxeYX
 RxCYx6h064bGiyKLqY84dyqmoAJB30huZ1x8kSF4O0wSqtjiMcSwtmjkz0W1TbVub2CXYbgeM
 oADkjtJSfy81xdFCoCTRkubKt5QU8hLmeTcuifJNzRKFlEwH1OCBz4c2EkiV2xA+Wp+TjZPsg
 9XuhpuqgDhgsy7aa/UVKcmxabtYJCt1e5SPuGCjVXwPjvNTvA33v6f5RhSteVPRIcQ4sRTWYN
 aoqDq/6yhH/n7dMNchQ94H6swcp6HxI6GcNUbIyl1XuSRftVEHPhYOyUa6YTjYY6Ap0MDrkFN
 MZQUYKOQWJfL35egQV0A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_100152_013236_00633F21 
X-CRM114-Status: GOOD (  17.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

* Mention RISC-V.
* Update code references.
* initrd= does not specify a path relative on the ESP but to the partition
  from which the EFI stub was loaded (as specified in the loaded image
  protocol).
* Mention that ACPI tables and device trees are alternatives.
* Provide the FDT GUID.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 Documentation/admin-guide/efi-stub.rst | 47 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
index 833edb0d0bc4..9e1bb79e8655 100644
--- a/Documentation/admin-guide/efi-stub.rst
+++ b/Documentation/admin-guide/efi-stub.rst
@@ -8,15 +8,20 @@ it as an EFI executable. The code that modifies the bzImage header,
 along with the EFI-specific entry point that the firmware loader
 jumps to are collectively known as the "EFI boot stub", and live in
 arch/x86/boot/header.S and arch/x86/boot/compressed/eboot.c,
-respectively. For ARM the EFI stub is implemented in
-arch/arm/boot/compressed/efi-header.S and
-arch/arm/boot/compressed/efi-stub.c. EFI stub code that is shared
-between architectures is in drivers/firmware/efi/libstub.
+respectively. For ARM the EFI stub entry point is implemented in
+arch/arm/boot/compressed/efi-header.S.

-For arm64, there is no compressed kernel support, so the Image itself
-masquerades as a PE/COFF image and the EFI stub is linked into the
-kernel. The arm64 EFI stub lives in arch/arm64/kernel/efi-entry.S
-and drivers/firmware/efi/libstub/arm64-stub.c.
+For ARM64 and RISC-V, there is no compressed kernel support, so the Image
+itself masquerades as a PE/COFF image and the EFI stub is linked into the
+kernel. The EFI stub entry point is in  arch/ARM64/kernel/efi-entry.S for
+ARM64 and in arch/riscv/kernel/efi-header.S for RISC-V.
+
+EFI stub code that is shared between architectures is in
+drivers/firmware/efi/libstub.
+
+The common secondary entry point efi_pe_entry() for ARM, ARM64, and RISC-V
+into the stub is in drivers/firmware/efi/libstub/efi-stub.c while x86 uses
+drivers/firmware/efi/libstub/x86-stub.c.

 By using the EFI boot stub it's possible to boot a Linux kernel
 without the use of a conventional EFI boot loader, such as grub or
@@ -35,7 +40,7 @@ the extension the EFI firmware loader will refuse to execute it. It's
 not possible to execute bzImage.efi from the usual Linux file systems
 because EFI firmware doesn't have support for them. For ARM the
 arch/arm/boot/zImage should be copied to the system partition, and it
-may not need to be renamed. Similarly for arm64, arch/arm64/boot/Image
+may not need to be renamed. Similarly for ARM64, arch/arm64/boot/Image
 should be copied but not necessarily renamed.


@@ -55,10 +60,11 @@ multiple initrd files using the "initrd=" option. This is the only EFI
 stub-specific command line parameter, everything else is passed to the
 kernel when it boots.

-The path to the initrd file must be an absolute path from the
-beginning of the ESP, relative path names do not work. Also, the path
-is an EFI-style path and directory elements must be separated with
-backslashes (\). For example, given the following directory layout::
+The path to the initrd file must be an absolute path from the beginning of
+the partition from which the kernel was loaded, relative path names do not
+work. Also, the path is an EFI-style path and directory elements must be
+separated with backslashes (\). For example, given the following directory
+layout::

   fs0:>
 	Kernels\
@@ -83,18 +89,19 @@ is passed to bzImage.efi.
 The "dtb=" option
 -----------------

-For the ARM and arm64 architectures, a device tree must be provided to
-the kernel. Normally firmware shall supply the device tree via the
-EFI CONFIGURATION TABLE. However, the "dtb=" command line option can
-be used to override the firmware supplied device tree, or to supply
-one when firmware is unable to.
+If ACPI tables are not available, a device tree must be provided to the
+kernel. Normally the firmware shall supply the device tree as an EFI
+configuration table with GUID b1b621d5-f19c-41a5-830b-d9152c69aae0.
+However, the "dtb=" command line option can be used to override the
+firmware supplied device tree, or to supply one when firmware is unable
+to.

 Please note: Firmware adds runtime configuration information to the
 device tree before booting the kernel. If dtb= is used to override
 the device tree, then any runtime data provided by firmware will be
 lost. The dtb= option should only be used either as a debug tool, or
-as a last resort when a device tree is not provided in the EFI
-CONFIGURATION TABLE.
+as a last resort when a device tree is not provided as an EFI
+configuration table.

 "dtb=" is processed in the same manner as the "initrd=" option that is
 described above.
--
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
