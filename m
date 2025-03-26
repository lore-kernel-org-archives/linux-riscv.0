Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67396C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fdnoLAGPlP5N4aO7Pjow6Mt+jdravbeu38JBairPqY=; b=e3ubgxvtH4AWqQ
	r47EcSVNkwwbiZGFiyJCZzpxnZ8nFfimbqUhS49K7bdLPATZhCyiQBMsa+FTNzrUguZrCOs+7aFce
	8yP5W8u1QYxUDiVWqjHy6mzeXQI6k2PD2p2fu5Od7D3P26YaviarWU8g7bOhFpeV1py6e9o+pAC9I
	DZAuSmpipFwhRLt8PIPcpxnx3+vnuWnoUA5X4PCXvW3+MWPUqYd//suqixz8+uRbV2OnrTzK8O3BP
	j8U3zzZAiKDK0dwb/YsHthS/i1CC2vVCW/rK3xlMOR4L/9OHBA2bfw6LSd3h4jGqDQHILI3FZ+q+R
	ion3F0kbfoyyANYoWHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWq4-00000009V5A-0spj;
	Wed, 26 Mar 2025 19:55:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWq2-00000009V51-2KUH
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 19:54:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 258346115A;
	Wed, 26 Mar 2025 19:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EBAC4CEE9;
	Wed, 26 Mar 2025 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743018897;
	bh=nJdi+8s1W+HMSPaTDyc5/leo0zsB9OTHXjIF969gMCM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PZ7ATmg1MTJY8x0AB42UeFq2UfnmXvGnw1JeL3woN1O+dyTTvoQZJRpvL7Mmx6k4g
	 9DUqaQmjFCdsok+YC1sqc+3pUWs8lxH3gY6zJqpXc7OtNKRHausY+EKyQwftkgEA+6
	 Uxyn7VaVTjR4Fc8t1c3MRcceTXM74iEn6fb9hEzC431vtOoqrvd1Uo15iIilOEl0Xt
	 NRM8aP99dWiogqt6gid3He65o8XFBOldC6O3fyvNVlxfF6f/T9pre2Z3p2Ojk9en5Z
	 lwo14PbhT19hp+sz8y3Xdl6OibVlXb60BRoVlW1wISccuVivkiRr0D8sgxSwOsHPnL
	 DMHvOiXpdnBsQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yao Zi <ziyao@disroot.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Ying Sun <sunying@isrc.iscas.ac.cn>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH] riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
In-Reply-To: <877c4bg1us.fsf@all.your.base.are.belong.to.us>
References: <20250326051445.55131-2-ziyao@disroot.org>
 <877c4bg1us.fsf@all.your.base.are.belong.to.us>
Date: Wed, 26 Mar 2025 20:54:54 +0100
Message-ID: <87y0wrk1o1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBZYW8gWmkgPHppeWFv
QGRpc3Jvb3Qub3JnPiB3cml0ZXM6Cj4KPj4gQ29tbWl0IDU4ZmY1MzcxMDlhYyAoInJpc2N2OiBP
bWl0IG9wdGltaXplZCBzdHJpbmcgcm91dGluZXMgd2hlbgo+PiB1c2luZyBLQVNBTiIpIGludHJv
ZHVjZWQgY2FsbHMgdG8gRVhQT1JUX1NZTUJPTCgpIGluIGFzc2VtYmx5IHN0cmluZwo+PiByb3V0
aW5lcywgd2hpY2ggcmVzdWx0IGluIFJfUklTQ1ZfNjQgcmVsb2NhdGlvbnMgYWdhaW5zdAo+PiAu
ZXhwb3J0X3N5bWJvbCBzZWN0aW9uLiBBcyB0aGVzZSByb3VudGluZXMgYXJlIHJldXNlZCBieSBS
SVNDLVYKPj4gcHVyZ2F0b3J5IGFuZCBvdXIgcmVsb2NhdG9yIGRvZXNuJ3QgcmVjb2duaXplIHRo
ZXNlIHJlbG9jYXRpb25zLCB0aGlzCj4+IGZhaWxzIGtleGVjLWZpbGUtbG9hZCB3aXRoIGRtZXNn
IGxpa2UKPj4KPj4gCVsgICAxMS4zNDQyNTFdIGtleGVjX2ltYWdlOiBVbmtub3duIHJlbGEgcmVs
b2NhdGlvbjogMgo+PiAJWyAgIDExLjM0NTk3Ml0ga2V4ZWNfaW1hZ2U6IEVycm9yIGxvYWRpbmcg
cHVyZ2F0b3J5IHJldD0tOAo+Pgo+PiBMZXQncyBzdXBwb3J0IFJfUklTQ1ZfNjQgcmVsb2NhdGlv
biB0byBmaXgga2V4ZWMgb24gNjQtYml0IFJJU0MtVi4KPj4gMzItYml0IHZhcmlhbnQgaXNuJ3Qg
Y292ZXJlZCBzaW5jZSBLRVhFQ19GSUxFIGFuZCBLRVhFQ19QVVJHQVRPUlkgaXNuJ3QKPj4gYXZh
aWxhYmxlLgo+Cj4gSGkhCj4KPiBUaGlzIHBhdGNoIGRvZXMgZml4IHRoZSB2bWxpbnV4IGxvYWRp
bmcgZm9yIGtleGVjLWZpbGUgLS0gdmVyeSBuaWNlIQo+IEhvd2V2ZXIsIEkgaGF2ZW4ndCBiZWVu
IGFibGUgdG8gZ2V0IGtleGVjIHRvIHN1Y2Nlc3NmdWxseSBib290IGEga2VybmVsCj4gZnJvbSBx
ZW11LCBpLmUuOgo+Cj4gICBrZXhlYyAtcyAtbCAvcGF0aC90by92bWxpbnV4ICMgZml4ZWQgdy8g
eW91ciBwYXRjaAo+ICAga2V4ZWMgLWUgIyBoYW5ncyBhZnRlciAiQnllLi4uIgo+Cj4gU2FtZSB3
aGVuIEkgdHJ5IHZhbmlsbGEga2V4ZWMgKGtleGVjIC1jIC1sIC9wYXRoL3RvL3ZtbGludXgpLiBr
ZXhlYyB3aXRoCj4gYW4gSW1hZ2Ugd29ya3MgZm9yIG1lIGluIHFlbXUuCj4KPiBCZWZvcmUgSSBz
dGFydCB0byBiaXNlY3QgdG9vIG11Y2g7IFdoYXQgY29uZmlnL3FlbXUgZGlkIHlvdSB1c2UgdG8g
dGVzdAo+IHRoaXM/CgpOZXZlcm1pbmQhIEdvdCBpdCB0byB3b3JrOyBTb3JyeSBmb3IgdGhlIG5v
aXNlLgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
