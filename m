Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66798C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IAHqTyKU1YfvmKvlUVL63DWbpd7LHnp06VtU/gRmD8c=; b=PDOno/zVhGLhvT
	L0Tupi4UEs8prsaWnoy1X0JH48t2I9Biq5AXw9tz9zszAkIAY8x7nT+m3qRE2xxKwbH4dAh0dMOS9
	e8PBR9qSAd9SGU1z/7fUJTlxAM7DvYJrO3atowo6s0mT0AudEUC1BkaqOltnBnKzVsEY8WYiORcRO
	3nSrWF1twFuABUJsGE3/VKoskRr3oS+lawsQrgFeEVBOdGe9wCjFUMvEby+7J4D0QkXszEYdwXcg6
	+dst3desTnzZ5ElKRFT7he6ts8tzxJufNjXoxSc3YQw0JkdGx1Zz4UanX+RU14qpVG0gea0qkjRme
	mB6X2Woed6IfxjCGBtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sd1-00000003I0x-1ZsB;
	Mon, 29 Apr 2024 15:09:15 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaO-00000003GJX-1V0Q
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:34 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2dffaf0c6afso291211fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403190; x=1715007990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QQSGk0Y9Ubz9htfULcfpBCmdaYN6MR+rakpquodwmU=;
        b=ArhAbxPHDRcyB3imFrOlh1IoU0CRdKkQDWGe1OAVjKu5SMt3bOXRogj2s9t7VnePGq
         0B0xqfe5FzeLHDv2V5+L2oNAUQE/ep4j3AF2U8Vl3kRfWQ563GF62m2qPydDQrCLCdPk
         Z+aWQ5D8wGk0ykNqZN6XOa5r7hQyjki4xfMJ05tAqP3D6SzN8jO/tYRwFuKQdi7kSvHP
         YEklwr8u+QTv36oRJzWxyseQZokWQCtq54jftHWIAg7ODRTWhiqvuzNQXO1eUkJfvzXv
         W8wZhcLj5q63L+/MwWekZ1S6jf99qFL9dKsQZ//Rkwx5WCa59iHvGXIq5ahCb4DXH+z0
         kvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403190; x=1715007990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QQSGk0Y9Ubz9htfULcfpBCmdaYN6MR+rakpquodwmU=;
        b=bnqfTKsQ9TzAH2DUrDLsW7pO+pN6TLGb48AbFKl8F7nsjqPFfnR+YM7LeDVvqQqp8+
         J5WZXmIMSHSoEYeL0X1C5aSCxPLY3/6Br/7BXyt/EYx5CtCold+kCOmFK61MaHP1MApz
         8s0rnpEXTlLdHF4FHqStTKcAiBy+R5sP+yReNqVioE9ZuJAYLOEBXdTMrZsiDfuNeaS7
         iDEfcTb2JLoXjkz1aEZXYibjTh5dR6osmsYHbsnVIZj8a6I0SixDvPWCiOi6qWZS6C1i
         Ieww6No/n+tEx/U0xa0c6lN2IlQODky4WBMytiMvOr3HTi+GCDVE85MemvX2xfi5mxK2
         xxFw==
X-Forwarded-Encrypted: i=1; AJvYcCUAdaiDzChIcAqESlDaNqD2kckXSAOnnyxKzRPCS5iGuP585ttU8M0vGbmLAkEOC9NPaMxCHY53vIq+iejq99Fjwor/6yZ/dFv39iUvLmUn
X-Gm-Message-State: AOJu0YzXVvPNF2Yi6j6LtDP0Y/I9XMujPRPTB5DuATN/L+0B4gTPLHMu
	Vwhpul34KUskyegWnB9wEmKXdMsD+SfFrnkDyrqOU50AHyfYJZBCZHFv4y8b6tk=
X-Google-Smtp-Source: AGHT+IGpsgfHeGU47OML9OlpyOLM1Fu89w8RTY/kpzyJSvnqOjqxI7tIAWzXykio3VNUfhS0z6TjLg==
X-Received: by 2002:a2e:9547:0:b0:2d6:c59e:37bd with SMTP id t7-20020a2e9547000000b002d6c59e37bdmr6422086ljh.3.1714403189917;
        Mon, 29 Apr 2024 08:06:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 00/11] Add support for a few Zc* extensions as well as Zcmop
Date: Mon, 29 Apr 2024 17:04:53 +0200
Message-ID: <20240429150553.625165-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080632_686224_1C033105 
X-CRM114-Status: UNSURE (   9.45  )
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

