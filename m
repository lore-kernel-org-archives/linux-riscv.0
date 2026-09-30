Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F5DCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zWvy/I45ZTj7z8dQ7X58drbLmOEfoo0KNw5ACVJcOQ=; b=T1XbJyXrtKWMzH
	rBLjyp8TFvxW2EUjrTbfclv1lwYy8EVXVSzWyzgp+YZuFyT1SRHEzo60yDy68mN+4jB6NfD/TpfYy
	EBNVdvmrJQuih9jL5JvOgs40JZIb3LHIgvdpJkNOuF6cwT/9WAXGGKkr2jVUCLFAM9iFaJvyCrdfY
	AeDqeeNxx+2G3mQWUc0gR9FJH6wK+9BJvGPNbOZn0XxNiWGYSoK43oUi5Rwrdw4CZZzhgM/PgPMXQ
	m81n8I0I+tHhYZ8tskyBlcfIKixYWbCl4SJ6eVw5d3IKsK+Yj4/ZIAQFVDdVQCJkzztDHOdJg/cfF
	+//clispbEmp2+17N+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoqH-00000005HX2-2K1m;
	Wed, 30 Sep 2026 07:35:05 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoqE-00000005HVn-1av1
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 07:35:03 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 956f58d0204a3-672f516c271so4485703d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 00:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753700; cv=none;
        d=google.com; s=arc-20260327;
        b=MwfRwB6dOcdxxHJCt+qa5K3LPp4C3qSKLNAitoSy5WUNV9jI30AEh7ElGf9ZEJ4hE3
         Ljwx30kuzK6Z8oIJSj9tXps5On/7BWT9Fh+VK9P5ucnWoy7fCWppht2PIb0CjrSqi/CR
         nbYi8u87dXz5qU/cbghByaFhsHrDoaFgYcdUPuX8uUgdsc8X6lQ9mcKNzeNb4PHUz7AF
         AohbkZ2lQsopNmm+v40mbuH5ibQHZ9wIku3u++T/PIc2zOaemWiMJQMOcEOeMXldFZi3
         B3c1ZWA7Jd051X18lCUnAO1HmNxamAhn7zxot5NPHDTywrsYVm6P4flcpvyxgobMy9/O
         /n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        fh=sC5CashjwXFUBM5EoKMnNzKjrJnN8IEElj7KAHcXh9k=;
        b=I7TsPnsgXZZHiQ2EQG0NmeTP7X684hRz/r8ifP5MGV9SAr8ALZYDlu8yY23EOfdmax
         YJ+sZXTPFQszuTaAxN6hZ1bVuj9pU3DF+3rBnCPaPvecMFOHp2bxWCQ8Xn5hJ3y1acqb
         +bSxgeJR/42cSAV6+wJ5pcXJWtNdG4DzkjJDRyENJweNnl2PVAXEd0vCI6sEQYfy5M3T
         7iHj3TGhcD+7K0kYspZVEvz66iMgAmbuG1rygwISmjdDpo/ZdoMmXhJC9yhI28z3YTEX
         Wh2M+ocMynKhw2IefxNq+xd3eT1/i6ZPEtGYw1y58aadl0auYM+NuNT8920kco9RsAlI
         4nIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753700; x=1791358500; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=EI+MWKAGOzHKudpx33Hjl/jL13GNnkOO+4+FAVX/WErLyP4g75cQbGmFXyj8hlxDeg
         zwCSBq8UWsFL6K90TRLQmSY6NfAK3nEerKuPiMNZEOtxbieNNCYbE91zWHv7iYzHw79S
         SAgIoIETdpVclmxZUl+DFGwg2vmcQTC35FDNM8QUpkgzaHDCgk9UJQ2H5YTV6syTvrx/
         ZCOH4IllqXjtfERZn+TSDhxQzJtsXhGJrIJojj/T5j08Z84EocqkwanLeXfNUvLs8zd9
         2IzCjvj4H7AmeCitxvAGyoJwRg/gUHB1lFRp8WdsGQz2eRl/gW6RHj8FUp8pQyz9pKpe
         u6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753700; x=1791358500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alnGC7QYwJbPFNUM3QnHg0RAFZjihcm08X+U2/8RiW4=;
        b=pTFtfKGNMe7diKHSHpkLxJSIga7ChNbKdO0HZdHgDrVo5ITvHkC+Y3Nw/DGeJ9rale
         bN41YGwokFjOy0vsMvoT5Z0zAh09aSQmvxB7MGpgVm3h4eXgX73tjon14HFuTAkZU0Vd
         B2xDl5MKo0S9+eW5OHUyn4LMhi8JD842ecxETQiQSMJsl4JMhCthPJUsDyz9uVHQq8qP
         G08f0p4sexdRSGlBe1nJmcEDEUH7G02pK3i2E4sAls3bJjtRecXfx5GsvMQL5tWtHoe5
         06SLBaHQs9DsdEVHOJjY5lA5aCf1LpVxkKhHhInv/h+4Z8MYpcnukdkPJyKD9NcfFFx+
         qZog==
