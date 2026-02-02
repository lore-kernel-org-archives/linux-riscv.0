Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD1CD172CC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKgiTSKaDsPyPUnjU9nH/fa6R0QRj/7y0pOToYi3kvg=; b=0pC5pIyfhc53G7
	+GrIqnrYwCQ3hEmzAD3zWA/AgRY3vFZTFz/wpTL0g1daQdB64G9/UAGnvKC3HdDIXiTyWWDqM9+hg
	gaX4yUb0nsMhXLYWUKX6Bn1W0fIrTjbGq88yLhaj5dlAS5ndA2cJ7Qf1w3/3JPaClgkwDMS0OapCr
	o1l8Hpv6wGIRA5VsMPRSl0qhWdxGM+nn1oEsxZnXsXbnBoa7S4g2K0eRFDqH60hF0j6EUCK5GOrj9
	suItnSZHdRm+01uXZ1CIBBwQz360Tv4HHh1d014nfgp+Gk84A2fPeF4EVxQwmOJY1xA3ou7qM3iIJ
	9tOb8WlItzTUq8+z4OnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmn0m-00000004UF5-3oXJ;
	Mon, 02 Feb 2026 06:02:12 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmn0j-00000004UEk-3hRh
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 06:02:11 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-45f126d47b8so2711189b6e.2
        for <linux-riscv@lists.infradead.org>; Sun, 01 Feb 2026 22:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770012128; cv=none;
        d=google.com; s=arc-20240605;
        b=MBX4aTSz6CVQ1T0a0oIH+Ev/UcerhOMQAsi4d+Zn0GYW4GoyvCw2MwpakJlC5izBUP
         w5wF+iJ87pBtPookvKmI4h+i5JYBWQ8MCHJKP+Y4lG1yzWpQTJUmafUmlAUHHZhDG0Ws
         4kjNYqyLmYXBFynpYg+r4f40GcK8iVNUQYrLBwEO5WzMEW36iA/fvTywKTBUbHCTrUeF
         C6xHzZRK0+pB9ua69fKNb+EeZZzwlv8CiBecpaiGh0CTYH5bTc0UZrVqX6PPdToiNXuW
         9L7ctBvs0oZLktocu+BU0V8Q+NiT8C/kiFcWDXy2O1sK3FXXZBW0qYiyJy0PC2UqbVFg
         7JrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcxQOk1Ogg7o0Jhu3EeWbmSG4NAptutIfk5zNYKLdfs=;
        fh=mvzgO8FUOvegseESlPyKvyf5tQPy7Qz9s21TdSSad3w=;
        b=iYMZ4i6eR2UdwCOsbaBLKLVjmp3G2AzeID9ba2tKjmlG7LDsi2OjGX/NiSEUFkK4aF
         XltMnlDiKn8jsLE10aa751gsHLC5A5pw+BoeY4lO95wY++sfekdAKBCeGRegDuVjcQFO
         g7QKncPRhk5FEo41u5ojj1uFu5NSeMUSCPBuE5nikxm1cz+Ch4aiXsRiWMguGCXquhIL
         oY65WXjmAyPwWHPrQ34M3ChjWUWipzfDvdEn2uGiBXJoPNgK2RMQAsNfcXs9GnIohcSN
         +g1eUoXekBXKDAtlVL14qX+nTKhwQQkRjaojOmtsZKWh+2/CTEx2pYiO/VzBvHWwxnnN
         QuMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1770012128; x=1770616928; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcxQOk1Ogg7o0Jhu3EeWbmSG4NAptutIfk5zNYKLdfs=;
        b=c/ft8GRvo55WsJJMniJpufBIX3wcR3QyIQ8HN+WCbe9ufQCuSA+raZ5Nz227je9scm
         K51FnORlch38i96mdOKiD+k30wIIz75D7HwpYxT27hhCicT6KzJ4wRRUkC2PwQjPyH4r
         d0EVro7zpJl24i+EIpY7B6pUxuf1ZNmyit8CkyqDPqgI3gKoKTkXzmRi+Jbdb4/B2Llg
         RLA6+TVV1kVl7R2/fz+CbfYw5YU3ltrpfvGGTRb2emhY7zEFzP4HZMnZinw7akuQ/RAY
         ZrOnEsQl9aLEw1Ri7cC7wwJwdx8rFc2cs1UHvkzWXsmGo/PaEE+wl+vqz3Ki4ZZgq9sk
         cpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770012128; x=1770616928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GcxQOk1Ogg7o0Jhu3EeWbmSG4NAptutIfk5zNYKLdfs=;
        b=lN1937FGrPlsBa+pPIfBp/Y550XWOBeDYgUJ5i3w6rTNe9koH4hIIFPLvlBPDM2YOO
         kqBsTyJLFSNj4aLHdnGChr31ETlXMX4gzLGUxcqbbJ8I1AYUsxuWAeWRLfcu7oCNOuyd
         d5YIDb+c/m4SkbrmTyt3PmbuppS9SEJDoKAn7/Q1aYa3SqwemdGDMkJ5cMexs0gPqwCQ
         s0Bp/qtKOxkrbuXjjbYJ2ns9BbwoAclpZKUrowrFyYrTJFpipfLrVGXEIVnfVspAjqAI
         5wnC3bvWo0gVYafSx/NWhBOxVJRKw8scuSJn7ok9Z3Fd/htA4ZJctxx3p7a42XO1chox
         oz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo9hwpBert2dKxd0bwIgL3aADbPFPDn9Wz7TcTYIP4y43XBXQMyOj1KZdXU7UFRkQvj+SY43YyCADU/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUjn9Uy1yoAdjtDG2RydCj0aFEykDYharskmZtTZIOl1rL/zgp
	D1aSFY4j78h8R8NmaWvfbGIuJhcSOXBHDAxGoS4Oy1F5pBgCgrauptvt8KsSt/YTIcmRhSNXQFj
	C6qWQB96WS1iSX1nOv1OFW819PVTlaKHLHqcGMQJBWw==
