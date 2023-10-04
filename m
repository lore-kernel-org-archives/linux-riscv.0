Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961CFE7C4C5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wgoc9fie5VJoHwomb98vNGoVFAsIO4L0+zfPa5fl9vw=; b=jpo6AxOIaAB2VG
	AsPNayDGhBHseSn810OuUvGe9vNugmrMkVqIQt6fss4tO7wWyzaledPoDrkTfupmZB3pspXg7+arm
	ETPuc9AVqOxsFXCPxbDTA3RIVdRryuaKd/aIYQZYzgH4CbqSlSohiJ7GrVPZJFbVE8aPsKzaAKsTw
	jWm67g7b2L5EEbd9rEyB0KsA1tA0zPpTLycAfEv/1x+cJnNiVbuy+brdc0vRrPW9Rl1Rsd8Nrba8/
	b8MVTbbqsah1l4+Z8cRE8ujxJdjSpFqR3iN3j0lQfvjzl3wkx1KRVy9Ngd6jYl0FLU5QQEh+ypRpi
	JchuPO+6p64jD/UuGstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xk-000EQ0-13;
	Wed, 04 Oct 2023 14:34:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xf-000EKZ-14
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:34:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40646537450so5674055e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696430088; x=1697034888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3YF5WNle5WpS70J/C6Gc27a4yBxFn8dy6pHVVBXBUQ=;
        b=RXOp2Ppmcn3NQZMc4aKXvqgC/sh53xFuA5lX9ZG7quwVZmY2EpMnZRp/mXmSg23A7M
         EfOW4DgXiHRsDBtlTkEjxf9i+gQgDmu1dUhBlLCTv3UL6iYN3JpmXiBvTuTktrjJ1tl1
         hwyJA5v8QjlK0oE1jox2HAfPHiDaYh/McgnTtvbCgX+H4DdVvM0fFKitv0IDk2XxD3e/
         kW76mCsbMpS7z457VwWoil/FwtNYQoQOmcvMXunkB0EkI4vQr987u2lVQeE1tayT2k9x
         3kUxN2ZF0C5gOWLqcor7LXZm18fuWYONdKvWRsunGRGCecaWJAlW+9HgKZTCNePcFUU3
         QV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430088; x=1697034888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3YF5WNle5WpS70J/C6Gc27a4yBxFn8dy6pHVVBXBUQ=;
        b=N92Mi5fFum3eTwT4DhuYwoqD0BTY5rMJRMzof+2QO44rIIdKRLG191OXRaBClAznDJ
         tKKKURMtX2ZHBzqqc7o73obm4c1tZs3ry/SNJM01q8jNsrCtBR4c0D8mCZmpXZCgQMh0
         A3TJJJ1blh5IJLjYYsltXn4OrTXfQhMvHrTwCgFnnY25uIUxo2QidHNY2xcnh4lTpT9F
         onvBuNvzmp7zgs/w96ZOOlqaZeelVRHRivp6cAJEmDd+LEISljRUnm36bGo4QMqpIEva
         tztg/lQjsCOgrX0D9EyQVA1n7+SADH3QYktqN4Kt5TaWAHcyKac3GkIspRNe+O+qwi2d
         /5rA==
X-Gm-Message-State: AOJu0YwyMAYBi/NqZ+0XMlT2sqdCnwx8nanbniRBiQYXn18Ren/P/2xZ
	9vFKUe54eeQr2tISWlHiq8Wflw==
X-Google-Smtp-Source: AGHT+IGG8Kcx0OpDIRRrfevcHI4+l//9I5GBAldHw3+cp6ZLo6USiLMAAmHvXUqVSmuiNG9ieb8B4A==
X-Received: by 2002:a05:600c:511d:b0:401:b53e:6c3e with SMTP id o29-20020a05600c511d00b00401b53e6c3emr2517778wms.1.1696430088453;
        Wed, 04 Oct 2023 07:34:48 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b00401e32b25adsm1686205wmi.4.2023.10.04.07.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:34:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 4/5] riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
