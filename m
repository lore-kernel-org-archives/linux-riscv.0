Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6ADC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBBNZvgKALnJl/ZvG0kgpt/mozOcYh1QQeRiJM/1nzw=; b=TROu8GbxS/QbxL
	wYJKdGbIrxjaoIHFXVNUvLc/Zml2GbFzpE+TZ8o2K6qErmnqlMNc58trLdqHBYEtH8F6n2EO6ufdQ
	H9S8KssmLJ5+2GMKc8lzXMaaayhPz7Vr9/4v1lL7AOU4xmUD6lIaP0QZ8f74Jz4MRqbg1AmUDs/kw
	R8TrAC/cee5yQHft4mkrs6jXTgDcJKehT0No8D2gc48bSOljSnbFluh4RzcZINYgjz3+Zp+OdzTIG
	0yaYNpcRxq02PMsTsVC9T2VNKWV5L45W5yA5z3N8udSVXOsWodru9Kk6bkWcJP5s1gnslYfUT58l+
	cVJAlwyQwPUghrQp794A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBoE-0000000GvlG-1t7J;
	Fri, 12 Jul 2024 08:39:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBo9-0000000GvgL-2CIk
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 08:39:16 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so1189702b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1720773552; x=1721378352; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8FxVWkBbUSRwzKSDXaD3IouygOhaOZodT8e7MKio/0=;
        b=BMEz1uYkmhwFrzR4z94L+uPm2uo8dqqlUas6a0SiXSTkhYrhMh/IfrkE+WFCXfWGrE
         BBnApAqt2T2IJWJ+rKjF4yoKucx84LI+7cMnCaLfzfSpTfxfJYedNoZ/sx1JkDJt9kba
         fmpgdSPzgjAYP9UYn//RxWWz9pexdgoTxJvvxub14sNIMT8rz7uupIaMyomIv65J61wY
         3SwYs6g4iEAXgl2X17wc+J1OsnlupWssACK8hz06Q7gakCiEId8vpbN7C306BzpOpynH
         eQ/5TgIqINFwtGde+a8OSaallnlJEb6givrOmIzz8j9DfZdRQqSrVnr/e7ckmKdxuILT
         Uoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773552; x=1721378352;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8FxVWkBbUSRwzKSDXaD3IouygOhaOZodT8e7MKio/0=;
        b=KpPrQ3H/RnXsMtlMOHDKHsbqfukuOHmEVGCMpsBZvA1exE3ffcCQq8d6y3+59mgbNP
         jVIhTsSMSm01GJUo6GqlyuQCJKK9bQKEi0ihYYl99GmyZM8XAxVX06qzkHdLF/Y4vFOs
         RNo3w8TKga3/yPTg1nDB+ASR7lPwqSiDq4M8NMSNDKhID/kGdNflPzCrQAnmYl3T1miM
         GAKAX07zV8ynEjblpRRlc6xJ1gpAZ2Hkge5u3MXAhkuCJMJ3ezGefVL79PzCLWrep0dU
         uQ3ldP2BH4Qv/F3eWxfE/iCS1UMkztBcntGQaioOUgLdt62dxoLtOvui07Oe/BwoWLE8
         giIA==
X-Forwarded-Encrypted: i=1; AJvYcCUQxBDq/tG+dGgn8XxdaMdAhwdgTDurH/EjqFUnapwixwYvkbaaM1r8k7nY8BQmXYQCHI2Q1YgyeZfBAzQuhcq7fzmx9Dr15VHP8XqTjkeV
X-Gm-Message-State: AOJu0YwlXTYptKSsPb354tMkf6c1H4cda4izSKkZKGh1sZXTkLAkxnH/
	991xB0aJSmHkDsbVcIYUzdvDawiE/UdLN24Fb2wFZU6kiz5oO+ohov8gg6RlovQ=
X-Google-Smtp-Source: AGHT+IGFZpUIicB4zZC9hrvnR3WIEBPWN8+7c0RwydpX4SwJwlx7pWYViWf5LIEdN2ZgdD/fy0d2ww==
X-Received: by 2002:a05:6a00:8d95:b0:70a:f521:52da with SMTP id d2e1a72fcca58-70b6c976927mr2334016b3a.16.1720773552263;
        Fri, 12 Jul 2024 01:39:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c7099sm6894194b3a.84.2024.07.12.01.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:39:12 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org
Subject: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Date: Fri, 12 Jul 2024 16:38:46 +0800
Message-Id: <20240712083850.4242-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240712083850.4242-1-yongxuan.wang@sifive.com>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013913_650393_9B66F9F0 
X-CRM114-Status: GOOD (  11.44  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
property.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..e91a6f4ede38 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -153,6 +153,34 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svade
+          description: |
+            The standard Svade supervisor-level extension for SW-managed PTE A/D
+            bit updates as ratified in the 20240213 version of the privileged
+            ISA specification.
+
+            Both Svade and Svadu extensions control the hardware behavior when
+            the PTE A/D bits need to be set. The default behavior for the four
+            possible combinations of these extensions in the device tree are:
+            1) Neither Svade nor Svadu present in DT => It is technically
+               unknown whether the platform uses Svade or Svadu. Supervisor
+               software should be prepared to handle either hardware updating
+               of the PTE A/D bits or page faults when they need updated.
+            2) Only Svade present in DT => Supervisor must assume Svade to be
+               always enabled.
+            3) Only Svadu present in DT => Supervisor must assume Svadu to be
+               always enabled.
+            4) Both Svade and Svadu present in DT => Supervisor must assume
+               Svadu turned-off at boot time. To use Svadu, supervisor must
+               explicitly enable it using the SBI FWFT extension.
+
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
+            #25 from ved-rivos/ratified") of riscv-svadu. Please refer to Svade
+            dt-binding description for more details.
+
         - const: svinval
           description:
             The standard Svinval supervisor-level extension for fine-grained
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