X-Gm-Gg: AZuq6aLhwlY5JwRsLuPVDBajd4St+2h3pYICmp9nyGKynxoJtRW4BhBieB+BdL+vcsO
	n2dcXspnoTxk7irhl58Tc/Lo4U4JKZ1R5sE9xyaEgCkubvWdPdz72nVfhvtRrKQD4Ip/lj/hR6H
	wIPTF2mRIyd5kWW1XMRnewRzn/1/49qOqOB/QsWM1IkUDNP7LrFQMqbc2PXFdgNVbF8T+MQUGYg
	IIZk7ntpK7M1LIKHMNj4AVkvM7t8Esgq/mzDObZyublL8k/iprQdZXL6kGkZ8esIoUsRzM=
X-Received: by 2002:a05:6820:22a7:b0:662:fc84:fa6b with SMTP id
 006d021491bc7-6630f35f60cmr5159965eaf.49.1770012128041; Sun, 01 Feb 2026
 22:02:08 -0800 (PST)
MIME-Version: 1.0
References: <0-v3-9dbf0a72a51c+302-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v3-9dbf0a72a51c+302-iommu_pt_riscv_jgg@nvidia.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Sun, 1 Feb 2026 22:01:55 -0800
X-Gm-Features: AZwV_Qje4rxoo7R40kPWf455fQUtzOoH5ybCxsGtQwxNUqW6waJoYKR0ZFyVEDA
Message-ID: <CAH2o1u5-VuEUJp2MNb41uxQJk=SR1uZbQkiqQWoLBj-+GXTVkw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Convert riscv to use the generic iommu page table
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>, 
	patches@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, xieyongji@bytedance.com, tjeznach@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_220210_079525_93C40BEB 
X-CRM114-Status: GOOD (  23.96  )
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

