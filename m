Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8DCC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sat, 10 May 2025 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDG25nK+YuoXCcHpzFCmYHQDPo1b4boRAIhrf3+lphE=; b=Nxccw6DxBqP1UIb3i8YTAv7E+J
	smuii20hm/hEEe7p3aPapOVJfIcGCTVF9I6l8X3QOM6QO4veVPoORovcwHZOPews0xyC3BYpFnb8B
	PXyahzHqx5tDDUXib6OMTiZJPZR0HjE/e0R8sZpoTI6VTPaWn/kG+ntGhnKSHORVbn+zF7lbAcXsc
	QdKbPtBlRV40IUVZ+ioV2AJTu7ugv+XCZhektw/YOnSBap75KaoHG5sObmvCFxokPtTwkzz22D4me
	uHV79j/oqNZA+Pl6q62kZZ65YrfZ/gyT0IqRVXDhJ8siHVj5OMUX9AmaCXwbEuKns+Q5b9jZ7wRhe
	77jei3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDY8f-00000005BwY-3FRl;
	Sat, 10 May 2025 00:32:25 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDY8b-00000005Bw6-28o6
	for linux-riscv@lists.infradead.org;
	Sat, 10 May 2025 00:32:24 +0000
Message-ID: <cce3682b-a228-45cf-821b-943c8a7449f8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746837134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMbLKDOmk2u6nn8selkEf8VIEj1j0iQAKfJ7EN3yRnw=;
	b=oSweLRfaPUY/97jzu22LKnFVCpbdjafiiGbwdsKskPmVVVuxcLgUyc/LYxRhJkCX/Z8zwB
	epnuNkJHT6Anyzv6cIwApLfl9DYMI1V3H450kS3dEG+h+j3+D2eFfSoJHIbZCsrLeGX83K
	Kw0ONC8qNknXnqHUjQ2cmIpkE5wfd6s=
Date: Fri, 9 May 2025 17:32:06 -0700
MIME-Version: 1.0
Subject: Re: Merging plan for SBIv3-dependent patches
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <mhng-4c05b8a8-03ab-4e68-ae73-ed405f196e7c@palmer-ri-x1c9a>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <mhng-4c05b8a8-03ab-4e68-ae73-ed405f196e7c@palmer-ri-x1c9a>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_173223_002423_0476890A 
X-CRM114-Status: GOOD (  15.47  )
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

T24gNS84LzI1IDEwOjI1IEFNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBXZSd2ZSB0YWxrZWQg
YWJvdXQgdGhpcyBhIGZldyB0aW1lcyBpbiB0aGUgcGF0Y2h3b3JrIG1lZXRpbmcsIGJ1dCBJIAo+
IGZpZ3VyZWQgSSdkIHdyaXRlIHVwIGFuIGVtYWlsIGFzIHRoaXMgaXMgYSBiaXQgb2YgYSB3YWNr
eSBwcm9jZXNzLgo+IFRoZXJlJ3MgYSBidW5jaCBvZiBwYXRjaCBzZXRzIGJsb2NrZWQgb24gdGhl
IFNCSXYzIGZyZWV6ZS7CoCBUaGF0J3MgYmVlbiAKPiBjb21pbmcgc29vbiBmb3IgYSB3aGlsZSBu
b3csIGJ1dCBpdCBzZWVtcyBsaWtlIG5vdyBpdCdzIGFjdHVhbGx5IHJlYWxseSAKPiBjb21pbmcg
c29vbi7CoCBTbyBJJ20gZ29pbmcgdG8gc3RhcnQgc3RhZ2luZyB0aG9zZSBvbnRvIGEgInNiaXYz
IiBicmFuY2gsCgpZZXMuIFRoZSBTQkkgdjMuMCBpcyBvZmZpY2lhbGx5IGZyb3plbiBub3cuIGhl
cmUgaXMgdGhlIGFubm91bmNlbWVudCBhbmQgCmFsb25nIHdpdGggdGhlIGRvY3VtZW50IHN0YXR1
cy4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBT25KQ1VKejZwNmIwV0tf
Nz1xb3dlOF9wQ0hudjVXSlhOWU1hLXV6RnkwUEhjN0R2Z0BtYWlsLmdtYWlsLmNvbS8KCgo+IGFz
IHRoZXJlJ3Mgc29tZSBjcm9zcy1zZXQgZGVwZW5kZW5jaWVzIGFuZCBwcm9iYWJseSBzb21lIG1l
cmdlIGNvbmZsaWN0cyAKPiB0aGF0IHdpbGwgbmVlZCB0byBnZXQgc29ydGVkIG91dC4KPiAKPiBJ
J20gZ29pbmcgdG8gcGxhbiBvbiBkb2luZyBhIHN0YWdpbmcgbWVyZ2Ugb2YgdGhhdCBicmFuY2gg
b250byB0aGUgdGlwIAo+IG9mIGZvci1uZXh0LCBzbyBpdCBjYW4gZ2V0IHNvbWUgdGltZSBvbiB0
aGUgdGVzdGVycy7CoCBUaGF0J2xsIGJlIGEgCj4gbGl0dGxlIGRpZmZlcmVudCB0aGFuIGhvdyB3
ZSB1c3VhbGx5IGhhbmRsZSBmb3ItbmV4dCwgYnV0IEkgdGhpbmsgaXQncyAKPiB0aGUgYmVzdCB3
YXkgdG8gZ28gYXMgaXQnbGwgbWFrZSBkcm9wcGluZyB0aGUgcGF0Y2hlcyBlYXN5IGluIGNhc2Ug
dGhlIAo+IHNwZWNzIGRvbid0IGdldCBmcm96ZW4gaW4gdGltZS4KPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
