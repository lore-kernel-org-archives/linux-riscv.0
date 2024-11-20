Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14531D63954
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW5WflU6spej4IKajI8XONxrqNwBiHLEafsHQnajOIg=; b=0HA/+1jVPOVa9C
	Cj5SrBQICdsge5vGrsPtAAglsP+3v1bLHOyGKT0jGkj2laNHrPU7yDWmZJ+MnMAHQnZ9Df0dRWZHa
	cnzlHmc/MRkcu7U2wE/O8JH8G0ACZnacmaWE2oxj4XzZ6MlEw3kYXsXPLHJ+/mYYzi7KOFpJX53v8
	5pED9tM/9AGTxSq3loQwkb2mOEeYw8ql///Um3qXgHMg+rXdELT4K+1QKQ5bCHVlxoM0yfOG+qUcV
	aiYvt0i+CSFT/D/TNe2KbAh+ZrcVCAft8EN1y1/zWekR8ESP4fDy0SGl883i47ooimkLC5yhxrm5F
	jjRJIGEH4HkEbP0l4uJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlVm-0000000FW2N-2rvD;
	Wed, 20 Nov 2024 14:16:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlOu-0000000FUno-24fc
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 14:09:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-211fd6a0a9cso18998235ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732111787; x=1732716587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlIs8ciSuCEurat2M6T5aQe/KW2jWkSeCjmg9uXPSa0=;
        b=l/aEvDqQ5AKihUECCKEQYxrt7MZurq/TixNH8tGtOoxYPrp516APZkpHT6b34PpjsX
         3rddiHjPkPztfsVEf7A7y4ESu1ffP6JVoCyHNrnfLh0JIKjHFEoeoUKhIhPUyPk37few
         afk+9ZWRKC4S4ZuAHIzNyQsU0vIL4srduK/veMSyO6/QVr5tRrqEU6zQDvPop+Xe74IR
         9pcwkSUzLUAJzx9htUzs3tUwPaS1Ppp0Zb+yD9mR2RNCWTZdf/DfEo4ODgyrG1egy9UN
         MvF/Xn3e7Jjs9LHDDy6h2VyjMoVTjvOyN5EWEYv1fKBkzAa1KpB24RCBq5se5ARtw08Q
         aaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111787; x=1732716587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlIs8ciSuCEurat2M6T5aQe/KW2jWkSeCjmg9uXPSa0=;
        b=WDzdhzOqMc5RiGxYHYLsl+Lm5zzN7s1QoGkBUVg30RYRhpr9y/Lw263zYtb6c+ZK6Q
         ZPxyPc0ldsIhL84ct/21/jZt+8aJD0J3UXXQt02EC6AIofbTitQfbjhV3Rg8dXfVPpGQ
         Pn4GVStC0ErlynJBap+Uek+7ebkSEleYVEFOdmPm2XA60KUFWXp4FB9DQOYjedxx8133
         Kdhi0noR7f7YvU094IqWl5vMn+JWBrW7Rw+8dvj2R8EY2dZuKWH/FlJejk2TOx4S5Wpf
         4xTgjeP7rIu/qiPa84nssG14KzLp2RXLmByvefMG0/J6qxv5lhGtzU9yTx6ZsQsJRzpZ
         UhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdnZ2Su8vQcaW92EMlyY4zg2ye24yNb8XoWBtuKcgnHpOTsbeqnmI7u1Ies5Q3Bc3c5ZV/fWq6ueMx8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHYLbJJ8j8RIMCgA37gPQgCC1jSIV4r7ad9D4LhfqtOl5MfGDD
	PMgl2Nwd8BSO49pCZ/9MD+eSM0nTBdhyp8qQBB0TENjSKo8/0rTF8o6J+7xp3HU=
