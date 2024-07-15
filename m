Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F7AC3DA4B
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 19:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZER9EE7+R837/C0y7o/E0uQUHCtKI0kWzjxdiHN+Om0=; b=aiP0tTh3cJv7Xi
	jyWx6qz6rf919cWC2/isOQMz72MA2Fgkq7ThQBU2ldm7yr1nveiTLlsWe5l9kB7K1zCA6bS2Zn7/N
	0O7vjIarIr8RzZNI+n7WzIof2OmWia5xkAAUgRXqXbkPOQtaAzZcqm/nEd3AsNLsrHRKQC0c6wu1F
	KeKytM0NcryfaD6rHrGLjMZJz5SoOUHhcw5D+POM1gnPgoENkxHwdxJe1goPohclPf6HxX8WnO+lp
	Xh9LiHvU/W+jV4SfniBcqINU35FbTRNPoORIb+VQ84TqyJ5HN/ecVFNV4esRzELMSZzRzF1T1RkA5
	523hEG/MXtSx40iQ7Z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTRPI-000000089y2-1ZzV;
	Mon, 15 Jul 2024 19:30:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTRPF-000000089ue-0hUa
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 19:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9Zo9CyMJSxsrZ+IkEYrIUXBuAiAj8cTbqlht6M8S8U=;
	b=Pfe/nlZ8CU5LSol9FpBR0hTAAj1JPNxHZaIBYb/OTbs17KH/QxViWozafcGCJwF0JG3X/L
	bPihaF8bFPysnCKL9I+4k2DpaWyhhSQL84d5zy5lJlrTxsrFhRKJFXDhzn5lb218s7N8hZ
	wnSLRa/RC79usId7fBQikXF2x+LdyUQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-ai8VoDUqNFqiyVr_TYnlpA-1; Mon,
 15 Jul 2024 15:30:35 -0400
X-MC-Unique: ai8VoDUqNFqiyVr_TYnlpA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 257771955D4D;
	Mon, 15 Jul 2024 19:30:32 +0000 (UTC)
Received: from [10.22.9.29] (unknown [10.22.9.29])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88CCE1955F40;
	Mon, 15 Jul 2024 19:30:27 +0000 (UTC)
Message-ID: <a096151c-c349-455f-8939-3b739d73f016@redhat.com>
Date: Mon, 15 Jul 2024 15:30:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha
 extension
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Guo Ren <guoren@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com>
 <CAJF2gTSG7HzV7mgZpkWLbSBNn2dRv_NaSmCimd+kRdU=EZrmmg@mail.gmail.com>
 <CAHVXubizLq=qZgVQ2vBFe5zVuLRP0DGw=UN4U_Wkx2P2xsP3Mw@mail.gmail.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAHVXubizLq=qZgVQ2vBFe5zVuLRP0DGw=UN4U_Wkx2P2xsP3Mw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_123041_300099_22CE5C3D 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8xNS8yNCAwMzoyNywgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIEd1bywKPgo+IE9u
IFN1biwgSnVsIDcsIDIwMjQgYXQgNDoyMOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
PiB3cm90ZToKPj4gT24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgOToxNOKAr1BNIEFsZXhhbmRyZSBH
aGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+PiBJbiBvcmRlciB0byBwcm9k
dWNlIGEgZ2VuZXJpYyBrZXJuZWwsIGEgdXNlciBjYW4gc2VsZWN0Cj4+PiBDT05GSUdfQ09NQk9f
U1BJTkxPQ0tTIHdoaWNoIHdpbGwgZmFsbGJhY2sgYXQgcnVudGltZSB0byB0aGUgdGlja2V0Cj4+
PiBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBpZiBaYWJoYSBpcyBub3QgcHJlc2VudC4KPj4+Cj4+
PiBOb3RlIHRoYXQgd2UgY2FuJ3QgdXNlIGFsdGVybmF0aXZlcyBoZXJlIGJlY2F1c2UgdGhlIGRp
c2NvdmVyeSBvZgo+Pj4gZXh0ZW5zaW9ucyBpcyBkb25lIHRvbyBsYXRlIGFuZCB3ZSBuZWVkIHRv
IHN0YXJ0IHdpdGggdGhlIHFzcGlubG9jawo+PiBUaGF0J3Mgbm90IHRydWU7IHdlIHRyZWF0IHNw
aW5sb2NrIGFzIHFzcGlubG9jayBhdCBmaXJzdC4KPiBUaGF0J3Mgd2hhdCBJIHNhaWQ6IHdlIGhh
dmUgdG8gdXNlIHRoZSBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gYXQKPiBmaXJzdCAqYmVjYXVz
ZSogd2UgY2FuJ3QgZGlzY292ZXIgdGhlIGV4dGVuc2lvbnMgc29vbiBlbm91Z2ggdG8gdXNlCj4g
dGhlIHJpZ2h0IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGJlZm9yZSB0aGUga2VybmVsIHVzZXMg
YSBzcGlubG9jay4KPiBBbmQgc2luY2UgdGhlIHNwaW5sb2NrcyBhcmUgdXNlZCAqYmVmb3JlKiB0
aGUgZGlzY292ZXJ5IG9mIHRoZQo+IGV4dGVuc2lvbnMsIHdlIGNhbm5vdCB1c2UgdGhlIGN1cnJl
bnQgYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIG9yIHdlJ2QKPiBuZWVkIHRvIGV4dGVuZCBpdCB0byBh
ZGQgYW4gImluaXRpYWwiIHZhbHVlIHdoaWNoIGRvZXMgbm90IGRlcGVuZCBvbgo+IHRoZSBhdmFp
bGFibGUgZXh0ZW5zaW9ucy4KCldpdGggcXNwaW5sb2NrLCB0aGUgbG9jayByZW1haW5zIHplcm8g
YWZ0ZXIgYSBsb2NrL3VubG9jayBzZXF1ZW5jZS4gVGhhdCAKaXMgbm90IHRoZSBjYXNlIHdpdGgg
dGlja2V0IGxvY2suIEFzc3VtaW5nIHRoYXQgYWxsIHRoZSBkaXNjb3Zlcnkgd2lsbCAKYmUgZG9u
ZSBiZWZvcmUgU01QIGJvb3QsIHRoZSBxc3BpbmxvY2sgc2xvd3BhdGggd29uJ3QgYmUgYWN0aXZh
dGVkIGFuZCAKc28gd2UgZG9uJ3QgbmVlZCB0aGUgcHJlc2VuY2Ugb2YgYW55IGV4dGVuc2lvbi4g
SSBiZWxpZXZlIHRoYXQgaXMgdGhlIAptYWluIHJlYXNvbiB3aHkgcXNwaW5sb2NrIGlzIHVzZWQg
YXMgdGhlIGluaXRpYWwgZGVmYXVsdCBhbmQgbm90IHRpY2tldCAKbG9jay4KCkNoZWVycywKTG9u
Z21hbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
