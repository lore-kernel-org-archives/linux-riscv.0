Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388CCC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vx0KUImfkFetE9JQA+DvNKyn6jHIqPL442pP+6DWvlw=; b=TtLw6gtx8QLA5e
	NktO/B0pkuBIE8dmFVshVyg0CQ2VHLDGFypoTJKNIvnqe5E9FUDTT26PYbJ+LDx29pqNGc9eY4JiM
	4opirPxitsNq4eWdbzrKC+wnMWgNKTR2Apy15YuXOKe9T++oddgXWCy5bt2UXaltTq9g00g8+Cx3V
	dtFUHROnyEFMb0me3aMwf+6APUkD/gVUGAJzI34/jq5ZawmHF46FteIny5qcvM+4gfF1MSst+SLRM
	lJ7eDauG6C3rp0uPI8pwQB7Qtc9gseK33gSG9T+oykd5zxn9yIIAtMNPhX3XACyazYWo9ZLOpWi5v
	YIxFB0AbF56XhgZNrtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39NT-0000000Cy0w-1xMf;
	Fri, 11 Apr 2025 08:04:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39NR-0000000Cy0T-3rvI
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Apr 2025 08:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eL6mQhh76fyOvITqDMOePPOrdn2eCivxVT00/39k9KQ=; b=gcpT9qZsUI4rDRv2HYYpfiqgdc
	yvmQjh1BuJNhY6q0cejnMRPBZlm2/Pgb0PBwPKb1Rr3jg3oD2CDWVU2WlZIilByDQ+MWe2J7BlXQX
	+oqH/OQJZMEVlNefFV3cFTRyEDkTEflBK0mGBxn12Ymq563EMhVFp9S2QFKKChtmIfqRzJ4cYu63s
	pdo52iLFvsqWvEcQ0buj9lsc2GSWoNmhAk5blrmdPotnqEqNx8vp9kiq3qaH7fZkPVzcgrZfw/mat
	ihDX9zA3UUo4gjuFlpB50zRkVBFZN1M9QbkzSLj6ecDDgXLY3JE365Co7kcFw5XOqx5De2kWkwI8X
	i8osK5Sw==;
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u39NO-00000008yV6-1yV4
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 08:04:40 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-86dde90e7a3so698779241.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 01:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744358675; x=1744963475; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL6mQhh76fyOvITqDMOePPOrdn2eCivxVT00/39k9KQ=;
        b=GzX3MstJLEFjGByySS2KU/XzUxy7Dw5QR/DuOBafmkxp+Lk+L6x1DeydoDT3TjsB05
         lxNAhhmzQM/9yJLTP2UnqC3oSihhSCdgMHrzrn7O/+sSm0IJnayCYJtGSMR3d4DnJJG6
         LL0QMn4x/ad90hRs+4HYZIUICvvBTRG6aqR9YEboj98n3fOq92k+nRRTjc5MLIa4wASF
         8WDNI+77Jn+y5ZgN9mh7a14uu8fXYu04pQXqKD0A/J+FqDEbEhXVexM5LU32W8MP6W9d
         t1G6S2JzA6IWXZFr4hP5xMSaY1OTpWR1EqGzBn5RAThmtD3LSNZ7GWBb+VkyusMyiZbl
         RdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358675; x=1744963475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL6mQhh76fyOvITqDMOePPOrdn2eCivxVT00/39k9KQ=;
        b=ogIyINVItzCXnazC+69tKQ/YNix1NvXuOzh2Y54iWWyZdySznuy7FPaAjMAIKrK72q
         npAzw/Xy3AMKo1ERN86Yi2sAn7rlW1XKZ58MoH5mJV9wM4i0gsYopnqqlxJkpD1XWubb
         jK1MNmkboDglh7MHVbXdSoEw49jAcgD/UYRO7wIivonT2Z635etS+j0q3mqjpWSOC2An
         ct5Fz2mqglGgsuJY+/bI767WJsngyWrtYJcU5vZNURT+GRVghqZdkXk2Xp87dp/gA/oI
         /9XNrp+vGPkbTfqDug6FwJ7eEgZ7b5svyuzXVMWEbXZax2sCQ7z8BoszIr22IRlPN6DT
         0jQw==
X-Forwarded-Encrypted: i=1; AJvYcCUVRUlzcxpVVZRxW269BVfGdDId1Z3NcieFovkj4T0IgtmML602VxECNm5kcrklLK/DGkmeavy4PqMiHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUvPMyPwI4lBwkDJVg5VsVE+AoIyWqeyyEs+mXKDZYzzV9+OOw
	wypWGJeOGx8MLKI03v2p4hQB85XHimRGoAgjuLd4CffONDVTalLix6kR5dofMZe1X1aS8kquEXg
	H6cClU3eMq6sEkfVeZultG+gTiOmwu/YW3XXopw==
