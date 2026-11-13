Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E2606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCkWJ8AD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzAFPkN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Oamzbf/Y2wCunpO6qlvezGjBw4QNBeLwe/zLhdEIJus=; b=PCkWJ8AD8DMxHGQTunmG66xIG5
	R5hMC5a9W6Wzm7WTfKg7xLit9IzU/K8W6gLiNA8DZzLaeAtUDaTJH7j8AI4BMcZA66u+Uott8vUtH
	1mJCfpwwdEhy2AtNr3LcJxS3+C5iPxxFAnr8pfpultnQjLu5tEYdSZ0/7eQbHJMTpmGPA9+eVSCl2
	VsYoJUs0CG6cizWjG0XTTD0NyWvBq2gaGZkEYSATMohqnWslDq6OaSu6q8oV1lDFsPLuh87LqbXXN
	7hOn2ydnAKMGllMyGG6mpqZyHrh+Xu8Zhzuh2PnL//mGk+/K7f30h27rOyJUp9YaEXSbaVfgHzDCs
	QpcWr0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwNa-0000000E0UO-3y8U;
	Fri, 13 Nov 2026 18:52:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwNT-0000000E0T3-1mOP
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 18:52:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D443941B11;
	Fri, 13 Nov 2026 18:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B0F1F000C4;
	Fri, 13 Nov 2026 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595918;
	bh=5muRXWS1rFjtRwmxUHcdPdK+9QBRwjjtk/I3ke8eqss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XzAFPkN7MUXlKgAkmPOQRLSCSAt2PwqC0Kcv+HnyUqadeayf26mt5dOB87zAhmnsL
	 rCM/LOn1v4X8mo04YABi6kewxSg+rOZSdDxrb5UOebeOVDzcvlJzot+uNTf8h7Ixtr
	 dhn82CAc62qemGvmxq0ChSKEdR1156L63Gfde8CamKm69f2i7gWALhNCtLos241caU
	 SMUSWuXj2DhPLnm+iDL0xVjmBG9PQVccC5ep41dBb7XuYBjXOcqMPAR+VbhxURTeMW
	 Ivqjv+vG9iPHvq9/l7fzKDH3I7PS44kkVRvz88GIIpeGHqch7+hqspqTFss6NGgs+4
	 90lFUZKzvLglA==
Message-ID: <3314e44d-dbfe-45da-a1b0-8337784a5e86@kernel.org>
Date: Fri, 13 Nov 2026 19:51:49 +0100
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112142039.907090-7-clopez@suse.de>
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

