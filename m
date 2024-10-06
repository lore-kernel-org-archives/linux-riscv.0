Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA3BCFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3fWvwkx6BP4clp4HQk0tCd0FlH2i366E6uOEZTyoaQ=; b=BfEp3ff24Hxwxo
	haKL5EN25nEQ2o3DXVgpvP5Kxged7hW2r6WE3ViEQN+I6PctyXPi2ma+rdPrm7VWLnpUBxp56bZae
	agA/QYJdbOGVWPZcwm4et/9Et0EgICDiRBbWabKXUC6vww7le0V8tsNFGgs6ZemsqM5DwWzCzqpup
	0GnpmEU+1yJ6mIH8yT0T67xdsY5qfIx84/Nq6xE9pX5hFj7D2A9Vha1FOUnsS+EcaKBrM4KJnF3x5
	HBfc77tuT9aKQ1FA4g9rkLEoaP1L1y6OesEKE6CPe9M5nrmMJWBXrDzR/L8RCrisu3I1Js8Zvi6Am
	XDE8f6lEAfTfSMlyzCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTrP-00000000GZM-3EXo;
	Sun, 06 Oct 2024 16:11:55 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTrM-00000000GYl-0aCP
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 16:11:54 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e28ad6b7f1fso713443276.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728231111; x=1728835911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAYqCIiSv61sSYgvtWT29++OHzmZnVI7JlxP4WixgGE=;
        b=PLB+q0DLV3w6V0RTDQqrmmOwjqnrlHd9bUCC/CyMCmrhZXhVJR6/G28+JTe2eZy4Nb
         ftO4pN2wsF93/ZQhAbh0pXE6uRSbfPQGnbrbCvZm4DBzmy7IQDMgE9CjOFVSCxywyyTk
         xShFDA0CgGz/SZ73CEQ8zcMSQ5ErkA8tINHqHjvZju813YcMGfNhjiF60p58890lRZPu
         KXplxEYAlD4XxwXX0Su2jz49EkL88CRXqB6bhDhS7rLu1IYw4vncIQDtEjj5x0lxTK4J
         QA6nofx0Sd+PaoDW55GWGJ1PuNd8fH6PX0bGrqlVQviT/R1jOOwluWaRGRDuX8cWED8V
         y05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728231111; x=1728835911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAYqCIiSv61sSYgvtWT29++OHzmZnVI7JlxP4WixgGE=;
        b=MEnzkf5AyPMHopWmOQRVI2QpTKptQrsG+ZxPCG2JK4+x1SKy38Soj2o6J1MDFH82z5
         zVSASFT8DS8WvlfVh7YIvDc8n0JR+qY0rc495HxzX1nqzDyZuAWfemoMWX9c4x9wqA9U
         0Ywj3ogLH2OI7OVzmzGi04WIP3SimLgAH5z8bQpjOsJLW1JLhkZSG01hIo0x92W+2f19
         43G3nQO7D06bEj8S18zj5LRHGOm//sHdtVIm8ARSvyfm6k25vHUoM8rk0Tn/eKQfyNdr
         HaUr8LRJ9FcfnumWpzgYW2CTTqaevhTVUf5xQP/efC4vLcMm1Lf6KeYvdF8Eo5+C1I4f
         +Cgg==
X-Forwarded-Encrypted: i=1; AJvYcCU7aCVr3rHBs6u1/80mPuY0X3CgL8fQy1QkJ/unD7rQ+FP5Dd8xoB/APhrG6/I+pYYBqGfEdCc3xOueMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9I3m2D9DXau8z7t8CsHXBLfUQG3gDbp8ikHgwYQbX4A4OzHfb
	zsvzxOzwOqUWRgZF56pKzJkjXuXVb3lsMHlGEj2jUoITMiKSv78xeSvRfMJt2fsYk8z4QkUqpGS
	6s2vDwfVHuGU9rvCpytV9XyCuXoY=
