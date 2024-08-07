Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EF7C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v3C3H573alR3dI082fW3eeBghbeBiFpMTmrTtxKiaM=; b=zz7VdCd4pL8mkX
	uHA1Q3PfNoRll2vc6K89Iv6eKDK6rQLTEBJhkKW2vtyOIX+pWwuasIAwoSp/SQ319bUf2EIPhtYiz
	10qJRE8zTk8JprLDkXn24Itgeoc8ueqYkqUQS0mybEZBHJDpYN/K8hwVbrRjz65QwVI4AjLOaVgUk
	u87bVuIdJuq26VHYR+rVpI30zhiQ83C8XDvQWV+coTWpzWSgEjWGnATaze17LjQUUqu9n/5FFCwL3
	r/v0QJN2LkdGibtuVpar86JW1NLXc5kHpFa6CHKbO7JnB1qOXkxeGXSI5H7jn+1vAjqoNIOzRyg+x
	1gJH+NNeeO+dcvXmuSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUak-00000003Qlm-1zYj;
	Wed, 07 Aug 2024 00:31:50 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUah-00000003Qkd-0A9P
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:31:48 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-39b41306b4dso4558725ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990706; x=1723595506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=VsSaJXpn9MfSkPc05qHp0X78vbZehbL7MCwOrUij9g+3e9jaDE/fa+jG92sBWLsJwd
         gUVOmuehEgvI57v8Q7hQtt4jFdiEFf/cPZwOGyxWk/l/8CdEAoM+iVhC2R5OG1Rb1yfu
         zSlq/ac3Z2kbvuLa8X3s08u7Y4aqX1gOuTIiQP5q0JCj0yBhqJHpIDYNDZA9n+wKQ6fn
         dNHwR8tLYONgB4AnL3U0sdwjocLuT/0K8Hl+fU+A1iVLDSNWdG/XwdfBDgGOzusU0U7l
         VIRLiO+X+c93Kd+kEQycWG5w0JQUwbkndp2CXmcrYw+0ilULIS7dO36wNoWjANXck9yK
         0rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990706; x=1723595506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=o1SI4HoXMEWw5crQL3ryiEujwO2gveBDqG50udGyqurvgDk3WrRuJgHT6uAy0bh4zm
         ddX0/GO62BgPWCWsEh5gnAas6mgHWu9/chhFiG2g8UDAXbZwtBFs0+1RANcnN+SO0Nzg
         RBAChGzCipDjnH2D8CpOyq2MWQzdBe8yhGc65Le+Ox1xSXv2NbugwbfanTfJU/YPf9a7
         ayfMCiAxKtDgS3c2CcIZ+y2Kb32zv6WboS9yoXEANv9aHZsqs4APGMbYC0//Cc02Cmkq
         HgD+22vBLOezFt2E9424sEfj34JqiodOj8ocenaQvcM+OmE7oy4MkzGELUzJ5599bHL1
         SWHg==
X-Gm-Message-State: AOJu0YzdqzN5YLrFx2JYKjyS32L+itLX2a9Xh8axyC4vxXrvd/rQ2oxN
	gF2WCr9xt9GJj0EV9nJLkyyD2qg7bdznUcZnnNXoSozDu2sfBz/L0grw6elZazE=
X-Google-Smtp-Source: AGHT+IGt3XlJs5WA24THRxvIb9/ANnk9itE8gX2KWFij4dZh7cIbInKOO2OSONSuPSefGVoo/Wv5/A==
X-Received: by 2002:a92:c003:0:b0:39a:eb26:45f8 with SMTP id e9e14a558f8ab-39b1fc1caf9mr159350705ab.20.1722990705710;
        Tue, 06 Aug 2024 17:31:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:37 -0700
Subject: [PATCH v9 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240806-xtheadvector-v9-1-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
 b=6O6Y/O7ilQvMwXHjXH5ncVCTt0keW9yY1oW1bUdxC8xpCAYGnrYGKuz4ml0Ca6Y2H6csZpNHV
 TvVxuODA9RcAT4JN9cvY6+06cznH6+IJFj8SS27BN5w4qhDRIrivNt7
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_173147_178191_688AAC79 
X-CRM114-Status: UNSURE (   7.79  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
