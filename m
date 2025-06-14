Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523ADC71135
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 21:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CXztfuXH3fzbNXeEDH/Bq6N7jpP1PNLKsv3mwBVc7E=; b=qu0dDoazgHtFni
	7pmiOVqe8BGN1yWSZXP2CnLM2CcpZcT1LmLp+xh9gBG+5szJba2F4v87UdWDn0tUup5RV3bwf06Ql
	Fl4Sf4aQ9l7WS8YuEl7ve0131+4VbJHBnN+CO27Yo0eP04wcXESzX+v06pT9DNAYR+8kIpckihxaS
	wEeC7OaXCI3WdXONmsYZUC7zsdMFCHKOefMWufdvhs0FXDQacJ0+HEs5ITTNkfJO59RqKGzJxjYID
	DijpWl1ckXHBrpGY8wP6mVL2ycY9ePweQ4cdAE+z6Pgx0W7mPac22qbqeEjuOHN+UEeEwu9GxvOXu
	6XlmQJuf+bjuP8Zdovow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQYnY-00000001tKh-1JuI;
	Sat, 14 Jun 2025 21:52:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQYnW-00000001tKL-05z8
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 21:52:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so39560545e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749937940; x=1750542740; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bg1odM9KUcbjVWw6SM2h9C8Ehh1I33FXJkfY9DO2daw=;
        b=Nn3/ZhW4IVwtItxWSFzOgGvR0nO38m0gRZa/u0eaOabFfBzTOnJMiCvkKpmTRTgyRH
         QAQLkT0pS+RucsOrN7AZkwe4A+K624abmFSMVujlOu6X5BtZaiIuqlnnr2gAhpXPRRDQ
         1mYXpJcp+WCAjB7iQab95lqO5SEv2vi936LtzzaExG36+A2Egp+6u8a2LxJl+3wFwrgX
         PmxRgx0mTWxmx8sV73fNuyefvBrrNWoYI168mN/Ugtf1IjGMlkDutPjbKgmVpc4novF2
         JhE5vZ7OvVtVZ73sX/MdJCpYZHQh+v3SGHLIoNAfAWVDtpJVf3N3JxFVMRCZD3Mz9MwS
         mZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749937940; x=1750542740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg1odM9KUcbjVWw6SM2h9C8Ehh1I33FXJkfY9DO2daw=;
        b=VfKqV/gXmzXYjrrBJc/NK7tB3rK3Thv1Uo5qGNbXqmYbVGfb0/PlQ56Tzz4WKznCyv
         WyqpgAVAI2k2EYbZsNJbNinWB0MG/9sPZ7SfS1S7/T9Unr19M5ym2aiTDN/2lM6JaQqu
         mnGmhi7Nh2ZWZxnnZd35/Mrf44QtrY/j/1wm2vGh1PD8lzbuo8OIrsJO8z0f66z82Fn1
         5SqyhhxWV5B4Z8AHGzUIaJ5gz9ICU89vRZQjsYUvpwEy6OpHQwY85zFpjCB+KNAUQVfJ
         S6ySttoRWC8h6Aw9QInohzVzN+Z/DOaX28olkTrxEKsUTStWNj7zgZ/OjNEHtI35IbV0
         eWmw==
X-Forwarded-Encrypted: i=1; AJvYcCVIji0r/54iljJLb+mRMYo/9GiMry/nqHmJwbrybGQxjmQgieu2XDlmQexsBRTIMyQhL3rjNx+WzUqNIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YytjiHg5F8tfcuqakWfI1rlFlDfFZ+YfoJoIeR8G6O8V85V/Vcq
	KH9aX5D1GZmLtX8FylYIDeB38JvnGM1imQpJGaq20Lvv4JFdvNMV7GSQ
X-Gm-Gg: ASbGncsg+13PpF8RhqKS2gcqnk9TcogSt0ZZp0aMLUh9yewFMR0qF2KRAg4P9BY6uyU
	k5LQOYbpJcv2LI5XDTAYe9Fce5w6z6NTlVX7Nzg6BWFR0NTX2wvyTC/mnN3i7ISFk33A/dcnsqg
	FyHOwIheVivykDjKbv6hBWOSVdLBUDhZhPhzwk1VATiBX+xhDUTkpLTeLm1soA5mP+ZBXgOr8bU
	/GzulVQO5CjD3GTk9WUFEFQZLgIP3jtSO1jJWQHUdS4oduXbtIbLc+0uZQ86NI13LludGUqBJeo
	+Xuk/syWrsJ7ucVjALONNQlW5wTBNK0gs6HkN8HEBr8WibDppnXtyLKITGplf15+2cT0MD6IpXA
	WMcTC+w==
X-Google-Smtp-Source: AGHT+IGahM28OixwThHb31jCwhtlrClMJngbczGluvHx5ulPSa+4X0NSYo1XxDZlq6XZ+IJhlazykw==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4533cc69257mr35521775e9.3.1749937940275;
        Sat, 14 Jun 2025 14:52:20 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c19esm92865075e9.25.2025.06.14.14.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:52:19 -0700 (PDT)
