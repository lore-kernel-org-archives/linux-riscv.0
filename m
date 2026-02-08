Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E9EF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLc6sVFnLWB9r2VVDIk5SnJZ3Dcs9wTnLrczGF9GvXE=; b=FpRwtGbIaSYU76
	HcJAFt7dzXaHDg5PRZjKE41WkyI753LnmClmYVfcazVHwT7EfHueJJ2gjRMIXW9zYFxSwqk39fP8z
	tKhuF7d8ubDJbbfQxP/izig07ofxaH7Sxumv3vZMM81f+Snllwm72texhnurQS+rBh2Ke078Mr/0R
	HcBKJXYyeoEWAc7HYHdQLp8g1YyQHpzU9jkl8gqs1tNchf99UJKb3wqiIt0JGgW0nen9EhtEj8Fuk
	mLznMd/J7klY5GaBBOOR5RPMct+SSZbepLhwYkF6ELhDg5cFq6BbTKxnXQuOaLcKcoghOIwGZvj3M
	MpqLYwMNWEs+mC4mHeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQg-0000000D31B-2O1a;
	Sun, 08 Feb 2026 05:33:54 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQe-0000000D30e-1Roh
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 05:33:53 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-8244c048d41so1361886b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 21:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770528831; x=1771133631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uauA93iGE6XFs9gPgdNEdhBRsdXEO6OJ0ct51+bwGaI=;
        b=ZYH9m+1xnhnUOVsHW0Lnuoe8VrI7MOkv5DEjZrjHdHSqYuLGlYzfb1cxKhptnkcOCj
         3hTWEj0s+3l3laCdUJuySUh0lwXBH0xe7AN1tFAwCBr/r5yvi/geYHOG6OlyeT55fedh
         SRleYdKz9VR5YfPauDlVbE0COZvPOk67tYBQSTjfrfZGbG9j3Ar+DgpjY75HuQBx7gFk
         7rGmp4qcfQ1eVhh6fEj3c8D8a76EuWeXWTpPmYCw/9taWRvG1YXucXX1t2WQ7uf2Fo26
         Jw3c+yWkJD7+kidCrQ5jaidsRMR6I2lNPi0LA0XJXyY8LtsnTaeFGxRgJezn/YaRP/u2
         lyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770528831; x=1771133631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uauA93iGE6XFs9gPgdNEdhBRsdXEO6OJ0ct51+bwGaI=;
        b=vkJj5jl/jbHTtOnuF32tlOA1BYuyRZt4QID2nxSZvTGgGRFyBjh7DspxoBBc2JzoDV
         v4sjw8OmSnoBPKMwsVsdd78atB3dmEfsGEh2A4usPFIQTyq6WwYBXOONnVr+aWwRPN2o
         fT3z8G81Auzt1HbXBF9LrsNcrO2iS8wDsid3T1OlNV06ntAKexv+WdV+VDOjsoL8i/ET
         5JC/ER49RhEaYLPkVMcPaU07oKf7clpM8bim2tnAiErH8cauNSpnXRXOtzih//InH2HH
         0djPEqFM7e+eR9deXCaG+/tODdrtHzx7rHiuZcrL4vulJVR4NsealhhSeiLH+nnk2FsH
         sunw==
X-Forwarded-Encrypted: i=1; AJvYcCVdV5pxmiEFPzTwPSlXn5sZo/URZhF1zlJiQCwFAuXEL0oDQSKHY8xMMsm+khvAERWufNUO4/sIBX1big==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNNnwudunNNZyA+D+G4Ftcj85cheZA1U5Zll+gN2nJ5zpgWvS4
	9F/U+kQT6t93id0ZYvKQSiDDUQMCMnfUyYxg7pvEsI6Gwl626Li+gBuM
