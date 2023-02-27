Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218A4C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grGBsJ0vi/bxrS6pv2Rx5GG08sk/DyY6483wW/BNK5c=; b=Af+S61z+uR+Fek
	BTA0GuM+zqlCLquP2hRIeEErH0Yx7dhnpI24AISR+BZnZM/mtjAPBnfN3zp6/gbxNt7t7UxlZkKq3
	9yBST1g63plA0F13KRe9fhz7Y7vGhOoPy86+jzscWLPZVYAklE42NIbRFv8A2kY9fQXmEM1oKTHiF
	diEoBBs9YPM7YlSZYjDz7RaWXUWMbEItAtWexc4EhKRjrjGZFxahMIgTaXkMHYV1VviiouZxDmwsB
	U7alkpNDn43wsv9qPBohboOgkzs12eTGQty+6kiCbqFl6XMErxKt2qd13NtXrYZehpS4pckoatlqt
	JJ4QY278/u8Iq29aghvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXyb-008g1c-MJ; Mon, 27 Feb 2023 07:31:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXyX-008fyj-QM
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 07:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6ADC1CE0EFE;
	Mon, 27 Feb 2023 07:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A22C433D2;
	Mon, 27 Feb 2023 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677483063;
	bh=BKhCyAlJfue3qCvD5gMnMzJg0H76KaUopSvrz0ZoyQg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TmYqZkRB9HOHTkjyN7ucvV530Ru4DXBhtuoiDpIFeWrO3r2bKRVAwQKDNeDMIP7Dd
	 4aEL0nX1rwJLEjcHPAKMejx+PHjv1Yj6kG6SnnLmxPOPedgTMTs6036OrC9HUHFQjs
	 uiFtLbPkV8SE90m52pllzCmbaOTq4+EgyYAT/4eNPCFjUkJJFNZzbMaBNhj1Ommm/x
	 rnquABFHmNe0jHm2Z237hJoiAceY4lW+jm6FXDSQdiIl1qIvKnhr3+1L7vL3TVDQZ/
	 Ykl4AYR0En6yYRwdWOe5FtD1fArR1VoDgMRNjwhscOw54Y67Xkdd14SYEjlU6EPwXF
	 Kp73Qnt9Gmmug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Pu Lehui <pulehui@huawei.com>, Luke Nelson <luke.r.nels@gmail.com>, Xi
 Wang <xi.wang@gmail.com>, bpf@vger.kernel.org, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf v2] riscv, bpf: fix patch_text implicit declaration
In-Reply-To: <20230227072016.14618-1-rdunlap@infradead.org>
References: <20230227072016.14618-1-rdunlap@infradead.org>
Date: Mon, 27 Feb 2023 08:31:01 +0100
Message-ID: <87k003a7ka.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_233110_069536_A669B64F 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyaXRlczoKCj4gYnBmX2ppdF9j
b21wNjQuYyB1c2VzIHBhdGNoX3RleHQoKSwgc28gYWRkIDxhc20vcGF0Y2guaD4gdG8gaXQKPiB0
byBwcmV2ZW50IHRoZSBidWlsZCBlcnJvcjoKPgo+IC4uL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmM6IEluIGZ1bmN0aW9uICdicGZfYXJjaF90ZXh0X3Bva2UnOgo+IC4uL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmM6NjkxOjIzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24gJ3BhdGNoX3RleHQnOyBkaWQgeW91IG1lYW4gJ3BhdGhfZ2V0Jz8gWy1X
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICA2OTEgfCAgICAgICAgICAg
ICAgICAgcmV0ID0gcGF0Y2hfdGV4dChpcCwgbmV3X2luc25zLCBuaW5zbnMpOwo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KPgo+IEZpeGVzOiA1OTZmMmU2ZjljZjQg
KCJyaXNjdiwgYnBmOiBBZGQgYnBmX2FyY2hfdGV4dF9wb2tlIHN1cHBvcnQgZm9yIFJWNjQiKQo+
IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwMjI3MTAwMC5BajRuTVhiWi1sa3BAaW50ZWwuY29t
Cj4gQ2M6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gQ2M6IEx1a2UgTmVsc29uIDxs
dWtlLnIubmVsc0BnbWFpbC5jb20+Cj4gQ2M6IFhpIFdhbmcgPHhpLndhbmdAZ21haWwuY29tPgo+
IENjOiBicGZAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtl
cm5lbC5vcmc+Cj4gQ2M6IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+Cj4g
Q2M6IEpvaG4gRmFzdGFiZW5kIDxqb2huLmZhc3RhYmVuZEBnbWFpbC5jb20+Cj4gQ2M6IEFuZHJp
aSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwu
d2FsbXNsZXlAc2lmaXZlLmNvbT4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0
LmNvbT4KPiBDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gQ2M6ICJCasO2
cm4gVMO2cGVsIiA8Ympvcm5Aa2VybmVsLm9yZz4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IC0tLQo+IHYyOiBhZGQgaGVhZGVyIGZpbGUgZGlyZWN0bHkgdG8gYnBmX2pp
dF9jb21wNjQuYyAoUHUgTGVodWkpCj4gICAgIGNoYW5nZSBwYXRjaCB0YXJnZXQgdG8gYnBmIChm
b3IgZml4ZXMpCgpUaGFua3MsIFJhbmR5IQoKRm9yIHRoZSBjdXJpb3VzOyBUaGUgYXNtL3BhdGNo
LmggZmlsZSB3YXMgcGlja2VkIHZpYSBVUFJPQkVTICh2aWEKUEVSRl9FVkVOVFM9eSkuIEZvciBQ
RVJGX0VWRU5UUz1uLCB5b3UgZ2V0IHRoZSBidWlsZCBlcnJvci4KCgpBY2tlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
