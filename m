Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDD3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XMo6HBWR6u5OOLi5tv8N1wz9/20CMFQ3v2jHpgP6bBI=; b=mFVl0+VHyrN6WjsRBloai6hBdc
	X1NzExuJ2lSTmo+Uy/9c5ChxDvgObtplKJDauGqR3yD9CNdnb7BrMmgywxSw/3zNO6xHjHJlpu0Ds
	1eA5zrrI1sRlkA9iz/BvtRQzLOMHpRC+NaIM0Q9TPWfay/lgz7R0VBp+E3/ZKvAYtTt4UyHVBHP8B
	fI3hf6q6V1RdwyAZz649LhRCspkEpNU4DzwY1PqClHAWrC6RXp1G8Vma530HXPgBkUovEztoLTCsH
	hoAiwdOx3JdXtNH5ZqkcUEw342dYtf6BtVUvzYHPZ8rWTSzNQQ4VJByZyBMY1ANjLjKuarc97KtjJ
	5cX22M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBqS-0000000GwjQ-1yGf;
	Fri, 12 Jul 2024 08:41:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBqQ-0000000GwiY-11Le
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 08:41:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso2237874a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720773692; x=1721378492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlAJm+hon9MJjqPdpWZb17dSrrSb4gCZfoNF5yzi3oQ=;
        b=UHsQN8RZDh2jSesIzFFn3jayjPS0EA3ToQMvxSYz+8yFBkqGatwG54a1rjJJIN2kzY
         MV43oHM4R0otK6EcRBkMIrOJ2BhACb4xTxGwuOM0detwNTgchJbAPAXRs2gOq6JRqC9e
         iL5fYDaMoWD4m8J4uBrITmG4Cdz+ouhWLb11+1gF1n8RYiG22yJtUco7z+r9F1wArFJM
         VGjQ+1H9XyQyyH3nHuuEw0Cv8lIitwcGmwhSFf9bEyUWabb9W9oibU1PsPmqFR17cWSL
         SoREdZk+hR9eVYcuRiBqOtER6+OadFTr0LlkejqV2V9ackz17RbzU3VQFTvtF7pFQaLb
         E7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773692; x=1721378492;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlAJm+hon9MJjqPdpWZb17dSrrSb4gCZfoNF5yzi3oQ=;
        b=uiO0fFNTl/ubUNwr2ti6NlgxsCkSZcHYo1DWcD1oCwgMvx3X/bTI86kVP4FMt6VVX1
         hMu6ZozXjz/47zLUDWjkpUuO9kX5J+oBd82B/UwqY+/HwZBAj3wd1lrjOdiUTVhYaTun
         o3xThFS6D2+/W14ecC498KGhelFIvHX0no4ihq65LQ2teDfNZmaRZ8dw3osoVSm3TFzg
         n+zoI4/s5NEnVr4JqjD3HbRB8l7s4vWoqNy5aadetEVNxWSVHr28sC78ceZ5Mm8LJULW
         H0l9WZNsbuUyaO4yOx8gFOJEBRGDfKd0WyMsbgmknssFH9WClm2ARELzJ24PEUGYC+Wg
         QO2A==
X-Forwarded-Encrypted: i=1; AJvYcCVv4RXBoGcV/eEB6YXqYLL12EmHB5tpD9JLdvUn3bUumsA9AEx0sYEcl+balDBZEBfZze+nMXK7KXJGBHQvqPhQN3I8eI79fUAwVURi7UyC
X-Gm-Message-State: AOJu0Yz6EDLt5/cmIhn9Yj1Cp4hDeLGvQiPw2i2OQOTmY1wBAbgDQRuK
	T4x1+wv5VrMF7b6g84jyC4rWu32i4z1s5iJEHNpHUu3WO8Vpsef1laL13CWY7j0ENT4OPpDg/W7
	M+pu7jseDnJH4izx6Vo5053DwHZI=
X-Received: by 2002:a05:6402:308e:b0:58e:3501:5c0a with SMTP id
 4fb4d7f45d1cf-594baf8d6cfmt5938340a12.11.1720773691396; Fri, 12 Jul 2024
 01:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240705093503.215787-1-kanakshilledar@gmail.com> <20240705093503.215787-2-kanakshilledar@gmail.com>
