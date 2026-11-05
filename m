Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5658A606A339
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F8bo0vtQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCBJ4Wja
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1KJ5m+G0Dxd9weJXxIR+fuZ22OFFrR5ztz1ZQY2c/hA=; b=F8bo0vtQMJwIO9fUA5hhPRJmAc
	9lKxygDNvLrsYS9QJJVWaW2QLHYK0o2MOe06/uSXFmiOvhVtaXRwvsLqMhI+F8sJylKk3KbYoEPg4
	FAh8+9I/XU3UQUfh29dtRVnggjB3IA4vqlJJn3AhuUEo5XsLytlfoudFh4M7rTGbSx7CpnOBnDOWn
	BuiQ7lSkFh9bx68IKfgbhIZUK5p/pnmnCgM/6VqKKbOqSg8prh6PATe26JFzKSb2MH+9wwp0XZhRR
	EOpZfg/2unxKs64InpnrPxV2jK4vPhnmIzlYBUCzGUBwAqU8iIYFKKo2hNrAgOVMtI46OrYc+9KGN
	yBTQVqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP100-00000009nxr-1y4G;
	Thu, 05 Nov 2026 17:11:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0vV-00000009lR7-1pNr
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 17:07:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E2A860145;
	Thu,  5 Nov 2026 17:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36961F000C1;
	Thu,  5 Nov 2026 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793898420;
	bh=+BKEtapVg9ZvVExUrrwjchlBg9HiJLaq+cPGzmG6490=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nCBJ4WjaV9h7VqVSkn+QKi1XYE0fRlYAYNMppPShoj71GS4tfxkkkZwdzDtxKAKKl
	 r0jtdIYZA2tq51uKkJAA13EqrgdCxvdUluOASXfXnfu1CRG2qZr5IuDwogdQzQNzQA
	 y6zVuI1EE+wXeR4KVNis97tkbm05Kqpcp0c0e0xgJKQp9WypE2FyKaaISltCHvtAMI
	 DJvnfFo2MpFIgEuBmbVBX/x0EEgTAANTpwoQC+6dN5AQS7FlQ6udIY0JtXubxV//jH
	 E13rtGeBQqTBb5vbueganPKWeP54WeJDqCuNi19/YwwAadmoojigQ0slNYvhOOnCwB
	 B/Y4ZkDZEcZyw==
