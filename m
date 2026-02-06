Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504CEEE2091
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPFUqc65pwrNzOPzIKDsjK+W4lCaFWlK/nvaMCTSNlk=; b=GO3UMzu51FyJt/
	wbIDTgpBcblZopzfzFgljYOsOXa3PmtCNdzD4qHoBsCw7s5Ez8k2gc5rFCDhNTebCwvJNCEaeZhwq
	wVY/zQ/Ep8zUNkV/loYZJD5WJihr/4GbSfOfD8/H3lNsM7FuqYdtYr8kcXEKHGcMs9FtHuQu8vXyV
	g/PCN+TIHJb+voKYO3vUJPBCSgIwonh/FqFykUXpj0EjtCG/ST6w/pNr6yg4pJlC/0758BYnrFTD3
	g+sD3EyLPXj9Lh7opo2C0VAvARJj1Ry4HtKkNCIi5HUjBaGGQzRG4yoaKcC691dpoaweuD1GiiPt2
	l5Th8LSJtJJojKcMgyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKpS-0000000BIPD-3qtk;
	Fri, 06 Feb 2026 12:20:54 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKpO-0000000BIOL-2neW
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:20:53 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-82418b0178cso1245618b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 04:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380450; x=1770985250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4ky1VoxCCm0IDNE+FK0hSWCiQy7VCZX/E43cmszfqY=;
        b=dep2PLPrxz6YRvM64e9bY62SWlCU5pt+rqMa1Fii2EL7Oet1RkIC5XWnupRZqUyXIM
         ZO4wN1UNpF6iIrHvlf7h4doTpbx6yRr35XJ5xWIdjuGEmYwwcjIEbHQXw86l5N2tSOdH
         apk0lFbMUO9JXufEKUGXcjzPLyF5IJjnKcB9KJtjMe9gFa4mz1UXESn0LFVnJBiQBDr4
         oOp7nwyb/L9Uy4ZAtmhHh2zk6qjaWS22p/ihcBgN9qcL6fNM+Y2m/36Y+FPmHxG8rYlJ
         BoCeuSygGvU/uRz2sFkMuFG8wtU4fDp0SyQ+p8mAYc0UO8dcrx+c8S+TwEehsX74Qu8B
         cXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380450; x=1770985250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v4ky1VoxCCm0IDNE+FK0hSWCiQy7VCZX/E43cmszfqY=;
        b=XWSL7QjF03s1aKA2SZjDbUMeIqqnFXy0MG9Ek847AdAzvIzqacMZVYRU87ohR5+wlM
         BYcspAY9pU87/vbyRX3Bv0IzqcrPJvjxoKc+SJGhFNIowoAjKCNU9WD30Fvne9Due4Ac
         RELJm42DcuqV2qBc6vwtHOJwvCLUK0w4Q46YYcaV026P/QptSFlUwYilhc2vvpgx+bmx
         doiUnRgVNWJtee5efGpxz6uFD2CuMsxQf5IAdTM8+AB8fTgBCtUxvFGFvVLHaViDRm2h
         i6yVoRf7oTGU/STURU8o1fz/JK3LtJesqvUYlh6FitKqrslOZEVADf1/p2Yo4WOz+NNz
         JYJA==
X-Forwarded-Encrypted: i=1; AJvYcCUrRAoZZqbVrB1keEpKyPDnm8/EHDYWcoYijdOeHpXQsqeAi7Z5+XoP9xg+A6+LfxiSr8LGVkh+2Y7elQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ2pA0DM+dhv1YwYgMPJPSdL9XuEWVvz7Tn5+PEjESpa7yMBzw
	o3qG7I7jYWBR2aHiMT43nOH/OlMrbm+/p0Rr2Qr95626t1DQB1aeBvG/
