Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2668AEE2094
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFohkilic67s6HD5nYmashZ09sUu9mz2yHkX9vKrOQ8=; b=meqYoF0Z2ZbhGm
	Vtp4/2UH0R1JqHU5vUdXuK3iM+KUDwDAYqYyFaxnqwCBgcfTZpgiSU2oEcmcuCHpYmuDoUx/bW+DH
	7kYlksogdKSbiydfSAmh+fd+5x3w3l07qiIBNieXrcMc0nokxHWRmPfLydkHkrHcVo7V6sRMPK+bN
	XssDyeT82RT5ctLTYvbcxW2FdYgwjPlaK+758BpmEObpPH2g/pD0nW44go7mKXkuNX+IeVZyDeBUh
	e/q/skl7yOBgK9EhG4rXsNpwRqDObiocvIkqmbzwwO9ou6T/vD0cGTtgFz6kK1U5PAU0uaGzW1vOz
	nP0aPYrVzT0KOYWGspKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKpE-0000000BIN6-2UgR;
	Fri, 06 Feb 2026 12:20:40 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKpC-0000000BIMj-1X2s
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:20:39 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so1728918a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 04:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380437; x=1770985237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5ZW0Lp2uS+rJ6cqos6DM9CIgCyO+gQDhoGFyA1Jyks=;
        b=KUK80Ro2/qhD57HLM3YDBPSH/iXMpKGlRDitlq9KAAJg0koTUHM6h1BuAZ7/+mfwYb
         /8aWJb1IitjqT4YDxhgI8oyWvuZAqGYv2WjHUTvSCthdGhyXX+9/d8/I64xZKBA1BBIy
         S1k3ImuUv0YH0qVgzkZgavZpdxzAXD1Jft8Kj1zYBeq5hyUEam5be1o68sirQWvgvDhD
         f0VN3A8kgiA+Tus9EZ8gtsFs96ID+VeHmUJT0QDbg4h5mBtcVeVlAMh9lD+Tl5DW+OpO
         ZKhPAYk4KWY0oAzpkaDuB4mr4/mQ+3G/LY/sUqzLLJEJyX+jwkA3ttI1mxqQPdRrHMMk
         np3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380437; x=1770985237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5ZW0Lp2uS+rJ6cqos6DM9CIgCyO+gQDhoGFyA1Jyks=;
        b=JVj6/I/kaUwSvZ5kequ8RId8MUf8HF3BnbtnVrEPjp92O9hagnCOFGLfgfqluCwIEj
         GPmB3eaymorCfVkNFAuUvx4iNz8XGbLY8Wd6RIGg3joX1N9zZQzvQtudYjRnEUFsKKdn
         6LBh5rgOb+zIfsJHsqeayH5Y0YOWLbxKEdD3T5LKR74+9RW7+4NvqJKXw5nAEJqwu5ZE
         DNuQ9jWhN6AAQG2EBFis3vMCMTnOWH0952MUqukkXYI15zgzKD0foKPl6WAIKHQHz4kA
         CxrmcOrKlv2VRhtaZQnozakEcGUW9J/BRlwUwmAeE21DNEnppxT+XE5lpDEydv6fVr6U
         r1wA==
X-Forwarded-Encrypted: i=1; AJvYcCXV3FrkFf11BtFskMUAD0E+Oh/2aXuSKEnaP0eP2X5aq9NotEMuOhRVCJnz4R2fSd3pbcgvBF8K4MiFow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUp/D2+umQNdP8WN9CH9WKjCO2xz89fhU8HuEw5HI8qah04zoO
	Z/HJ99WiSUvUlaOfSlTgoMXph3EmjSg/9g7lRjIb5S8Mxae8Q2FyZbIw
X-Gm-Gg: AZuq6aIFow+5eyzIStBoR+OzTsqiJI9ENoAXf17AZk6FRodOz7Kq7LZUA+0wYT8a6am
	J5EsLROlkf7jX9rSvWplyRkh2+d27/N6y4ibIUOypZPW5kcDjX5jd57fVL0x37bKvNk1CTQmFJO
	/XriNP4Z6Lx1HjY8xyutA422snN6BpxFD5lj/tdat/1+Yjw0NhhEqo5ZuO2GbX9gHCOyVS9kERW
	GHpNELFPUoG9Dks8V+riVptRNYwCYWx+wqoENzrKlLSLntADRBMrmoEUWO/YEiBQFY/O5TJLq2r
	3k75ndinAENtA88Ru6QYOyfoViO2fNwHz/YJ4xMIpJ3BczTu6g2q3KQvpnsbuYWLeyZ+XXWJo9I
	RG5T2wGEmo/3CuPNX9lg6ZtIeTAhfnH+2bq1jz1kF8LUZcwZh6SXVo/m6tUSBbN/x4JMONkOw/i
	qCn9vGvFXG
X-Received: by 2002:a17:90b:254a:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-354b3e4c67amr1926559a91.29.1770380437161;
        Fri, 06 Feb 2026 04:20:37 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b301d93bsm1528222a91.1.2026.02.06.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:20:36 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	bjorn@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiang.biao@linux.dev
Subject: [PATCH bpf-next v3 1/3] bpf, riscv: introduce emit_store_stack_imm64() for trampoline
Date: Fri,  6 Feb 2026 20:20:00 +0800
Message-ID: <20260206122002.1494125-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
References: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_042038_401800_A84E86BF 
X-CRM114-Status: GOOD (  11.88  )
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

