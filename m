Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F28CCA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3bOkFZUKjxHgFAWSDibBmCfzVNEyZhtrVwQe22QbN4=; b=n/zeSyDckKkqRs
	iK5EBR3SrrRbl5yo4v1Rks3fQSTg4qnXVntduQsXQ78fyfinw90uec3T2JBHldQ/l151ZMfSgbBcy
	M4ENHtUMiX88fNGDngXcXtH/oc4HvP/d4gyPPF57eLWZen3NZ6n9BcVyI3EQ9joIJxkpUn96J5oN+
	TJ67o6JxXrDi9nu+gqRQ8/LO6m68X5Fa+PQBQcmmzkdWv4qeKcMH5MiAeFn0Lv0jjZs9ME9JV7PNx
	LnL3VR+FRuGEw1EPbu2SsWayw/3na1CQO5gZwpkfeTWdYj7LkePoxTWPmkSDenaWYCyjQRYRWUNTh
	OxBFLnT/jDeZdSKQVupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrXB-00000002BxA-05lY;
	Fri, 15 Aug 2025 10:19:41 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqDv-00000001ve6-40Pa
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 08:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i1frrFq1JqWxmv06jlcZAloOf2QBV2zd+Y+7JobcmQ4=; b=XVUryIcUDqO915sXgNouX0NZhh
	I/L3IjFRmD1+11LiA2CiW2ug647SBIHAOFjQ1SLLvbbLB6eiu3zJ2+DtYJ7oBCUDVWIJYU44U8sKa
	IW3r3WDo19nLezC2XefYb7fZHOwwBCFxTLbspt4o+19eAoNdOygizstSHaSo+Q358qHn4LqYB6iht
	npN5EpynJ02SewcX//28tE+YG9WqWjB2q9COIb0B+iHx2JO74dhOAtmAr4fJk3qDeT4TnMRQCLCer
	tnGa8PkYE60nnEzmmszf9uS45GY0Nj63R8BwYfEYiHoaCT5mYQsVrSrD7t4zqi1vrNvfAzAfXIzEJ
	3Lp2i1jA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1umqDP-000Gfs-2p;
	Fri, 15 Aug 2025 10:55:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1umqDP-0009cR-0r;
	Fri, 15 Aug 2025 10:55:10 +0200
Message-ID: <8ef2259d-eb58-4c66-a27a-3ee0b85aa639@iogearbox.net>
Date: Fri, 15 Aug 2025 10:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 00/10] Add support arena atomics for RV64
To: Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <87v7n21deu.fsf@all.your.base.are.belong.to.us>
 <00538107-08e3-4ba3-a11a-19fa9fd0a496@huaweicloud.com>
Content-Language: en-US
From: Daniel Borkmann <daniel@iogearbox.net>
Autocrypt: addr=daniel@iogearbox.net; keydata=
 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
