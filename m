Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E941606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hfydWrkd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gk3Q0jML
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zQcsBlJM8g/1lNxs0JdUwhAtIm6EsIWxWQBbKN+Wf4c=; b=hfydWrkdcMeAd+fWqCwdTmM53F
	glelzzhSLTwfW8kBITiKfbbsUHX47sE/ZHN1RQkpaIX+EnOWlsN2LH5/HYQmJBd+cuBoAUNeCt95h
	z5EUGjLS89BFuk4JbZKmiYb3M7I0TrbYwVQzecHwlDBTomWl2SAMaI1v3L2rQl3DU0+31PY2FfbII
	kz7dYXgWw/zM8Ense7hcohCneKwEMwRSe99VNVvR3XKnsEeAovLLgA146xKKo6PWKlhGH6e5SUNaI
	xLZs+wdfq6zNFJQm4mpDXgKvIV+DGA10ynTc5L9JuoukbMFEBj49xLVbfA7Z7uv00M16ErVpNKZei
	zbRuKqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaQW-0000000HaQ8-30DZ;
	Sun, 15 Nov 2026 13:37:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaQV-0000000HaPg-4845
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 13:37:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27E6B622CB;
	Sun, 15 Nov 2026 13:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7B91F000C4;
	Sun, 15 Nov 2026 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749866;
	bh=DXgbDNc8MoITwG6XL1PCwv3Ndt81BI1V9dNVTbanmzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gk3Q0jMLYFrsl1YQVVuzwPX+5aGWkqyiQPTGZFIoSQNti/ScEKUtUjGZsYP2z2YpU
	 JFf9GLi1+wbT8VAgtPsIQ5BQGlUsBlvLigWgAltZokkfgZ824BXNIlxXYoY9Wshhq0
	 sMSTKT9Whm6M7oQ9v9od4g60+kOvtqa3EfEg29HHZ5Jhi+ccunjf70jGmKu4WITR+T
	 dZX4hlzC/aT7BTU3+OiBZXfBUDnpVV7x0N/SrglI0r5YKs5tJ0gJYWJiKiXYTFFNXk
	 sC1pUW+LcO0eYgo3jeQGEWFpX7q8T8GLxCK+ZcUuvU92tOjD2yCRvy1G+rBB4NF0LK
	 8zqztGW7akXwg==
Date: Sun, 15 Nov 2026 21:17:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: Pre-allocate module page tables for execmem
Message-ID: <avmw5hzuVxEk__WR@xhacker>
References: <20261016102847.96530-1-kmehltretter@gmail.com>
 <avgpqlpWf01mwo9P@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avgpqlpWf01mwo9P@gmail.com>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMTQsIDIwMjYgYXQgMTA6Mjk6MjlBTSArMDEwMCwgS2FybCBNZWhsdHJldHRl
ciB3cm90ZToKPiBPbiBGcmksIE9jdCAxNiwgMjAyNiBhdCAxMjoyODo0N1BNICswMTAwLCBLYXJs
IE1laGx0cmV0dGVyIHdyb3RlOgo+ID4gICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcg
cmVxdWVzdCAuLi4KPiA+ICAgW2ZmZmZmZmZmNzgwMDAwMDBdIHBnZD0wMDAwMDAwMDAwMDAwMDAw
Cj4gPiAgIC4uLgo+ID4gICBicGZfaml0X2ZpbGxfaG9sZV93aXRoX3plcm8KPiA+ICAgYnBmX3By
b2dfcGFja19hbGxvYwo+ID4gCj4gPiBVc2UgQ09ORklHX0VYRUNNRU0gZm9yIHRoZSBtb2R1bGUt
cmFuZ2UgcHJlLWFsbG9jYXRpb24sIGFzIHBvd2VycGMgZG9lcwo+ID4gZm9yIGl0cyBleGVjbWVt
IHBhZ2UtdGFibGUgc2V0dXAuIEJvdGggQ09ORklHX01PRFVMRVMgYW5kIENPTkZJR19CUEZfSklU
Cj4gPiBzZWxlY3QgaXQuCj4gPiAKPiA+IEZpeGVzOiAyYzllNWQ0YTAwODIgKCJicGY6IHJlbW92
ZSBDT05GSUdfQlBGX0pJVCBkZXBlbmRlbmN5IG9uIENPTkZJR19NT0RVTEVTIG9mIikKPiA+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiBBc3Npc3RlZC1ieTogTExNCj4gPiBTaWduZWQt
b2ZmLWJ5OiBLYXJsIE1laGx0cmV0dGVyIDxrbWVobHRyZXR0ZXJAZ21haWwuY29tPgo+ID4gQWNr
ZWQtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KPiA+IEFj
a2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KCj4gPiAtLS0KPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiAtIFN0YXRlIHRoYXQgdGhlIEJQRiBKSVQgcmVnaW9uIGxpZXMgaW5zaWRlIHRoZSBt
b2R1bGUgcmVnaW9uIChNaWtlKS4KPiA+IC0gQWRkIEFja2VkLWJ5IHRhZ3MgZnJvbSBNaWtlIFJh
cG9wb3J0IGFuZCBCasO2cm4gVMO2cGVsLgo+ID4gLSBObyBjb2RlIGNoYW5nZXMgZnJvbSB2MS4K
PiA+IAo+IAo+IEEgZnJpZW5kbHkgcGluZyBvbiB2MiBvZiB0aGlzIFJWNjQgZXhlY21lbSBwYWdl
LXRhYmxlIGZpeC4KPiAKPiBJcyBhbnl0aGluZyBlbHNlIG5lZWRlZCBmcm9tIG15IHNpZGU/Cj4g
Cj4gVGhhbmtzLAo+IEthcmwKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
