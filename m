Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BD9E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=txi0nCx2Shb0d+InIq0npmj5cWfwPsJr46SQv3brQY8=; b=buiJSGiMMVRhXf
	tPggYnJVdeSh5ojQfUEM9UncBOf8OKDOB7q02iqX1WK6o0PsMirFMbmGjmNb4XDGJbANhXB6szJrz
	kvgh4t8XST17MHHcVY7F38JyFIxp+s+WZZjuGVSBSAKFxgyb4EA9rTLC8ShL7TGrRUR1VLhDfem+q
	di7fVTw2Uav2vZMz8SqzqZY7Buy9khXOZ+RFlFq0xeK15ry1ksqpbDlceyQEpoPynQboluCQxDF8J
	4q/LZThnI2u4qE/QuGp79HHoVYL/lbh25ZQ65n6dLEYLu12ndKDbjMrT7agHkI1FMfXmyFj23zzm7
	iIZM6no6wGqw+o8KgvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdrC-0000000CaUB-2617;
	Fri, 03 Jan 2025 09:20:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdr8-0000000CaRe-41DK
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 09:20:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2161eb94cceso117753975ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896031; x=1736500831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ET8b8sRPCO4IU1SFY+SvkpPtWQBm6OdnGtfJMT58fac=;
        b=FsLZIKL4jLE+qepR/ttPjNgz6izo65cbirsQ4PdwM+aIkn/jpQ+F8rhXAIGx8/F08T
         hEzYt+vAVGZfXZBrC+WkAUc91/PvMg/o5bINHHvTkk3LiYVlI1NXwz6AYCbXnHsVSoXX
         oMylN0crsEA4n15xyopSlNm3vCfl3FkABZWqf487z7lONDKcJpGBlWbkSmc4AAZovtTC
         G3CMTwt7xciEya9h3ilZSiU8oD+Tpx/R/+ftTizCFGwD5aoQwyDSE4VU4yv2vYIymh/Y
         e2qiNZjFBEOex5RS9fPXTiUxJqBq4V7bLXh8d1hGmZY9Qv/Mn1YwpjSBuBRlO5VTuiAa
         FBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896031; x=1736500831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET8b8sRPCO4IU1SFY+SvkpPtWQBm6OdnGtfJMT58fac=;
        b=wM0uvRBDuW/4w2NjEU84+9knykn2uZHpZtfgHaw3gvlcisrtP9ZkjIvsb7EVOIoASg
         ajtwRjtN2WffnrCEWXSFiiJM66Y0Cj7XU3xPtXBYSSfLVBgO1ZUmlt231WL/66/G2nGQ
         ZfxBdggQ4gVyUgDP0F0HDX413TqxGS0J+lKwa0FmuV2tfPm9BrX+nmgkExiHkdtOI9yv
         zCdB/43JH1ePZyBiSFAtZhriUZq0+mrCXuy2TiErSe+OLZ3suIn+5clYMNLUpDTJ7e75
         gDqR+aeZeq7CZvlDIsj/KghX2BLnocajxJQ56QjBK61juHFHjlwt8QMJ2KII63JZpdGz
         u3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHFLJP23cgSrJH5MkQ65VMmwv81bgnI0wP+fwXIaU9+2SfCyeERQ6sBNn2JCDYcn1GVXtoCl/tyJSk6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKkLMj80nGnn+rYgpxMX2iR24q11VIhAogLI3+GPZQ7uYXn+D5
	Vy1xq/cj3BuvP2Mk3lJ637msiLBPdCr1R9zNE2E9wqUfK1etDT8hdRLd5dQkRRG1KVcSwcJGSDJ
	Ybcc=
