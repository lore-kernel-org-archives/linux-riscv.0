Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566BFC4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uTO5n66yVzL1T68eVinqP5a+gkO7crBqy2s5Vo+iNM=; b=Tdz+01bgHAIdpU
	6Ub7pudqh//EK/OrRCzgIpX/XRnWS/P71tnawUj0bAz96dkLtkCVpkcTL8bxFE6oPDkuFOMX1uyj+
	lU7oJ3QD7knMUpN5x7xcJ2dA+1XEMT12TPUvWfoekxg6BPV/ZqNJBHpBFXYYiO8uN+njFFGZwQoXb
	qSFpLOGeRaEdUvb4sdE6hPjwtMgauKJs3TDA+gzJ7KoIEiiKwYjbDB22w1twUCzw608eGaON/GgTT
	SxzBtb5xR3Z+f+gFoiEWUkjD6OtPv29pzFVHlCQoNt0ZQPH1/molAaPfr352cMSazBkS1wsMhqv0T
	ZZ4wU5X+bZGiGiyqtVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEhv-0000000A8WW-3hfK;
	Tue, 21 Jul 2026 17:56:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEhs-0000000A8W6-0pZZ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 17:56:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceae1ed204so96912245ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784656599; x=1785261399; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EibvRmzRwEGHkazysuYtnr7BudsAqWjL7jIqkEVJ+pw=;
        b=Vqra93IpIf6CXOwF9dTXLvNZP5xjCfkQDP/NaQ2CyE1b9OhJbmy2/1bJKQZVQIVt9I
         fw58XuoEKbyfnmDG/zhE/AjoLfK/xT6ECVXoj7jBeVoOaLJyiX7InCUiQXMbkhxs7Rgp
         J24Mfjd4qKaFn5sTp+1VwS6TU8kD6aSovpO6+qcAtkAa9iSTz1qfzo8el0XwBvsjttfe
         v1+sVPWMtp0ZT3OF/AFZpZjk+6Ty/vlLV6AjuL7XWAy/1ITgiL0ELETvPfUG63O9LC7m
         xe753kRuEie+09mlhsYFbBKKTDR57KxTu/27KH/e++NI/X8bcD1Tko4oXe4xiG/nnPpZ
         PK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656599; x=1785261399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EibvRmzRwEGHkazysuYtnr7BudsAqWjL7jIqkEVJ+pw=;
        b=MsR5wDiMQ6WAqA2b0hE/7eUM+qasXOUTcBCm4dBZquI85Y1uH9IiZ56SnwNCuI+89K
         IgeF2flHKMf02vfR/2YWJ0c/RmYiyE1t0DSB7fG+l1Q7uxjYSv4H5nIucx3XBuBOzvwT
         txmhNBoM8qteG8YOoUT1ZkwkE0HQx3KOh630pg0a2BDu2c2fWwictxxbbCGh4sLI/2Qv
         UWgoOcmMJt0C0kqLiy1vwZO0yKk0wug6uD50MSG26G32t4/DZLQThH37gD3/3KDiB/RK
         tluYNW3P6JdfGK6wdiJqHarJFiUdofdd9i7wq0+atu8sjCIInFHBNUQJwGOXCH/cXo4w
         U5Rw==
X-Forwarded-Encrypted: i=1; AHgh+RqGnblsOPTTgqXQwl6NvPQRzvApxt4DcPLN1gGTq/TghOlptY3GbJujXr1wPQCwSp6IkzOjX6+/1ZKioA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5DU+aGMObquU/6aP0cv68n3eOG/qrAASfZ1vIrM0qDVEBf4CN
	m8mS1N/vaxeSD7UXn4MZDQuN4HfX1w1L480cvRRrmANVctVARxcS3U6L
