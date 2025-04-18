Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13089C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXrxBWINPzSnqPevWRE/gyOmvsajLBT7DPkf00I+TNc=; b=4XIedmEQutlRhE
	qOiGeTrXGa440oLuRAgCsTAPWWXd2/27oOXgB6wOc05OQo1xV8BO5wN2cl+S4AavwsVDyiNk1Uadx
	3tboqtLtQg45TDfrF5Nx25tXy4fkfKuOAOGEHHCxtp4M1SoYDxt3T5mxuBUOJDAp6CSiYQvH968vK
	1L/QuHGxKOB+QLJK7ey6/ukgqNBVxxRukLwPS7DT4VVabMKUjrTPGaiKgXeDczfWp/91U3SxYR3BK
	Ml0V54pcW13oAYDOBQllmFoMv1SrlgNtjhylCq9AnUg+DHJraoEPtCkHEHlhYWS3QKl1AfOwB1vCO
	xvLMyFZqoSlUh1bYEC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN3-0000000F9b2-0z0v;
	Fri, 18 Apr 2025 05:34:37 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN0-0000000F9Y1-3VE6
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2295d78b433so19323745ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954474; x=1745559274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=BJTGwedw9xbp0Kyllj71o1DmKvGMvPQluhgkaO2H/LlgmOWKO92DfIdN74xQBNBuAs
         mJAyrF13m2Sv71XKh2QoFl0RLs/6cMPBZEDKih4M8ql7t8OOFlvcBuMKFefa/1XJA+9j
         4dZyw6F/RYwuS18jBO/toInikXihhi4CcPE9EqAHQlV0RyiXnpTwNrPIUI7S5RoJMiwY
         U2nZuxZU9f/4fgN85q/cUlsNCLK6fpUVSrcRqbNE7JYORijoIX7r9A5E1usMHVs8gmQi
         rUmmdTB1S1lIGf43nMHQHA1+Cp4EP26QOPyx1EignR158Y4gDnB6wzMLFYoEKJ0Ip33p
         RzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954474; x=1745559274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=HK4m4zdZa4J4dSKlt3IZZoZ/z1ufLpCOESgc5v3MdB43ftCJn4wN5y5tv9IK4X+1cn
         9X2tcGBR0TWP1XkWrWJRGRnzDU0SDfINYJJHl5/3q1gtwuNt2b1wOFwKEqZtbe09LIkP
         7YRuAND0Ydkk+RW3VypeiJ8sK0uxfykC4hMssFF9LkxB3BxgND9Pxw6XIL4JAHpLqx8o
         A8bnGaYnnZsMtCeoitRm3RNGb9CNVvH3AMI8W1WH2luVlQWPQ3bq/Z1TrB5CKarBtzwa
         CxO1wVehDySE1oHQt/peSd+9TTlHIjhGXgX6+mZUcRGawBK1JMx42iT5r9fnQ2A4RX1O
         Ld6A==
X-Forwarded-Encrypted: i=1; AJvYcCXHWpdDOepO4enuqYNUR1s4T+cIVbiQU8B8+lt8VtNb8qcG4nTpCwRvoHaBLgFcPq5CknGwFiuKcCveUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz5LhW77cXrZAE5+O3Bzz2JFFkJWKirsmvVQe8cI36JuTnzmZc
	3bIREiz8cm/gdpjiMbf8JxulTac44/nnnuB1weUvJyu4s5KI8W3cqrUAqTpjCh4=
X-Gm-Gg: ASbGnctK3sSW6wbfhRGJA6DGUJQ/IhS/WEMhWfxhdfsGjPbkU9WSOV4Ufa45HI7FGU5
	gZk2RZAATY1NzRV5BxJKlm8zp4QegnB8H8Sc2sBsp+HHUhd9UGyucteGOJiSukEpGNFxb+CDh5Y
	PmuYZL8cmhEzFihr4/MHbWGMaM8EbeXbjDJCX2rXfTRndEbnUbR+3C0wI93bY0CRKEcoCN5U+Gs
	V+g8KGd7r6z48ZmiFvnS1ODo8LQKo4Sbj8/e2cwu7JpFfK23vUHvbZYf4bh5ryDVz+s+w8qP0fH
	DrbuOvITjVXv2ee18CC/jhD/VFogtLlTU+4PdBK3nSufAXHZVcDgI+y2NsniuMkin7alt2pLrsh
	J
X-Google-Smtp-Source: AGHT+IG1ezRHzVyZBpVq3R5kPJr8LKzkRPN7mMERAoel5mgKUSBrWvtrR0Lu6kfGSGmyL5o3WU+iOw==
X-Received: by 2002:a17:902:dac9:b0:224:a74:28c2 with SMTP id d9443c01a7336-22c535aa4femr23189265ad.29.1744954474048;
        Thu, 17 Apr 2025 22:34:34 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:33 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:35 +0800
Message-Id: <20250418053239.4351-9-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223434_879768_52FDFB16 
X-CRM114-Status: UNSURE (   7.35  )
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

Add hwprobe for SiFive "xsfvfnrclipxfqf" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index f25d8cf110d1..b772d4631284 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -2,3 +2,4 @@
 
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 461ce0f305ce..2b9505079a9f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -16,5 +16,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
+		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
 	});
 }
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
