Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C36AC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VFauwiL9go07jvNDu7LONGxH8rarFMaiXUGMf2X/Tw=; b=KbDeSBL/GBOLhv
	qPFcS7wz1Yn2X2ARDgPs6ueMx/3NiuhV9MZKdwntOvxTqQDbX0edySRFWuUaompirsIt1Qdwb8ag2
	5/iUWYLlSoBWeOLesimJHxYXzq74OYDH9h5fvwBtaDbmu+82MMqI4MgV2aANGCLKUmYeRy+vJSaqt
	Z+Yjjd01RILAMSGDpGcEvmjRohCfXEf4i9EJSDQZwyANu4UcGQyhpBItRohYxb0Q7RGBlSUjVshwq
	KEItOm9cO4z9c/8fvw4eBSItvKdjycplwSyXounJS0mHfsxu4XgkBFCr65LHbu7jd2siumUp3vosp
	70DFq8pNX2/ts0V+OJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZByV-00000001paG-3ujw;
	Wed, 31 Jul 2024 16:14:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZByT-00000001pZG-0TYs
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 16:14:50 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52efa9500e0so7306247e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722442487; x=1723047287; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67YJB4t8a3rStJX7eamZLcHUt6OpExFZ1HW0neqY3tc=;
        b=MS96NyJw5ohiTTaBTLkQst6mBlDdqrJuvY1H3Dq5f7TEcZ7yi5S8HCQ9nBNvpedxxA
         pIfmg7YcaWv+ye/CWNuIfJtttbVCivLjIZUi69ItwR/uJojC5VXgMLtiCtOZEY0omhLO
         SG2OGv8VYYg49L0uwx3L4aiD7nwvyzXh++JLf5YL23F6WXLfvb77VpaFdaVv2ZPcFBeP
         Z1VCsp/FISC57MPYjkGLdv/By6MhoUMYMpf5uT97vzAU3mURMMZ2ZpdoHqVbqUlAERO2
         h9xpKMAPKKX0ttNuTezYMbKscmP5q9btUPoaHcvI0O5/JIZtsnic7fA1G7X0m3tXU0b8
         k4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722442487; x=1723047287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67YJB4t8a3rStJX7eamZLcHUt6OpExFZ1HW0neqY3tc=;
        b=LkL/bhrRgoMnZ60jT0Oy6Bk+52LqdljCOanZe5rGprbWBAhHs93B00SODhxTsqJsGX
         z3TpKuElJu3+kybv/Ypv2P2acT1+ygDRR+U8f4bM9AKbXtyqDK1746CA7SN1cAuQVccL
         EqRPdmx3jthVy+G4D+jtjEWbePaU9SYNBGz2yzoI5W0AMcAkmBbCyNZ39D+fGrWVC57I
         nFuGJB77H9DLNlFqENEf9PxP/FPbFrrcdHSPfBeiVE9/KOMkh6lEkxQGY5OKUG/1ZheG
         MHB7OK9TrhKQYvYQZEec8TGo9RjIw5GyWv3sK2l8PAuRuy+562XYuHrSd2CdseTl5nQl
         pvWA==
X-Forwarded-Encrypted: i=1; AJvYcCWeONXYLMcMa7VP62pt0hKOtOOXHqpB6a5CXtGVGTytIgyqlBH4H6yMWGTNXHmBNEGjmdB0Xq/OlbkxpVNxI0SXUpVj8nQ5eRFSiQs/7Sul
X-Gm-Message-State: AOJu0Yz9+9LS3HfoPFX0XcgIEU5td2U+iv3JSWvBEh+xtTPnZIOD+8Jh
	HtreMN3WWIywXeEYcyE/w38V+Wie1tX/1H+MFPp5ruN01gHbnqQqQYUUXCJYTkA=
