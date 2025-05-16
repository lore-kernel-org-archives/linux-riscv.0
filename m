Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA9C2D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXrxBWINPzSnqPevWRE/gyOmvsajLBT7DPkf00I+TNc=; b=TxTvwf3lowIP1b
	NR5qwpyO/TpmqEJ6ToIgg77aV5YcH/kclf0ImHshhj3Qj90NPBkCZr3R08EKMyAenm3dMBS+nWobY
	2p1hpFjot+vjgdCuybbwqGj6pJ5gLitjL9NmZLH32Px8uX0/kQ9p4IWYHfzYdKe+BeDt0INVrfXed
	K7C6obXyNvF4ELNm55PQ3tH1DlnmcvBFWVK1UCiawIW2K4HRrJX2mQq3o+fCkOxZmjTSWQeCW1yG9
	D5F4RObbHb4Bq7lO69+DSnXSurtaHJjRg5CAdDg2TFBuA4m/cJgVAWLUjFcsb+28hSlfLqMuRAvGW
	I/V8y+v9Z875WjaEdFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOd-00000002K7f-2hm6;
	Fri, 16 May 2025 03:06:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOb-00000002K3y-240Z
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:06:03 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-af548cb1f83so1455994a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364760; x=1747969560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=g4GL5c5wMT78eLKhMktxi+wqXecgZh2aZELRwQVkL5UNY6e0dnlpDqEWqDrYkh1RuF
         +PbbCuwjzlzVgfZDHiOEJsnjjhg4cof8Cgk9mrR701mPF29tsHEF9aABj5ekPkYO9kWj
         GI/nNEdYjriUbpsK9MrSHNh7LCFYWC7KOqUULUdiU8nAccyouPA2RI1coLFlOrKzGChQ
         6OvE3PHgkHUHSwMFvE+HIhmTJbcJOxFFBj7HvEItdLCfZU4LZyX6/PJKg+AMLRkBsj1G
         LHRcbNMZ2W1CBC08/67lMCk9qSws5dbIMASf6slSQWnbM8r8dbErGK414ZXinDPZ6jrP
         aN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364760; x=1747969560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=rdpCCp6+5KIVqnnvrbWfh3Gf0KNG0hP3s+QQuvdcPJKbRNEB2CIwvP3wsPrRpxcl4h
         l3cAFkDZ9tu+D/RFZCC0yXIIB31EAZDVFjv4fNC5OpuxDvnddcZ9hDXi4kcpi7YatqR5
         ouq6BJQRLBlAB1TseGsmvrlsxC/OlVAe1PWpoOGFwAx60abk/NZgIawkKjoRDbq7FCjp
         SvKcrbbnR5hsa5Ccf8/CvTzewd5px/JdHIPXItXJ0S+Eq7+dxWnYl9yjecG7nhGVbvfO
         cAerBvyT96fMgeeVznuIJLGBA3UyFasBEWSwpJuox0yAnsn/arNrhS9pDiV9Evj+w/WI
         +fJw==
X-Forwarded-Encrypted: i=1; AJvYcCWyOwOqD5CQ2YtgT+yF0ndTHWZEQuP3jJUnEPiEbLseJOEwvjHXXxEsCzFoM+RlIQPhGsJcp8DDZX9lXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7VcuefYyq2cY4N8+n6L8Nmw55RaID2QMaex8AKl3P/9+V5VRC
	uR2CQ6JRXD3YCRJylOMbAslqu7cLFJiSOyPbet1kcTHvxEs/UM+NVgZFV1KWhMDTra8=
X-Gm-Gg: ASbGnctWy7nZ4eefi13JoU5fqJ9zmeBxBeOkEIPOSluEDULbKhC685usieqOx2cUIcN
	WlcHAhrpSGaf/1L4pNZKfinOdaV3AQpx7Mo4YUMww+V3kM8U9f/NdAN241MaSEHjiv117kuNaxj
	lFLTd+ZfQoD8EZGto0Nt2V3EFmNYqt4JaS02aAzStWZcQ3X8ClLxP9NTI5yKixUFkFHV6QNP1Ke
	9c4CAMOh3N/aXT1QAaXdXIJq8hHvjKspVewh3kmjAzlLEH6oipZ3DsPRzKreCFza7XmZXrHHE2V
	rv6UKKSr0aesHXKDaJS0voPYpA3FMBoN62OYVH4shXC2oD+4TyxgZnfyRdykaf9LsPudhLk1OVn
	3oW4reqqf4wtYk+hrrZzMlg==
X-Google-Smtp-Source: AGHT+IGHOS+9p/lRlrvuxjoBtFxHTXOF9CcsyvcnXM3ZuSvglZ87knFmunIlRLlJfsORHSmTFtTD4g==
X-Received: by 2002:a17:902:fc46:b0:223:5379:5e4e with SMTP id d9443c01a7336-231de351434mr13109245ad.10.1747364760422;
        Thu, 15 May 2025 20:06:00 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:59 -0700 (PDT)
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
Subject: [PATCH v2 08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:06 +0800
Message-Id: <20250516030310.16950-9-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200601_543169_5472E80F 
X-CRM114-Status: UNSURE (   7.86  )
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