X-Gm-Gg: ASbGncsP9XZdN4Hr90mHbalvPkQheQxTTGDcarEugM3ATmSTP6mQ8i2eygeoHs2c33L
	zqe2pVbgXXC39aZX/OsfO3H4KhrhDB4R0AQYwW9YMqp1+XblRxcaRJFRNEGdHFRJzLr4ypA4Y0l
	VaSMvM5tTCs/DV0lp4LH480ZiPYUuyGLTgy9UVzEWZfqsG3ybMbmzu0cvAYjQPJRvgiIjB6T7YS
	/TdaEokZ1R4A/Xbl+oISaAGSCeNUO1Oulkqjus8YaeCe6gsQX8/ycWVudszzglftiEq/ieQmfWX
	4bdWbyQvT2CQKPG7F0ygj23Xz3rGdlaLdoYNI20=
X-Google-Smtp-Source: AGHT+IFfovCSRx3AcqtkWwLuhdout5NOGCAZSfyM3+u+DoqFfMNkSSa+F+IUKGlVCWqGfXK4bOVy9g==
X-Received: by 2002:a17:902:d2c9:b0:216:4c88:d939 with SMTP id d9443c01a7336-219e6f133b6mr716758005ad.38.1735896030803;
        Fri, 03 Jan 2025 01:20:30 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e585sm241417515ad.70.2025.01.03.01.20.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 01:20:30 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND v4] riscv: mm: Fix the out of bound issue of vmemmap address
Date: Fri,  3 Jan 2025 17:20:23 +0800
Message-Id: <20250103092023.37083-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012034_994471_161095EA 
X-CRM114-Status: GOOD (  17.70  )
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

