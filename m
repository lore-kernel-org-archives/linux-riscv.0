Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A140D690E9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GEYrEagmpxniOToiAYSJDBe+xIavl7z+9nKf8hS/bOw=; b=a2udPBTQcqy9a8
	wDN1NXcXXY0ZJII1jNsk3iVF82zGNTxXq6CebPQVu5ji9rvfTOMDPnQGlJF2if11BCd426AkS6vtC
	9cGUwTIvCXLdElWbS5KoWuQX5MzfZJ7LPchQTwhXsurF0Xd4hgYS9GNZmfCe/fD+dggGiK4nECAI5
	XUn64aF0u4jprlvpg0P0VtGfXQFqOC3O9zyXyGNKwoG3s0AmYMSWrD8NmDk5Vje/IIjWv9ymP7v71
	DZcwC17VJTho0QFWGr/eNWuzw7FzM6QTX+jGOGQoRnGV5yldi1FEuJx/7c8qV8HplRvqaPCoMnVI2
	0FDJDmOK5Kd1iGI2ML+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZhk-0000000Extt-3Qpp;
	Thu, 28 Nov 2024 08:16:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZhi-0000000ExtH-2saI
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:16:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so4673845e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732781809; x=1733386609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XtkNb7ChcpZKeghQlkhwMDhrbK5ce/xMSti4wIKo4Vk=;
        b=Oj9mKK05Zhq2E1MhyKWm8Upwv/CEvl3KqYd1vD2u/7UiYfq7gbaOkx0j3SekVnO4J2
         MmA18UMjeLfuTULFNlyyLvt6CoragYSE2fPFuofbCM8kU570aAdHWGqS7rdoXnRrF7Xs
         7J8t/qeeXRSLqqQNX0MBLz/nA4yL3xC0fBpTZKcV38DOv5qiAnGUQWatWC8w84PLSlVf
         jWDmm8NqZhQEZwlSLO542G2oBZ+r3XBjzB1P2q8kaMZrMs53l7Tee/DKsFbT7+mp2qDR
         HkZPWYb87hV7s5h5BS2C6quwOaA0Aa1K+SbkIfzbQYgfWnHThxLztsi7/suyx1/rPNBQ
         0OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732781809; x=1733386609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtkNb7ChcpZKeghQlkhwMDhrbK5ce/xMSti4wIKo4Vk=;
        b=RtKw2/CDYKYD4FpByKbzeakzwK44Ld/AY6rcJzNNJ4IGN0kq75t3Lm32vDfZgMcPAv
         IOY8CJvdqZ+3XoCg6MkYCLYBjZQOLQFDreCRhEvgYtFn+lE6GJM7B/rnOuJKWov7WLXH
         KocjYipzL4KTShJ8qxKJclKYCxr8qCnXvATX6k1yYHVPRwx3rxLMMFkSoj797aIeU0FN
         yNG+tA/iukVT8s4nuEQxe5Ng4vFacFP+Hc2F9t0uwgczZaU7/7AYOSTtkXZJYT2HTb8Z
         cj86IceDyAlYyft0NGzSaxdJCchv4gsgTGVLznQ49CvJ0HYMXrjigucJ5UVYl7tU6ij+
         XYgw==
X-Forwarded-Encrypted: i=1; AJvYcCWuHsU+PQziwDd+9hbolf917u0tD3QNx6bPXIEum0w/GvLpovRpbzxlgDrRSSuWStmG7znTavw0gERm9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEQ71AP/jRBcjhgejjkx6ahzJI1s0Wi9aEJKTfs8QgDkEk6P65
	VWxoMKtsFe5zSC1XLL83feAVpzdPzBGBt+2BUU/PeHjoPjEjHmxXFaSRHRTFpt8=
