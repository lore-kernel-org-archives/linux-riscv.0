Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C656CDB484
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Ux6AzETDtCY/IHK7mUMb9hFgRbjo5cLsJbOnUfVw6I=; b=lLlkFTYy7nJh6M
	rbxKGazRpWUfXhhws+oSpk1blqTiStFduSnZ0tUzwdsHLONaR8BkuuCHvKeFDd3S2iW34vBTSIoDc
	HmBqniKWLkmtGaFMewT/+X4qCXKJNoh/v1g+YayhcZcLKR2fkwk/yvANhVO8ZLu0mSKsgNQ4Qb+NQ
	DV7vLEJt7sN8AFZezbFjF26zRUtx4ZjD1CczvFahyyt2yjfQb6/GikXVzRxem1cf5c19mkcPGl+Uz
	VAFYqmw6Ax0duajcv0M8yNCPOzc/mYUZjsxUF7fx+9RzRpIBLSwnfZFlFp7Q9fuwZwgjesLtFUVGP
	JG0e1qNklmiBBetdwW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvD-00CNBl-37;
	Tue, 17 Oct 2023 13:15:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv6-00CN3F-32
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so18306135e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548534; x=1698153334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR5zOKPIIXQcPWK7Zwi8IMehempNxAt19rgFARaEstc=;
        b=etbASJqdt51X14aXTWGgUCy7Et9WmpNHCb0Sb/1GjkLlz7D7LOxwYNA/jN59RiyHO3
         pwAzq/EpyEqcCths8zkOEhLHAApTMoDuThh0o5IBODTP76Q8PGSIXwmdkiqSLqgyUuLq
         abt02sUvvUlYdVWwkaAtiPJLkxP+WXDZTjMC7+Uf4S3sQ91e+fEANS0V5ZT+xtVxtGsJ
         juCKcaad/1Xrt+uP1HvuF++B23R4enhbNny9CaBcd6NAHF0irSasxTlkjKGuUHQrXFkv
         G2tuTVKyNUh8cYEQHDqr+fSYKFkXvrqgbaWGOV8PCD5YCW5Tf8chz649sWunvntVd3B3
         ZrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548534; x=1698153334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR5zOKPIIXQcPWK7Zwi8IMehempNxAt19rgFARaEstc=;
        b=E9d+AY/KkD94f9mrV7JYZkaZrM+y4/YjKBScsbYAcxMVO2pWe5AJxwClf1n+qKvGGn
         EjCYv6lD1fWbqFvYUzBlghbUIPOB9u8kUiVHapTPsrHjXxtq7Aouweeim6JpSevm98vs
         1T6ZL0FamIcHfz1cEZkCcqJkwy3dftAF0vIxWsDvAKg0r+Qzy2PiUMTq8mZQY4DrVFVP
         ieopLiudQOgsXee1Xt4Ech7z7pzX/5HOLQFQQWpWj8/eedDdzd4kSI7K7fwyYU7OiaHL
         lD8jvYBD+ZP0GP1/thUrtT010sKWF1g1bv6eOdsx8BVwK79MowN1L0/5QD8LT4NG55Pa
         noVA==
X-Gm-Message-State: AOJu0Yy01+/yi682gJjwchOpqv9YCDE8a/xXm31MCVcWG2SXRHKOj2NI
	VGt6yJydtT/SEMFvkLzE+OKoU1i+DyAxBaKCm4D/pg==
X-Google-Smtp-Source: AGHT+IGuYusZwm6bjTLUUAItFdrqDbC+bP3ybiFs6S3KZJ9w+kFoW0BT9EJNwe19ok8MCE/47d64Qg==
X-Received: by 2002:a05:600c:2145:b0:406:513d:738f with SMTP id v5-20020a05600c214500b00406513d738fmr1640332wml.2.1697548534165;
        Tue, 17 Oct 2023 06:15:34 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:33 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 08/19] riscv: add ISA extension parsing for Zfh/Zfhmin
Date: Tue, 17 Oct 2023 15:14:45 +0200
Message-ID: <20231017131456.2053396-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061537_023888_C39B8F75 
X-CRM114-Status: GOOD (  10.65  )
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

QWRkIHBhcnNpbmcgZm9yIFp2ZmgvWmZobWluIElTQSBleHRlbnNpb25zWzFdLgoKTGluazogaHR0
cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xejN0UVFMbTVBTHNBRDc3UE0wbDBDSG5hcHhX
Q2VWelAvdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDQgKysrLQog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXgg
YTJmYWMyM2IwY2MwLi5iZWFkMDVjYjBkZjIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTc5
LDggKzc5LDEwIEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0VECQk2MQogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWS1NICQk2MgogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1QJCTYzCisj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZICQk2NAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGSE1J
TgkJNjUKIAotI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJNjQKKyNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9NQVgJCTEyOAogCiAjaWZkZWYgQ09ORklHX1JJU0NWX01fTU9ERQogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1N4QUlBCQlSSVNDVl9JU0FfRVhUX1NNQUlBCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
aW5kZXggOGNmMGI4YjQ0MmFlLi42ODkxNGI1ZTJkZjkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
QEAgLTI0NCw2ICsyNDQsOCBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2
X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWZlbmNlaSwgUklTQ1ZfSVNB
X0VYVF9aSUZFTkNFSSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NW
X0lTQV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaHBtLCBSSVND
Vl9JU0FfRVhUX1pJSFBNKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmgsIFJJU0NWX0lTQV9F
WFRfWkZIKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWkZI
TUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmEsIFJJU0NWX0lTQV9FWFRfWkJBKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6YmMsIFJJU0NWX0lTQV9FWFRfWkJDKSwKLS0gCjIuNDIuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
