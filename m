Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A55E9371B
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSYMmn5ayr2ytzgvqEWgoH1Hx96+iUDWU2qQNvmpsxw=; b=VI/BO6b+QPMZZL
	kaxxqsXLgJinKjxtratCbUPw4cjvQpBWdoBCzAwKdVq/NqAGQB7uSVPUs/UfpwM5RpjQQR7HX0ryG
	GVQTS8bap3i31zhSPO+S7ut5noZmUuOLO1BelwzWTsn8z57+XfQBzapO6bv05Iye1B9Howtyxk0/F
	eQ6EU8LdU7lAlvAggO/Hwo6kxiUkCIjkCDedqgwO4JhXN+u5PINPafNP26c9x+CmAyYSamPWmiibt
	KJ6HgCaDvLvWJUtCbGnaZ5iG5TWfo3Cv9PFO6wS4J15zdQVI74qWU337IAHnUp0TqGbwp1AGfYfgg
	ggFoa0vAHFl3QEwTbCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2Ac-0079Dd-0q;
	Sat, 07 Oct 2023 07:56:18 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2AZ-0079Bi-1l
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:56:17 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3ae388eb437so2032179b6e.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665372; x=1697270172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0VngE6BdDwFZLAlGMzCM3wLTc/iiRqiIMV99Spu1cQ=;
        b=LdLN1bMlWkI9UGn5w9fdM9iIC7yGMioO9R+giObYjTHv92+OlCArf8PTWtpYEdwuyu
         nskv2xHV6N9f2y2zFHTLINkSKZHqgUrcKt1p4vioDVjndcsSPfIptGqFLQdWmjKPzXf8
         mHiI9K8tP+3WvwQ23+FJ41q6pb4N/6i+tQbogCop2thG2SlfQdH679dwIGhSkz2UHvnQ
         G3JxtvZMSGRmk26niEqxDztkiTJHwoNZGD6SgwQ6CPIktvpOubS3B87mkNsuBx9KgQNH
         xMFif/1aCMU63oxRvuJRDc5sQPUkdVtuXYygPBtI4eeHRBzdyhFcfHy64TZKXTbRi83f
         Nohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665372; x=1697270172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0VngE6BdDwFZLAlGMzCM3wLTc/iiRqiIMV99Spu1cQ=;
        b=WqaJqhuWoi/fOr1a66jQsuOCWNom5OQbO4ky89dIvIE9TQNxLFvEw5z01Bo6KdA2QW
         QsYivf/rBGHCj67y7ycReX4VmK8u8Mvp6uuS0nV8R3mqV42HM9JdOEiwp63f/SvTOHx3
         dYaiwG2ejvwtY4Z8QgZ8BWJkUs0jGdZypdzHeAH9Ilc5IQBNQNg4CeEJ4pGqanA3bfe2
         pL2G7Sjr2o2k6aQX1H5OMx4GosXBXIr2frlEYQGRUOaDQYx24WVjVll5xildUvnL4Xyz
         OVh0cHZguZ2v3QENV11Ndsdm3ashODcoHnG1UCs7isVjdPw5oVl+FyPZIkaekPTigU5H
         1s4A==
X-Gm-Message-State: AOJu0YyN2nED0EGWeNJKcXJqSuGz8o5EgeSD+cxpFJhtIiwuSeM8sKtw
	WHe2eTREJPggg91tSoYR7L0=
X-Google-Smtp-Source: AGHT+IFlsn0a5Gb2lUsmV1oYkmI0lc0mxXZ3zgY9HwA4zsDa/bj7XbU7SZvFkJT8chFsAenEEwrEKg==
X-Received: by 2002:a05:6808:18a0:b0:3ae:1359:b51c with SMTP id bi32-20020a05680818a000b003ae1359b51cmr4051929oib.29.1696665372397;
        Sat, 07 Oct 2023 00:56:12 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id t64-20020a4a5443000000b0057346742d82sm702048ooa.6.2023.10.07.00.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:56:11 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 06/10] dt-bindings: timer: Add Sophgo sg2042 CLINT timer
Date: Sat,  7 Oct 2023 15:56:03 +0800
Message-Id: <c48106ebe00c0418ffb9fd5f3a827055cf97d1db.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005615_582997_A4484563 
X-CRM114-Status: GOOD (  18.26  )
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

From: Inochi Amaoto <inochiama@outlook.com>

The clint of Sophgo's sg2042 is based off IP designed by T-HEAD, but
Sophgo changes this IP layout to fit its cpu design and is incompatible
with the standard sifive clint. The timer and ipi device are on the
different address, and can not be handled by the sifive,clint dt-bindings.

If we use the same compatible string for mswi and timer of the sg2042
clint like sifive,clint, the DT may be like this:

mswi: interrupt-controller@94000000 {
	compatible = "sophgo,sg2042-clint", "thead,c900-clint";
	interrupts-extended = <&cpu1intc 3>;
	reg = <0x94000000 0x00010000>;
};

timer: timer@ac000000 {
	compatible = "sophgo,sg2042-clint", "thead,c900-clint";
	interrupts-extended = <&cpu1intc 7>;
	reg = <0xac000000 0x00010000>;
};

Since the address of mswi and timer are different, it is hard to merge
them directly. So we need two DT nodes to handle both devices.
If we use this DT for SBI, it will parse the mswi device in the timer
initialization as the compatible string is the same, so will mswi.
As they are different devices, this incorrect initialization will cause
the system unusable.

There is a more robust ACLINT spec. can handle this situation, but
the spec. seems to be abandoned and will not be frozen in the predictable
future.

So it is not the time to add ACLINT spec in the kernel bindings. Instead,
using vendor bindings is more acceptable.

Add new vendor specific compatible strings to identify timer of sg2042
clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../timer/thead,c900-aclint-mtimer.yaml       | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
new file mode 100644
index 000000000000..fbd235650e52
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/thead,c900-aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CLINT Timer
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2042-aclint-mtimer
+      - const: thead,c900-aclint-mtimer
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    timer@ac000000 {
+      compatible = "sophgo,sg2042-aclint-mtimer", "thead,c900-aclint-mtimer";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+      reg = <0xac000000 0x00010000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
