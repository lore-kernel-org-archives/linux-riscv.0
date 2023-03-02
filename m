Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EF7C678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOAQed6pfBeH8FDTBN4ei6fZbL/neP7VaCqUAq9KBac=; b=ssNU38bfR2k7fb
	wFvEZBGXkGz67mv68rnkuR/wTOOwekOOuvJ0GOr4iUgcyx74KVcEr+gtoAx038s+xYlifC7RTdBbk
	qYOLn9iBcsFTR1XsPQfJZxx+U3Agtjx2Y3AR9G2m/CgfLiNHqLqewUCQaFw4jsL3H31PklERE0JRT
	9+sbEgJMzgvpv0Cn+71KnbIY3NYE8ixsznHzeEdX6iiPx0CEgj3ZhQitfSuGX+QHv3AdGdtVXnUxQ
	zqtklYtZDxGKWFFUHs1UgMJZQ1zPjHgEqmnbk8BFdZEiia92oA1ANLG+DYDPSnRtrr9HOV0fmYLdv
	c01hk/1v6QVuEjam5GPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXowH-003C1c-D7; Thu, 02 Mar 2023 19:50:05 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXowD-003C0T-Ul
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 19:50:04 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 9CE44240005;
	Thu,  2 Mar 2023 19:49:55 +0000 (UTC)
Message-ID: <b9d147c3-4631-67f0-5529-8e186857c47e@ghiti.fr>
Date: Thu, 2 Mar 2023 20:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RISC-V Linux kernel not booting up with KASAN enabled
Content-Language: en-US
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Cc: linux-riscv@lists.infradead.org
References: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
 <789371c4-47fd-3de5-d6c0-bb36b2864796@ghiti.fr>
 <CAD7mqrzv-jr_o2U3Kz7vTgcsOYPKgwHW-L=ARAucAPPJgs4HCw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAD7mqrzv-jr_o2U3Kz7vTgcsOYPKgwHW-L=ARAucAPPJgs4HCw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_115002_259248_5CBDB4D0 
X-CRM114-Status: GOOD (  18.55  )
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

T24gMy8yLzIzIDE3OjI1LCBDaGF0aHVyYSBSYWphcGFrc2hhIHdyb3RlOgo+IEhpIEFsZXgsCj4K
PiBUaGFuayB5b3UgdmVyeSBtdWNoLCBrZXJuZWwgYm9vdGVkIHVwIHdpdGggdGhlIHBhdGNoZXMg
eW91IG1lbnRpb25lZC4KCgpHcmVhdCwgdGhhbmtzIGZvciBnaXZpbmcgaXQgYSB0cnkhCgoKPiBC
b290dXAgd2FzIHByZXR0eSBzbG93IGNvbXBhcmVkIHRvIGJlZm9yZSB0aG91Z2ggKG9uIGEgZGV2
IGJvYXJkKS4KPiBJIGd1ZXNzIHRoYXQgaXMga2luZCBvZiBleHBlY3RlZCB3aXRoIEtBU0FOIGVu
YWJsZWQuCgoKT25seSB0aGUgcGFnZSB0YWJsZSBjcmVhdGlvbiBjaGFuZ2VzLCB0aGF0J3Mgd2Vp
cmQ6IEkgc2F3IGluIHlvdXIgY29uZmlnIAp5b3Ugd2VyZSB1c2luZyBvdXRsaW5lIGluc3RydW1l
bnRhdGlvbiwgY2FuIHlvdSB0cnkgdG8gdXNlIHRoZSBpbmxpbmUgCmluc3RydW1lbnRhdGlvbiAo
c2VsZWN0IEtBU0FOX0lOTElORSBpbnN0ZWFkIG9mIEtBU0FOX09VVExJTkUpIGFuZCBzZWUgCmlm
IHRoYXQncyBmYXN0ZXI/CgoKPiBUaGFua3MgYWdhaW4uCj4KPiBSZWdhcmRzLAo+IENoYXRoCgoK
VGhhbmtzIGZvciB0ZXN0aW5nLAoKQWxleAoKCj4KPiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDI6
NTDigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+PiBIaSBDaGF0
dXJhLAo+Pgo+PiBPbiAzLzIvMjMgMDQ6MTMsIENoYXRodXJhIFJhamFwYWtzaGEgd3JvdGU6Cj4+
PiBIaSBBbGwsCj4+Pgo+Pj4gSSBvYnNlcnZlZCB0aGF0IFJJU0MtViBMaW51eCBoYW5ncyB3aGVu
IEkgZW5hYmxlIEtBU0FOLgo+Pj4gV2l0aG91dCBLQVNBTiBpdCB3b3JrcyBmaW5lIHdpdGggUUVN
VS4KPj4+IEkgYW0gdXNpbmcgdGhlIGNvbW1pdCBhZTM0MTlmYmFjODQ1YjRkM2YzYTlmYWU0Y2M4
MGM2OGQ4MmNkZjZlCj4+Pgo+Pj4gV2hlbiBLQVNBTiBpcyBlbmFibGVkLCBRRU1VIGhhbmdzIGFm
dGVyIE9wZW5TQkkgcHJpbnRzLgo+Pj4KPj4+IEkgbm90aWNlZCBhIHNpbWlsYXIgaXNzdWUgd2Fz
IHJlcG9ydGVkIGJlZm9yZSBpbgo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUNU
NFkrWm11T3B5Zl8wdkhUVDR0M3drbUp1VzhFenZjZzd2NnlEVmQ4WU9WaVM9R0FAbWFpbC5nbWFp
bC5jb20vdC8KPj4+IEJ1dCBJIGJlbGlldmUgSSBoYXZlIHRoZSBwYXRjaCBtZW50aW9uZWQgaW4g
dGhhdCB0aHJlYWQuCj4+Cj4+IEkgcHJvcG9zZWQgYSBzZXJpZXMgdGhhdCB3aWxsIGJlIGluY2x1
ZGVkIGluIDYuMyByZWdhcmRpbmcgS0FTQU4gaXNzdWVzCj4+IGhlcmU6IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9NzE4NDU4Cj4+
Cj4+IENhbiB5b3UgZ2l2ZSBpdCBhIHRyeSBhbmQgdGVsbCBtZSBpZiBpdCB3b3JrcyBiZXR0ZXI/
Cj4+Cj4+IFRoYW5rcywKPj4KPj4gQWxleAo+Pgo+Pgo+Pj4gTXkga2VybmVsIGNvbmZpZzoKPj4+
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMWo5blU3ZjlNeENjX2ktVUhVQ1R2bzdv
Nm5EcmNVejB3L3ZpZXc/dXNwPXNoYXJpbmcKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+PiBDaGF0
aAo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
