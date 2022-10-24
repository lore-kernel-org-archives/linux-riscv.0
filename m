Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67518C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkU1/vsXOPk51muYGUbeBfKio4By7dd+FhpBNbxtEv4=; b=NuzOAR3uXMQV3t
	W6b71J9LfH78mFaXinNcj+tVUmPI1OIt6sHx2Va4pWPxtElPMwGaJdLkrg32LgZ3HlkximBLLdUIO
	vHIeSL36zbUgGBTKv2OeHuRIBi/y9hgcJ6ezXfA2UeAT0dE96K/1n36UUf+2/rFCF1jjhotn593hm
	5fz1S7GKc9YhmSRhaFtRyEl6aBpRry6j1jWCPwVaFYyCekfGW92AE4KxnCOqYTfIhSnhawxXJAcyl
	f+JQmSx5eTVvmDOSe+S8AGEuca/kZp9h+MBFCgwyVXt+UfZXNc7QGX2iWWavR3DbHBsBT+/ViuOcs
	Jip1aTA9JdVFNX+g+Czg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyn0-001z1H-49; Mon, 24 Oct 2022 14:50:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omymx-001yvB-7o
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 14:50:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 14A10B8169B;
	Mon, 24 Oct 2022 14:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D02C433C1;
	Mon, 24 Oct 2022 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666623047;
	bh=JkXqR12g5C+Z3W0bLPgpfCWsI046Loldfd/aXLZuzR4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=JE8eb7X1Hu0Te7+0i8xW728pdxMAKfYCIVXsJa19Z2Qg9Bqtz+BTR1gmBdHg1yGml
	 i+V74WFQgORnY4506/3xUxZ94u4PYAz3PzfFitRjs+WKya3ubQR0xWlgjv5P2R38Hd
	 Mm6BqZ96KGKDqmpXMpVzyBFqS14ipe4QBO5Ru004UJggAF9rQFuPA+MGf4vLtHMAuh
	 LUpwXIeLQoJKi/im83DcuxZP9gMOxcZH7L4Z/YRMbkdHViQQc26cel8t4p5rWxe4hY
	 7z6cJ1xs7OSLFZXa8/2ULv/QXQFf+or8ggpoWQ7i3bEcrIXqWTYp9CzPDKe3lUUTdo
	 bIRVEGVi3JNcQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>
