Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B78BC678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBM98YkJrRMiHbOjTqT56ZvJUTWiwKBhHC2ypl/Tnow=; b=khOPG9jDPdLfFd
	1kHI0TN2wlvb+DyjEuOGuZwj/cGI2/JQi9YXBOiuMyc36QeNd2YP5hIvdmKXWAjnNTCDZx0UkJ4kL
	uRDOsXQ/Tr464v9EgGjqYzhWopIAqtGdMdXWBK9HwnQgKrnVNwuem8huzTtMtmr93UqaFHHvx+GI7
	i+utqm5pu/thNK11Jtdl6KAsnXp8hltvRrZP/mIeRa55Toxx7gHI/T97LMIDKrd1VJcSu/ZhKMPcH
	2TKPRRM9Vssr7qj3mXdzWNcd+mp3GCMoIpK1CLoGuNX2RJnCF41DxpsE+3M0D0JMkUWnglGF2kBO8
	i0QZL7c6QAySy/sdWNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWMB-0005ZY-4b; Tue, 07 Mar 2023 12:23:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWM7-0005XX-N2
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 12:23:49 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B84D941B42
	for <linux-riscv@lists.infradead.org>; Tue,  7 Mar 2023 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678191821;
	bh=gcBjgTyFzqziFUQTuD3fuF6hhRUdHz1Lc7VypcmVc5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WpJE/LXCYJbGg7pIZwbw8HzM5FpbcRF62miUduTwPndq1IjX8sb32x8kx3ZsbFNGY
	 xtm1yw0KEreCekiaeMjzeW3UPHguVbT8pCdlibzmYdOVgZF1eo8cMjMzGec6tL6mF3
	 +qSSUaWFtQpmFAnjtjs6GjIfbYAR6VzIc9+Qwkpykw9ANpu5Qv9uyrxs7/8rFbhSaF
	 eOVlcEVz0V7gVLjVWHzD6qI/rca/Y3B52kM4w5UQtGw0G/eJnj7oOZnykufl9modKr
	 wpI4jivy3ES8sE1CWIXL9BikULTnZhm5OkMTF3gaWy29xVvBmRmUU8/8B79zmLVOfK
	 Sd0pMdVQCTznQ==
Received: by mail-qv1-f70.google.com with SMTP id y3-20020a0cec03000000b0056ee5b123bbso7400419qvo.7
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 04:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678191820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcBjgTyFzqziFUQTuD3fuF6hhRUdHz1Lc7VypcmVc5Y=;
        b=0wIkjqyT2xMWjZQVfvSodjD3RpszmIGnshkHovEJryyXYRnLqLH4kcKsjAoNHpyNKV
         f1NWwKGcnU3pJpjM8vBn8zKWJZSeu4UqF+Tnytd2q2gxywe79N5PtGNhU4hL44uKcVFC
         il+FXfzUoOiHHumMSFnHdzFv11eALmyDrjQkQusk2N8QIMDyDugfku29REeldsxkcO20
         a9XoftTE57a2sGtRHoClLA7EB44xEkI7vxdx9CfldUONlEZmXlA2+FFFsMPxRV7q6dXZ
         WZHnxgedOV4K3O9tt38lHAH35khheEJWqoFzBUdQUB2Wj/ujeiq/lw15UauZKRh8fMy4
         VMDg==
X-Gm-Message-State: AO0yUKVfAXa1jwEbdvBIAxpwpyhiNprx7xzMFrYZ1ol4p63SZ0sDAyEJ
	FHj6GHsQBhIuuMGucHYVMxBRRcDzEDVQ3YwyVh9A9UqRX0SauipYO2+3mrhvqrh2GXFssBfLPRY
	pS8hLYXeQ0CORNsOPzGAYbk1qcm8UmTQ0G5uJDifjsU7vr5xjdIq8FFJoQsakUziAai81XQ==
X-Received: by 2002:a05:6214:b04:b0:56e:917a:1c19 with SMTP id u4-20020a0562140b0400b0056e917a1c19mr3445614qvj.0.1678191820511;
        Tue, 07 Mar 2023 04:23:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/xv6+E6KxtnITdbAjC4xYrTm6Drs+UHv7miXjwgKWU+sirb/BaI9S4untDNyhwiOt1iKsR4BAo+UXPdUSi9e0=
X-Received: by 2002:a05:6214:b04:b0:56e:917a:1c19 with SMTP id
 u4-20020a0562140b0400b0056e917a1c19mr3445610qvj.0.1678191820260; Tue, 07 Mar
 2023 04:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-13-samin.guo@starfivetech.com> <CAJM55Z-WpxJUshAa_gN5GD+mMp1VaxPbnF6AV-ua0HzsFWsB6w@mail.gmail.com>
 <99a9eccd-2886-832f-07e6-4ba620c522b5@starfivetech.com>
In-Reply-To: <99a9eccd-2886-832f-07e6-4ba620c522b5@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 7 Mar 2023 13:23:24 +0100
Message-ID: <CAJM55Z9P9PG2TBU_UVHWhRikg5YXoi=77ObjeCc4TU1FykLK1w@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] riscv: dts: starfive: visionfive 2: Enable gmac
 device tree node
