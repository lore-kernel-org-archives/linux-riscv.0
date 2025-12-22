Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B73E674AB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9ULkvZA7iQ+cVsz7Px/4CmOtkW4oI1VN7QvLyRQR7U=; b=eKlUt0ve74iShk
	peoBTuxCuwLVV0PJ3Zzl5Wrps5RCmFzcVzIRriQYr5SbfEweDg3iIYkiVmTJjW+ALECbimBka79FO
	hii6Kkx0I15WqJSQXkG3zhEocYjxU4GjSASWSEtWOPpWD7p6Dxai2mbdwWJir7u2j2y+qwMqQKRUv
	bznFCjItgFuf8OU8u/N4y8n5eeWL+pZMyCJrtv4w9XfuHgaRLSLGWG+yiAtVQte26UXGQvYV5x7+Z
	bp8Ea4MD0EDvOgzGkQfLGH6PP4JTxljId2TRJj+49a50o2D7MO/avGM+GjOlAKz5lMPjUbY7uSGk+
	JKdZZhqJp1gEbkTyAKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfeE-0000000Dmq0-1Sj6;
	Mon, 22 Dec 2025 13:08:26 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfeA-0000000DmnO-2boi
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:08:24 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so3343392a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408902; x=1767013702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swb/fWVKIa6s7pXnfz0NuUC/cpCMSK9KRmfqsMJyLx0=;
        b=TMiD0vBGrqmP+OLJmy4+5Dr4OCiZCsvRm1zOpN91fM8glBr7/DUSS00W31c5QeQG6x
         R712ZmBMOTS50Bl1eJJL6x0j8LUIUj7Ckdw8HOlKBgOUt2MF7L/Ihcn6EDGiTTYMYOeP
         iUP2yWVsnaVBL6aXHbxAbuMKDzcbhw7jmQ7wR0Q6swFxO8lIKqwXJg+cgf9NvhTs/nfv
         W8BsGtA8cTh7NvCtYvKTP4meiGgnGSzpqIimA6la5yUynLMR2ztMKooYzk00qB4BFNVi
         nvgr2ypf54AexBSIv0zEtjYmkUz+zTZWOhOdkBd4Ud8Lkd53VUtPXfYMgFJs+yJpglio
         BS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408902; x=1767013702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swb/fWVKIa6s7pXnfz0NuUC/cpCMSK9KRmfqsMJyLx0=;
        b=BUAuJ4jcA3WoYBaJJNQ3pCCe9feSs4Rf9u50eRuKDEjhx8C+7l3v5WPcFUYZxbpPYl
         JR10fHa+bfEnFMYRdlrKROXHQfuWN+tSIGUCJLBUjO89caU6blqHFCnO3OWIw9QwskOc
         +Hgqu3gfVwK9bOMnqWWv4D7M645YAxERHuTLADoMNWDCL/Vs1Sine+vJ8fmBrjQUqOEz
         iKIMrGedQVw7zIJgmNVq1KiAoePDlkEXZvdEVHWPieEffm+i2GM3w99XBGf5qUP/Dw4B
         3hF5A8W7MHMNLnoXpxh4VwIc67EnjqUCQpAjvJOZpYuk6aQcgGgrUvtobuqTYBuEQnZq
         QENQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBPHsNYRQW1GrKBO9qP3lxtP5zsnVlCfZM02fCxlTuB93LfGZr6+rbOuNakON1Or+BZskkww5KNJ1kKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkM0bfDvckPHGwanTOYYbd3d+OpHxYyyGrM+5iRSlKKlESLkXx
	+4+ZIm0rGEGylwy/iMyYdQC4UuQ5dW8SIPA2yxUDQbscEP+ONkKbE/jYn4shtA10Bdo=
X-Gm-Gg: AY/fxX5gsOaNXs0KiVH/UaV3+WoIK29Z0Y77ADOZJGPWgXXqL8lsRBH5Q7BToSTv+xi
	788CiufnMayMErId7X4apw+4FMXhdgvlGAJQC3OneLV3828HdPTne/hICiw0Y505W6o83ExWu5h
	LT8moSm/QiFk2RqMSPDUbSUPfqawGDfqQ0k18q4SnDtG6qUjXvA4adijzVZI8hKIe4C7PSt0hee
	uJXMLBj8Bvkzsew2SL82Emf0OocjjVMgjwwwdL16ratVny0ndLiIJijwg0h0qfjozto9xehfgrK
	4L1yU+N+9s1WELBJAkn6WQV/vJXEPvEyFXfbEBYJVoRZFGeIRTke+c+YMdP+N8kClSmHpLt0JbM
	VC4P7Z8SW0/vPJ99+FRN9OToCmssACEI8nuihr5tOAeMGovWi1s6Bh4dDcGBwSQKTQJ6vHlJ78+
	F2vNjMx0k0F4N4Vozi2kNDDXO1xTbgLeA=
X-Google-Smtp-Source: AGHT+IHPPRy520yxXn5W0jP09IBKvbx9Ua51s8et6DIA6qmS0TPddDUVvXFSM5IqYjM5F1HB2SrU4Q==
X-Received: by 2002:a17:90b:564e:b0:349:3fe8:170d with SMTP id 98e67ed59e1d1-34e9212a48amr7542919a91.3.1766408901569;
        Mon, 22 Dec 2025 05:08:21 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:21 +0800
Subject: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050822_688883_1A51173C 
X-CRM114-Status: UNSURE (   9.60  )
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

Add description for the Supm extension. Supm indicates support for pointer
masking in user mode. Supm is mandatory for RVA23S64.

The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
state") of riscv-j-extension.

Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
this dependency.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 1066b7e65dab89704dbac449db4aa5605c95b9d3..4997f533b2c0defad88fd59413a6885b5b9e109a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -267,6 +267,12 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: supm
+          description: |
+            The standard Supm extension for pointer masking support in user
+            mode as ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D
@@ -892,6 +898,16 @@ properties:
                 const: shvstvecd
             - contains:
                 const: ssstateen
+      # Supm depends on either Smnpm or Ssnpm
+      - if:
+          contains:
+            const: supm
+        then:
+          anyOf:
+            - contains:
+                const: smnpm
+            - contains:
+                const: ssnpm
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
