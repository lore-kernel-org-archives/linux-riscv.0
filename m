Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4871EFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pi8qw4wl8aWuNi3gFACUao1OeJK8R+qadPHzfzMpuaw=; b=To1rjiidcv0I4w
	LKF9fhuiF2hu6mUegFtjlSz0zQNZJcG4sHq2TBXG4o/2SNUir3ONuXwC7Ag5n3HgzQUxpIEwprmOC
	Uo8eNp4o7ElhDz9lthIZmas/1CbpFvZ/tnvIizoI4gF4roqPAmiWxWI/OxWM4Y17Hb+n8eKN9YLTM
	CYrKn9xvv5JqzY9eL9YbyEhK1ucj0VZe08omoWe+DOGb2U0gmJ1NnNg6Z4vX//TArAoNUgxnQBf7D
	hkmgi9esB1OOtVfhnI2M61GZ5vKwqGClRRxtAaTpZ274qffEVA0QSRkWHjwolHTz2N3VSpO3Qb/wH
	nb1o1OXWp1mf+KndiiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyug-000000036aq-1DTG;
	Wed, 29 Apr 2026 07:00:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuf-000000036Yn-1Ibl
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Apr 2026 07:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=; b=JZ+zoxfXD0QRIpeY5nKbHb845v
	7PNyR5y3fC6HTlo/7idCFdqnZK3BHags9Mf0lbvQprod/FrhUhoHB3vrE6k0KRm21pGElfBnxmiVR
	29XBFgE5Aw8DUhBlp66b96Vx8y5m1iCSR/CpnpQEhKjXbpwnRM4UDYQG9qWIb/b1gRY6fpJvwyZpv
	/TE7rNatyc39njzh3cIXPUBQpoqtqo+9hqddShAyHpxp5vSW9QUH/oX4Pv9FugfQkzTlUQvhejh/a
	iACsf/YIQYOmVh+NX+zgJlS7h4bofhwzw49Rr+R+y7AjNyCN5xT9t1/Cu41S1yuoDR51LpfrtmdqF
	76J1sdyg==;
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuQ-00000004iI8-1GlQ
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5739720b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446033; x=1778050833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=rDknmEs4Zu+JXpQFAPO5Y6kVw+FJb/8DbnbYrCTQwoSI/d5SyWP3t1X9+zMMSGt31h
         +JXkNeT7zPz8JUeBaVYnhQW5w5jauKPGxnSlmwy8wzv138QngJ5Mc9OBhsrGDp3gvSke
         Eqwkk8tXv+eOyixtpxKtpmobvvyr7fSiNaONR/n4+pJ/Hn/XnjBsecer2WkfaRyOlzla
         jBUvEEyh9HyaXUobMX4p6eQiZuxJrJmxFyXaT4jHO1nUz4VqKrwKbubBLuvBVLRc6s61
         YVgoRst9X4CIiFItz1GUnR1ZFEwnple2GFA56vFvmmQvfz1aWs7dD1XmjGWzkXjzilzK
         kYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446033; x=1778050833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=C8HWC2ThOjqsr/Mir0QOGKgeuPvNUDw+s98SHYI90hvTnS6X5+ZQ8FlU3nGU5ua6/D
         f3A6vP5UmY/Wrv904v7naUfwR5d+WG380vGo+KRjRD8DwkwOm+PNHcJhhmOJuAqnrgN7
         7AwKX9Tb5aLCBSoqLNvbzPdOlqWKU7kEou2REFKJva+SpPRV8icgeX3G7b+tP94/AnSL
         Z0p83HBrVuOxbF2FBF7UeC+YPnwcQWNwn/lrQ860M92G6Ihs8M3CKIokhq0xUGn4QMlH
         cQvFhrm+BN2F5FQOoZwKYAABNWmpj9p1GkYDsmbbXUaQ8whZr1BiOHI/FkJKyyODuzmJ
         kp4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/WtXAScHsgHhZnXJR5ZHuBJrpqWaow4/qCGmE0S5AbTSebrxGpFJoXZfQSsWqC91u1bc36UzmjA4AKyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzT1FfNCiosCSR5WrUcnpMCxAgl6ntmzbxBiVWFex/fycZg39Fi
	5m5cA3B20L7wLfD9TJ43Er25SRimuLDyMtJX6fUerShYDArM7Zl58+Eo