T24gMTEvMTIvMjYgMTU6MjAsIENhcmxvcyBMw7NwZXogd3JvdGU6Cj4gQWRkIGEgY2hhbmdlX3By
b3RlY3Rpb24oKSBmbGFnIGZvciBjaGFuZ2VzIHRoYXQgb25seSBhZGQgcGVybWlzc2lvbnMsCj4g
c28gdGhhdCBNTVUgbm90aWZpZXIgdXNlcnMgY2FuIGtlZXAgdGhlaXIgbWFwcGluZ3MgYW5kIGZh
dWx0IGluIHRoZSBuZXcKPiBwZXJtaXNzaW9ucyBsYXRlci4gbXByb3RlY3QoKSBzZXRzIGl0IHdo
ZW4gdGhlIG5ldyBWTUEgZmxhZ3Mgb25seSBhZGQKPiByZWFkLCB3cml0ZSBvciBleGVjdXRlIHBl
cm1pc3Npb25zLCBvciBWTV9BQ0NPVU5ULCB3aGljaCBkb2VzIG5vdCBhZmZlY3QKPiB0aGUgcGFn
ZSB0YWJsZXMuIEFueSBvdGhlciBjaGFuZ2UsIHN1Y2ggYXMgYSBkaWZmZXJlbnQgcHJvdGVjdGlv
biBrZXksCj4gaXMgbm90IGFuIHVwZ3JhZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzD
s3BleiA8Y2xvcGV6QHN1c2UuZGU+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvbW0uaCB8ICAyICsr
Cj4gIG1tL21wcm90ZWN0LmMgICAgICB8IDEzICsrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0u
aCBiL2luY2x1ZGUvbGludXgvbW0uaAo+IGluZGV4IDZhZjNiNzAwOGYxYS4uMDAxODI5YTYxNDA1
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgv
bW0uaAo+IEBAIC0zNTg1LDYgKzM1ODUsOCBAQCBpbnQgZ2V0X2NtZGxpbmUoc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrLCBjaGFyICpidWZmZXIsIGludCBidWZsZW4pOwo+ICAjZGVmaW5lICBNTV9D
UF9VRkZEX1JXUF9SRVNPTFZFICAgICAgICAgICAgKDFVTCA8PCA1KSAvKiByZXNvbHZlIHJ3cCAq
Lwo+ICAjZGVmaW5lICBNTV9DUF9VRkZEX1JXUF9BTEwgICAgICAgICAgICAgICAgKE1NX0NQX1VG
RkRfUldQIHwgXAo+ICAJCQkJCSAgICBNTV9DUF9VRkZEX1JXUF9SRVNPTFZFKQo+ICsvKiBXaGV0
aGVyIHRoaXMgY2hhbmdlIG9ubHkgdXBncmFkZXMvYWRkcyBwZXJtaXNzaW9ucyAqLwo+ICsjZGVm
aW5lICBNTV9DUF9QRVJNX1VQR1JBREUgICAgICAgICAgICAgICAgKDFVTCA8PCA2KQo+ICAKPiAg
Ym9vbCBjYW5fY2hhbmdlX3B0ZV93cml0YWJsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwg
dW5zaWduZWQgbG9uZyBhZGRyLAo+ICAJCQkgICAgIHB0ZV90IHB0ZSk7Cj4gZGlmZiAtLWdpdCBh
L21tL21wcm90ZWN0LmMgYi9tbS9tcHJvdGVjdC5jCj4gaW5kZXggODRiY2ZlMDI4MWQzLi44YzBm
Y2QxMGY1YTMgMTAwNjQ0Cj4gLS0tIGEvbW0vbXByb3RlY3QuYwo+ICsrKyBiL21tL21wcm90ZWN0
LmMKPiBAQCAtNzY3LDYgKzc2NywxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1tX3dhbGtfb3Bz
IHByb3Rfbm9uZV93YWxrX29wcyA9IHsKPiAgCS53YWxrX2xvY2sJCT0gUEdXQUxLX1dSTE9DSywK
PiAgfTsKPiAgCj4gK3N0YXRpYyBib29sIHZtYV9mbGFnc19pc19wZXJtX3VwZ3JhZGUodm1hX2Zs
YWdzX3Qgb2xkX3ZtYV9mbGFncywKPiArCQkJCSAgICAgIHZtYV9mbGFnc190IG5ld192bWFfZmxh
Z3MpCgpUd28gdGFiIGluZGVudC4KCj4gK3sKPiArCXZtX2ZsYWdzX3Qgb2xkID0gdm1hX2ZsYWdz
X3RvX2xlZ2FjeShvbGRfdm1hX2ZsYWdzKTsKPiArCXZtX2ZsYWdzX3QgbmV3ID0gdm1hX2ZsYWdz
X3RvX2xlZ2FjeShuZXdfdm1hX2ZsYWdzKTsKPiArCS8qIFZNX0FDQ09VTlQgZG9lcyBub3QgYWZm
ZWN0IHBhZ2UgdGFibGVzICovCj4gKwl2bV9mbGFnc190IG1hc2sgPSBWTV9SRUFEIHwgVk1fV1JJ
VEUgfCBWTV9FWEVDIHwgVk1fQUNDT1VOVDsKCldoeSBpcyBWTV9BQ0NPVU5UIGEgcGVybWlzc2lv
biB1cGdyYWRlPyBBdCBiZXN0IGl0J3MgIm5vIGNoYW5nZSIuCgpXaGF0IGFtIEkgbWlzc2luZz8K
CkFsc28sIHdoYXQgeW91IHJlYWxseSBjYXJlIGFib3V0IGlzICJubyBwZXJtaXNzaW9uIGRvd25n
cmFkZSIsIGFuZCAibm8KcGVybWlzc2lvbiB1cGdyYWRlIiBpcyBub3QgdGhlIGludmVyc2Ugb2Yg
dGhhdCA7KQoKCi0tIApDaGVlcnMsCgpEYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