Message-ID: <60c4f0a0-e3c9-42dc-b2e0-0860ab6e30f0@kernel.org>
Date: Thu, 5 Nov 2026 18:06:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] mm/mprotect: keep writable entries writable on
 permission upgrades
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
 <20261105165004.2663799-9-clopez@suse.de>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261105165004.2663799-9-clopez@suse.de>
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvNS8yNiAxNzo1MCwgQ2FybG9zIEzDs3BleiB3cm90ZToKPiBjaGFuZ2VfcHJvdGVjdGlv
bigpIGFwcGxpZXMgdm1hLT52bV9wYWdlX3Byb3QsIHdoaWNoIGxhY2tzIHRoZSB3cml0ZSBiaXQK
PiBmb3IgQ29XIGFuZCB3cml0ZS1ub3RpZmllZCBtYXBwaW5ncywgc28gaXQgd3JpdGUtcHJvdGVj
dHMgZXZlcnkgZW50cnkKPiBpbiB0aGVtLiBXaGVuIGFuIGVudHJ5IHdvdWxkIHNpbXBseSBiZSBt
YWRlIHdyaXRhYmxlIG9uIGZhdWx0IHdpdGhvdXQKPiBmdXJ0aGVyIGNoZWNrcyAoZS5nLiBkaXJ0
eSBQVEVzIGluIHNoYXJlZCBtYXBwaW5ncywgZXhjbHVzaXZlIGFub255bW91cwo+IHBhZ2VzKSwg
TU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSBtYWtlcyB0aGUgZW50cnkgd3JpdGFibGUgYWdhaW4g
dG8KPiBhdm9pZCB0aGUgZnV0dXJlIGZhdWx0Lgo+IAo+IEhvd2V2ZXIsIHdyaXRhYmxlIGVudHJp
ZXMgaW4gc2hhcmVkIG1hcHBpbmdzIHRoYXQgYXJlIG5vdCBkaXJ0eSBzdGlsbAo+IGJlY29tZSBy
ZWFkLW9ubHkuIEZvciBleGFtcGxlLCBhIHVmZmQtd3AgdW5wcm90ZWN0IG1ha2VzIGNsZWFuIHNo
bWVtCj4gUFRFcyByZWFkLW9ubHkgZXZlbiBpZiB0aGV5IHdlcmUgbmV2ZXIgd3JpdGUtcHJvdGVj
dGVkLCBlLmcuIHdoZW4gdGhleQo+IHdlcmUgbWFwcGVkIGJ5IGEgcmVhZCBmYXVsdCBiZWZvcmUg
dWZmZC13cCB3YXMgcmVnaXN0ZXJlZC4gVGhlIG5leHQKPiB3cml0ZSB0byBlYWNoIG9mIHRoZW0g
Y2F1c2VzIGEgZmF1bHQgdGhhdCBvbmx5IHJlc3RvcmVzIHRoZSB3cml0ZSBiaXQuCj4gCj4gTm93
IHRoYXQgTU1fQ1BfUEVSTV9VUEdSQURFIGluZGljYXRlcyB3aGV0aGVyIG1wcm90ZWN0KCkgb25s
eSBhZGRzCj4gcGVybWlzc2lvbnMsIGNoYW5nZV9wcm90ZWN0aW9uKCkgY2FuIHRlbGwsIHRvZ2V0
aGVyIHdpdGggdGhlCj4gdXNlcmZhdWx0ZmQgdW5wcm90ZWN0IGZsYWdzLCB3aGVuIGEgY2hhbmdl
IHJldm9rZXMgbm8gYWNjZXNzLiBLZWVwCj4gd3JpdGFibGUgZW50cmllcyB3cml0YWJsZSBpbiB0
aGVzZSBjYXNlcywgYXQgdGhlIFBURSwgUE1EIGFuZCBQVUQKPiBsZXZlbHMuIFRoaXMgaXMgY29u
c2lzdGVudCB3aXRoIHRoZSB3cml0ZSBmYXVsdCBoYW5kbGVyLCBhcyBhbiBlbnRyeQo+IHRoYXQg
aXMgYWxyZWFkeSB3cml0YWJsZSBuZWVkcyBubyB3cml0ZSBmYXVsdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDYXJsb3MgTMOzcGV6IDxjbG9wZXpAc3VzZS5kZT4KPiAtLS0KPiAgbW0vaHVnZV9tZW1v
cnkuYyB8IDcgKysrKysrKwo+ICBtbS9pbnRlcm5hbC5oICAgIHwgNyArKysrKysrCj4gIG1tL21w
cm90ZWN0LmMgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL21tL2h1Z2VfbWVtb3J5LmMgYi9tbS9odWdlX21lbW9yeS5jCj4g
aW5kZXggNTA2ZTFlNjFjMGZkLi42ZTIzZDBlNGFlNjYgMTAwNjQ0Cj4gLS0tIGEvbW0vaHVnZV9t
ZW1vcnkuYwo+ICsrKyBiL21tL2h1Z2VfbWVtb3J5LmMKPiBAQCAtMjgwOSw2ICsyODA5LDEwIEBA
IGludCBjaGFuZ2VfaHVnZV9wbWQoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsCj4gIAlpZiAodXNlcmZhdWx0ZmRfcndwKHZtYSkgJiYgcG1kX3VmZmQo
ZW50cnkpKQo+ICAJCWVudHJ5ID0gcG1kX21vZGlmeShlbnRyeSwgUEFHRV9OT05FKTsKPiAgCj4g
KwkvKiBTZWUgY2hhbmdlX3ByZXNlbnRfcHRlcygpLiAqLwo+ICsJaWYgKG1tX2NwX2lzX3Blcm1f
dXBncmFkZShjcF9mbGFncykgJiYgcG1kX3dyaXRlKG9sZHBtZCkpCj4gKwkJZW50cnkgPSBwbWRf
bWt3cml0ZShlbnRyeSwgdm1hKTsKPiArCj4gIAkvKiBTZWUgY2hhbmdlX3B0ZV9yYW5nZSgpLiAq
Lwo+ICAJaWYgKChjcF9mbGFncyAmIE1NX0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUpICYmICFwbWRf
d3JpdGUoZW50cnkpICYmCj4gIAkgICAgY2FuX2NoYW5nZV9wbWRfd3JpdGFibGUodm1hLCBhZGRy
LCBlbnRyeSkpCj4gQEAgLTI4ODUsNiArMjg4OSw5IEBAIGludCBjaGFuZ2VfaHVnZV9wdWQoc3Ry
dWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gIAkgKi8K
PiAgCW9sZHB1ZCA9IHB1ZHBfaW52YWxpZGF0ZSh2bWEsIGFkZHIsIHB1ZHApOwo+ICAJZW50cnkg
PSBwdWRfbW9kaWZ5KG9sZHB1ZCwgbmV3cHJvdCk7Cj4gKwkvKiBTZWUgY2hhbmdlX3ByZXNlbnRf
cHRlcygpLiAqLwo+ICsJaWYgKG1tX2NwX2lzX3Blcm1fdXBncmFkZShjcF9mbGFncykgJiYgcHVk
X3dyaXRlKG9sZHB1ZCkpCj4gKwkJZW50cnkgPSBwdWRfbWt3cml0ZShlbnRyeSk7CgpUaGF0IGxv
b2tzIGNvbXBsZXRlbHkgaGFja2VkIG9uLiBXZSBkbyBoYXZlIGNhbl9jaGFuZ2VfcHVkX3dyaXRh
YmxlKCkgYmVsb3cgdG8KbWFrZSBzdWNoIGRlY2lzaW9ucy4KCldoYWF0ZXZlciB5b3UgcHJvcG9z
ZSBoZXJlIGlzIGVpdGhlciB3cm9uZyBvciB3YXkgdG9vIHNoYWt5LCBzb3JyeS4KCi0tIApDaGVl
cnMsCgpEYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