X-Gm-Gg: AeBDieslM+V13y/m6D3d+p8XnrLvl16VviAyKTWHCRAl/CyHteQBN1WgbRN3CoVjzR7
	AyZsP8igG6Qob/QjiTTpLj0fl5FyTIwIG4zrXTHpqsvKIrlz9hCIcbXl6bgt6jlSlvPWmdhnzd7
	O5wgDFTKaDTBelAIA5rH05zp3zWJYZEH7Yy283Zi9G8JgKvzcQ3d0P7XCUFa/Mmf/ReG0qPeAPq
	FHv/qDnAUh0xksTPvxJ7jYXR/LheG9SgoaZEAuEHLK3y4wTqCV3ETD4RZbQ6Ki+Eyi6srUAjZ5U
	4DyPVXiCkSTtVMpiXMctXjKoLahfIER6WHPO2dRZVohwyuzlj66gwEvh7nvfLJ5PXN9IDMpRFGy
	VSupJBh8oKVdlJS1sMzMPkGGHCRQLpaK0BOTtMBrl5d2zg+kCaZN74Q3F7fh1SvCE9JvI07yp23
	9iBFwwgtIjXxeb5RsvZtQq0CYGNuPeSE+WXXsEq5uT0Q8XQ0Mb
X-Received: by 2002:a05:6a00:a14:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-834ddc14f4emr6920159b3a.24.1777446032715;
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 11/11] Documentation: admin-guide: kdump: document linux,no-dump DT property
Date: Wed, 29 Apr 2026 14:58:31 +0800
Message-ID: <20260429065831.1510858-12-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_080034_886755_C8AE4EB5 
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

Describe the new 'linux,no-dump' reserved-memory device tree property
and the automatic exclusion of /memreserve/ entries from the kdump
vmcore.

The section covers:

 - The two mechanisms that exclude reserved memory from the vmcore
   (firmware /memreserve/ entries and linux,no-dump child nodes).
 - Intended use cases (firmware-owned GPU, DSP and modem carveouts).
 - Interaction with the existing 'no-map' and 'reusable' flags, with
   the silent-ignore precedence implemented by the kernel.
 - Architectures honouring the hint (arm64, riscv, loongarch).
 - An illustrative reserved-memory DTS snippet.

The DT binding for the property itself is maintained in dt-schema.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..c2246888e84d 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -600,6 +600,65 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+Excluding reserved memory regions from the vmcore (device tree)
+===============================================================
+
+On architectures that boot from a device tree and use kexec_file for
+kdump (arm64, riscv, loongarch), specific reserved memory regions can
+be excluded from the ELF PT_LOAD segments of the crash dump.
+
+Two mechanisms contribute to the exclusion:
+
+1) /memreserve/ entries from the FDT header.
+
+   These are firmware-level memory reservations with no associated
+   device tree node and therefore no driver-level description. Their
+   contents are typically firmware scratch areas that carry no value
+   for kernel crash analysis, so they are excluded from the vmcore
+   automatically.
+
+2) Reserved-memory nodes carrying the 'linux,no-dump' property.
+
+   Device tree authors can add this boolean hint to any
+   /reserved-memory child node to request that the kernel skip that
+   region when constructing the elfcorehdr. This is intended for
+   firmware-owned carveouts such as GPU, DSP and modem memory, whose
+   contents tend to significantly inflate the vmcore without aiding
+   kernel crash analysis.
+
+   Example::
+
+       reserved-memory {
+               #address-cells = <2>;
+               #size-cells = <2>;
+               ranges;
+
+               gpu_fw@a0000000 {
+                       reg = <0x0 0xa0000000 0x0 0x01000000>;
+                       no-map;
+                       linux,no-dump;
+               };
+
+               modem_fw@b0000000 {
+                       reg = <0x0 0xb0000000 0x0 0x02000000>;
+                       linux,no-dump;
+               };
+       };
+
+Interaction with other reserved-memory flags:
+
+- 'no-map': the region is already absent from the kernel linear map,
+  so it does not appear in the vmcore to begin with. Combining
+  'linux,no-dump' with 'no-map' is harmless but redundant.
+
+- 'reusable': the region is actively used by the kernel for movable
+  page allocations (CMA) and its contents are relevant to crash
+  analysis. 'linux,no-dump' is silently ignored on a reusable region.
+
+The property is an operating-system hint; DTBs that do not set it
+retain the legacy behaviour (all memory is dumped). Architectures
+that do not honour the hint simply ignore it.
+
 Contact
 =======
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
