Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8873D6395B
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNeI6BnZE0wU8cZV30S+wGxjsnqdmdiOYDgzhSnmJTY=; b=D9rmMWCvfy8hL+
	QYfOVObt84h4HXPtCXGjrLARfKn7FcQGMxVKQDB6cf6LxRNCFYV4ZDztWbxHYiss6+WUtF+zoNLl+
	fAFY8UnQxL26wima6on/mNk3kO+7LVA4qH71z2P3m2L1w1U82KUD5lPv/pa6V9PUr7IXvm5iMyy2n
	Ghlc+X+U6cmlrKqxzWYtc/OwOU3guQ+jTv0a3jvH8xYSr5W6Tw/s1eRq8FloKQEK7fg3gM/1OpUXG
	GM21rln5LjsO/yfPUEqLfjBg/CBFu08DcmZE//tQYEBqkNUvVVckr1Vf3WIrWiCIls8HGa4KlSHFs
	RN7HTUIiEzDUb8htaM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlVo-0000000FW3N-367v;
	Wed, 20 Nov 2024 14:16:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlP1-0000000FUq9-07OX
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 14:09:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cbcd71012so49165845ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 06:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732111794; x=1732716594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzaCab4EHiwWgil1/Ov6nfcjuRXdoG8N44OR/d6zxqU=;
        b=Dk4cvZk4sSEEf7dpxA21tt6a+KCMClzykbWnqTEwIh+dd0/SAsMqgjf98YEV3KMjGM
         sdAcTRrteP6/uGB7dXTV8X2USzzYOGI5a5lbRw4DSfltXn32ueZhdANK7U2HF1b/sTrw
         znZvqATzZbUicH8zsu5YUbAzrAagsQfsrv2o016fdXn5Tq1eeW5SPfWXEbgItc6CrAde
         lLoPdc7e+/kA5l4mmYqgMo+FebG7LobuJbznfsuQWEuF1AOFeltOd/Fe8VVn+RfjZ8fU
         imQmbiLWtMWC+l39u57n6bYUT7C1MDmCMYwauY16AW2L4SON9sl91a663OJgrH8X1kjF
         ppqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111794; x=1732716594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzaCab4EHiwWgil1/Ov6nfcjuRXdoG8N44OR/d6zxqU=;
        b=HeudRgFwnkVqO6dZOPXaawOBfidf4RPgnFq2zlVJkTTO/m27KhtbJZ1lvmDtcLrRod
         u+nPrJxwBa0heEXFfm0JKEETRAFotpizmFgtju75rPyRqRjEH8Xu9p88fuz+vHskI0O4
         PgbgCQ4W4t2ekxbepsiCV0Y0oeNdpwUmDqe6pzvSJcj5fHk9J8PwCTe3BjY5f+lU1FtS
         2Heo36ZE7bRmV9wMvWB7nlM80g1yUzETRNeEi2KlV5nU0q7goWNU9g98v2c40z9xJpnN
         piwvQgg4h4Ke515rT1WUSZ89IjQEERnkVATuUFN09qd6PRPtq9zQSGorHRi6ViUtWRmK
         upxg==
X-Forwarded-Encrypted: i=1; AJvYcCXECwGA0msK6cnsoiYP1fDeMABwJAKPqcPHs/9BQa8FVHa1zGUuu2yWkMZ/2UNrAlp45OCsFJ7h3684Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0TWu1ibsAJBoJQnjqJf/60vfLNGCqzkMnvbKErY7xGsX9SSDl
	lpQiyWsRbWMHoQVA1BosgodqF+iHg4uSlSIldPtgN6mhTvHBcRI+Aj0VLcMgYCJfAR6MKMTZYEo
	9LhAnRw==
X-Google-Smtp-Source: AGHT+IFOL5TGyzlW376Xm8KJIH1icYR3lg7mocMWM7r0WKrZePcwEdBegYT8u0kbgOQDNjc9If25Dg==
X-Received: by 2002:a17:902:f688:b0:20c:a692:cf1e with SMTP id d9443c01a7336-2126ff7e7c6mr19809445ad.43.1732111793787;
        Wed, 20 Nov 2024 06:09:53 -0800 (PST)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f474fcsm92502505ad.213.2024.11.20.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:09:53 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 22:09:34 +0800
Subject: [PATCH RFC v3 3/3] riscv: KVM: Add Svukte extension support for
 Guest/VM
MIME-Version: 1.0
Message-Id: <20241120-dev-maxh-svukte-v3-v3-3-1e533d41ae15@sifive.com>
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
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=CJT0iMPgfMMKY590TyF/jv0a/eQmMMiUwvdaVlMZsfs=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnPe2kadvH5t/olEh4nZ968ktrx/equF2lYqvX8
 y0+ccmYkHyJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZz3tpAAKCRDSA/2dB3lA
 vQSQDACIUsjg3BUBC94txWJFJnsW+HdGsZK9TdrvP+9cahCFdSbYefBFYDX+F6qrGFGZ4xd1dZI
 FgYxgtdj1e571lb++BZPkfR4WVNcV3JrX5/B0UmnEXolTaLvraICuVl5r1gPmRDUbTKGlPGka/a
 hHMAQocMymw6cUu6/MM2ZTscgvJSzCEYgcdwJ9YPXvEKKsmaepFSBoZjfsL5SuJG/Ja3pyTgvCF
 X1/njUvmXBN5+VLfqj91GeLNPV5tCcYxZe1oLWqljxohLeXrEdmTy+4+1i6g4AsQi7vIsQs3Wzk
 cOy+tDP1uTNQrUQ6HVD8QT12FAUuH27qlxxJoSVy1YNWvDknVuM94hkLv7Y6O/eSNGNJGnlV1Kj
 I2IDHywxZohyBH7rV5Ny2An8bjvPfJHS1wf2r3G/gt6vNXu4qNDclE+TGyuawb4KxLkLtFx6RON
 DwJgbyToqac448RyXhmMEWoDDOMcfwnlsB7aqqbAFcN3VfhT4WQG7OlCWDJmnpSKyFbhw=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060955_076443_7B946DE1 
X-CRM114-Status: UNSURE (   8.51  )
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

Add KVM_RISCV_ISA_EXT_SVUKTE for VMM to detect the enablement
or disablement the Svukte extension for Guest/VM

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 4f24201376b17215315cf1fb8888d0a562dc76ac..158f9253658c4c28a533b2bda179fb48bf41e1fc 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -177,6 +177,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZAWRS,
 	KVM_RISCV_ISA_EXT_SMNPM,
 	KVM_RISCV_ISA_EXT_SSNPM,
+	KVM_RISCV_ISA_EXT_SVUKTE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 5b68490ad9b75fef6a18289d8c5cf9291594e01e..4c3a77cdeed0956e21e53d1ab4e948a170ac5c5c 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -43,6 +43,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(SVUKTE),
 	KVM_ISA_EXT_ARR(ZACAS),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
