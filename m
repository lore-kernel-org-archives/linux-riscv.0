Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C750C7114A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 21:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DFak+I/Pp/lJTx2sZED5u+U5cb1u2tAdYWHardEMa0=; b=ig/uVkJ3QAG3tg
	oGky8XlvG9Tiobn3SZWiHstv6TJZt9ZC9UINfJBWtu8RaIIE3G9LjzhXoyWN4kq5DqXGj9MkQP7f1
	cbnlnpTGSzygu5RHWaGrbRLqaNK9z5l7BrSKRxstfa0Rqnu+W+IcUUnHxFfJBN6n1E5iYpyyNvL8R
	wcGyby4oxir3elFuOIEa8tlbTdMfLswa4iSWFhe8Ng98N8FU/ykaEGuBHUdtHJoV0RvG9PuDJsS1K
	301d55bsbgQOmzXnsTY3TquKItbT/Qf6adjE2VEnApw0H3onnQLhAjA02LEWUQS/umsSDAnHLoMbS
	0ifqESkGjemKwtP2A2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQYHi-00000001qtz-26ii;
	Sat, 14 Jun 2025 21:19:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQYHf-00000001qtc-0ZBh
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 21:19:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so21282105e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749935965; x=1750540765; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=flIDkZqwc3KWW4PKLKGBRVZjvqroSy4sA7R2DG7HV7A=;
        b=DOCLIn/09+4SGi6AGFV6ZHOBUCivQ9NY9dC1JnHwRz0wBkwYbOx8DFr4aX6pqyx2dI
         eP4mr4n2ZMwPdHCuqhRByh5SX5VNCNhNgXT0MQTKdRo3n64L67/GgcrmROYAzXBh/uB0
         W1Paoww0vI8hw1GAtHdc5cx08H3Z8iPUmqqA8bHnb6IXqe1+LLP50dlljv36ZGuuYvjU
         uCRUw8kEklRgbyXF9JkzNgNGeop5drUQT8Lc6hv3Ue5PwZFh6d5tfDWy8f8d5PIeVwdA
         YrZIm51X5K+okv/6LDDiYvPhXaeNaBtYAvWzXNtlFE+BnAiJfVHG6dQl+xByzLqIue7l
         201A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749935965; x=1750540765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flIDkZqwc3KWW4PKLKGBRVZjvqroSy4sA7R2DG7HV7A=;
        b=qC4+s+tm09KIDFO5aHGeMwYAC6IHzF5myHaOSMv6W+ZuoPfJRIfLmskoq1ISnfxeqV
         tN5HA6B8D+FkMp41xGLhVSX3mXar1SRC/p2wQD4OP/9+SJWR6sN56JFftwM1DWtACJGv
         oJrN1BxCvyoMsD7Y85dayxujtIgdC1hdmylhMN90k0sdptE2OCf2keA3GpHZLH+59wEx
         q+3y2VQfoluxSWO8pvr56TBjGT5X8aSv8SWi6evVP6FsyC8mIe2iYh8Lgn1DmtPUQiAe
         iErqAEZIj0yq/BI11vd0YnXHBIoIfz6m8rVjxIabM33HkIpePrLGreZhRCUYomEZDVdg
         A8/A==
X-Forwarded-Encrypted: i=1; AJvYcCXS+v1fr8GskY0AGcTsHHQuQ/j3/BBGvKBjfVfFaTNUPidmna/ZfxZSzC99nxt4JZUIO1URbXyxVQAtTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgA1UrDzyXsET3pu3s7/RnUDtqLW6R4ljRwtrq1KnQbDmdIQop
	qVOnlssePjUfurb+n99wGdJwR4/jnLbTSizIIIkOuLQe36guMbg3E4pk
X-Gm-Gg: ASbGncukemDEVdGLghRbLsF6S9aHUq9dbtSmoF0gpmGfMOJV8IYzHI6VTYikX5ghy49
	7E1GVwwZ5tyYgwliVTdnDNwhvtop6UyTNBuDPaJ/s2GYY3oTkcrJswDp6zXUyGk8kXTpgutgxLt
	4Xc6g+W8jKfWXoVHfYxuEQIfx44c6o3BOi9AF2e3ARh9JAX8FrTo3KuSOjLQjwLQTuzKMvyGeOB
	fnpwRsIBQmDWsmiYtHXq8nZQ1Uar2PHrhi9jVk8/ozpYRyHksOnqmJum+R7PWBR7Z2J/UCmHOSQ
	0FMm9uA3NSVMkSgdlINLcIohCc6OPYjhOYMbPlniDjfdI21ykPkVbziYK/5G8Jaijt0h8OsA3lr
	ToTfUcA==
X-Google-Smtp-Source: AGHT+IEtV2JLpbYXhmYcHj10cqAe3Asf5UE3CdzjaK74yJYBNUGOKwUpNJwYbVg31UYOBNO1MJCv6w==
X-Received: by 2002:a05:600c:3e17:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4533cb4948bmr34825035e9.22.1749935965328;
        Sat, 14 Jun 2025 14:19:25 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4e4f1sm5925838f8f.87.2025.06.14.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:19:25 -0700 (PDT)
