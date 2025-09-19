Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFDCCAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDU8RZ3ATPNez7xe1IAtF8YMDNE/9pO/PTGWVee8sBY=; b=C5w6xh53vmz63M
	CYuKvKjyE1BwO8bGnSEWFs7cwNIMlXdSnTdqTSLgPtD1s4ZXY4Zc7c9Imuaf/QWKbtUgOiInei/4t
	rGXVIIsaARgr/ge4B8xCuwjt9cDR1uS/2Va7y1s1d4rkofluToZivx4AytrTWwJa0BouijYKMT+nu
	KL40ApbJN/ceXa/OMMCV6fJDvAG7XRnkVwEc5IFdHNKEM0LJncbL6sZea/tGlSYG+jFOIV+yjRrAK
	WvujaXFIkHWo8r/Ff10eX6JZPzn032KKEyTs0Ake43HGZwvFFZRdocnP/CnpQG3w0LIfZdq5uHCtD
	agScX7Ui/bcIszTgI+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgn-000000025Ov-3VBt;
	Fri, 19 Sep 2025 07:37:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgk-000000025LV-3x3v
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:37:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1793241b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267470; x=1758872270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=AuYMsTcwoL1+D1ZV6CagSawKxMFw3Vy4mpeew9XZKYCpSaayue6BShL6uPXh2+EPqM
         SC89NxQsyIpz7QqP3wpij44kwjBiCo9JGjl3N9q3usJzutacah0dkjEV2Zw4UCrXpSkl
         7dC025T7GSQGxV/WIkKlPPDcscS7PFhmNxNoOfpR6r2SxM+6E0F4+d2/BBq58UKJVR5L
         prLwXMN48Xz/EHwcp/mIpXinwjjpYAldZqCejiE2aHMWIAbUVp+LHlYbHUDqjlC0SNOW
         OqV/I4NCYvTfVnt0xVKamS5l8tBK5KEffGH/S2tmHzdNEboIZqIT9CUav95KzEO+1+Re
         YHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267470; x=1758872270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=rVYgHjHJO+iv2Kx7CJ6uHC253H3MY8VmPqiE4zVobZk6IzhnnnUbjk0Mb43oSk3eMt
         CwDg313kBKAfMyfQi0A1At8ICyLgUopzgPTMiTuX/SjrYczlF1Xr0nxp+MZk2Swymx6y
         9i2+Bjm+hFKI5+Fq9q41nNtACu4+DGXbtXft7P8rutZw46+iuG1RAks37pdHL6nXxbKH
         rQgsZXvAht2CdfeifkDj27mizqy01qexrhu3vM5BepJMMY4J5CDnN6VLhPzM+8iVCZXC
         gV0QYTz39ZtpfPvAEkCT90U2ECqxf1SOkfcyz2O3scGchqHt2LwaPg4dEWhwyDPMQlcA
         X9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXJNsGKTQ4bPuFyGp1DXIl/g+tIhsSdTMYurwHsRA7sXCC/ZH84s1qNIQiKuDkWrVyRZMIKTiy2a+oYdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKQJ06qQ4QwOhbneG+D7PUA7MSAc9GAlMo0DAJXR0NkNdyD7R+
	18TMH63C7TvPtoLjUEuaKNxT2BjRsiv5iB+I9dS5INkTbhWWpszuAryn4lzTy9/FC/w=
X-Gm-Gg: ASbGnctSidxitaUIKX0YwWSe4h2f0RxqkeT/kn+EF/hzujWQ/KWyif74dIE+fIMJUZ5
	d7fYcD7spD0rTxHtl/kTu3xwtvMZqzGdF9jbxIgiDLZ7WshILPahm3KcX51FUATUOLAwK8GEmq3
	A6cisQww7W/IToBEqKy6h2vg+EgcOIh82brYwp+ly4e+/NX2l1mhd+ZQScpySgrbaaCVqduexMM
	Iu8EVBooXB0pwZNpt9lKpPjAiY7LlszosRgpND8MOSNu+sSKBCedwYikalwEsj72o+R0TU5UHoU
	ZUkWgvj0UtYPb+LjbSWotTM85o4AQQl3WeAUMdJ2N1xk83ybR434YvG8Wn8NTmWw2qpzDTGdtGY
	/WY8OHKnasBWTCAVv5sB/tKUReUE6NZup7AFgXzEsaKaNBxFN+GjZiDzzw0OHTojBMBnAVjW7At
	RMComMD4WexRPX2Wbd6RAikE3Ku7KVgBKmlwyULqDzyw==
X-Google-Smtp-Source: AGHT+IEgACB1Se8zkEhUh/liD5ZfRMe2E7bZVsNaOovjpda2dN5kxeT40rB2jna9QVBQYl1FDLn0SQ==
X-Received: by 2002:a05:6a20:258e:b0:248:f6f1:200a with SMTP id adf61e73a8af0-2844b5ca29cmr7654865637.1.1758267470068;
        Fri, 19 Sep 2025 00:37:50 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:49 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Fri, 19 Sep 2025 15:37:08 +0800
Message-ID: <20250919073714.83063-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003750_988236_BB1286ED 
X-CRM114-Status: UNSURE (   8.44  )
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

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..100fe53fb0731 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -242,6 +242,11 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zalrsc
           description: |
             The standard Zalrsc extension for load-reserved/store-conditional as
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
