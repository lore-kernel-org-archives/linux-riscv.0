Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F70C3601E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=emI4qZSyK0j1YQ/WbDk8f2iNCCzLU/4U/mk/MMAfC6E=; b=InB2NWBOVQYLhljyiwhSZKpFyD
	jvRUBIypiF06zQm1929zQ29XyjQe2OmOc04uBc6KLeIOu2ufD7v24mAFaZIXNpK6PzKN6SC4GwuHB
	1GJPkVn7tj+URSUzJ6hM2JACpMpHX5NHgyqaHSwdXhT4T7fg6qYsNDp/4XaYsaEzcxx1FaIRILKqj
	2ZOk0DQfJ7dLPBLy/O9xQ863RVZ8Tdmihag36WMQunYZh44i0azraGdX80M1qLYq68yTPsKBQaY7f
	mi35yoTD8BxS+NI/08Vd9EQCfnRsZ3iT2EfigmAUZteLtEb4ntO9RG3CnoQ4PrgNq1d708wgeJmEr
	xPu5zXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZ3x-00000006IbP-1EKC;
	Tue, 17 Sep 2024 14:20:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZ3u-00000006IaP-1BLF
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 14:20:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d88c5d76eeso3083599a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726582813; x=1727187613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdL61Vzu3BTEr7CEGvY+puN3FxvC19az+tAQQi++Frk=;
        b=qF659CjN2DRDRMPR/7tiyaDcGRkeB7dEXiUo4XzJel0ZfOlQBbXatR7Pf9ri1OvVmD
         3roZOcg7kHv7cLy8F0tO0CQ/GKvHMIuMD5KoDobDBWz9F5ad/pSfHS32X2VqyLfLmUAS
         SwI/jNJwNisBA3YYQh4U/WCqWY51nVZ0J5IS+hcCxpSKHHDeyA0ATv+Fh6oVkL30I27c
         vA3qJ/gs1j5S31osMceQuy/Fl9d1QYLWpLXh1e/PLtE3svrShpTqXCoaNiH27N0aVUXs
         Ottv0S1NCY6k+h/mXnE0tPvvgZ7Z9mY70Oo6jDppJuIol484yvI0/xH2fQRlD1BhzlY1
         yX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726582813; x=1727187613;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdL61Vzu3BTEr7CEGvY+puN3FxvC19az+tAQQi++Frk=;
        b=U7uaQc36OpRedCnhdVDVxmlGyEETd07nJHcRnrLSIJ10+TaOBWMwnQaCRCB+JOYnc5
         olizm5h0QffHl+6zXFNIeNG2+3iNiJ6sK4i3FjPjZ8nKnFGSTTfIy683XwqWbm4jlBIg
         7BjNsWaJeSyfw5plNpnqWKZEL9Fbc5q1acjK1O7AX+52DjH3m0hRID+M4G50xMqM2w3Q
         /ov5fGPu1yA8CxiyZpeo3qXPTDwrdHDQ+aTdglD/q33Dnvw8TJU9T/fdiMkCykZEr7/S
         2C9BakXVcDTHaDlX3AqF8VoUSSBEcmS3q5iS8btrndr5UU8IsTqBbb6HR60ITJF/U/uK
         Eb4A==
X-Forwarded-Encrypted: i=1; AJvYcCW1fvSDUJJmRFvdUvndS8DWYaFSKKUvby3jyNXLjCqYm0qtkDDblhN+ObaqlfuHT8avaCKlulVtJLayeg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxovf6xTsHYiMm85JJjo0qvufLWmdtTltYCaWIHzWYNbXGnhjUK
	rif5eYqCKqsLrbFZmVbWMYqPB8YLgAsbILAwO0mXLLAj0alC2qgnQkkgYen+vZg=
X-Google-Smtp-Source: AGHT+IHcJryk5a+VAtov1wClUHp+fEgnt1Hgjfaz8PxNFxvM7TUlxlfrBoOQZzFS3qOep8llbVD7UA==
X-Received: by 2002:a17:90a:6883:b0:2d3:bb9b:ce64 with SMTP id 98e67ed59e1d1-2dbb9ee099cmr19582656a91.30.1726582812870;
        Tue, 17 Sep 2024 07:20:12 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfd256eesm7302622a91.27.2024.09.17.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 07:20:12 -0700 (PDT)
