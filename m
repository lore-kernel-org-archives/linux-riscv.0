Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB28E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zTAw1smFzrydikZ+y39MT7MZcpidM2nnRic/AqJRTGI=; b=HgOGXuI6PtiLf1
	m65+WcfYdmiXkyJxzn39dVXDfGEgTwxV+pWx/LHYwy6hVHFPdXMovR7y12l3U/kR9Hcgrs9z0LsWl
	X09hkrvKZyVzRB0fRrJ2ZjRmUStjaGxv5emhaLIb1Y/Ihkdr2dB2O0yLzXRdV9SknOtbYPQeL+E1n
	wSrdMw1XG41zAivo6+J6995d7wkdROaAeebVwl1L7mdBiudzpnTNa/3DEKYI6c6f+ARQCOWE+Vl6y
	5aAyQsNSxVuJIuY65v3iiWgYoJ9PehHZruXN5I+EI9PmoQzRIaLbaA+HxUAgC8qQZNjhpXhgnf7BQ
	UoUtP8gWB0+D8+OXMzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiVP-0000000D5IK-0nqr;
	Fri, 03 Jan 2025 14:18:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiVM-0000000D5Hp-3BYN
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 14:18:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385eed29d17so5880583f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 06:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735913902; x=1736518702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBy9PE8TWuZDv2fRcvS0TjEzuOQDtwvmfnwH0FPbUik=;
        b=uC91AHRrG4jR/BwBDqRWlVrj/nwKSKLDOwpdB632dmfO1YlkjwWRbqRw3fhURGCX3V
         7QwftxkHXGDZH2miAsUo24JlBJ9dOOTZWXXeYKUYlOm8ck74zXmajSqgCES1xmCabzqb
         QA4LqyDGwIc60Kfh2TX450iRZZz74NxHkFWKcGRkBDJFlA7ZTR2Q6QRPs0h08N9O56Fs
         IABpD0tDd3dLm5UjCdkPHS4/iEAD6xaDwLJgtOZyKsNVamnSN+pG0RFQKI8+Tj1cZlgA
         xuom66/GBrBskTHw4yFW0eTV0oDRcAclJEXzl2OTyJk4XyltObAiChZJ4vIyP8pQo+kk
         Bg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913902; x=1736518702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBy9PE8TWuZDv2fRcvS0TjEzuOQDtwvmfnwH0FPbUik=;
        b=jSp33WsgnogqbH3RUSYStMTdPtSFBJVpGPpV7tUzKq3QE5Bs3Mi3xXc4Pf64cgKyer
         2DsPWACgjaAs+q1wFUJ7Ics24lpiHpqBmKizI4hQfG8rS4iXdNAlAwwCkDd6wtADkZD9
         0hpeofXAkjjOTLo84dCj5So97Ig3E4mIRwYqa9iOXGKZjw9BqNUEXfylxrDZOtkAeVSo
         3jNtmB3U91hf0F+K2qyPTouphOpJSwssqEzURRViy/PrqhxLZ4t8RrtdmihjlNIQrDry
         CIDW0DSuNbuHdo71jRMlwkJQ/U1AyO0GXmdl6PtqvM0f+fgT2jJzrK2fAutnpbJ0/X7O
         Dzsg==
X-Forwarded-Encrypted: i=1; AJvYcCX2hvy8Pr+8XEOLzt+8xz0sI3NEMuDZx6ipkNQgpi1SVn5fKL53N2fV4nDsjn2g0DHYXO/3cdV9GWeYFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEtMT1y0QDFEmCVcJO9PO3hJgi2lJuVhWAWE1CamjH1r3k7f5r
	6xgN5Tc0cSVc0dH0QPTxbM6n1/mipJOYLT/FgxqXg+X0oEHdp8IttAT3pr5boB8=
X-Gm-Gg: ASbGnculE1/7Sxp4YdgPNOu2qT30tUkWXDmbCDqvO7yyYLkfmE3qJURneUNBv/b0Vgm
	2DMFCkLPydS62ByTAExfkLWqdFMWDoz8tWUCnibk+XbeemLp3jQenJSOfVH9gRSkd3O2a499PBr
	Tpj5JHTfRyHjp00kPCdxO51TkxL1LamQKJ1WvffWJIqatcXPzvWrytdVvCNmACRtyklnQ2GfxDb
	RIu2VN0hSHpVrp+3nWjZwkQCApyDIlK/IoylJC6VkTAztItSkyGKO/Cgw==
