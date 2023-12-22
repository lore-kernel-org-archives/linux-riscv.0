Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75947C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oU42CXp+FOzf3+sNJTBKxRi7uGPaxcX49mM/iHGP5Ko=; b=igjCZkkmEdoAAW
	o5fTw56KKf1M1yOjoMdvH34YcRkyfi3xgxsy/6x+PKm+uvdjZ8KVBWU0epUKlXYVCUtsJrqsH6XYL
	v7gOkn12MUBJRcn7BADZzbQyXR2fK0fG6FLsKS4UnUMO8gaVKpiH9GPV1XAwTzJ7dtS5mZyuvPDGu
	gFkJgR0J/GCg5Oqw83uSruUK8TW/4vLy8zAn+sNN2Hz37ac7P0E/9qO9FebmwVk6c6NbX9gQ1Ct4Z
	GjFdlYYuyu6Lc0iA4vhQU1szJZZ5jogF0pge8MTx/2XGfnmuBmeiP6BIfz9+0xRGv0jkUaP/NEV4H
	W9B6ztXrJ2tCeHASu5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXmz-004wPs-1q;
	Fri, 22 Dec 2023 05:09:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXmw-004wNy-0z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703221773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqfvVjgk23Q9pEcYNDkISi7wtoFhc5tsFEz6pJegrco=;
	b=DXGhLUEDgol/6nPGjLPGw9Ls6BE1FGFPUpaYDWVH3iEGv/KVonV4nDybWo5PQJH9T86ctQ
	dLMKDzAgtomioTpC7SdB/BXqsgXvplQAzvWRyuojzjJ7YEq9Kr61cjrgME1Edq2f5kKMyv
	b7dKwLkyqecUQNWkwNxLKi21RB9XMuM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-PiB26dzSOz6Lr_Bwg-Bsrg-1; Fri, 22 Dec 2023 00:09:31 -0500
X-MC-Unique: PiB26dzSOz6Lr_Bwg-Bsrg-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-59070f0f0b5so1576567eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 21:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703221771; x=1703826571;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqfvVjgk23Q9pEcYNDkISi7wtoFhc5tsFEz6pJegrco=;
        b=gGQD8cRRC5MsqJGraxNCMbqN9S9cP5wP7BYk8gLB6JJM2l4kohWnv1vDxBWtxMUtMF
         lQgPXlxNVNhYqxe26UPAK3dWjr7Pw0T3sUNKDDeBkAjxyNgPtoDyWZ4+0CUSEPF6D1+i
         VR3kpyvln2wIWoJSowhPvt4v9fuJT71fs+d/myDkJHN2oOZkQYC3lOtZpnYjlBEv5AJc
         NhP+gBaG2akHGbYMGeEZrWXsoCj0VdlqS5Xo18jeJGsCDT/9ueyYKC9iQ374V2q63f3R
         Z+j1KntoliKQ9G6h+0r+QBBkzZOVNBo706TtEy60QXz4wwyVFFkuPkpIYmCB4cKl+Y4u
         OqsQ==
X-Gm-Message-State: AOJu0YwMCL/EHkyN2vpQaoAUeUgDN8IZ+9KnmBXq2D1TMyPwBzQUcFwk
	T6CeZIQI+qMZJ6Cc6XuMs9k3PRRfl2krrdLhC7iBAOZd1b8O6SRFPuDlzPYdqC/Wi2K+W8/6TYw
	tkX2VYoKe/954k7fgQf1niGIbYpdDYFzBSI0V
X-Received: by 2002:a05:6870:3308:b0:203:6d48:cf9f with SMTP id x8-20020a056870330800b002036d48cf9fmr837921oae.79.1703221769926;
        Thu, 21 Dec 2023 21:09:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnhzRnwfMxESlKn2GjZrdsC2Tihmw9pKRA1Stv6KvcjY2v+RtC1tb/GabrthD4hDP+hp2Clw==
X-Received: by 2002:a05:6870:3308:b0:203:6d48:cf9f with SMTP id x8-20020a056870330800b002036d48cf9fmr837917oae.79.1703221769679;
        Thu, 21 Dec 2023 21:09:29 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id e15-20020aa7824f000000b006d9879ba6besm374346pfn.170.2023.12.21.21.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 21:09:29 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Date: Fri, 22 Dec 2023 02:09:05 -0300