X-Gm-Gg: AZuq6aK+lTNrAzB6YLE7SRDn3FA6CBbQH76ZvP2x3AIl7joJnPn2tPGEYDWLEEuU08v
	YcX6IrB+yPF5kLEjRQhbZcstehu6sd4Pj/xjO6PtBKAzXy0gGhxALbQ/Zh7DKXj8JxhN1mlXakE
	8HMdXdKzzmCJe9m6x/2NBG5wJVW+GTrxuYCRLbAoA6KYJpXY4wFT3LJywB0EQTP5AxavnOpz5AN
	cgHavhpCWroM7bw0ywWC1At+1BdGBMiWjLBL+uWbDBlNnxcNxF4aua56ebIMiZfOHyWK+8vp95w
	lZ3vC6xW7V7FhG3ZGNUZuqkXSzZEqIMQ3ECnj2qVuheYcOsxBnKqZCAn55HBrPMMB04J4hO7NtG
	b+dh2MzOY3qqAtFiSiGpob27DamCICCWuFdzOS+X3SKQn9SY3RdBWvlFukup22jzcrRxKjcvu/q
	p84/aJHdl08XAPRLUJT+A=
X-Received: by 2002:a05:6a21:150c:b0:384:d0fc:f518 with SMTP id adf61e73a8af0-393ad44eef8mr2481014637.79.1770380449503;
        Fri, 06 Feb 2026 04:20:49 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b301d93bsm1528222a91.1.2026.02.06.04.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:20:49 -0800 (PST)
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
Subject: [PATCH bpf-next v3 2/3] bpf, riscv: add fsession support for trampolines
Date: Fri,  6 Feb 2026 20:20:01 +0800
Message-ID: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
References: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_042052_499664_25F8B738 
X-CRM114-Status: GOOD (  15.72  )
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