X-Google-Smtp-Source: AGHT+IEun2+E1U+TFbIHehM21Z0MjItj4zYwFpux1RYNvw5R3ZYIGoDopmCYq7/CItWQSTlaIPV1Bg==
X-Received: by 2002:a5d:47c8:0:b0:385:f470:c2e1 with SMTP id ffacd0b85a97d-38a221e2f49mr41252194f8f.2.1735913902182;
        Fri, 03 Jan 2025 06:18:22 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acafesm40675693f8f.98.2025.01.03.06.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:18:21 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: use local label names instead of global ones in assembly
Date: Fri,  3 Jan 2025 15:17:58 +0100
Message-ID: <20250103141814.508865-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_061825_064617_8E76A659 
X-CRM114-Status: UNSURE (   9.70  )
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

TG9jYWwgbGFiZWxzIHNob3VsZCBiZSBwcmVmaXggYnkgJy5MJyBvciB0aGV5J2xsIGJlIGV4cG9y
dGVkIGluIHRoZQpzeW1ib2wgdGFibGUuIEFkZGl0aW9uYWxseSwgdGhpcyBtZXNzZXMgdXAgdGhl
IGJhY2t0cmFjZSBieSBkaXNwbGF5aW5nCmFuIGluY29ycmVjdCBzeW1ib2w6CgogIC4uLgogIFsg
ICAxMi43NTE4MTBdIFs8ZmZmZmZmZmY4MDQ0MTYyOD5dIF9jb3B5X2Zyb21fdXNlcisweDI4LzB4
YzIKICBbICAgMTIuNzUyMDM1XSBbPGZmZmZmZmZmODAwMTUyY2E+XSBoYW5kbGVfbWlzYWxpZ25l
ZF9sb2FkKzB4MWNhLzB4MmZjCiAgWyAgIDEyLjc1MjMxMF0gWzxmZmZmZmZmZjgwYTAzM2U4Pl0g
ZG9fdHJhcF9sb2FkX21pc2FsaWduZWQrMHgyNC8weGVlCiAgWyAgIDEyLjc1MjU5Nl0gWzxmZmZm
ZmZmZjgwYTBkY2FlPl0gX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMCsweGMyLzB4Y2UK
CkFmdGVyOgogIC4uLgogIFsgICAxMC4yNDM5MTZdIFs8ZmZmZmZmZmY4MDQ0MTVlND5dIF9jb3B5
X2Zyb21fdXNlcisweDI4LzB4YzIKICBbICAgMTAuMjQ0MDI2XSBbPGZmZmZmZmZmODAwMTUyY2E+
XSBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKzB4MWNhLzB4MmZjCiAgWyAgIDEwLjI0NDE1MF0gWzxm
ZmZmZmZmZjgwYTAzM2EwPl0gZG9fdHJhcF9sb2FkX21pc2FsaWduZWQrMHgyNC8weGVlCiAgWyAg
IDEwLjI0NDI2OF0gWzxmZmZmZmZmZjgwYTBkYzY2Pl0gaGFuZGxlX2V4Y2VwdGlvbisweDE0Ni8w
eDE1MgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgoKLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIHwgMjAgKysrKysrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUwppbmRleCBjMjAwZDMyOWQ0YmQuLjIxNjU4MTgzNWViMCAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCkBA
IC0yMywyMSArMjMsMjEgQEAKIAlSRUdfUyAJYTAsIFRBU0tfVElfQTAodHApCiAJY3NyciAJYTAs
IENTUl9DQVVTRQogCS8qIEV4Y2x1ZGUgSVJRcyAqLwotCWJsdCAgCWEwLCB6ZXJvLCBfbmV3X3Zt
YWxsb2NfcmVzdG9yZV9jb250ZXh0X2EwCisJYmx0ICAJYTAsIHplcm8sIC5MbmV3X3ZtYWxsb2Nf
cmVzdG9yZV9jb250ZXh0X2EwCiAKIAlSRUdfUyAJYTEsIFRBU0tfVElfQTEodHApCiAJLyogT25s
eSBjaGVjayBuZXdfdm1hbGxvYyBpZiB3ZSBhcmUgaW4gcGFnZS9wcm90ZWN0aW9uIGZhdWx0ICov
CiAJbGkgICAJYTEsIEVYQ19MT0FEX1BBR0VfRkFVTFQKLQliZXEgIAlhMCwgYTEsIF9uZXdfdm1h
bGxvY19rZXJuZWxfYWRkcmVzcworCWJlcSAgCWEwLCBhMSwgLkxuZXdfdm1hbGxvY19rZXJuZWxf
YWRkcmVzcwogCWxpICAgCWExLCBFWENfU1RPUkVfUEFHRV9GQVVMVAotCWJlcSAgCWEwLCBhMSwg
X25ld192bWFsbG9jX2tlcm5lbF9hZGRyZXNzCisJYmVxICAJYTAsIGExLCAuTG5ld192bWFsbG9j
X2tlcm5lbF9hZGRyZXNzCiAJbGkgICAJYTEsIEVYQ19JTlNUX1BBR0VfRkFVTFQKLQlibmUgIAlh
MCwgYTEsIF9uZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTEKKwlibmUgIAlhMCwgYTEsIC5M
bmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCiAKLV9uZXdfdm1hbGxvY19rZXJuZWxfYWRk
cmVzczoKKy5MbmV3X3ZtYWxsb2Nfa2VybmVsX2FkZHJlc3M6CiAJLyogSXMgaXQgYSBrZXJuZWwg
YWRkcmVzcz8gKi8KIAljc3JyIAlhMCwgQ1NSX1RWQUwKLQliZ2UgCWEwLCB6ZXJvLCBfbmV3X3Zt
YWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCisJYmdlIAlhMCwgemVybywgLkxuZXdfdm1hbGxvY19y
ZXN0b3JlX2NvbnRleHRfYTEKIAogCS8qIENoZWNrIGlmIGEgbmV3IHZtYWxsb2MgbWFwcGluZyBh
cHBlYXJlZCB0aGF0IGNvdWxkIGV4cGxhaW4gdGhlIHRyYXAgKi8KIAlSRUdfUwlhMiwgVEFTS19U
SV9BMih0cCkKQEAgLTY5LDcgKzY5LDcgQEAgX25ld192bWFsbG9jX2tlcm5lbF9hZGRyZXNzOgog
CS8qIENoZWNrIHRoZSB2YWx1ZSBvZiBuZXdfdm1hbGxvYyBmb3IgdGhpcyBjcHUgKi8KIAlSRUdf
TAlhMiwgMChhMCkKIAlhbmQJYTIsIGEyLCBhMQotCWJlcQlhMiwgemVybywgX25ld192bWFsbG9j
X3Jlc3RvcmVfY29udGV4dAorCWJlcQlhMiwgemVybywgLkxuZXdfdm1hbGxvY19yZXN0b3JlX2Nv
bnRleHQKIAogCS8qIEF0b21pY2FsbHkgcmVzZXQgdGhlIGN1cnJlbnQgY3B1IGJpdCBpbiBuZXdf
dm1hbGxvYyAqLwogCWFtb3hvci5kCWEwLCBhMSwgKGEwKQpAQCAtODMsMTEgKzgzLDExIEBAIF9u
ZXdfdm1hbGxvY19rZXJuZWxfYWRkcmVzczoKIAljc3J3CUNTUl9TQ1JBVENILCB4MAogCXNyZXQK
IAotX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dDoKKy5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9j
b250ZXh0OgogCVJFR19MIAlhMiwgVEFTS19USV9BMih0cCkKLV9uZXdfdm1hbGxvY19yZXN0b3Jl
X2NvbnRleHRfYTE6CisuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMToKIAlSRUdfTCAJ
YTEsIFRBU0tfVElfQTEodHApCi1fbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2EwOgorLkxu
ZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTA6CiAJUkVHX0wJYTAsIFRBU0tfVElfQTAodHAp
CiAuZW5kbQogCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
