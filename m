Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31984CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gsoWjnLe9mzVigSJdfWOxzaNnzmDxnw4e5RTdZjmT8=; b=sloY96ULueDK3r
	ipGHrJ9LALQWY67/6ANTy2fUkg78snpZfoZw9WfN3HATpwvuy8cTpy9g5YwynGdhJsHR5Xc399LZ8
	JmzAQk1r6D6DFHw7R57kmewAuTig3f1zOBBK54In+ynnAfmRae2en3c+2twJgEIqo5QxRCF/oBb+1
	NG9dR7TTOIFgtJbsbFsvec0g881/ZK9Syk2OATWkxjK6tmIqaZ5KS2VOl15ax/EM9PFddBJ+eW3uC
	bs/f67kmfD7PJyUstYcZzyWagvK39i9w8+Vov720GGby5B/M7tX+xcyqIGWrojnDAGWXxDJRcOVTk
	jIG3pJzhFptl6xr6GX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKO-00000001nXk-3dms;
	Fri, 16 Oct 2026 03:09:52 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYKM-00000001nVK-3Sex
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 03:09:52 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-3a51696a650so3488966a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 20:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120190; x=1792724990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=HZP4TFfIhleXd29EtYPA1FAVZaQP2+Qe0OGOYNOodWuK4jWShIQf8Rh447h81LkDgE
         iR2sRMIcHd+O+XHquD5wegxEFrlPBOEuzBVcoIYIPEiMlCxGGJD9OzhkCL2txOISrRyN
         R4g8rZHenYARiGfz4+2s09gz8ZkZtCRANpliaj0qbmMbv0+y6nQkQa2oI9KgXc7sH+Qp
         Z2QqgcEVp+uTowIdjh1eCyUWTXvk5GoXfLU0ricNBqR7fqHzuQQ4UgY8EYtI+TokjIKR
         8SGYmoiXSu4GFKJORPJFb/OjYV44yqqrVlqVpyx/WJD/yXW90FbQr73a7GoZ60v6fOJ+
         5I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120190; x=1792724990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=Psd6nq+dRTPCEcvs6P7zxKeSllqtMyvWHnZYdD1PzVI3XiSoVW9/Wn3gV9gVfYrOkk
         zLLnsQRH2maAAWMXNhXe4fC1Uq3roROmvKRr/c4eMCY0gHdQoVKGL/xx8QiMRzL+FYnk
         DpPuaAhrdd4pu5w1x9kPTCrHVZI3uoNngga9JG974YyS5DLRfIMEHam6SFdT1hT4qDxF
         nzlWKfW4SEbd6vgpfRER5KaAqwaQPpwN0dX4s79LEBzhW2fEsOaia1DJmrjwFukb4wlj
         pi5/ZV3FLQBGSEUmgPHEeb37on/evgz6rLqDhU2zMF9UjFrNSZQUizm8tmYUvwH6PFER
         JEMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOGBlwlfc2UacNYF7LvuayXQiwSU+NJ/aanxLRBaJEHOTn6E96N4hwyBuRUAblS3xjARpCl/yeK8Ou1w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIU18tEPE12//Od8fimTuUtW8BR2Q6Zt1whlDMuls2WsGsQ+m4I
	brCKVbI0GQ2ER/ZIO1gQrV+1lvAUH5Q069UQfc1O567Afo53PJgSEgcN
X-Gm-Gg: AYBFou3tTjskTewKQD6ooY+ix9CF+yhjAFN4KZr7L7eCNVT5/y034SViJ0HYqO40e/g
	smIYvCEsYXvpixEr6z4ZEOR3CkPt/IyyAFbUvtB2N7j3ffVWe/EivXCZCgtsBB5ILtW4FkeQPot
	r6cUl6BZpx/Q8gRfTwx1aY+W7kA9u2lkLP8qQPW2KI0Y3emX5Op+9HzUbMWpK45rjL0gOG1wttH
	Nmauz7Np3NCwyQT63bWHiXxwT6SXyq1wrxHc/oqsgkzrb3EWV3lNOuVF5BiW4lm1KyjYGJLLoo8
	P8GGNXrk+2m4AK2TMNN0g2ObdeaqOl8twggOgx4OrfzLKwJ0letqGYfox1Iud+tI54Xp7ujdiRY
	a91SEiJwEkDF3AG9O5Yp1aIWTYNiB3rL3mwmEjD8h5WOBN8lI4DDh9ToUSvFBaE8VtPxPo0ZxWS
	Fm4+972bsvyE8PsCUlawuR+o1lrPrx1nl0iuKHKOYYTnKCAMA5Rl54hr4wO4FfhoVf9J4ONzmEs
	Jxeb4gAnnc=
X-Received: by 2002:a17:90b:35cc:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ab3a33db36mr18094196a91.8.1792120190079;
        Thu, 15 Oct 2026 20:09:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v8 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 16 Oct 2026 11:08:50 +0800
Message-ID: <20261016030855.4062882-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_200950_888015_1DE37854 
X-CRM114-Status: GOOD (  15.01  )
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

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86/riscv memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index faa0f22dbb41..8a861a946e26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
