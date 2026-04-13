Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4B0E9380D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 03:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0339alrpIHWvDlGE/DMLWgeNsUo+Ga5m/TwdheQkQhg=; b=EBgUVDqFI6H8Ye
	he7kIJXg9yFOxa8+d+9aspYjSZmv8lsRkw/l0prm1wX5WwBQuthF7c8fSq0gVZFWtpeaG/9HwPMZu
	2FN2pj8k3ZqeI/Y86u33RrE7Dgy93OmQ22SVf7xQMkQiVhAR/N9slOYHxiS72j0qPSsSJY9VS6olA
	8EmUMHH5o6dcB61dpTWkNvhz5Hrf3uFkWI9qht6zkIyUOP0AZvjFsEoUxrvPyFhgBl9xnPOjzpBLq
	rsbZAGvQz1gmp87DNQhnjwbuYJVSXcohKLX5GrgJYGs2A4b+Wghp0YXpgESDV1aiv9hiCeD38IJSf
	u1NPmsdj6NP2/pgvg55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7r2-0000000Ew3z-0ver;
	Mon, 13 Apr 2026 03:20:52 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7qu-0000000Ew31-3V22
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 03:20:51 +0000
X-UUID: bad31ca836e711f1aa26b74ffac11d73-20260413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cfc7a0a1-5f2b-4661-a986-60397b4ed76f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1065a9b6e03e6c2aed0e2191c1682323,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bad31ca836e711f1aa26b74ffac11d73-20260413
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 600720539; Mon, 13 Apr 2026 11:20:32 +0800
Message-ID: <5cc377eb-3e6b-44c7-a935-359c5b9d64a2@kylinos.cn>
Date: Mon, 13 Apr 2026 11:20:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: Fix ZBB strnlen reading past count boundary
To: Michael Neuling <mikey@neuling.org>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260413010738.1622423-1-mikey@neuling.org>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260413010738.1622423-1-mikey@neuling.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_202049_517347_F6B8E077 
X-CRM114-Status: GOOD (  10.81  )
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

