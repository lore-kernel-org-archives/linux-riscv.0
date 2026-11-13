Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11710606B35E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wHr4xtHT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcZYmCrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HfS3mO4xYXi1sFuNhxFSLar4ajDFSDBXKlWkEdPo8U4=; b=wHr4xtHTeH3mOpH55bl6pxSMCf
	r87frK/O/Fn+YsiiQjJoly2LnixEAtOZXVuWg5l0jf0B40gQu/jMjsoqys8BkP2rLcjMxNUn5ZkB6
	/Ay1D0/dlR6eey4rS2vKkvyyKiR5zwcHIq4DEAc7jKvj2e+LxXvSZgfpa7oL8HMTJifxpymGyg7lD
	nNYVMuYcywJer57gXuMIWWabhsEn1YpPZ+LFV3s2AUKVmO1UpNQnED6dfUoIh/J4QqmjWwMDl0j9l
	BnPtLjeyBOPszbiC+V/LhUjPbd20+LSW0bYW0BYHY+wgrriB4Pts9Uzcvw6JDDWxgKK5ZnlvMkbkk
	gnHSS2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwVW-0000000E40n-2hSM;
	Fri, 13 Nov 2026 19:00:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwVO-0000000E3yz-3bVQ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 19:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DEBC6242C;
	Fri, 13 Nov 2026 19:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB51F1F000C4;
	Fri, 13 Nov 2026 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596410;
	bh=+2lqXoxbcTGbpqi5YkiRhwq1uO/E+YCynWayZ3OE3fk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gcZYmCrb/XakcrNd58e3ddXkD36SjuOB0rbEEBXmvH785qkb9J2/KK9BHMjqhPOdD
	 7sQkDObyATbGUuhcqKqGrEXCUiXVpdyfzVyO9YQLKKG/6aTVob2pgTNO1IuNaj6/dG
	 APTwnMbRMSLtHHT7Y4dXM8O0DsNemxBY2KlH3MRjlmE8oQzAEkzRLGJMWHIIkVtuWZ
	 uYUZPIsbhVuPx6iD5A4ScPvtRe3uQlffpuhazLJ3BF7hTUDanfv7K1hsChy+q6Vdo7
	 dSv4aGisHzzgaPOOwGrgGIt7wf0it+6ZKnZlcXBv5vbzxzUPz4LxcfeF9nN+6E4uS/
	 6x5mu1VMCiK/Q==
