Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E188E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7xfvliYjVrPnGcEukBf0p8D8YBmewGEb4xlel51Oa8=; b=WHqwzNYGDRM382
	C38ofSwmOed2ORDvUrsfyNLwyXhkCdxAxQCZjZ8/V9bLiDsZ1T2EOD3NgoEOvT1BAxLvl7pIkPa0X
	PxmOX2fIOZSVXT0AFvQe/sYN31+XxSyB6FIrsR+dpWdkoVN3siLFAd/pB/UobaUYbhxsZA2+DXsyQ
	bYKqby2uti9eW7dy1DxdlDWNYuP+UNvreTPocj8YBjFX6e/+/WFUtUPXwn/79lerkF9kGnEPcKTAf
	bAwKzKGJhNPhAD+MQBS4Yir1oeC56xJA+W9wzqWEQlesalYgX0BYOxAyKVNVdVhtsBhkEgE6NGn9I
	/+M4i9+8wQbbF2B5Qszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3v8-00000003Zws-1lAc;
	Fri, 13 Dec 2024 11:33:22 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3v5-00000003ZuH-3Glc
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:33:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21675fd60feso18579795ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734089599; x=1734694399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icgAGsVOjevpWNQPqv7Ss8LxbqZxAhRJ45E0lQlPi0I=;
        b=lN/w4EtL6gWKcdIEZZzU8ZVsA2nC3XGJpBAVLT0yOI7KB8NtbEsLRBVuMga+yqgM7E
         OIuDXlidFlO37eh0e8px4xgsZY5wToRn2Pxv/txGuLvvi+OYggfL3gGkvaHOx9px3INw
         vAqMzsG75LGzQF8IbaP56I0RTAkMzHJffTHeNdkZq+forwQUVA+lMccrZVP0A5CB3jRb
         dgx6VbbM5sJoaMiuigMlXSNadZjkgVsfSFNm3KWeEbbksH4p057dZ25ciG9P/Z7SaMTu
         tLyr/3fAsdvdsdM6mEFmOfgGB6/7GdUJsGNcfEK+NgLuPYfPfp3l0sxW7DLgwUE/eUFr
         ilUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089599; x=1734694399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icgAGsVOjevpWNQPqv7Ss8LxbqZxAhRJ45E0lQlPi0I=;
        b=xBviq3NMNNnhs0AxgMCrSxjv6BfHlcx8SzyZlt/Ku2zOMy+iGM3liCvHqpOW+6Bx8w
         3HLOcLKl3qcffFtpLxdr6RrxKrpcC+W55qeMO5Dzklx8/jL6IhaoQse46XJKEXF9VBlG
         UxyPPmx0dPHjv8K5BSw+XdeBf9r5YHGpmqW/HxLodk/0wABsG7syW8oi1qVsxA73ksxP
         8PiFDNlA/Wfba3TDxwYNeRgCjoG04o002hYti44/N1XTayCOBGRWa0hYdTy2IeeTpwWl
         gXZHoA1BhUCeDSBpga+MoXvUt/AD0SC1jzEn78DMJaoh0V5/32ORi2y5WrqsTZ8tUJ3T
         JllQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfD3OQ7U6y/fGiYCbInxBmly4N2ARDDUo+9xnkD6OhZ33D0bZZwsLcCtv7/hCDGlO1iVk3Ml/iYvXLQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn1aC7+x+n06BHsjBuFZ+hyTM+kjx6f/HYXPg3km/hi1mdmlt4
	ib1Ij54KlzlN1pA5BZLecu+UbrQ4FYb6EIPnNY7g8RfHVFURyvLc5cOmUMQpnVw=
X-Gm-Gg: ASbGncu5nBxr9SvDIkJZIG5oI1DNgvKh1mFslgIDo5jjSwLYz4lU1MwByVYQfLwyo/U
	Y/z/6CM2lqDDDuAW8siGMxDVm3uPXw5gLU/Al2w3XdoTalepL1LlXM+4IwY7sPf9pulmskbzhna
	Xlz5WyOVZbTVyjjYR9l2GUo2fOVcbcySGHZ/Ezh490k+ze/DNLcZwKLOCjKGJzfaN2uYV9hp9pn
	KSLJKtIPAe0ILx9Gv0GmJacrv9YYuj83G1K5TPkFivHpzb790TbtBs=
X-Google-Smtp-Source: AGHT+IH2nEHURvGX68aXCJdkw52YFqLvsUkNAPq2G06B97z/rQ/3gyN8DcjgMGnawbesNCdYSpjEag==
X-Received: by 2002:a17:903:944:b0:216:356b:2685 with SMTP id d9443c01a7336-21892997a65mr37133475ad.11.1734089598772;
        Fri, 13 Dec 2024 03:33:18 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm103327125ad.263.2024.12.13.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:33:18 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 13 Dec 2024 19:33:07 +0800
Subject: [PATCH RFC v4 1/3] dt-bindings: riscv: Add Svukte entry
MIME-Version: 1.0
Message-Id: <20241213-dev-maxh-svukte-v4-v4-1-92762c67f743@sifive.com>
References: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
In-Reply-To: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Max Hsu <max.hsu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=xbIhDp8oO/WOy54HbWEh0DC1K4YkZwzlD2oINXShTDI=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnXBt33aT8cTBv8JfrlGJUVUqAqLodDIB5ZxZhE
 4P4NvcJji6JAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZ1wbdwAKCRDSA/2dB3lA
 vQgKC/0X8yRuSVKFECTI3UVo5o8Yu8z7bDY6iBTo9p0YPcST9UEA2hm3B1sYvcLLIPqJfY/FHfm
 fDxqXZbAHlkAc9PlOwh13cx1ruE81roJ/R0HQ+cwtti1f63c9NKk/j6+jUZa2vc3WV58HGhR2ia
 +75mY06ejduOZ5ZIZOzxsQb5zRV6MHMGvYZEE/6jlgImAIKuiPjk+jPlNPRKvQ1hgej0mCWsDeo
 2EBIaKveoleQgmZOH9bTY/AiU6QtofpWkhUCjKyMWVgSpRzvKEAMSS/e4FiVPNRagaEjZMUSKPR
 nNZADAPlSHPkXUqZ8IiCyaTC2CgzPqLG011MoG6NF3foWxxC3uUWITrw4V0wX7LhuGRsN1Da3b4
 7SxHbyHtkMzmlqoVc+QfBpB0T9klnw/P91dVZFAXotI/gM4mQwPk40KLHBvwdJytvabCH1ZWvs7
 5NMae2znE4oN066eZIGKaIZYBHUC9VSkEEpSJM4fGNrnsYrd3sgCSaRHh4t2pUZqwtMA0=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_033319_943353_E627986A 
X-CRM114-Status: UNSURE (   7.75  )
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
index 9c7dd7e75e0ca35f76eb666cdacfc297a7570958..b5d90765a376e065797ffdddf35302ed51ca7df1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -217,6 +217,15 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svukte
+          description:
+            The standard Svukte supervisor-level extension for making user-mode
+            accesses to supervisor memory raise page faults in constant time,
+            mitigating attacks that attempt to discover the supervisor
+            software's address-space layout. Currently under review as Pull
+            Request number 1564 at commit 932cfa4 ("Move senvcfg.UKTE to correct
+            position") of riscv-isa-manual.
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