SW4gc3BhcnNlIHZtZW1tYXAgbW9kZWwsIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2Ygdm1lbW1hcCBp
cyBjYWxjdWxhdGVkIGFzOgooKHN0cnVjdCBwYWdlICopVk1FTU1BUF9TVEFSVCAtIChwaHlzX3Jh
bV9iYXNlID4+IFBBR0VfU0hJRlQpKS4KQW5kIHRoZSBzdHJ1Y3QgcGFnZSdzIHZhIGNhbiBiZSBj
YWxjdWxhdGVkIHdpdGggYW4gb2Zmc2V0Ogoodm1lbW1hcCArIChwZm4pKS4KCkhvd2V2ZXIsIHdo
ZW4gaW5pdGlhbGl6aW5nIHN0cnVjdCBwYWdlcywga2VybmVsIGFjdHVhbGx5IHN0YXJ0cyBmcm9t
IHRoZQpmaXJzdCBwYWdlIGZyb20gdGhlIHNhbWUgc2VjdGlvbiB0aGF0IHBoeXNfcmFtX2Jhc2Ug
YmVsb25ncyB0by4gSWYgdGhlCmZpcnN0IHBhZ2UncyBwaHlzaWNhbCBhZGRyZXNzIGlzIG5vdCAo
cGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZUKSwgdGhlbgp3ZSBnZXQgYW4gdmEgYmVsb3cgVk1F
TU1BUF9TVEFSVCB3aGVuIGNhbGN1bGF0aW5nIHZhIGZvciBpdCdzIHN0cnVjdCBwYWdlLgoKRm9y
IGV4YW1wbGUsIGlmIHBoeXNfcmFtX2Jhc2Ugc3RhcnRzIGZyb20gMHg4MjAwMDAwMCB3aXRoIHBm
biAweDgyMDAwLCB0aGUKZmlyc3QgcGFnZSBpbiB0aGUgc2FtZSBzZWN0aW9uIGlzIGFjdHVhbGx5
IHBmbiAweDgwMDAwLiBEdXJpbmcKaW5pdF91bmF2YWlsYWJsZV9yYW5nZSgpLCB3ZSB3aWxsIGlu
aXRpYWxpemUgc3RydWN0IHBhZ2UgZm9yIHBmbiAweDgwMDAwCndpdGggdmlydHVhbCBhZGRyZXNz
ICgoc3RydWN0IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0gMHgyMDAwKSwgd2hpY2ggaXMKYmVsb3cg
Vk1FTU1BUF9TVEFSVCBhcyB3ZWxsIGFzIFBDSV9JT19FTkQuCgpUaGlzIGNvbW1pdCBmaXhlcyB0
aGlzIGJ1ZyBieSBpbnRyb2R1Y2luZyBhIG5ldyB2YXJpYWJsZQondm1lbW1hcF9zdGFydF9wZm4n
IHdoaWNoIGlzIGFsaWduZWQgd2l0aCBtZW1vcnkgc2VjdGlvbiBzaXplIGFuZCB1c2luZwppdCB0
byBjYWxjdWxhdGUgdm1lbW1hcCBhZGRyZXNzIGluc3RlYWQgb2YgcGh5c19yYW1fYmFzZS4KCkZp
eGVzOiBhMTFkZDQ5ZGNiOTMgKCJyaXNjdjogU3BhcnNlLU1lbW9yeS92bWVtbWFwIG91dC1vZi1i
b3VuZHMgZml4IikKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYt
Ynk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGFnZS5oICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggfCAgMiArLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgfCAxNyArKysrKysr
KysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKaW5kZXggNzFhYWJjNWM2NzEzLi4xMjVmNWVjZDk1NjUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGFnZS5oCkBAIC0xMjIsNiArMTIyLDcgQEAgc3RydWN0IGtlcm5lbF9t
YXBwaW5nIHsKIAogZXh0ZXJuIHN0cnVjdCBrZXJuZWxfbWFwcGluZyBrZXJuZWxfbWFwOwogZXh0
ZXJuIHBoeXNfYWRkcl90IHBoeXNfcmFtX2Jhc2U7CitleHRlcm4gdW5zaWduZWQgbG9uZyB2bWVt
bWFwX3N0YXJ0X3BmbjsKIAogI2RlZmluZSBpc19rZXJuZWxfbWFwcGluZyh4KQlcCiAJKCh4KSA+
PSBrZXJuZWxfbWFwLnZpcnRfYWRkciAmJiAoeCkgPCAoa2VybmVsX21hcC52aXJ0X2FkZHIgKyBr
ZXJuZWxfbWFwLnNpemUpKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCBkNGU5OWVlZjkw
YWMuLjA1MGZkYzQ5YjVhZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTg3LDcgKzg3
LDcgQEAKICAqIERlZmluZSB2bWVtbWFwIGZvciBwZm5fdG9fcGFnZSAmIHBhZ2VfdG9fcGZuIGNh
bGxzLiBOZWVkZWQgaWYga2VybmVsCiAgKiBpcyBjb25maWd1cmVkIHdpdGggQ09ORklHX1NQQVJT
RU1FTV9WTUVNTUFQIGVuYWJsZWQuCiAgKi8KLSNkZWZpbmUgdm1lbW1hcAkJKChzdHJ1Y3QgcGFn
ZSAqKVZNRU1NQVBfU1RBUlQgLSAocGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZUKSkKKyNkZWZp
bmUgdm1lbW1hcAkJKChzdHJ1Y3QgcGFnZSAqKVZNRU1NQVBfU1RBUlQgLSB2bWVtbWFwX3N0YXJ0
X3BmbikKIAogI2RlZmluZSBQQ0lfSU9fU0laRSAgICAgIFNaXzE2TQogI2RlZmluZSBQQ0lfSU9f
RU5EICAgICAgIFZNRU1NQVBfU1RBUlQKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5j
IGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKaW5kZXggZmM1M2NlNzQ4YzgwLi44ZDE2N2UwOWYxZmUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCkBAIC0zMyw2ICszMyw3IEBACiAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KICNpbmNsdWRl
IDxhc20vc2VjdGlvbnMuaD4KICNpbmNsdWRlIDxhc20vc29jLmg+CisjaW5jbHVkZSA8YXNtL3Nw
YXJzZW1lbS5oPgogI2luY2x1ZGUgPGFzbS90bGJmbHVzaC5oPgogCiAjaW5jbHVkZSAiLi4va2Vy
bmVsL2hlYWQuaCIKQEAgLTYyLDYgKzYzLDEzIEBAIEVYUE9SVF9TWU1CT0wocGd0YWJsZV9sNV9l
bmFibGVkKTsKIHBoeXNfYWRkcl90IHBoeXNfcmFtX2Jhc2UgX19yb19hZnRlcl9pbml0OwogRVhQ
T1JUX1NZTUJPTChwaHlzX3JhbV9iYXNlKTsKIAorI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1F
TU1BUAorI2RlZmluZSBWTUVNTUFQX0FERFJfQUxJR04JKDFVTEwgPDwgU0VDVElPTl9TSVpFX0JJ
VFMpCisKK3Vuc2lnbmVkIGxvbmcgdm1lbW1hcF9zdGFydF9wZm4gX19yb19hZnRlcl9pbml0Owor
RVhQT1JUX1NZTUJPTCh2bWVtbWFwX3N0YXJ0X3Bmbik7CisjZW5kaWYKKwogdW5zaWduZWQgbG9u
ZyBlbXB0eV96ZXJvX3BhZ2VbUEFHRV9TSVpFIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpXQogCQkJ
CQkJCV9fcGFnZV9hbGlnbmVkX2JzczsKIEVYUE9SVF9TWU1CT0woZW1wdHlfemVyb19wYWdlKTsK
QEAgLTI0MCw4ICsyNDgsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9p
ZCkKIAkgKiBNYWtlIHN1cmUgd2UgYWxpZ24gdGhlIHN0YXJ0IG9mIHRoZSBtZW1vcnkgb24gYSBQ
TUQgYm91bmRhcnkgc28gdGhhdAogCSAqIGF0IHdvcnN0LCB3ZSBtYXAgdGhlIGxpbmVhciBtYXBw
aW5nIHdpdGggUE1EIG1hcHBpbmdzLgogCSAqLwotCWlmICghSVNfRU5BQkxFRChDT05GSUdfWElQ
X0tFUk5FTCkpCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkgewogCQlwaHlz
X3JhbV9iYXNlID0gbWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgpICYgUE1EX01BU0s7CisjaWZkZWYg
Q09ORklHX1NQQVJTRU1FTV9WTUVNTUFQCisJCXZtZW1tYXBfc3RhcnRfcGZuID0gcm91bmRfZG93
bihwaHlzX3JhbV9iYXNlLCBWTUVNTUFQX0FERFJfQUxJR04pID4+IFBBR0VfU0hJRlQ7CisjZW5k
aWYKKwl9CiAKIAkvKgogCSAqIEluIDY0LWJpdCwgYW55IHVzZSBvZiBfX3ZhL19fcGEgYmVmb3Jl
IHRoaXMgcG9pbnQgaXMgd3JvbmcgYXMgd2UKQEAgLTExMDEsNiArMTExMyw5IEBAIGFzbWxpbmth
Z2Ugdm9pZCBfX2luaXQgc2V0dXBfdm0odWludHB0cl90IGR0Yl9wYSkKIAlrZXJuZWxfbWFwLnhp
cHJvbV9zeiA9ICh1aW50cHRyX3QpKCZfZXhpcHJvbSkgLSAodWludHB0cl90KSgmX3hpcHJvbSk7
CiAKIAlwaHlzX3JhbV9iYXNlID0gQ09ORklHX1BIWVNfUkFNX0JBU0U7CisjaWZkZWYgQ09ORklH
X1NQQVJTRU1FTV9WTUVNTUFQCisJdm1lbW1hcF9zdGFydF9wZm4gPSByb3VuZF9kb3duKHBoeXNf
cmFtX2Jhc2UsIFZNRU1NQVBfQUREUl9BTElHTikgPj4gUEFHRV9TSElGVDsKKyNlbmRpZgogCWtl
cm5lbF9tYXAucGh5c19hZGRyID0gKHVpbnRwdHJfdClDT05GSUdfUEhZU19SQU1fQkFTRTsKIAlr
ZXJuZWxfbWFwLnNpemUgPSAodWludHB0cl90KSgmX2VuZCkgLSAodWludHB0cl90KSgmX3N0YXJ0
KTsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
