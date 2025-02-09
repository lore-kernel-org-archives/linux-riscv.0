Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CF8C021A0
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3r9Jo/L9Oc30mUEl+XoEWpe+z7rkvJ1dUhPxuzvRzFA=; b=hcDU35luQ6K3Pe
	7ToXVzLFV0J2rLpN66vXCToj4Na+7aVSpcdseaKvz9dsTiVKk4sk0cAEFEy+8sB7LT8ZxE8HM4DC5
	6iOt+rTZeOatts9yJSGMW2WT6TCxMdBU5hv9J65p2ZjuAmBI25Kwag6wAWF09OcsYVmEwa57IkTDe
	/nIkfpgMLuf9GzAvv04iuQWAJPtaJMYlQT4HiCU1qWgmR6/g8eqZeTF3FfY3JH4ogdS+FItg9nVh4
	TT9Ylyp2n3k27WAy27SJSWsijSPw+hH9eTiT6pvLgWcnHRA9LkofQNudiBKOcuTXgx7tB0q8qehSa
	LERZnmC3QM1Zo+hqXD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6cq-0000000EsrT-2V8V;
	Sun, 09 Feb 2025 12:41:28 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Rg-0000000Eqxy-3yaw
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 12:29:58 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c0566511aaso122558485a.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104195; x=1739708995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZmXC1QHZ6qUPtq4dKp71UFZwZYd4E+dKLToMhoQDzA=;
        b=LQ6gui1ugPMwhemGxQKoxgc5XZNdqQTVqrfYj3G8wEmVnN4chEhgV8Cf+kSMoblJfX
         2tWogh839qPZHvbfkO9RHkfKlpe65NBt1bvbld0oBy5JOskD9lI68SD/Saibj/pf2/Qu
         i7z1CliYJMLOzQRPBFdQR1pwYtvDCY8HXzJLcOBMvI//CgKWEoQavP8EWQQUxPv+9/ZL
         AoAfCFZjWnjTMKwqy7qUQdYtkhF7N3oOqU5RFnSEG5DAffj2uyU6Awz3nwv/PEMl4Ypg
         8UfMIoRezWXtYevOFZNdo+MVxAC36USj8SO8rj8QG0Ip0tj6Adqq3nTHuHRa2usc0+dp
         FEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104195; x=1739708995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZmXC1QHZ6qUPtq4dKp71UFZwZYd4E+dKLToMhoQDzA=;
        b=gX3cTivXeZN3O/2KldpAaXvORgt1BB7KgfNTvIpeqWxN1zc7iddVZ9AqUtdlL7It14
         9AfrDHq6O1kpIckMQuiHWIVSW5Cp2qvTg+KjdX1C+a5uisd1+6G+BNKK9XDFyN9Qv2Sp
         xocuS0GreXQGvCudlSjstgWLj/tKiuSDRgP/pvXXDnjgVoAO07w4nyjWZjzYqf7v6+9b
         ZKSPv0UUOgYVfDQBGscWEsHtyyVWGSl8s/F3uzNVheO+GOt8jMrhJ43aphUWuiAgIZcc
         8tXsGPEzdcs1mJbhFVxE2JKp19hO7NVer4Fu47iSiFfd6/0bCUziw30zQ4P/CDAhaYmv
         u+dA==
X-Forwarded-Encrypted: i=1; AJvYcCUPKKyzL3seygjpPuoAtVmNj0qHVhrP7SAB2mvgV6RdowM+Roe+WIkCXqTy0CNCBR3UvKYZg3+FcToarg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq57206q04UK3mEENY+7X4ldcfN8sIOwe18A5Ju+npANIPeeTt
	TzDpRirz4hbNAMY/SxGUqlo2DBx+Fh7XInTsoONdURP/v+wOW9DN
X-Gm-Gg: ASbGnctzyixF1MZmy571TGfy46/KM9eXi0aDbUVIv7zrr1JCvaZMVhByaSt594Nq4Lv
	dwX8QecKpZ/vWpw1b/G8jAvUyPA6tA3ctkAeNBz7joyPQOsCQudyUrE5nFiCWcV3VibT/m8jwvR
	n+rqUM5lgbRPsJXuSyZHyuEdD1QEZfG70oo3Z/3WNX6us2WAaKsr8mxtlKaFruWCS9L++fHk/ub
	5WYjtBJuJCmjIPITUMjy3CiuRmrys+ocm6kIFYCnTJbVzrn4IWOmciBbt0tL2f1kjI=
X-Google-Smtp-Source: AGHT+IExVq5/Fb5tbJ7DgmsClGXTJgW9O4NKt1wq0W6lQou0Es6079usRdVZZ9UQb0DXmg/JvDBVuw==
X-Received: by 2002:a05:620a:319d:b0:7a9:c129:5da7 with SMTP id af79cd13be357-7c047c355c8mr1378460885a.29.1739104195605;
        Sun, 09 Feb 2025 04:29:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c056b42b89sm115301685a.69.2025.02.09.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:29:54 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Sun,  9 Feb 2025 20:29:32 +0800
Message-ID: <20250209122936.2338821-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_042956_984046_E4995C40 
X-CRM114-Status: UNSURE (   9.33  )
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

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..73f8009698f3 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    enum:
+      - sophgo,cv1800b-reset
+      - sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