X-Gm-Gg: AZuq6aIGR6haDMenTeRpF9yrZA/lm1ACUB/6C38S2EW0+V4S60w7ZFTGTEXtha0lR71
	lIt3W9uiAro7mou0EVE+JtgqLeM0jycutYv/8tL/u/TV8nfYBEZVUgIw61L58C4icIe9PPJFMT5
	sV6pYdXbHG4UMF4QwB/il5BVBgyRLuO5+8Qh2qpAOLok94oKP0Fj6j8OiOfMw5GM+7DHaa8ISL5
	vbUCDbbfxAR4iaOehiqSXKPpWf6CtARsLNbg59tt2SDhAviszXuMAGw5WvvSAZEzuF+XMLMqagu
	FsiWJmuZtvkxq9AiSi5N4C1wJ/yXg4C1bAxJ0qN5CI+N8sh/HJmRY09qc+JyioJo+tuiT8hClTb
	bg58FuEJTT92kplN06s/YeQ9+56HoVLNCypgZCSDpuuiW0K+VCJmaQfoOc8ZAFf5368Ue+UK6MJ
	aSPZUs01h3QS2WAwm6elc=
X-Received: by 2002:a05:6a00:3981:b0:81f:517a:56e7 with SMTP id d2e1a72fcca58-82441655315mr6790986b3a.30.1770528831225;
        Sat, 07 Feb 2026 21:33:51 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418de80dsm6067700b3a.62.2026.02.07.21.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 21:33:50 -0800 (PST)
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
Subject: [PATCH bpf-next v4 2/3] bpf, riscv: add fsession support for trampolines
Date: Sun,  8 Feb 2026 13:33:10 +0800
Message-ID: <20260208053311.698352-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208053311.698352-1-dongml2@chinatelecom.cn>
References: <20260208053311.698352-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_213352_397440_7D1DFB33 
X-CRM114-Status: GOOD (  16.34  )
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
QGtlcm5lbC5vcmc+Ci0tLQp2NDoKLSBmaXggdGhlIGJ1aWxkIGVycm9yCgp2MzoKLSByZW1vdmUg
dGhlICJhbHdheXMiIGZyb20gdGhlIGNvbW1lbnQKCnYyOgotIHVzZSBicGZfcHJvZ19jYWxsc19z
ZXNzaW9uX2Nvb2tpZSgpIGluIGludm9rZV9icGYoKQotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYwppbmRleCBlNGY0NWUyZTdlMmYuLmYwNjViNDVlOGQ4ZiAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jCkBAIC05OTYsNiArOTk2LDI5IEBAIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9w
cm9nKHN0cnVjdCBicGZfdHJhbXBfbGluayAqbCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29m
CiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCBpbnZva2VfYnBmKHN0cnVjdCBicGZfdHJh
bXBfbGlua3MgKnRsLCBpbnQgYXJnc19vZmYsIGludCByZXR2YWxfb2ZmLAorCQkgICAgICBpbnQg
cnVuX2N0eF9vZmYsIGludCBmdW5jX21ldGFfb2ZmLCBib29sIHNhdmVfcmV0LCB1NjQgZnVuY19t
ZXRhLAorCQkgICAgICBpbnQgY29va2llX29mZiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgp
Cit7CisJaW50IGksIGN1cl9jb29raWUgPSAoY29va2llX29mZiAtIGFyZ3Nfb2ZmKSAvIDg7CisK
Kwlmb3IgKGkgPSAwOyBpIDwgdGwtPm5yX2xpbmtzOyBpKyspIHsKKwkJaW50IGVycjsKKworCQlp
ZiAoYnBmX3Byb2dfY2FsbHNfc2Vzc2lvbl9jb29raWUodGwtPmxpbmtzW2ldKSkgeworCQkJdTY0
IG1ldGEgPSBmdW5jX21ldGEgfCAoKHU2NCljdXJfY29va2llIDw8IEJQRl9UUkFNUF9DT09LSUVf
SU5ERVhfU0hJRlQpOworCisJCQllbWl0X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLWZ1
bmNfbWV0YV9vZmYsIG1ldGEsIGN0eCk7CisJCQljdXJfY29va2llLS07CisJCX0KKwkJZXJyID0g
aW52b2tlX2JwZl9wcm9nKHRsLT5saW5rc1tpXSwgYXJnc19vZmYsIHJldHZhbF9vZmYsIHJ1bl9j
dHhfb2ZmLAorCQkJCSAgICAgIHNhdmVfcmV0LCBjdHgpOworCQlpZiAoZXJyKQorCQkJcmV0dXJu
IGVycjsKKwl9CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBm
X3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJCQkJCSBjb25zdCBzdHJ1
Y3QgYnRmX2Z1bmNfbW9kZWwgKm0sCiAJCQkJCSBzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtzICp0bGlu
a3MsCkBAIC0xMDA1LDEzICsxMDI4LDE1IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBm
X3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJaW50IGksIHJldCwgb2Zm
c2V0OwogCWludCAqYnJhbmNoZXNfb2ZmID0gTlVMTDsKIAlpbnQgc3RhY2tfc2l6ZSA9IDAsIG5y
X2FyZ19zbG90cyA9IDA7Ci0JaW50IHJldHZhbF9vZmYsIGFyZ3Nfb2ZmLCBucmVnc19vZmYsIGlw
X29mZiwgcnVuX2N0eF9vZmYsIHNyZWdfb2ZmLCBzdGtfYXJnX29mZjsKKwlpbnQgcmV0dmFsX29m
ZiwgYXJnc19vZmYsIGZ1bmNfbWV0YV9vZmYsIGlwX29mZiwgcnVuX2N0eF9vZmYsIHNyZWdfb2Zm
LCBzdGtfYXJnX29mZjsKKwlpbnQgY29va2llX29mZiwgY29va2llX2NudDsKIAlzdHJ1Y3QgYnBm
X3RyYW1wX2xpbmtzICpmZW50cnkgPSAmdGxpbmtzW0JQRl9UUkFNUF9GRU5UUlldOwogCXN0cnVj
dCBicGZfdHJhbXBfbGlua3MgKmZleGl0ID0gJnRsaW5rc1tCUEZfVFJBTVBfRkVYSVRdOwogCXN0
cnVjdCBicGZfdHJhbXBfbGlua3MgKmZtb2RfcmV0ID0gJnRsaW5rc1tCUEZfVFJBTVBfTU9ESUZZ
X1JFVFVSTl07CiAJYm9vbCBpc19zdHJ1Y3Rfb3BzID0gZmxhZ3MgJiBCUEZfVFJBTVBfRl9JTkRJ
UkVDVDsKIAl2b2lkICpvcmlnX2NhbGwgPSBmdW5jX2FkZHI7CiAJYm9vbCBzYXZlX3JldDsKKwl1
NjQgZnVuY19tZXRhOwogCXUzMiBpbnNuOwogCiAJLyogVHdvIHR5cGVzIG9mIGdlbmVyYXRlZCB0
cmFtcG9saW5lIHN0YWNrIGxheW91dDoKQEAgLTEwNDIsMTAgKzEwNjcsMTQgQEAgc3RhdGljIGlu
dCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICpp
bSwKIAkgKiAgICAgICAgICAgICAgICAgIFsgLi4uICAgICAgICAgICAgICAgXQogCSAqIEZQIC0g
YXJnc19vZmYgICAgWyBhcmcxICAgICAgICAgICAgICBdCiAJICoKLQkgKiBGUCAtIG5yZWdzX29m
ZiAgIFsgcmVncyBjb3VudCAgICAgICAgXQorCSAqIEZQIC0gZnVuY19tZXRhX29mZiBbIHJlZ3Mg
Y291bnQsIGV0YyBdCiAJICoKIAkgKiBGUCAtIGlwX29mZiAgICAgIFsgdHJhY2VkIGZ1bmMJXSBC
UEZfVFJBTVBfRl9JUF9BUkcKIAkgKgorCSAqICAgICAgICAgICAgICAgICAgWyBzdGFjayBjb29r
aWUgTiAgICBdCisJICogICAgICAgICAgICAgICAgICBbIC4uLiAgICAgICAgICAgICAgIF0KKwkg
KiBGUCAtIGNvb2tpZV9vZmYgIFsgc3RhY2sgY29va2llIDEgICAgXQorCSAqCiAJICogRlAgLSBy
dW5fY3R4X29mZiBbIGJwZl90cmFtcF9ydW5fY3R4IF0KIAkgKgogCSAqIEZQIC0gc3JlZ19vZmYg
ICAgWyBjYWxsZWUgc2F2ZWQgcmVnCV0KQEAgLTEwNzcsMTQgKzExMDYsMjAgQEAgc3RhdGljIGlu
dCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICpp
bSwKIAlzdGFja19zaXplICs9IG5yX2FyZ19zbG90cyAqIDg7CiAJYXJnc19vZmYgPSBzdGFja19z
aXplOwogCisJLyogZnVuY3Rpb24gbWV0YWRhdGEsIHN1Y2ggYXMgcmVncyBjb3VudCAqLwogCXN0
YWNrX3NpemUgKz0gODsKLQlucmVnc19vZmYgPSBzdGFja19zaXplOworCWZ1bmNfbWV0YV9vZmYg
PSBzdGFja19zaXplOwogCiAJaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfSVBfQVJHKSB7CiAJCXN0
YWNrX3NpemUgKz0gODsKIAkJaXBfb2ZmID0gc3RhY2tfc2l6ZTsKIAl9CiAKKwljb29raWVfY250
ID0gYnBmX2ZzZXNzaW9uX2Nvb2tpZV9jbnQodGxpbmtzKTsKKwkvKiByb29tIGZvciBzZXNzaW9u
IGNvb2tpZXMgKi8KKwlzdGFja19zaXplICs9IGNvb2tpZV9jbnQgKiA4OworCWNvb2tpZV9vZmYg
PSBzdGFja19zaXplOworCiAJc3RhY2tfc2l6ZSArPSByb3VuZF91cChzaXplb2Yoc3RydWN0IGJw
Zl90cmFtcF9ydW5fY3R4KSwgOCk7CiAJcnVuX2N0eF9vZmYgPSBzdGFja19zaXplOwogCkBAIC0x
MTMyLDEwICsxMTY3LDE5IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xp
bmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJaWYgKGZsYWdzICYgQlBGX1RSQU1QX0Zf
SVBfQVJHKQogCQllbWl0X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLWlwX29mZiwgKHU2
NClmdW5jX2FkZHIsIGN0eCk7CiAKLQllbWl0X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwg
LW5yZWdzX29mZiwgbnJfYXJnX3Nsb3RzLCBjdHgpOworCWZ1bmNfbWV0YSA9IG5yX2FyZ19zbG90
czsKKwllbWl0X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLWZ1bmNfbWV0YV9vZmYsIGZ1
bmNfbWV0YSwgY3R4KTsKIAogCXN0b3JlX2FyZ3MobnJfYXJnX3Nsb3RzLCBhcmdzX29mZiwgY3R4
KTsKIAorCWlmIChicGZfZnNlc3Npb25fY250KHRsaW5rcykpIHsKKwkJLyogY2xlYXIgYWxsIHNl
c3Npb24gY29va2llcycgdmFsdWUgKi8KKwkJZm9yIChpID0gMDsgaSA8IGNvb2tpZV9jbnQ7IGkr
KykKKwkJCWVtaXRfc2QoUlZfUkVHX0ZQLCAtY29va2llX29mZiArIDggKiBpLCBSVl9SRUdfWkVS
TywgY3R4KTsKKwkJLyogY2xlYXIgcmV0dXJuIHZhbHVlIHRvIG1ha2Ugc3VyZSBmZW50cnkgYWx3
YXlzIGdldCAwICovCisJCWVtaXRfc2QoUlZfUkVHX0ZQLCAtcmV0dmFsX29mZiwgUlZfUkVHX1pF
Uk8sIGN0eCk7CisJfQorCiAJaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfQ0FMTF9PUklHKSB7CiAJ
CWVtaXRfaW1tKFJWX1JFR19BMCwgY3R4LT5pbnNucyA/IChjb25zdCBzNjQpaW0gOiBSVl9NQVhf
Q09VTlRfSU1NLCBjdHgpOwogCQlyZXQgPSBlbWl0X2NhbGwoKGNvbnN0IHU2NClfX2JwZl90cmFt
cF9lbnRlciwgdHJ1ZSwgY3R4KTsKQEAgLTExNDMsOSArMTE4Nyw5IEBAIHN0YXRpYyBpbnQgX19h
cmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJ
CQlyZXR1cm4gcmV0OwogCX0KIAotCWZvciAoaSA9IDA7IGkgPCBmZW50cnktPm5yX2xpbmtzOyBp
KyspIHsKLQkJcmV0ID0gaW52b2tlX2JwZl9wcm9nKGZlbnRyeS0+bGlua3NbaV0sIGFyZ3Nfb2Zm
LCByZXR2YWxfb2ZmLCBydW5fY3R4X29mZiwKLQkJCQkgICAgICBmbGFncyAmIEJQRl9UUkFNUF9G
X1JFVF9GRU5UUllfUkVULCBjdHgpOworCWlmIChmZW50cnktPm5yX2xpbmtzKSB7CisJCXJldCA9
IGludm9rZV9icGYoZmVudHJ5LCBhcmdzX29mZiwgcmV0dmFsX29mZiwgcnVuX2N0eF9vZmYsIGZ1
bmNfbWV0YV9vZmYsCisJCQkJIGZsYWdzICYgQlBGX1RSQU1QX0ZfUkVUX0ZFTlRSWV9SRVQsIGZ1
bmNfbWV0YSwgY29va2llX29mZiwgY3R4KTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJ
fQpAQCAtMTE5Miw5ICsxMjM2LDE0IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3Ry
YW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJCSoodTMyICopKGN0eC0+aW5z
bnMgKyBicmFuY2hlc19vZmZbaV0pID0gaW5zbjsKIAl9CiAKLQlmb3IgKGkgPSAwOyBpIDwgZmV4
aXQtPm5yX2xpbmtzOyBpKyspIHsKLQkJcmV0ID0gaW52b2tlX2JwZl9wcm9nKGZleGl0LT5saW5r
c1tpXSwgYXJnc19vZmYsIHJldHZhbF9vZmYsCi0JCQkJICAgICAgcnVuX2N0eF9vZmYsIGZhbHNl
LCBjdHgpOworCS8qIHNldCAiaXNfcmV0dXJuIiBmbGFnIGZvciBmc2Vzc2lvbiAqLworCWZ1bmNf
bWV0YSB8PSAoMVVMTCA8PCBCUEZfVFJBTVBfSVNfUkVUVVJOX1NISUZUKTsKKwlpZiAoYnBmX2Zz
ZXNzaW9uX2NudCh0bGlua3MpKQorCQllbWl0X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwg
LWZ1bmNfbWV0YV9vZmYsIGZ1bmNfbWV0YSwgY3R4KTsKKworCWlmIChmZXhpdC0+bnJfbGlua3Mp
IHsKKwkJcmV0ID0gaW52b2tlX2JwZihmZXhpdCwgYXJnc19vZmYsIHJldHZhbF9vZmYsIHJ1bl9j
dHhfb2ZmLCBmdW5jX21ldGFfb2ZmLAorCQkJCSBmYWxzZSwgZnVuY19tZXRhLCBjb29raWVfb2Zm
LCBjdHgpOwogCQlpZiAocmV0KQogCQkJZ290byBvdXQ7CiAJfQpAQCAtMjA5NCwzICsyMTQzLDgg
QEAgYm9vbCBicGZfaml0X2lubGluZXNfaGVscGVyX2NhbGwoczMyIGltbSkKIAkJcmV0dXJuIGZh
bHNlOwogCX0KIH0KKworYm9vbCBicGZfaml0X3N1cHBvcnRzX2ZzZXNzaW9uKHZvaWQpCit7CisJ
cmV0dXJuIHRydWU7Cit9Ci0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