T24gMjAyNi80LzEzIDA5OjA3LCBNaWNoYWVsIE5ldWxpbmcgd3JvdGU6Cj4gVGhlIFpCQi1vcHRp
bWl6ZWQgc3RybmxlbiBsb29wIGxvYWRzIG9uZSB3b3JkIGFoZWFkIGJlZm9yZSBjaGVja2luZyB0
aGUKPiBhbGlnbmVkIGJvdW5kYXJ5Ogo+IAo+ICAgICBSRUdfTCAgIHQxLCBTWlJFRyh0MCkgICAg
ICAgLy8gbG9hZCBuZXh0IHdvcmQKPiAgICAgYWRkaSAgICB0MCwgdDAsIFNaUkVHICAgICAgIC8v
IGFkdmFuY2UKPiAgICAgb3JjLmIgICB0MSwgdDEKPiAgICAgYmdldSAgICB0MCwgdDQsIDRmICAg
ICAgICAgIC8vIGJvdW5kYXJ5IGNoZWNrIEFGVEVSIGxvYWQKPiAKPiB3aGVyZSB0NCA9IChzICsg
Y291bnQpICYgLVNaUkVHLiAgV2hlbiBzIGlzIGFsaWduZWQgYW5kIGNvdW50IGlzIGEKPiBtdWx0
aXBsZSBvZiBTWlJFRywgdDQgZXF1YWxzIHMgKyBjb3VudCBhbmQgdGhlIGxvb3AgbG9hZHMgYSBm
dWxsIHdvcmQKPiBzdGFydGluZyBhdCBleGFjdGx5IHMgKyBjb3VudC4gIElmIHMgKyBjb3VudCBm
YWxscyBvbiBhIHBhZ2UgYm91bmRhcnkKPiB3aXRoIHRoZSBuZXh0IHBhZ2UgdW5tYXBwZWQsIHRo
aXMgZmF1bHRzLgo+IAo+IEZpeCBieSBjb21wdXRpbmcgdGhlIGFsaWduZWQgYm91bmRhcnkgZnJv
bSB0aGUgbGFzdCB2YWxpZCBieXRlCj4gKHMgKyBjb3VudCAtIDEpIGluc3RlYWQgb2YgcyArIGNv
dW50LiAgVGhpcyBtYWtlcyB0aGUgbG9vcCBzdG9wIGF0IHRoZQo+IHdvcmQgY29udGFpbmluZyB0
aGUgbGFzdCB2YWxpZCBieXRlIHJhdGhlciB0aGFuIHBvdGVudGlhbGx5IGxvYWRpbmcgdGhlCj4g
d29yZCBhZnRlciBpdC4gIFRoZSBjb3VudCA9PSAwIGNhc2UgaXMgYWxyZWFkeSBoYW5kbGVkIGJ5
IHRoZSBiZXF6Cj4gZWFybHkgZXhpdC4KPiAKPiBBbHNvIGFkZCBhIHByZS1sb29wIGd1YXJkIChi
Z2V1IHQwLCB0NCkgZm9yIHRoZSBjYXNlIHdoZXJlIGFsbCB2YWxpZAo+IGJ5dGVzIGZpdCB3aXRo
aW4gdGhlIGZpcnN0IHdvcmQuICBXaXRoIHRoZSBhZGp1c3RlZCBib3VuZGFyeSwgdDQgY2FuCj4g
ZXF1YWwgdDAsIGFuZCBlbnRlcmluZyB0aGUgbG9vcCB3aXRoIHN0YWxlIHJlZ2lzdGVyIHN0YXRl
IGZyb20gdGhlCj4gZmlyc3Qtd29yZCBwcm9jZXNzaW5nIHdvdWxkIHByb2R1Y2UgaW5jb3JyZWN0
IHJlc3VsdHMuCj4gCj4gVGhlIGZpbmFsIG1pbnUgY2xhbXAgZW5zdXJlcyB0aGUgcmVzdWx0IGlz
IHN0aWxsIGNvcnJlY3Qgd2hlbiB0aGUgbGFzdAo+IGxvYWRlZCB3b3JkIGV4dGVuZHMgcGFzdCBz
ICsgY291bnQgLSAxIHdpdGhpbiB0aGUgc2FtZSBhbGlnbmVkIHdvcmQuCj4gCj4gRml4ZXM6IDVi
YTE1ZDQxOWZhYiAoInJpc2N2OiBsaWI6IGFkZCBzdHJubGVuKCkgaW1wbGVtZW50YXRpb24iKQo+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgTmV1bGluZyA8bWlrZXlAbmV1bGluZy5vcmc+Cj4gQXNz
aXN0ZWQtYnk6IENsYXVkZSBPcHVzNC42IEhpZ2ggVGhpbmtpbmcKPiAtLS0KPiAuLi4KCkhpIE1p
Y2hhZWwsCgpUaGFua3MgZm9yIGNhdGNoaW5nIGFuZCBmaXhpbmcgdGhpcyEgWW91ciBhbmFseXNp
cyBpcyBzcG90IG9u4oCUdGhhdAoibG9hZC1iZWZvcmUtY2hlY2siIGxvZ2ljIHdhcyBpbmRlZWQg
YW4gb3ZlcnNpZ2h0IG9uIG15IHBhcnQsIGVzcGVjaWFsbHkKcmVnYXJkaW5nIHRoZSBwYWdlIGJv
dW5kYXJ5IGVkZ2UgY2FzZS4KClRoZSB0ZXN0IGNhc2UgeW91IHByb3ZpZGVkIGlzIGV4dHJlbWVs
eSBoZWxwZnVsLiBTaW5jZSB5b3UndmUgYWxyZWFkeQpidWlsdCB0aGlzIHJlcHJvZHVjZXIsIHdv
dWxkIHlvdSBiZSBpbnRlcmVzdGVkIGluIGhlbHBpbmcgdG8gaW1wcm92ZQp0aGUgS1VuaXQgdGVz
dCBzdHJpbmdfdGVzdF9zdHJubGVuKCkgaW4gbGliL3Rlc3RzL3N0cmluZ19rdW5pdC5jIGFzIHdl
bGw/CkN1cnJlbnRseSwgaXQgbWFpbmx5IHRlc3RzIHN0cmluZ3Mgd2l0aCBOVUwgdGVybWluYXRv
cnMgYW5kIGxhY2tzIGNvdmVyYWdlCmZvciB0aGVzZSBraW5kcyBvZiBub24tdGVybWluYXRlZCBi
b3VuZGFyeSBzY2VuYXJpb3MuCgpUaGFua3MgYWdhaW4hCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMs
CkZlbmcgSmlhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
