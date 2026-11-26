Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3058606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/HIOIEB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XM/v0L+X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RCYudPNIbWSzLcZWJeCEQFtolR2r2KsuSkW3ej7KQeQ=; b=v/HIOIEBgqgrUwZBClo8h9l/mn
	DuRHE/aAXfkI3gUbDsx9AovBtkA73nC31YbIdxQ7fXJsM2jTq+QMiQQAovSv7nrdLq2J3V6zdD2XU
	17PZnec4Y6eOxmwp+ggTykz23sYRHvR1CAaSrsbxYU2/5GQC0LzEAD7tqO2PSZLCG3GaNivdMgCYd
	Dl1x+2j/sHeq6bypZTap15mBMOpJxONEAsXswL9sy/+XnFxz6Euvd+3Z5vBZ6X77tPXLmVxx8n4So
	paKM2TWLNGa3p6yN+9xfWgKUcgZKTPJog7qepUIOj0gxV+vurgyuV8slOuEftCAQ7PAywFUs5QYww
	Q3y8mjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaDC-0000000DU8s-0rfe;
	Thu, 26 Nov 2026 14:12:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaD9-0000000DU8R-20mf
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 14:12:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9311D62DC7;
	Thu, 26 Nov 2026 14:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F20F1F000C4;
	Thu, 26 Nov 2026 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702350;
	bh=i2cNc8HSARC2wOejD22JDbD0mwhfJQiUlrWNB6pO/o4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XM/v0L+X45woIBgANOwNtHPPIUmqXvHJxQ6mG9ukfV9OpVWj+xy+U5/lLU6twpiv8
	 I9moaYBWThXPieB8iVDdrgZRck2TaptOWDWaINkRf87Eq23OBBP4BTZHZiTLQF+6Dl
	 3VoSl6+svsMEeJ2t/4eq+g6pv6fIyAc88iW1KHSuMke+N+vXD7PgYDbZOpIKcCeCBD
	 LeBKC5ixNrN57C6ukG4KDBtar3YC/74xgGg7ZUoS6201lCrDlW5P4oZaRkM5OvGFkt
	 8tKz+wqmdZnUid+GmJ08v/IpaXMQLzrmptGj3dz97OX8yyKN8C9vQpgSwH1Cha7eo+
	 bzApLFZU5wIZA==
Message-ID: <4b60cf7b-bf8f-42dc-979e-71fe6d00c5d1@kernel.org>
Date: Thu, 26 Nov 2026 15:12:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] mm/mprotect: add MM_CP_PERM_UPGRADE
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-7-clopez@suse.de>
 <3314e44d-dbfe-45da-a1b0-8337784a5e86@kernel.org>
 <5412ba3a-ff32-48e8-b5a1-d46b97cf5f8f@suse.de>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <5412ba3a-ff32-48e8-b5a1-d46b97cf5f8f@suse.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTUvMjYgMjM6MDMsIENhcmxvcyBMw7NwZXogd3JvdGU6Cj4gT24gMTEvMTMvMjYgNzo1
MSBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEvbW0v
bXByb3RlY3QuYyBiL21tL21wcm90ZWN0LmMKPj4+IGluZGV4IDg0YmNmZTAyODFkMy4uOGMwZmNk
MTBmNWEzIDEwMDY0NAo+Pj4gLS0tIGEvbW0vbXByb3RlY3QuYwo+Pj4gKysrIGIvbW0vbXByb3Rl
Y3QuYwo+Pj4gQEAgLTc2Nyw2ICs3NjcsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtbV93YWxr
X29wcyBwcm90X25vbmVfd2Fsa19vcHMgPSB7Cj4+PiAgCS53YWxrX2xvY2sJCT0gUEdXQUxLX1dS
TE9DSywKPj4+ICB9Owo+Pj4gIAo+Pj4gK3N0YXRpYyBib29sIHZtYV9mbGFnc19pc19wZXJtX3Vw
Z3JhZGUodm1hX2ZsYWdzX3Qgb2xkX3ZtYV9mbGFncywKPj4+ICsJCQkJICAgICAgdm1hX2ZsYWdz
X3QgbmV3X3ZtYV9mbGFncykKPj4KPj4gVHdvIHRhYiBpbmRlbnQuCj4gCj4gV2lsbCBmaXgKPiAK
Pj4+ICt7Cj4+PiArCXZtX2ZsYWdzX3Qgb2xkID0gdm1hX2ZsYWdzX3RvX2xlZ2FjeShvbGRfdm1h
X2ZsYWdzKTsKPj4+ICsJdm1fZmxhZ3NfdCBuZXcgPSB2bWFfZmxhZ3NfdG9fbGVnYWN5KG5ld192
bWFfZmxhZ3MpOwo+Pj4gKwkvKiBWTV9BQ0NPVU5UIGRvZXMgbm90IGFmZmVjdCBwYWdlIHRhYmxl
cyAqLwo+Pj4gKwl2bV9mbGFnc190IG1hc2sgPSBWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVD
IHwgVk1fQUNDT1VOVDsKPj4KPj4gV2h5IGlzIFZNX0FDQ09VTlQgYSBwZXJtaXNzaW9uIHVwZ3Jh
ZGU/IEF0IGJlc3QgaXQncyAibm8gY2hhbmdlIi4KPj4KPj4gV2hhdCBhbSBJIG1pc3Npbmc/Cj4g
Cj4gSXQgaXNuJ3QsIHRoaXMganVzdCBtZWFucyB0byBjb3ZlciB0aGUgY2FzZSB3aGVyZSBtcHJv
dGVjdChQUk9UX1JFQUQgfAo+IFBST1RfV1JJVEUpIG9uIGEgcHJpdmF0ZSByZWFkLW9ubHkgVk1B
IHNldHMgVk1fQUNDT1VOVCBhcyB3ZWxsLiBXaXRob3V0Cj4gdGhpcywgdGhlIGNoYW5nZSBpcyBu
b3QgZGV0ZWN0ZWQgYXMgYW4gdXBncmFkZS4KCldoeSBpcyBzZXR0aW5nIFZNX0FDQ09VTlQgYW5k
IHVwZ3JhZGUgZm9yIHBlcm1pc3Npb25zPyEKCkknbSBzb3JyeSBidXQgdGhpcyBpcyBhbGwgd2F5
IHRvIHNoYWt5IGFuZCBjb25mdXNpbmcuCgpUYWtlIGEgc3RlcCBiYWNrIGFuZCB0aGluayBob3cg
dG8gZG8gYWxsIG9mIHRoaXMgY2xlYW5seSB3aXRob3V0IG1ha2luZyB0aGlzCmNvZGUgaGVyZSB1
bm1haW50YWluYWJsZSA6KQoKLS0gCkNoZWVycywKCkRhdmlkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
