Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA59C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucbv+JnxN8W1qT76Tv35sTSloTfV1wnSZpxEkrifamc=; b=Xf+YCbZiQvltxB
	nEex8twCebIRy2BQr0ovRulISIaiCcjhKL9s+u/g1Q//vyXL1f6XX1ys74HvSBOZUfR6S6LyfmR6+
	6plx3fXzmG174uIOQBEjFSrYglm75IP6HzCzv4CZXPcaGWF1KUg2II382Tth1h/39yrW3FMXrzz/x
	qB+MAwUG+KQwRhUvIIfKkNTKNFWYppoxXt+1uA6hBwU/IhbiWTtDOcdgwBFnGS1IICBys1q61P139
	bzXInx/qT4u2TqnKHSppR6Sl5Yh2eP9utX1DhyagPvtzhi40y2FFOXDuC1KF+U0wvMMgk2ckBmeLM
	fev2YsnkXhruvQ7PEZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFok-000000095de-03ZJ;
	Wed, 11 Jun 2025 07:24:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEsR-00000008zF9-3N8X
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=; b=auQHnLBXWhPCWWFvt2eRrhYZdI
	rMbvYxdYik4j/hIaMFKyzeo5YqOWNYaRdDf2nzPyWRKV1Q3V7OYIjsSCSbYNurvQWLOrwsA4B5PAD
	QyUucw5ENJ3wQqIHL7BpWskS/FuceJZhFExg3mfN7tFDQuIH4aGN2SY33IiXGLDoQzCLs7BNTB1Xf
	8+9Ops9xWBJqblUUibeSBPGX9f0W8OItRvRfCskGEg9ywwP3am4Efb1nXSvkUdWmYptzKk2hiFp0l
	IXnpx14z9EZrs046gNGPd6BPDsxRhb/8paaazn076mVtQzZnyb3znK7NtjICvHqUlRdjzbwZFqrQx
	3vFXowlA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEsP-0000000285v-2QeH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:23:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2363497cc4dso18818835ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623035; x=1750227835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=;
        b=PPqVaTu7UM5goHHQgfImoCn8Zww6wypch541p1nhajRQ+Mf12m7T6Y4bpNLZv3ARbo
         3XPYVmlVOpbDTVg424N2c+x2Ih+Un2lkIXX2mj/7rgaXfK3DHLvn+CxnYj+7PTHy0D7T
         s5+YveIzu9ltwrJqIZzIl2WdnJZytcechWXBwed/lo5BTboNXaUOat29DhJlq4MCwoVM
         qOpEVnHkzttQwT+CGTbpC30vffo3cr2rQuzNQ3VTUV+FU6fainUs+Ihssiq1ha2uJaJp
         vTLMTS6iD7j+3QDx3ypglvSwm6q4rPdOr/xSnM+2T2xv+IbqnfzN+nneVsdjcGOYy/H0
         pVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623035; x=1750227835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=;
        b=IkHkLJArn0qigf/IHOX6XKYQ2Tb7zodq3b1xFVZGmvfa6MdO2DEkwVtpW/Eg3leZz3
         VdxK5mOBNB9LcYdZHBaMOSwJ0ctsgVGZL0xA1bTkPhJpjGrIHLeHf5R0qom4sDQGud/P
         5yObG2Pno93qHNe5QgpctmUnNSDavWyZMEOAywLERUBiFLSCiRq6/L4/MZ2aaxyYUui2
         xZuFUF5R+e9C/Po+9zhU8mhirdpi38+JGW3L3ut5B6B41pfs1iZSCyVNiplaPAqVnHUN
         erlOXV0zZPajkR8p4YXASmmw86qYLea2jjI0wmFkOCJmOGU395KntnqXNBUyCTSbSJ9g
         UHiw==
X-Forwarded-Encrypted: i=1; AJvYcCWedEaIaU6uRysjTe9wbMTspx0h5SJZKTvCzB2q7tt9UdgJQMq4uAEH/hzrv0xM6ecVk54+RBmjY4wsdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZaDOWumIEdc1ixX1m3S3Gq30RBKYy7tnTldEdjU5Zs4ZEO52v
	rwfLE9Fea+3n0si0PSep2w4TxekYMSOae3xginigjT94duWPCz6zB7tW9/AblHqDQhE=
X-Gm-Gg: ASbGncsMcXKxsUqF5tefG1QUVsysvSvvqHTvELi19kw6UVFC4vkhWhtJ8KEARNSPU5Z
	kpFKvxAE2U0IcXsWWvC9rm6e/mZcpX1J5k/3TuoQPZ1wY3WaSqsZPtUc5vQTfGn9iJtY11fLiB8
	6knUsRygkat6lQJpGUKdAl+vbUU5OU3t6ZGKOIXasTXawiJLLxM4ZwWXhR+RDaQfkwkieyZVjCu
	NsVq0Vnaw/nanZ1EE4wR5B5+NFRg6vzM7rjPaPqM3icdkcmUMXcYz4Dee5Zh3Uq/0Ehzzg850Fd
	NBuF5mlC9SOoGRK6P6LoI42oCmWQ7FRJWp/s8fVvbNW0qaDj7eHCILIhAkrvJpRXk9DhU1+eAg6
	k0mj847qJpOCOBMFO9XjkKs7UqVU5OktrvG7B
X-Google-Smtp-Source: AGHT+IG9id6m8Zy9UeNhLHSX7++7xXKKHDlsuc22eIa03d0VgxiugN4v4fTC06zY+RU03tXIbah2jg==
X-Received: by 2002:a17:902:d552:b0:224:1af1:87f4 with SMTP id d9443c01a7336-23641abe7c2mr35316405ad.22.1749623034551;
        Tue, 10 Jun 2025 23:23:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v5 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed, 11 Jun 2025 11:52:22 +0530
Message-ID: <20250611062238.636753-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072357_735959_60083828 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..70ffc88d0110
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
