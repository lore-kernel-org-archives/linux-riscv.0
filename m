Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E461FCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnzoIlXNWPrRSV2xTNuYc2MGwfJxnZaPCRSn/e1DE0M=; b=MpEbhuLSD97BXP
	PkxOwPwNgpZMUF2D3DZbzL8WtJ8zuJwAWZxzn2bYKy3KZEp0p+W4MTSn9/P0Eh85L/vdq5gVaAL68
	6clKZFJWKHzYQdEn2v2Dn6gNjBBhct/icIx/QJmoxVd8THqCw/gcxMRec7GUuFw0vuZO57H0CR63a
	0JyxJv3lnfzfdHjemvLdJbgWOIrGEvLrbZBFMoMQFogfnIgpdeMEc6jGnf/vmvWJ0Yio5yqYnHju6
	2sOb4/guvg8oHGSBLLaqyqfmUTYa4gLAse3/abs2My2l0k2mQ29galx5IEXwuUV2yQ2U8+KrX6uHU
	Um1guWihxFAKnA0UpS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloI-00EMEX-1F;
	Mon, 25 Sep 2023 13:39:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloE-00EMCA-2F
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso46311335ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649174; x=1696253974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0nR1d1X0MlBXUc/LZD12tdCUY8BFx747N+beNbmoR4=;
        b=BZLjDm3FRP6qK+VMlRVoVes9yhnNNEZAWuvLuNCrkJKu7U+/k5N8lBYnnTIiPMZMwW
         nHzdzxhqkfrRcvvlj60RTrqHVQQBOE3pi9WIXMkBqMlH6ElFkV0PT6ci5ODiDAIgn4gZ
         lJhy2l/aaqE/KHSmUmnimHm0DwAxBCeSFENBAJIKd9ugk2Do/7v141jSvKOASkUnMoR9
         Mb2XjAgaTAfGpBBJb7AoNGbEHK+ozdJup5TNyimKp2LJ8QbipcusILjCPJT+bUqFK4SO
         jRYMR5TZej0rJ+qoIHFpuh6Rwe4VirQiPeWPNu1ov8xHkws2AnNoY4j06xFzXTXqPkpE
         VaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649174; x=1696253974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0nR1d1X0MlBXUc/LZD12tdCUY8BFx747N+beNbmoR4=;
        b=I++U2IgXU1yi4Zr8TA/2nzrK+QQ4wkRG1KU05qZcrRUPah5QeVlUxkw1KnK6NqBpZy
         sSthbzbMm1cnrc5Mqmzxc/WMVT/JgUkefRwMokpRpQLdUfaYx5hRtlQPe0xS/BfAOdYJ
         0QSU7wTVrY5zkN9q/dIxITKolShE8cwvEPYUPxD8Rj4gSx/kGV7la9U3KNEWoCHgYD8f
         xh9LyGnctcCEhB3MoLUZjI5UO7kjWuSCxDNDBtzC7f3TN2UMMri51/TP5CsWIK/Ozfg8
         k65692L4G5NQ9c3v0rOFC2MGUaBvh3A5LFFApKbdv5XMYKMuMF2hywJEh0ce7WxeEyQu
         9bgg==
X-Gm-Message-State: AOJu0YxSHjASG7YBGq9rM2GBTjUDLQTiKXiyDD1NltvVQkFLqbWnxSSI
	DBQJYOXCybQLeFZPEhHwGz94Ig==
X-Google-Smtp-Source: AGHT+IGe2ltYHOKifgoZuKPVFkm63dkXjtN4qjeWkEpgdWPkv+o21XyWmATLP8vrvzDJy8UtUBfYhw==
X-Received: by 2002:a17:902:d4c4:b0:1c6:f56:9315 with SMTP id o4-20020a170902d4c400b001c60f569315mr2815286plg.68.1695649173981;
        Mon, 25 Sep 2023 06:39:33 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:33 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 3/9] dt-bindings: riscv: Add Zicond extension entry
Date: Mon, 25 Sep 2023 19:08:53 +0530
Message-Id: <20230925133859.1735879-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063934_752103_9FE7F7FB 
X-CRM114-Status: UNSURE (   8.26  )
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

Add an entry for the Zicond extension to the riscv,isa-extensions property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cad8ef68eca7..3f0b47686080 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -225,6 +225,12 @@ properties:
             ratified in the 20191213 version of the unprivileged ISA
             specification.
 
+        - const: zicond
+          description:
+            The standard Zicond extension for conditional arithmetic and
+            conditional-select/move operations as ratified in commit 95cf1f9
+            ("Add changes requested by Ved during signoff") of riscv-zicond.
+
         - const: zicsr
           description: |
             The standard Zicsr extension for control and status register
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