Subject: Re: linux-riscv Patchwork Sync-Up Meeting
In-Reply-To: <mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a>
References: <mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a>
Date: Mon, 24 Oct 2022 16:50:44 +0200
Message-ID: <877d0p6zsr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_075051_605535_23D829F7 
X-CRM114-Status: GOOD (  27.56  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JpdGVzOgoKPiBDYXJsb3MgKGZy
b20gZ2xpYmMpIGFuZCBJIHdlcmUgdGFsa2luZyBhdCBQbHVtYmVycyBhYm91dCB0aGUgcGF0Y2h3
b3JrIAo+IHN5bmMgdXAgbWVldGluZyB0aGV5IGhhdmUgWzFdLiAgVGhpcyBzZWVtZWQgbGlrZSBh
IGdlbmVyYWxseSBnb29kIGlkZWEgCj4gdG8gbWUgYXQgdGhlIHRpbWUsIEkndmUgYmVlbiBtZWFu
aW5nIHRvIGdvIHRvIGZpZ3VyZSBvdXQgZXhhY3RseSBob3cgaXQgCj4gd29ya3MgYnV0IGl0J3Mg
YXQgNmFtIE1vbmRheSBtb3JuaW5ncyBmb3IgbWUgc28gSSd2ZSB5ZXQgdG8gbWFrZSBvbmUuICAK
PiBNeSBvcmlnaW5hbCBwbGFuIHdhcyB0byB3YWl0IHVudGlsIEknZCBsZWFybmVkIGhvdyB0aGF0
IHdvcmtzIGJlZm9yZSAKPiBkb2luZyBhIGxpbnV4LXJpc2N2IHN5bmMgbWVldGluZywgYnV0IHdl
IHdlcmUganVzdCB0YWxraW5nIG9uIElSQyAKPiBlYXJsaWVyIHRvZGF5IGFuZCBJIGZpZ3VyZWQg
bGV0J3MganVzdCBnbyBhaGVhZCBhbmQgc2NoZWR1bGUgb25lIGFzIGEgCj4gZm9yY2luZyBmdW5j
dGlvbiB0byBtYWtlIHNvbWV0aGluZyBoYXBwZW4uCj4KPiBUaGUgZ2VuZXJhbCBpZGVhIGlzIHRv
IGdldCBzb21lIHRpbWUgYmxvY2tlZCBvZmYgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIAo+IHBhdGNo
d29yayBpbnN0YW5jZSBzdGF5cyBzdWZmaWNpZW50bHkgY2xlYW4gdG8gcmVtYWluIHVzZWZ1bC4g
IFRoYXQgCj4gbWVhbnMgd2UncmUgbm90IGdvaW5nIHRvIHRyeSBhbmQgYWN0dWFsbHkgZ2V0IHRo
ZSBwYXRjaGVzIHJldmlld2VkIAo+IGR1cmluZyB0aGUgbWVldGluZyAodGhhdCB3aWxsIHN0YXkg
b24gdGhlIGxpc3RzKSwgYnV0IHdlJ2xsIGp1c3QgdHJ5IHRvIAo+IG1ha2Ugc3VyZSB0aGF0IHRo
ZXJlJ3MgZW5vdWdoIHRpbWUgYmxvY2tlZCBvZmYgdG8gZ2V0IHRoZSBwYXRjaGVzIAo+IHRyaWFn
ZWQgZWFjaCB3ZWVrIGFuZCBtYWtlIHN1cmUgbm90aGluZyBpcyBzbGlwcGluZyB0aHJvdWdoIHRo
ZSBjcmFja3MuICAKPiBJJ20gc3VyZSB0aGVyZSdsbCBpbmV2aXRhYmx5IGJlIGRpc2N1c3Npb24g
b24gdGhlIGNvbnRlbnRzIG9mIHNvbWUgCj4gcGF0Y2hlcywgYnV0IGFzIGV2ZXJ5b25lIGNhbid0
IHBhcnRpY2lwYXRlIHdlJ2xsIGp1c3QgbmVlZCB0byBiZSBzdXJlIHRvIAo+IHJlZmxlY3QgZXZl
cnl0aGluZyB0byB0aGUgbWFpbGluZyBsaXN0cyBsaWtlIHdlIHRyeSB0byBkbyBmb3IgZXZlcnkg
Cj4gb2ZmLWxpc3QgZGlzY3Vzc2lvbi4KPgo+IFRoZSBtZWV0aW5nIGlzIG9wZW4gdG8gYW55b25l
LCBJJ3ZlIG1hZGUgYSBHb29nbGUgQ2FsZW5kYXIgZm9yIGl0IHRoYXQgCj4gc2hvdWxkIGJlIHB1
YmxpYyBbMl0gYnV0IEknbSBwYXN0aW5nIHRoZSBkZXRhaWxzIGhlcmUgYXMgd2VsbDoKPgo+ICAg
ICBsaW51eC1yaXNjdiBQYXRjaHdvcmsgU3luYwo+ICAgICBXZWRuZXNkYXksIE9jdG9iZXIgMjYg
wrcgNzowMCDigJMgODowMGFtCj4gICAgIEdvb2dsZSBNZWV0IGpvaW5pbmcgaW5mbwo+ICAgICBW
aWRlbyBjYWxsIGxpbms6IGh0dHBzOi8vbWVldC5nb29nbGUuY29tL3Rody1xb2p0LXBidgo+ICAg
ICBPciBkaWFsOiAoVVMpICsxIDIyNC01NzItODUzNSBQSU46IDIwNyA1NTYgODc5ICMKPgo+IEhh
cHB5IHRvIG1vdmUgdG8gc29tZXRoaW5nIGFzaWRlIGZyb20gR29vZ2xlIE1lZXQsIGJ1dCBpdCdz
IHRoZSBtb3N0IAo+IHJlbGlhYmxlIHNldHVwIGZvciBtZSB0aGVzZSBkYXlzIGFzIGl0J3Mgd2hh
dCB3ZSB1c2UgYXQgd29yay4gIElmIGZvbGtzIAo+IHByZWZlciBzb21ldGhpbmcgZWxzZSB0aGF0
J3MgZmluZSB3aXRoIG1lLCBqdXN0IHNheSBzbyBhbmQgSSdsbCB0cnkgdG8gCj4gZmlndXJlIG91
dCBob3cgdG8gc29ydCBpdCBvdXQgKGFzIGxvbmcgYXMgaXQgcnVucyBvbiBhIENocm9tZWJvb2ss
IHdoaWNoIAo+IGlzIHdoYXQgSSB1c2UgZm9yIHZpZGVvIGNhbGxzKS4gIElJVUMgdGhlIGdsaWJj
IGZvbGtzIGFsc28gaGF2ZSBJUkMgb3BlbiAKPiBkdXJpbmcgdGhlIHN5bmNzIGZvciB0ZXh0LCB0
aGF0IHNlZW1zIHJlYXNvbmFibGUgdG8gbWUgKCNyaXNjdiBvbiBsaWJlcmEgCj4gbG9va3MgbGlr
ZSB0aGUgYmVzdCBiZXQgdG8gbWUpLgo+Cj4gSXQgZG9lc24ndCBzdGFydCBuZXh0IHdlZWsgYXMg
bXkgaW50ZXJuZXQgaXMgZG93biBhdCBob21lIGFuZCBJJ20gCj4gZ2V0dGluZyB0aGUgc2Vydmlj
ZSBzd2FwcGVkIG92ZXIgbmV4dCBXZWRuZXNkYXkgbW9ybmluZywgc28gaXQnbGwgc3RhcnQgCj4g
dGhlIHdlZWsgYWZ0ZXIuICBUaGUgcGxhbiBpcyB0byBoYXZlIGl0IGV2ZXJ5IHdlZWsgb24gV2Vk
bmVzZGF5IAo+IG1vcm5pbmdzLCBhcyB0aGF0J2xsIGdpdmUgdXMgZW5vdWdoIHRpbWUgdG8gbWFr
ZSBzdXJlIGFueSBjcml0aWNhbCBSQyAKPiBwYXRjaGVzIHRoYXQgZ2V0IGNhbGxlZCBvdXQgY2Fu
IHN0aWxsIGdldCByZXZpZXdlZCBpbiB0aW1lIGZvciB0aGF0IAo+IHdlZWsncyBQUi4KPgoKSXQg
d291bGQgYmUgbmljZSBoYXZlIHNvbWUgUFcgImNoZWNrcyIgZm9yIHRoZSBSSVNDLVYgdHJlZXMs
IGxpa2UgdGhlCm5ldGRldi9ibHVldG9vdGggcGF0Y2h3b3JrIHByb2plY3RzIGRvLgoKSSB0b29r
IEpha3ViJ3MgKG5ldGRldikgTklQQSB3b3JrLCBhbmQgcmlwcGVkIG91dCB0aGUgbmV0ZGV2IHNw
ZWNmaWNzLAphbmQgYWRkZWQgYSBSSVNDLVYgYnVpbGQgWzNdLiBWZXJ5IGNydWRlIGhhY2ssIGFu
ZCBpdCdzIG1vc3RseSB0byBnZXQKKnNvbWV0aGluZyogaW4gcGxhY2UgdG8gZGlzY3Vzcy4gSXQg
d291bGQgYmUgaW50ZXJlc3RpbmcgdG8gaGVhciB3aGF0CnBlb3BsZSB0aGluayAoZ29vZC9iYWQs
IHdoYXQgb3RoZXIgcHJvamVjdHMgdXNlLCBldGMpLiBMZXQncyB0YWxrIGFib3V0Cml0IG9uIFdl
ZG5lc2RheS4KCkkndmUgcHV0IHNvbWUgbW9yZSB0aGluZ3MgdG8gdGhpbmsgYWJvdXQgaW4gYSBn
ZG9jIHNsaWRlIGRlY2sgWzRdLgoKCkJqw7ZybgoKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9iam90
by9uaXBhL3RyZWUvcnYKWzRdIGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3ByZXNlbnRhdGlvbi9k
LzFsY1g3TDc1Uml4M2t2U09ZZExyZFdJNllIUDFrdy1YVl9hU210WUlweVpJL2VkaXQ/dXNwPXNo
YXJpbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
