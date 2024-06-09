Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BF5C27C65
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2024 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22dRUznyzuuLam+9eAHiu5DKjBNyMQycATEa/JRZX1g=; b=C2NGNTPEDs2pi2
	S28wFE5YNJVdmC+e8LU/0kskLcmm9qRnr+Es/0cTZ9awIRrE7iPxxQlswgbicrM+Pp/kwD/JaJ2hU
	9Nc1WuyfnsGPqZkYV5+JVg/whmte3oqmv3uruEw49wW2OvIFzR5JP/9qwmIH/kLNq3envtPalWPbF
	7Ppdg8FNmHNg8IRhRhVTgGpHJqHFpDRxgivrm+sVf+9HhbWMUQ4T6h0OJudF7G9QmTQk4Ds6sjpSY
	/ZTDBg8Nzbas26lp2TlZyRgFESA/3kWrTFkwRfyQfiNTxTwqoU5CJZJgYdBHK+VojOJVJ0gHuKd+H
	2Ejqp9LDldaSf4XfETew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGFSq-00000002Mfe-30o6;
	Sun, 09 Jun 2024 10:07:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGFSo-00000002Meu-0Irw
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jun 2024 10:07:51 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-704189f1225so1437941b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717927669; x=1718532469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8cWoOmqxKfRTYz+fqWWX+hQL/rBm7CI/FqFLj5thyk=;
        b=Jd4q3miK3V7S4tggmFOLv4OWIQjNVXFiau3ZAQ2w7PdeHK5FA14U+UCwN2FePS3od0
         8NrcL/OuPyYfuW2C0RwlF8hfqCxEPxvmkCh6SGQqUUcp+A7LMgl8mgLiyF+6wBZriPVo
         pASu7tb/M9T7NwnD+QX6jW3UrbdedBnX7H2Zu0rhNFdbinB3ckCwdoF0qqyobDpff/Ye
         M0LJCuda8qxemtcNHx8aw0gnhg0P5LcW6iQZBUWmw5XZYUJWThkcKt6WOYPpXDYsfvbT
         6BB9zECimLlNYrlVEf3WZ79ukp63n/G7CvikZ6Gh/JKOq1YQG5mVt/h2HjcTfsfWeGk0
         AZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717927669; x=1718532469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8cWoOmqxKfRTYz+fqWWX+hQL/rBm7CI/FqFLj5thyk=;
        b=kTdKJoPda6cb3T/U5hQjvfiGeBGG121mBce9ymbOORxrtCRMabofIkLttlf8Fpvtrk
         z+O75sIGOn24wcROnZ4pUSgSktYoUVL2zq6aCrQi+4nUk5dYTxwOQVF4kYUtwEEv4iGS
         mdA2QJ6pbmwZ2KImOw5UNrQlmO3FBfxHJMasKhfSMS4yKVCzRrL1OFURYk/3dXlsu5yn
         SCkeguLG48XRPevvVaPwEQm67/w5NcXyKJoTr44K3w7/9JLkcTXW+VrAXaJSOLl70EhZ
         QF+HXi2B0O7xEmss9SBwuuhVCHYKQOy8TsnBUxFEnFU3z8tEIKcItlCFm6exM4zjW1F2
         Bj3g==
X-Forwarded-Encrypted: i=1; AJvYcCXl/sMS5s1zucXr+sQXeQuiVVhTNJLfkzav5tqajaEvDaLEoJXFW+Kx+um/iGBXo3Ns0gJfBnlQUqunIiFXpm7AmHXwCDDM+96HeTECeugG
X-Gm-Message-State: AOJu0YyxGLzjPQRO9r4MSEzMJPm0tsRDCqjs3qWvSH7LT0Z0zL7ZEov1
	NE0nVFbu8VogRHOkXI3iRdYpep05NoIWyZZ0ckbYY8WqT3h28nh7
X-Google-Smtp-Source: AGHT+IGUOwdS4rXbpKPl2f/O6CYkYK6yfhL3sIsZMAuc7WIZ8+BQleh6SCurcGAE85uB/kTJeBCzGQ==
X-Received: by 2002:a05:6a20:7487:b0:1af:fa18:76f7 with SMTP id adf61e73a8af0-1b2f9dc2e94mr7273875637.39.1717927668863;
        Sun, 09 Jun 2024 03:07:48 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc9:92b2:ce0f:ca96:5cb0:62e5])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7041c78ac20sm2817534b3a.154.2024.06.09.03.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 03:07:48 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: kanakshilledar111@protonmail.com,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
Date: Sun,  9 Jun 2024 15:37:08 +0530
Message-ID: <20240609100710.85055-3-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609100710.85055-1-kanakshilledar@gmail.com>
References: <20240609100710.85055-1-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_030750_139903_9DA72FC8 
X-CRM114-Status: UNSURE (   9.85  )
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

removed the redundant properties for interrupt-controller
and provide reference to the riscv,cpu-intc.yaml which defines
the interrupt-controller. making the properties for riscv
interrupt-controller at a central place.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v4:
- Change DCO email to @gmail.com
Changes in v3:
- No change.
- Rolling out as RESEND.
Changes in v2:
- Fix warning of `type` is a required property during `make
dt_bindings_check`.
---
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..f1241e5e8753 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -102,26 +102,7 @@ properties:
 
   interrupt-controller:
     type: object
-    additionalProperties: false
-    description: Describes the CPU's local interrupt controller
-
-    properties:
-      '#interrupt-cells':
-        const: 1
-
-      compatible:
-        oneOf:
-          - items:
-              - const: andestech,cpu-intc
-              - const: riscv,cpu-intc
-          - const: riscv,cpu-intc
-
-      interrupt-controller: true
-
-    required:
-      - '#interrupt-cells'
-      - compatible
-      - interrupt-controller
+    $ref: /schemas/interrupt-controller/riscv,cpu-intc.yaml#
 
   cpu-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