X-Gm-Gg: AR+sD10czR2mkeQeztP/KwV1BBk88DIluUByDeBXANPzEvyLr8GU/1eh7DhGTqf/Q+j
	gzTsHdo8kLuezUtNQFkj1ox/+HqUFd2eNIk/GDB6uCU9+Rnb5i9hmnqBHwX3cvCWT06kSp29TWw
	CKona+riEN1ejI4FODNU8Q4ENVkTQVIu9TD/0u0BWAGP69mnYq3YSnUPvjloFj1hB1eLT8xwEHA
	hcGwO2VYrqs5kKM2yp+FSPretuSnRRpOgiuoU6prZUXwJnZIUveiMl80WQriPJr/Vj9um82Jt0q
	AwOZrv2jMMc/xLlJjhylnZ8mZvY4hTVZwF1HpyG3LnlBIuMXIFun1/5AIY7nFKBj0umHLuoYOAs
	O6P+TEeOZcECtIW9aVfeD9ZWIxJsO6kFTqsMQutrAJDMwHLXC7sQf/hgc2VuzgaXMSLGuluUFjr
	BhdlATHFxetzW9HeKtKjAOKOIO61eBW3TXe0np4WQBM/b6C6DcFBy7qR4d9PYuRw==
X-Received: by 2002:a17:902:d486:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2cf3487e320mr208898165ad.12.1784656598500;
        Tue, 21 Jul 2026 10:56:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f362e00sm828255ad.71.2026.07.21.10.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:56:37 -0700 (PDT)
Message-ID: <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
Date: Tue, 21 Jul 2026 10:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
To: Conor Dooley <conor@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
 <20260721-dill-dab-df15585090d2@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260721-dill-dab-df15585090d2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_105640_266404_91F485B5 
X-CRM114-Status: GOOD (  14.87  )
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

