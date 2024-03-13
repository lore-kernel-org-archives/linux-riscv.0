Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BBBC54E66
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGLtOtqj6ei4Pi91DBJYHy1eQ+DH2DYpNd6aTauSEUg=; b=dRH6MaoHooHg8o
	hC4jLJTKXLFMbNZ9GfVOo3oFOOAwY2AZjLFMo2IHWgZtkmniO8RxUhDh6n3ybzBmWQpvoUP22FQ2l
	6YkDWFAIhBJHSCOvx2p/kWItq7Mvg7cYdQyvGYZR2eJBvMWhtZSBq0DBWnNL18pY1zkhIwYTdflEl
	EgT8hWDu42MgkquFAczzCrOBa+vAmyn94plTGndwkLC/7l2Ck2SdTrtkJFYwmz3rUtm7BbKbfskOP
	64AmMGlq1Hikdc+bAypliyDmA4/mEZsm14dHqGrQR206ZFs4E1ZJ9mo/SqshCdeHSPmI+nkNOQv9z
	VdnfO/+3Atpk1REiLKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPpH-0000000ASvb-1YAh;
	Wed, 13 Mar 2024 14:43:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPpD-0000000ASui-47xH
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 14:43:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33e9dfd343fso631638f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710341001; x=1710945801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOyyWxqr4Zt5l8qx0EOpnngPAjzS6Yb2YM91AanmvQ0=;
        b=fAJ58Xwlhf7Q8/+pWr7UA/K9JTo5qKRpUSore3rJ9KjzGixtQPi1fZCj1WoIM92obB
         cdEQsl/+57WCIbeH/NNco6+6gB65xN/kH0ZiHYYWAuypc8BdusS9AD5hgBI8SDg51hxz
         hvuwnCxgD17kcJTQm/Jh0pPx8YZC4tTucI3mVFUeAx0qvuCqWP3n3o5WJ9tWlvKDGGzl
         OvCQuj4G4jy4i0Trcsgbhy1m673AUdhNHkcpeElJti1aNrkqy4BeNH8yc1BvF4e+CuQn
         gjzo4tfBB88C/BUIteU+sAqobNDAA5TFOuMeV9lKoGNoXTs1pvvc+enITXpvIgmg/8Fa
         EDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710341001; x=1710945801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOyyWxqr4Zt5l8qx0EOpnngPAjzS6Yb2YM91AanmvQ0=;
        b=sXip+6UtFx4VRZE3jcOObGMtBqxp28j391HtvzTOvNcZj95XWS/5xl2xdgT7+MRQOP
         KmzwB/mzGjuFmYinvCvf7yOpLGCgvP6wQe64P9B9tZCE9+H34I9vaSxcaG8+RkUE5tJq
         L2sYeM4VPKZtmg0COBSmnP2SjJ3hYaJJul4ySWJcbwbsYM/OoHcQ7IMDrICOMwAHQPhM
         yJCPjzbGXq48xUalcmKZcTURweqnLqzdRNnEyKV/FKTYFumCEE0+dBAnPRqTTPgeDzQs
         5t11VI5sY46JnoineYJFjNKZCpvO5rE5bfio4pPIS4orXZzeZFwwnaM9/PyqJwtWAnt1
         lueQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg+GCMgwow3/kZt6b7shdGdqsVp6Ud6fxHu9WTPWMkQXmOovSuaou56SozwlTU7pfHoWbQ0Qkd2WRypK4ple9w3UwY1OQv52oJgYBjExPG
X-Gm-Message-State: AOJu0Yzvq3xKGZUes7vmmjGqKSMx/Nrh1F9CGk7BcYta13+CjRyloJck
	sb/eRoZcyBQASgXD779lr+uezXCLwz5kaPjfBsRxv2JOy/xoSDk4T7IAKZMWW50=
X-Google-Smtp-Source: AGHT+IHnYo+Mfw14XHLEGD+XsgTuPyQnaH13Xt3Jsj4nuhLeGe0VgxyoZDpIhuF+vbZ90D3cZE0hww==
X-Received: by 2002:a5d:40d1:0:b0:33e:be35:d449 with SMTP id b17-20020a5d40d1000000b0033ebe35d449mr676795wrq.44.1710341001070;
        Wed, 13 Mar 2024 07:43:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bj28-20020a0560001e1c00b0033e7de97214sm12107696wrb.40.2024.03.13.07.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 07:43:20 -0700 (PDT)