T24gRnJpLCBKYW4gMzAsIDIwMjYgYXQgNDowMOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gWyBKb2VyZywgSSB0aGluayB3ZSBhcmUgZ29vZCBub3csIHBs
ZWFzZSBwaWNrIGl0IHVwIHRoaXMgY3ljbGUgXQo+Cj4gVGhpcyBpcyBhIGZhaXJseSBzdHJhaWdo
dGZvcndhcmQgY29udmVyc2lvbiBvZiB0aGUgUklTQy1WIGlvbW11IGRyaXZlciB0bwo+IHVzZSB0
aGUgbm93IG1lcmdlZCBnZW5lcmljIGlvbW11IHBhZ2UgdGFibGUgY29kZS4KPgo+IEl0IGJyaW5n
cyBzdXBwb3J0IGZvciBTVk5BUE9UIHdoaWNoIGlzIGEgNjRLIGNvbnRpZ3VvdXMgcGFnZS4gT3Ro
ZXJ3aXNlIGl0Cj4gc2hvdWxkIG5vdCBjaGFuZ2UgdGhlIGJlaGF2aW9yLgo+Cj4gVGhlIHNlcmll
cyBkaXNhYmxlcyBTQURFIGFzIHRoZSBkaXJ0eSB0cmFja2luZyBzdXBwb3J0IGlzIG5vdCBpbXBs
ZW1lbnRlZAo+IGluIHRoZSBkcml2ZXIgYW5kIHNob3VsZCBiZSBkb25lIHNvbWV3aGF0IGRpZmZl
cmVudGx5LiBUaGUgZ2VuZXJpYyBjb2RlCj4gZ2V0cyBmdXJ0aGVyIGFsb25nIHRob3VnaCB0aGlz
IGRvZXMgbm90IGluY2x1ZGUgdGhlIGZvcm1hdCBpbXBsZW1lbnRhdGlvbgo+IG9mIHJlYWQgYW5k
IGNsZWFyIGRpcnR5Lgo+Cj4gVGhlIGZvcm1hdCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgYmUgYWJs
ZSB0byBzdXBwb3J0IHRoZSAzMiBiaXQgb3B0aW9uLCBidXQKPiB0aGlzIGRvZXMgbm90IGVuYWJs
ZSB0aGUgaW9tbXUgaW1wbGVtZW50YXRpb24gYXMgdGhlcmUgc2VlbXMgdG8gYmUgbm8gdXNlcgo+
IHRvZGF5Lgo+Cj4gSXQgbG9va3MgbGlrZSBSSVNDViBjb3VsZCBzdXBwb3J0IHRoZSBEWU5BTUlD
X1RPUCBvcHRpb24uIEl0IHdvdWxkIHJlcXVpcmUKPiBzb21lIGFkZGl0aW9uYWwgd29yayBvbiB0
aGUgY29yZSBzaWRlIHRvIGludGVyYWN0IHNhZmVseSB3aXRoIFNJR05fRVhURU5ELgo+Cj4gVGhp
cyBpcyBvbiBnaXRodWI6IGh0dHBzOi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1p
dHMvaW9tbXVfcHRfcmlzY3YKPgo+IHYzOgo+ICAtIFJlYmFzZSB0byB2Ni4xOS1yYzcKPiAgLSBB
ZGQgbWlzc2VkIGxpbmUgaW4gS2NvbmZpZwo+IHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsv
ci8wLXYyLWIxMWViY2E4YWJiNitjMDk2LWlvbW11X3B0X3Jpc2N2X2pnZ0BudmlkaWEuY29tCj4g
IC0gUmViYXNlIHRvIHY2LjE5LXJjMQo+ICAtIEZpeCB0eXBvIGluIFBUX0ZFQVRfUklTQ1ZfU1ZO
QVBPVF82NEsKPiB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rL3IvMC12MS1kMzMxN2IwZWUz
OTgrNTAtaW9tbXVfcHRfcmlzY3ZfamdnQG52aWRpYS5jb20KPgo+IEphc29uIEd1bnRob3JwZSAo
NSk6Cj4gICBpb21tdXB0OiBBZGQgdGhlIFJJU0MtViBwYWdlIHRhYmxlIGZvcm1hdAo+ICAgaW9t
bXUvcmlzY3Y6IERpc2FibGUgU0FERQo+ICAgaW9tbXUvcmlzY3Y6IFVzZSB0aGUgZ2VuZXJpYyBp
b21tdSBwYWdlIHRhYmxlCj4gICBpb21tdS9yaXNjdjogRW5hYmxlIFNWTkFQT1Qgc3VwcG9ydCBm
b3IgY29udGlndW91cyBwdGVzCj4gICBpb21tdS9yaXNjdjogQWxsb3cgUklTQ19WSU9NTVUgdG8g
Q09NUElMRV9URVNUCj4KPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0Ly5rdW5pdGNvbmZpZyAg
ICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvS2NvbmZpZyAgICAgICAg
ICAgICB8ICAxMSArCj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvTWFrZWZpbGUgICAg
ICAgIHwgICAyICsKPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9kZWZzX3Jpc2N2Lmgg
ICAgfCAgMjkgKysKPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9pb21tdV9yaXNjdjY0
LmMgfCAgMTEgKwo+ICBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L3Jpc2N2LmggICAgICAg
ICB8IDMxMyArKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUt
Yml0cy5oICAgICAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUu
YyAgICAgICAgICAgICAgICAgIHwgMzAyICsrKy0tLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xp
bnV4L2dlbmVyaWNfcHQvY29tbW9uLmggICAgICAgICAgICB8ICAxNiArCj4gIGluY2x1ZGUvbGlu
dXgvZ2VuZXJpY19wdC9pb21tdS5oICAgICAgICAgICAgIHwgIDExICsKPiAgMTEgZmlsZXMgY2hh
bmdlZCwgNDQ3IGluc2VydGlvbnMoKyksIDI2MSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvZGVmc19yaXNjdi5oCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L2lvbW11X3Jpc2N2NjQu
Ywo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNj
di5oCj4KPgo+IGJhc2UtY29tbWl0OiA2MzgwNGZlZDE0OWE2NzUwZmZkMjg2MTBjNWMxYzk4Y2Nl
NmJkMzc3Cj4gLS0KPiAyLjQzLjAKPgoKVGhhbmtzIEphc29uIGZvciB0aGlzIGNoYW5nZS4KCkFs
bCB0ZXN0ZWQsIHJ1biB3aXRoIE5WTWUgLyBOSUNzLiBObyBpc3N1ZXMuIFNvbWUgbWlub3IgcGVy
Zm9ybWFuY2UKY2hhbmdlcyAocG9zaXRpdmUgb3IgbmVnYXRpdmUgZGVwZW5kaW5nIG9uIHRoZSB3
b3JrbG9hZCkuIE5vIGlzc3Vlcy4KT3BlbiBpc3N1ZSBvbiBRRU1VIFJJU0MtViBJT01NVSBtb2Rl
bCAtIFNWTkFQT1Qgc3VwcG9ydCBpcyBtaXNzaW5nLgpJJ3ZlIG1hZGUgYSBsb2NhbCBjaGFuZ2Ug
dG8gZml4IGl0LCBhbmQgd2lsbCBwb3N0IGl0IHNvb24uCgpSZXZpZXdlZC1ieTogVG9tYXN6IEpl
em5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KVGVzdGVkLWJ5OiBUb21hc3ogSmV6bmFjaCA8
dGplem5hY2hAcml2b3NpbmMuY29tPgoKQmVzdCwKLSBUb21hc3oKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