QWRkIHN1cHBvcnQgZm9yICh5ZXQgYWdhaW4pIG1vcmUgUlZBMjNVNjQgbWlzc2luZyBleHRlbnNp
b25zLiBBZGQKc3VwcG9ydCBmb3IgWmNtb3AsIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNp
b25zIGlzYSBzdHJpbmcgcGFyc2luZywKaHdwcm9iZSBhbmQga3ZtIHN1cHBvcnQuIFpjZSwgWmNt
dCBhbmQgWmNtcCBleHRlbnNpb25zIGhhdmUgYmVlbiBsZWZ0Cm91dCBzaW5jZSB0aGV5IHRhcmdl
dCBtaWNyb2NvbnRyb2xsZXJzL2VtYmVkZGVkIENQVXMgYW5kIGFyZSBub3QgbmVlZGVkCmJ5IFJW
QTIzVTY0LgoKU2luY2UgWmMqIGV4dGVuc2lvbnMgc3RhdGVzIHRoYXQgQyBpbXBsaWVzIFpjYSwg
WmNmIChpZiBGIGFuZCBSVjMyKSwgWmNkCihpZiBEKSwgdGhpcyBzZXJpZXMgbW9kaWZpZXMgdGhl
IHdheSBJU0Egc3RyaW5nIGlzIHBhcnNlZCBhbmQgbm93IGRvZXMKaXQgaW4gdHdvIHBoYXNlcy4g
Rmlyc3Qgb25lIHBhcnNlcyB0aGUgc3RyaW5nIGFuZCB0aGUgc2Vjb25kIG9uZQp2YWxpZGF0ZXMg
aXQgZm9yIHRoZSBmaW5hbCBJU0EgZGVzY3JpcHRpb24uCgpUaGlzIHNlcmllcyBpcyBiYXNlZCBv
biB0aGUgWmltb3Agb25lIFsxXS4gQW4gYWRkaXRpb25hbCBmaXggWzJdIHNob3VsZApiZSBhcHBs
aWVkIHRvIGNvcnJlY3RseSB0ZXN0IHRoYXQgc2VyaWVzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA0MDQxMDMyNTQuMTc1MjgzNC0xLWNsZWdlckByaXZv
c2luYy5jb20vIFsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MDkx
NDM4MzkuNTU4Nzg0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzJdCgotLS0KCnY0OgogLSBNb2Rp
ZnkgdmFsaWRhdGUoKSBjYWxsYmFja3MgdG8gcmV0dXJuIGFuIDAsIC1FUFJPQkVERUZFUiBvciBh
bm90aGVyCiAgIGVycm9yLgogLSB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
NDIzMTI0MzI2LjI1MzI3OTYtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKdjM6CiAtIEZpeCB0eXBv
ICJleGlzdHMiIC0+ICJleGlzdCIKIC0gUmVtb3ZlIEMgaW1wbGllcyBaY2EsIFpjZCwgWmNmLCBk
dC1iaW5kaW5ncyBydWxlcwogLSBSZXdvcmsgSVNBIHN0cmluZyByZXNvbHZlciB0byBoYW5kbGUg
ZGVwZW5kZW5jaWVzCiAtIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MTgx
MjQzMDAuMTM4Nzk3OC0xLWNsZWdlckByaXZvc2luYy5jb20vCgp2MjoKIC0gQWRkIFpjKiBkZXBl
bmRlbmNpZXMgdmFsaWRhdGlvbiBpbiBkdC1iaW5kaW5ncwogLSB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDI0MDQxMDA5MTEwNi43NDkyMzMtMS1jbGVnZXJAcml2b3NpbmMuY29t
LwoKQ2zDqW1lbnQgTMOpZ2VyICgxMSk6CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmNhLCBa
Y2YsIFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb24KICAgIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFk
ZCBJU0EgZXh0ZW5zaW9ucyB2YWxpZGF0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgcGFyc2luZyBmb3Ig
WmNhLCBaY2YsIFpjZCBhbmQgWmNiCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaY2EsIFpjZiwg
WmNkIGFuZCBaY2IgSVNBIGV4dGVuc2lvbnMKICBSSVNDLVY6IEtWTTogQWxsb3cgWmNhLCBaY2Ys
IFpjZCBhbmQgWmNiIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCiAgS1ZNOiByaXNjdjogc2VsZnRl
c3RzOiBBZGQgc29tZSBaYyogZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdAogIGR0LWJp
bmRpbmdzOiByaXNjdjogYWRkIFpjbW9wIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICByaXNj
djogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmNtb3AKICByaXNjdjogaHdwcm9iZTog
ZXhwb3J0IFpjbW9wIElTQSBleHRlbnNpb24KICBSSVNDLVY6IEtWTTogQWxsb3cgWmNtb3AgZXh0
ZW5zaW9uIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFpjbW9wIGV4
dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdAoKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdCAgICAgICAgICB8ICAyNCArKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgIDkwICsrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVmZWF0dXJlLmggICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCAgICAgICAgICAgICAgICB8ICAgNSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
aHdwcm9iZS5oICAgICAgICAgfCAgIDUgKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oICAgICAgICAgICAgIHwgICA1ICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAg
ICAgICAgICAgICAgICB8IDI1OSArKysrKysrKysrKystLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMgICAgICAgICAgICAgICB8ICAgNSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCAgMTAgKwogLi4uL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgIDIwICsrCiAxMCBmaWxlcyBjaGFuZ2VkLCAzMzcg
aW5zZXJ0aW9ucygrKSwgODcgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
