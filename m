Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A097AC001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9cytA05aD0NuVO75nDR2cOE/LMgxQZlYc/QmSFdoas=; b=xuyO+FI+hXAvkS
	Hyp3xV/SDPiso/GPSmyRyRTnZyz0hJu9h/aeVh9uap8RhacqZSbat8dJBeXdsUZvj3uL+qfoTU00G
	UYAfG8wy78AVRH9zUXoQ+amFKILjQ1PuZBh7g0C4JaCvelbE+pUpAxiZM5URKss63W6cGihJhCx//
	RcgbZqvELWlNun9LKhZnwGu2Spo2dL69wQxp3/jVK9mCpBUQqeHGDj6JXOaFjgCGoRz1bLlMX6SPh
	FALIkgWIEn8M3GHPx+YR89s/tA2jxPuOVR5nuQW1deBoVivRUFyGrDXO2hS7Ffe0EG4xmQOjaYGcL
	Atz/I0APSLrLKo7ql4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQqy-00GFdQ-1a;
	Mon, 14 Aug 2023 06:15:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQqp-00GFct-07
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 06:14:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C364C6130E;
	Mon, 14 Aug 2023 06:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C65C433C7;
	Mon, 14 Aug 2023 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691993689;
	bh=eTq5lg24E4jKVRcCvUSUIYtJjm4KTPFGD0GKMh0DwbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pwFkuPtx46gDfSQ66A/GRRPyzJjcJt1TI5pNb82BdeWjlND/GZO+giPGpnxXDRVVA
	 TGGBHnuZ+PN07ZH3/NXiuZ7sepOrEs6yvGMslevzLBNWwkoMfYyewErt664hm7hj1Q
	 m11doQknDFzC1bTt5ake8lMFvycE/Bs0dw43da0clEL3pgb8UHUXETDgzHTKKEAhL4
	 wKI2tou1K/8cHSYoJh9t7Np2BQIWIlGO746RNbUYtOtI3yQHk5sY+64TAhP5PgdFCX
	 gdVaHRssYwAKX9ut8WcogxzN3+wAY69OynwpSXeVjVx6pyuZSOlkPSCcbFBN9lyCDE
	 7043B8bPTtE5w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
 conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 kpsingh@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next 0/2] bpf, riscv: use BPF prog pack allocator in
 BPF JIT
In-Reply-To: <87ttt21yd1.fsf@all.your.base.are.belong.to.us>
References: <20230720154941.1504-1-puranjay12@gmail.com>
 <87ttt21yd1.fsf@all.your.base.are.belong.to.us>
