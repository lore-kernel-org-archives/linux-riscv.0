Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F196D29DE6
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OEIrf/pia4qKVmubY4tJuWolCvg4jv+mfPlK7TvACFw=; b=JX8yEjg59eHwhB
	u6FyZfGMn4moMxlSM8UQYcqlMGBHRljKqsR7Fu/sW4sFfUbEkON5H+x0pDBUUqxfl7CRcaGxJdnDj
	3eB23BkHwB9jVcN6jjDpYnNIPDzxu1g0fo1GMNpJbHE3acSkl1FbaAOL/vOZ2Sowc0PhfzAUzPc4o
	RYfDmS0mo4+oQ4wlziRp+RZszknrtcdya6T4rwZcG+4R9qdBXpPjT27Vi9uDyrIBsQ8R5AayDmFNc
	n47pS5uOE6SgREOtPHrZIkAiwYnnpCfGKrYavV9MrDX7OCPC8O7I8jQR3if6FUF4i/MXKXPp+mG1x
	Cz0lBk8+fBqQH3BwgAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ6j-00000006fzI-07qW;
	Tue, 13 Jan 2026 07:46:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ6S-00000006fxN-2gBB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 07:46:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0c20ee83dso64479345ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 23:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290371; x=1768895171; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVxSFr5roBVYFLRhnAgNNp/8sMao7GowEf9CUckDDWw=;
        b=0pXGGXVbAwPvGF+sQISMDiWZBUd1nHi5hSBbWIgrA3wGZs/vqJXftag0Aw45SVZYTz
         1t91xSbYwResyM7eNSqIXlJu58sBizJKwygmrXk2Hm9bUKT73cx8fv1jOIX/p028jfpK
         aNR8p9OVSXk7rZj0V377UNcIfCRj32MVp+WiWT+31LwfVJTygtb4JhZdjHkqw2qyRiVt
         V1Rd2hzGcqrK5us/TI5cFy3aS3IlDv3YvXmT419nrB/vgKAtBxQawAO8FGRHfG6hAxir
         d9EKX3gBDQyrW6o7GvcPFHlR6jfZC3ITXxA1nKgAEoL+gQwDosd5oF9uQ64/LI9sg+DP
         vy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290371; x=1768895171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVxSFr5roBVYFLRhnAgNNp/8sMao7GowEf9CUckDDWw=;
        b=lybZrp1ZZgrGo70xOdzsSo1j10mbwPBBzx07B6s0IBvoaGLg1ay40Um14lNTtxaq7g
         gFfL4GbMweh04MoLP3Zfa3K7MKEz7ruFXuH7mUDztOcION4kUE323XuJEIuNhjuFkrEt
         OgYNkLFiBXDIdhE+haIZuPRAFwdxVWP4n6Rx+lxE2tikES54zsjiIOZTdMrvkDvfuNpu
         FxSYOC+1ejDiFb+58WKphaLaSJhuLP44Q6eDyGncXc7eOHOXmcEsjFSQ8TFvrolamzhF
         HChPJU64+odYFLYURVlRcKufSHPllkvleWTYno7x3prt2Dlm1bSBNeKFUpVSqu0MMUK4
         agqA==
X-Forwarded-Encrypted: i=1; AJvYcCVp5GKTEiivRFYwjzhaYmmJ9j6TZRZfuIjufU7gi88oUh6oAJL6jKsgt563xyiUokh5EZvxYI/i1P9qIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXH8lo29uzoY5FhdQhaqLEIsmmZTK3reU7/rZ9xma3UN3AChgG
	wWrIePKrx0nNxnV0zn1lqdIWbK6iaSqHk2MduGewpa7dDGFDmYBi/v0pYdM7Z+MtaDQ=
X-Gm-Gg: AY/fxX5NWAXV0BdCp9S7KMYbL5WvjKjK43eTF3Eictm89qJzR0WLkcGzT09MYn8kclD
	oEDdsjVYxqzskkZRD1WVnyFtyQlwWst4KqqSL3G9GDPqcBKtCAvNcpnqDEPzFmvIGgIvwZCsd68
	XGj0ZQxbuz1RzSb9BpbpzWew/2HHsB2uiBOMasnoqrFaw0IkPok2Z8aKy8zRBZyos7PB7OhtiXA
	ECOf6RUFgc+nVduAYhNWJuV4flcajwXcKppEmDhRXO/fQYDquuw4cvw4UrawrUEbYTDsAyPwwzq
	r6bsvDTCQPUv9+1AOcSLHnZT6jkKyx+UICiKvvTbRLehrC9Qw5BdRU6pJQ4HS+T9YLL728syo4M
	nYNiXN4U57P7aWSvwqweB/F+WeNPDsjgQ1KXHHyU1s8h4CKbYoG2L75pllBIp8+6kSKDMK2G4Yd
	x5K3O4fqwm2Cdj04zkIZZrV7BtIQj92MEpXRABhhCZVntDHiV60JhzVA==
X-Google-Smtp-Source: AGHT+IHbHcGmc6lMn+EQWcpZEtvrjvUz6htmK3Tb0lxfDS12q7Bh+oS5FfObSwVuTxLhekVSu4CkJg==
X-Received: by 2002:a17:903:1a6b:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a3ee41516dmr200714135ad.1.1768290371623;
        Mon, 12 Jan 2026 23:46:11 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Date: Tue, 13 Jan 2026 15:45:52 +0800
Message-Id: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADD4ZWkC/y3NwQ6CMAyA4VchO1uzMRQhxvgehsNgHTaGoeskJ
 oR3d4LHv2m/zoIxELKos1kEnIhp9CnULhPd3fgegWxqkcv8KJXSYKwl30MLNjKBKk6lKg5aO1m
 KdPMM6Oizerdm64Cvd2LjNhQDMpuVrbPzX5Xw0NAapi6pMBUgwRZV7rTR0jlzDcQdRxP23Thcf
 m/SLkKKgWKdefxE2CRZiWZZvrj2++7VAAAA
X-Change-ID: 20260113-adding-b-dtsi-148714533f07
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_234615_508180_F6F4E146 
X-CRM114-Status: UNSURE (   9.57  )
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

The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
much later than its component extensions zba/zbb/zbs (June 2021). Recent
updates to the device tree bindings [2] enforce that when all three
component extensions are present, "b" must also be specified. Related
discussion can also be found in [1].

Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
It is a trivial update, but can help readers reference the correct
document version.

Patch 2 adds "b" after "c" in 3 device tree files (anlogic, sophgo and
spacemit), fixing the related dtbs_check warnings.

This patchset is based on top of linux-next, tag: next-20260109, and
depends on [2].

Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/ [1]
Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [2]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (2):
      Documentation: riscv: uabi: Clarify ISA spec version for canonical order
      riscv: dts: Add "b" ISA extension to existing devicetrees

 Documentation/arch/riscv/uabi.rst           |   4 +-
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 4 files changed, 150 insertions(+), 147 deletions(-)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260113-adding-b-dtsi-148714533f07
prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
