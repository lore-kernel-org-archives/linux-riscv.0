Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525CC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+DenwwWkKbybE/9MRm8JrumXicHuAv2Z+sh6LLml+4=; b=E1PsnHLK2odOn/
	DKZSjIaNmJ2KukgB7r2gtZeekRpghW9he+tg36CSYaDVwXvlVNW2myHD/FiaHxCT8Zdm+ZVaPp9jr
	TdeAMyfD91sEuypg0HhnA06o21m9JnXS+BFdB17LSf/vN0UIPN3EyxBfBkjfq/eridqLi3ycSdWXE
	Osck6z6Vinbg40fhiROpl/l7yTXlNkwlHJ5oAGo/ZY4MEduNUBiU6O3vpsdtKXPAAtY+KutOGVBz8
	zy2VRCbzQwUf164KQQ9NV3rQ8xaMx3AU9sDaKcyJV5uuzpad6kDhffBjdzhfC44uYyA0dwJzBWAP6
	evDynEw36W2rJB7es3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojuT-0021nP-2o;
	Tue, 18 Apr 2023 11:54:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojuR-0021mT-2w
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 11:54:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AEC86247D;
	Tue, 18 Apr 2023 11:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21D8C433A1;
	Tue, 18 Apr 2023 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681818846;
	bh=AXG/C2BTZBum1dQyk9xGMcX+JvRAly8xQcU58qub2TY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YWm19zFa301nIsz39oDFn59dpZkUCH2MAVqlW5HDdaX1rAdGSRB1o1hw8xpyfUcxk
	 X9anxNHN9gXA711KO6QVbkC9vMQMmrEWLPfg0SpYzrhLQpuxuk8Bg+/XgY+V8O/PDX
	 3PAGR0NoOWjjFH4zYUdlavCcVT0IVvyXbuj4WOZMM4X7384z7GeQjLXcfkDp5IVA0v
	 cL5b7JyDHDBPPv7XW4tJDJsijvZAtKItqU2bI2OzA69vUdtHjcmS/I5PoG/PEXLzgf
	 lwtKNF5/+RRFRs4mUP+TEyi5xupeCBi1Zz4Y9Z65SKbw4disf506aJnBYryW1r3JVR
	 YgXncspNH3AwA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Aleksandr Nogikh <nogikh@google.com>, pulehui@huawei.com,
 bpf@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <ast@kernel.org>
Subject: Re: arch/riscv/net/bpf_jit_comp64.c build error
In-Reply-To: <CANp29Y6YqPbE9Y3iQEaTwD_YAQBvsxxRE=0COVYy=gBP-USvkg@mail.gmail.com>
References: <CANp29Y6YqPbE9Y3iQEaTwD_YAQBvsxxRE=0COVYy=gBP-USvkg@mail.gmail.com>
Date: Tue, 18 Apr 2023 13:54:03 +0200
Message-ID: <871qkh9zj8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_045408_013106_7D3BAF54 
X-CRM114-Status: GOOD (  12.40  )
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

QWxla3NhbmRyIE5vZ2lraCA8bm9naWtoQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gSGkgUHUgTGVo
dWksCj4KPiBJJ20gd3JpdGluZyB0byB5b3UgcmVnYXJkaW5nIHlvdXIgZm9sbG93aW5nIHBhdGNo
Lgo+Cj4gQXV0aG9yOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IERhdGU6ICAgV2Vk
IEZlYiAxNSAyMTo1MjowNCAyMDIzICswODAwCj4KPiAgICAgcmlzY3YsIGJwZjogQWRkIGJwZl9h
cmNoX3RleHRfcG9rZSBzdXBwb3J0IGZvciBSVjY0Cj4KPiBXaGVuIHRyeWluZyB0byBjb21waWxl
IHRoZSAiZml4ZXMiIGJyYW5jaCBvZiB0aGUKPiAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdCIgdHJlZSwKPiBzeXpib3QgZ2V0cyB0
aGUgZm9sbG93aW5nIGVycm9yOgo+Cj4gYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYzog
SW4gZnVuY3Rpb24gJ2JwZl9hcmNoX3RleHRfcG9rZSc6Cj4gYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYzo2OTE6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mCj4gZnVuY3Rp
b24gJ3BhdGNoX3RleHQnOyBkaWQgeW91IG1lYW4gJ3BhdGhfZ2V0Jz8KPiBbLVdlcnJvcj1pbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDY5MSB8ICAgcmV0ID0gcGF0Y2hfdGV4dChp
cCwgbmV3X2luc25zLCBuaW5zbnMpOwo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+Cj4gICAg
ICAgfCAgICAgICAgIHBhdGhfZ2V0Cj4KPiBGV0lXIHRoZSBjb21waWxlciBpcyByaXNjdjY0LWxp
bnV4LWdudS1nY2MgKERlYmlhbiAxMC4yLjEtNikgMTAuMi4xCj4gMjAyMTAxMTAsIEdOVSBsZCAo
R05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIuMzUuMi4KPgo+IENvdWxkIHlvdSBwbGVhc2UgdGFr
ZSBhIGxvb2s/CgpSYW5keSBzZW50IGEgZml4IGZvciB0aGlzIFsxXSwgd2hpY2ggd2VudCBpbiB2
aWEgdGhlIEJQRiB0cmVlLiBQdWxsIGluCmNvbW1pdCAyZDMxMWY0ODBiNTIgKCJyaXNjdiwgYnBm
OiBGaXggcGF0Y2hfdGV4dCBpbXBsaWNpdCBkZWNsYXJhdGlvbiIpLgoKCkJqw7ZybgoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwMjI3MDcyMDE2LjE0NjE4LTEt
cmR1bmxhcEBpbmZyYWRlYWQub3JnLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
