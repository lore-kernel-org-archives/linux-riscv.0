Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9470CE7B17
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GORYzdRzVhWi8w1FJhzHdW+X945Z7yqe6JoY1jKeRM=; b=RRxlCO0wxe2Gd3
	tRZbDYbdiBODTnUtdlsGCDx+eZ+QgK6cVvK0+5hZ3xZPERyTRAPQomNsfnIxOgukrqv70i1BdNUfz
	L6en69luQS7opIDoqhmi7CEpyjCniyYLmwsC2KZp0eO+6oCJl8r0RJN9vld5Sq9tlQU3f/br2FzsE
	fl1dex9E0XNr0BWDomq3Y/rHPieaBYEpAEAh5BbTCwqhyLJ/GmO7gqkRr+9Ky8GFBTUAEGAiKgKhh
	p1X6tvdbn2i2XlQeWJtIM31hh7jnlAxSMvQ5aRUMS6EpW8T2FeoaYPcS4RaD/J+uw8W/eXO+JBd7b
	GqLjKREUF19LLGE01QIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnny-002muM-2g;
	Thu, 28 Sep 2023 09:59:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnnu-002mt2-2O
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 09:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9BA8FB81B21;
	Thu, 28 Sep 2023 09:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6806DC433C7;
	Thu, 28 Sep 2023 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695895168;
	bh=9srMMotEqbhbBuL+dYXb0BtYM8i9fxU6uHTLigNDg/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mu8PV3nmlz33FGq3etKSxi+cMml8leJ/Li1y7N5wrOdfIOj2FZyuUlbyHAa5ZeV4r
	 XTIhuq+zf4wUpLusnjDuPBc6IWKHEoZbWl5WSAUGep+xKmDMaHjFqNWcGDHAPqTt5I
	 e7s6grZP5ija4rCqRIpRPQVLMxv9MGdEI+FmiGBiZBS6vCm6ttVdBo5esxqIiPM84H
	 UAD6mfR9lHciesi4gxZbfAt1m6ICIjDv56CUolSFnUrMbLt2ObZjWKGMNDrn/JSEZx
	 EFRY1h9sSgOtEfbRMfYGH3vcrcl5xJSuhAGspGiK+ZZf//0LkU1WWWOpoydA10FxRE
	 VCWzYgOJBr2kw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
