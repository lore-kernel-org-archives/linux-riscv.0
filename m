Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D248AC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GB1+VL2MCGp6HcppH/j2f3/bNLRJjgTFCWrGs8OzMI=; b=KuSlHDOK24DReZ
	K/F+6DhvE9QG7pUW7W3lcU9d34uj1I8Csh0RqUB6XQenv9U/vLrR0WRFuFTfrzoDIpM0AG6dZ9IC1
	5LSDThb1RA/KAcYEswhYXZbdOa8YXyueHj8+6dGzFf8W3hUvkPtY2U9w3V2SSO2pm5gMwlYhm9f4j
	fUvU9t3YCda5d7ZG4+86AqrLcYFgfVARKMB2g+/4rgzmLv06/5Yy4DjWoAPARMfMQpnwHwQKW+O22
	GoX9Ofkj0HR+8P9MEJdSvdLoAaRE2ziihMNbWLwzqg/2phrANNVotdrAKfdwepsFHpJJob8tpady/
	Z27NTffB3okffLzQ3CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9p23-00000003Yfb-0JdL;
	Wed, 22 May 2024 16:41:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9p1z-00000003YeX-2ZFC
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:41:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57230faeb81so6276648a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716396093; x=1717000893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0D2E2cfbbxVHUzTYoIqfwhIyGan3otmR2xS4JLclOU=;
        b=e2f3W3+F78Nu/kjnLyZ0FRHzHxqpeZAOLLHKBc70OTBF2REAHEgEY1I1/2XBpoqzCo
         ypDwiyOs8nVeUpu8VokF9eEgvep4mZoJkH93nRGI18bU70SgMgZfIaaFus9o7+/3etzz
         xg7quccKq2eq349OvaBLy2Wnp9BLI2mIZHnghkJ+3+BHiC4vfATaqNwWYx//dhfI4+ZJ
         x269Jauw1OUlg+SWjibnivUfhmyccHwprpQUQkkYXkJnPZbQPaNYJurLHmPpQyQLT3Um
         xIfvee5ontS0MzXvuXoh+4oYDq1kjHIdEt4WMSr9ti9O3amC7cRw45ZHDef+TH0+GOGO
         UrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716396093; x=1717000893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0D2E2cfbbxVHUzTYoIqfwhIyGan3otmR2xS4JLclOU=;
        b=C1rCgp3kY0x9DEaorZimMtPMVui0pdzWQyTgDoSuaG6vB5p84TbgxeJ6evjcGpU+GX
         GJ2lBVWRZf0xSIkjhq8mvcmUANNPNG9n/bWWnFXCuwOfAEO7HuG94MQJnlEUb/f7VeNk
         oT7eAJixYFc8x0QG8++bbNLZN55XErelVzkzbsRO4M3leQumzsH7kfMi99yoytfSLG4Z
         4cDP5F8HPqwOWdzkcI5N1N0b/1KLRP81ZbMcL36xASmko+rFT5+twZpKOV46dU2EqY2b
         y9dCg1ITPp/P7dxFPShfHi7vjuzIagYrKrBXuBRkFZEF3R1RwSKp/ZnBldSbuIw/JUrb
         q12w==
X-Forwarded-Encrypted: i=1; AJvYcCWkfrcJc/WuZn7cZ/bF6lCI8xrUrsQ/X529HD9Hl3s8oUaMpyBnDv2azppgM+4+SJPcd8s9fiAl627UvIQ82uYhSZyBt4WP1jl0IYtjgJ6y
X-Gm-Message-State: AOJu0YydijN8ww+c333XzBOojv/PpeeGHAGjFTZ9Ah+etiJHXVaLVoKE
	uBq6D+0gVySNSUFXJD+VLYvobKu3iQKiHK6DRPV4kdP8rfPW63rHNXSdoxs92oL4kBSijnwYb76
	XWXb0mlsRI4+uSANzgqqszviXvJMZ9g==