Date: Mon, 14 Aug 2023 08:14:46 +0200
Message-ID: <874jl2up49.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_231451_183825_5BBFAE4C 
X-CRM114-Status: GOOD (  16.86  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBQdXJhbmpheSBNb2hh
biA8cHVyYW5qYXkxMkBnbWFpbC5jb20+IHdyaXRlczoKPgo+PiBCUEYgcHJvZ3JhbXMgY3VycmVu
dGx5IGNvbnN1bWUgYSBwYWdlIGVhY2ggb24gUklTQ1YuIEZvciBzeXN0ZW1zIHdpdGggbWFueSBC
UEYKPj4gcHJvZ3JhbXMsIHRoaXMgYWRkcyBzaWduaWZpY2FudCBwcmVzc3VyZSB0byBpbnN0cnVj
dGlvbiBUTEIuIEhpZ2ggaVRMQiBwcmVzc3VyZQo+PiB1c3VhbGx5IGNhdXNlcyBzbG93IGRvd24g
Zm9yIHRoZSB3aG9sZSBzeXN0ZW0uCj4+Cj4+IFNvbmcgTGl1IGludHJvZHVjZWQgdGhlIEJQRiBw
cm9nIHBhY2sgYWxsb2NhdG9yWzFdIHRvIG1pdGlnYXRlIHRoZSBhYm92ZSBpc3N1ZS4KPj4gSXQg
cGFja3MgbXVsdGlwbGUgQlBGIHByb2dyYW1zIGludG8gYSBzaW5nbGUgaHVnZSBwYWdlLiBJdCBp
cyBjdXJyZW50bHkgb25seQo+PiBlbmFibGVkIGZvciB0aGUgeDg2XzY0IEJQRiBKSVQuCj4+Cj4+
IEkgZW5hYmxlZCB0aGlzIGFsbG9jYXRvciBvbiB0aGUgQVJNNjQgQlBGIEpJVFsyXS4gSXQgaXMg
YmVpbmcgcmV2aWV3ZWQgbm93Lgo+Pgo+PiBUaGlzIHBhdGNoIHNlcmllcyBlbmFibGVzIHRoZSBC
UEYgcHJvZyBwYWNrIGFsbG9jYXRvciBmb3IgdGhlIFJJU0NWIEJQRiBKSVQuCj4+IFRoaXMgc2Vy
aWVzIG5lZWRzIGEgcGF0Y2hbM10gZnJvbSB0aGUgQVJNNjQgc2VyaWVzIHRvIHdvcmsuCj4+Cj4+
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
PiBQZXJmb3JtYW5jZSBBbmFseXNpcyBvZiBwcm9nIHBhY2sgYWxsb2NhdG9yIG9uIFJJU0NWNjQK
Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4+Cj4+IFRlc3Qgc2V0dXA6Cj4+ID09PT09PT09PT09Cj4+Cj4+IEhvc3QgbWFjaGluZTogRGVi
aWFuIEdOVS9MaW51eCAxMSAoYnVsbHNleWUpCj4+IFFlbXUgVmVyc2lvbjogUUVNVSBlbXVsYXRv
ciB2ZXJzaW9uIDguMC4zIChEZWJpYW4gMTo4LjAuMytkZnNnLTEpCj4+IHUtYm9vdC1xZW11IFZl
cnNpb246IDIwMjMuMDcrZGZzZy0xCj4+IG9wZW5zYmkgVmVyc2lvbjogMS4zLTEKPj4KPj4gVG8g
dGVzdCB0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlIEJQRiBwcm9nIHBhY2sgYWxsb2NhdG9yIG9uIFJW
LCBhIHN0cmVzc2VyCj4+IHRvb2xbNF0gbGlua2VkIGJlbG93IHdhcyBidWlsdC4gVGhpcyB0b29s
IGxvYWRzIDggQlBGIHByb2dyYW1zIG9uIHRoZSBzeXN0ZW0gYW5kCj4+IHRyaWdnZXJzIDUgb2Yg
dGhlbSBpbiBhbiBpbmZpbml0ZSBsb29wIGJ5IGRvaW5nIHN5c3RlbSBjYWxscy4KPj4KPj4gVGhl
IHJ1bm5lciBzY3JpcHQgc3RhcnRzIDIwIGluc3RhbmNlcyBvZiB0aGUgYWJvdmUgd2hpY2ggbG9h
ZHMgOCoyMD0xNjAgQlBGCj4+IHByb2dyYW1zIG9uIHRoZSBzeXN0ZW0sIDUqMjA9MTAwIG9mIHdo
aWNoIGFyZSBiZWluZyBjb25zdGFudGx5IHRyaWdnZXJlZC4KPj4gVGhlIHNjcmlwdCBpcyBwYXNz
ZWQgYSBjb21tYW5kIHdoaWNoIHdvdWxkIGJlIHJ1biBpbiB0aGUgYWJvdmUgZW52aXJvbm1lbnQu
Cj4+Cj4+IFRoZSBzY3JpcHQgd2FzIHJ1biB3aXRoIGZvbGxvd2luZyBwZXJmIGNvbW1hbmQ6Cj4+
IC4vcnVuLnNoICJwZXJmIHN0YXQgLWEgXAo+PiAgICAgICAgIC1lIGlUTEItbG9hZC1taXNzZXMg
XAo+PiAgICAgICAgIC1lIGRUTEItbG9hZC1taXNzZXMgIFwKPj4gICAgICAgICAtZSBkVExCLXN0
b3JlLW1pc3NlcyBcCj4+ICAgICAgICAgLWUgaW5zdHJ1Y3Rpb25zIFwKPj4gICAgICAgICAtLXRp
bWVvdXQgNjAwMDAiCj4+Cj4+IFRoZSBvdXRwdXQgb2YgdGhlIGFib3ZlIGNvbW1hbmQgaXMgZGlz
Y3Vzc2VkIGJlbG93IGJlZm9yZSBhbmQgYWZ0ZXIgZW5hYmxpbmcgdGhlCj4+IEJQRiBwcm9nIHBh
Y2sgYWxsb2NhdG9yLgo+Pgo+PiBUaGUgdGVzdHMgd2VyZSBydW4gb24gcWVtdS1zeXN0ZW0tcmlz
Y3Y2NCB3aXRoIDggY3B1cywgMTZHIG1lbW9yeS4gVGhlIHJvb3Rmcwo+PiB3YXMgY3JlYXRlZCB1
c2luZyBCam9ybidzIHJpc2N2LWNyb3NzLWJ1aWxkZXJbNV0gZG9ja2VyIGNvbnRhaW5lciBsaW5r
ZWQgYmVsb3cuCj4KPiBCYWNrIGluIHRoZSBzYWRkbGUhIFNvcnJ5IGZvciB0aGUgaG9ycmlibHkg
bGF0ZSByZXBseS4uLgo+Cj4gRGlkIHlvdSBydW4gdGhlIHRlc3RfcHJvZ3Mga3NlbGZ0ZXN0IHRl
c3QsIGFuZCBwYXNzZWQgdy9vIHJlZ3Jlc3Npb25zPyBJCj4gcmFuIGEgdGVzdCB3aXRob3V0L3dp
dGggeW91ciBzZXJpZXMgKHBsdXMgdGhlIHBhdGNoIGZyb20gdGhlIGFybTY0Cj4gc2VyaWVzIHRo
YXQgeW91IHBvaW50ZWQgb3V0KSwgYW5kIEknbSBnZXR0aW5nIHJlZ3Jlc3Npb25zIHdpdGggdGhp
cwo+IHNlcmllczoKPgo+IHcvbyBTdW1tYXJ5OiAzMTgvMzExNCBQQVNTRUQsIDI3IFNLSVBQRUQs
IDYwIEZBSUxFRAo+IHcvICBTdW1tYXJ5OiAyOTkvMzAyNiBQQVNTRUQsIDMzIFNLSVBQRUQsIDc5
IEZBSUxFRAo+Cj4gSSdtIGRpZCB0aGUgdGVzdCBvbiBjb21taXQgNGM3NWJmN2U0YTBlICgiTWVy
Z2UgdGFnCj4gJ2tidWlsZC1maXhlcy12Ni41LTInIG9mCj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21hc2FoaXJveS9saW51eC1rYnVpbGQiKS4KPgo+IEkn
bSByZS1ydW5uaW5nLCBhbmQgaW52ZXN0aWdhdGluZyBub3cuCgpJIGhhZCBhIGJhZCBlbnZpcm9u
bWVudCBvbiBmb3IgdGhlIHJlYnVpbGQ7IEEgcHJvcGVyIHJlYnVpbGQgd29ya2VkLiBObwpyZWdy
ZXNzaW9ucy4gU29ycnkgZm9yIHRoZSBub2lzZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
