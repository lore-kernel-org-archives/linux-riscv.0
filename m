Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B36C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEFRlLRCHF5uMP9xofGWNWvz0Oy36kAKiuXiheWM5EY=; b=0NPIcVzcSc0fLQ
	JQRzhXj9Zm6Jece9fR/M/gvTpSGe0aBuWyrqX0vsJpj5racmOMyKwgoBR1fbsSRPrUhzqnILFW9v/
	OLPOgt/5iJnx3uKFrfGywp6SmPYa4r8MyDXnEcwAougo3lLg4g5Tv+LZaGZ9bPY0oFH/5Jg2Y7Pv9
	zP78qGCd5qrAdL3h6Knx5tIVkBlRDX4gbjVIjtYRtZyetKT4oNy8PATogGvrTbtCTwNRZiXzzTyUr
	W6oTKsrXPM4e53llU44c5GAKSar/AaV8GNiq92xm+b65yJvdhUAKj1bTpoLjX9DqeCzTv8nrjSn7R
	s7GPCUD6dKrL0kU3AcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YBo-0006NH-2I;
	Tue, 21 Nov 2023 21:21:48 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YBm-0006MT-25
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 21:21:48 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7a68b87b265so217041839f.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 13:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700601705; x=1701206505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1iDPVZpka4nNa9ZhZHYDDoBfymnFnX6WfSx2iwPL40=;
        b=a295y7zx+54yZ/K4teXBSFfoXvi3OFEoUfXEAnZXDkQleokZeBr1uWgGyt/IwG2EUE
         aETsmoi2sCDU8xc8txRGcSWEjDxCRdvSGZ2TK/oaFctOIGZzu3H3DWQ7WhVnWpEcmY1h
         6UrsOQeUZoZE5ngtF5Z01h73/UDOHMyfnpMoHOxtoL6QWR3We3WFQBsvobecuUkAUQfz
         zpZaG7/ZREYMXEOF0Qws1BwQgPuBcLD9R4EKC9aXAcPJdqBCO4LDNvRmnLgB4ObDnDgR
         HwzZFRembhFGmC2MX5cFGCV8FOgR+L/5b8D85g1n5Z2UvGVAZD82CWRT+yHayqy+MIZz
         ElsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601705; x=1701206505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1iDPVZpka4nNa9ZhZHYDDoBfymnFnX6WfSx2iwPL40=;
        b=ezwMqZyBA5ByU9kuMP4FnwQogkHRjq7+nuIVEUON2+T3lBQAsP8Pg4+ZMG0DajnEiv
         vapnUGkM2lfQTMiHKWG2iqp+6bCsDR+A//4v6LBj9ZA1F8G4Xw0b6kuG6PnYKlQG8X5z
         i64L3Z4mppN8MkYMsJf9xNxuTFigLPnUOq/kDdKdk62/NdGdkmYfTJ9w//XZlDD9OPtO
         RW0quueU8u6J8afRQ+iFqsWUj+rBzWRa5F/9rXiSz0A69S3iibJt8SbaSbt7j+22hZXc
         qsclYl2TbNImQRLFwz460I96iEgbf3HxFRNwazCpM1pevI71rB9pebfuGJ82jv/gSB2v
         Y77A==
X-Gm-Message-State: AOJu0Yyq7NP6HJoopwQ11lqXLuO0Y5wOd9gEZJfmZ3omZ+nYyZ+Om+77
	dvqLiTz0RWGbsNodVwWa2/06CQ==
X-Google-Smtp-Source: AGHT+IHFnuR563DYa13+P5/j6U4aw6qIjVLFP30n6WKAe9EXfY7bXg7RwkoIvtNqVv18SM2SmM227A==
X-Received: by 2002:a05:6602:8:b0:7b0:733:b8fe with SMTP id b8-20020a056602000800b007b00733b8femr137985ioa.12.1700601705205;
        Tue, 21 Nov 2023 13:21:45 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id o13-20020a6b5a0d000000b007a669ac1ef4sm2945608iob.40.2023.11.21.13.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 13:21:44 -0800 (PST)
Message-ID: <b56e06b5-ff9d-4890-b0e8-ab2c929f9bc1@sifive.com>
Date: Tue, 21 Nov 2023 15:21:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_132146_686718_4EDE7362 
X-CRM114-Status: GOOD (  17.25  )
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

