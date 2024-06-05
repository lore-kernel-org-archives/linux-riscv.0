Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3666BC25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+c5JiMBAmcTnJo0cLuHMRxEm/tqvAolpds/AT0GMKXw=; b=Bo1hXmJcjmF2iQ
	T8c1p4P/gZERI5VUNVrCALIxwkoVwpvO4b6SC18j/TxHHNNUe3nmOnfeXX0FJulEiA/lopYmdCEeQ
	OoX83Lr0efc2p8JrqWgF4bkMpA1fwhLIzYWbCBBK/mwE9sYMrF7R0K9KD7e7pRkpBo8XYwvEkn20z
	lbCzj4Y6KhEyxeoM/gqzm2vdCBfI08pkeKbuA0bgz1xRJZiNikjFsWLdDm8HhgFxMhzgB7VoiCT+l
	4hdHIbqZj0PLcGb0/RN4TqAobwrD8NsFXjc30Od7FnqlppZ2/qTLXm10qV1X45+EtFXy0KwXel91d
	mUicy6xOqMYRjitWkxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYY-00000005vU5-0Dwj;
	Wed, 05 Jun 2024 12:15:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYV-00000005vQZ-2WSz
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 12:15:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7025b253f64so3097495b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717589746; x=1718194546; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GpvzkiCxKozJEFTOhtS0qkQgzMcSqTc8pxD/W7VEhXs=;
        b=da3VOQgkgHg35968M48B/uhJWzzjBRMLM55H5QKFaCZX3tk7vMSXTRvQFtR3sF70Lu
         //a8+HVtIpNzP9phDMrOMjBBpeUi9eYNlYWdLR/2BfoOTeIotc3HW8vgzC4jbdpnDd2x
         k2SXkTP4iiTQcKfGi7Uq5Cacq7Oq0ECfvtWVcaMYZdh3Avn0qyl1MLkNeFy2702DILFA
         bl1Pfx69RFnseCAUblKV01MeKgoL6sVaA5Q6BLYyR3zmEujHAgEM9mt/gEAfEEJhpcel
         yoMKTea2PA9KI/bFp9/72gDzJgryeslbt7T1XNgNkIxP6wJS52GG67uaGZ2oclR7b9M4
         w0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589746; x=1718194546;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpvzkiCxKozJEFTOhtS0qkQgzMcSqTc8pxD/W7VEhXs=;
        b=cMeQb8nVP54Dq+8Mg/hfkfaNaRAz/ff8HCpMRl2Vdr5qQdc4FR+GzwmpM8SKzkth1g
         j2KTOUZFWwmzC8iUFEXnWjxIoOyYWRs9kvkALEp4qz9BIs5IEiij/JDaKxI8WnbPSLRX
         6nTu7UEN+9W1V7CcPH/DrYF26Pew+jT1dr0dIjUNLg2ZBlUO0TAfbdzoQEsKJpNDDmS2
         Nq4UDxGVLb6+AMyzNP92ZMS1d95bpVfVqbKntTkGClhgRcjkEXgJ00ByD6VHWnlKbZTI
         paFW1Y0Uqfz5cfWb2gG15JNjwHg//s3QDjcv0oo+/8n1o4UEv7MychtCTkQaBqLpVOhV
         FApg==
X-Forwarded-Encrypted: i=1; AJvYcCW/dsA/9hFxVhKWdm40I8Fh/NrEK6GOxMFpPpG1ouXkZ2ZkUgUj0x2ILIfnvy9x8jCH+r6YdiZxs46lATG0aKiEuipUSkfENJ23p8vtHKgQ
X-Gm-Message-State: AOJu0YyAYqRRAJP0XoXEw40w1ACjLjihFBsibUf92hYJwap77rdvyvwz
	DZqZGlXKMKRCb5CdD5OqLNgVB2jPzveEfQoaMMKnoSruRa2sv9umxIgongBfNvY=
X-Google-Smtp-Source: AGHT+IHxvvSw4LHcVUp46xf5eLnBwmt4LaRfb4YBe++3w64DoItEt1ztOFnT7PyaQMcSTm6fON3nVA==
X-Received: by 2002:a05:6a00:1991:b0:6ed:de6e:dd24 with SMTP id d2e1a72fcca58-703e597aa21mr2623604b3a.16.1717589744922;
        Wed, 05 Jun 2024 05:15:44 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703ee672fb3sm885379b3a.216.2024.06.05.05.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:15:44 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: apatel@ventanamicro.com,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Date: Wed,  5 Jun 2024 20:15:08 +0800
Message-Id: <20240605121512.32083-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240605121512.32083-1-yongxuan.wang@sifive.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_051551_693665_9526E487 
X-CRM114-Status: UNSURE (   9.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
property.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..1e30988826b9 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -153,6 +153,36 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svade
+          description: |
+            The standard Svade supervisor-level extension for raising page-fault
+            exceptions when PTE A/D bits need be set as ratified in the 20240213
+            version of the privileged ISA specification.
+
+            Both Svade and Svadu extensions control the hardware behavior when
+            the PTE A/D bits need to be set. The default behavior for the four
+            possible combinations of these extensions in the device tree are:
+            1. Neither svade nor svadu in DT: default to svade.
+            2. Only svade in DT: use svade.
+            3. Only svadu in DT: use svadu.
+            4. Both svade and svadu in DT: default to svade (Linux can switch to
+               svadu once the SBI FWFT extension is available).
+
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
+            #25 from ved-rivos/ratified") of riscv-svadu.
+
+            Both Svade and Svadu extensions control the hardware behavior when
+            the PTE A/D bits need to be set. The default behavior for the four
+            possible combinations of these extensions in the device tree are:
+            1. Neither svade nor svadu in DT: default to svade.
+            2. Only svade in DT: use svade.
+            3. Only svadu in DT: use svadu.
+            4. Both svade and svadu in DT: default to svade (Linux can switch to
+               svadu once the SBI FWFT extension is available).
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
