Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ej/vxGemdIcymuN3XgyZ2zcz/iyazJDhq8DFHqxf/oQ=; b=izdviiBPbKP6QG
	4nd0w/kSpFvDt6/OWIttzqPGeIwvL004yo+mRhN/zLvG59Tlx/ndDKIWVTrSKjq+R4rWXl+6G/NuS
	Qb5UjnKYFbfoAbKVWPoPRisWLD9ICT9hvin1mECE+EjRqsE/9B803W3V34gzOcRPx6sew6gbghecQ
	Ck8iCd6Jt9zfYrXWBwzT6/Z+EIl3sUY1jx3nJzTLkRbNZj25cNMC9HSJqfp6EEGYiBfNuNwbmyJ4v
	988+NRmNv1qYGDF0ieuWZQgyVsOIBrGlypFMi68d1Nk16s9RKnw/JslNcWHS661agxgXEMwo9NGMG
	A3p/dstnKj6l5Au21fFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxH-000KP0-28;
	Wed, 20 Dec 2023 15:57:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxA-000KJf-0X
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3364bfc850fso315484f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087864; x=1703692664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZT3AkmSaqumQ97ecuZBaz7B+rLb1J+xdw7pERlw1ck=;
        b=W8t1Ns/BEQt6wxxRPVmmGvMNsecCtoRp6YrSNhHGqhFHp9OYl/CxJyNu1KnCIkiWDt
         pf5Bxig4wB1IP/biBfwqGAN9CMDHN/z9Vm2jdERoMSXLCgTVXI3g5dIuVjhpedTIYkAa
         2YyJz/R+VxTrDGQSX9oRgmgVymkxSMGmsGKTWl+E0JaZ0aPV3gwk457isYSUHiS5dGUw
         Sa2Ou9Sq4HZ9Q3KQa7zu501Wp2V24HaaJ+La2Gt/C58XpQ3ceyWVoj7TByp+O7PImCkZ
         JXw4iFtKgIrEDfPzNXdgUwpuOLVtuoUiJ40+Ffr4S/1b1tDsMKsq64H724XDR+ond+Dw
         5aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087864; x=1703692664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZT3AkmSaqumQ97ecuZBaz7B+rLb1J+xdw7pERlw1ck=;
        b=qp1a3ncJsvl7FE5Oj/wqrwtTfGFT8y5Lfn8y12/YTAYWGz780kvF8PgYN7DZfuIlZo
         NCDr0i9UZs7JnCc7iAO6OFualL+v+HYKoDI1ZRuLxKqcEo/72uQq6oKEmx6G5mYO8nTP
         rU1px6BHCGYQRTVLmx2iZAjY5vAD/ngfUF/ahnbadtjbJ25Qq2HppK1Pd768uwa+oKZ6
         cn1BtRwYwYg66Z0PMecrbLjBsLd2t6S7TjaH6N+PsvifkNmkcgxbkvN0bqUSCjAt66Vf
         LrNjY1wo8Y1MPbgeGcvj7k8ZjIQXLEJkPulHG+cqvIqTpL2TRYwsT27ofO7i9Yf2jUkL
         1SBA==
X-Gm-Message-State: AOJu0YxRb8WB0CGEpH3+/U+LXGFR/gUmgZcTak+NnbgwhBBBCYGFOLQr
	SBNp+a0ifLQECkTRSSLRgF56VQ==
X-Google-Smtp-Source: AGHT+IEAqrHN3Za66t0NZjui8EhChki4mQcTMIh6RZgm58ClLt3lfkny0M8iVRzoKzGcB9ZORNH4uw==
X-Received: by 2002:a05:6000:18c9:b0:336:5c96:a3c7 with SMTP id w9-20020a05600018c900b003365c96a3c7mr7715482wrq.0.1703087864600;
        Wed, 20 Dec 2023 07:57:44 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:43 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 4/6] riscv: add ISA extension parsing for Zacas
Date: Wed, 20 Dec 2023 16:57:20 +0100
Message-ID: <20231220155723.684081-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075748_204996_9BB0BED7 
X-CRM114-Status: UNSURE (   9.25  )
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

QWRkIHBhcnNpbmcgZm9yIFphY2FzIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIHJl
Y2VudGx5IGluIHRoZQpyaXNjdi16YWNhcyBtYW51YWwuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4
IDNiMzFlZmUyZjcxNi4uMzRmODY0MjRkNzQzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04
NSw2ICs4NSw3IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGSE1JTgkJNzAKICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aRkEJCTcxCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNBUwkJNzMKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX01B
WAkJMTI4CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfSU5WQUxJRAkJVTMyX01BWApkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCmluZGV4IDNlYjQ4YTBlZWNiMy4uOWE5ZDkxNWI1YmIyIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCkBAIC0yNTksNiArMjU5LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRf
ZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50bnRs
LCBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50
cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHppaHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YWNh
cywgUklTQ1ZfSVNBX0VYVF9aQUNBUyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZhLCBSSVND
Vl9JU0FfRVhUX1pGQSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZoLCBSSVNDVl9JU0FfRVhU
X1pGSCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZobWluLCBSSVNDVl9JU0FfRVhUX1pGSE1J
TiksCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
