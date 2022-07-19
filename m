Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B489C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbuYhk7MTtKD6bixCgZwCImYT03TkeG2/RqEz8JvIqw=; b=194gTt5OKafrev
	7jahT7FiPxTIT0CR7dPLTfNV8f3lpz6xRz7C4kP/MfPNJdGiYUS8WhwftqkiH1ywK9JcuzwdfXpx2
	qpswaxQMZMrUAXWRDQAsmPSCZNJobb4jLy+pY1JcRxi0Ho1swz2PmtMC8RNEiIHcaiAgFBEwcD8ni
	APjzmA0jHzJyfqOtscm9kwEcD1mruxZK1iOdDFz0aaKbWsC3vhlYuGN3GNPmASUF+KGlQTxwq9MS+
	1LjApzNc2XYagMcIPS/V0LT2ZWUJZvBAbv1dj1/4XWm8A/cfZIZ9kyuDZclycMUpFlzY88cJ9puaF
	WdFhIRVeqI4N+LwMabnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDg5u-005VQy-VD; Tue, 19 Jul 2022 05:48:31 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDg5s-005VOw-Cl
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 05:48:29 +0000
Received: by mail-pg1-x52f.google.com with SMTP id f11so12555738pgj.7
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 22:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Zv1KPN9JiNDXsrpx/KpRv4jlVQ/XgtQ+la2iBvvbEo=;
        b=aPmyhgHbEj3yjha+RdH7+WmsgzNU6UK2PdYcjlAmGBwYMtEf1UUTaGFvA/5q3/uqf2
         TSB6Pb0KkVqQxl+mHM+p05+aB2P5iNDR4JPwth096jqb6fK+ei29DWXX6/m5v9EsqHiI
         4EJ/DM1d9n7Rq270JbzZLvMOQyJDkGEGWn0b9gPk0e8WV0U9tV5+yXOwjV8pN4Ua2ZPA
         ZX5FKnH5IeeNqaVG+9NH1B6+Sz/m4+M852tl3ArR+1lescplIrffsGg4Y9JW/C4xwctn
         gGtD4KLl+OQq9rj6VoPFcNUtmF+IrtEbwKLvDpQcEIUsvhbJOXyJwOzd5tEghk+vQCC2
         gGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Zv1KPN9JiNDXsrpx/KpRv4jlVQ/XgtQ+la2iBvvbEo=;
        b=o1qqtGRc+dNTIroUanwPws9uvtcq+FM5/ybMz+Yk10WdQHS2o2Byqwo59ZplWqQoJq
         uohlOnzfuXR+d+CWok6bp9XtJ/5dxboagv1T2RKVUpmFshci10jgMb/K6c3ng9nPuiY+
         Fjr25sS8esqL7wUer3AyiGAA5XzxTAVvSgmrHbHo7E0mJnffLpZKEoQPVZCVUn83bZp9
         nBS5wsk45g8wNeXwYiAqhfYgJKLg7COT8gYdX1Pklx9Wk4XLqNlBFQIbsVZSN9F+bdY6
         ZiYfLGOnwaqOt37881NJiBb4usEn8XyM6b+mLWtAdTx3yEatwq/CR6EOrXZAG/D9cIYr
         WOzQ==
X-Gm-Message-State: AJIora/mfEK/P8dxvw5MAmntDcun5vJYT9jLHZL2PjZlDP8sncIvHLqe
	+eiHkXu6uwq2hAH+PFySQqfs/g==
X-Google-Smtp-Source: AGRyM1swatdkW28ipNZyiwyjPCdj/wjSf0JTm3UtSlnt0QiJb65SJO6lfU4nMttdr1PWPl6x72yPxg==
X-Received: by 2002:aa7:8887:0:b0:52b:17e8:fc7 with SMTP id z7-20020aa78887000000b0052b17e80fc7mr28107122pfe.35.1658209705381;
        Mon, 18 Jul 2022 22:48:25 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.93.102])
        by smtp.gmail.com with ESMTPSA id o186-20020a62cdc3000000b0050dc7628171sm10374129pfg.75.2022.07.18.22.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 22:48:24 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-always-on
Date: Tue, 19 Jul 2022 11:17:28 +0530
Message-Id: <20220719054729.2224766-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719054729.2224766-1-apatel@ventanamicro.com>
References: <20220719054729.2224766-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_224828_449727_810E1BF3 
X-CRM114-Status: UNSURE (   9.19  )
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

We add an optional DT property riscv,timer-always-on which if present
in CPU DT node then CPU timer is always powered-on and never loses
context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..33832b8dfaab 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -78,6 +78,12 @@ properties:
       - rv64imac
       - rv64imafdc
 
+  riscv,timer-always-on:
+    type: boolean
+    description:
+      If present, the timer is powered through an always-on power
+      domain, therefore it never loses context.
+
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
