Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F3ACE8E73
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wz1tZqt/xAF0Wjkdnrqo+NHiZy7wc/OVlETB/WGQTrE=; b=kWU2WhATzN9fVW
	e+4+bZmYThIot/Z+DJU4Vh4+npJUDxcbGG8sJfdiIDXQtHujq/h3zOIXGm968PF+YAHy3Oj6bmm7T
	GBMY4aUb3A4sNsPEIVSHIPfDBOrVGaCfmO9UPXtswTNlmXPOmF9uh7tJ5vBDE/pPZituHFM1bsdBU
	DkqS9+eL2cdtI6+SNH7hI9K8u3Coqy5i8LxwTeb/Zb9YQoP/BcyzHsS3nUQW5sEdN4JIuDljt5Qnt
	I9UnKfA0+ssQcDb3UH8+3rPb0sDdJtT6HXLTkTDBGbzo+QZsvyPkR/+xifz7Im3YDVxHHuJm3/XMI
	7dd4fIW7f9uEhmY4h3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xf0-00000000SPh-2UJm;
	Thu, 24 Oct 2024 13:13:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xac-00000000Ris-361D
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 13:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DC6CA45201;
	Thu, 24 Oct 2024 13:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EEBC4CEE6;
	Thu, 24 Oct 2024 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729775361;
	bh=nb17tpFBEr4PRv+4HRivZY+/kDVAsGeu50KxgyQfFtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+DhenBAKevA2lfvMQCT080RR15CYZlFd2OBex6DKPZSr3GlSJCnwVUvC/6MZpWav
	 atJeLaRqsLRsSbOgLmN9Dwjf2ik8vwDpRp/O2qkRL1ypA9TJFHhSJ6h8jjxZDcFSNG
	 kosMIC5Nt2BjAK39z4huh/7xjQKN1UF+X9TaSIx2RzTMCcK4amX66HejnuWydxomkS
	 tbcx3hdsDo7hWfeHHv4iP83Eroipu8AnnLKrEHA8HBRWMKBa0D7ZgyVHMJXogENKhG
	 bOMXwfdLhlWJfJnsnCEUJI8F29OJIMRSnnTlT+rmub7IRRCGCPO8hD4eNxXQAYyk1W
	 Y69zdtfXGdQ9Q==
