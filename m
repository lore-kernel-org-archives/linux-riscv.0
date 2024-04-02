Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26857CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQgeQKeNK58GaEmXkyrBgQ+Vi+B1Q3ehoGysRn/0v7Y=; b=PEVlcIiARufRGQ
	SFfFjZUZQBBwxXT+cz8TiWIJ++/oehO1GWx3vhmruEbayHUnACqvtc+YKHh5cJ9I5G/1SY/xAuqPx
	C85T/80rFZuU8FUTfhoFhg5P5QKfxHFYBamK8avEFxPRO5KrKc5bO3ygVk+pHLxaQr4QW+pVYD2ep
	W+WXEWcCRDF4bzN1N6mhBQFK1mUg8sAehMwAblaIiyqDM/oTzBcOIFDvRrjZEjl4iPzPO089t0lTc
	WvBD0gyEL3go4iHzL4Xn8Gj9iB9ng5lJZ2whOeLIZ+0518+vCCc8tWR4AUVfIDzAOL6ho+1HRyfIA
	dpLiv3/ickwKQhfZh68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrjNM-0000000CRL4-1xy8;
	Tue, 02 Apr 2024 19:00:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrjNK-0000000CRK2-07sr
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 19:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79B9B60FF0;
	Tue,  2 Apr 2024 19:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21C3C433C7;
	Tue,  2 Apr 2024 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712084449;
	bh=LAtbIzYyxLFCGtNL9bIPT1JIqLRx2Xsuxm7vJ6doThY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DZ4bwmeyU0UKQkMQsDplzrpVduUBrEcwHrOmJLCrxxwVSSz7gljEEa+sexxuDhkek
	 Q0GOstLz6J79g/c0cVcSX17twHaTIKdjTixPFXRS8JbIvVrzjKSzQBNsMOUi8Orv+0
	 eTOFSIzOFqF54mss/lkSeoVUjD3eE7sj6Qbo4R/C+DsOhInYQujzr9TRTIyvF42SYs
	 2DcamE9zwT9rnfb/YDlyGyJL43Nv7KXKmrPPOR0it/KuuLjKQKuQeuXFrLszqT2l7r
	 UqR7rgnQaJFyPmmM9Hba7oykBUvPCPbFT7r/p+Kd+6Vy38Y16qbQUGNcbEbcfly4gU
	 y88HfgZbdXtTw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Stefan O'Rear <sorear@fastmail.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko
 <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
In-Reply-To: <20240402-ample-preview-c84edb69db1b@spud>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
 <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
 <20240402-ample-preview-c84edb69db1b@spud>
Date: Tue, 02 Apr 2024 21:00:45 +0200
Message-ID: <871q7nr3mq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_120050_181804_B7930EB6 
X-CRM114-Status: GOOD (  28.39  )
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