X-Google-Smtp-Source: AGHT+IGOSG7HPoKuH/nQ4CZs4W9P+Dy9DzwopPIOkIR/omN2X/bNWde8qWGEJwuhDElsEfYRrR40NQ==
X-Received: by 2002:ac2:5b0f:0:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-5309b2c5c91mr8627043e87.58.1722442486580;
        Wed, 31 Jul 2024 09:14:46 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41616sm785979066b.137.2024.07.31.09.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:14:45 -0700 (PDT)
Date: Wed, 31 Jul 2024 18:14:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
Message-ID: <20240731-676154f31336c78bafea57d0@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-3-alexghiti@rivosinc.com>
 <20240731-56ba72420d7f745dacb66fd8@orel>
 <CAHVXubjrrWVnw1ufXRJh_5N9M5UiOVZseb0C78fjLaYhNKF7eA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjrrWVnw1ufXRJh_5N9M5UiOVZseb0C78fjLaYhNKF7eA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_091449_181513_C196ACC3 
X-CRM114-Status: GOOD (  27.18  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMDU6NTI6NDZQTSBHTVQsIEFsZXhhbmRyZSBHaGl0aSB3
cm90ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFdlZCwgSnVsIDMxLCAyMDI0IGF0IDQ6MTDigK9QTSBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBX
ZWQsIEp1bCAzMSwgMjAyNCBhdCAwOToyMzo1NEFNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3Rl
Ogo+ID4gPiByaXNjdiBkb2VzIG5vdCBoYXZlIGxyIGluc3RydWN0aW9ucyBvbiBieXRlIGFuZCBo
YWxmd29yZCBidXQgdGhlCj4gPiA+IHFzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBhY3R1YWxseSB1
c2VzIHN1Y2ggYXRvbWljcyBwcm92aWRlZCBieSB0aGUKPiA+ID4gWmFiaGEgZXh0ZW5zaW9uLCBz
byB0aG9zZSBzaXplcyBhcmUgbGVnaXRpbWF0ZS4KPiA+Cj4gPiBXZSBjdXJyZW50bHkgYWx3YXlz
IGNvbWUgdG8gX19jbXB3YWl0KCkgdGhyb3VnaCBzbXBfY29uZF9sb2FkX3JlbGF4ZWQoKQo+ID4g
YW5kIHF1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgoKSBhZGRzIGFub3RoZXIgaW52b2NhdGlvbi4K
PiAKPiBhdG9taWNfY29uZF9yZWFkX3JlbGF4ZWQoKSBhbmQgc21wX2NvbmRfbG9hZF9hY3F1aXJl
KCkgYWxzbyBjYWxsCj4gc21wX2NvbmRfbG9hZF9yZWxheGVkKCkKPiAKPiBBbmQgaGVyZSBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMS1yYzEvc291cmNlL2tlcm5lbC9sb2Nr
aW5nL3FzcGlubG9jay5jI0wzODAsCj4gdGhlIHNpemUgcGFzc2VkIGlzIDEuCgpPaCwgSSBzZWUu
Cgo+IAo+ID4gSG93ZXZlciwgaXNuJ3QKPiA+IHRoZSByZWFzb24gd2UncmUgaGl0dGluZyB0aGUg
QlVJTERfQlVHKCkgYmVjYXVzZSB0aGUgc3dpdGNoIGZhaWxzIHRvIGZpbmQKPiA+IGEgY2FzZSBm
b3IgMTYsIG5vdCBiZWNhdXNlIGl0IGZhaWxzIHRvIGZpbmQgY2FzZXMgZm9yIDEgb3IgMj8gVGhl
IG5ldwo+ID4gaW52b2NhdGlvbiBwYXNzZXMgYSBwb2ludGVyIHRvIGEgc3RydWN0IG1jc19zcGlu
bG9jaywgd2hpY2ggbG9va3MgbGlrZQo+ID4gaXQgaGFzIHNpemUgMTYuIFdlIG5lZWQgdG8gZW5z
dXJlIHRoYXQgd2hlbiBwdHIgcG9pbnRzIHRvIGEgcG9pbnRlciB0aGF0Cj4gPiB3ZSBwYXNzIHRo
ZSBzaXplIG9mIHVpbnRwdHJfdC4KPiAKPiBJIGd1ZXNzIHlvdSdyZSByZWZlcmluZyB0byB0aGlz
IGNhbGwgaGVyZQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjExLXJjMS9z
b3VyY2Uva2VybmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMjTDU1MSwKPiBidXQgaXQncyBhIHBvaW50
ZXIgdG8gYSBwb2ludGVyLCB3aGljaCB3aWxsIHRoZW4gcGFzcyBhIHNpemUgOC4KCkFoLCBtaXNz
ZWQgdGhhdCAnJicuLi4KCj4gCj4gQW5kIHRoZSBidWlsZCBlcnJvciB0aGF0IEkgZ2V0IGlzIHRo
ZSBmb2xsb3dpbmc6Cj4gCj4gSW4gZnVuY3Rpb24gJ19fY21wd2FpdCcsCj4gICAgIGlubGluZWQg
ZnJvbSAncXVldWVkX3NwaW5fbG9ja19zbG93cGF0aCcgYXQKPiAuLi9rZXJuZWwvbG9ja2luZy9x
c3BpbmxvY2suYzozODA6MzoKPiAuLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDo1
MTA6NDU6IGVycm9yOiBjYWxsIHRvCj4gJ19fY29tcGlsZXRpbWVfYXNzZXJ0XzInIGRlY2xhcmVk
IHdpdGggYXR0cmlidXRlIGVycm9yOiBCVUlMRF9CVUcKPiBmYWlsZWQKPiAgIDUxMCB8ICAgICAg
ICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywKPiBfX2NvbXBpbGV0aW1lX2Fz
c2VydF8sIF9fQ09VTlRFUl9fKQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4gLi8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6
NDkxOjI1OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mCj4gbWFjcm8gJ19fY29tcGlsZXRpbWVfYXNz
ZXJ0Jwo+ICAgNDkxIHwgICAgICAgICAgICAgICAgICAgICAgICAgcHJlZml4ICMjIHN1ZmZpeCgp
Owo+ICAgICAgICAgIFwKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgo+
IC4vLi4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjUxMDo5OiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8KPiAnX2NvbXBpbGV0aW1lX2Fzc2VydCcKPiAgIDUxMCB8ICAgICAgICAg
X2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywKPiBfX2NvbXBpbGV0aW1lX2Fzc2Vy
dF8sIF9fQ09VTlRFUl9fKQo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+Cj4g
Li4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvCj4gJ2NvbXBpbGV0aW1lX2Fzc2VydCcKPiAgICAzOSB8ICNkZWZpbmUgQlVJTERfQlVH
X09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cpCj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn4KPiAuLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjU5OjIxOiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8KPiAnQlVJTERfQlVHX09OX01TRycKPiAgICA1OSB8ICNkZWZpbmUgQlVJTERf
QlVHKCkgQlVJTERfQlVHX09OX01TRygxLCAiQlVJTERfQlVHIGZhaWxlZCIpCj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAuLi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NtcHhjaGcuaDozNzY6MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgo+IG1hY3JvICdC
VUlMRF9CVUcnCj4gICAzNzYgfCAgICAgICAgICAgICAgICAgQlVJTERfQlVHKCk7Cj4gCj4gd2hp
Y2ggcG9pbnRzIHRvIHRoZSBmaXJzdCBzbXBfY29uZF9sb2FkX3JlbGF4ZWQoKSBJIG1lbnRpb25l
ZCBhYm92ZS4KPiAKCk9LLCB5b3UndmUgZ290IG1lIHN0cmFpZ2h0ZW5lZCBvdXQgbm93LCBidXQg
Y2FuIHdlIG9ubHkgYWRkIHRoZSBmYWxsYmFjawpmb3Igc2l6ZXMgMSBhbmQgMiBhbmQgbGVhdmUg
dGhlIGRlZmF1bHQgYXMgYSBCVUlMRF9CVUcoKT8KClRoYW5rcywKZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