Date: Thu, 24 Oct 2024 14:09:15 +0100
From: Will Deacon <will@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v10 0/7] Linux RISC-V IOMMU Support
Message-ID: <20241024130914.GF30704@willie-the-truck>
References: <cover.1729059707.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1729059707.git.tjeznach@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_060922_928453_CEA91F34 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMTE6NTI6MTJQTSAtMDcwMCwgVG9tYXN6IEplem5hY2gg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBSSVNDLVYg
SU9NTVUgYXJjaGl0ZWN0ZWQKPiBoYXJkd2FyZSBpbnRvIHRoZSBMaW51eCBrZXJuZWwuCj4gCj4g
VGhlIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uLCB3aGljaCB0aGlzIHNlcmllcyBpcyBiYXNl
ZCBvbiwgaXMKPiByYXRpZmllZCBhbmQgYXZhaWxhYmxlIGF0IEdpdEh1Yi9yaXNjdi1ub24taXNh
IFsxXS4KPiAKPiBBdCBhIGhpZ2ggbGV2ZWwsIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlv
biBkZWZpbmVzOgo+IAo+IDEpIERhdGEgc3RydWN0dXJlczoKPiAgIC0gRGV2aWNlLWNvbnRleHQ6
IEFzc29jaWF0ZXMgZGV2aWNlcyB3aXRoIGFkZHJlc3Mgc3BhY2VzIGFuZCBob2xkcwo+ICAgICBw
ZXItZGV2aWNlIHBhcmFtZXRlcnMgZm9yIGFkZHJlc3MgdHJhbnNsYXRpb25zLgo+ICAgLSBQcm9j
ZXNzLWNvbnRleHRzOiBBc3NvY2lhdGVzIGRpZmZlcmVudCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2Vz
IGJhc2VkCj4gICAgIG9uIGRldmljZS1wcm92aWRlZCBwcm9jZXNzIGlkZW50aWZpY2F0aW9uIG51
bWJlcnMuCj4gICAtIE1TSSBwYWdlIHRhYmxlIGNvbmZpZ3VyYXRpb24gdXNlZCB0byBkaXJlY3Qg
YW4gTVNJIHRvIGEgZ3Vlc3QKPiAgICAgaW50ZXJydXB0IGZpbGUgaW4gYW4gSU1TSUMuCj4gMikg
SW4tbWVtb3J5IHF1ZXVlIGludGVyZmFjZToKPiAgIC0gQ29tbWFuZC1xdWV1ZSBmb3IgaXNzdWlu
ZyBjb21tYW5kcyB0byB0aGUgSU9NTVUuCj4gICAtIEZhdWx0L2V2ZW50IHF1ZXVlIGZvciByZXBv
cnRpbmcgZmF1bHRzIGFuZCBldmVudHMuCj4gICAtIFBhZ2UtcmVxdWVzdCBxdWV1ZSBmb3IgcmVw
b3J0aW5nICJQYWdlIFJlcXVlc3QiIG1lc3NhZ2VzIHJlY2VpdmVkCj4gICAgIGZyb20gUENJZSBk
ZXZpY2VzLgo+ICAgLSBNZXNzYWdlLXNpZ25hbGVkIGFuZCB3aXJlLXNpZ25hbGVkIGludGVycnVw
dCBtZWNoYW5pc21zLgo+IDMpIE1lbW9yeS1tYXBwZWQgcHJvZ3JhbW1pbmcgaW50ZXJmYWNlOgo+
ICAgLSBNYW5kYXRvcnkgYW5kIG9wdGlvbmFsIHJlZ2lzdGVyIGxheW91dCBhbmQgZGVzY3JpcHRp
b24uCj4gICAtIFNvZnR3YXJlIGd1aWRlbGluZXMgZm9yIGRldmljZSBpbml0aWFsaXphdGlvbiBh
bmQgY2FwYWJpbGl0aWVzIGRpc2NvdmVyeS4KPiAKPiAKPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2Vz
IFJJU0MtViBJT01NVSBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiBhbmQgY29tcGxldGUKPiBzaW5n
bGUtc3RhZ2UgdHJhbnNsYXRpb24gd2l0aCBwYWdpbmcgZG9tYWluIHN1cHBvcnQuCj4gCj4gVGhl
IHBhdGNoZXMgYXJlIG9yZ2FuaXplZCBhcyBmb2xsb3dzOgo+IAo+IFBhdGNoIDE6IEludHJvZHVj
ZXMgbWluaW1hbCByZXF1aXJlZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIGRyaXZlci4K
PiBQYXRjaCAyOiBEZWZpbmVzIFJJU0MtViBJT01NVSBkYXRhIHN0cnVjdHVyZXMsIGhhcmR3YXJl
IHByb2dyYW1taW5nIGludGVyZmFjZQo+ICAgICAgICAgIHJlZ2lzdGVycyBsYXlvdXQsIGFuZCBt
aW5pbWFsIGluaXRpYWxpemF0aW9uIGNvZGUgZm9yIGVuYWJsaW5nIGdsb2JhbAo+ICAgICAgICAg
IHBhc3MtdGhyb3VnaCBmb3IgYWxsIGNvbm5lY3RlZCBtYXN0ZXJzLgo+IFBhdGNoIDM6IEltcGxl
bWVudHMgdGhlIGRldmljZSBkcml2ZXIgZm9yIFBDSWUgaW1wbGVtZW50YXRpb24gb2YgUklTQy1W
IElPTU1VCj4gICAgICAgICAgYXJjaGl0ZWN0ZWQgaGFyZHdhcmUuCj4gUGF0Y2ggNDogSW50cm9k
dWNlcyBJT01NVSBpbnRlcmZhY2VzIHRvIHRoZSBrZXJuZWwgc3Vic3lzdGVtLgo+IFBhdGNoIDU6
IEltcGxlbWVudHMgZGV2aWNlIGRpcmVjdG9yeSBtYW5hZ2VtZW50IHdpdGggZGlzY292ZXJ5IHNl
cXVlbmNlcyBmb3IKPiAgICAgICAgICBJL08gbWFwcGVkIG9yIGluLW1lbW9yeSBkZXZpY2UgZGly
ZWN0b3J5IHRhYmxlIGxvY2F0aW9uLCBoYXJkd2FyZQo+ICAgICAgICAgIGNhcGFiaWxpdGllcyBk
aXNjb3ZlcnksIGFuZCBkZXZpY2UgdG8gZG9tYWluIGF0dGFjaCBpbXBsZW1lbnRhdGlvbi4KPiBQ
YXRjaCA2OiBJbXBsZW1lbnRzIGNvbW1hbmQgYW5kIGZhdWx0IHF1ZXVlLCBhbmQgaW50cm9kdWNl
cyBkaXJlY3RvcnkgY2FjaGUKPiAgICAgICAgICBpbnZhbGlkYXRpb24gc2VxdWVuY2VzLgo+IFBh
dGNoIDc6IEltcGxlbWVudHMgcGFnaW5nIGRvbWFpbiwgdXNpbmcgaGlnaGVzdCBwYWdlLXRhYmxl
IG1vZGUgYWR2ZXJ0aXNlZAo+ICAgICAgICAgIGJ5IHRoZSBoYXJkd2FyZS4gVGhpcyBzZXJpZXMg
ZW5hYmxlcyBvbmx5IDRLIG1hcHBpbmdzOyBjb21wbGV0ZSBzdXBwb3J0Cj4gICAgICAgICAgZm9y
IGxhcmdlIHBhZ2UgbWFwcGluZ3Mgd2lsbCBiZSBpbnRyb2R1Y2VkIGluIGZvbGxvdy11cCBwYXRj
aCBzZXJpZXMuCj4gCj4gRm9sbG93LXVwIHBhdGNoIHNlcmllcyBwcm92aWRpbmcgTVNJIGludGVy
cnVwdCByZW1hcHBpbmcsIGNvbXBsZXRlIEFUUy9QUkkvU1ZBCj4gYW5kIFZGSU8vSU9NTVVGRCBz
dXBwb3J0IGFyZSBhdmFpbGFibGUgYXQgdGhlIEdpdEh1YiBbMl0sIGFuZCBoYXMgYmVlbiB0ZXN0
ZWQKPiB3aXRoIHB1Ymxpc2hlZCBRRU1VIFJJU0MtViBJT01NVSBkZXZpY2UgbW9kZWwgWzNdLgo+
IAo+IENoYW5nZXMgZnJvbSB2OToKPiAtIHJlYmFzZSBvbiB2Ni4xMi1yYzMKPiAtICM2IE1lbW9y
eSBvcmRlcmluZyBmaXggYW5kIHVwZGF0ZWQgY29tbWVudGFyeSwgYmFzZWQgb24gV2lsbOKAmXMg
c3VnZ2VzdGlvbnMuCj4gLSAjNyBSZW1vdmUgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBl
KCkgYW5kIHVzZSBoZWFkLWxlc3Mga2ZyZWVfcmN1IGluCj4gICAgICByaXNjdl9pb21tdV9yZWxl
YXNlX2RldmljZSgpLCBiYXNlZCBvbiBKYXNvbidzIHN1Z2dlc3Rpb25zLgoKVGhhbmtzLCBsb29r
cyBvayB0byBtZSBub3cuCgpXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
