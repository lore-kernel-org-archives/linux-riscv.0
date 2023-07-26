Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E58C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4Ogg+dImdSIaKIDo/kTrGDRYItzKteggITm6gfp+3Q=; b=fi16U3nQJa7wVc
	NFFXxGrS0TgEyOzZRmhOpbCXyoVei64FhJVe8WbnWTXjFzZ3dcEOWUz9Y4lW/Dk8osj0Sz8G0a2LQ
	Bz39mQ6riJdI7l31yNt5oY+02qn70iTeMFTAr20aK75BBjxI4if7WLPYQicQC9bLqn02xnmI0LWLL
	0/ozV8gChwLEN7PWx/H5Ff2EzE2jNrLv9NtThTTJXMR1qLQFFMPjwhd9OR6DM1PCMwXV/iTMvkPk3
	mj2OQMSf8yAlY0/0L1nrOIGcvCoaF0TpEOjQjtPe4gXCoStFhb7xANDiPCXIodBLB8Kkr5PvPCOgy
	B2Fm6NXlf9J97ATNVPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa81-009c6W-1N;
	Wed, 26 Jul 2023 08:44:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa7z-009c50-1P
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:16 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-54290603887so3465443a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361053; x=1690965853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqR2RDc36TENwkhRWI02ORvUk5zlxgidXHuawQH9lCY=;
        b=nlUK5rRbwoL2VhzRVg0zVv8tMWmh5i6cSI3ycOIOo5D46+1/Oj3Z1PlX+i62+rFJ5w
         lbo89W1s+ZWo1FuJQEcNvr01bFZ5E+iXwjepPMN6v4Df0TAlOoGJNV68dsR33hS3Kish
         qLMghPo23+FOC44Q9Tm5RT13r+bs+VRfnR5Py8kmU5qVaZSCvrwROf3PwgRHDDxtlOBu
         TtipXnH0Q74TOj6r5Tpwci1B3Qw2RU2dSabea+XRJ1sPUNCXn2tUy2i//yYT/tJgRBXO
         VLyoHjAl4VXV8UEUbEgyGK4VihZ/+uTJc6xfRzUsO9cQFEGUM8J1cHuFskek9czV+9no
         OPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361053; x=1690965853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqR2RDc36TENwkhRWI02ORvUk5zlxgidXHuawQH9lCY=;
        b=QJZyAxlswJlK+0glC7FfOUbwiRk1ZLOwNaVnIUQ4si1asbZMSLHOBMK05vnCppsqn2
         Y3ReY9Nmk4AP3/o5dF73ogVZLW9PnsWLopN2NNVYFrOOSZqXZ2EYsABDkjknFKw+gOIE
         Oj3H2sUSLd0YDZImd5oyX/A2xQjMQeNJ/fhUiXMWplb3Dt37A+D7ijPvdQfqaGg9IwAV
         JYPEfsvJJkOeTFrXYZwrkqpl5hsrgsKZMtnKoj+X7Y2+e2vYWpYr9jqFc662g6vYF6PN
         RFzlR3B46s9U7MT3GyfqEgqw6VIRrMjuZQxofLHxO79VgvK5LvxRgmvJDq+BWVV1RrK5
         6JSw==
X-Gm-Message-State: ABy/qLZOueMcg5me9pFdRfxecHSLVy7DrhD8JMUFmSSquD+lzGrxen4R
	FaAF1bd3gZg+dYgYFB7FOJDAPg==
X-Google-Smtp-Source: APBJJlH592K84ltOhRh3gR6yAOgGgfgy0lypixvCAnYvAI+Q7Scr3ODImmwLsYXSc+lgNqrvJcEdSg==
X-Received: by 2002:a05:6a21:6da2:b0:130:46ea:29cb with SMTP id wl34-20020a056a216da200b0013046ea29cbmr1341794pzb.25.1690361053298;
        Wed, 26 Jul 2023 01:44:13 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:13 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/7] dt-bindings: riscv: Add smstateen entry
Date: Wed, 26 Jul 2023 14:13:47 +0530
Message-Id: <20230726084352.2136377-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014415_471269_82B2A0F6 
X-CRM114-Status: UNSURE (   8.67  )
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

Add an entry for the Smstateen extension to the riscv,isa-extensions
property.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..36ff6749fbba 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smstateen
+          description: |
+            The standard Smstateen extension for controlling access to CSRs
+            added by other RISC-V extensions in H/S/VS/U/VU modes and as
+            ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
