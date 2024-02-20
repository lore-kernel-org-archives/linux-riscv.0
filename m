Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204A1C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w+Rx/5s5KavZq6DWK5aDu2cMQXVE2GfvKAPvxkJiHrA=; b=xkqKJRXfIeEUY1
	dRR0Uv6JMbmJKkZifXwzL48YesuJy1SQuBkU8pEQjVhtViji3XaOOY47td7AgnqIv8yLm/HzbzZCm
	PsFpJiY8ABtwr0y6c6fUJK2/gsr7p8KvuUNYhr0iAsh/Wk6BWmWTTsEntHs5rpMgVgae3BzpUQ1+s
	aUfooH2SQTliZpuRrK6Epn263D4CVioEbBrrF+ZqiWYgJUJebt2pS9mH0LNl8gMRpAZ9YvjGgnzam
	pcla98yoaInZf0sVpyaPFoP1MyywLAAhT1oYuWyg3qtiuWBtXnbif+0Xbc/ihQ1pi6W9CZNXkrSil
	NYt8OCEnZZ6iUaVazPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcO0i-0000000EO9K-04CP;
	Tue, 20 Feb 2024 11:10:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcO0f-0000000EO8L-0BC5
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 11:10:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33d0a82685dso1004378f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708427399; x=1709032199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+NE38xHg+iFcMOIUoO6dahKVI267XimNpzeYRqug0o=;
        b=PKzgL9bpT133l75LiOpMgkm01qEn2gQRE2SlvTSDjZQgQ99S4nd8pgKkEYPj0hIM9j
         75uZmJh3X5jHv2EaN3zHLFiK+9srhnLygKbtYntUZjiSjv9fE7RE4FEmk81h4tWYph26
         wYrYFOnV9eRd9ZSVKIXdB4wzqQgzqWlQBPZP0w/DqECDYiMSeXJrmsyn6+gNiWMmhT8o
         qUv1FQnDs82Zo5e5WCla6fY4cvTli9pgX7+hbfJ8cJre6OWKbnj29fTenbHiMH0FPaGu
         EvNO5rEBATU2u1yDeP9b0aiDTDjga/4VSZXgD8yqKwkuqrPlT3gYGGmugAVniamldqoC
         2sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427399; x=1709032199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+NE38xHg+iFcMOIUoO6dahKVI267XimNpzeYRqug0o=;
        b=Mj/Qnuea4ZsHFGZO8pD/YTLZJPyH10Nk0ntQT686JPXAnTLoqcMK+ulhEA5NfGnnMN
         UpoUoDJMDXxkvp380tejS0UPkEAjmx7zVfrykw+HeQbGrd3ZG7r9jmJgmMBydmcNZeX5
         ANCpJLey6TD5ZOCqLoIOJ7MZong/zD/jp+fL4TADN1rxrmQFciLbuBy6r68P649ZwyCh
         KngmnhW8rRLMR0LDlQ2zbMr81X8Em/54rhcMSEHp0Hk8+g0Yro8I7paALU3HWOQFPnwH
         Xty4lNpR+BEI84LPzr95NU74MJjTclOIpsrQUPWaRTwnJNnNUm8om8sifiKP/TjzzIE7
         m4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWVDMDLumbSFvAGKgDkCGAxsib3IEVaV1ULroj521yJLiOdsg++WuPzxdS5rY0EiVibxsmuLABcrhGrBX73YOTaOsErk+zwv3S35713hHwx
X-Gm-Message-State: AOJu0Yxt09KUI+IdY1d8fx5Kh2xHb+19fPvd1ZaeP0BLSh8pQ8OPFkCx
	NVlpapEzK2pyDMDCdlpSpps6lf6UdDbDOvqVXxYNAnAE3AUk+NFeeMe+KOEbUKC/K60ooAnyNie
	f
X-Google-Smtp-Source: AGHT+IFEeB57DA/UVYTFHFvFefw4+utIN4uHed+oWc9cOPONdvuPDUZUvkrfpHzHpS85/bYqCuA05g==
X-Received: by 2002:a05:6000:79d:b0:33d:7221:97cf with SMTP id bu29-20020a056000079d00b0033d722197cfmr55643wrb.6.1708427399487;
        Tue, 20 Feb 2024 03:09:59 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:6202:c7ea:a0cd:ad4a])
        by smtp.gmail.com with ESMTPSA id az19-20020adfe193000000b0033d6ff7f9edsm1092523wrb.95.2024.02.20.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 03:09:59 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Stefan O'Rear" <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v2] riscv: hwprobe: export largest userspace address
Date: Tue, 20 Feb 2024 12:09:46 +0100
Message-ID: <20240220110950.871307-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_031001_293046_6DFCA81D 
X-CRM114-Status: GOOD (  18.38  )
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

