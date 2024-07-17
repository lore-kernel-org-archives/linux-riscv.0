Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D86C3DA62
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClVAQyoqaiD8oJUygVQVI3Kei+BnRp7vpy5pJvEmjSo=; b=f6GQqn9KkHJf4p
	h2miOt9WS7kyum0RqEMcVhwJZAn9WmkJKZfo4Dutl0Nxaz6b4YSK1zAuXgrIsEPktYq4FgV7FZbVH
	QScP5LwURp6ZPxqU4MNq0b9L/eh8y5VnzBHH3QOUZuWrJkL4tyKjN9xFOWEB8Dj70m3SAlgJQ3wup
	+KomL7/uNlioePpnilfH1gtJTmRLRJoo5IblWr9ZubBpS8HiYBK/XJCfzkwmqydcXVl3PmSU9J2r7
	H598f4aBF9mbAMQKDMMRWzHizjNxsz49DY6zIdJQ//j9UGjX37RWA6UEqQUlOkwtYJxn0g5Z28WtO
	JicifvS/h22oqlvp2RZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU946-0000000EYwH-3U0z;
	Wed, 17 Jul 2024 18:07:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU942-0000000EYuN-3rSd
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 18:07:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so868446b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721239662; x=1721844462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tFii3hPMYAW5WvkVv/NJHIyP/B7kBKP4c/1sTtNnLg=;
        b=MDrOPJU7RDW613yJ+cc/puNFfbgmpIcjsOg2t8ZL0JOpqX8Ij71GDLf+OKdlFfVMlG
         JIYfSFej0i4A+MZj0eiGO0exm2rh+EkJz2bRh97yJsFVvh3ly6G0vXBoiS4yZ0vYl0IB
         kj+5M/St4FncO0EKqjKavkfcN5jZSeIJ7Onc9zMS1gvjBCBn4FVei+h42V6/AzLFxl8B
         gkOiO47H/zxy5nqELNg5oEHW22zxQLCUfx44u4hu8SVrsqa6EBXXyLNgJbdJoIN3OHke
         6Z83+IZ6BOF2W2mZZDbBKgsGlZWJU1NYFypm54NPhWb2Rtpi9oSoXBOtKkO5KEnef23y
         0/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721239662; x=1721844462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tFii3hPMYAW5WvkVv/NJHIyP/B7kBKP4c/1sTtNnLg=;
        b=SCAGUoXikUe4C/7VS5e9lce2hoavsY+pUkFF1cmffMIg7wVbvq1rBYWqqq5jSnYZWR
         7MjD99n001E1Pl8LAQvCWulnFU/sSSoIy0Ubwy5Qxr6HWihk2FmrC5kqvXVT18Zdro1s
         cyOPlc+5BQMLN84/GIFRn4ARV2WDy1CtbeIyzB+Rj38lsTFMg850Kq5jojV/r5fH7GV+
         6YlEoJLYOOWic+EdBxsOmsR2+fI8DoE4yeNthvfHtBqU6XYKmsMoLHE9HyztA4KYwv/F
         +WEHU8UiHVyDQYkrPIFvg7cZ7jTykw9LbU0L/GpS2v/OTeLHG/ZcdLYlTvYIADQFUmDH
         x59A==
X-Gm-Message-State: AOJu0Yxvb/Y0Mn5cQe0R76FwzQVDEMoCsXb67qvlN4C2SyXsLcZG+TVL
	ADWt/BEsmtEr7VMoZdsSDkmN3lrVaYi7VZTawES4QalKtTmVinJM3z4vHzFmB3AMw0WiIAqSB4i
	0
X-Google-Smtp-Source: AGHT+IGkm7y8DzyVw6YqO18fnbVUrmjLNXdtGQCu/ytr0h3ai80Sb6oKvYQECtXt6ZL5w+lxnqy/1w==
X-Received: by 2002:a05:6a00:1944:b0:708:41c4:8849 with SMTP id d2e1a72fcca58-70ceeb7e7cfmr679984b3a.9.1721239661951;
        Wed, 17 Jul 2024 11:07:41 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c969sm8432332b3a.35.2024.07.17.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:07:41 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/7] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Wed, 17 Jul 2024 14:07:22 -0400
Message-ID: <20240717180727.4180475-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717180727.4180475-1-jesse@rivosinc.com>
References: <20240717180727.4180475-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_110743_019433_954D3D43 
X-CRM114-Status: UNSURE (   9.64  )
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

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..9f6aae1f5b65 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,13 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for misaligned support for all regular
+            load and store instructions (including scalar and vector) but not AMOs
+            or other specialized forms of memory access. Defined in the
+            RISC-V RVA Profiles Specification.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