Message-ID: <ZYUZ8QUJxCL93Fgv@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221154702.2267684-5-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-5-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_210934_419409_DA0DC5BC 
X-CRM114-Status: GOOD (  16.16  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDc6MDFBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+
IFVuaWZ5IHRoZSBUQVNLX1NJWkUgZGVmaW5pdGlvbiB3aXRoIFZBX0JJVFMgZm9yIGJldHRlciBy
ZWFkYWJpbGl0eS4KPiBBZGQgQ09NUEFUIG1vZGUgdXNlciBhZGRyZXNzIHNwYWNlIGluZm8gaW4g
dGhlIGNvbW1lbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFs
aWJhYmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDcgKysrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggZTQxNTU4MjI3NmVjLi5kMTY1ZGRhZTNiNDIgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC04NjYsNiArODY2LDcgQEAgc3RhdGlj
IGlubGluZSBwdGVfdCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gICAqIE5v
dGUgdGhhdCBQR0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUuCj4gICAqIFRh
c2sgc2l6ZSBpczoKPiAgICogLSAgICAgICAgMHg5ZmMwMDAwMAkofjIuNUdCKSBmb3IgUlYzMi4K
PiArICogLSAgICAgICAgMHg4MDAwMDAwMAkoICAgMkdCKSBmb3IgUlY2NCBjb21wYXQgbW9kZQo+
ICAgKiAtICAgICAgMHg0MDAwMDAwMDAwCSggMjU2R0IpIGZvciBSVjY0IHVzaW5nIFNWMzkgbW11
Cj4gICAqIC0gICAgMHg4MDAwMDAwMDAwMDAJKCAxMjhUQikgZm9yIFJWNjQgdXNpbmcgU1Y0OCBt
bXUKPiAgICogLSAweDEwMDAwMDAwMDAwMDAwMAkoICA2NFBCKSBmb3IgUlY2NCB1c2luZyBTVjU3
IG1tdQo+IEBAIC04NzcsMTEgKzg3OCwxMSBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9zd3Bf
Y2xlYXJfZXhjbHVzaXZlKHB0ZV90IHB0ZSkKPiAgICogU2ltaWxhcmx5IGZvciBTVjU3LCBiaXRz
IDYz4oCTNTcgbXVzdCBiZSBlcXVhbCB0byBiaXQgNTYuCj4gICAqLwo+ICAjaWZkZWYgQ09ORklH
XzY0QklUCj4gLSNkZWZpbmUgVEFTS19TSVpFXzY0CShQR0RJUl9TSVpFICogUFRSU19QRVJfUEdE
IC8gMikKPiArI2RlZmluZSBUQVNLX1NJWkVfNjQJKFVMKDEpIDw8IChWQV9CSVRTIC0gMSkpCgpD
aGVja2VkIGZvciBsNSwgbDQgYW5kIGwzLCBhbmQgaXQgc2VlbXMgYSBjb3JyZWN0IHJlcGxhY2Vt
ZW50LgoKPiAgCj4gICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gLSNkZWZpbmUgVEFTS19TSVpFXzMy
CShfQUMoMHg4MDAwMDAwMCwgVUwpKQo+IC0jZGVmaW5lIFRBU0tfU0laRQkodGVzdF90aHJlYWRf
ZmxhZyhUSUZfMzJCSVQpID8gXAo+ICsjZGVmaW5lIFRBU0tfU0laRV8zMgkoVUwoMSkgPDwgKFZB
X0JJVFNfU1YzMiAtIDEpKQoKT2gsIG11Y2ggYmV0dGVyLiBUaGFua3MgZm9yIHJlbW92aW5nIHRo
ZSBtYWdpYyBudW1iZXIgOikKCj4gKyNkZWZpbmUgVEFTS19TSVpFCShpc19jb21wYXRfdGFzaygp
ID8gXAo+ICAJCQkgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ICAjZWxzZQo+ICAjZGVm
aW5lIFRBU0tfU0laRQlUQVNLX1NJWkVfNjQKPiAtLSAKPiAyLjQwLjEKPiAKClRoYXQncyBtdWNo
IG1vcmUgcmVhZGFibGUgSU1PIG5vdy4gVGhhbmtzIQoKRldJVzoKUmV2aWV3ZWQtYnk6IExlb25h
cmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
