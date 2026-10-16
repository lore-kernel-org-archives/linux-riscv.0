Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E0CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaMWwlpPOfotHef0UGynCxbgrfQhRbxZVSlk/aDb334=; b=TNspknAQ/yu6c4
	kS6QwpJVhbdq6DAqySrwBF+MQrjlfdZF0zb7jQhtKWJt2Gct0w9fGnPOsWEivnNdfOk3tQyooJ7PJ
	1ZjiIDssGRKcKvAvEVO5c6XiddNDPNG6ZkedBX2Z9y2zLyu13fAbuGWzQY/JVvqbxaI1eaw7kElgQ
	gNPZf23cXhEmgd0ZuIhh5oZorQMtY5lIv2NLIVVWlktGF2Suk6SJPO7BYovqgXbCDBuMMM4SZrCVc
	9hrHsj7u3A0yHNZ4mJPDxag27rrIGlItwsLGjbogmiNQXQwAEf6MDQorUFa1Yhhf8r8M0bWD0J4yr
	AHbPybD/70+ocxsbr3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFZ-000000025ch-1iR0;
	Fri, 16 Oct 2026 06:17:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbFY-000000025bC-1znP
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=; b=JCVI5ESz4w3w5IuT7ela+JVwv0
	CczObcVei6KFLzRNx4Is3svgJtDIe3bDAWt4+BffHjHYBEh7DBzGcvPpvy5XMR88E/zcx6HTxCos3
	dbkE60WCn9uEmpCyc8kcfAsZl599IVJcnKvwXjoL6UADjJabdkWP+NySVHAMXheLZHJ8UufJUSP0b
	7nBMmClkTotb/FTfqL/goHepmgVuqHSW5Qsapx5cAPeU7e0XHMBUY+E8KnhED+Mka6MEhqru3QwVD
	vGCfft7d5FwOG5MqDqdjyhNsT+FdDGV7z4Ct186uqpelsf/JRcE7eSY35rcoKzW5mRd2N2jM61qsX
	yPx0SFrw==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbFR-000000019iA-2sSU
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:02 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1161807a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131416; x=1792736216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=pp1AAe/lFKiIimKk2DmJ2eWPLP5iCgM1pUo8Ytb+WvTHGPv4EZ/T7VIEd36aeRhrlJ
         N5wvNbGiQivEoq1Tl2McAj4pw1UGYH3wOuVGcd9FO5mL9pT6QWAuBzNcg/mlXGvw8Z1K
         5ZcVResE9ZjQ4NKdDCtE7rpwqjKd+iQIBgnx+v49P8ZJxwNyH0MyGVxBaRKnSp9xMEri
         6cM4YWKvNj3r9MmXll1CK2wfxSV/KQlI0z4AyjtjSbDgGnw80THERfiNL0eF6OcpsGQg
         hcLz6gv3shFCVxNLgNFKGXkLrWOrTKytVpwGye4ex+VeX48NdnVNgRSdafHFbs1bsZhS
         Ycjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131416; x=1792736216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=izQkLF+OWiXYri9uXl4PGMLcGEewO3HGFkFwcfP3SZg2NIavgKcQRZ7gtpYBySPzjW
         cpuooQC0ZL/rk3ypp0fX7dhSjLZGTIcWUFNkyP/XwlSRF2oGN8M7fvJ36FKdJApX3ofR
         MF8gOXB21WzI1joeiq0xMado1q8SAfk9a+CoXyIxivWch/YHqgWIQKbN2obdihqHwJJl
         48KPwJS4gmKBZ0+8zQnQvPoby0vtqEtTN5MTn/z4s8Uma//Ew8COL9jwjA5a7yGJWfm4
         1L0vGw9t3ladS3jT5Yvy8H6YT9OxDoqDdz10LkIj0XLtQJNyPc3tCSc1LTjaD7n77jwh
         i5sg==
X-Forwarded-Encrypted: i=1; AKwUvBwsJze9SFh9sHFoaqiJ8U8KKFkxiMfUqAxGjIv00Do9gYI6vzcn1FA9Mo5MTeHX6cgHi4L9FzIwJF1npg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIMHnakwqk2oAdTj9bITAl8pTNb0lvHj4XpASXQTcjiQW5+iTDN
	LlQxLk/PfKHnF5S2tXOg/SjCI6dzIw5LMlANcY00MtOYas+3Z0oG48Qf
X-Gm-Gg: AYBFou1kvddencwXw6pZnYXx7+Cxcg+dC0gY1hXM+8QCMVozNHIwER1NFIe1L3RzqH4
	hc6xeEYFrGjFjMNf8rgdnXTauNx5VHHfSg8z+KP5rJ9O6LneSTKJhDIFKT+vXT83zLoQ+bi+nW8
	uG9XRWcXTwrWyekiZzBt+6ZKABsLe4Bmn6T+jCZYmG8KJOLQjuLOleGHkaVwbXOyRCQ3IxAYaFL
	sIahFHKn5w4Xk6Bz5XnndY2ciaRDln6M2RTGj4DQBybGbxQ0dBt1GW8jVSmnRdQHItPpT5HmZKX
	r30jWQXbkVHcPrrYGha6aL3Fpt6Wpk5CjFqDHNJf806YLZBlg39rwyg91gTUBCBEbDZoh3KBilE
	+8/Pcw11bwrGFI5641D9XThO0//SY0Si6xjJdirOGGnZwqkyVSFo6NGZhNrcI8X8Fz1vkH4+xLm
	aUro5AXWnQv1cLFKZTfZ9hHpgwMoIBDUbWTrtiklQe0AxcrDL0vgHlEdSpYaiNTL4bpz7SGSMuy
	9LiMiZe4JM=
X-Received: by 2002:a05:6a00:b8d:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-89dec58cf9dmr5849396b3a.55.1792131415787;
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
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
Subject: [RESEND PATCH v8 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 16 Oct 2026 14:15:45 +0800
Message-ID: <20261016061549.4181390-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071658_103181_2E4DFAB4 
X-CRM114-Status: GOOD (  12.07  )
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
