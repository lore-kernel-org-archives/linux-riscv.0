Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF7C41535
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3XR9/eQSHs//7Z8fbgvG+Njkdm3xynLoQvkgWayKoyA=; b=KputTNB9CkDXPy
	TDFP+O1jD68HC7C3RP4Y/QSDUvg2jzkl8ZnFGYxr/JD7sCATxrKJGsHUvqJGpZmtzYEnRhE+oOfLK
	995N2g4djBgNUQWs3y7cmkDcQ3PNMPIdkT9UPWjszCt1SIPimfhAkpRhRhKnVMuoOUawsZT5GPjOZ
	+IWn1W0DKDAbTc7Axalvjb/J/FKi5PSKjHtqacZVMiqPGVG4PBSj58G0zaTnl/4iL69bhtiuiMoEG
	DVWhxmrmLF8ghlX5A7e7H+XGxr0D9tEgihDxGHLAmg+ezcWP3qKoG0rxLUhdICUwMONGvN1udMuVy
	HKSu3KmEmLojUYQr57Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUT-00ET9P-2h;
	Wed, 13 Dec 2023 11:33:25 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUO-00ET0z-2l
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:22 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9f575d4b2so16197951fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467192; x=1703071992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Atjvu7OpzxGHnkPKQqqXLCnjWBuSkCnCszNZgaSB4s=;
        b=rgQ+7QtNFE9WpWNyTwY/Swuy6R6hzqvHxizkrk7RgS1LMpGj2t2j7wP1YQZ7pidgms
         fBaCIA8EwxUhsof+N0h2CDNlbetDCfmjUucrWnOcDWaoGsY0yIvQIkkvo3FztrOD7CJS
         PQOCJ8NvaTRUQKG2BSXtxbGCv5CK6IKmNMo84OwABnOhgsLfGw4HGUb4a060hkhdBPqG
         HDrz2WoPL4WLT1i0TOFlLPXv+G/rNncF3Zsupt4BG73aQ/fZ3C8lTuPOqZohgLI0H9+O
         DyLL2+osFuNXtfhuY25ESeeadS64Hip7vfeeHxA+LEpxpTqL5irhvtIzoWVHeeJIs0/A
         pT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467192; x=1703071992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Atjvu7OpzxGHnkPKQqqXLCnjWBuSkCnCszNZgaSB4s=;
        b=aZ5XDrXk850CYI8Ty71Wg8HGwymciDuagIb/U/BjeiMFJHKnvsiz2YWv+gY0WHVnhN
         SVsQjdqYyEJaE6uq1nn8fQjtmhX9NBWZvyVoMZXi6lWd9UyPTvDyHRCzeQM28YgZXBdl
         EaGJmLmwkJKsSrBVEn7v+YkYLBSvOAKemyvoYoux1//RrOQAtMUi1ymwsKyOTSiM0mvu
         vCb6ZXtZpAMZ9fDjPFoLOibobfz+eHkvQ7uX63uvZleTDii5KvFj56ZX3lsseOt16e3D
         xx3ntxp2NgQ9QmC1+T8827S3jCs6OCUXDkZAeoUBaS01HB/xXkxI0znU0kQj4oSBi/yS
         kWKg==
X-Gm-Message-State: AOJu0Yw80UHA0Q9iUKbsypoWyVaLuiuDnLpjw8xPuBGHfNxwyFRdwZPm
	nZwXWE8PtZ0CsND0yoktxEl5lQ==
X-Google-Smtp-Source: AGHT+IF28n7Q47rA9vhQP7ckQSu28DeDIVuzSbICtoXTbPIgLDR3icG5MBbRpeB8E8SvlKm6RVJPvA==
X-Received: by 2002:a05:651c:211e:b0:2c9:e7cb:fe8e with SMTP id a30-20020a05651c211e00b002c9e7cbfe8emr8509940ljq.2.1702467191993;
        Wed, 13 Dec 2023 03:33:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 0/9] riscv: hwprobe: add Zicond, Zam, Zacas and Ztso support
Date: Wed, 13 Dec 2023 12:32:56 +0100
Message-ID: <20231213113308.133176-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033320_918739_AAF826C3 
X-CRM114-Status: UNSURE (   7.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIGEgZmV3IG1vcmUgZXh0ZW5zaW9ucyB0aGF0IGFy
ZSBwcmVzZW50IGluCnRoZSBSVkEyMlU2NC9SVkEyM1U2NCAoZWl0aGVyIG1hbmRhdG9yeSBvciBv
cHRpb25hbCkgYW5kIHRoYXQgYXJlIHVzZWZ1bApmb3IgdXNlcnNwYWNlOgotIFppY29uZAotIFph
bQotIFphY2FzCi0gWnRzbwoKU2VyaWVzIGN1cnJlbnRseSBiYXNlZCBvbiByaXNjdi9mb3ItbmV4
dC4KCkNsw6ltZW50IEzDqWdlciAoOSk6CiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNp
bmcgZm9yIFp0c28KICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFp0c28gSVNBIGV4dGVuc2lvbgog
IGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFphbSBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAg
cmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFphbQogIHJpc2N2OiBod3Byb2Jl
OiBleHBvcnQgWmFtIElTQSBleHRlbnNpb24KICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBaYWNh
cyBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBh
cnNpbmcgZm9yIFphY2FzCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaYWNhcyBJU0EgZXh0ZW5z
aW9uCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaaWNvbmQgZXh0ZW5zaW9uCgogRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysr
KysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAgIHwg
MTEgKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAg
ICAgICAgICB8ICAzICsrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAg
ICAgICAgICAgIHwgIDQgKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAg
ICAgICAgICAgICAgIHwgIDMgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAg
ICAgICAgICAgICAgICAgfCAgNCArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KykKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