X-Google-Smtp-Source: AGHT+IFFX3MYqZxTykrBDqEhWWplDnP3uOhy/1gv12cOKWc1GtiHAJtX3Yuzanuue7f8uxVzBuYnBeq7lKYou4B2Xrc=
X-Received: by 2002:a50:9b42:0:b0:570:5bcc:f749 with SMTP id
 4fb4d7f45d1cf-57832c326cbmr1934151a12.29.1716396093397; Wed, 22 May 2024
 09:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240522153835.22712-1-kanakshilledar111@protonmail.com> <20240522-yoga-blurt-dc5e40a0ae3a@spud>
In-Reply-To: <20240522-yoga-blurt-dc5e40a0ae3a@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Wed, 22 May 2024 22:11:20 +0530
Message-ID: <CAGLn_=vfnQrNh63jWtUCojONAYqX3dm6qnXgA--Zi1KQ0P0o-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
To: Conor Dooley <conor@kernel.org>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_094135_685349_43D5CB1E 
X-CRM114-Status: GOOD (  23.49  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIE1heSAyMiwgMjAyNCBhdCA5OjM04oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIyLCAyMDI0IGF0IDA5
OjA4OjM0UE0gKzA1MzAsIEthbmFrIFNoaWxsZWRhciB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIG9m
IHBhdGNoZXMgY29udmVydHMgdGhlIFJJU0MtViBDUFUgaW50ZXJydXB0IGNvbnRyb2xsZXIgdG8K
PiA+IHRoZSBuZXdlciBkdC1zY2hlbWEgYmluZGluZy4KPiA+Cj4gPiBQYXRjaCAxOgo+ID4gVGhp
cyBwYXRjaCBpcyBjdXJyZW50bHkgYXQgdjMgYXMgaXQgaGFzIGJlZW4gcHJldmlvdXNseSByb2xs
ZWQgb3V0Lgo+ID4gQ29udGFpbnMgdGhlIGJpbmRpbmdzIGZvciB0aGUgaW50ZXJydXB0IGNvbnRy
b2xsZXIuCj4gPgo+ID4gUGF0Y2ggMjoKPiA+IFRoaXMgcGF0Y2ggaXMgY3VycmVudGx5IGF0IHYy
Lgo+ID4gQ29udGFpbnMgdGhlIHJlZmVyZW5jZSB0byB0aGUgYWJvdmUgaW50ZXJydXB0IGNvbnRy
b2xsZXIuIFRodXMsIG1ha2luZwo+ID4gYWxsIHRoZSBSSVNDLVYgaW50ZXJydXB0IGNvbnRyb2xs
ZXIgYmluZGluZ3MgaW4gYSBjZW50cmFsaXplZCBwbGFjZS5vCj4KPiBEb24ndCBkbyB0aGlzLCBp
dCBicmVha3MgdG9vbGluZzoKPgo+ICAgICAgICAgYjQgc2hhemFtIDIwMjQwNTIyMTUzODM1LjIy
NzEyLTIta2FuYWtzaGlsbGVkYXIxMTFAcHJvdG9ubWFpbC5jb20KPiAgICAgICAgIEdyYWJiaW5n
IHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA1MjIxNTM4MzUuMjI3MTItMi1r
YW5ha3NoaWxsZWRhcjExMUBwcm90b25tYWlsLmNvbS90Lm1ib3guZ3oKPiAgICAgICAgIENoZWNr
aW5nIGZvciBuZXdlciByZXZpc2lvbnMKPiAgICAgICAgIEdyYWJiaW5nIHNlYXJjaCByZXN1bHRz
IGZyb20gbG9yZS5rZXJuZWwub3JnCj4gICAgICAgICBBbmFseXppbmcgMyBtZXNzYWdlcyBpbiB0
aGUgdGhyZWFkCj4gICAgICAgICBMb29raW5nIGZvciBhZGRpdGlvbmFsIGNvZGUtcmV2aWV3IHRy
YWlsZXJzIG9uIGxvcmUua2VybmVsLm9yZwo+ICAgICAgICAgV2lsbCB1c2UgdGhlIGxhdGVzdCBy
ZXZpc2lvbjogdjMKPiAgICAgICAgIFlvdSBjYW4gcGljayBvdGhlciByZXZpc2lvbnMgdXNpbmcg
dGhlIC12TiBmbGFnCj4gICAgICAgICBDaGVja2luZyBhdHRlc3RhdGlvbiBvbiBhbGwgbWVzc2Fn
ZXMsIG1heSB0YWtlIGEgbW9tZW50Li4uCj4gICAgICAgICBSZXRyaWV2aW5nIENJIHN0YXR1cywg
bWF5IHRha2UgYSBtb21lbnQuLi4KPiAgICAgICAgIC0tLQo+ICAgICAgICAgICDinJMgW1BBVENI
IHYzIDEvMl0gZHQtYmluZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVyOiByaXNjdixjcHUtaW50
YzogY29udmVydCB0byBkdHNjaGVtYQo+ICAgICAgICAgICAgIOKckyBTaWduZWQ6IERLSU0vZ21h
aWwuY29tCj4gICAgICAgICAgICAgKyBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ICAgICAgICAgICBFUlJPUjogbWlzc2luZyBbMi8yXSEK
PiAgICAgICAgIC0tLQo+ICAgICAgICAgVG90YWwgcGF0Y2hlczogMQo+ICAgICAgICAgLS0tCj4g
ICAgICAgICBXQVJOSU5HOiBUaHJlYWQgaW5jb21wbGV0ZSEKPiAgICAgICAgICBCYXNlOiB1c2lu
ZyBzcGVjaWZpZWQgYmFzZS1jb21taXQgMjBjYjM4YTdhZjg4ZGM0MDA5NWRhN2MyYzkwOTRkYTM4
NzNmZWEyMwo+ICAgICAgICAgQXBwbHlpbmc6IGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJv
bGxlcjogcmlzY3YsY3B1LWludGM6IGNvbnZlcnQgdG8gZHRzY2hlbWEKPgo+IElmIHlvdSBjaGFu
Z2Ugb25lIHBhdGNoIGluIGEgc2VyaWVzLCB0aGUgd2hvbGUgc2VyaWVzIGdldHMgYSBuZXcgdmVy
c2lvbi4KPiBKdXN0IGxldCBnaXQgZm9ybWF0LXBhdGNoIGRvIHRoYXQgZm9yIHlvdSB3aXRoIHRo
ZSAiLXYgTiIgYXJndW1lbnQgYW5kCj4geW91J2xsIG5vdCBoYXZlIHRvIHdvcnJ5IGFib3V0IGJy
ZWFraW5nIHBlb3BsZSdzIHRvb2xpbmcuCgpTb3JyeSBmb3IgdGhlIHRvb2xpbmcgYnJlYWtpbmcu
IEkgdXNlZCB0aGUgIi12IE4iIGFyZ3VtZW50IHRvIG1ha2UgdGhlCnYyIHBhdGNoZXMgYnV0IEkg
YnVtcGVkIHVwIHRoZSAicmlzY3YsY3B1LWludGMicGF0Y2gKdG8gdjMgZHVlIHRvIGl0IGJlaW5n
IGluIHYzIGFscmVhZHkgYW5kIGl0IGdhdmUgZXJyb3JzIGluIHRoZSBwcmV2aW91cwpwYXRjaHNl
dCBhbmQgeW91IG1lbnRpb25lZCB0aGF0IEkgbWlzc2VkIHRoZSB2MyBpbiBzdWJqZWN0IGxpbmUu
CkhvdyBzaGFsbCBJIHByb2NlZWQgd2l0aCB0aGlzIHZlcnNpb24gbWlzbWF0Y2g/IFNoYWxsIEkg
bWFrZSB0aGUKcGF0Y2hzZXQgYXMgdjMgYW5kIGhhdmUgYm90aCB0aGUgcGF0Y2hlcyBhdCB2Mz8K
Cj4gUGF0Y2hlcyB0aGVtc2VsdmVzIGFyZQo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKSSBzaGFsbCBpbmNsdWRlIHRoaXMgaW4gbXkgY29t
bWl0IG1lc3NhZ2UuIElzIGl0IHJlcXVpcmVkIHRvIGJ1bXAgdGhlCnZlcnNpb24gb2YgdGhlIHBh
dGNoIGp1c3QgZm9yIHRoZSByZXZpZXdlZCBmbGFnPwoKPiBDaGVlcnMsCj4gQ29ub3IuCgpUaGFu
a3MgYW5kIFJlZ2FyZHMsCkthbmFrIFNoaWxsZWRhcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