X-Gm-Gg: ASbGncsiDk7kNHylyYO/jx2YHUJUnRIg55xthQ2351h1Sfu8x9ITdZEmcWexk/G4kdi
	qUcqCl3Unq15ovbfyu8LQUHL8I2XgV7Y+rNsNO9FBQVKUDMrHW/9gyfV5rIpnTfiHo++r9d1a/M
	9JIFjR65ncxnLnwLYM1A0njQE8LcgLYlIsjK6Zw2JSsVqP9N7z6bvviSsiqIDXLYKN4ZyIEpKMf
	7jsZwAL0tKJIg7oYZIv/CQ1cbmxMluuJeKe1C1R8fsEtQC4BlA=
X-Google-Smtp-Source: AGHT+IFa2GLouk/rGMVQjtmqkbmXBjVyAfkRwDjDgUh0FP24cjeR4S1FKi1Ih91BYGaVuzDe63g42A==
X-Received: by 2002:a05:600c:5490:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-434a9de43cfmr51318225e9.24.1732781807910;
        Thu, 28 Nov 2024 00:16:47 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70cbfsm13945265e9.36.2024.11.28.00.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:16:47 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kai Zhang <zhangkai@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3] riscv: module: remove relocation_head rel_entry member allocation
Date: Thu, 28 Nov 2024 09:16:34 +0100
Message-ID: <20241128081636.3620468-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_001650_724328_7BDEE687 
X-CRM114-Status: GOOD (  11.92  )
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

