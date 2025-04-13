Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53796C369B2
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MX3724AKt7P0mfUTBbHA4I7Sbayuvy03W4wBv9JHWIc=; b=3dBPE8v+mAJPWo
	M19aiiAWxHpDiH1gEWrTZVAebryeqpB2ABRjJp3d8XafFapZQaCiphlPZG4m0P1kXkSLrS9OzlTz6
	/+Er3oUD1bSKJhhqVQcM1aD1WcS/qVcYxFKMABHeWn7ZX0mmp8NG1gSIAASLAFVHHf2NLFyMM10OA
	Agwg5BsmlkBlt/Lilc07LFtrdD3FJ9l6quasU8OBStvbXFBnZ4+6rXvPumNACgdu6sPgEIDFW1dOS
	12Sx3UNsxYQZ3N84hrz+jGB72ayruaweWZiIJGBNugySX8qzfv8pqPnS8Pp7TKG3PCANBR2AqzsDe
	4vIpo5lHyXrVWk/I/J4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vn-00000000G75-2v6O;
	Sun, 13 Apr 2025 22:36:03 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vl-00000000G5n-3KW2
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:03 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-47690a4ec97so37100311cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583760; x=1745188560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMOUZ6qRg9W4PB6CSqOFfx7Fn9U9SQfI0wC9q+7apzY=;
        b=CmrpPmpQ9nE95VLb6ONxtL+SmyopJ6HWF444kYNkucJ06oqf0eJs5DJY4b1Et/9xRv
         ICLm6ibNLOGxu+oREAm9GfO5oTFFlLWS/HIzfaAY0Ed6okIfbyy4umFV1B90nhACvLWW
         LBQZBJnjlGb/h/Nr0ULts9Oyx/Lkuw8YtKvxGjsUOwU4bpApTxgg6++iAlJ8VJznSCz+
         a2Q1Yz5BWcUcBxLyssv9/VpOmEaS76nCWxJpLxfwd26V2KfSals9Uvv22lR6Lnt0gsme
         zQ4OMWeJigxwnRhC+jgoqm1lrgnP0CT31Ud7sHjU6fF6XbGNBODml0Y9m6QCvensV7t2
         KrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583760; x=1745188560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMOUZ6qRg9W4PB6CSqOFfx7Fn9U9SQfI0wC9q+7apzY=;
        b=IfViNyPxsG3dSiCBTB6ZOC0eNKx48mK/ctbJ4duXRqEqUBvQ9Fnjm36rWhEQA1PCbb
         4ptFALEyqlT7fLzaShnHAgrPX7YHFqSyIRB30p1Zt9JwJieicSWuHdQJs1TI9rdj66E/
         dgzNLgzyKx49/8wVahVc2CwBz5/MLI+KAvUSlLfNmdVvClZbyvlO2SeI3wdYkjB0faye
         RjoetEy3LVPb71ybvkbKxMwmF8IIP5K6kH04x7rLzqhqzr8BCsD1TDh91TQ+OHymBnDn
         V1EO3xfCnuiHCJZk6NcGkoxqMSu4AJ5TiENb/bAB+e0b99ZKkxum7xQ2WBesgOykHa3H
         ZyKg==
X-Forwarded-Encrypted: i=1; AJvYcCWwK9lK4NAgk5MVLw6QPwbtKKCz15s5btuLXmNZFuZc1P86jYg0kBW6QeScuC8oB0gquHw2IZgTAD9i+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDhuORizXiy7WnlGpVuXjmuI8XVHsMbIq93mMTsdBeTzdGy+qX
	45chBJtWyEoU4FENIySYThVZJVyx7QDZNP3E3N9u2E9aQffRksrj
X-Gm-Gg: ASbGncsh4/tEFTKHOn9hM65oVMjJxnTOAOeCdIO6X2egBCXxZyxPikihnsgzJEQE0Q5
	nSVEYgbRFXPcrIxPA90F+YavE0ghX3zIFSRPujs75bpDjpFK2MA8jOpbGoOPwo1KZBe0Uag4aal
	iXmvnBi0o2W+Y3IGCUmwZWvmXWFvfxWQWG6C5SyZl6M/9xoLL95fcxoQ0ir+mkCManVvnSwOwDA
	Tzm0q8PHY/UbvIbOOi/zN3KqptVBrskDhqoPWeNpIXkSAH7EVEwiAfbi/8or6aAhQrihAjF80ts
	yrlSvKhw73gdMCFr
X-Google-Smtp-Source: AGHT+IF93rzEVWRRKOIxWAcvcau023Tgxa4/7nUy/JnIgvkSrZ8RcL6P1YK7x8N162WFUx0/ZurzFA==
X-Received: by 2002:a05:622a:2d2:b0:476:8f41:7b8a with SMTP id d75a77b69052e-47977551e2dmr154754621cf.15.1744583760520;
        Sun, 13 Apr 2025 15:36:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb0b581sm62137321cf.10.2025.04.13.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 03/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
Date: Mon, 14 Apr 2025 06:34:57 +0800
Message-ID: <20250413223507.46480-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153601_832706_B524B2F1 
X-CRM114-Status: UNSURE (   8.65  )
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

As SG2044 also implements an enhanced ACLINT as SG2042, add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 065f2544b63b..d6fb08a54167 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mswi
+          - sophgo,sg2044-aclint-mswi
       - const: thead,c900-aclint-mswi
 
   reg:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
