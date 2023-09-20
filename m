Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517B0CE79CF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI4QVIEQqqN+2DCR1f5XPNU5BEEN48/Eols/mQyllKY=; b=CcM4P2PmPRfo/O
	iw11W1FHWep4UJDBCtAVDBEhtF5Wu/H7/pKzyV8iOnU2EpvNqsiBjsCCQE2i5OoIqnYGcqwFPeo7k
	TJovr6tUMvc3ynlGuxQxbFJVSPWJ5nOjG99aRbfMb5SF6QMxL1Lrf2+dEttHNGtGSZN5nANU/kbOD
	HDk51OUIUo/YPZTluIlPtoV6hQzuyW12nWft9mXSjkv/0+hlzTJOIZPIAmvg6sjhDsqER5BBXaTH9
	P/M5BAsMa8HUwWuP2szY7+6heKXVl1nKYCEQu9rCW7/EKzVDxijcRUqp8CyKAMTd/F0K3ON2uhV7B
	v2jfksaWaFWomVwTDiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qivwC-002xl2-1T;
	Wed, 20 Sep 2023 12:04:12 +0000
Received: from smtp85.cstnet.cn ([159.226.251.85] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qivw8-002xjD-0u
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 12:04:11 +0000
Received: from wangchen20$iscas.ac.cn ( [222.95.63.58] ) by
 ajax-webmail-APP-13 (Coremail) ; Wed, 20 Sep 2023 20:03:50 +0800
 (GMT+08:00)
X-Originating-IP: [222.95.63.58]
Date: Wed, 20 Sep 2023 20:03:50 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5rGq6L6w?= <wangchen20@iscas.ac.cn>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Cc: "Chen Wang" <unicornxw@gmail.com>, aou@eecs.berkeley.edu, 
	chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org, 
	emil.renner.berthing@canonical.com, guoren@kernel.org, 
	jszhang@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, xiaoguang.xing@sophgo.com
Subject: Re: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042
 bindings
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230321(1bf45b10)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
In-Reply-To: <ec11eb6a-c37b-08bd-5997-8fc390fd58c8@linaro.org>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <ec11eb6a-c37b-08bd-5997-8fc390fd58c8@linaro.org>
MIME-Version: 1.0
Message-ID: <3d2bba58.29898.18ab279a15c.Coremail.wangchen20@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: twCowAB3BOam3wpl01IMAA--.34858W
X-CM-SenderInfo: 5zdqwuhkhqji46lvutnvoduhdfq/1tbiBwIABmUKzVQmtwABsl
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_050408_713919_C4AF1626 
X-CRM114-Status: UNSURE (   4.64  )
X-CRM114-Notice: Please train this message.
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

U29ycnksIG15IG1pc3Rha2UgdG8gZm9yZ2V0IGFkZGluZyB0aGUgdGFnLCB3aWxsIGFkZCBpbiBu
ZXh0IHJldmlzaW9uLgoKCiZndDsgLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQomZ3Q7IOWPkeS7tuS6
ujogIktyenlzenRvZiBLb3psb3dza2kiIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
CiZndDsg5Y+R6YCB5pe26Ze0OiAyMDIzLTA5LTIwIDE5OjU1OjMwICjmmJ/mnJ/kuIkpCiZndDsg
5pS25Lu25Lq6OiAiQ2hlbiBXYW5nIiA8dW5pY29ybnh3QGdtYWlsLmNvbT4sIGFvdUBlZWNzLmJl
cmtlbGV5LmVkdSwgY2hhby53ZWlAc29waGdvLmNvbSwgY29ub3JAa2VybmVsLm9yZywgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20s
IGd1b3JlbkBrZXJuZWwub3JnLCBqc3poYW5nQGtlcm5lbC5vcmcsIGtyenlzenRvZi5rb3psb3dz
a2krZHRAbGluYXJvLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZywgcGFsbWVyQGRhYmJlbHQuY29tLCBwYXVsLndhbG1zbGV5
QHNpZml2ZS5jb20sIHJvYmgrZHRAa2VybmVsLm9yZywgeGlhb2d1YW5nLnhpbmdAc29waGdvLmNv
bQomZ3Q7IOaKhOmAgTogIkNoZW4gV2FuZyIgPHdhbmdjaGVuMjBAaXNjYXMuYWMuY24+CiZndDsg
5Li76aKYOiBSZTogW1BBVENIIHYyIDAzLzExXSBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBzb3Bo
Z28gc2cyMDQyIGJpbmRpbmdzCiZndDsgCiZndDsgT24gMjAvMDkvMjAyMyAwODozNywgQ2hlbiBX
YW5nIHdyb3RlOgomZ3Q7ICZndDsgQWRkIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhl
IFNvcGhnbyBTRzIwNDIgU29jIFsxXSBhbmQgdGhlCiZndDsgJmd0OyBNaWxrLVYgUGlvbmVlciBi
b2FyZCBbMl0uCiZndDsgJmd0OyAKJmd0OyAmZ3Q7IFsxXTogaHR0cHM6Ly9lbi5zb3BoZ28uY29t
L3Byb2R1Y3QvaW50cm9kdWNlL3NnMjA0Mi5odG1sCiZndDsgJmd0OyBbMl06IGh0dHBzOi8vbWls
a3YuaW8vcGlvbmVlcgomZ3Q7IAomZ3Q7IFRoaXMgaXMgYSBmcmllbmRseSByZW1pbmRlciBkdXJp
bmcgdGhlIHJldmlldyBwcm9jZXNzLgomZ3Q7IAomZ3Q7IEl0IGxvb2tzIGxpa2UgeW91IHJlY2Vp
dmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRkIGl0LgomZ3Q7IAomZ3Q7IElmIHlvdSBkbyBub3Qg
a25vdyB0aGUgcHJvY2VzcywgaGVyZSBpcyBhIHNob3J0IGV4cGxhbmF0aW9uOgomZ3Q7IFBsZWFz
ZSBhZGQgQWNrZWQtYnkvUmV2aWV3ZWQtYnkvVGVzdGVkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5l
dwomZ3Q7IHZlcnNpb25zLCB1bmRlciBvciBhYm92ZSB5b3VyIFNpZ25lZC1vZmYtYnkgdGFnLiBU
YWcgaXMgInJlY2VpdmVkIiwgd2hlbgomZ3Q7IHByb3ZpZGVkIGluIGEgbWVzc2FnZSByZXBsaWVk
IHRvIHlvdSBvbiB0aGUgbWFpbGluZyBsaXN0LiBUb29scyBsaWtlIGI0CiZndDsgY2FuIGhlbHAg
aGVyZS4gSG93ZXZlciwgdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0
byBhZGQKJmd0OyB0aGUgdGFncy4gVGhlIHVwc3RyZWFtIG1haW50YWluZXIgd2lsbCBkbyB0aGF0
IGZvciB0YWdzIHJlY2VpdmVkIG9uIHRoZQomZ3Q7IHZlcnNpb24gdGhleSBhcHBseS4KJmd0OyAK
Jmd0OyBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41LXJjMy9zb3VyY2UvRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDU3NwomZ3Q7IAomZ3Q7
IElmIGEgdGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwgcGxlYXNlIHN0YXRlIHdoeSBhbmQg
d2hhdCBjaGFuZ2VkLgomZ3Q7IAomZ3Q7IEJlc3QgcmVnYXJkcywKJmd0OyBLcnp5c3p0b2YKCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkJlc3QgUmVnYXJkcyAKIAog5rGq6L6wKFdh
bmcgQ2hlbikgCgo8L3dhbmdjaGVuMjBAaXNjYXMuYWMuY24+PC91bmljb3JueHdAZ21haWwuY29t
Pjwva3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