Message-ID: <d3b20a9ce58fa296034fe3aa8b60ecde4c4192f4.camel@gmail.com>
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
Date: Sat, 14 Jun 2025 23:19:34 +0200
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_141927_176035_3FB46323 
X-CRM114-Status: GOOD (  12.52  )
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

SGkgSW5vY2hpIQoKT24gV2VkLCAyMDI1LTA2LTExIGF0IDE2OjA3ICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+IEFkZCBkZXZpY2UgYmluZGluZyBhbmQgZHRzIGZvciBDVjE4WFggc2VyaWVz
IFNvQywgdGhpcyBkdHMgY2hhbmdlIHNlcmllcwo+IHJlcXVpcmUgYm90aCB0aGUgbWRpbyBwYXRj
aCBbMV0gYW5kIHRoZSByZXNldCBwYXRjaCBbMl0uCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MDYxMTA4MDIyOC4xMTY2MDkwLTEtaW5vY2hpYW1hQGdtYWlsLmNvbQo+
IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MTEwNzUzMjEuMTE2MDk3My0x
LWlub2NoaWFtYUBnbWFpbC5jb20KPiAKPiBJbm9jaGkgQW1hb3RvICgzKToKPiDCoCBkdC1iaW5k
aW5nczogbmV0OiBBZGQgc3VwcG9ydCBmb3IgU29waGdvIENWMTgwMCBkd21hYwo+IMKgIHJpc2N2
OiBkdHM6IHNvcGhnbzogQWRkIGV0aGVybmV0IGRldmljZSBmb3IgY3YxOHh4Cj4gwqAgcmlzY3Y6
IGR0czogc29waGdvOiBBZGQgbWRpbyBtdWx0aXBsZXhlciBkZXZpY2UgZm9yIGN2MTh4eAoKSGF2
ZSB5b3Ugbm90aWNlZCBhbnkgcHJvYmxlbXMgb24gdGhlIGJvYXJkIHlvdSBhcmUgdGVzdGluZyBv
bj8KSSd2ZSBhZGRlZCB0aGUgcGF0Y2hzZXQgKyBwcmUtcmVxdWlzaXRlZCArIHRoZSBmb2xsb3dp
bmcgaW50byBteSBib2FyZCBEVApmb3IgTWlsay1WIER1byBNb2R1bGUgMDEgRVZCOgoKJm1kaW8g
ewogICAgICAgc3RhdHVzID0gIm9rYXkiOwp9OwoKJmdtYWMwIHsKICAgICAgIHBoeS1tb2RlID0g
ImludGVybmFsIjsKICAgICAgIHBoeS1oYW5kbGUgPSA8JmludGVybmFsX2VwaHk+OwogICAgICAg
c3RhdHVzID0gIm9rYXkiOwp9OwoKQW5kIHRoZSBQSFkgaXMgYmVpbmcgZGV0ZWN0ZWQgYW5kIHRo
ZSBFdGhlcm5ldCBjb250cm9sbGVyIGlzIGJlaW5nIGluc3RhbnRpYXRlZCwKYnV0IHRoZSBQSFkg
YmVoYXZlcyByZWFsbHkgc3RyYW5nZTogTEVEcyBibGlua2luZyB3aWxkbHksIGxpbmsgc3RhdHVz
IGlzIGJvZ3VzCjEwMEZVTEwgVVAgZXZlbiB3aXRob3V0IGNhYmxlIGluc3RlcnRlZCBhbmQgdGhl
IHJlYWwgdHJhZmZpYyBzdGFydHMgdG8gdHJhdmVsCm9ubHkgcm91Z2hseSBhIG1pbnV0ZSBhZnRl
ciB0aGUgY2FibGUgaGFzIGJlZW4gcGx1Z2dlZCBpbi4KCkkgY291bGQgbG9vayBpbnRvIGl0LCBp
ZiBTb3BoZ28gaGFzIGRvY3VtZW50ZWQgdGhlIGludGVybmFsIFBIWSwganVzdCB3YW50ZWQgdG8K
c3luYyB3aXRoIHlvdSBmb3IgdGhlIGNhc2UgeW91J3ZlIHNlZW4gdGhpcyBhbHJlYWR5Li4uCgo+
IAo+IMKgLi4uL2JpbmRpbmdzL25ldC9zb3BoZ28sY3YxODAwYi1kd21hYy55YW1swqDCoMKgIHwg
MTEzICsrKysrKysrKysrKysrKysrKwo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3Yx
ODB4LmR0c2nCoMKgwqDCoMKgwqDCoCB8wqAgNzAgKysrKysrKysrKysKPiDCoDIgZmlsZXMgY2hh
bmdlZCwgMTgzIGluc2VydGlvbnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NvcGhnbyxjdjE4MDBiLWR3bWFjLnlhbWwKCi0t
IApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