SW1wbGVtZW50IEJQRl9UUkFDRV9GU0VTU0lPTiBzdXBwb3J0IGluIHRoZSBSSVNDLVYgdHJhbXBv
bGluZSBKSVQuIFRoZQpsb2dpYyBoZXJlIGlzIHNpbWlsYXIgdG8gd2hhdCB3ZSBkaWQgaW4geDg2
XzY0LgoKSW4gb3JkZXIgdG8gc2ltcGx5IHRoZSBsb2dpYywgd2UgZmFjdG9yIG91dCB0aGUgZnVu
Y3Rpb24gaW52b2tlX2JwZigpIGZvcgpmZW50cnkgYW5kIGZleGl0LgoKU2lnbmVkLW9mZi1ieTog
TWVuZ2xvbmcgRG9uZyA8ZG9uZ21sMkBjaGluYXRlbGVjb20uY24+ClRlc3RlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QGtlcm5lbC5vcmc+Ci0tLQp2MzoKLSByZW1vdmUgdGhlICJhbHdheXMiIGZyb20gdGhlIGNvbW1l
bnQKCnYyOgotIHVzZSBicGZfcHJvZ19jYWxsc19zZXNzaW9uX2Nvb2tpZSgpIGluIGludm9rZV9i
cGYoKQotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCA3NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwppbmRleCBlNGY0NWUyZTdl
MmYuLmQ0NWZhOWM2YTdkZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCkBAIC05OTYsNiArOTk2
LDI5IEBAIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBfbGluayAq
bCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGlj
IGludCBpbnZva2VfYnBmKHN0cnVjdCBicGZfdHJhbXBfbGlua3MgKnRsLCBpbnQgYXJnc19vZmYs
IGludCByZXR2YWxfb2ZmLAorCQkgICAgICBpbnQgcnVuX2N0eF9vZmYsIGludCBmdW5jX21ldGFf
b2ZmLCBib29sIHNhdmVfcmV0LCB1NjQgZnVuY19tZXRhLAorCQkgICAgICBpbnQgY29va2llX29m
Ziwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCit7CisJaW50IGksIGN1cl9jb29raWUgPSAo
Y29va2llX29mZiAtIGFyZ3Nfb2ZmKSAvIDg7CisKKwlmb3IgKGkgPSAwOyBpIDwgdGwtPm5yX2xp
bmtzOyBpKyspIHsKKwkJaW50IGVycjsKKworCQlpZiAoYnBmX3Byb2dfY2FsbHNfc2Vzc2lvbl9j
b29raWUoJnRsLT5saW5rc1tpXSkpIHsKKwkJCXU2NCBtZXRhID0gZnVuY19tZXRhIHwgKCh1NjQp
Y3VyX2Nvb2tpZSA8PCBCUEZfVFJBTVBfQ09PS0lFX0lOREVYX1NISUZUKTsKKworCQkJZW1pdF9z
dG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1mdW5jX21ldGFfb2ZmLCBtZXRhLCBjdHgpOwor
CQkJY3VyX2Nvb2tpZS0tOworCQl9CisJCWVyciA9IGludm9rZV9icGZfcHJvZyh0bC0+bGlua3Nb
aV0sIGFyZ3Nfb2ZmLCByZXR2YWxfb2ZmLCBydW5fY3R4X29mZiwKKwkJCQkgICAgICBzYXZlX3Jl
dCwgY3R4KTsKKwkJaWYgKGVycikKKwkJCXJldHVybiBlcnI7CisJfQorCXJldHVybiAwOworfQor
CiBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJh
bXBfaW1hZ2UgKmltLAogCQkJCQkgY29uc3Qgc3RydWN0IGJ0Zl9mdW5jX21vZGVsICptLAogCQkJ
CQkgc3RydWN0IGJwZl90cmFtcF9saW5rcyAqdGxpbmtzLApAQCAtMTAwNSwxMyArMTAyOCwxNSBA
QCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJh
bXBfaW1hZ2UgKmltLAogCWludCBpLCByZXQsIG9mZnNldDsKIAlpbnQgKmJyYW5jaGVzX29mZiA9
IE5VTEw7CiAJaW50IHN0YWNrX3NpemUgPSAwLCBucl9hcmdfc2xvdHMgPSAwOwotCWludCByZXR2
YWxfb2ZmLCBhcmdzX29mZiwgbnJlZ3Nfb2ZmLCBpcF9vZmYsIHJ1bl9jdHhfb2ZmLCBzcmVnX29m
Ziwgc3RrX2FyZ19vZmY7CisJaW50IHJldHZhbF9vZmYsIGFyZ3Nfb2ZmLCBmdW5jX21ldGFfb2Zm
LCBpcF9vZmYsIHJ1bl9jdHhfb2ZmLCBzcmVnX29mZiwgc3RrX2FyZ19vZmY7CisJaW50IGNvb2tp
ZV9vZmYsIGNvb2tpZV9jbnQ7CiAJc3RydWN0IGJwZl90cmFtcF9saW5rcyAqZmVudHJ5ID0gJnRs
aW5rc1tCUEZfVFJBTVBfRkVOVFJZXTsKIAlzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtzICpmZXhpdCA9
ICZ0bGlua3NbQlBGX1RSQU1QX0ZFWElUXTsKIAlzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtzICpmbW9k
X3JldCA9ICZ0bGlua3NbQlBGX1RSQU1QX01PRElGWV9SRVRVUk5dOwogCWJvb2wgaXNfc3RydWN0
X29wcyA9IGZsYWdzICYgQlBGX1RSQU1QX0ZfSU5ESVJFQ1Q7CiAJdm9pZCAqb3JpZ19jYWxsID0g
ZnVuY19hZGRyOwogCWJvb2wgc2F2ZV9yZXQ7CisJdTY0IGZ1bmNfbWV0YTsKIAl1MzIgaW5zbjsK
IAogCS8qIFR3byB0eXBlcyBvZiBnZW5lcmF0ZWQgdHJhbXBvbGluZSBzdGFjayBsYXlvdXQ6CkBA
IC0xMDQyLDEwICsxMDY3LDE0IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1w
b2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJICogICAgICAgICAgICAgICAgICBb
IC4uLiAgICAgICAgICAgICAgIF0KIAkgKiBGUCAtIGFyZ3Nfb2ZmICAgIFsgYXJnMSAgICAgICAg
ICAgICAgXQogCSAqCi0JICogRlAgLSBucmVnc19vZmYgICBbIHJlZ3MgY291bnQgICAgICAgIF0K
KwkgKiBGUCAtIGZ1bmNfbWV0YV9vZmYgWyByZWdzIGNvdW50LCBldGMgXQogCSAqCiAJICogRlAg
LSBpcF9vZmYgICAgICBbIHRyYWNlZCBmdW5jCV0gQlBGX1RSQU1QX0ZfSVBfQVJHCiAJICoKKwkg
KiAgICAgICAgICAgICAgICAgIFsgc3RhY2sgY29va2llIE4gICAgXQorCSAqICAgICAgICAgICAg
ICAgICAgWyAuLi4gICAgICAgICAgICAgICBdCisJICogRlAgLSBjb29raWVfb2ZmICBbIHN0YWNr
IGNvb2tpZSAxICAgIF0KKwkgKgogCSAqIEZQIC0gcnVuX2N0eF9vZmYgWyBicGZfdHJhbXBfcnVu
X2N0eCBdCiAJICoKIAkgKiBGUCAtIHNyZWdfb2ZmICAgIFsgY2FsbGVlIHNhdmVkIHJlZwldCkBA
IC0xMDc3LDE0ICsxMTA2LDIwIEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1w
b2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJc3RhY2tfc2l6ZSArPSBucl9hcmdf
c2xvdHMgKiA4OwogCWFyZ3Nfb2ZmID0gc3RhY2tfc2l6ZTsKIAorCS8qIGZ1bmN0aW9uIG1ldGFk
YXRhLCBzdWNoIGFzIHJlZ3MgY291bnQgKi8KIAlzdGFja19zaXplICs9IDg7Ci0JbnJlZ3Nfb2Zm
ID0gc3RhY2tfc2l6ZTsKKwlmdW5jX21ldGFfb2ZmID0gc3RhY2tfc2l6ZTsKIAogCWlmIChmbGFn
cyAmIEJQRl9UUkFNUF9GX0lQX0FSRykgewogCQlzdGFja19zaXplICs9IDg7CiAJCWlwX29mZiA9
IHN0YWNrX3NpemU7CiAJfQogCisJY29va2llX2NudCA9IGJwZl9mc2Vzc2lvbl9jb29raWVfY250
KHRsaW5rcyk7CisJLyogcm9vbSBmb3Igc2Vzc2lvbiBjb29raWVzICovCisJc3RhY2tfc2l6ZSAr
PSBjb29raWVfY250ICogODsKKwljb29raWVfb2ZmID0gc3RhY2tfc2l6ZTsKKwogCXN0YWNrX3Np
emUgKz0gcm91bmRfdXAoc2l6ZW9mKHN0cnVjdCBicGZfdHJhbXBfcnVuX2N0eCksIDgpOwogCXJ1
bl9jdHhfb2ZmID0gc3RhY2tfc2l6ZTsKIApAQCAtMTEzMiwxMCArMTE2NywxOSBAQCBzdGF0aWMg
aW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJhbXBfaW1hZ2Ug
KmltLAogCWlmIChmbGFncyAmIEJQRl9UUkFNUF9GX0lQX0FSRykKIAkJZW1pdF9zdG9yZV9zdGFj
a19pbW02NChSVl9SRUdfVDEsIC1pcF9vZmYsICh1NjQpZnVuY19hZGRyLCBjdHgpOwogCi0JZW1p
dF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1ucmVnc19vZmYsIG5yX2FyZ19zbG90cywg
Y3R4KTsKKwlmdW5jX21ldGEgPSBucl9hcmdfc2xvdHM7CisJZW1pdF9zdG9yZV9zdGFja19pbW02
NChSVl9SRUdfVDEsIC1mdW5jX21ldGFfb2ZmLCBmdW5jX21ldGEsIGN0eCk7CiAKIAlzdG9yZV9h
cmdzKG5yX2FyZ19zbG90cywgYXJnc19vZmYsIGN0eCk7CiAKKwlpZiAoYnBmX2ZzZXNzaW9uX2Nu
dCh0bGlua3MpKSB7CisJCS8qIGNsZWFyIGFsbCBzZXNzaW9uIGNvb2tpZXMnIHZhbHVlICovCisJ
CWZvciAoaSA9IDA7IGkgPCBjb29raWVfY250OyBpKyspCisJCQllbWl0X3NkKFJWX1JFR19GUCwg
LWNvb2tpZV9vZmYgKyA4ICogaSwgUlZfUkVHX1pFUk8sIGN0eCk7CisJCS8qIGNsZWFyIHJldHVy
biB2YWx1ZSB0byBtYWtlIHN1cmUgZmVudHJ5IGFsd2F5cyBnZXQgMCAqLworCQllbWl0X3NkKFJW
X1JFR19GUCwgLXJldHZhbF9vZmYsIFJWX1JFR19aRVJPLCBjdHgpOworCX0KKwogCWlmIChmbGFn
cyAmIEJQRl9UUkFNUF9GX0NBTExfT1JJRykgewogCQllbWl0X2ltbShSVl9SRUdfQTAsIGN0eC0+
aW5zbnMgPyAoY29uc3QgczY0KWltIDogUlZfTUFYX0NPVU5UX0lNTSwgY3R4KTsKIAkJcmV0ID0g
ZW1pdF9jYWxsKChjb25zdCB1NjQpX19icGZfdHJhbXBfZW50ZXIsIHRydWUsIGN0eCk7CkBAIC0x
MTQzLDkgKzExODcsOSBAQCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5l
KHN0cnVjdCBicGZfdHJhbXBfaW1hZ2UgKmltLAogCQkJcmV0dXJuIHJldDsKIAl9CiAKLQlmb3Ig
KGkgPSAwOyBpIDwgZmVudHJ5LT5ucl9saW5rczsgaSsrKSB7Ci0JCXJldCA9IGludm9rZV9icGZf
cHJvZyhmZW50cnktPmxpbmtzW2ldLCBhcmdzX29mZiwgcmV0dmFsX29mZiwgcnVuX2N0eF9vZmYs
Ci0JCQkJICAgICAgZmxhZ3MgJiBCUEZfVFJBTVBfRl9SRVRfRkVOVFJZX1JFVCwgY3R4KTsKKwlp
ZiAoZmVudHJ5LT5ucl9saW5rcykgeworCQlyZXQgPSBpbnZva2VfYnBmKGZlbnRyeSwgYXJnc19v
ZmYsIHJldHZhbF9vZmYsIHJ1bl9jdHhfb2ZmLCBmdW5jX21ldGFfb2ZmLAorCQkJCSBmbGFncyAm
IEJQRl9UUkFNUF9GX1JFVF9GRU5UUllfUkVULCBmdW5jX21ldGEsIGNvb2tpZV9vZmYsIGN0eCk7
CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0KQEAgLTExOTIsOSArMTIzNiwxNCBAQCBz
dGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJhbXBf
aW1hZ2UgKmltLAogCQkqKHUzMiAqKShjdHgtPmluc25zICsgYnJhbmNoZXNfb2ZmW2ldKSA9IGlu
c247CiAJfQogCi0JZm9yIChpID0gMDsgaSA8IGZleGl0LT5ucl9saW5rczsgaSsrKSB7Ci0JCXJl
dCA9IGludm9rZV9icGZfcHJvZyhmZXhpdC0+bGlua3NbaV0sIGFyZ3Nfb2ZmLCByZXR2YWxfb2Zm
LAotCQkJCSAgICAgIHJ1bl9jdHhfb2ZmLCBmYWxzZSwgY3R4KTsKKwkvKiBzZXQgImlzX3JldHVy
biIgZmxhZyBmb3IgZnNlc3Npb24gKi8KKwlmdW5jX21ldGEgfD0gKDFVTEwgPDwgQlBGX1RSQU1Q
X0lTX1JFVFVSTl9TSElGVCk7CisJaWYgKGJwZl9mc2Vzc2lvbl9jbnQodGxpbmtzKSkKKwkJZW1p
dF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1mdW5jX21ldGFfb2ZmLCBmdW5jX21ldGEs
IGN0eCk7CisKKwlpZiAoZmV4aXQtPm5yX2xpbmtzKSB7CisJCXJldCA9IGludm9rZV9icGYoZmV4
aXQsIGFyZ3Nfb2ZmLCByZXR2YWxfb2ZmLCBydW5fY3R4X29mZiwgZnVuY19tZXRhX29mZiwKKwkJ
CQkgZmFsc2UsIGZ1bmNfbWV0YSwgY29va2llX29mZiwgY3R4KTsKIAkJaWYgKHJldCkKIAkJCWdv
dG8gb3V0OwogCX0KQEAgLTIwOTQsMyArMjE0Myw4IEBAIGJvb2wgYnBmX2ppdF9pbmxpbmVzX2hl
bHBlcl9jYWxsKHMzMiBpbW0pCiAJCXJldHVybiBmYWxzZTsKIAl9CiB9CisKK2Jvb2wgYnBmX2pp
dF9zdXBwb3J0c19mc2Vzc2lvbih2b2lkKQoreworCXJldHVybiB0cnVlOworfQotLSAKMi41My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