cmVsb2NhdGlvbl9oZWFkJ3MgbGlzdF9oZWFkIG1lbWJlciwgcmVsX2VudHJ5LCBkb2Vzbid0IG5l
ZWQgdG8gYmUKYWxsb2NhdGVkLCBpdHMgc3RvcmFnZSBjYW4ganVzdCBiZSBwYXJ0IG9mIHRoZSBh
bGxvY2F0ZWQgcmVsb2NhdGlvbl9oZWFkLgpSZW1vdmUgdGhlIHBvaW50ZXIgd2hpY2ggYWxsb3dz
IHRvIGdldCByaWQgb2YgdGhlIGFsbG9jYXRpb24gYXMgd2VsbCBhcwphbiBleGlzdGluZyBtZW1v
cnkgbGVhayBmb3VuZCBieSBLYWkgWmhhbmcgdXNpbmcga21lbWxlYWsuCgpGaXhlczogOGZkNmM1
MTQyMzk1ICgicmlzY3Y6IEFkZCByZW1haW5pbmcgbW9kdWxlIHJlbG9jYXRpb25zIikKUmVwb3J0
ZWQtYnk6IEthaSBaaGFuZyA8emhhbmdrYWlAaXNjYXMuYWMuY24+ClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgpUZXN0ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hh
cmxpZUByaXZvc2luYy5jb20+Ci0tLQpWMzoKIC0gRml4IFpoYW5nIG5hbWUgc3BlbGxpbmcuCiAt
IFJld29yZCBjb21taXQgdGl0bGUuCiAtIEFkZCBhICdGaXhlczonIHRhZwoKVjI6CiAtIEFkZCBL
YWkgWmhhbmcgJ1JlcG9ydGVkLWJ5OicgdGFnCiAtIFJld29yZCB0aGUgY29tbWl0IGRlc2NyaXB0
aW9uIChBbmRyZXcpCgogYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgfCAxOCArKysrLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvbW9kdWxlLmMKaW5kZXggMWNkNDYxZjNkODcyLi40N2QwZWJlZWM5M2MgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21v
ZHVsZS5jCkBAIC0yMyw3ICsyMyw3IEBAIHN0cnVjdCB1c2VkX2J1Y2tldCB7CiAKIHN0cnVjdCBy
ZWxvY2F0aW9uX2hlYWQgewogCXN0cnVjdCBobGlzdF9ub2RlIG5vZGU7Ci0Jc3RydWN0IGxpc3Rf
aGVhZCAqcmVsX2VudHJ5OworCXN0cnVjdCBsaXN0X2hlYWQgcmVsX2VudHJ5OwogCXZvaWQgKmxv
Y2F0aW9uOwogfTsKIApAQCAtNjM0LDcgKzYzNCw3IEBAIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVs
b2NhdGlvbnMoc3RydWN0IG1vZHVsZSAqbWUsCiAJCQlsb2NhdGlvbiA9IHJlbF9oZWFkX2l0ZXIt
PmxvY2F0aW9uOwogCQkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJlbF9lbnRyeV9pdGVyLAog
CQkJCQkJIHJlbF9lbnRyeV9pdGVyX3RtcCwKLQkJCQkJCSByZWxfaGVhZF9pdGVyLT5yZWxfZW50
cnksCisJCQkJCQkgJnJlbF9oZWFkX2l0ZXItPnJlbF9lbnRyeSwKIAkJCQkJCSBoZWFkKSB7CiAJ
CQkJY3Vycl90eXBlID0gcmVsX2VudHJ5X2l0ZXItPnR5cGU7CiAJCQkJcmVsb2NfaGFuZGxlcnNb
Y3Vycl90eXBlXS5yZWxvY19oYW5kbGVyKApAQCAtNzA0LDE2ICs3MDQsNyBAQCBzdGF0aWMgaW50
IGFkZF9yZWxvY2F0aW9uX3RvX2FjY3VtdWxhdGUoc3RydWN0IG1vZHVsZSAqbWUsIGludCB0eXBl
LAogCQkJcmV0dXJuIC1FTk9NRU07CiAJCX0KIAotCQlyZWxfaGVhZC0+cmVsX2VudHJ5ID0KLQkJ
CWttYWxsb2Moc2l6ZW9mKHN0cnVjdCBsaXN0X2hlYWQpLCBHRlBfS0VSTkVMKTsKLQotCQlpZiAo
IXJlbF9oZWFkLT5yZWxfZW50cnkpIHsKLQkJCWtmcmVlKGVudHJ5KTsKLQkJCWtmcmVlKHJlbF9o
ZWFkKTsKLQkJCXJldHVybiAtRU5PTUVNOwotCQl9Ci0KLQkJSU5JVF9MSVNUX0hFQUQocmVsX2hl
YWQtPnJlbF9lbnRyeSk7CisJCUlOSVRfTElTVF9IRUFEKCZyZWxfaGVhZC0+cmVsX2VudHJ5KTsK
IAkJcmVsX2hlYWQtPmxvY2F0aW9uID0gbG9jYXRpb247CiAJCUlOSVRfSExJU1RfTk9ERSgmcmVs
X2hlYWQtPm5vZGUpOwogCQlpZiAoIWN1cnJlbnRfaGVhZC0+Zmlyc3QpIHsKQEAgLTcyMiw3ICs3
MTMsNiBAQCBzdGF0aWMgaW50IGFkZF9yZWxvY2F0aW9uX3RvX2FjY3VtdWxhdGUoc3RydWN0IG1v
ZHVsZSAqbWUsIGludCB0eXBlLAogCiAJCQlpZiAoIWJ1Y2tldCkgewogCQkJCWtmcmVlKGVudHJ5
KTsKLQkJCQlrZnJlZShyZWxfaGVhZC0+cmVsX2VudHJ5KTsKIAkJCQlrZnJlZShyZWxfaGVhZCk7
CiAJCQkJcmV0dXJuIC1FTk9NRU07CiAJCQl9CkBAIC03MzUsNyArNzI1LDcgQEAgc3RhdGljIGlu
dCBhZGRfcmVsb2NhdGlvbl90b19hY2N1bXVsYXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlw
ZSwKIAl9CiAKIAkvKiBBZGQgcmVsb2NhdGlvbiB0byBoZWFkIG9mIGRpc2NvdmVyZWQgcmVsX2hl
YWQgKi8KLQlsaXN0X2FkZF90YWlsKCZlbnRyeS0+aGVhZCwgcmVsX2hlYWQtPnJlbF9lbnRyeSk7
CisJbGlzdF9hZGRfdGFpbCgmZW50cnktPmhlYWQsICZyZWxfaGVhZC0+cmVsX2VudHJ5KTsKIAog
CXJldHVybiAwOwogfQotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