T24gMjAyMy0xMS0yMSAyOjI0IFBNLCBQcmFiaGFrYXIgd3JvdGU6Cj4gRnJvbTogTGFkIFByYWJo
YWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+IAo+IFdlIHNo
b3VsZCBiZSBwcm9iaW5nIGZvciBJT0NQIGR1cmluZyBib290IHN0YWdlIG9ubHkuIEFzIHdlIHdl
cmUgcHJvYmluZwo+IGZvciBJT0NQIGZvciBhbGwgdGhlIHN0YWdlcyB0aGlzIGNhdXNlZCB0aGUg
YmVsb3cgaXNzdWUgZHVyaW5nIG1vZHVsZS1pbml0Cj4gc3RhZ2UsCj4gCj4gWzkuMDE5MTA0XSBV
bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3Mg
ZmZmZmZmZmY4MTAwZDNhMAo+IFs5LjAyNzE1M10gT29wcyBbIzFdCj4gWzkuMDI5NDIxXSBNb2R1
bGVzIGxpbmtlZCBpbjogcmNhcl9jYW5mZCByZW5lc2FzX3VzYmhzIGkyY19yaWljIGNhbl9kZXYg
c3BpX3JzcGkgaTJjX2NvcmUKPiBbOS4wMzc2ODZdIENQVTogMCBQSUQ6IDkwIENvbW06IHVkZXZk
IE5vdCB0YWludGVkIDYuNy4wLXJjMSsgIzU3Cj4gWzkuMDQzNzU2XSBIYXJkd2FyZSBuYW1lOiBS
ZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEwN2cwNDNmMDEgKERUKQo+IFs5LjA1MDMzOV0g
ZXBjIDogcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQo+IFs5LjA1NTU1OF0g
wqByYSA6IGFuZGVzX2VycmF0YV9wYXRjaF9mdW5jKzB4NGEvMHg1Mgo+IFs5LjA2MDQxOF0gZXBj
IDogZmZmZmZmZmY4MDAwZDhjMiByYSA6IGZmZmZmZmZmODAwMGQ5NWMgc3AgOiBmZmZmZmZjODAw
M2FiYjAwCj4gWzkuMDY3NjA3XSDCoGdwIDogZmZmZmZmZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4
MDM2MWU1NDAgdDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWzkuMDc0Nzk1XSDCoHQxIDogMDAwMDAw
MDAwOTAwMDMxZSB0MiA6IDAwMDAwMDAwMDAwMDAwMDEgczAgOiBmZmZmZmZjODAwM2FiYjIwCj4g
WzkuMDgxOTg0XSDCoHMxIDogZmZmZmZmZmYwMTViNTdjNyBhMCA6IDAwMDAwMDAwMDAwMDAwMDAg
YTEgOiAwMDAwMDAwMDAwMDAwMDAxCj4gWzkuMDg5MTcyXSDCoGEyIDogMDAwMDAwMDAwMDAwMDAw
MCBhMyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQgOiBmZmZmZmZmZjgxMDBkOGJlCj4gWzkuMDk2MzYw
XSDCoGE1IDogMDAwMDAwMDAwMDAwMDAwMSBhNiA6IDAwMDAwMDAwMDAwMDAwMDEgYTcgOiAwMDAw
MDAwMDA5MDAwMzFlCj4gWzkuMTAzNTQ4XSDCoHMyIDogZmZmZmZmZmYwMTViNTdkNyBzMyA6IDAw
MDAwMDAwMDAwMDAwMDEgczQgOiAwMDAwMDAwMDAwMDAwMzFlCj4gWzkuMTEwNzM2XSDCoHM1IDog
ODAwMDAwMDAwMDAwOGE0NSBzNiA6IDAwMDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAw
MDNmCj4gWzkuMTE3OTI0XSDCoHM4IDogZmZmZmZmYzgwMDNhYmQ0OCBzOSA6IGZmZmZmZmZmMDE1
YjExNDAgczEwOiBmZmZmZmZmZjgxNTFhMWIwCj4gWzkuMTI1MTEzXSDCoHMxMTogZmZmZmZmZmYw
MTViMTAwMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDEgdDQgOiBmZWZlZmVmZWZlZmVmZWZmCj4gWzku
MTMyMzAxXSDCoHQ1IDogZmZmZmZmZmYwMTViNTdjNyB0NiA6IGZmZmZmZmQ4YjYzYTYwMDAKPiBb
OS4xMzc1ODddIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiBmZmZmZmZmZjgxMDBk
M2EwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBmCj4gWzkuMTQ1NDY4XSBbPGZmZmZmZmZmODAwMGQ4
YzI+XSByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gWzkuMTUxOTcyXSBb
PGZmZmZmZmZmODAwMDI3ZTg+XSBfYXBwbHlfYWx0ZXJuYXRpdmVzKzB4ODQvMHg4Ngo+IFs5LjE1
Nzc4NF0gWzxmZmZmZmZmZjgwMDAyOWJlPl0gYXBwbHlfbW9kdWxlX2FsdGVybmF0aXZlcysweDEw
LzB4MWEKPiBbOS4xNjQxMTNdIFs8ZmZmZmZmZmY4MDAwOGZjYz5dIG1vZHVsZV9maW5hbGl6ZSsw
eDVlLzB4N2EKPiBbOS4xNjk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNkNj5dIGxvYWRfbW9kdWxlKzB4
ZmQ4LzB4MTc5Ywo+IFs5LjE3NDk2NV0gWzxmZmZmZmZmZjgwMDg2NjMwPl0gaW5pdF9tb2R1bGVf
ZnJvbV9maWxlKzB4NzYvMHhhYQo+IFs5LjE4MDk0OF0gWzxmZmZmZmZmZjgwMDg2N2Y2Pl0gX19y
aXNjdl9zeXNfZmluaXRfbW9kdWxlKzB4MTc2LzB4MmE4Cj4gWzkuMTg3MzY1XSBbPGZmZmZmZmZm
ODA4ODk4NjI+XSBkb190cmFwX2VjYWxsX3UrMHhiZS8weDEzMAo+IFs5LjE5MjkyMl0gWzxmZmZm
ZmZmZjgwODkyMGJjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0Cj4gWzkuMTk4NTczXSBD
b2RlOiAwMDA5IGI3ZTkgNjc5NyAwMTRkIGE3ODMgODVhNyBjNzk5IDQ3ODUgMDcxNyAwMTAwICgw
MTIzKSBhZWY3Cj4gWzkuMjA1OTk0XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0t
LS0KPiAKPiBUaGlzIGlzIGJlY2F1c2Ugd2UgY2FsbGVkIHJpc2N2X25vbmNvaGVyZW50X3N1cHBv
cnRlZCgpIGZvciBhbGwgdGhlIHN0YWdlcwo+IGR1cmluZyBJT0NQIHByb2JlLiByaXNjdl9ub25j
b2hlcmVudF9zdXBwb3J0ZWQoKSBmdW5jdGlvbiBzZXRzCj4gbm9uY29oZXJlbnRfc3VwcG9ydGVk
IHZhcmlhYmxlIHRvIHRydWUgd2hpY2ggaGFzIGFuIGFubm90YXRpb24gc2V0IHRvCj4gIl9fcm9f
YWZ0ZXJfaW5pdCIgZHVlIHRvIHdoaWNoIHdlIHdlcmUgc2VlaW5nIHRoZSBhYm92ZSBzcGxhdC4g
Rml4IHRoaXMgYnkKPiBwcm9iaW5nIElPQ1AgZHVyaW5nIGJvb3Qgc3RhZ2Ugb25seS4KPiAKPiBG
aXhlczogZTAyMWFlN2Y1MTQ1ICgicmlzY3Y6IGVycmF0YTogQWRkIEFuZGVzIGFsdGVybmF0aXZl
IHBvcnRzIikKPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvZXJyYXRhL2FuZGVz
L2VycmF0YS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJh
dGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4gaW5kZXggZDJlMWFiY2Fj
OTY3Li4xYzBmZWYxMTEyNzMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMv
ZXJyYXRhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+IEBAIC02
MCw3ICs2MCw4IEBAIHZvaWQgX19pbml0X29yX21vZHVsZSBhbmRlc19lcnJhdGFfcGF0Y2hfZnVu
YyhzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwgc3RydWN0IGFsCj4gIAkJCQkJICAgICAgdW5zaWdu
ZWQgbG9uZyBhcmNoaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQsCj4gIAkJCQkJICAgICAgdW5zaWdu
ZWQgaW50IHN0YWdlKQo+ICB7Cj4gLQllcnJhdGFfcHJvYmVfaW9jcChzdGFnZSwgYXJjaGlkLCBp
bXBpZCk7Cj4gKwlpZiAoc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX0JPT1QpCj4gKwkJZXJy
YXRhX3Byb2JlX2lvY3Aoc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwo+ICAKPiAgCS8qIHdlIGhhdmUg
bm90aGluZyB0byBwYXRjaCBoZXJlIEFUTSBzbyBqdXN0IHJldHVybiBiYWNrICovCj4gIH0KClJl
dmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
