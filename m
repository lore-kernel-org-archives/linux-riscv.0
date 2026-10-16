Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8694CCF2C2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ovz3usLjmpCvhmvfMF7/s5g3u4Yj8GUj8mm5bFBmByM=; b=nM2HelV4eJNUAC
	Pq3A6/E+WgkTu2dcCXohvmCKBIoeTgIdZx9fZHR4wWGVbkPk1ys3KENPnUlUs7381/JfH8+Mfd8O5
	JjyCbAbPYAOAd6QOurhtx2XIx/wTFSLBt3FgYyNiLiVGt4UWWBAZ6ndiKwsnDPdjhRInRO+n76/F2
	yEgtMCoDMQvXc+lrFuEGluyHTlIQdPOrCBUxMRXmYTQFN4VPxynw4E2psUG9n1AMYR6yW3Sx1GzLk
	C/tmWBtCBLaZsM2RPwTUfn4v4gMPvNN539PSadUrBLx3fQf/UUdajyRWm51SjLfhDpMi12IRAFK2i
	n4pNKzuNyHizNjxBn2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsj-00000003vMt-40lM;
	Fri, 16 Oct 2026 19:46:21 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsg-00000003vL9-401T
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:20 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30b6dad2382so774836eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179978; x=1792784778; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiRo02OA1IxHJkhQCnHi5URLw0bi6CvLtMWBM69Y8xM=;
        b=Hd1E7w/e5LQrlPT3uookkXF3JffucdO8eN7aOMLyac7Vx/SfAe/IJQI2pZuuX0Zbh9
         a1pISFcwYgwmDwVXkbSSFK3Sn75kVzpJsH2jX+PDtCOVqnyqvbn3B17AJFmRBtO+2B9b
         h9PEY5OeZAzcFxc6EUYmU0W4hIRiRSdxsWtM1YVErMDT+QHkFOMuucADqQAIHnHfNW8l
         NpMlFZFtO7ilHOKQDjDmPNnakdKBhbTE77eeCGmPWufMCWXM4NMZxpESr0NFEJmBJmwG
         TfGQnQwIQFtLIuvkwjtGg10SJi19sVSbxJppfqhpsU8RdE4y3psUp6At4jPiGaSJ1MdF
         1K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179978; x=1792784778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiRo02OA1IxHJkhQCnHi5URLw0bi6CvLtMWBM69Y8xM=;
        b=osj1Rftik+NYA4fmCuTmqtLv/EfuMvUQc4zypleLYR5P+qkB1bdZw335p/IikMqU3Q
         ATBTB98E4VpVC/paLTYO1SSUj5e3ePZ4f/fjxChVo+66ipv7j2ySMsZBqtp+S8571Xka
         EfFeku6KVkm2z0666g3ZO4SRjifPzWwkFTJTI2leg/h5BjtB38TBr5DwF6aRvF4ja50+
         slSwR9PFlP8omvBosoBpzhCEkG+TjvItdqQbZ3Is/bqD5cTgDZ9S0CCOZo3AiPS7wpYO
         ZYizlkM6Xq5McSXTdQ2zb/VIQiIhzBGfBp9cyHjki8bsa724GDkQSpJN3qQ9asTj6Lxf
         BkjA==
X-Forwarded-Encrypted: i=1; AKwUvBzXOrtV6yPvHV4u48wsSCzZr+TVjmwobpWt+MnB3EBgEAIiOg2HNEkOxyCUpEql5A/1Tf3z8UrNSDYoYQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKY20BLk7mrZSgXyjQ0dE/BAuESYb7BKoPhEYX5aq+CmCi5Zh8d
	J2dJvlQTfIl/rQopJVgud5U+F6JUT+/CsWesVeUz9fWSgCbHtqPdAN87
X-Gm-Gg: AYBFou1YKm9cl6JwHWsC6APcbe+FgaxJt1sVk1LuycZM08tPjAfB6DNPahfUNvL/B+s
	hNrV01kVHBafB50Nwp6sRR/qO8WB/rELWSZvApxJeYRs1h5+OnYXsGNobr4OlovOHBDk5oZAcsg
	e+/yVH83cvNjMgIkw25WgPVpqXDYUizEZHq9flgMJIU76TSD5zZcHv3+BcYeg5xrekOkfwcl0ym
	OFz6FBwYQyKDeUclosOLW5g2Zr/1YwcbAeWXA2n2mY0qxhWOUZ0p/HpjtEnegTTiqZ5+/4QO/vy
	sHnVnII7uwkAEXu6fThr7lwKeZyD+9nsUMQ93zRNANYRreC022fyhVtsO7pfL+s2dl3Nfs7ibR2
	OkTBp26u6ZCrsAqbSMTu3XwaKPKpDpS9D35T1cz4mr2P/o4YkgbxcmJ7S4lvAzMXn+wephe/XXX
	Bf081UOiE5tb/Mwt94PiQ4XsubcV12SqyTG0tU/cqYyouZVp5Mg/UjENp9Pi2lF+BE
