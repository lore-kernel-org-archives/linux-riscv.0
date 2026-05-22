Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A271CD5BB4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnD89J321AWo5R90r7ob3CnC5wQ8W8P5xFH4qgO6jpw=; b=Es52b2PxSto79w
	w9SQqmINhdPmGp0X78ZCdFKcnuO2Hkrq2IS2Ca3kkbnHL5BkZbP9Kn2Q1/sr5GFWBxqy+FzHfk3c2
	DjXbEDemvWQUAbkQra8i+3Zw27I2FBgo5P9OvKuyx/S1hrK2bG8sMpvvsNKlLs1aZp1F9PQq5Wmxb
	7/22a24dmvPsg8WlvjOyk7coim3YPmhxvowWqPf/ibPvnVZLsfzcgV7TckwBd+jUayrrFv/F+ovOR
	QH1unMKGv+CNUVtjCC2Wh5NOBCjOTlNo4YrUV+7mFRAtMGzjtsQ3EaIdSS8j/RFw0FLyxvd0kDqbE
	aCEZfCjO4j1Ud3IV1VKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyG-0000000BHeX-3bTu;
	Fri, 22 May 2026 15:39:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyF-0000000BHdd-2a59;
	Fri, 22 May 2026 15:39:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2F5C60172;
	Fri, 22 May 2026 15:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38B41F000E9;
	Fri, 22 May 2026 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779464370;
	bh=PhXZNDewQIU/RtpMf+wfAqV2sivH+vGmM2cktxerE4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i257pqtM2kYPACyD1ngfUggI4iSRxqjUdYlFKKxzVufZViVIVT2xBOEl0SpU6DInE
	 ROGVAZb/3/W0IvbwFMxor6HFcVcNrG5Q21A1mRVWwKOQBsih1iPdGeTznGeoJB3DO+
	 Fn3PvCB8+2fNVtuS/MJbVyshSkcM02OLF0I9W6ZI0pMtT9j53IMpWiV0ZX8JC6M9P/
	 FaQjM533MNXthFgpwvWbAxK8bl8eUM9XMOgr6DAoXK73ugQpZzruTM8OshFacd6BC7
	 PNNlBh7PgBgxYyU+EgAcx28busgrsz6DinxYMoEk9F2NneTnICrdURcILPdeHr1TFa
	 GSUpZYp++RtDg==
