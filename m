Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F05EC0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aT6jPaXj+NXE6jps1/jrNnXP3j7pU0E2jUptoJcnMA=; b=ACMN0hxLBeS39p
	TRXXXT1FLM0Z7KEMuR0iX4d4mDYHGcyb3qjqVyW4zt9js03CSyp7BamyrSJmKw5O+C1iTHtBa80MW
	eb4Se6eD+iMtvlIEVq988wkFa/4OU6uiGCC0MtkEspw9QA6QjIVwIXRzW5LB+zfADfg+FG5rPlxbG
	DSqZjRfzgc/sYrTHJm8Hhw3v1Z2ulA475a1+ATPnzkBhSrQdzfRdj5xJdUZCXPgFT+oDoNkh1LAaF
	oAYC4HWOeIF65GUVmCKMEliXZozT/sgb7d+1/z/F/xJpHuCZzZhwWKBkOtOxws0FdTxm201JtecY1
	6ABd7ypt1wS6wcdVyOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Bo-00000006d3l-3hIC;
	Wed, 29 Jan 2025 09:16:52 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Bj-00000006d2M-2fg6
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 09:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1738142207; x=1769678207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K3OD3dxywITjvy6jKlbNNMbo87dMZ77ETsuJ9jOPISQ=;
  b=AC+lDviQOsTKPbby1M69EAtb4V2avbsGA1J7YEN8wxfdhmmpAX2tqhPT
   blsepr8Sg9Fp00F34MoIvmZ+o5j57WCchun9GPllnU5jAewkYRuphX9xt
   bzWi2aX7+OvmNJvF8lSjj9sFt1HMUVSmuwHFGijU8QxJ+lXPQ7RpJRqew
   CEao7U6OpxLf9tqhcb1y53rI+82QDIl5CfXWRZPGbdnFIw3vE4gJtO9EO
   kpsoIabGhS73dD+XVvuCUUM0SOf/MQmhhhbj2fZ4TfKW07J8l82OSYkgM
   4NgSRQonf/ZkuH1v5PP9wU5YYkHZcQlxT2C5Ao6TgjLvIkuC3ipAaogR3
   Q==;
X-CSE-ConnectionGUID: pFoXwLKHSlO9thziQqcBvA==
X-CSE-MsgGUID: Hb0zIQQ6Q6+yo3eU/D5JtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 11:16:42 +0200
X-CSE-ConnectionGUID: 5JdEmO9hSfSifX91jEuKPA==
X-CSE-MsgGUID: mmL03Lr1STOTFpLkRb7fHw==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 29 Jan 2025 11:16:40 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Wed, 29 Jan 2025 11:16:41 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 0/2] riscv,aplic: support for hart indexes
Date: Wed, 29 Jan 2025 11:16:35 +0200
Message-ID: <20250129091637.1667279-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <87ed0o87qg.ffs@tglx>
References: <87ed0o87qg.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011648_180055_AC4FCA13 
X-CRM114-Status: GOOD (  13.15  )
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

Risc-v APLIC uses "hart index" to access data per destination hart.
Current implementation assumes hart indexes are consecutive integers
starting from 0, while Risc-V documentation says it may be
arbitrary numbers, with a clue that it may be related to the hart IDs.

In all boards I see in today's kernel, hart IDs are consecutive
integers, thus using dart IDs is the same as indexes.

However, for the MIPS P8700, hart IDs are different from indexes,
on this SoC they encode thread number, core and cluster in bits
[0..3], [4..15], [16..19] resulting Soc consisting of 3 clusters *
4 cores * 2 threads with hart IDs:
0x0, 0x1, 0x10, 0x11, 0x20, 0x21, 0x30, 0x31, 0x10000 etc.

Change default hart index to be hart ID related to the start of domain,
and add optional property to configure arbitrary indexes.

Use of "device_property" API allows to cover both ACPI and OF in single
code

1-st commit adds dt-bindings, 2-nd - code

Changed from v1:
1. use as fallback logical indexes instead of hart ids
2. refactor code to avoid unnecessary memory allocation

Changed from v2:
1. change property name to plural "riscv,hart-indexes"

Changed from v3:
1. added missing recepients as per "get_maintainer.pl"
   no other changes

Changed from v4:
1. Verbose comment for the dt-bindings commit

Vladimir Kondratiev (2):
  dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
  irqchip/riscv-aplic: add support for hart indexes

 .../interrupt-controller/riscv,aplic.yaml     |  8 ++++++
 drivers/irqchip/irq-riscv-aplic-direct.c      | 25 ++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)


base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
