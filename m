Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D6CCA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAxqPOIUrZbSDy0oUc0nppOBQ/dIiDSGPetBo8o3ep0=; b=yIV2pFzlwZ3nHM
	xPri8x79dsMCSiUghbxNHmlMY4PeEnxtuDi0FEWe+GuMo4/wL+C6jaGM5GKz71+03GS32tq0qbGdc
	mXrq1XuUa1J0kDMai7SFdfQ0Eyg/xwsJnrnRGsjNyR3qmeL+ZxOPoPxlbDfARyMZOj+ntQNbRmx84
	Z7NYaLaRo4qffD0BUqCjoTgzIVUfPUTOT2jPYREoKsVV36iZE56dREHi83wQDHYn4CWT23Yl+NRlo
	wvhatrxj9WLcbI8N8phTTRYGRTo/0ClzQVnLbM6ijM8pjEypLzfIWqTPBHAOKydCTSdOlUwHy0L08
	5xwTfTHzmsqTnhNZRiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl1we-0000000DOuK-1J9a;
	Mon, 02 Sep 2024 07:57:52 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl1wb-0000000DOsd-23v8
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 07:57:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5353cd18c20so4641992e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 00:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725263867; x=1725868667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNe6UTfwv3omDdjm4VbXZLqk/p1g7r/jSnlTORtmwfY=;
        b=XZhFs1IFDV2xVm35gKxg8yYEzv+qlAcwb4ZnLaKINopRXzuHlP06qGtv0Ov1lQLREg
         67D6Gt03MflxQE1PMHA+RdqkesPZh4YVYUjq6xYcpW6pb4nfMtgjqQbGH9KElS0Ho3vj
         v114EkT+RsEz4lIftfAjFDlWoMclU7mOdq40N1KMi5IuHl7Sve5WeAcueuomCcXYqcfe
         lR3PpBOw/HPmGUzDKL1cZhNksZY3tR8hkcT4CUce9aBMoT8it86+y8oS5GCxeFlSoaN6
         cRkl4MBOCirKmWAol9yUH8fLAMCFXjLIkkeqrcmiHrgu7Le6vwaikCLd8KkdnEOozqj0
         bn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263867; x=1725868667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNe6UTfwv3omDdjm4VbXZLqk/p1g7r/jSnlTORtmwfY=;
        b=sYRuiw6X365U5hYHCY8fN07rXHeLfqxHvsJwG1109JV1ZCrJ8dYGMvDROdQLDpwA/i
         E0q9C1RevLb+g1fP1QWOp6mxaZ8qQxMS+tpabB2MRwOwFE29aZ1trK7pcPRKignTrPxu
         MCwgS7XwUdG3mOZVFXOjdexlVzu8Bq+KgO5c1E14pCV19ulVSaZa8gMm+ON1TZfp0ZR3
         p1gZApudchPxvZtItsT0LzOVr3rWrFemUnZisN8/tolly1mpgXQesZe0Rg0Lo2SJKkwS
         p61aaq9B8r57rlw67TZm003e2L0uKzWYxs3WnezTN6YtAF9YwO6YvuISIxrOIP8fPLuv
         zRqg==
X-Forwarded-Encrypted: i=1; AJvYcCV6JIGUHDmGUwN0gQiyK5yb/xKzAySKRqoTlj97eAAKofyaYBTRiAifGurz/JJwVBN8QGX31AE/BC6RvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5oz+2MU9OADhPy3GObbixheKAwORiTK1/E9CDgH+0kojV05yu
	ASw2amAYd+vn3esQXHCuuQDzEFbIQjkDm91Gl7oIHQSxfUcyUWXDINDLE+rkmsqRC+cVqPxPRIz
	mhM4XT2Wovuu79v3Js1ARd337sh3Jd0aaN5pLSQ==
X-Google-Smtp-Source: AGHT+IFg1jywu70GIrr3YvtBUAZYZFTHQtiU2/ai0tVMiXStJdKaZQevzq+obbjVJrGPamFdvFFxc2T7vlG6O+T6+Q8=
X-Received: by 2002:a05:6512:3a8d:b0:52f:c0ee:3b5f with SMTP id
 2adb3069b0e04-53546aef1f9mr6278575e87.10.1725263866032; Mon, 02 Sep 2024
 00:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org> <20240828-02-k1-pinctrl-v3-2-1fed6a22be98@gentoo.org>