In-Reply-To: <20240705093503.215787-2-kanakshilledar@gmail.com>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Fri, 12 Jul 2024 14:11:18 +0530
Message-ID: <CAGLn_=tT08KUX0J+WURq=EXKDPj=--Wg3qmCjnzGxNeMcz3NOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] riscv: dts: thead: add basic spi node
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Drew Fustini <drew@pdp7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_014134_307138_AB443514 
X-CRM114-Status: GOOD (  18.25  )
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

SGksCkFueSB1cGRhdGVzIG9uIHRoaXMgcGF0Y2g/CgpUaGFua3MgYW5kIFJlZ2FyZHMsCkthbmFr
IFNoaWxsZWRhcgoKT24gRnJpLCBKdWwgNSwgMjAyNCBhdCAzOjA14oCvUE0gS2FuYWsgU2hpbGxl
ZGFyIDxrYW5ha3NoaWxsZWRhckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gY3JlYXRlZCBzcGkwIG5v
ZGUgd2l0aCBmaXhlZCBjbG9jay4gdGhlIHNwaTAgbm9kZQo+IHVzZXMgc3lub3BzaXMgZGVzaWdu
d2FyZSBkcml2ZXIgYW5kIGhhcyB0aGUgZm9sbG93aW5nCj4gY29tcGF0aWJsZSAic25wcyxkdy1h
cGItc3NpIi4gdGhlIHNwaTAgbm9kZSBpcyBjb25uZWN0ZWQKPiB0byBhIFNQSSBOT1IgZmxhc2gg
cGFkIHdoaWNoIGlzIGxlZnQgdW5wb3B1bGF0ZWQgb24gdGhlIGJhY2sKPiBzaWRlIG9mIHRoZSBi
b2FyZC4KPgo+IEFja2VkLWJ5OiBEcmV3IEZ1c3RpbmkgPGRyZXdAcGRwNy5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogS2FuYWsgU2hpbGxlZGFyIDxrYW5ha3NoaWxsZWRhckBnbWFpbC5jb20+Cj4gLS0t
Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIENoYW5nZWQgdGhlIHBvc2l0aW9uIG9mICJzcGkiIHRvIGNv
bWUgYWZ0ZXIgInNlcmlhbCIgaW4KPiBhbGlhc2VzIGZvciBib3RoIHRoZSBib2FyZHMuCj4gLSBB
ZGRlZCBBY2tlZC1ieSB0YWcuCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFNlcGFyYXRlZCBmcm9tIGEg
c2luZ2xlIHBhdGNoIGZpbGUuCj4gLS0tCj4gIC4uLi9ib290L2R0cy90aGVhZC90aDE1MjAtYmVh
Z2xldi1haGVhZC5kdHMgICAgICB8ICA5ICsrKysrKysrKwo+ICAuLi4vYm9vdC9kdHMvdGhlYWQv
dGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaSAgfCAgNCArKysrCj4gIC4uLi9yaXNjdi9ib290
L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cyB8ICA1ICsrKysrCj4gIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgICAgICAgICAgICB8IDE2ICsrKysrKysrKysr
KysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtYmVhZ2xldi1haGVhZC5kdHMgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cwo+IGluZGV4
IGQ5YjRkZTllNDc1Ny4uYjRkMmUxZDY5YmRiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvdGhlYWQvdGgxNTIwLWJlYWdsZXYtYWhlYWQuZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAtYmVhZ2xldi1haGVhZC5kdHMKPiBAQCAtMjMsNiArMjMsNyBA
QCBhbGlhc2VzIHsKPiAgICAgICAgICAgICAgICAgc2VyaWFsMyA9ICZ1YXJ0MzsKPiAgICAgICAg
ICAgICAgICAgc2VyaWFsNCA9ICZ1YXJ0NDsKPiAgICAgICAgICAgICAgICAgc2VyaWFsNSA9ICZ1
YXJ0NTsKPiArICAgICAgICAgICAgICAgc3BpMCA9ICZzcGkwOwo+ICAgICAgICAgfTsKPgo+ICAg
ICAgICAgY2hvc2VuIHsKPiBAQCAtNTIsNiArNTMsMTAgQEAgJnNkaGNpX2NsayB7Cj4gICAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MTk4MDAwMDAwPjsKPiAgfTsKPgo+ICsmc3BpX2NsayB7Cj4g
KyAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8Mzk2MDAwMDAwPjsKPiArfTsKPiArCj4gICZ1YXJ0
X3NjbGsgewo+ICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMDAwMD47Cj4gIH07Cj4g
QEAgLTc5LDMgKzg0LDcgQEAgJnNkaW8wIHsKPiAgJnVhcnQwIHsKPiAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiAgfTsKPiArCj4gKyZzcGkwIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsK
PiArfTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGlj
aGVlLW1vZHVsZS00YS5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGlj
aGVlLW1vZHVsZS00YS5kdHNpCj4gaW5kZXggMTM2NWQzYTUxMmEzLi42OTM5YmQzNjU2MGMgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLW1vZHVs
ZS00YS5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVl
LW1vZHVsZS00YS5kdHNpCj4gQEAgLTMzLDYgKzMzLDEwIEBAICZzZGhjaV9jbGsgewo+ICAgICAg
ICAgY2xvY2stZnJlcXVlbmN5ID0gPDE5ODAwMDAwMD47Cj4gIH07Cj4KPiArJnNwaV9jbGsgewo+
ICsgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDM5NjAwMDAwMD47Cj4gK307Cj4gKwo+ICAmdWFy
dF9zY2xrIHsKPiAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+ICB9Owo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGkt
NGEuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0
cwo+IGluZGV4IDlhMzg4NGE3M2UxMy4uNzczOGQyODk1YzVhIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiArKysgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4gQEAgLTIwLDYg
KzIwLDcgQEAgYWxpYXNlcyB7Cj4gICAgICAgICAgICAgICAgIHNlcmlhbDMgPSAmdWFydDM7Cj4g
ICAgICAgICAgICAgICAgIHNlcmlhbDQgPSAmdWFydDQ7Cj4gICAgICAgICAgICAgICAgIHNlcmlh
bDUgPSAmdWFydDU7Cj4gKyAgICAgICAgICAgICAgIHNwaTAgPSAmc3BpMDsKPiAgICAgICAgIH07
Cj4KPiAgICAgICAgIGNob3NlbiB7Cj4gQEAgLTMwLDMgKzMxLDcgQEAgY2hvc2VuIHsKPiAgJnVh
cnQwIHsKPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPiArCj4gKyZzcGkwIHsKPiAr
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLmR0c2kKPiBpbmRleCBkMmZhMjU4MzkwMTIuLmY5NjJkZTY2M2U3ZSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+IEBAIC0xNDAsNiArMTQwLDEyIEBAIGFwYl9j
bGs6IGFwYi1jbGstY2xvY2sgewo+ICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47
Cj4gICAgICAgICB9Owo+Cj4gKyAgICAgICBzcGlfY2xrOiBzcGktY2xvY2sgewo+ICsgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPiArICAgICAgICAgICAgICAgY2xv
Y2stb3V0cHV0LW5hbWVzID0gInNwaV9jbGsiOwo+ICsgICAgICAgICAgICAgICAjY2xvY2stY2Vs
bHMgPSA8MD47Cj4gKyAgICAgICB9Owo+ICsKPiAgICAgICAgIHVhcnRfc2NsazogdWFydC1zY2xr
LWNsb2NrIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4g
ICAgICAgICAgICAgICAgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJ1YXJ0X3NjbGsiOwo+IEBAIC0x
ODMsNiArMTg5LDE2IEBAIGNsaW50OiB0aW1lckBmZmRjMDAwMDAwIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcHUzX2ludGMgMz4sIDwmY3B1M19p
bnRjIDc+Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAgIHNwaTA6IHNw
aUBmZmU3MDBjMDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInRo
ZWFkLHRoMTUyMC1zcGkiLCAic25wcyxkdy1hcGItc3NpIjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHhmZiAweGU3MDBjMDAwIDB4MCAweDEwMDA+Owo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMgPSA8NTQgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZzcGlfY2xrPjsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlz
YWJsZWQiOwo+ICsgICAgICAgICAgICAgICB9Owo+ICsKPiAgICAgICAgICAgICAgICAgdWFydDA6
IHNlcmlhbEBmZmU3MDE0MDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gInNucHMsZHctYXBiLXVhcnQiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eGZmIDB4ZTcwMTQwMDAgMHgwIDB4MTAwPjsKPiAtLQo+IDIuNDUuMgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