SW50cm9kdWNlIGEgaGVscGVyIHRvIHN0b3JlIDY0LWJpdCBpbW1lZGlhdGUgb24gdGhlIHRyYW1w
b2xpbmUgc3RhY2sgd2l0aAphIGhlbHAgb2YgYSByZWdpc3Rlci4KClNpZ25lZC1vZmYtYnk6IE1l
bmdsb25nIERvbmcgPGRvbmdtbDJAY2hpbmF0ZWxlY29tLmNuPgpUZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyNSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggMzc4ODhhYmVlNzBj
Li5lNGY0NWUyZTdlMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtOTI2LDYgKzkyNiwx
NCBAQCBzdGF0aWMgdm9pZCByZXN0b3JlX3N0YWNrX2FyZ3MoaW50IG5yX3N0YWNrX2FyZ3MsIGlu
dCBhcmdzX29mZiwgaW50IHN0a19hcmdfb2ZmLAogCX0KIH0KIAorc3RhdGljIHZvaWQgZW1pdF9z
dG9yZV9zdGFja19pbW02NCh1OCByZWcsIGludCBzdGFja19vZmYsIHU2NCBpbW02NCwKKwkJCQkg
ICBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwkvKiBMb2FkIGltbTY0IGludG8gcmVn
IGFuZCBzdG9yZSBpdCBhdCBbRlAgKyBzdGFja19vZmZdLiAqLworCWVtaXRfaW1tKHJlZywgKHM2
NClpbW02NCwgY3R4KTsKKwllbWl0X3NkKFJWX1JFR19GUCwgc3RhY2tfb2ZmLCByZWcsIGN0eCk7
Cit9CisKIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBfbGluayAq
bCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mZiwKIAkJCSAgIGludCBydW5fY3R4X29mZiwg
Ym9vbCBzYXZlX3JldCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiB7CkBAIC05MzMsMTIg
Kzk0MSwxMCBAQCBzdGF0aWMgaW50IGludm9rZV9icGZfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xp
bmsgKmwsIGludCBhcmdzX29mZiwgaW50IHJldHZhbF9vZgogCXN0cnVjdCBicGZfcHJvZyAqcCA9
IGwtPmxpbmsucHJvZzsKIAlpbnQgY29va2llX29mZiA9IG9mZnNldG9mKHN0cnVjdCBicGZfdHJh
bXBfcnVuX2N0eCwgYnBmX2Nvb2tpZSk7CiAKLQlpZiAobC0+Y29va2llKSB7Ci0JCWVtaXRfaW1t
KFJWX1JFR19UMSwgbC0+Y29va2llLCBjdHgpOwotCQllbWl0X3NkKFJWX1JFR19GUCwgLXJ1bl9j
dHhfb2ZmICsgY29va2llX29mZiwgUlZfUkVHX1QxLCBjdHgpOwotCX0gZWxzZSB7CisJaWYgKGwt
PmNvb2tpZSkKKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1ydW5fY3R4X29m
ZiArIGNvb2tpZV9vZmYsIGwtPmNvb2tpZSwgY3R4KTsKKwllbHNlCiAJCWVtaXRfc2QoUlZfUkVH
X0ZQLCAtcnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBSVl9SRUdfWkVSTywgY3R4KTsKLQl9CiAK
IAkvKiBhcmcxOiBwcm9nICovCiAJZW1pdF9pbW0oUlZfUkVHX0EwLCAoY29uc3QgczY0KXAsIGN0
eCk7CkBAIC0xMTIzLDEzICsxMTI5LDEwIEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBm
X3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJZW1pdF9zZChSVl9SRUdf
RlAsIC1zcmVnX29mZiwgUlZfUkVHX1MxLCBjdHgpOwogCiAJLyogc3RvcmUgaXAgYWRkcmVzcyBv
ZiB0aGUgdHJhY2VkIGZ1bmN0aW9uICovCi0JaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfSVBfQVJH
KSB7Ci0JCWVtaXRfaW1tKFJWX1JFR19UMSwgKGNvbnN0IHM2NClmdW5jX2FkZHIsIGN0eCk7Ci0J
CWVtaXRfc2QoUlZfUkVHX0ZQLCAtaXBfb2ZmLCBSVl9SRUdfVDEsIGN0eCk7Ci0JfQorCWlmIChm
bGFncyAmIEJQRl9UUkFNUF9GX0lQX0FSRykKKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9S
RUdfVDEsIC1pcF9vZmYsICh1NjQpZnVuY19hZGRyLCBjdHgpOwogCi0JZW1pdF9saShSVl9SRUdf
VDEsIG5yX2FyZ19zbG90cywgY3R4KTsKLQllbWl0X3NkKFJWX1JFR19GUCwgLW5yZWdzX29mZiwg
UlZfUkVHX1QxLCBjdHgpOworCWVtaXRfc3RvcmVfc3RhY2tfaW1tNjQoUlZfUkVHX1QxLCAtbnJl
Z3Nfb2ZmLCBucl9hcmdfc2xvdHMsIGN0eCk7CiAKIAlzdG9yZV9hcmdzKG5yX2FyZ19zbG90cywg
YXJnc19vZmYsIGN0eCk7CiAKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