In-Reply-To: <20230919035711.3297256-5-pulehui@huaweicloud.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 11:59:24 +0200
Message-ID: <87lecqobyb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_025930_933113_EDE61E3C 
X-CRM114-Status: GOOD (  14.36  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBJbiB0aGUgY3VycmVudCBSVjY0IEpJVCwgaWYg
d2UganVzdCBkb24ndCBpbml0aWFsaXplIHRoZSBUQ0MgaW4gc3VicHJvZywKPiB0aGUgVENDIGNh
biBiZSBwcm9wYWdhdGVkIGZyb20gdGhlIHBhcmVudCBwcm9jZXNzIHRvIHRoZSBzdWJwcm9jZXNz
LCBidXQKPiB0aGUgVENDIG9mIHRoZSBwYXJlbnQgcHJvY2VzcyBjYW5ub3QgYmUgcmVzdG9yZWQg
d2hlbiB0aGUgc3VicHJvY2Vzcwo+IGV4aXRzLiBTaW5jZSB0aGUgUlY2NCBUQ0MgaXMgaW5pdGlh
bGl6ZWQgYmVmb3JlIHNhdmluZyB0aGUgY2FsbGVlIHNhdmVkCj4gcmVnaXN0ZXJzIGludG8gdGhl
IHN0YWNrLCB3ZSBjYW5ub3QgdXNlIHRoZSBjYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8KPiBwYXNz
IHRoZSBUQ0MsIG90aGVyd2lzZSB0aGUgb3JpZ2luYWwgdmFsdWUgb2YgdGhlIGNhbGxlZSBzYXZl
ZCByZWdpc3Rlcgo+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3ZSBpbXBsZW1lbnRlZCBtaXhpbmcg
YnBmMmJwZiBhbmQgdGFpbGNhbGxzCj4gc2ltaWxhciB0byB4ODZfNjQsIGkuZS4gdXNpbmcgYSBu
b24tY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvIHRyYW5zZmVyCj4gdGhlIFRDQyBiZXR3ZWVuIGZ1
bmN0aW9ucywgYW5kIHNhdmluZyB0aGF0IHJlZ2lzdGVyIHRvIHRoZSBzdGFjayB0bwo+IHByb3Rl
Y3QgdGhlIFRDQyB2YWx1ZS4gQXQgdGhlIHNhbWUgdGltZSwgd2UgYWxzbyBjb25zaWRlciB0aGUg
c2NlbmFyaW8KPiBvZiBtaXhpbmcgdHJhbXBvbGluZS4KCkhpIQoKVGhlIFJJU0MtViBKSVQgdHJp
ZXMgdG8gbWluaW1pemUgdGhlIHN0YWNrIHVzYWdlLCBlLmcuIGl0IGRvZXNuJ3QgaGF2ZSBhCmZp
eGVkIHByby9lcGlsb2d1ZSBsaWtlIHNvbWUgb2YgdGhlIG90aGVyIEpJVHMuIEkgdGhpbmsgd2Ug
Y2FuIGRvIGJldHRlcgpoZXJlLCBzbyB0aGF0IHRoZSBwYXNzLVRDQy12aWEtcmVnaXN0ZXIgY2Fu
IGJlIHVzZWQsIGFuZCB0aGUgYWRkaXRpb25hbApzdGFjayBhY2Nlc3MgY2FuIGJlIGF2b2lkZWQu
CgpUb2RheSwgdGhlIFRDQyBpcyBwYXNzZWQgdmlhIGEgcmVnaXN0ZXIgKGE2KSBhbmQgY2FuIGJl
IHZpZXdlZCBhcyBhCiJzdGF0ZSIgdmFyaWFibGUvdHJhbnNwYXJlbnQgYXJndW1lbnQvcmV0dXJu
IHZhbHVlLiBBcyB5b3UgcG9pbnQgb3V0LCB3ZQpsb29zZSB0aGlzIHdoZW4gd2UgZG8gYSBjYWxs
LiBPbiAoYW55KSBjYWxscyB3ZSBtb3ZlIHRoZSBUQ0MgdG8gYQpjYWxsZWUtc2F2ZWQgcmVnaXN0
ZXIuCgpXRFlUIGFib3V0IHRoZSBmb2xsb3dpbmcgc2NoZW1lOgoKMSBQaWNrdXAgdGhlIGFybTY0
IGJwZjJicGYvdGFpbG1peCBtZWNoYW5pc20gb2YganVzdCBjbGVhcmluZyB0aGUgVENDCiAgZm9y
IHRoZSBtYWluIHByb2dyYW0uCjIgRm9yIEJQRiBoZWxwZXIgY2FsbHMsIG1vdmUgVENDIHRvIHM2
LCBwZXJmb3JtIHRoZSBjYWxsLCBhbmQgcmVzdG9yZQogIGE2LiBEaXRvIGZvciBrZnVuYyBjYWxs
cyAoQlBGX1BTRVVET19LRlVOQ19DQUxMKS4KMyBGb3IgYWxsIG90aGVyIGNhbGxzLCBhNiBpcyBw
YXNzZWQgdHJhbnNwYXJlbnRseS4KCkZvciAyIGJwZl9qaXRfZ2V0X2Z1bmNfYWRkcigpIGNhbiBi
ZSB1c2VkIHRvIGRldGVybWluZSBpZiB0aGUgY2FsbGVlIGlzCmEgQlBGIGhlbHBlciBvciBub3Qu
CgpJbiBzdW1tYXJ5OyBEZXRlcm1pbmUgaW4gdGhlIEpJVCBpZiB3ZSdyZSBsZWF2aW5nIEJQRi1s
YW5kLCBhbmQgbmVlZCB0bwptb3ZlIHRoZSBUQ0MgdG8gYSBjYWxsZWUtc2F2ZWQgcmVnLCBvciBu
b3QsIGFuZCBzYXZlIHVzIGEgYnVuY2ggb2Ygc3RhY2sKc3RvcmUvbG9hZHMuCgoKQmrDtnJuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