X-Gm-Gg: ASbGncsalxO9LqxpK8vn8jLIOryhW649ALHbEZG6a86gBZwu6R22o3hnfbKMs6r/EwN
	HcNSpikSy+aplHKeADPePW5lEiHaqPi91hdliR8tbH1k6IdOZOWPGpYDDvgQmDHnNnALZDtUQid
	lUY35XKdqOvP6bDpwp+ycXDnbZ8twtUSRDv2jLjOls4mWW4yApYGW3+r1HdF77GdDOqmU=
X-Google-Smtp-Source: AGHT+IFS+vDPSsUy3KBR+YuGEKwg0Uf3ZoAvbd0MVCMxEojLhJBnmjz9Np5nkTvKpK/n9aULedLJ1qS+Z07+mWcOA8o=
X-Received: by 2002:a05:6102:5487:b0:4ba:9923:fa57 with SMTP id
 ada2fe7eead31-4c9e4f1f22amr855491137.15.1744358675331; Fri, 11 Apr 2025
 01:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com> <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
In-Reply-To: <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 11 Apr 2025 16:04:23 +0800
X-Gm-Features: ATxdqUGn2A6qXgf2-HkGrf1A-Gq8MHEb_wirNKnK1k9VoLh8b2bfH0MqDkKbStk
Message-ID: <CAHh=Yk9RrUDi+73QAYgjBhMOzKKznq9NGwRCo_GkbYZwi4cuuQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, charlie@rivosinc.com, jesse@rivosinc.com, evan@rivosinc.com, 
	zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_090438_699334_A981A3CB 
X-CRM114-Status: GOOD (  19.23  )
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

