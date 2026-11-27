Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E3B606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ad0Fq01O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cAi8Qn5I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPNmDWIn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tkNnENbXaVZ07610gro1XcoPRWL+gMwl14NX4ubkye8=; b=Ad0Fq01OqdohTpNg9TWTK+jr3i
	60vzh78VRDcET3KuuizPVwIVLpnER+0Zy0gX7KyNZcZoVxbmIqP7U+e1RctRjdROcP3EMlq9xPpHu
	EG1kZX4bfLr9QgxtYenDkJ7pw1ASi1QmZW8sw1RCrZU5z/cyUq36nNUzEu44Ai1FZ9s0tlmTFgJZS
	B8m0Ci0VQCiH0UDdzzF7MSlMsyKbyqNXss8LZ/0l69QhetsAiM0rBhdOMm5ABpAhOsd5s18S8ij8d
	u+Cwbtyo/hnS3EuwOURPyovKD0c67CBRJjdao6VhvuGeHmG//N1ASEkVOdj7Pgx2NIadCr9sdTQlV
	pmsx6uAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwS-0000000FMUd-0qDR;
	Fri, 27 Nov 2026 09:08:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwQ-0000000FMSx-1m1f
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=; b=cAi8Qn5Ijm4ex7C2iJfbzGwykT
	eRIFos9+qg+FpqaKS1TQOxP+6Gm/Obhx+H0Xlrna15mRZDih2CESUsc7tHb7ichaZ8RsQTJZq4B1e
	bxBM6ZtYcUkKpKgvOcd6jnQE2JKUtHPY6mvwjRc+rZFa+NAGw3kuWPu9m1SIypjNpbK9yC0oyEjf9
	HmyQ+dyj2vaDEfvLTe2Y+460Owgz+K8yW6PJ6Gl4SZV/Uytwt0RdGV5rCkXD4uklE72Oa1BvTLTO/
	P2LF7dvDk/DgwcBwBpdJB/tTz9k1Q6sBkqLAeDH7kS5G55OtnuqzpUzsxYlBgdktoU/fIGVlV1+zM
	HHwQ/kmg==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwM-00000007UPV-0I60
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 09:08:25 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2effa00323fso30996835ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 01:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770500; x=1796375300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=xPNmDWInEfjr7Gud7k2Hsqh24mq3PCg11uXQnIgkCzAKmR88klRoBa4n2y5IQWlygi
         BrYEoEIRS8j7YAdHxUCBP5Bc529oBOlOUNYcLzCrTksgQJevo8BofnQ7Q5ovnGd8SEiH
         Q+6BNSsjocHkctLOaEKoQWSEL3any1wV1RDid6l6DqP21r2Dw8StPZHSYEpaPPGy7wk7
         pfGDILbzr1aeru0aRo2iDOC4XiYObn3lUU4e7GIXPlGRI3jLkeoM3zySTo3GjM6YH0Zy
         /KBRK79dHTR4pGjNcNOrBWFAKG2QUujJlR7jfxi+HCdDQxbxzUaJmKWMvvJ+7r3gc6DC
         6o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770500; x=1796375300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=IJDkDiNNmnlHeZF1bDo6GqC7EC6PkLI7RrKPgy3z7CvTiRSa1GSSj5J8P5fXt0MQai
         VMO0+ovsjzObzr5EuVUjjBHNJCt4rq7jGmu94IehRpMuAdL+90hw7r8lMNLIwuqhJijj
         Metafibp2X1igOblHRwN+gwrQV2Xh4cTwdEtxnDRu3DeAUYynO+QgxdXKHc9CB6vDk5y
         5Kc+BZzuSlfYLX6Cj23EuMb6q/TaVVwHUQyX4xUH0gPxjcRdqUn5eeN/X+sOqt37dZ7m
         wPwF/KvfZI44DLGCa0BS2F7c0OUOV++EROYlDt+drpEvmJtZNdJutKrYyC/4YyFsWq44
         Lu6g==
X-Forwarded-Encrypted: i=1; AL+hErEghw48H7K2ri4N21gI92EpD1VFoaD8E2Vbz1wuHER4H/kw6yApVp9ei37V/YFlsK96HyE7mdhmrote0A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+fDK7dhot1Siabx8PzuRcMFcTDxv8+8tqIVdsjKOS0E6uOVRcv
	31lw00M6TGT8+R5peoHn6d4MT6mrrHT997gMrWA5xwEheza+rS6dv32T
X-Gm-Gg: AZFdTZdjaZuPGPb+IXCYoM9vgsIMDBD+ja36bfMLPG9Lgi7frmKTcn7dn4lQQCJaQmN
	bLePxGt616Az0AHVc+DAhTv8aR94LF+KgwC2lPEaclemNnl0hP/URMAWVq7Xjzw7OylmOPaQs5a
	wlsqfupOmDjdcqlEr3WrWCRIVpsNJzFlYxTM1m0NLP9GbFjJY8PEf6tjHubDp4yHu0L1qg7kPS1
	W9AWMHIfs2fIKfJ0TloUl0VWNQwoW+AythI4d4Ut6NLCJ/udxTFIx5ESTCJpwuTVfi6LJkVeiqJ
	4ro/mJS5mIS1Gith5vE0MO4pBCByEtpyw39bo4Iqnp0MplnPxTsdiC00znPQB+MQ+gUEjFauQGG
	GDDFfjlrlqx8mVOYDzvwkPNV6qBOhXghz5afMFW6Vs/7/HCek0tLos6otAiFNE4pO/VLTijN2PO
	ZH7OA84bAng16s7bkQW91xcQsUgQ3kH9asKXZ7UsHw9V0x5CA1DYsmfV1wEXtyJa4vAlTPIjSNb
	vu4OrjNXE2ajgZtIjPDOccaP8QyFNo9PCuB4l+2PzRR9eSfes/aPYlS51obb9DeR7PPJXCWvag+
	6B2wNir8mfq8sbfejF5uECTjDix7HB1FEbXWma0+UA==
X-Received: by 2002:a05:6300:6d93:20b0:400:77e2:eb03 with SMTP id adf61e73a8af0-4014d35f25cmr14065528637.48.1795770499535;
        Fri, 27 Nov 2026 01:08:19 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:18 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 27 Nov 2026 17:07:18 +0800
Message-ID: <20261127090723.741253-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090822_091257_2ADE60F2 
X-CRM114-Status: GOOD (  15.73  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the
same two-pass operation over system RAM resources. Concurrent memory
hotplug can change range source between the two walks and make the
populate pass overflow cmem->ranges.

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