Message-ID: <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Richard Cochran
 <richardcochran@gmail.com>, Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Longbin Li	 <looong.bin@gmail.com>
Date: Sat, 14 Jun 2025 23:52:30 +0200
In-Reply-To: <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
	 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_145222_063189_0629447E 
X-CRM114-Status: GOOD (  14.67  )
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

T24gU2F0LCAyMDI1LTA2LTE0IGF0IDIzOjAxICswMjAwLCBBbGV4YW5kZXIgU3ZlcmRsaW4gd3Jv
dGU6Cj4gVGhhbmtzIGZvciB0aGUgc2VyaWVzIElub2NoaSEKPiAKPiBPbiBXZWQsIDIwMjUtMDYt
MTEgYXQgMTY6MDcgKzA4MDAsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4gPiBBZGQgZGV2aWNlIGJp
bmRpbmcgYW5kIGR0cyBmb3IgQ1YxOFhYIHNlcmllcyBTb0MsIHRoaXMgZHRzIGNoYW5nZSBzZXJp
ZXMKPiA+IHJlcXVpcmUgYm90aCB0aGUgbWRpbyBwYXRjaCBbMV0gYW5kIHRoZSByZXNldCBwYXRj
aCBbMl0uCj4gPiAKPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MTEw
ODAyMjguMTE2NjA5MC0xLWlub2NoaWFtYUBnbWFpbC5jb20KPiA+IFsyXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNTA2MTEwNzUzMjEuMTE2MDk3My0xLWlub2NoaWFtYUBnbWFpbC5j
b20KPiA+IAo+ID4gSW5vY2hpIEFtYW90byAoMyk6Cj4gPiDCoCBkdC1iaW5kaW5nczogbmV0OiBB
ZGQgc3VwcG9ydCBmb3IgU29waGdvIENWMTgwMCBkd21hYwo+ID4gwqAgcmlzY3Y6IGR0czogc29w
aGdvOiBBZGQgZXRoZXJuZXQgZGV2aWNlIGZvciBjdjE4eHgKPiA+IMKgIHJpc2N2OiBkdHM6IHNv
cGhnbzogQWRkIG1kaW8gbXVsdGlwbGV4ZXIgZGV2aWNlIGZvciBjdjE4eHgKPiAKPiBUYWtpbmcg
aW50byBhY2NvdW50LCB3aGF0ZXZlciBNSUkgdmFyaWF0aW9uIGlzIGltcGxlbWVudGVkIGluIHRo
ZSBTb0MKPiBpcyBhbHdheXMgaW50ZXJuYWwgKGFuZCBvbmx5IE1ESU8gcGFydCBpcyBtdWx0aXBs
ZXhlZCksIGNhbiB3ZSBhZGQKPiAJcGh5LW1vZGUgPSAiaW50ZXJuYWwiOwo+IGFuZAo+IAlwaHkt
aGFuZGxlID0gPCZpbnRlcm5hbF9lcGh5PjsKPiByaWdodCBpbnRvIGN2MTgweC5kdHNpPwo+IAo+
IEJvYXJkcyBjYW4gdGhlbiBlbmFibGUgdGhlIGNvcnJlc3BvbmRpbmcgbm9kZXMgaWYgdGhleSB3
aXJlIFJKNDUgY29ubmVjdG9yLAo+IGJ1dCBJIHNlZSBubyB3YXkgaG93IHRoZXkgY291bGQgdmFy
eSB0aGUgTUlJIGNvbm5lY3Rpb24uCgpJIHN1cHBvc2UgdGhlIGFib3ZlIHByb3Bvc2FsIHdhcyB3
cm9uZywgdGhvdWdoIHVuZG9jdW1lbnRlZCwgdGhlcmUgc2VlbXMKdG8gYmUgYW4gZXh0ZXJuYWwg
Uk1JSSBpbnRlcmZhY2UgKGF0IGxlYXN0IG9uIFNHMjAwMCBTb0MpLgoKVW5mb3J0dW5hdGVseSB0
aGUgaW50ZXJuYWwgUEhZIGlzIGFsc28gYmFyZWx5IGRvY3VtZW50ZWQuLi4KQWxzbyBldGh0b29s
IHNlZW1zIHRvIGJlIGluY29tcGF0aWJsZSB3aXRoIG1kaW8gbXV4ZXMgOigKCj4gPiDCoC4uLi9i
aW5kaW5ncy9uZXQvc29waGdvLGN2MTgwMGItZHdtYWMueWFtbMKgwqDCoCB8IDExMyArKysrKysr
KysrKysrKysrKysKPiA+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2nC
oMKgwqDCoMKgwqDCoCB8wqAgNzAgKysrKysrKysrKysKPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAx
ODMgaW5zZXJ0aW9ucygrKQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zb3BoZ28sY3YxODAwYi1kd21hYy55YW1sCgotLSAKQWxl
eGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