In-Reply-To: <00538107-08e3-4ba3-a11a-19fa9fd0a496@huaweicloud.com>
X-Virus-Scanned: Clear (ClamAV 1.0.7/27732/Thu Aug 14 10:32:19 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015544_279211_9597AFF1 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

T24gOC81LzI1IDg6NTIgQU0sIFB1IExlaHVpIHdyb3RlOgo+IE9uIDIwMjUvOC81IDE0OjM4LCBC
asO2cm4gVMO2cGVsIHdyb3RlOgo+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+
IHdyaXRlczoKPj4KPj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pgo+
Pj4gcGF0Y2ggMS0zIHJlZmFjdG9yIHJlZHVuZGFudCBsb2FkIGFuZCBzdG9yZSBvcGVyYXRpb25z
Lgo+Pj4gcGF0Y2ggNC03IGFkZCBaYWNhcyBpbnN0cnVjdGlvbnMgZm9yIGNtcHhjaGcuCj4+PiBw
YXRjaCA4IG9wdGltaXplcyBleGNlcHRpb24gdGFibGUgaGFuZGxpbmcuCj4+PiBwYXRjaCA5LTEw
IGFkZCBzdXBwb3J0IGFyZW5hIGF0b21pY3MgZm9yIFJWNjQuCj4+Pgo+Pj4gVGVzdHMgYHRlc3Rf
cHJvZ3MgLXQgYXRvbWljLGFyZW5hYCBoYXZlIHBhc3NlZCBhcyBzaG93biBiZWxsb3csCj4+PiBh
cyB3ZWxsIGFzIGB0ZXN0X3ZlcmlmaWVyYCBhbmQgYHRlc3RfYnBmLmtvYCBoYXZlIHBhc3NlZC4K
Pj4KPj4gWy4uLl0KPj4KPj4+IFB1IExlaHVpICgxMCk6Cj4+PiDCoMKgIHJpc2N2LCBicGY6IEV4
dHJhY3QgZW1pdF9zdHgoKSBoZWxwZXIKPj4+IMKgwqAgcmlzY3YsIGJwZjogRXh0cmFjdCBlbWl0
X3N0KCkgaGVscGVyCj4+PiDCoMKgIHJpc2N2LCBicGY6IEV4dHJhY3QgZW1pdF9sZHgoKSBoZWxw
ZXIKPj4+IMKgwqAgcmlzY3Y6IFNlcGFyYXRlIHRvb2xjaGFpbiBzdXBwb3J0IGRlcGVuZGVuY3kg
ZnJvbSBSSVNDVl9JU0FfWkFDQVMKPj4+IMKgwqAgcmlzY3YsIGJwZjogQWRkIHJ2X2V4dF9lbmFi
bGVkIG1hY3JvIGZvciBydW50aW1lIGRldGVjdGlvbiBleHRlbnRzaW9uCj4+PiDCoMKgIHJpc2N2
LCBicGY6IEFkZCBaYWNhcyBpbnN0cnVjdGlvbnMKPj4+IMKgwqAgcmlzY3YsIGJwZjogT3B0aW1p
emUgY21weGNoZyBpbnNuIHdpdGggWmFjYXMgc3VwcG9ydAo+Pj4gwqDCoCByaXNjdiwgYnBmOiBB
ZGQgZXhfaW5zbl9vZmYgYW5kIGV4X2ptcF9vZmYgZm9yIGV4Y2VwdGlvbiB0YWJsZQo+Pj4gwqDC
oMKgwqAgaGFuZGxpbmcKPj4+IMKgwqAgcmlzY3YsIGJwZjogQWRkIHN1cHBvcnQgYXJlbmEgYXRv
bWljcyBmb3IgUlY2NAo+Pj4gwqDCoCBzZWxmdGVzdHMvYnBmOiBFbmFibGUgYXJlbmEgYXRvbWlj
cyB0ZXN0cyBmb3IgUlY2NAo+Pj4KPj4+IMKgIGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxIC0KPj4+
IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgNiArLQo+Pj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+PiDCoCBhcmNoL3Jp
c2N2L25ldC9icGZfaml0LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDcwICsrLQo+Pj4gwqAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1MTYgKysrKystLS0tLS0tLS0tLS0tCj4+PiDCoCAu
Li4vc2VsZnRlc3RzL2JwZi9wcm9ncy9hcmVuYV9hdG9taWNzLmPCoMKgwqDCoMKgwqAgfMKgwqAg
OSArLQo+Pj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAyMTQgaW5zZXJ0aW9ucygrKSwgMzg5IGRlbGV0
aW9ucygtKQo+Pgo+PiBXaGF0IGEgbmljZSBzZXJpZXMhIFRoZSBiZXN0IGtpbmQgb2YgY2hhbmdl
c2V0IC0tIG5ldyBmZWF0dXJlLCBsZXNzCj4+IGNvZGUhIFRoYW5rIHlvdSwgTGVodWkhIEFnYWlu
LCBhcG9sb2dpZXMgZm9yIHRoZSBob3JyaWJsZSBTTEEuIFRoZQo+PiB3ZWF0aGVyIGluIFN3ZWRl
biB3YXMgc2ltcGx5IFRvbyBHb29kIHRoaXMgc3VtbWVyIQo+IAo+IFNvdW5kcyBsaWtlIGEgZ3Jl
YXQgdmFjYXRpb24hCgpUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcyEgSSBqdXN0IHRvb2sgdGhp
cyBpbnRvIGJwZi1uZXh0LCBwbGVhc2UgYWxzbwptYWtlIHN1cmUgdG8gYWRkcmVzcyB0aGUgc21h
bGwgZm9sbG93LXVwIHJlcXVlc3QgZnJvbSBCam9ybi4KCj4+IFRlc3RlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPiAjIFFFTVUgb25seQo+PiBBY2tlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KClRoYW5rcywKRGFuaWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