Message-ID: <2ff19317-8da9-4014-be04-27fc218b8eea@kernel.org>
Date: Fri, 13 Nov 2026 20:00:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] KVM: don't zap secondary MMU on permission upgrade
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20261112142039.907090-2-clopez@suse.de>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTIvMjYgMTU6MjAsIENhcmxvcyBMw7NwZXogd3JvdGU6Cj4gU3RvcCBLVk0gZnJvbSB6
YXBwaW5nIGl0cyBtYXBwaW5ncyBvbiBwZXJtaXNzaW9uIHVwZ3JhZGVzIG9uIHg4NiBhbmQKPiBz
MzkwLCBhcyB0aGVzZSBrZWVwIHRoZSBQRk5zIHVuY2hhbmdlZCBhbmQgcmV2b2tlIG5vIGFjY2Vz
cy4gS1ZNIGZhdWx0cwo+IGluIHRoZSBuZXcgcGVybWlzc2lvbnMgb24gZGVtYW5kLCBzbyBkcm9w
cGluZyBtYXBwaW5ncyBlYXJseSBnYWlucwo+IG5vdGhpbmcuCj4gCj4gVG8gZG8gc28sIGFkZCBh
biBNTVUgbm90aWZpZXIgZmxhZyB0aGF0IG1hcmtzIGFuCj4gTU1VX05PVElGWV9QUk9URUNUSU9O
X1ZNQSBpbnZhbGlkYXRpb24gYXMgYSBzdHJpY3QgcGVybWlzc2lvbiB1cGdyYWRlLgo+IEZvciB0
aGUgZmxhZyB0byBiZSBhY2N1cmF0ZSwgY2hhbmdlX3Byb3RlY3Rpb24oKSBrZWVwcyB3cml0YWJs
ZSBlbnRyaWVzCj4gd3JpdGFibGUgb24gc3VjaCBjaGFuZ2VzLiBBIGZldyBjYXNlcyB3aGVyZSBp
dCBuZWVkbGVzc2x5IG1ha2VzIG9yCj4gbGVhdmVzIGVudHJpZXMgcmVhZC1vbmx5IGFyZSBmaXhl
ZCBhbG9uZyB0aGUgd2F5Lgo+IAo+IEJhY2tncm91bmQKPiA9PT09PT09PT09Cj4gCj4gY2hhbmdl
X3Byb3RlY3Rpb24oKSBwYWlycyBldmVyeSBwcm90ZWN0aW9uIGNoYW5nZSB3aXRoIGFuCj4gTU1V
X05PVElGWV9QUk9URUNUSU9OX1ZNQSBpbnZhbGlkYXRpb24sIGFuZCBLVk0gemFwcyBpdHMgU1BU
RXMgaW4KPiByZXNwb25zZSwgYXMgaXQgY2Fubm90IHRlbGwgd2hldGhlciBwZXJtaXNzaW9ucyB3
aWRlbmVkIG9yIG5hcnJvd2VkLgo+IFRoaXMgaXMgY29zdGx5LCBlLmcuIGR1cmluZyBhIFFFTVUg
YmFja2dyb3VuZCBzbmFwc2hvdCwgd2hpY2ggdXNlcwo+IHVmZmQtd3AgdG8gd3JpdGUtcHJvdGVj
dCBndWVzdCBSQU0gYW5kIHVucHJvdGVjdHMgZWFjaCBwYWdlIG9uY2UgaXQgaXMKPiBzYXZlZC4g
RXZlcnkgdW5wcm90ZWN0IHRoZW4gbWFrZXMgdGhlIGd1ZXN0IHJlZmF1bHQgbWVtb3J5IGl0IGNv
dWxkCj4gYWxyZWFkeSBhY2Nlc3MuCj4gCj4gU2Vjb25kYXJ5IE1NVXMgdGhhdCBzaGFyZSB0aGUg
Q1BVIHBhZ2UgdGFibGVzIChlLmcuIEFSTSBTTU1VLAo+IElPTU1VL0FUUykgY2FuIGtlZXAgcmVh
ZC1vbmx5IGVudHJpZXMgaW4gdGhlaXIgVExCcyB0aGF0IGEgZmF1bHQgZG9lcwo+IG5vdCBmbHVz
aCwgc28gdGhleSBhcmUgYWxyZWFkeSBub3RpZmllZCBvZiBwZXJtaXNzaW9uIHVwZ3JhZGVzIG9u
IHRoZQo+IENQVSBUTEIgZmx1c2ggcGF0aCBbMV0uIEtWTSBrZWVwcyBpdHMgb3duIHBhZ2UgdGFi
bGVzIGFuZCBmYXVsdHMgaW4KPiBwZXJtaXNzaW9ucyBvbiBkZW1hbmQsIHNvIGl0IG5lZWRzIG5v
IG5vdGlmaWNhdGlvbiwgYXMgU2VhbiBub3RlZCB3aGVuCj4gdGhhdCBzaWduYWxsaW5nIHdhcyBm
aXJzdCBwcm9wb3NlZCBbMl0uCj4gCj4gU2VyaWVzIG92ZXJ2aWV3Cj4gPT09PT09PT09PT09PT09
Cj4gCj4gUGF0Y2hlcyAxLTQgZml4IGNhc2VzIHdoZXJlIGNoYW5nZV9wcm90ZWN0aW9uKCkgbmVl
ZGxlc3NseSBtYWtlcyBvcgo+IGxlYXZlcyBlbnRyaWVzIHJlYWQtb25seSwgc28gdGhhdCB0aGUg
bmV4dCB3cml0ZSB0byB0aGVtIGZhdWx0cy4gVGhleQo+IG9ubHkgYWZmZWN0IHBlcmZvcm1hbmNl
IGFuZCBjYW4gYmUgcGlja2VkIHVwIGluZGVwZW5kZW50bHkuCgpXZSBnZW5lcmFsbHkgZG9uJ3Qg
YWRkIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cyB3aXRob3V0IGNsZWFyIG1vdGl2YXRpb24gYW5k
CmRhdGEgdG8gYmFjayBpdCB1cC4KCk1NIGlzIGN1cnJlbnRseSBidXN5IHdpdGggbW9yZSBpbXBv
cnRhbnQgc3R1ZmYsIHNvIGJlc3QgdG8ga2VlcCB5b3VyIGNoYW5nZXMgdG8KYSBiYXJlIG1pbmlt
dW0uCgotLSAKQ2hlZXJzLAoKRGF2aWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