To: Guo Samin <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_042348_061875_02689A5B 
X-CRM114-Status: GOOD (  21.51  )
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

T24gVHVlLCA3IE1hciAyMDIzIGF0IDAyOjIxLCBHdW8gU2FtaW4gPHNhbWluLmd1b0BzdGFyZml2
ZXRlY2guY29tPiB3cm90ZToKCj4g5ZyoIDIwMjMvMy82IDIxOjA0OjI4LCBFbWlsIFJlbm5lciBC
ZXJ0aGluZyDlhpnpgZM6Cj4gPiBPbiBGcmksIDMgTWFyIDIwMjMgYXQgMTA6MDEsIFNhbWluIEd1
byA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+ID4+IEZyb206IFlhbmhvbmcg
V2FuZyA8eWFuaG9uZy53YW5nQHN0YXJmaXZldGVjaC5jb20+Cj4gPj4KPiA+PiBVcGRhdGUgZ21h
YyBkZXZpY2UgdHJlZSBub2RlIHN0YXR1cyB0byBva2F5Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1i
eTogWWFuaG9uZyBXYW5nIDx5YW5ob25nLndhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+ID4+IC0t
LQo+ID4+ICAuLi4vZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRz
aSAgICAgfCAxMCArKysrKysrKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+ID4+IGluZGV4IGMyYWE4
OTQ2YTBmMS4uZDFjNDA5ZjQwMDE0IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpCj4gPj4gKysrIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0y
LmR0c2kKPiA+PiBAQCAtMTIsNiArMTIsOCBAQAo+ID4+ICAvIHsKPiA+PiAgICAgICAgIGFsaWFz
ZXMgewo+ID4+ICAgICAgICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+ID4+ICsgICAgICAg
ICAgICAgICBldGhlcm5ldDAgPSAmZ21hYzA7Cj4gPj4gKyAgICAgICAgICAgICAgIGV0aGVybmV0
MSA9ICZnbWFjMTsKPiA+Cj4gPiBQbGVhc2Ugc29ydCB0aGVzZSBhbHBoYWJldGljYWxseS4KPiBU
aGFua3MsIHdpbGwgZml4Lgo+ID4KPiA+PiAgICAgICAgICAgICAgICAgaTJjMCA9ICZpMmMwOwo+
ID4+ICAgICAgICAgICAgICAgICBpMmMyID0gJmkyYzI7Cj4gPj4gICAgICAgICAgICAgICAgIGky
YzUgPSAmaTJjNTsKPiA+PiBAQCAtOTIsNiArOTQsMTQgQEAKPiA+PiAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+PiAgfTsKPiA+Pgo+ID4+ICsmZ21hYzAgewo+ID4+ICsgICAgICAgc3RhdHVz
ID0gIm9rYXkiOwo+ID4+ICt9Owo+ID4+ICsKPiA+PiArJmdtYWMxIHsKPiA+PiArICAgICAgIHN0
YXR1cyA9ICJva2F5IjsKPiA+PiArfTsKPiA+Cj4gPiBTaW5jZSB5b3UnbGwgbmVlZCB0byBhZGQg
dG8gdGhlIGdtYWMwIGFuZCBnbWFjMSBub2RlcyBpbiB0aGUgYm9hcmQKPiA+IHNwZWNpZmljIGZp
bGVzIHRvbyBhbmQgaXQncyBvbmx5IG9uZSBsaW5lLCBjb25zaWRlciBqdXN0IGRyb3BwaW5nIHRo
aXMKPiA+IGhlcmUgYW5kIGFkZCB0aGUgc3RhdHVzID0gIm9rYXkiIHRoZXJlIGluc3RlYWQuCj4g
Pgo+IEFjY29yZGluZyB0byBBbmRyZXcncyBzdWdnZXN0aW9uLCBjYW4gSSBwdXQgdGhlIG5vZGVz
IG9mIG1kaW8gYW5kIHBoeSBoZXJlPwoKWWVhaCwgaWYgdGhlIGJvYXJkcyB0aGVuIGVuZCB1cCBz
aGFyaW5nIG1vcmUgaW5mb3JtYXRpb24gaXQncyBmaW5lIHRvCnB1dCBpdCBoZXJlLiBJdCBqdXN0
IHNlZW1lZCBhIGxpdHRsZSBtdWNoIHRvIGFkZCA4IGxpbmVzIGhlcmUgd2hlbiBhbGwKdGhlIGJv
YXJkcyBzaGFyZWQgd2FzIGEgc3RhdHVzID0gIm9rYXkiOwoKPiA+PiAgJmkyYzAgewo+ID4+ICAg
ICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMD47Cj4gPj4gICAgICAgICBpMmMtc2RhLWhv
bGQtdGltZS1ucyA9IDwzMDA+Owo+ID4+IC0tCj4gPj4gMi4xNy4xCj4gPj4KPiA+Pgo+ID4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKPgo+IEJlc3QgcmVnYXJkcywKPiBTYW1pbgo+IC0tCj4gQmVzdCByZWdhcmRzLAo+IFNhbWlu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