X-Google-Smtp-Source: AGHT+IFqMHlb0b8SgKw7RwjBG7Z/IYs0/8p3F6LoeYW5kR2rfijp2j/qGjYCoWovPSzlMmk0//HTDX0lUYq3PNC/rQA=
X-Received: by 2002:a05:6902:2b8f:b0:e20:16b9:ad68 with SMTP id
 3f1490d57ef6-e2893951b87mr6248949276.45.1728231110621; Sun, 06 Oct 2024
 09:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-7-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-7-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 7 Oct 2024 00:11:39 +0800
Message-ID: <CAFTtA3O-sD-cJsHL2LgwryXwEnuEKvnP6QrTn7GMFYZmP=A3iA@mail.gmail.com>
Subject: Re: [PATCH v10 07/14] riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_091152_202200_164D3BA0 
X-CRM114-Status: GOOD (  17.46  )
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

SGkgQ2hhcmxpZSwKCkNoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IOaWvCAy
MDI05bm0OeaciDEy5pelIOmAseWbmyDkuIvljYgxOjU35a+r6YGT77yaCj4KPiBUaGUgVlhSTSB2
ZWN0b3IgY3NyIGZvciB4dGhlYWR2ZWN0b3IgaGFzIGFuIGVuY29kaW5nIG9mIDB4YSBhbmQgVlhT
QVQKPiBoYXMgYW4gZW5jb2Rpbmcgb2YgMHg5Lgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBIZWlrbyBT
dHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFy
bGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8
IDExICsrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCAzZWViMDdkNzMwNjUuLmMwYTYw
YzRlZDkxMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0zMDAsOSArMzAwLDE0IEBACj4g
ICNkZWZpbmUgQ1NSX1NUSU1FQ01QICAgICAgICAgICAweDE0RAo+ICAjZGVmaW5lIENTUl9TVElN
RUNNUEggICAgICAgICAgMHgxNUQKPgo+IC0jZGVmaW5lIFZDU1JfVlhSTV9NQVNLICAgICAgICAg
ICAgICAgICAzCj4gLSNkZWZpbmUgVkNTUl9WWFJNX1NISUZUICAgICAgICAgICAgICAgICAgICAg
ICAgMQo+IC0jZGVmaW5lIFZDU1JfVlhTQVRfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgIDEK
PiArLyogeHRoZWFkdmVjdG9yIHN5bWJvbGljIENTUiBuYW1lcyAqLwo+ICsjZGVmaW5lIENTUl9W
WFNBVCAgICAgICAgICAgICAgMHg5Cj4gKyNkZWZpbmUgQ1NSX1ZYUk0gICAgICAgICAgICAgICAw
eGEKPiArCj4gKy8qIHh0aGVhZHZlY3RvciBDU1IgbWFza3MgKi8KPiArI2RlZmluZSBDU1JfVlhS
TV9NQVNLICAgICAgICAgIDMKPiArI2RlZmluZSBDU1JfVlhSTV9TSElGVCAgICAgICAgIDEKPiAr
I2RlZmluZSBDU1JfVlhTQVRfTUFTSyAgICAgICAgIDEKCm5pdDogdXNlIFZDU1JfVlgqIGluc3Rl
YWQgb2YgQ1NSX1ZYKiwgaWYgeW91IG5lZWQgdG8gc2VuZCB0aGUgbmV4dApyZXZpc2lvbi4gSSBi
ZWxpZXZlIHRoZXNlIG1hc2tzIGFyZSBmb3IgQ1NSX1ZDU1IgYnV0IG5vdCBDU1JfVlgqLiBJZgp5
b3UgdGhpbmsgQ1NSX1ZYKiBpcyBhIGJldHRlciBuYW1pbmcgdGhlbiB0aGUgcHJldmlvdXMgcGF0
Y2ggc2hvdWxkCmludHJvZHVjZSBpdCBhcyBDU1JfVlgqIGJ1dCBub3QgVkNTUl9WWCouCgo+Cj4g
IC8qIFN1cGVydmlzb3ItTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0
ZXJzIChBSUEpICovCj4gICNkZWZpbmUgQ1NSX1NJU0VMRUNUICAgICAgICAgICAweDE1MAo+Cj4g
LS0KPiAyLjQ1LjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