Date: Fri, 22 May 2026 16:39:20 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, kunwu.chan@gmail.com, 
	liyangouwen1@oppo.com, chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ahB4fJkNVH2UIglX@lucifer>
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer>
 <CAJuCfpG2Zmpf5N_ejB6ZDv8LDjpVtTfA_tYQ6sW+Noc9Y+XhdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpG2Zmpf5N_ejB6ZDv8LDjpVtTfA_tYQ6sW+Noc9Y+XhdA@mail.gmail.com>
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDU6NTE6MjNBTSArMDAwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDE5LCAyMDI2IGF0IDEyOjUz4oCvUE0gTG9yZW56byBT
dG9ha2VzIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXkgMTgsIDIw
MjYgYXQgMTI6NTY6NTlQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4KPiA+
ID4gPgo+ID4gPiA+IEkgdGhpbmsgd2UgZWl0aGVyIG5lZWQgdG8gZml4IGBmb3JrKClgLCBvciBr
ZWVwIHRoZSBjdXJyZW50Cj4gPiA+ID4gYmVoYXZpb3Igb2YgZHJvcHBpbmcgdGhlIFZNQSBsb2Nr
IGJlZm9yZSBwZXJmb3JtaW5nIEkvTy4KPiA+ID4KPiA+ID4gSSBzZWUuIFNvLCB0aGlzIHByb2Js
ZW0gYXJpc2VzIGZyb20gdGhlIGZhY3QgdGhhdCB3ZSBhcmUgY2hhbmdpbmcgdGhlCj4gPiA+IHBh
Z2VmYXVsdHMgcmVxdWlyaW5nIEkvTyBvcGVyYXRpb24gdG8gaG9sZCBWTUEgbG9jay4uLgo+ID4g
PiBBbmQgeW91IHdhbnQgdG8gbG9jayBWTUEgb24gZm9yayBvbmx5IGlmIHZtYV9pc19hbm9ueW1v
dXModm1hKSB8fAo+ID4gPiBpc19jb3dfbWFwcGluZyh2bWEtPnZtX2ZsYWdzKS4gU28sIHdlIHdp
bGwgYmUgYmxvY2tpbmcgcGFnZSBmYXVsdHMgZm9yCj4gPiA+IGFub255bW91cyBhbmQgQ09XIFZN
QXMgb25seSB3aGlsZSBob2xkaW5nIG1tYXBfd3JpdGVfbG9jaywgcHJldmVudGluZwo+ID4gPiBh
bnkgVk1BIG1vZGlmaWNhdGlvbi4gT24gdGhlIHN1cmZhY2UsIHRoYXQgbG9va3Mgb2sgdG8gbWUg
YnV0IEkgbWlnaHQKPiA+ID4gYmUgbWlzc2luZyBzb21lIGNvcm5lciBjYXNlcy4gSWYgbm9ib2R5
IHNlZXMgYW55IG9idmlvdXMgaXNzdWVzLCBJCj4gPiA+IHRoaW5rIGl0J3Mgd29ydGggYSB0cnku
Cj4gPgo+ID4gTm90IHN1cmUgaWYgeW91IG5vdGljZWQgYnV0IEkgZGlkIHJhaXNlIGNvbmNlcm5z
IDspCj4KPiBTb3JyeSwgSSBkaWRuJ3QgcmVhbGl6ZSB5b3VyIGZpcnN0IGNvbW1lbnQgd2FzIGEg
Y29uY2VwdHVhbCBvYmplY3Rpb24KPiB0byB0aGlzIGFwcHJvYWNoIG9mIGFsbG93aW5nIHBhZ2Ug
ZmF1bHRzIHRvIHJhY2Ugd2l0aCB0aGUgZm9yay4KCkFoIHllYWggaXQncyB1bmRlcnN0YW5kYWJs
ZSBJIHRoaW5rIHRoZXJlJ3MgYmVlbiBzbyBtYW55IHRocmVhZHMgaW4gdGhpcwpjb252ZXJzYXRp
b24gdGhhdCBpdCdzIGVhc3kgdG8gZ2V0IGxvc3QgOikKCj4KPgo+ID4KPiA+IEkgd29uZGVyIGlm
IHlvdSd2ZSBjb25mdXNlZCB0aGUgZmF1bHQgcGF0aCBhbmQgZm9yayBoZXJlLCBhcyBJIHRoaW5r
IEJhcnJ5IGhhcwo+ID4gYmVlbiBhIGxpdHRsZSB1bmNsZWFyIG9uIHRoYXQuCj4gPgo+ID4gV2hh
dCdzIGJlaW5nIHN1Z2dlc3RlZCBpbiB0aGlzIHRocmVhZCBpcyB0byBmdW5kYW1lbnRhbGx5IGNo
YW5nZSBmb3JrIGJlaGF2aW91cgo+ID4gc28gaXQncyBkaWZmZXJlbnQgZnJvbSB0aGUgZW50aXJl
IGhpc3Rvcnkgb2YgdGhlIGtlcm5lbCAob3IgLSBwcmVzdW1hYmx5IC0gYXQKPiA+IGxlYXN0IHJl
Y2VudCBoaXN0b3J5IDopIGFuZCBwZXJtaXQgY29uY3VycmVudCBwYWdlIGZhdWx0cyB0byBvY2N1
ciBvbiBhIGZvcmtpbmcKPiA+IHByb2Nlc3MuCj4gPgo+ID4gSSBhYnNvbHV0ZWx5IG9iamVjdCB0
byB0aGlzIGZvciBiZWluZyBwcmV0dHkgY3JhenkuIEkgbWVhbiBJJ20gbm90IHN1cmUgd2UKPiA+
IHJlYWxseSB3YW50IHRvIGJlIHNpbXVsdGFuZW91c2x5IG1vZGlmeWluZyBwYWdlIHRhYmxlcyB3
aGlsZSBpbnZva2luZwo+ID4gY29weV9wYWdlX3JhbmdlKCk/IE5vPwo+ID4KPiA+IE9LIHlvdSBj
b3ZlciBhbm9uIGFuZCBNQVBfUFJJVkFURSBmaWxlLWJhY2tlZCBidXQgaGFuZyBvbiB0aGVyZSdz
Cj4gPiBWTV9DT1BZX09OX0ZPUksgdG9vLi4gc28gUEZOIG1hcHBlZCwgbWl4ZWQgbWFwIGFuZCAo
dGhlIGFjY3Vyc2VkKSBVRkZEIFcvUCBhcwo+ID4gd2VsbCBhcyBwb3NzaWJseS1ndWFyZCByZWdp
b24gY29udGFpbmluZyBWTUFzIG5vdyBjYW4gaGF2ZSBwYWdlIHRhYmxlcyByYWNlZC4KPgo+IFVn
aCwgeWVhaCwgSSByZWFsaXplIG5vdyB0aGlzIGlzIGEgbWluZWZpZWxkLiBSZXNvbHZpbmcgYWxs
IHBvc3NpYmxlCj4gcmFjZXMgdGhlcmUgd291bGQgbm90IGJlIHRyaXZpYWwgYW5kIG1pZ2h0IGlu
dHJvZHVjZSBvdGhlciBwZXJmb3JtYW5jZQo+IGlzc3Vlcy4KClllYWgsIGl0J3MgZGFuZ2Vyb3Vz
IHdhdGVycyA6KQoKPgo+ID4KPiA+IFRoYXQncyBub3QgdG8gbWVudGlvbiBhbnl0aGluZyBlbHNl
IHRoYXQgcmVsaWVzIG9uIHNlcmlhbGlzYXRpb24gaGVyZSAodGhpcwo+ID4gd291bGQgYmUgY2hh
bmdpbmcgaG93IGZvcmtpbmcgaGFzIGJlZW4gZG9uZSBpbiBnZW5lcmFsKSB0aGF0IHdlIG1heSBv
ciBtYXkgbm90Cj4gPiBrbm93IGFib3V0Lgo+ID4KPiA+IFRoZSByaXNrIGxldmVsIGlzIGhpZ2gs
IGZvciB3aGF0IGFtb3VudHMgdG8gYSBoYWNrIHRvIHdvcmsgYXJvdW5kIHRoZSBmYXVsdAo+ID4g
aXNzdWUuCj4gPgo+ID4gSSBzdWdnZXN0IHRoYXQgaWYgd2UgaGF2ZSBhIHByb2JsZW0gd2l0aCB0
aGUgZmF1bHQgcGF0aCwgbGV0J3MgbG9vayBhdCB0aGUgZmF1bHQKPiA+IHBhdGggOikKPiA+Cj4g
PiBTbyB5ZWFoIEknbSB2ZXJ5IG9wcG9zZWQgdG8gdGhpcyB1bmxlc3MgSSdtIHNvbWVob3cgaG9y
cmlibHkgbWlzdGFrZW4gaGVyZSBvciBhCj4gPiB2ZXJ5IGNvbnZpbmNpbmcgYXJndW1lbnQgaXMg
bWFkZS4KPgo+IFNvLCBjdXJyZW50IGFwcHJvYWNoIG9mIGRyb3BwaW5nIGxvY2tzIGR1cmluZyBJ
L08gc291bmRzIGxpa2Ugc3RpbGwKPiB0aGUgYmVzdCBzb2x1dGlvbi4KClllYWggX29mIHRob3Nl
IHByb3Bvc2VkXyBJIHRoaW5rIGltcG9ydGFudGx5LiBUaGlzIGRvZXNuJ3QgbWVhbiB0aGVyZSBh
cmVuJ3QKb3RoZXIgcG90ZW50aWFsIHNvbHV0aW9ucy4KClRoYW5rcywgTG9yZW56bwoKPgo+ID4K
PiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
J2QgYWxzbyBsaWtlIHRvIGdldCBTdXJlbidzIGlucHV0LCBob3dldmVyLgo+ID4gPiA+Cj4gPiA+
ID4gWWVzLiBvZiBjb3Vyc2UuCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MsIExv
cmVuem8KPiA+ID4gPgo+ID4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiA+IEJhcnJ5Cj4gPgo+ID4g
Q2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