Message-ID: <42665ccc-d020-48c4-a5bb-2713f7cbb75c@linaro.org>
Date: Wed, 13 Mar 2024 15:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240312192519.1602493-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_074324_068523_A8E13FE4 
X-CRM114-Status: GOOD (  21.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMDMvMjAyNCAyMDoyNSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gQ29tbWl0IDhlYzk5
YjAzMzE0NyAoImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBh
Cj4gcGxhdGZvcm0gZHJpdmVyIikgYnJva2UgdGhlIE1NSU8gdGltZXIgb24gdGhlIEFsbHdpbm5l
ciBEMSBTb0MgYmVjYXVzZQo+IHRoZSBJUlEgZG9tYWluIGlzIG5vIGxvbmdlciBhdmFpbGFibGUg
d2hlbiB0aW1lcl9wcm9iZSgpIGlzIGNhbGxlZDoKCkRpZCB5b3UgbWVhbjogcy9ubyBsb25nZXIg
YXZhaWxhYmxlL25vdCB5ZXQgYXZhaWxhYmxlLyA/CgoKPiAgICBbICAgIDAuMDAwMDAwXSBpcnE6
IG5vIGlycSBkb21haW4gZm91bmQgZm9yIGludGVycnVwdC1jb250cm9sbGVyQDEwMDAwMDAwICEK
PiAgICBbICAgIDAuMDAwMDAwXSBGYWlsZWQgdG8gbWFwIGludGVycnVwdCBmb3IgL3NvYy90aW1l
ckAyMDUwMDAwCj4gICAgWyAgICAwLjAwMDAwMF0gRmFpbGVkIHRvIGluaXRpYWxpemUgJy9zb2Mv
dGltZXJAMjA1MDAwMCc6IC0yMgo+IAo+IEZpeCB0aGlzIGJ5IHdyYXBwaW5nIHRoZSB0aW1lciBp
bml0aWFsaXphdGlvbiBpbiBhIHBsYXRmb3JtIGRyaXZlci4KPiBidWlsdGluX3BsYXRmb3JtX2Ry
aXZlcl9wcm9iZSgpIG11c3QgYmUgdXNlZCBiZWNhdXNlIHRoZSBkcml2ZXIgdXNlcwo+IHRpbWVy
X29mX2luaXQoKSwgd2hpY2ggaXMgbWFya2VkIGFzIF9faW5pdC4gT25seSBjb252ZXJ0IHRoZSBz
dW44aQo+IHZhcmlhbnRzIG9mIHRoZSBoYXJkd2FyZSwgYmVjYXVzZSBzb21lIG9sZGVyIFNvQ3Mg
c3RpbGwgbmVlZCB0aGUgdGltZXIKPiBwcm9iZWQgZWFybHkgZm9yIHNjaGVkX2Nsb2NrKCkuCj4g
Cj4gRml4ZXM6IDhlYzk5YjAzMzE0NyAoImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJ
QyBkcml2ZXIgaW50byBhIHBsYXRmb3JtIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVs
IEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4gCj4gICBkcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKy0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMgYi9kcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMKPiBpbmRleCA3YmRjYzYwYWQ0M2MuLjcyOGRhYzJi
YWE4NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMKPiAr
KysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMKPiBAQCAtMjAsNiArMjAsNyBA
QAo+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVz
cy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+Cj4gICAKPiAgICNpbmNsdWRlICJ0aW1lci1vZi5oIgo+ICAgCj4gQEAg
LTIxOCw5ICsyMTksMjQgQEAgc3RhdGljIGludCBfX2luaXQgc3VuNGlfdGltZXJfaW5pdChzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gICB9Cj4gICBUSU1FUl9PRl9ERUNMQVJFKHN1bjRpLCAi
YWxsd2lubmVyLHN1bjRpLWExMC10aW1lciIsCj4gICAJCSAgICAgICBzdW40aV90aW1lcl9pbml0
KTsKPiAtVElNRVJfT0ZfREVDTEFSRShzdW44aV9hMjMsICJhbGx3aW5uZXIsc3VuOGktYTIzLXRp
bWVyIiwKPiAtCQkgc3VuNGlfdGltZXJfaW5pdCk7Cj4gLVRJTUVSX09GX0RFQ0xBUkUoc3VuOGlf
djNzLCAiYWxsd2lubmVyLHN1bjhpLXYzcy10aW1lciIsCj4gLQkJIHN1bjRpX3RpbWVyX2luaXQp
Owo+ICAgVElNRVJfT0ZfREVDTEFSRShzdW5pdiwgImFsbHdpbm5lcixzdW5pdi1mMWMxMDBzLXRp
bWVyIiwKPiAgIAkJICAgICAgIHN1bjRpX3RpbWVyX2luaXQpOwo+ICsKPiArc3RhdGljIGludCBf
X2luaXQgc3VuNGlfdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAr
ewo+ICsJcmV0dXJuIHN1bjRpX3RpbWVyX2luaXQoZGV2X29mX25vZGUoJnBkZXYtPmRldikpOwo+
ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW40aV90aW1lcl9v
Zl9tYXRjaFtdID0gewo+ICsJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktYTIzLXRp
bWVyIiB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktdjNzLXRpbWVyIiB9
LAo+ICsJeyAvKiBzZW50aW5lbCAqLyB9Cj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBzdW40aV90aW1lcl9kcml2ZXIgPSB7Cj4gKwkuZHJpdmVyCT0gewo+ICsJCS5u
YW1lCQk9ICJzdW40aS10aW1lciIsCj4gKwkJLm9mX21hdGNoX3RhYmxlCT0gc3VuNGlfdGltZXJf
b2ZfbWF0Y2gsCj4gKwl9LAo+ICt9Owo+ICtidWlsdGluX3BsYXRmb3JtX2RyaXZlcl9wcm9iZShz
dW40aV90aW1lcl9kcml2ZXIsIHN1bjRpX3RpbWVyX3Byb2JlKTsKCi0tIAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFy
bz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