Date: Tue, 17 Sep 2024 07:20:12 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 07:20:03 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Dynamically allocate cpumasks and further increase range and default value of NR_CPUS
In-Reply-To: <850f42c7-f7e6-4a35-bcf3-b3d1142f2fc8@huawei.com>
CC: ajones@ventanamicro.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liuyuntao12@huawei.com
Message-ID: <mhng-20071cf1-848b-4ab7-9089-090eb99a6e68@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_072014_620738_868EE6E3 
X-CRM114-Status: GOOD (  30.87  )
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

T24gTW9uLCAwNSBBdWcgMjAyNCAwMTo1ODo1NCBQRFQgKC0wNzAwKSwgbGl1eXVudGFvMTJAaHVh
d2VpLmNvbSB3cm90ZToKPiBHZW50bGUgcGluZwoKSSB0aGluayB3ZSBqdXN0IG5lZWQgdG8gc2Vl
IHNvbWUgcmVzdWx0cyBmb3IgcmVhbCBoYXJkd2FyZSwgYXMgUUVNVSAKaXNuJ3QgbWVhbmluZ2Z1
bCBmb3IgYmVuY2htYXJrcyBsaWtlIHRoaXMuICBNeSBndWVzcyBpcyB3ZSdyZSBub3QgZ29pbmcg
CnRvIGhhdmUgYW4gYW5zd2VyIGZvciBhIHdoaWxlLCBSSVNDLVYgcmVhbGx5IGlzbid0IGFueXdo
ZXJlIGNsb3NlIHRvIApoYXZpbmcgc3lzdGVtcyBvZiB0aGlzIGNvbXBsZXhpdHkgeWV0LiAgU28g
Zm9yIG5vdyBJIHRoaW5rIHdlIHNob3VsZCAKanVzdCBsZWF2ZSB0aGUgZGVmYXVsdHMgYWxvbmUs
IGlmIGhhcmR3YXJlIHNob3dzIHVwIHdoZXJlIGl0IG1ha2VzIHNlbnNlIAp0byBzdGFyIGNoYW5n
aW5nIHRoaW5ncyB0aGVuIHdlIGNhbiB0YWtlIGEgbG9vayBhZ2Fpbi4KCj4KPiBPbiAyMDI0LzYv
MjYgMjA6NDEsIGxpdXl1bnRhbyAoRikgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjQvNi8yNSAxOTo0
NCwgbGl1eXVudGFvIChGKSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMjAyNC82LzI1IDE5OjExLCBB
bmRyZXcgSm9uZXMgd3JvdGU6Cj4+Pj4gT24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMDc6NTM6MDZB
TSBHTVQsIFl1bnRhbyBMaXUgd3JvdGU6Cj4+Pj4+IEN1cnJlbnRseSBkZWZhdWx0IE5SX0NQVVMg
aXMgNjQgZm9yIHJpc2N2NjQsIHNpbmNlIHRoZSBsYXRlc3QgUUVNVSB2aXJ0Cj4+Pj4+IG1hY2hp
bmUgc3VwcG9ydHMgdXAgdG8gNTEyIENQVVMsIHNvIHNldCBkZWZhdWx0IE5SX0NQVVMgNTEyIGZv
cgo+Pj4+PiByaXNjdjY0Lgo+Pj4+Pgo+Pj4+PiBVbmRlciB0aGUgcHJvbW90aW9uIG9mIFJJU0Mt
ViBJbnRlcm5hdGlvbmFsIGFuZCByZWxhdGVkIGNoaXAKPj4+Pj4gbWFudWZhY3R1cmVycywgUklT
Qy1WIGhhcyBhbHNvIGJlZ3VuIHRvIGVudGVyIHRoZSBzZXJ2ZXIgbWFya2V0LCB3aGljaAo+Pj4+
PiBkZW1hbmRzIGhpZ2hlciBwZXJmb3JtYW5jZS4gT3RoZXIgbWFqb3IgYXJjaGl0ZWN0dXJlcyAo
c3VjaCBhcyBBUk02NCwKPj4+Pj4geDg2XzY0LCBNSVBTLCBldGMpIGFscmVhZHkgaGF2ZSBhIGhp
Z2hlciByYW5nZSwgc28gZnVydGhlciBpbmNyZWFzZQo+Pj4+PiB0aGlzIHJhbmdlIHVwIHRvIDQw
OTYgZm9yIHJpc2N2NjQuCj4+Pj4+Cj4+Pj4+IER1ZSB0byB0aGUgZmFjdCB0aGF0IGluY3JlYXNp
bmcgTlJfQ1BVUyBlbmxhcmdlcyB0aGUgc2l6ZSBvZiBjcHVtYXNrcywKPj4+Pj4gdGhlcmUgaXMg
YSBjb25jZXJuIHRoYXQgdGhpcyBjb3VsZCBzaWduaWZpY2FudGx5IGltcGFjdCBzdGFjayB1c2Fn
ZSwKPj4+Pj4gZXNwZWNpYWxseSBmb3IgY29kZSB0aGF0IGFsbG9jYXRlcyBjcHVtYXNrcyBvbiB0
aGUgc3RhY2suIFRvIGFkZHJlc3MKPj4+Pj4gdGhpcywgd2UgaGF2ZSB0aGUgb3B0aW9uIHRvIGVu
YWJsZSBDUFVNQVNLX09GRlNUQUNLLCB3aGljaCBwcmV2ZW50cwo+Pj4+PiBjcHVtYXNrcyBmcm9t
IGJlaW5nIGFsbG9jYXRlZCBvbiB0aGUgc3RhY2suIHdlIGNob29zZSB0byBlbmFibGUgdGhpcwo+
Pj4+PiBmZWF0dXJlIG9ubHkgd2hlbiBOUl9DUFVTIGlzIGdyZWF0ZXIgdGhhbiA1MTIsIHdoeSA1
MTIsIHNpbmNlIHRoZW4KPj4+Pj4gdGhlIGtlcm5lbCBzaXplIHdpdGggb2Zmc3RhY2sgaXMgc21h
bGxlci4KPj4+Pgo+Pj4+IFRoaXMgaXNuJ3QgdGhlIHJlYXNvbiB3aHkgQXJtIGRlY2lkZWQgdG8g
c3RhcnQgYXQgNTEyLCBhZmFpY3QuIFRoZQo+Pj4+IHJlYXNvbgo+Pj4+IGZvciBBcm0gd2FzIGJl
Y2F1c2UgaGFja2JlbmNoIGRpZCBiZXR0ZXIgd2l0aCBvbnN0YWNrIGZvciAyNTYuIFdoYXQgYXJl
Cj4+Pj4gdGhlIGhhY2tiZW5jaCByZXN1bHRzIGZvciByaXNjdj8KPj4+Cj4+PiBPa2F5LCBJIHdp
bGwgYWRkIHRoZSB0ZXN0IHJlc3VsdHMgb2YgaGFja3Rlc3Qgc29vbi4KPj4KPj4gQmVuY2htYXJr
IHJlc3VsdHMgdXNpbmcgaGFja2JlbmNoIGF2ZXJhZ2Ugb3ZlciA1IHJ1bnMgb2YKPj4gLi9oYWNr
YmVuY2ggLXMgNTEyIC1sIDIwIC1nIDEwIC1mIDUwIC1QCj4+IG9uIFFlbXUuCj4+Cj4+IE5SX0NQ
VVPCoMKgwqDCoCA2NMKgwqDCoMKgwqAgMTI4wqDCoMKgwqAgMjU2wqDCoMKgwqAgNTEywqDCoMKg
wqAgMTAyNMKgwqDCoCAyMDQ4Cj4+IG9uc3RhY2svc8KgwqAgNi45OTkywqAgNi42MTEywqAgNi43
ODM0wqAgNi42NTc4wqAgNi42NjQ2wqAgNi44NjkyCj4+IG9mZnN0YWNrL3PCoCA2LjU2MTbCoCA2
Ljk1wqDCoMKgIDYuNTY5OMKgIDYuOTHCoMKgwqAgNi42NjPCoMKgIDYuODIwMgo+PiBkaWZmZXJl
bmNlwqAgLTYuMjUlwqAgKzUuMTIlwqAgLTMuMTUlwqAgKzMuNzklwqAgLTAuMDIlwqAgLTAuNzEl
Cj4+Cj4+IFdoZW4gdGhlcmUgYXJlIG1vcmUgY29yZXMsIHRoZSBmbHVjdHVhdGlvbiBpcyBtaW5p
bWFsLCBsZWFkaW5nIHRvIHRoZQo+PiBzcGVjdWxhdGlvbiB0aGF0IHRoZSBwZXJmb3JtYW5jZSBn
YXAgd291bGQgYmUgc21hbGxlciB3aXRoIGEgaGlnaGVyCj4+IG51bWJlciBvZiBOUl9DUFVTLgo+
PiBTaW5jZSBJIGRvbid0IGhhdmUgYSBSSVNDViBzaW5nbGUtYm9hcmQgY29tcHV0ZXIsIHRoZXNl
IGFyZSB0aGUgcmVzdWx0cwo+PiBJIG9idGFpbmVkIGZyb20gdGVzdGluZyBpbiBRRU1VLCB3aGlj
aCBtYXkgZGlmZmVyIGZyb20gdGhlIGFjdHVhbAo+PiBzaXR1YXRpb24uIFBlcmhhcHMgc29tZW9u
ZSBjb3VsZCBoZWxwIHdpdGggdGhlIHRlc3RpbmcuCj4+Cj4+IFRoYW5rcywKPj4gWXVudGFvCj4+
Cj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IHZtbGludXggc2l6ZSBjb21wYXJpc29uKGRpZmZlcmVuY2Ug
dG8gdm1saW51eF9vbnN0YWNrX05SX0NQVVMKPj4+Pj4gYmFzZWxpbmUpOgo+Pj4+Pgo+Pj4+PiBO
Ul9DUFVTwqDCoMKgwqAgMjU2wqDCoMKgwqDCoMKgwqDCoCA1MTLCoMKgwqDCoMKgwqDCoMKgIDEw
MjTCoMKgwqDCoMKgwqDCoCAyMDQ4wqDCoMKgwqDCoMKgwqAgNDA5Ngo+Pj4+PiBvbnN0YWNrwqDC
oMKgwqAgMTk4MTQ1MzbCoMKgwqAgMTk4NDA3NjDCoMKgwqAgMTk4ODA1ODTCoMKgwqAgMTk5Njk2
NzLCoMKgwqAgMjAxNDE3MDQKPj4+Pj4gb2Zmc3RhY2vCoMKgwqAgMTk4MTkxNDTCoMKgwqAgMTk4
NDA5MzbCoMKgwqAgMTk4ODA0ODDCoMKgwqAgMTk5Njg1NDTCoMKgwqAgMjAxMzU0NTYKPj4+Pj4g
ZGlmZmVyZW5jZcKgICswLjAyMyXCoMKgwqDCoCArMC4wMDElwqDCoMKgwqAgLTAuMDAxJcKgwqDC
oMKgIC0wLjAwMcKgwqDCoMKgwqAgLTAuMDMxJQo+Pj4+PiBpc19zbWFsbGVywqAgbsKgwqDCoMKg
wqDCoMKgwqDCoMKgIG7CoMKgwqDCoMKgwqDCoMKgwqDCoCB5wqDCoMKgwqDCoMKgwqDCoMKgwqAg
ecKgwqDCoMKgwqDCoMKgwqDCoMKgIHkKPj4+Pgo+Pj4+IFNpbmNlIHRoZSBzYXZpbmdzIGFyZSBh
bG1vc3Qgbm90aGluZyB3ZSBtdXN0IG5vdCBoYXZlIHRvbyBtYW55IGdsb2JhbAo+Pj4+IGNwdW1h
c2tzLiBCdXQgSSdtIGluIGZhdm9yIG9mIGVuc3VyaW5nIHN0YWNrIGRlcHRocyBzdGF5IHVuZGVy
IGNvbnRyb2wsCj4+Pj4gc28gdHVybmluZyBvbiBDUFVNQVNLX09GRlNUQUNLIHNvdW5kcyBnb29k
IHRvIG1lIGluIGdlbmVyYWwuCj4+Pj4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVudGFv
IExpdSA8bGl1eXVudGFvMTJAaHVhd2VpLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIGFyY2gvcmlz
Y3YvS2NvbmZpZyB8IDUgKysrLS0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
S2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4+PiBpbmRleCAwNTI1ZWUyZDYzYzcuLjU5
NjA3MTNiM2JmOSAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+Pj4+ICsr
KyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4+PiBAQCAtNzcsNiArNzcsNyBAQCBjb25maWcgUklT
Q1YKPj4+Pj4gwqDCoMKgwqDCoCBzZWxlY3QgQ0xJTlRfVElNRVIgaWYgUklTQ1ZfTV9NT0RFCj4+
Pj4+IMKgwqDCoMKgwqAgc2VsZWN0IENMT05FX0JBQ0tXQVJEUwo+Pj4+PiDCoMKgwqDCoMKgIHNl
bGVjdCBDT01NT05fQ0xLCj4+Pj4+ICvCoMKgwqAgc2VsZWN0IENQVU1BU0tfT0ZGU1RBQ0sgaWYg
TlJfQ1BVUyA+IDUxMgo+Pj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBDUFVfUE0gaWYgQ1BVX0lETEUg
fHwgSElCRVJOQVRJT04gfHwgU1VTUEVORAo+Pj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBFREFDX1NV
UFBPUlQKPj4+Pj4gwqDCoMKgwqDCoCBzZWxlY3QgRlJBTUVfUE9JTlRFUiBpZiBQRVJGX0VWRU5U
UyB8fCAoRlVOQ1RJT05fVFJBQ0VSICYmCj4+Pj4+ICFEWU5BTUlDX0ZUUkFDRSkKPj4+Pj4gQEAg
LTQyOCwxMSArNDI5LDExIEBAIGNvbmZpZyBTQ0hFRF9NQwo+Pj4+PiDCoCBjb25maWcgTlJfQ1BV
Uwo+Pj4+PiDCoMKgwqDCoMKgIGludCAiTWF4aW11bSBudW1iZXIgb2YgQ1BVcyAoMi01MTIpIgo+
Pj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gU01QCj4+Pj4+IC3CoMKgwqAgcmFuZ2UgMiA1MTIg
aWYgIVJJU0NWX1NCSV9WMDEKPj4+Pj4gK8KgwqDCoCByYW5nZSAyIDQwOTYgaWYgIVJJU0NWX1NC
SV9WMDEKPj4+Pj4gwqDCoMKgwqDCoCByYW5nZSAyIDMyIGlmIFJJU0NWX1NCSV9WMDEgJiYgMzJC
SVQKPj4+Pj4gwqDCoMKgwqDCoCByYW5nZSAyIDY0IGlmIFJJU0NWX1NCSV9WMDEgJiYgNjRCSVQK
Pj4+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0ICIzMiIgaWYgMzJCSVQKPj4+Pj4gLcKgwqDCoCBkZWZh
dWx0ICI2NCIgaWYgNjRCSVQKPj4+Pj4gK8KgwqDCoCBkZWZhdWx0ICI1MTIiIGlmIDY0QklUCj4+
Pj4KPj4+PiBUaGlzIGlzIHNvbWV3aGF0IHJlYXNvbmFibGUsIGV2ZW4gaWYgbm90aGluZyBpcyBn
b2luZyB0byB1c2UgdGhpcyBmb3IKPj4+PiBxdWl0ZSBhIHdoaWxlLCBzaW5jZSBpdCdsbCBoZWxw
IGF2b2lkIGJ1Z3MgcG9wcGluZyB1cCB3aGVuIE5SX0NQVVMgZ2V0cwo+Pj4+IGJ1bXBlZCBsYXRl
ciwgYnV0IGl0IGZlZWxzIGV4Y2Vzc2l2ZSByaWdodCBub3cgZm9yIHJpc2N2LCBzbyBJJ20gYSBi
aXQKPj4+PiBvbiB0aGUgZmVuY2UgYWJvdXQgaXQuIE1heWJlIGlmIGhhY2tiZW5jaCBkb2Vzbid0
IHNob3cgYW55IGlzc3VlcyB3ZQo+Pj4+IGNvdWxkIHR1cm4gQ1BVTUFTS19PRkZTVEFDSyBvbiBm
b3IgYSBzbWFsbGVyIE5SX0NQVVMgYW5kIGFsc28gc2VsZWN0Cj4+Pj4gYSBzbWFsbGVyIGRlZmF1
bHQ/Cj4+Pj4KPj4KPj4gSXQgc2VlbXMgdGhhdCB3aGVuIE5SX0NQVVMgaXMgbGFyZ2VyLCBoYWNr
YmVuY2ggcGVyZm9ybXMgYmV0dGVyLCBhbmQKPj4gd2hpY2ggTlJfQ1BVUyBkbyB5b3UgaGF2ZSBh
IHByZWZlcmVuY2UgZm9yPwo+Pgo+Pj4+IFRoYW5rcywKPj4+PiBkcmV3Cj4+Pj4KPj4+Pj4gwqAg
Y29uZmlnIEhPVFBMVUdfQ1BVCj4+Pj4+IMKgwqDCoMKgwqAgYm9vbCAiU3VwcG9ydCBmb3IgaG90
LXBsdWdnYWJsZSBDUFVzIgo+Pj4+PiAtLQo+Pj4+PiAyLjM0LjEKPj4+Pj4KPj4+Pj4KPj4+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