X-Gm-Gg: ASbGncsl8Q+CfNLTXdd2ArSmag07totB4anQT0J1XTi2KDeVieWXN5u8SjOZnsYFzT5
	jUVOtdjvAEZm5w4cJsAWx5m4AF+okYH/w0Ga9bh3gljZy7i8OmbdTEWQRWBomILQCSTC4ULY2QG
	PwFcMsRrXjCg2mmrvZlDiFeSvA8HE0L8FArmCORlV2VQuWeaFycqZs2t2hTyGCqucjTMMHdz6Dv
	O8yD+0dJLVKXRinoMvR5Ja732yEzwaTsAYYGkvp6Qtv5xfSAC3RtUjUpACLhqv3Sl4PylIRkkmT
	Wb7k4A==
X-Google-Smtp-Source: AGHT+IFrtEPOuxYYxZ/A2XZltJcWpegyv2Dbfy8kT3MJUJFj7OhNvu/6CxPQYQZcLvYMlhhsU3kN5g==
X-Received: by 2002:a17:902:f549:b0:212:deb:71e8 with SMTP id d9443c01a7336-2126a372c24mr30209125ad.2.1732111787242;
        Wed, 20 Nov 2024 06:09:47 -0800 (PST)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f474fcsm92502505ad.213.2024.11.20.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:09:46 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 22:09:32 +0800
Subject: [PATCH RFC v3 1/3] dt-bindings: riscv: Add Svukte entry
MIME-Version: 1.0
Message-Id: <20241120-dev-maxh-svukte-v3-v3-1-1e533d41ae15@sifive.com>
References: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
In-Reply-To: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=G4f8dg0A+liIdlqDQ5PGVlbXce8P3mr8X0xg0tMM1ms=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnPe2k4LuiDqPUonIF/e/ODWE2vS7bEQWO/KzSL
 gPzEPspzxiJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZz3tpAAKCRDSA/2dB3lA
 vQbzC/9AwP3Nmt74myupKpFJKZXM2QnkuxXGfXcitojEe/gMao05/SkOAHIsf3yJj3RhoV0WzvR
 FiV5XbmZ+jumctRNOxQGgnrBoQV8SpcEOjGN/XKYE1k4eP6d1jtU4WOskADAWK5VSeqDLp+VYYI
 YrcM7vbZ2iimjRdPfPsoasi4+OaiXAaz0eIaM3CHawJR4neDhyVpOzZwBD7IETt90VeEkzrVP4K
 3ltoTNi7EZ+udq7q7ndYCxi/MXYKCvimTV3M39pHneUSPY2cyxtlJu+n9EWZJYL84J9yZtGPlYG
 m2tZd0oX6xwiv1Uh5Z9tqs4UWN35Y8LutJjkKG7vm1Bg9H967btc6VGXZUki6zBLKR5bW16GxZo
 ktGe6dTU9hn2GEOtZjuRD8CmLsTFWW2tMjULAX4WL6++j6B2UgjhxMQ2/2Tjbstu89shjOa0XVf
 b5G5ilXCiSxfoO+EIIhInJ34nsUQzIaicdyBt0mzyfUlH1UiV+E2MVjn0TY15eiqGYZCI=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060948_553236_D7D6EE9A 
X-CRM114-Status: UNSURE (   7.88  )
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

Add an entry for the Svukte extension to the riscv,isa-extensions
property.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index af7e5237b2c03085611daad9e1e39aa93cc8ae95..bf177274b5c6f4cd1c842b4221ca5bbfc2960a0a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -189,6 +189,15 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svukte
+          description:
+            The standard Svukte supervisor-level extension for making user-mode
+            accesses to supervisor memory raise page faults in constant time,
+            mitigating attacks that attempt to discover the supervisor
+            software's address-space layout. Currently under review as Pull
+            Request number 1564 at commit 81dc9277 ("Svukte v0.3") of
+            riscv-isa-manual.
+
         - const: svvptc
           description:
             The standard Svvptc supervisor-level extension for

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
