Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC489606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Jgya773;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iR93k3TD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Catf8iNQljP4EUX4pGx+qyhbbnecmT1lV1BdzpisFJ0=; b=4Jgya773v2sumgbwNFSzyiQczK
	38srg4hN/kuQu2HuQ1apt+ffyp5zO9cpJ/9OTcaDsw1OrCSCO4mj2KrvCHv8G34ZUyRl+1QkHI3Hc
	v016RLMgbCA53xHRLgyhJKISgLNd7NC9BXXXxI1c2FkcBm9ylKtbG2bV0SpTLHppWoTzlhRrRrqSr
	HpjWXzhMgyit487FIcS//6/ptZwees8d1W1M9djlke/B+C3PJJC2LtpsCgsavOcTn4fBlCuSz4DNu
	N3J92+LuIwBF/eZsEouBwspXcSV0nKN3JYYNU1v9NYldr1iGrbktpUK85FgKxeSogRucQjYY7W+8k
	x+vIRUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfal-0000000Arlw-2jkR;
	Fri, 30 Oct 2026 05:55:55 +0000
Received: from out-248.mta0.migadu.com ([2001:41d0:1004:224b::f8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfah-0000000Arla-30le
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 05:55:53 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ikqckRwTpoZ81VkeQhZ64AEwYoP4+cSdv8SlyoqDO6o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793339747; v=1; x=1793944547;
 b=iR93k3TDG1vqSTb0gWskdRipt0fLGKoB3AUTCNBmHMsgoySz/xsWVe/noEHNj3kLRF8TZdGw
 GZMe5Pr+OVAXlDA6WU1T1xo5KQQzrICnJRop7bWCy37roh73JKH+DUQuI7Xyd/SseFD8sbv16or
 KUwsnJV2+lP7pGqTH78AYrXA=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c51cfdd6c67c2387;
	Fri, 30 Oct 2026 05:55:21 +0000
X-Mizu-Trace-ID: c51cfdd6c67c2387
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 05:55:21 +0000
From: "Jackie Liu" <liu.yun@linux.dev>
Message-ID: <67833df2daf24cc413c212c14306b9230dde996f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2 0/3] kfence: fix pool allocation failure handling
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: glider@google.com, dvyukov@google.com, elver@google.com, pjw@kernel.org,
 alex@ghiti.fr, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, muchun.song@linux.dev
In-Reply-To: <20261029182645.d6e7b119a562c973d19cda63@linux-foundation.org>
References: <cover.1793242457.git.liuyun01@kylinos.cn>
 <20261029182645.d6e7b119a562c973d19cda63@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_225551_991984_88076595 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MjAyNuW5tDEw5pyIMzDml6UgMDk6MjYsICJBbmRyZXcgTW9ydG9uIiA8YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZyBtYWlsdG86YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz90bz0lMjJBbmRyZXcl
MjBNb3J0b24lMjIlMjAlM0Nha3BtJTQwbGludXgtZm91bmRhdGlvbi5vcmclM0UgPiDlhpnliLA6
CgoKPiAKPiBPbiBUaHUsIDI5IE9jdCAyMDI2IDEwOjU3OjQwICswODAwIEphY2tpZSBMaXUgPGxp
dS55dW5AbGludXguZGV2PiB3cm90ZToKPiAKPiA+IAo+ID4gRml4IHRoZSBjbGVhbnVwIGFkZHJl
c3MgYW5kIHBhZ2UgcmV1c2Ugd2luZG93IGluIGZhaWxlZCBsYXRlIEtGRU5DRQo+ID4gIGluaXRp
YWxpemF0aW9uLiBBbHNvIGxldCBSSVNDLVYgYm9vdCBpZiB0aGUgZWFybHkgcG9vbCByZXNlcnZh
dGlvbiBmYWlscy4KPiA+ICAKPiA+ICBQYXRjaCAyIGRlcGVuZHMgb24gcGF0Y2ggMS4gUGF0Y2gg
MyBjYW4gYmUgYXBwbGllZCBpbmRlcGVuZGVudGx5Lgo+ID4gCj4gVGhhbmtzLgo+IAo+IFdlJ3Jl
IGFsbCBob3JyaWRseSBidXN5IHdpdGggYnVnZml4ZXMgYXQgcHJlc2VudCBhbmQgdGhlIGZpcnN0
IHRoaW5nCj4gcmVjaXBpZW50cyB0aGluayB3aGVuIHByZXNlbnRlZCB3aXRoIHlldCBhbm90aGVy
IGlzICJ3aHkgc2hvdWxkIEkgbG9vawo+IGF0IHRoaXMiLgo+IAo+IFNvIGl0IHJlYWxseSBoZWxw
cyB0byBzdGFydCBvdXQgd2l0aCBhIHN1Y2NpbmN0IGFuZCBwdW5jaHkgc2VudGVuY2UKPiB3aGlj
aCBleHBsYWlucyB0aGF0IHRoaW5nLgo+IAo+IExMTSBzdWdnZXN0ZWQgdG8gbWUKPiAKPiA6IEtG
RU5DRSBpbml0aWFsaXphdGlvbiBmYWlsdXJlcyBjYW4gY2F1c2Uga2VybmVsIGNyYXNoZXMgb3Ig
bWVtb3J5Cj4gOiBjb3JydXB0aW9uLCB3aGlsZSBhIFJJU0MtViBmYWlsdXJlIGNhbiBwcmV2ZW50
IHRoZSBzeXN0ZW0gZnJvbSBib290aW5nLgo+IDogVGhlc2UgZml4ZXMgbWFrZSB0aGUgZmFpbHVy
ZSBwYXRocyBzYWZlIGFuZCBhbGxvdyBzeXN0ZW1zIHRvIGNvbnRpbnVlCj4gOiBydW5uaW5nIHdp
dGggS0ZFTkNFIGRpc2FibGVkLgo+IAo+IEhvdyBkb2VzIHRoYXQgc291bmQ/CgpIaSBBbmRyZXcs
CgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiBUaGF0IHdvcmRpbmcgc291bmRzIGdvb2QgdG8g
bWUuIEl0IG1ha2VzCnRoZSBpbXBhY3Qgb2YgdGhlc2UgYnVncyBtdWNoIGNsZWFyZXIsIGFuZCBJ
J2xsIGtlZXAgdGhpcyBpbiBtaW5kCndoZW4gd3JpdGluZyBmdXR1cmUgcGF0Y2ggZGVzY3JpcHRp
b25zLgoKQWxzbywgU2FzaGlrbyBoYXMgcmVwb3J0ZWQgYW4gaXNzdWUgd2l0aCBwYXRjaCAzLzMu
CgpDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IG9ubHkgdGhlIGZpcnN0IHR3byBwYXRjaGVzIGFuZCBk
cm9wIHBhdGNoIDMvMwpmb3Igbm93PyBJJ2xsIGFkZHJlc3MgdGhlIHJlcG9ydGVkIGlzc3VlIGFu
ZCByZXNlbmQgdGhlIHRoaXJkIHBhdGNoCnNlcGFyYXRlbHkgb25jZSBpdCdzIGZpeGVkLgoKVGhh
bmtzLApKYWNraWUKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
