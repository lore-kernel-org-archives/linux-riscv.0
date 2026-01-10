Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38249D277CE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3PDGQ4qT+/IJHmzrINmN24OqPj0EhvKUjDP2M42MwA=; b=fJqE/aOsFdn3bU
	Xf5x3YqpEE5j/euTTNFxjZxQg/foUML2F6sjYD5FmJqLTyFE5kZ4V6SioJK2lJ3Y7YSkfF6wKHdIn
	yo2Vu6Vb18KPqI4ng/gBly4FifNN6y/IBT/uXI1FQQv3f8o/rPXJsIQyKhzfjVvLWiq/6LSChIOlr
	jW4LBFyVJpG+ugiQXCOMUuKBgLclxDoePpMfaLPLa87yUD1nW8bN4smomOmv4JNXJvsJh8ufs4Ih8
	+A24kOELxLgCywt6stITrot8jyP4Xw+mTSRBU5uQVntyX6rViuMZMHVLHVC8CMwrHTZqjtAuL5eAo
	9K3K2V48Ga8cBIHXL2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRP4-00000003GNl-1VVm;
	Sat, 10 Jan 2026 05:20:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRP3-00000003GMQ-1YR1
	for linux-riscv@bombadil.infradead.org;
	Sat, 10 Jan 2026 05:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MnKLaktx0YitXAvKONWboruSzuMArssppl0GK0vv2ZI=; b=O2FXLgHz8sprV+3X0i17wI1Fc9
	J3mUJLhbQDqdpeFlXos0ER3kL9o7K8hxSrCrepKXvvYpn6/PGpNZc7VT3cUUEShD59RIbKMDJNO6g
	ugtvDaORv1v24su8Q60V4l7wO8UuOlvnWEeI59naQK0pbSaIAzpt66NcGAykMgePYpdFryJW7gQms
	hDSCzvymG59JSsNposT2ZevRsKEb4VnCJphpiYXvqFw6nxeD2Y0d3TUndum9b2ES8rT3B8fwvEbuM
	od+a3E8wBlVWeQm3V86ikAFqcCZm1U6fzeBw8NMwKQMWh5kZcSTXUN0ZPMDpGg2/8ua9NNVMYB2HY
	YIjLZrbA==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROq-0000000GGa3-12OC
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:20:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a3e76d0f64so17132905ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022429; x=1768627229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnKLaktx0YitXAvKONWboruSzuMArssppl0GK0vv2ZI=;
        b=zxWIsLj5/MkhVkunzB/b8tej6n2XX9LECNq23N/w7khJ7SLodS0yUrafh+nCvdEtGg
         54DdcwuHeGoSXP37AZN/p4XYE7uCa5UiKHvf6Bcj2ckTu8xROX1LK+t1+5wsySr6GBXx
         8yS3yGc/bn6qGQwzzuvpc7wv8BWEA4mSa9WPrzQYpOQY7d8KQJp8XnV/H4DJSJ4sxD5g
         MHHzzc3jFn4q9TC1vz2u4zSgQ3jlSbbwD2nazNsjYsFZ1/kGU4V//r9xLHLb0vYD6l3S
         61kAWDkrczMnvft2OxgnXxVHdUYhZwcqydv+2JtZvLoRlb6hTmTn+XLqaJPenBbIyFuE
         cQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022429; x=1768627229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnKLaktx0YitXAvKONWboruSzuMArssppl0GK0vv2ZI=;
        b=KxGEuak093Y829ASHdpnsm7TEBQ9V0U3kBSBkieOXzJlSpM/v3GxFMEZfugIb5uh5H
         qrmu2/HKOHog59HQ7q69GUkaFT1yyRRB+Ny/7ohzEuiI5j1l2GvhC+mexGrc0zG6soTi
         ufS5CMJ0lj68FQ5vyRLUIH3DwMBfBj3mehvinwH8ptC6h4h6afRnlHyBOfEGOx0mEtLk
         idWfeR2B4XYGOTuTJXe2LaU6+llIiqmm/dW0wqKtcE7PzwWB7JCLUMUQwVkNurCXvisl
         vGbadw5PHuBjNwWEJzghw/D74vdZ42XwLP9fcWcFRQW81Jkv8mhfP3HZcIlp/ao9w9wW
         9BSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoeKS9UXPJAsL8tM8OPY9MVrY6af/+oui+7v9bofyLNK/mLdoUIdm13GJnyOFTmQ+k9GUce9SVq0chkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH4l8UCUYHwJUb9z+LjJna4irCXFO0ERbTswgObkqiN8y9H/8T
	Gdis88BOW+kw/mt2TOh1A4XsBYmqTZr1HWSKtehEO9WbcCY/Hvw+FNXBUhtvUPg78Mc=