U29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIChPcGVuSkRLIGZvciBpbnN0YW5jZSkgdXNlcyB0
aGUgZnJlZSBNU0JzCmluIHBvaW50ZXJzIHRvIGluc2VydCBhZGRpdGlvbmFsIGluZm9ybWF0aW9u
IGZvciB0aGVpciBvd24gbG9naWMgYW5kCm5lZWQgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gZnJv
bSBzb21ld2hlcmUuIEN1cnJlbnRseSB0aGV5IHJlbHkgb24KcGFyc2luZyAvcHJvYy9jcHVpbmZv
ICJtbXU9c3Z4eCIgc3RyaW5nIHRvIG9idGFpbiB0aGUgY3VycmVudCB2YWx1ZSBvZgp2aXJ0dWFs
IGFkZHJlc3MgdXNlZCBiaXRzIFsxXS4gU2luY2UgdGhpcyByZWZsZWN0IHRoZSByYXcgTU1VIG1v
ZGUKc3VwcG9ydGVkLCBpdCBtaWdodCBkaWZmZXIgZnJvbSB0aGUgbG9naWNhbCBvbmUgdXNlZCBp
bnRlcm5hbGx5LgpFeHBvcnRpbmcgdGhlIG1heGltdW0gbW1hcHBhYmxlIGFkZHJlc3MgdGhyb3Vn
aCBod3Byb2JlIHdpbGwgYWxsb3cgYQptb3JlIHN0YWJsZSBpbnRlcmZhY2UgdG8gYmUgdXNlZC4g
Rm9yIHRoYXQgcHVycG9zZSwgYWRkIGEgbmV3IGh3cHJvYmUKa2V5IG5hbWVkIFJJU0NWX0hXUFJP
QkVfTUFYX0tFWSB3aGljaCB3aWxsIGV4cG9ydCB0aGUgbWF4aW11bSBtbWFwcGFibGUKdXNlcnNw
YWNlIGFkZHJlc3MuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9t
YXN0ZXIvc3JjL2hvdHNwb3Qvb3NfY3B1L2xpbnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlz
Y3YuY3BwI0wxNzEgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KCi0tLQp2MjoKIC0gTm90ZTogdHJpZWQgc3lzY29uZiB0byBleHBvcnQgaXQg
YnV0IHRoaXMgaXMgbm90IGJhY2tlZCBieSBzeXNjYWxsCiAgIGFuZCB0aHVzIGRvZXMgbm90IGFs
bG93IGV4cG9ydGluZyBzdWNoIGluZm9ybWF0aW9uIGVhc2lseS4KIC0gVXNlIGFyY2hfZ2V0X21t
YXBfZW5kKCkgaW5zdGVhZCBvZiBWQV9CSVRTIHNpbmNlIGl0IHJlZmxlY3RzIHRoZQogICBtYXhp
bXVtIGxvZ2ljYWwgYWRkcmVzcyB1c2VkIGJ5IHRoZSByaXNjdiBwb3J0CiAtIENoYW5nZSBod3By
b2JlIGtleSBuYW1lIGZyb20gUklTQ1ZfSFdQUk9CRV9LRVlfVkFfQklUUyB0bwogICBSSVNDVl9I
V1BST0JFX0tFWV9NQVhfQUREUkVTUwogLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjQwMjAxMTQwMzE5LjM2MDA4OC0xLWNsZWdlckByaXZvc2luYy5jb20vCi0t
LQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDMgKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQogYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YyAgICAgICB8IDQgKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggYjJiY2M5ZWVk
OWFhLi5hNjI2YWEyMWFjNzQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAg
LTIxMCwzICsyMTAsNiBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAKICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19TSVpFYDogQW4gdW5zaWduZWQg
aW50IHdoaWNoCiAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBibG9jayBpbiBi
eXRlcy4KKworKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfTUFYX1VTRVJfQUREUkVTU2A6
IEFuIHVuc2lnbmVkIGxvbmcgd2hpY2gKKyAgcmVwcmVzZW50IHRoZSBtYXhpbXVtIHVzZXJzcGFj
ZSBtbWFwcGFibGUgYWRkcmVzcy4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKaW5kZXggNjMwNTA3
ZGZmNWVhLi4xNTBhOTg3N2IwYWYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCkBAIC04LDcg
KzgsNyBAQAogCiAjaW5jbHVkZSA8dWFwaS9hc20vaHdwcm9iZS5oPgogCi0jZGVmaW5lIFJJU0NW
X0hXUFJPQkVfTUFYX0tFWSA2CisjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA3CiAKIHN0
YXRpYyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCiB7
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCA5ZjJhOGUzZmYyMDQuLmE2
ZGE0MzRiZTlkYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC02Nyw2
ICs2Nyw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9VTlNVUFBPUlRFRAkoNCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9N
SVNBTElHTkVEX01BU0sJCSg3IDw8IDApCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JP
Wl9CTE9DS19TSVpFCTYKKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfTUFYX1VTRVJfQUREUkVT
Uwk3CiAvKiBJbmNyZWFzZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hlbiBhZGRpbmcgaXRlbXMu
ICovCiAKIC8qIEZsYWdzICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCBhN2M1NmI0MWVm
ZDIuLjE5YTQ3NTQwYjRhMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJv
YmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC04LDYgKzgsNyBA
QAogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUu
aD4KICNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgorI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4K
ICNpbmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPgogI2luY2x1
ZGUgPGFzbS91YWNjZXNzLmg+CkBAIC0yMDIsNiArMjAzLDkgQEAgc3RhdGljIHZvaWQgaHdwcm9i
ZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJaWYgKGh3cHJvYmVfZXh0
MF9oYXMoY3B1cywgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKSkKIAkJCXBhaXItPnZhbHVlID0g
cmlzY3ZfY2Jvel9ibG9ja19zaXplOwogCQlicmVhazsKKwljYXNlIFJJU0NWX0hXUFJPQkVfS0VZ
X01BWF9VU0VSX0FERFJFU1M6CisJCXBhaXItPnZhbHVlID0gYXJjaF9nZXRfbW1hcF9lbmQoVUxP
TkdfTUFYLCAwLCAwKTsKKwkJYnJlYWs7CiAKIAkvKgogCSAqIEZvciBmb3J3YXJkIGNvbXBhdGli
aWxpdHksIHVua25vd24ga2V5cyBkb24ndCBmYWlsIHRoZSB3aG9sZQotLSAKMi40My4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