SGV5IENvbm9yIQoKQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9u
IFR1ZSwgQXByIDAyLCAyMDI0IGF0IDA0OjI1OjI0UE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3Jv
dGU6Cj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+PiAKPj4g
PiBPbiAyMDI0LzMvMjkgNjowNywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiA+PiBPbiBUaHUsIE1h
ciAyOCwgMjAyNCBhdCAwMzozNDozMVBNIC0wNDAwLCBTdGVmYW4gTydSZWFyIHdyb3RlOgo+PiA+
Pj4gT24gVGh1LCBNYXIgMjgsIDIwMjQsIGF0IDg6NDkgQU0sIFB1IExlaHVpIHdyb3RlOgo+PiA+
Pj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+ID4+Pj4KPj4gPj4+PiBU
aGlzIHBhdGNoIHJlbGF4ZXMgdGhlIHJlc3RyaWN0aW9ucyBvbiB0aGUgWmJiIGluc3RydWN0aW9u
cy4gVGhlIGhhcmR3YXJlCj4+ID4+Pj4gaXMgY2FwYWJsZSBvZiByZWNvZ25pemluZyB0aGUgWmJi
IGluc3RydWN0aW9ucyBpbmRlcGVuZGVudGx5LCBlbGltaW5hdGluZwo+PiA+Pj4+IHRoZSBuZWVk
IGZvciByZWxpYW5jZSBvbiBrZXJuZWwgY29tcGlsZSBjb25maWd1cmF0aW9ucy4KPj4gPj4+Cj4+
ID4+PiBUaGlzIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBtZS4KPj4gPj4gCj4+ID4+IEl0IGRvZXNu
J3QgbWFrZSBzZW5zZSB0byBtZSBlaXRoZXIuIE9mIGNvdXJzZSB0aGUgaGFyZHdhcmUncyBjYXBh
YmlsaXR5Cj4+ID4+IHRvIHVuZGVyc3RhbmQgYW4gaW5zdHJ1Y3Rpb24gaXMgaW5kZXBlbmRlbnQg
b2Ygd2hldGhlciBvciBub3QgYQo+PiA+PiB0b29sY2hhaW4gaXMgY2FwYWJsZSBvZiBhY3R1YWxs
eSBlbWl0dGluZyB0aGUgaW5zdHJ1Y3Rpb24uCj4+ID4+IAo+PiA+Pj4gUklTQ1ZfSVNBX1pCQiBp
cyBkZWZpbmVkIGFzOgo+PiA+Pj4KPj4gPj4+ICAgICAgICAgICAgIEFkZHMgc3VwcG9ydCB0byBk
eW5hbWljYWxseSBkZXRlY3QgdGhlIHByZXNlbmNlIG9mIHRoZSBaQkIKPj4gPj4+ICAgICAgICAg
ICAgIGV4dGVuc2lvbiAoYmFzaWMgYml0IG1hbmlwdWxhdGlvbikgYW5kIGVuYWJsZSBpdHMgdXNh
Z2UuCj4+ID4+Pgo+PiA+Pj4gSW4gb3RoZXIgd29yZHMsIFJJU0NWX0lTQV9aQkI9biBzaG91bGQg
ZGlzYWJsZSBldmVyeXRoaW5nIHRoYXQgYXR0ZW1wdHMKPj4gPj4+IHRvIGRldGVjdCBaYmIgYXQg
cnVudGltZS4gSXQgaXMgbW9zdGx5IHJlbGV2YW50IGZvciBjb2RlIHNpemUgcmVkdWN0aW9uLAo+
PiA+Pj4gd2hpY2ggaXMgcmVsZXZhbnQgZm9yIEJQRiBzaW5jZSBpZiBSSVNDVl9JU0FfWkJCPW4g
YWxsIHJ2emJiX2VuYWJsZWQoKQo+PiA+Pj4gY2hlY2tzIGNhbiBiZSBjb25zdGFudC1mb2xkZWQu
Cj4+ID4KPj4gPiBUaGFua3MgZm9yIHJldmlldy4gTXkgaW5pdGlhbCB0aG91Z2h0IHdhcyB0aGUg
c2FtZSBhcyB5b3VycywgYnV0IGFmdGVyIAo+PiA+IGRpc2N1c3Npb25zIFswXSBhbmQgdGVzdCB2
ZXJpZmljYXRpb25zLCB0aGUgaGFyZHdhcmUgY2FuIGluZGVlZCAKPj4gPiByZWNvZ25pemUgdGhl
IHpiYiBpbnN0cnVjdGlvbiBldmVuIGlmIHRoZSBrZXJuZWwgaGFzIG5vdCBlbmFibGVkIAo+PiA+
IENPTkZJR19SSVNDVl9JU0FfWkJCLiBBcyBDb25vciBtZW50aW9uZWQsIHdlIGFyZSBqdXN0IGFj
dGluZyBhcyBhIEpJVCB0byAKPj4gPiBlbWl0IHpiYiBpbnN0cnVjdGlvbiBoZXJlLiBNYXliZSBp
c19od196YmJfY2FwYWJsZSgpIHdpbGwgYmUgYmV0dGVyPwo+PiAKPj4gSSBzdGlsbCB0aGluayBM
ZWh1aSdzIHBhdGNoIGlzIGNvcnJlY3Q7IEJ1aWxkaW5nIGEga2VybmVsIHRoYXQgY2FuIGJvb3QK
Pj4gb24gbXVsdGlwbGUgcGxhdGZvcm1zICh3LyBvciB3L28gWmJiIHN1cHBvcnQpIGFuZCBub3Qg
aGF2aW5nIFpiYiBpbnNuIGluCj4+IHRoZSBrZXJuZWwgcHJvcGVyLCBhbmQgaWZmIFpiYiBpcyBh
dmFpbGFibGUgYXQgcnVuLXRpbWUgdGhlIEJQRiBKSVQgd2lsbAo+PiBlbWl0IFpiYi4KPgo+IFRo
aXMgc2VudGVuY2UgaXMgLUVOT1BBUlNFIHRvIG1lLCBkaWQgeW91IGFjY2lkZW50YWxseSBvbWl0
IHNvbWUgd29yZHM/Cj4gQWRkaXRpb25hbGx5IGhlIGNvbmZpZyBvcHRpb24gaGFzIG5vdGhpbmcg
dG8gZG8gd2l0aCBidWlsZGluZyBrZXJuZWxzIHRoYXQKPiBib290IG9uIG11bHRpcGxlIHBsYXRm
b3JtcywgaXQgb25seSBjb250cm9scyB3aGV0aGVyIG9wdGltaXNhdGlvbnMgZm9yIFpiYgo+IGFy
ZSBidWlsdCBzbyB0aGF0IGlmIFpiYiBpcyBkZXRlY3RlZCB0aGV5IGNhbiBiZSB1c2VkLgoKVWdo
LCBzb3JyeSBhYm91dCB0aGF0ISBJJ20gcHJvYmFibHkgY29uZnVzZWQgbXlzZWxmLgoKPj4gRm9y
IHRoZXNlIGtpbmQgb2Ygb3B0aW1pemF0aW9ucywgKElNTykgaXQncyBiZXR0ZXIgdG8gbGV0IHRo
ZSBCUEYgSklUCj4+IGRlY2lkZSBhdCBydW4tdGltZS4KPgo+IFdoeSBpcyBicGYgYSBkaWZmZXJl
bnQgY2FzZSB0byBhbnkgb3RoZXIgdXNlciBpbiB0aGlzIHJlZ2FyZD8KPiBJIHRoaW5rIHRoYXQg
dGhlIGNvbW1pdCBtZXNzYWdlIGlzIG1pc2xlYWRpbmcgYW5kIG5lZWRzIHRvIGJlIGNoYW5nZWQs
Cj4gYmVjYXVzZSB0aGUgcG9pbnQgInRoZSBoYXJkd2FyZSBpcyBjYXBhYmxlIG9mIHJlY29nbmlz
aW5nIHRoZSBaYmIKPiBpbnN0cnVjdGlvbnMgaW5kZXBlbmRlbnRseS4uLiIgaXMgY29tcGxldGVs
eSB1bnJlbGF0ZWQgdG8gdGhlIHB1cnBvc2UKPiBvZiB0aGUgY29uZmlnIG9wdGlvbi4gT2YgY291
cnNlIHRoZSBoYXJkd2FyZSB1bmRlcnN0YW5kaW5nIHRoZSBvcHRpb24KPiBoYXMgbm90aGluZyB0
byBkbyB3aXRoIGtlcm5lbCBjb25maWd1cmF0aW9uLiBUaGUgY29tbWl0IG1lc3NhZ2UgbmVlZHMg
dG8KPiBleHBsYWluIHdoeSBicGYgaXMgYSBzcGVjaWFsIGNhc2UgYW5kIGlzIGV4ZW1wdCBmcm9t
IGFuIAo+Cj4gSSB0b3RhbGx5IHVuZGVyc3RhbmQgYW55IHBvaW50IGFib3V0IGJwZiBiZWluZyBk
aWZmZXJlbnQgaW4gdGVybXMgb2YKPiBuZWVkaW5nIHRvb2xjaGFpbiBzdXBwb3J0LCBidXQgSUlS
QyBpdCB3YXMgSSB3aG8gcG9pbnRlZCBvdXQgdXAtdGhyZWFkLgo+IFRoZSBwYXJ0IG9mIHRoZSBj
b252ZXJzYXRpb24gdGhhdCB5b3UncmUgcmVwbHlpbmcgdG8gaGVyZSBpcyBhYm91dCB0aGUKPiBz
ZW1hbnRpY3Mgb2YgdGhlIEtjb25maWcgb3B0aW9uIGFuZCB0aGUgb3JpZ2luYWwgcGF0Y2ggbmV2
ZXIgbWVudGlvbmVkCj4gdHJ5aW5nIHRvIGF2b2lkIGEgZGVwZW5kZW5jeSBvbiB0b29sY2hhaW5z
IGF0IGFsbCwganVzdCBrZXJuZWwKPiBjb25maWd1cmF0aW9ucy4gVGhlIHRvb2xjaGFpbiByZXF1
aXJlbWVudHMgSSBkb24ndCB0aGluayBhcmUgZXZlbiBzdXBlcgo+IGhhcmQgdG8gZnVsZmlsbCBl
aXRoZXIgLSB0aGUgbGFzdCAzIHZlcnNpb25zIG9mIGxkIGFuZCBsbGQgYWxsIG1lZXQgdGhlCj4g
Y3JpdGVyaWEuCgpUaGFua3MgZm9yIG1ha2luZyBpdCBtb3JlIGNsZWFyLCBhbmQgSSBhZ3JlZSB0
aGF0IHRoZSB0b29sY2hhaW4KcmVxdWlyZW1lbnRzIGFyZSBub3QgaGFyZCB0byBmdWxmdWxsLgoK
TXkgdmlldyBoYXMgYmVlbiB0aGF0ICJCUEYgaXMgbGlrZSB1c2VybGFuZCIsIGJ1dCBJIHJlYWxp
emUgbm93IHRoYXQncwpvZGQuIExldCdzIG1ha2UgQlBGIHNpbWlsYXIgdG8gdGhlIHJlc3Qgb2Yg
dGhlIFJWIGtlcm5lbC4gSWYgWkJCPW4sIHRoZW4KdGhlIEJQRiBKSVQgZG9lc24ndCBrbm93IGFi
b3V0IGVtaXR0aW5nIFpiYi4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