Date: Wed,  4 Oct 2023 16:30:53 +0200
Message-ID: <20231004143054.482091-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004143054.482091-1-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_073451_390000_90B26163 
X-CRM114-Status: UNSURE (   9.99  )
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

RU5UUlkoKS9FTkQoKS9XRUFLKCkgbWFjcm9zIGFyZSBkZXByZWNhdGVkIGFuZCB3ZSBzaG91bGQg
bWFrZSB1c2Ugb2YgdGhlCm5ldyBTWU1fKigpIG1hY3JvcyBbMV0gZm9yIGJldHRlciBhbm5vdGF0
aW9uIG9mIHN5bWJvbHMuIFJlcGxhY2UgdGhlCmRlcHJlY2F0ZWQgb25lcyB3aXRoIHRoZSBuZXcg
b25lcyBhbmQgZml4IHdyb25nIHVzYWdlIG9mIEVORCgpL0VORFBST0MoKQp0byBjb3JyZWN0bHkg
ZGVzY3JpYmUgdGhlIHN5bWJvbHMuCgpbMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvY29yZS1h
cGkvYXNtLWFubm90YXRpb25zLmh0bWwKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TIHwg
MjggKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfc3dpdGNoLlMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TCmluZGV4IGQ3NGRmOGVi
NGQ3MS4uOGIxODQ3Mzc4MGFjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRj
aC5TCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMKQEAgLTE1LDcgKzE1LDcgQEAK
IAkuYWx0bWFjcm8KIAkub3B0aW9uIG5vcmVsYXgKIAotRU5UUlkoX19rdm1fcmlzY3Zfc3dpdGNo
X3RvKQorU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQogCS8qIFNhdmUgSG9z
dCBHUFJzIChleGNlcHQgQTAgYW5kIFQwLVQ2KSAqLwogCVJFR19TCXJhLCAoS1ZNX0FSQ0hfSE9T
VF9SQSkoYTApCiAJUkVHX1MJc3AsIChLVk1fQVJDSF9IT1NUX1NQKShhMCkKQEAgLTIwOCw5ICsy
MDgsOSBAQCBfX2t2bV9zd2l0Y2hfcmV0dXJuOgogCiAJLyogUmV0dXJuIHRvIEMgY29kZSAqLwog
CXJldAotRU5EUFJPQyhfX2t2bV9yaXNjdl9zd2l0Y2hfdG8pCitTWU1fRlVOQ19FTkQoX19rdm1f
cmlzY3Zfc3dpdGNoX3RvKQogCi1FTlRSWShfX2t2bV9yaXNjdl91bnByaXZfdHJhcCkKK1NZTV9D
T0RFX1NUQVJUKF9fa3ZtX3Jpc2N2X3VucHJpdl90cmFwKQogCS8qCiAJICogV2UgYXNzdW1lIHRo
YXQgZmF1bHRpbmcgdW5wcml2IGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb24gaXMKIAkgKiA0LWJ5dGUg
bG9uZyBhbmQgYmxpbmRseSBpbmNyZW1lbnQgU0VQQyBieSA0LgpAQCAtMjMxLDEyICsyMzEsMTAg
QEAgRU5UUlkoX19rdm1fcmlzY3ZfdW5wcml2X3RyYXApCiAJY3NycglhMSwgQ1NSX0hUSU5TVAog
CVJFR19TCWExLCAoS1ZNX0FSQ0hfVFJBUF9IVElOU1QpKGEwKQogCXNyZXQKLUVORFBST0MoX19r
dm1fcmlzY3ZfdW5wcml2X3RyYXApCitTWU1fQ09ERV9FTkQoX19rdm1fcmlzY3ZfdW5wcml2X3Ry
YXApCiAKICNpZmRlZglDT05GSUdfRlBVCi0JLmFsaWduIDMKLQkuZ2xvYmFsIF9fa3ZtX3Jpc2N2
X2ZwX2Zfc2F2ZQotX19rdm1fcmlzY3ZfZnBfZl9zYXZlOgorU1lNX0ZVTkNfU1RBUlQoX19rdm1f
cmlzY3ZfZnBfZl9zYXZlKQogCWNzcnIgdDIsIENTUl9TU1RBVFVTCiAJbGkgdDEsIFNSX0ZTCiAJ
Y3NycyBDU1JfU1NUQVRVUywgdDEKQEAgLTI3NiwxMCArMjc0LDkgQEAgX19rdm1fcmlzY3ZfZnBf
Zl9zYXZlOgogCXN3IHQwLCBLVk1fQVJDSF9GUF9GX0ZDU1IoYTApCiAJY3NydyBDU1JfU1NUQVRV
UywgdDIKIAlyZXQKK1NZTV9GVU5DX0VORChfX2t2bV9yaXNjdl9mcF9mX3NhdmUpCiAKLQkuYWxp
Z24gMwotCS5nbG9iYWwgX19rdm1fcmlzY3ZfZnBfZF9zYXZlCi1fX2t2bV9yaXNjdl9mcF9kX3Nh
dmU6CitTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNjdl9mcF9kX3NhdmUpCiAJY3NyciB0MiwgQ1NS
X1NTVEFUVVMKIAlsaSB0MSwgU1JfRlMKIAljc3JzIENTUl9TU1RBVFVTLCB0MQpAQCAtMzE5LDEw
ICszMTYsOSBAQCBfX2t2bV9yaXNjdl9mcF9kX3NhdmU6CiAJc3cgdDAsIEtWTV9BUkNIX0ZQX0Rf
RkNTUihhMCkKIAljc3J3IENTUl9TU1RBVFVTLCB0MgogCXJldAorU1lNX0ZVTkNfRU5EKF9fa3Zt
X3Jpc2N2X2ZwX2Rfc2F2ZSkKIAotCS5hbGlnbiAzCi0JLmdsb2JhbCBfX2t2bV9yaXNjdl9mcF9m
X3Jlc3RvcmUKLV9fa3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZToKK1NZTV9GVU5DX1NUQVJUKF9fa3Zt
X3Jpc2N2X2ZwX2ZfcmVzdG9yZSkKIAljc3JyIHQyLCBDU1JfU1NUQVRVUwogCWxpIHQxLCBTUl9G
UwogCWx3IHQwLCBLVk1fQVJDSF9GUF9GX0ZDU1IoYTApCkBAIC0zNjIsMTAgKzM1OCw5IEBAIF9f
a3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZToKIAlmc2NzciB0MAogCWNzcncgQ1NSX1NTVEFUVVMsIHQy
CiAJcmV0CitTWU1fRlVOQ19FTkQoX19rdm1fcmlzY3ZfZnBfZl9yZXN0b3JlKQogCi0JLmFsaWdu
IDMKLQkuZ2xvYmFsIF9fa3ZtX3Jpc2N2X2ZwX2RfcmVzdG9yZQotX19rdm1fcmlzY3ZfZnBfZF9y
ZXN0b3JlOgorU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3ZfZnBfZF9yZXN0b3JlKQogCWNzcnIg
dDIsIENTUl9TU1RBVFVTCiAJbGkgdDEsIFNSX0ZTCiAJbHcgdDAsIEtWTV9BUkNIX0ZQX0RfRkNT
UihhMCkKQEAgLTQwNSw0ICs0MDAsNSBAQCBfX2t2bV9yaXNjdl9mcF9kX3Jlc3RvcmU6CiAJZnNj
c3IgdDAKIAljc3J3IENTUl9TU1RBVFVTLCB0MgogCXJldAorU1lNX0ZVTkNfRU5EKF9fa3ZtX3Jp
c2N2X2ZwX2RfcmVzdG9yZSkKICNlbmRpZgotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