X-Forwarded-Encrypted: i=1; AKwUvBypmsUkcx3mmmpB+9dQiRgcNE2wolJhselpm4d0xJH5pscmiwBV0JDzG5BFj4uq5z8FbqNNaXn1P7FGLQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYL2aUn/DKG23nRD4bUAaDFPvkB54LplMysc6bv6G6n/pGDtoRcL
	pR70gT6EduzRtmzPBc5BU7vOcUzo34WFJgsRGNwWDB606utzrJhU+gnjIQEel8FYNKYyLKTPzcg
	gIirc8AT9e0TKAl97s1vWFCMYnzuyMQo=
X-Gm-Gg: AYBFou3JXladtCCyiIqd1L7Rq69szyoIcg5jKvBNfr5Vgm5Fv7psJ4IkDcrBCkqsUGB
	z4qDM//NbbUrO46k3VeVz27ZrLJOQBi4t3TvBtHLiUnj4Qx0GoXE6PVrUfNiqyxM5yE9lxjGz7R
	YmVwqYOzM8jvtFbuAn7he4ObMOp0PYqj8ywTqJY+2BHz5ag2Oc/wKX5m2xrMUru/OscDvQe1Vli
	IOGAmNDzc6lDqich8STS/5i2WXMaSXUiQadVQA0hrVA/E/8La8ImKmnmgtT/WKnPiMoTh3dGC9t
	deHOWWWbZKjINF1hmwR1kfCMc/aXwgLLr8XP/0MdpTh4jCY71Lqs6Go=
X-Received: by 2002:a05:690e:400c:b0:675:7032:8062 with SMTP id
 956f58d0204a3-67683474481mr300251d50.44.1790753700150; Wed, 30 Sep 2026
 00:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260929120227.1791356-1-jberring@redhat.com>
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 30 Sep 2026 09:34:48 +0200
X-Gm-Features: AclHuK_3trlIGgLtvQDHQQi_YWTxQaLNnpU_H3rtwKQgUONqn5KgGLq9lRZ6SJ0
Message-ID: <CABdCQ=PvdfX+ZwF1VbQR+LSh0ZwhP4T8zSb-8+Wh4Y=L67LjUA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on
 OrangePi RV2
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vincent Legoll <legoll@online.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_003502_429939_C05E699D 
X-CRM114-Status: GOOD (  15.75  )
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

UmV2aWV3ZWQtYnk6IElrZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KCkVsIG1h
ciwgMjkgc2VwdCAyMDI2IGEgbGFzIDE0OjEwLCBKZW5uaWZlciBCZXJyaW5nZXIKKDxqYmVycmlu
Z0ByZWRoYXQuY29tPikgZXNjcmliacOzOgo+Cj4gU2V0IHRoZSBiYXVkIHJhdGUgdG8gMTE1MjAw
LCBtYXRjaGluZyB3aGF0IGlzIHVzZWQgYnkgVS1Cb290IG9uIHRoaXMKPiBwbGF0Zm9ybSBzbyB0
aGF0IHRoZSBjb25zb2xlIGlzIHVzYWJsZSBldmVuIHdoZW4gY29uc29sZSBvcHRpb25zIGFyZSBu
b3QKPiBzcGVjaWZpZWQgaW4gY21kbGluZS4KPgo+IEZpeGVzOiBiYWI4ZGVhMjU5MTAwICgicmlz
Y3Y6IGR0czogc3BhY2VtaXQ6IEFkZCBPcmFuZ2VQaSBSVjIgYm9hcmQgZGV2aWNlIHRyZWUiKQo+
IFRlc3RlZC1ieTogVmluY2VudCBMZWdvbGwgPGxlZ29sbEBvbmxpbmUuZnI+Cj4gUmV2aWV3ZWQt
Ynk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEplbm5pZmVy
IEJlcnJpbmdlciA8amJlcnJpbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+
IC0gQ29sbGVjdCB0YWdzCj4gLSBSZWJhc2Ugb250byBzcGFjZW1pdC9kdC1mb3ItbmV4dAo+Cj4g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2VtaXQvMjAyNjA1MjAxMTEx
NTAuMzMwMDcwNy0xLWpiZXJyaW5nQHJlZGhhdC5jb20vCj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gaW5kZXggMGNmNjBkMTk4NTYw
NC4uZDhiMmNhY2U0ZTdhMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2sxLW9yYW5nZXBpLXJ2Mi5kdHMKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2sxLW9yYW5nZXBpLXJ2Mi5kdHMKPiBAQCAtMjUsNyArMjUsNyBAQCBhbGlhc2VzIHsKPiAg
ICAgICAgIH07Cj4KPiAgICAgICAgIGNob3NlbiB7Cj4gLSAgICAgICAgICAgICAgIHN0ZG91dC1w
YXRoID0gInNlcmlhbDAiOwo+ICsgICAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICJzZXJpYWww
OjExNTIwMG44IjsKPiAgICAgICAgIH07Cj4KPiAgICAgICAgIGxlZHMgewo+Cj4gYmFzZS1jb21t
aXQ6IDQ5NDdlZTYwYmY0OGNhZGRmNWNhZWZjMDhkYmJjODRkMDlmYmJjNmIKPiAtLQo+IDIuNTUu
MAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