SGkgQ2zDqW1lbnQsCgpUaGFua3MgZm9yIHlvdXIgaW5mb3JtYXRpb24KCkkgd2lsbCB0ZXN0IHlv
dXIgcGF0Y2ggYXMgd2VsbCwgYW5kIGlmIG5vIG90aGVyIGlzc3VlcyBhcmlzZSwKSSdsbCByZW1v
dmUgdGhpcyBjaGFuZ2UgZnJvbSB0aGUgcGF0Y2hzZXQgaW4gdGhlIG5leHQgdmVyc2lvbgoKVGhh
bmtzCgpOeWxvbgpDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IOaWvCAyMDI1
5bm0NOaciDEx5pelIOmAseS6lCDkuIvljYgzOjM35a+r6YGT77yaCj4KPiBIaSBOeWxvbiwKPgo+
IEkgYWxyZWFkeSBoYXZlIGEgcGVuZGluZyBmaXggZm9yIHRoYXQgYnVnIHdoaWNoIGlzIHRvIHJl
ZW5hYmxlCj4gaW50ZXJydXB0cyB3aGlsZSBoYW5kbGluZyBtaXNhbGlnbmVkIGZhdWx0cy4gUGxl
YXNlIHNlZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDMxNzE3
MDYyNS4xMTQyODcwLTEyLWNsZWdlckByaXZvc2luYy5jb20vCj4KPiBUaGFua3MsCj4KPiBDbMOp
bWVudAo+Cj4gT24gMTEvMDQvMjAyNSAwOTozOCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+IFVzZSBj
b3B5X2Zyb21fdXNlcl9ub2ZhdWx0KCkgYW5kIGNvcHlfdG9fdXNlcl9ub2ZhdWx0KCkgaW5zdGVh
ZCBvZgo+ID4gY29weV9mcm9tL3RvX3VzZXIgZnVuY3Rpb25zIGluIHRoZSBtaXNhbGlnbmVkIGFj
Y2VzcyB0cmFwIGhhbmRsZXJzLgo+ID4KPiA+IFRoZSBmb2xsb3dpbmcgYnVnIHJlcG9ydCB3YXMg
Zm91bmQgd2hlbiBleGVjdXRpbmcgbWlzYWxpZ25lZCBtZW1vcnkKPiA+IGFjY2Vzc2VzOgo+ID4K
PiA+IEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0
IC4vaW5jbHVkZS9saW51eC91YWNjZXNzLmg6MTYyCj4gPiBpbl9hdG9taWMoKTogMCwgaXJxc19k
aXNhYmxlZCgpOiAxLCBub25fYmxvY2s6IDAsIHBpZDogMTE1LCBuYW1lOiB0d28KPiA+IHByZWVt
cHRfY291bnQ6IDAsIGV4cGVjdGVkOiAwCj4gPiBDUFU6IDAgVUlEOiAwIFBJRDogMTE1IENvbW06
IHR3byBOb3QgdGFpbnRlZCA2LjE0LjAtcmM1ICMyNAo+ID4gSGFyZHdhcmUgbmFtZTogcmlzY3Yt
dmlydGlvLHFlbXUgKERUKQo+ID4gQ2FsbCBUcmFjZToKPiA+ICBbPGZmZmZmZmZmODAwMTYwZWE+
XSBkdW1wX2JhY2t0cmFjZSsweDFjLzB4MjQKPiA+ICBbPGZmZmZmZmZmODAwMDIzMDQ+XSBzaG93
X3N0YWNrKzB4MjgvMHgzNAo+ID4gIFs8ZmZmZmZmZmY4MDAxMGZhZT5dIGR1bXBfc3RhY2tfbHZs
KzB4NGEvMHg2OAo+ID4gIFs8ZmZmZmZmZmY4MDAxMGZlMD5dIGR1bXBfc3RhY2srMHgxNC8weDFj
Cj4gPiAgWzxmZmZmZmZmZjgwMDRlNDRlPl0gX19taWdodF9yZXNjaGVkKzB4ZmEvMHgxMDQKPiA+
ICBbPGZmZmZmZmZmODAwNGU0OTY+XSBfX21pZ2h0X3NsZWVwKzB4M2UvMHg2Mgo+ID4gIFs8ZmZm
ZmZmZmY4MDE5NjNjND5dIF9fbWlnaHRfZmF1bHQrMHgxYy8weDI0Cj4gPiAgWzxmZmZmZmZmZjgw
NDI1MzUyPl0gX2NvcHlfZnJvbV91c2VyKzB4MjgvMHhhYQo+ID4gIFs8ZmZmZmZmZmY4MDAwMjk2
Yz5dIGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKzB4MjA0LzB4MjU0Cj4gPiAgWzxmZmZmZmZmZjgw
OWVhZTgyPl0gZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkKzB4MjQvMHhlZQo+ID4gIFs8ZmZmZmZm
ZmY4MDlmNGYxYT5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDYvMHgxNTIKPiA+Cj4gPiBGaXhlczog
YjY4NmVjZGVhY2Y2ICgicmlzY3Y6IG1pc2FsaWduZWQ6IFJlc3RyaWN0IHVzZXIgYWNjZXNzIHRv
IGtlcm5lbCBtZW1vcnkiKQo+ID4gRml4ZXM6IDQ0MTM4MTUwNmJhNyAoInJpc2N2OiBtaXNhbGln
bmVkOiByZW1vdmUgQ09ORklHX1JJU0NWX01fTU9ERSBzcGVjaWZpYyBjb2RlIikKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKPiA+IGluZGV4IGQ3Mjc1ZGZiNmI3ZS4uNTYzZjczZjg4ZmE4
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiA+IEBAIC00NTUs
NyArNDU1LDcgQEAgc3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiA+Cj4gPiAgICAgICB2YWwuZGF0YV91NjQgPSAwOwo+ID4gICAg
ICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4gLSAgICAgICAgICAgICBpZiAoY29weV9mcm9t
X3VzZXIoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbikpCj4gPiArICAgICAgICAgICAgIGlm
IChjb3B5X2Zyb21fdXNlcl9ub2ZhdWx0KCZ2YWwsICh1OCBfX3VzZXIgKilhZGRyLCBsZW4pKQo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiA+ICAgICAgIH0gZWxzZSB7Cj4g
PiAgICAgICAgICAgICAgIG1lbWNweSgmdmFsLCAodTggKilhZGRyLCBsZW4pOwo+ID4gQEAgLTU1
Niw3ICs1NTYsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2FsYXJfbWlzYWxpZ25lZF9zdG9yZShz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+ID4KPiA+ICAgICAgIGlmICh1c2VyX21vZGUocmVncykpIHsKPiA+IC0gICAgICAgICAgICAg
aWYgKGNvcHlfdG9fdXNlcigodTggX191c2VyICopYWRkciwgJnZhbCwgbGVuKSkKPiA+ICsgICAg
ICAgICAgICAgaWYgKGNvcHlfdG9fdXNlcl9ub2ZhdWx0KCh1OCBfX3VzZXIgKilhZGRyLCAmdmFs
LCBsZW4pKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiA+ICAgICAgIH0g
ZWxzZSB7Cj4gPiAgICAgICAgICAgICAgIG1lbWNweSgodTggKilhZGRyLCAmdmFsLCBsZW4pOwo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