T24gNy8yMS8yNiAwODo0OSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDIxLCAy
MDI2IGF0IDAyOjQ4OjI3QU0gLTA3MDAsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4+IEFkZCB0aGUg
dmVuZG9yIHByZWZpeCBmb3IgU2Vuc3lsaW5rIE1pY3JvZWxlY3Ryb25pY3MuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguZGV2Pgo+PiAtLS0K
Pj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwgfCAyICsrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sCj4+IGluZGV4IDM5NjA0NGYzNjhlNy4uMjJkMGQyNmYxYmJkIDEwMDY0NAo+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwK
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sCj4+IEBAIC0xNDY3LDYgKzE0NjcsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPj4gICAg
ICAgZGVzY3JpcHRpb246IFNlbnNpcmlvbiBBRwo+PiAgICAgIl5zZW5zb3J0ZWssLioiOgo+PiAg
ICAgICBkZXNjcmlwdGlvbjogU2Vuc29ydGVrIFRlY2hub2xvZ3kgQ29ycG9yYXRpb24KPj4gKyAg
Il5zZW5zeWxpbmssLioiOgo+PiArICAgIGRlc2NyaXB0aW9uOiBTZW5zeWxpbmsgTWljcm9lbGVj
dHJvbmljcyBUZWNobm9sb2d5IENvLiwgTHRkLgo+IAo+IEdvb2dsaW5nIHRoZSBjb21wYW55IHRv
IHNlZSB3aGF0IHRoZWlyIHdlYnNpdGUgaXMsIEkgc2VlbSB0byBzZWUgYQo+IGRpZmZlcmVudCBu
YW1lIGZvciB0aGUgY29tcGFueTogU2hhbmdoYWkgU2Vuc3lsaW5rIE1pY3JvZWxlY3Ryb25pY3Mg
SW5jLgo+IFRoZWlyIHdlYnNpdGUgaGFzIHRoYXQgd2l0aCB0aGUgU2hhbmdoYWkgZHJvcHBlZC4K
PiAKPiBBbHNvLCBwcm9iYWJseSB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGNvbnRhaW4KPiBM
aW5rOiBodHRwczovL2VuLnNlbnN5bGluay5jb20vCj4gCgpBc2tpbmcgR29vZ2xlIHNlYXJjaDog
IldoeSB0aGUgdHdvIG5hbWVzID8gRGlkIHRoZXkgcmVuYW1lIHRoZW1zZWx2ZXMgYXQgc29tZSBw
b2ludCA/IgoKUmVzcG9uc2U6CgpVbmRlcnN0YW5kaW5nIHRoZSBOYW1lIFN0cnVjdHVyZQoKMS4g
RW5nbGlzaCBMZWdhbCBOYW1lIHZzLiBNYXJrZXRpbmcgQWJicmV2aWF0aW9uCgpTZW5zeWxpbmsg
TWljcm9lbGVjdHJvbmljcyBUZWNobm9sb2d5IENvLiwgTHRkLjoKVGhpcyBpcyB0aGUgbGl0ZXJh
bCB0cmFuc2xhdGlvbiBvZiB0aGVpciBmdWxsLCBmb3JtYWwgcmVnaXN0ZXJlZCBjb3Jwb3JhdGUg
bmFtZQp1c2VkIGZvciBpbnRlcm5hdGlvbmFsIHRyYWRlLCBjdXN0b21zLCBhbmQgbGVnYWwgZG9j
dW1lbnRhdGlvbi4KClNlbnN5bGluayBNaWNyb2VsZWN0cm9uaWNzIEluYy46ClRoaXMgaXMgYSBz
aW1wbGlmaWVkLCBXZXN0ZXJuaXplZCBhYmJyZXZpYXRpb24gdXNlZCBvbiB0aGVpciBvZmZpY2lh
bApFbmdsaXNoIHdlYnNpdGUgYW5kIG1hcmtldGluZyBtYXRlcmlhbHMgZm9yIGNsZWFuZXIgZ2xv
YmFsIGJyYW5kaW5nLgoKMi4gVGhlIE5hdGl2ZSBDaGluZXNlIE5hbWUKCuS4iua1t+eUs+efveWH
jOW+rueUteWtkOenkeaKgOiCoeS7veaciemZkOWFrOWPuCAoU2hhbmdoYWkgU2hlbnhpbGluZyBN
aWNyb2VsZWN0cm9uaWNzIFRlY2hub2xvZ3kKQ28uLCBMdGQuKTogVGhpcyBpcyB0aGUgY29tcGFu
eSdzIHNvbGUsIG9mZmljaWFsIGxlZ2FsIG5hbWUgcmVnaXN0ZXJlZCB3aXRoCnRoZSBDaGluZXNl
IGdvdmVybm1lbnQuCgoiU2Vuc3lsaW5rIiBpcyBhIHBvcnRtYW50ZWF1IGNyZWF0ZWQgc3BlY2lm
aWNhbGx5IGZvciBpbnRlcm5hdGlvbmFsIG1hcmtldHMsCmJsZW5kaW5nICJTZW5zaW5nIiAodGhl
aXIgY29yZSB0ZWNobm9sb2d5KSBhbmQgIkxpbmsiICh0aGVpciBpbnRlcmZhY2UgYW5kCmNvbm5l
Y3Rpdml0eSBwcm9kdWN0cykuCgpQcm9kZGluZyBmdXJ0aGVyLCBhc2tpbmcgaWYgdGhlIHByZXZp
b3VzIHJlc3BvbnNlIHdhcyBjb21wbGV0ZSwgaXQgdGVsbHMKbWUgdGhhdCB0aGVyZSB3YXMgYSBu
YW1lIGNoYW5nZToKCkFjY29yZGluZyB0byBDaGluZXNlIGNvcnBvcmF0ZSByZWdpc3RyeSBkYXRh
ICh2aWEgVGlhbnlhbmNoYSBhbmQgUWNjKSwKdGhleSBkaWQgY2hhbmdlIHRoZWlyIG9mZmljaWFs
IENoaW5lc2UgbGVnYWwgbmFtZToKCk9sZCBOYW1lOiDkuIrmtbfnlLPnn73lh4zlvq7nlLXlrZDn
p5HmioDmnInpmZDlhazlj7ggKFNoYW5naGFpIFNlbnN5bGluayBNaWNyb2VsZWN0cm9uaWNzIFRl
Y2hub2xvZ3kKQ28uLCBMdGQuKQoKTmV3IE5hbWU6IOS4iua1t+eUs+efveWHjOW+rueUteWtkOen
keaKgOiCoeS7veaciemZkOWFrOWPuCAoU2hhbmdoYWkgU2Vuc3lsaW5rIE1pY3JvZWxlY3Ryb25p
Y3MgVGVjaG5vbG9neQpDby4sIEx0ZC4gYnkgU2hhcmVzIC8gSm9pbnQtU3RvY2sgQ29tcGFueSkK
CkkgZG9uJ3Qga25vdyBpZiBMaW51eCBoYXMgYSBwb2xpY3kgYWJvdXQgTGVnYWwgdnMuIE1hcmtl
dGluZyBuYW1lcy4gUGVyc29uYWxseQpJIGRvbid0IGhhdmUgYW4gb3Bpbmlvbi4gWW91ciBjYWxs
LCByZWFsbHkuCgpHdWVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