In-Reply-To: <20240828-02-k1-pinctrl-v3-2-1fed6a22be98@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 09:57:35 +0200
Message-ID: <CACRpkdZLdbKr41yXg6ETM6ANCD+Rbd_tnz0hQ0NyU9oRXR+PnA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_005749_554236_6874EF5C 
X-CRM114-Status: GOOD (  14.95  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWl4dW4sCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghIE92ZXJhbGwgdGhlIGRyaXZlciBsb29r
cyB2ZXJ5IGdvb2QsIGl0J3MgdXNpbmcgdGhlCnJpZ2h0IGhlbHBlcnMgYW5kIGFic3RyYWN0aW9u
cyBldGMuCgpUaGVyZSBpcyB0aGlzIHRoaW5nIHRoYXQgbmVlZHMgc29tZSBlbGFib3JhdGlvbjoK
Ck9uIFdlZCwgQXVnIDI4LCAyMDI0IGF0IDE6MzHigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cgo+ICsvKiBwaW4gb2Zmc2V0ICovCj4gKyNkZWZpbmUgUElOSUQoeCkgICAg
ICAgKCh4KSArIDEpCj4gKwo+ICsjZGVmaW5lIEdQSU9fSU5WQUwgIDAKPiArI2RlZmluZSBHUElP
XzAwICAgICBQSU5JRCgwKQo+ICsjZGVmaW5lIEdQSU9fMDEgICAgIFBJTklEKDEpCiguLi4pCgpT
byBHUElPIDAwIGhhcyBwaW4gSUQgMSBhY3R1YWxseSBldGMuCgpCdXQgd2h5PwoKSWYgdGhlcmUg
aXMgbm8gZGF0YXNoZWV0IG9yIG90aGVyIGNvbmZsaWN0aW5nIGRvY3VtZW50YXRpb24sIGp1c3QK
YmVnaW4gbnVtYmVyaW5nIHRoZSBHUElPcyBhdCAxIGluc3RlYWQgb2YgMCB0byBtYXRjaCB0aGUK
aGFyZHdhcmU6CgojZGVmaW5lIEdQSU9fMDEgMQojZGVmaW5lIEdQSU9fMDIgMgoKYW5kIGFsbCBp
cyBmaW5lLgoKSXQncyBqdXN0IHZlcnkgdW5pbml0dWl0aXZlIGZvciBkZXZlbG9wZXJzLiBJIGd1
ZXNzIHRoYXQgdGhlcmUKaXMgYSByZWFzb24sIHN1Y2ggYXMgdGhhdCB0aGUgZGF0YXNoZWV0IGhh
cyBzdGF0ZWQgdGhhdCB0aGUgcGluCndpdGggcGluIElEIDEgaXMgR1BJTyAwMCwgdGhlbiB0aGlz
IG5lZWRzIHRvIGJlIGV4cGxhaW5lZCB3aXRoCmEgY29tbWVudCBpbiB0aGUgY29kZTogIndlIGFy
ZSBkb2luZyB0aGlzIGJlY2F1c2Ugb3RoZXJ3aXNlCnRoZSBkZXZlbG9wZXJzIHdpbGwgc2VlIGFu
IG9mZnNldCBvZiAtMSBiZXR3ZWVuIHRoZSBudW1iZXIgdGhlCnBpbiBoYXMgaW4gdGhlIGRhdGFz
aGVldCBhbmQgdGhlIG51bWJlciB0aGV5IHB1dCBpbnRvIHRoZQpkZXZpY2UgdHJlZSwgd2hpbGUg
dGhlIGhhcmR3YXJlIHN0YXJ0cyB0aGUgbnVtYmVyaW5nIGF0IDEsIHRoZQpkb2N1bWVudGF0aW9u
IHN0YXJ0cyB0aGUgbnVtYmVyaW5nIGF0IDAiLgoKSXQgaXMgY29tbW9uIHRoYXQgZW5naW5lZXJz
IGZyb20gYW5hbG9nIGVsZWN0cm9uaWNzIGJhY2tncm91bmQKc3RhcnQgbnVtYmVyaW5nIHRoaW5n
cyBmcm9tIDEgd2hpbGUgYW55IGNvbXB1dGVyIHNjaWVuY2UKZW5naW5lZXIgc3RhcnQgdGhlIG51
bWJlcmluZyBhdCAwLiBTbyB0aGlzIGlzIHdoYXQgeW91IGdldCB3aGVuCmFuIGFuYWxvZyBlbmdp
bmVlciBkZXNpZ25zIHRoZSBlbGVjdHJvbmljcyBhbmQgYSBjb21wdXRlcgpzY2llbmNlIGVuZ2lu
ZWVyIHdyaXRlcyB0aGF0IGRhdGFzaGVldCBhbmQgZGVjaWRlcyB0byAiZml4Igp0aGUgcHJvYmxl
bS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