X-Gm-Gg: AY/fxX7wh1Ci+yAxet6wIgiwUCdbwQiwMAqGpHEa1ZUQUyx+5EUwJF1WRYPT048VFwo
	Dit3Twr6IiTzaLLrsl0iJ76knuXCdbIj3hskEYiGOVEcTLUtK3MOTIvhCbP7sPqRxy5C+wKC4X3
	RT246PlvKkaKfiPxbsntmJZogapsFG4Dgtf30RWMSj+jSWy/BNskEvZkhsCPgNnqbVAVkYyW1Ts
	dBFCvsE3ujclVTlaDdtInOxRwgACW96JkviMKTF5Wk5Om69wk8627Qh9y5LqIPHAsDTCBnPz9bz
	W75D75NoHiDmDVwMglInwxV5gdJORTTJj3oXccnydB2+3VavgsUMV++XRReArp592Yz0OXUaqeV
	KQby+Ia7VLtylOgV+PVR8asFkbFpkQcZ3NTPA3V7ab7NLR25mxQdSvacKb0/iwXuH+qbIfR6Wxz
	AB37E1rh7NgQqpWes1AZTpVutpTqcMyv/SnU+B8BTdm3kGt9AsXjPugA==
X-Google-Smtp-Source: AGHT+IHLx1wPTjXjzAS2eGdh9903fjAPi7RCiCtnZZLH7PsVuIyVqtFb3O/Bml6wg2iKJ9agI1qtCA==
X-Received: by 2002:a17:902:dacf:b0:299:bda7:ae45 with SMTP id d9443c01a7336-2a3e39edf19mr141059685ad.25.1768022428644;
        Fri, 09 Jan 2026 21:20:28 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:28 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:21 +0800
Subject: [PATCH v4 09/11] dt-bindings: riscv: Add Sha and its comprised
 extensions
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-9-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_052037_152333_282AE66A 
X-CRM114-Status: GOOD (  11.31  )
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

Add descriptions for the Sha extension and the seven extensions it
comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen.

Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
"rva23/rvb23 ratified") as a new profile-defined extension that captures
the full set of features that are mandated to be supported along with
the H extension.

Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
b1d806605f87 "Updated to ratified state").

The requirement status for Sha and its comprised extension in RISC-V
Profiles are:
 - Sha: Mandatory in RVA23S64
 - H: Optional in RVA22S64; Mandatory in RVA23S64
 - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
 - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
 - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Drop dependency check for Sha. Both Sha and the extensions it
     implies are allowed to co-exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 900270e8d22e..41cb4aeb2667 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -129,6 +129,57 @@ properties:
             Document Version 20211203.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sha
+          description: |
+            The standard Sha extension for augmented hypervisor extension as
+            ratified in RVA23 Profiles Version 1.0, with commit 0273f3c921b6
+            ("rva23/rvb23 ratified").
+
+            Sha captures the full set of features that are mandated to be
+            supported along with the H extension. Sha comprises the following
+            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
+            Shvstvecd, and Ssstateen.
+
+        - const: shcounterenw
+          description: |
+            The standard Shcounterenw extension for support writable enables
+            in hcounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: shgatpa
+          description: |
+            The standard Shgatpa extension indicates that for each supported
+            virtual memory scheme SvNN supported in satp, the corresponding
+            hgatp SvNNx4 mode must be supported. The hgatp mode Bare must
+            also be supported. It is ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shtvala
+          description: |
+            The standard Shtvala extension for htval be written with the
+            faulting guest physical address in all circumstances permitted by
+            the ISA. It is ratified in RISC-V Profiles Version 1.0, with
+            commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvsatpa
+          description: |
+            The standard Shvsatpa extension for vsatp supporting all translation
+            modes supported in satp, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvala
+          description: |
+            The standard Shvstvala extension for vstval provides all needed
+            values as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvecd
+          description: |
+            The standard Shvstvecd extension for vstvec supporting Direct mode,
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced
@@ -187,6 +238,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssstateen
+          description: |
+            The standard Ssstateen extension for supervisor-mode view of the
+            state-enable extension, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
