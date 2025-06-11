Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C64EC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sG7LaNomISAZFSPU+CGMF2gWbD/s2Sm3gkXt6s8KTXI=; b=FsItXMmIxk+1JR
	i84YtIPVoMdKeUWgcd76cTbKiSvOlv9/6l0tuDX1bjYyPuNu3lgf9ZLN4FpFMdRXy8YNNgVwT5JsA
	aF5Puq/+GIILPzdcPDaVVAwSHwnxQ5JToD3SHsr7eRXbea7oZiSCXW5N2iLgB5oNy6nvkOVm9lf5e
	zHJSoJB8A/0j3bd1ZEymMjslzrYBzrfSnWJzfwT2amhixdcGvlPvUrRnyBF5glM+clyltNkd5fga8
	wSmkutNNHkOVnIjqmhfT3XQLQAQshSpu8hNKqYmWfbko4isXYy0h3WMkC1hx9pfCUJlcGng7Er1iV
	5bS5WURKNf1/f860yM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEsu-00000008zP2-0Pct;
	Wed, 11 Jun 2025 06:24:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEss-00000008zOb-3UTV
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=; b=JbEi8y31r30Z71voQXAGIQ0Eet
	g9+UttTDkOIW7VhqYJNDlk95X1UFfmFpE92ekmD70M5sHDAoqhquqOvpj6O0UP7lZLnqun4GMQBm3
	w3vbQoVyiZoUh689PMIUfDTMkwT52ENqQCF/NZZuGUpxiursV6YpiUg9tsGtw7VfTK21hJ3VZZz4z
	WFPwMXj/S4vOmo3Lpfjm8Z0uzClMy5rt30FcgIP3o4eEmeFvfMLM2WumCNbTYQOxVte9+c4mIwpZW
	LujfWFzDd/p+NZfwUeK0ywC3DoGcyxrhW3iwBsSzPDLabA5DqUNa8mCWJoHq/13aiZEn5QCWN95oH
	NI3CxUVg==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEsq-000000028AU-2QeL
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:24:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5794767a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623061; x=1750227861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=;
        b=JJKriYKkCbaRJbfwDbMnEWt01pHEgrM0tT2fTCGI2D/BKzDjEvEF1kBZEj8pfSN0cg
         ZWtmtR6FDzleXt19OcEZDF/zt8xVPSgK8FF2InfjJlW5m3lkHGlERZZxtOVmLpygnehu
         7URb0JwWRnoyMxdlZC0ts9FtoTUHPO1LD1Rh1J3gncTT79qJkWi7e4WOIhQPsS7Dy9gb
         KdIIMRtaTgHov6fYYroI14fdiPJGnABick4/flR3QOj+Uo/G3RFbTs1tzd25+wWAGFRn
         s52YKpsewRbO/DhsZxh4G8kY9ksQaLpZurE2ghL0AcsCzxvtTux86m6AfJ45TVUISEwW
         8WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623062; x=1750227862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=;
        b=mOt4xvTu8hO8/u18iZfDuQd1JE2QQ5zfpEAo9Pulld2y87DRvBMObhWRgWkkOxtDsL
         EHxsxSOjHst8uzq+1+RiofokJDah//R4ISjTwD8j2bdZ/vrCvWaWhhAnXqK/za6CAmJD
         QsOHYpzdGj7JOGPda+Y+ggvPq5SfarKLTlE5qH1UM0o6lXs4pqp9r56JXV8zYcLwQ2oN
         cp24CoYTG4y7wqGBApLelWJiuCn/rFO7qgIZC+5Doqmnr+48norGkLNHzbbZoesbCeID
         mh54B+CeOljwuq5OJwbRi6ToPZLX9x0nXIjhSQVqV7MWs0sPdcESaF3clAK2GzaxQZmJ
         zEUg==
X-Forwarded-Encrypted: i=1; AJvYcCX7aRTLZzPY6RcxVpU2qck3H33z+r88NEsBR5HssBW9q3Kc+pmE+MDbD5hkqb/5K6a1HEYTF/kyi/PlQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFDu7xQtTpBS6ELuY1jqFUAj6lvwIMfWEvBTNMYKjfGTXAmNvf
	6pPaB+aEPvSKOFoS5eC3lJMmiSsU/qkJYojSa4L5CCl21G3590NMxEOkafOkctcboxQ=
X-Gm-Gg: ASbGncukrJedI9XtgRu0WVaA+LVHLcnPB5hHfH6ZhMpKpPya46dx8gaKR/6CSZuiitv
	UhKvjcjONjAMXU7U+K3flS/8SIKnRR5SmIYNZP932CKb5w83lnMvRQsv7/4Dvb+gwmgNurEg5b1
	A/Xo0s5J8tk0H25ybuC6g+2E6hfKqKm43nkd66GoqhLVdICWUiQ45gALwFM0EzlFYY+q0NGOEGF
	H64JjO/MVsGiD3n2UAZn2/4xRfHXjUmKH0EShmS3y2EKcEVU9rC4EjPIZ5BIvG76ueungM/n+HO
	v6kwey9V5Gg4cfY/tsKPdQfzbNgpg+u7CZlxVuVRbMsE3RFtTBeUMGyXafag8AgPWv+FVdbK7v8
	vqSKx871TpeVYH7VqehSH1bDBJg==
X-Google-Smtp-Source: AGHT+IF5xkQyWQjwsl09XW4wn7LAnApaVtCZljCguqKxttJEhx2sYRFEJxu4xU+pC+wX1ttAHSWSbA==
X-Received: by 2002:a17:90b:1dcf:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-313b1ef5898mr2232034a91.10.1749623061442;
        Tue, 10 Jun 2025 23:24:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:20 -0700 (PDT)
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
Subject: [PATCH v5 10/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Wed, 11 Jun 2025 11:52:25 +0530
Message-ID: <20250611062238.636753-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072424_864579_AB77716B 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..1991f5c7446a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based message proxy
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
+  The RPMI specification [1] defines system MSI service group which
+  allow application processors to receive MSIs upon system events
+  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
+  event, memory hotplug event, etc from the platform microcontroller.
+  The SBI implementation (machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-system-msi
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
+    interrupt-controller {
+        compatible = "riscv,rpmi-mpxy-system-msi";
+        mboxes = <&rpmi_shmem_mbox 0x2>;
+        riscv,sbi-mpxy-channel-id = <0x2000>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
