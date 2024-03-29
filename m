Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0410CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdXbxEwa+tZteEWR0TftBFRZHX1nobXS0AK5n8tcTAs=; b=uq6pbT2QxQ4snI
	eYC4YedkMu3TvxmNYY8TdgrUf0wn/C5xq5m6lQ7Lh1Y3rd/VDZ7PZMtCwE9X04FMKG3sIAKcq1p1K
	33ShrkzzGq2vioDw7Qssmqu5HLLN7AkulPthM8wNlq9CrYQ/BEtZwcrsmc/asTxuf7vHTvhpiYoW8
	m0sOztvI+1JxVorbEnKf8uEkT2Vmhm6c5Ng3hRrdC/ntuJzC/CU8QkEu1J/kXjgEZUC6c1zBJsML1
	UBM66cZZyxt18GBjUbudMtNPVCRtSdnRIuyIcZm4HR/e59UtXJpfw7sdSe3Z3r+vAmH5xKeVuVRsu
	zRHO4v5shh6vbQMjkkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wj-0000000HUSn-1dzg;
	Fri, 29 Mar 2024 09:27:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wh-0000000HUQd-1sWR
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 09:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z0W2e62vRjypPXRsKNjsPCEnDXDpWajUvlAFErcdHOc=; b=pGuXCyo9V1kVHkdLNmzDoBr+jd
	WlYHWcjpBYxuQQwGLhr38YXpFEnBojLdvMPGeToUXyjavo2sFPGl43EsI5CWtlmsZeGi4laFFdX7s
	YcVxdwkEPxxA9exfl8KF8B6qr1bqYh7RFwtulNT+OEYolTCYEvhfmfZe0sqe+DbPh1azkqot0IxAd
	gUqcETFUP5bD1WmvVDFVAc1Qhi3xDNq60edx742JBfbWCDsarS4eFk57x/Xiq8gGEy//SlvbzUkfY
	jc+GzWZQ0hVYd9v8ubDNwW2QZt69rL7ovUooVG/IPrBVncIPGDKBphmj5M6GJXjZq3Whv0CfM50Rt
	cpBsq+Rg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wc-00000001TtG-1wfP
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:27:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29f749b6667so1316284a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704468; x=1712309268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0W2e62vRjypPXRsKNjsPCEnDXDpWajUvlAFErcdHOc=;
        b=fVJHFKRLuAkeeSzMUott8WoGdpMtnKqV7pg6vhL4k7QlBa35J9RWOMaq7RDjTPkaZJ
         ofm0gzAtpGzRVD7sCrKjSveVB82ZjZzp2ZRC07PR0BXevlzE78QCBWkM+VX16iKeNvah
         hO//qOjxB4iOG/OzJdiYsA4FQW6koGGv98PYtir8aoq7fGiG7MfJdQ9LelPPga7Swjuf
         lxGhM1W2D4a5z7houm/+tBqQjSXgP6FlMueQi4KHobIRc8FjFXF6xFXCJzF4P4OX6xHY
         Jkda/FN74SjzrBZUI+55t8gA70ay0HU98AyFgDEYQG4hDlAJ7Nf2hmk+6iGPdEF/+GOQ
         xdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704468; x=1712309268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0W2e62vRjypPXRsKNjsPCEnDXDpWajUvlAFErcdHOc=;
        b=dKxE4K7lJRzTdUSXpgwYdoi3P9RhUSDhHEPmg9evvdT6gRZLJ4QrCMmX04o3jAxSNN
         deyz+qmq5sIzOzKlzfKOIW4MIWaWgjYe6/UEZqUSCxHkmyHPMn20kLLJ9qnTW8UbOIds
         28C533AWA6MmF4BIVWekm51ruIJOsYQXi1LJvvuA82c5MyPax7LgHeSiokoi7GVYO8J4
         ePpctc+KOq0gn+kKSKFj8uSAuQ32qX8oShsjocV6wFi5kVWg9mNDEjkaPOavvwX6rbk+
         j5dQubqdYk+X14YldtFM7nySOFSSXiijFyA+0L4Pxq32VIe7bF1sr5mTqo9Hlkv/sq6k
         SzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWji5wv/ZHjXG50c0p8IKVq7b/QgfzAbProz9sA2VBprTgfazV0HYD+CrwQ5nO348tzT9P8WhWBqZ7p7Jz7MDgwHwGOTMVtzOwaKhWFe1I+
X-Gm-Message-State: AOJu0YxvsJOARZqDTp8u69w+5FlfVHe59mbhF1p36n916uamRX/qA5tb
	N3wUpy4TVpDaLBeoX8rnFO425AgbS8Q2kj05MApOscqJyvozFaLKL4O+8W77nfxwPpUHirhvKzh
	nMQ9lYICCgFilxlrttM2RyqBRaFiwrRXICVPBpFhsCBYNgfxaJHPR7zEP5xHi/B45wpIkmpCYfu
	aMYxXPPeTY1P/oASgp3KMNs+bInKmuZwHLLAEUGl/Ld705rQwSYA==
X-Google-Smtp-Source: AGHT+IEuJwWsZcF37cdSyR4oAfPxO9tw5zd/KR1va4FW9dJBQvIHdmB9ul/Vbw6Ly8QQV6MyjM+RcQ==
X-Received: by 2002:a17:90b:46c6:b0:2a2:176f:fba9 with SMTP id jx6-20020a17090b46c600b002a2176ffba9mr596520pjb.43.1711704467546;
        Fri, 29 Mar 2024 02:27:47 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:27:47 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:18 +0800
Subject: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_092750_954602_69095E85 
X-CRM114-Status: UNSURE (   8.14  )
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

The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extension,
to prevent RW operations to the missing CSRs, which will cause
illegal instructions.

As a solution, we have proposed the dt format for these CSRs.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..c713a48c5025 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -137,6 +137,24 @@ properties:
       DMIPS/MHz, relative to highest capacity-dmips-mhz
       in the system.
 
+  debug:
+    type: object
+    properties:
+      compatible:
+        const: riscv,debug-v1.0.0
+      trigger-module:
+        type: object
+        description: |
+          An indication set of optional CSR existence from
+          riscv-debug-spec Sdtrig extension
+        properties:
+          mcontext-present:
+            type: boolean
+          hcontext-present:
+            type: boolean
+          scontext-present:
+            type: boolean
+
 anyOf:
   - required:
       - riscv,isa

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