X-Received: by 2002:a05:701b:2712:b0:151:ece6:b16b with SMTP id a92af1059eb24-18512c38159mr1013993c88.7.1792179977759;
        Fri, 16 Oct 2026 12:46:17 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:16 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] arm64/gcs: release GCS on failed fork
Date: Fri, 16 Oct 2026 16:46:00 -0300
Message-ID: <2539f61f79a6053e2a33a1d1ae9df09013c04bd8.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124618_999524_2A345C27 
X-CRM114-Status: GOOD (  15.14  )
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

Y29weV90aHJlYWQoKSBtYXBzIGEgR0NTIGZvciBhIENMT05FX1ZNIGNoaWxkIGFuZCBjYW4gc3Rp
bGwgcmV0dXJuCjAuIEEgbGF0ZXIgY29weV9wcm9jZXNzKCkgZmFpbHVyZSB0aGVuIGdvZXMgdGhy
b3VnaApiYWRfZm9ya19jbGVhbnVwX3RocmVhZCwgd2hpY2ggY2FsbHMgZXhpdF90aHJlYWQoKS4g
VGhlIGhvbGUgdGhpcwpzZXJpZXMgaGl0cyBpcyBjbG9uZTMoQ0xPTkVfVk18Q0xPTkVfUElERkQp
IHdoZW4gcHV0X3VzZXIoKSBvZiB0aGUKcGlkZmQgZmFpbHMgYWZ0ZXIgdGhhdCBtYXBwaW5nLiBh
cm02NCBkaWQgbm90IGltcGxlbWVudApleGl0X3RocmVhZCgpLiBkZWFjdGl2YXRlX21tKCkgaXMg
d2hhdCBub3JtYWxseSBjYWxscyBnY3NfZnJlZSgpLAphbmQgaXQgZG9lcyBub3QgcnVuIG9uIHRo
aXMgcGF0aC4gRWFjaCByZWplY3RlZCBjbG9uZSBsZWF2ZXMgb25lCkdDUyBWTUEgaW4gdGhlIHBh
cmVudCdzIG1tIHVudGlsIHRoZSBtbSBkaWVzLgoKU2VsZWN0IEhBVkVfRVhJVF9USFJFQUQgYW5k
IGZyZWUgdGhlIGNoaWxkJ3MgR0NTIGZyb20KZXhpdF90aHJlYWQoKS4gZ2NzX2ZyZWUoKSBhbHJl
YWR5IGlnbm9yZXMgYSBjbGVhcmVkIGJhc2UgYW5kIGEKZGlmZmVyZW50IG1tLCBzbyB0aGUgdXN1
YWwgZXhpdCBwYXRoIChkZWFjdGl2YXRlX21tKCkgdGhlbiB0aGlzKSBpcwphIG5vLW9wIHRoZSBz
ZWNvbmQgdGltZS4gY29weV90aHJlYWRfZ2NzKCkgemVyb3MgdGhlIGluaGVyaXRlZAp0cmFja2lu
ZyBiZWZvcmUgYSB1c2VyLXRocmVhZCBhbGxvY2F0aW9uLCBzbyBhbiBhbGxvY2F0aW9uIGVycm9y
CnN0aWxsIHNraXBzIGV4aXRfdGhyZWFkKCkgd2l0aCBub3RoaW5nIHRvIHVubWFwLgoKQSBrdGhy
ZWFkIGNvcGllcyB0aGUgY2FsbGVyJ3MgR0NTIGZpZWxkcyB2aWEgYXJjaF9kdXBfdGFza19zdHJ1
Y3QoKS4Ka2VybmVsX3RocmVhZCgpIHVzZXMgQ0xPTkVfVk0sIHNvIGR1cmluZyBhIGZhaWxlZCBj
b3B5X3Byb2Nlc3MoKQp0aGUgY2hpbGQgc3RpbGwgc2hhcmVzIHRoZSBjYWxsZXIncyBtbSBhbmQg
Z2NzX2ZyZWUoKSdzIG1tIGNoZWNrCmRvZXMgbm90IHNhdmUgdXMuIENsZWFyIHRoZSBpbmhlcml0
ZWQgdHJhY2tpbmcgYXMgcGFydCBvZiBrdGhyZWFkCnNldHVwLgoKVGVzdGVkIHdpdGggQ09ORklH
X0FSTTY0X0dDUyBvbiBRRU1VIDExLjEuMiAtbWFjaGluZSB2aXJ0IC1jcHUgbWF4LgpTaXh0ZWVu
IGNsb25lMygpIGNhbGxzIHdpdGggQ0xPTkVfVk18Q0xPTkVfUElERkQgYW5kIGFuIHVud3JpdGFi
bGUKcGlkZmQgcG9pbnRlciBsZWFrZWQgMTYgR0NTIFZNQXMgd2l0aG91dCB0aGUgZml4LiBXaXRo
IGl0LCB0aGUgVk1BCmNvdW50IHdhcyB1bmNoYW5nZWQgYW5kIGNhbGwvcmV0dXJuIG9uIHRoZSBw
YXJlbnQgc3RpbGwgdXNlZCB0aGUKb3JpZ2luYWwgR0NTLiBBIHN1Y2Nlc3NmdWwgY2xvbmUzIGNo
aWxkIGV4aXQgd2l0aCB0aGUgc2FtZSBmbGFncwpydW5zIGRlYWN0aXZhdGVfbW0oKSBhbmQgdGhl
biBleGl0X3RocmVhZCgpLgoKRml4ZXM6IDUwNjQ5NmJjYmI0MiAoImFybTY0L2djczogRW5zdXJl
IHRoYXQgbmV3IHRocmVhZHMgaGF2ZSBhIEdDUyIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
CkNjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+CkFzc2lzdGVkLWJ5OiBMTE0KU2ln
bmVkLW9mZi1ieTogSXbDoW4gRXplcXVpZWwgUm9kcmlndWV6IDxpdmFucndjbTI1QGdtYWlsLmNv
bT4KLS0tCiBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgfCAgMSArCiBhcmNoL2FybTY0L2tl
cm5lbC9wcm9jZXNzLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZyBiL2Fy
Y2gvYXJtNjQvS2NvbmZpZwppbmRleCBjYWI3NDFhNjk1ZjUuLmM3ZmM3OTQwOWY5OCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCisrKyBiL2FyY2gvYXJtNjQvS2NvbmZpZwpAQCAtMTc3
LDYgKzE3Nyw3IEBAIGNvbmZpZyBBUk02NAogCXNlbGVjdCBIQVZFX0FSTV9TTUNDQwogCXNlbGVj
dCBIQVZFX0FTTV9NT0RWRVJTSU9OUwogCXNlbGVjdCBIQVZFX0VCUEZfSklUCisJc2VsZWN0IEhB
VkVfRVhJVF9USFJFQUQKIAlzZWxlY3QgSEFWRV9DX1JFQ09SRE1DT1VOVAogCXNlbGVjdCBIQVZF
X0NNUFhDSEdfRE9VQkxFCiAJc2VsZWN0IEhBVkVfQ01QWENIR19MT0NBTApkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5j
CmluZGV4IDU4MWY4MGU5YjliNy4uZWI1MzE0YjRiNDJiIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0
L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0z
NDEsNiArMzQxLDE2IEBAIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCiAJZmx1c2hfZ2NzKCk7CiB9
CiAKK3ZvaWQgZXhpdF90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCit7CisJLyoKKwkg
KiBjb3B5X3Byb2Nlc3MoKSBjYWxscyB0aGlzIGFmdGVyIGNvcHlfdGhyZWFkKCkgcmV0dXJucyAw
LgorCSAqIGRlYWN0aXZhdGVfbW0oKSBkb2VzIG5vdCBydW4gb24gdGhhdCBmYWlsdXJlIHBhdGgu
CisJICogZ2NzX2ZyZWUoKSBpcyBhIG5vLW9wIG9uY2UgZ2NzX2Jhc2UgaXMgY2xlYXJlZC4KKwkg
Ki8KKwlnY3NfZnJlZSh0c2spOworfQorCiB2b2lkIGFyY2hfcmVsZWFzZV90YXNrX3N0cnVjdChz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKIHsKIAlmcHNpbWRfcmVsZWFzZV90YXNrKHRzayk7CkBA
IC01MDMsNiArNTEzLDE3IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAs
IGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKIAogCQlwLT50aHJlYWQuY3B1
X2NvbnRleHQueDE5ID0gKHVuc2lnbmVkIGxvbmcpYXJncy0+Zm47CiAJCXAtPnRocmVhZC5jcHVf
Y29udGV4dC54MjAgPSAodW5zaWduZWQgbG9uZylhcmdzLT5mbl9hcmc7CisjaWZkZWYgQ09ORklH
X0FSTTY0X0dDUworCQkvKgorCQkgKiBrZXJuZWxfdGhyZWFkKCkgdXNlcyBDTE9ORV9WTSwgc28g
YSBmYWlsZWQKKwkJICogY29weV9wcm9jZXNzKCkgc3RpbGwgc2hhcmVzIHRoZSBjYWxsZXIncyBt
bS4KKwkJICogSW5oZXJpdGVkIEdDUyB0cmFja2luZyB3b3VsZCB0aGVuIGxvb2sgbGlrZSBhCisJ
CSAqIGNoaWxkIG1hcHBpbmcgdG8gZ2NzX2ZyZWUoKS4KKwkJICovCisJCXAtPnRocmVhZC5nY3Nf
YmFzZSA9IDA7CisJCXAtPnRocmVhZC5nY3Nfc2l6ZSA9IDA7CisJCXAtPnRocmVhZC5nY3Nwcl9l
bDAgPSAwOworI2VuZGlmCiAKIAkJaWYgKHN5c3RlbV9zdXBwb3J0c19wb2UoKSkKIAkJCXAtPnRo
cmVhZC5wb3JfZWwwID0gUE9SX0VMMF9JTklUOwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
