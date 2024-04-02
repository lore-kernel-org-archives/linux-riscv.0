Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99745CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gz0o+8YmvZ/XQofrVLDETIcejnnO3gPBhDs8SmTjNoQ=; b=1lZAWfNR0NMnAE
	zEAn378Q7/id6wfV1GNGtN9iHpQV7p5G7BfakTe0Ym0S61RMyb2n7h74XGNt8CXw9BUkzLiUq9Zti
	XkAEbLMBfCbMol25rItguKaFqj9kzqCjW4e9snW4c7cnhur5gQ7ambZc4ZCrhxnqWyAlLdJorm6Z7
	mIBCyc+L1/tlEx8vptcOJ2t6f1aOLSf+lknIUrMUlrX0yZAWv3LWr8nBfVBkO+WQOvM3rSUl/ckia
	70ItL2QxjqMKuRdas8lR+bT1ZUkGUKvOdxzLinFSJKWcSnCUfxa9GJCWNbk2AwU0n6rjCZGiLejv1
	g9KbAoUGVxC9wTHZ2N4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rreOn-0000000BOrS-118V;
	Tue, 02 Apr 2024 13:42:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rreOk-0000000BOqN-2740
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 13:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB30160FE5;
	Tue,  2 Apr 2024 13:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0194BC433C7;
	Tue,  2 Apr 2024 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712065317;
	bh=h261wTULooISsYtb6+TmMP33loVu5QDHmmBO7yc6Ggo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IcCMCPMOf8zIl358tEnMsbCmxFeHbcpDV+e6r8KULCJpgOsp/YwF8/BTFb+BrSOoW
	 pyyg5ufFumXX5FtAbyCOyiC0GkfXWAvK1Xqdu+z2w3NlNZQrYvHwXiKOZ/H7hRukc0
	 iqRloDI+sBHF/55tPw9lEeHOoHbJANigyCJ7Lcjr7oVsG1AwZkS1yKTrvtw/kzSPk6
	 u3Y0mJ+whvFHbkF26tRfSOSksHQp0ne99KsFogfw8IdXmsNHPEAEWvmulXBX79pyXr
	 4YdR9pfekieTs0/BAUpxTeq+rUJwRrjrHsuDnd46NUA2Z390UuXZusWlA3g0oOHG2q
	 Rs+tljYe/g+gA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 0/2] Add 12-argument support for RV64 bpf
 trampoline
In-Reply-To: <20240331092405.822571-1-pulehui@huaweicloud.com>
References: <20240331092405.822571-1-pulehui@huaweicloud.com>
Date: Tue, 02 Apr 2024 15:41:54 +0200
Message-ID: <87plv7rie5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_064158_638342_A891F1AF 
X-CRM114-Status: UNSURE (   6.01  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IFRoaXMgcGF0Y2gg
YWRkcyAxMiBmdW5jdGlvbiBhcmd1bWVudHMgc3VwcG9ydCBmb3IgcmlzY3Y2NCBicGYKPiB0cmFt
cG9saW5lLiBUaGUgY3VycmVudCBicGYgdHJhbXBvbGluZSBzdXBwb3J0cyA8PSBzaXplb2YodTY0
KSBieXRlcwo+IHNjYWxhciBhcmd1bWVudHMgWzBdIGFuZCA8PSAxNiBieXRlcyBzdHJ1Y3QgYXJn
dW1lbnRzIFsxXS4gVGhlcmVmb3JlLCB3ZQo+IGZvY3VzIG9uIHRoZSBzaXR1YXRpb24gd2hlcmUg
c2NhbGFycyBhcmUgYXQgbW9zdCBYTEVOIGJpdHMgYW5kCj4gYWdncmVnYXRlcyB3aG9zZSB0b3Rh
bCBzaXplIGRvZXMgbm90IGV4Y2VlZCAyw5dYTEVOIGJpdHMgaW4gdGhlIHJpc2N2Cj4gY2FsbGlu
ZyBjb252ZW50aW9uIFsyXS4KPgo+IExpbms6IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2Ljgvc291cmNlL2tlcm5lbC9icGYvYnRmLmMjTDYxODQgWzBdCj4gTGluazogaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC9zb3VyY2Uva2VybmVsL2JwZi9idGYuYyNM
Njc2OSBbMV0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1l
bGYtcHNhYmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL2RyYWZ0LTIwMjMwOTI5LWU1YzgwMGU2NjFh
NTNlZmUzYzI2NzhkNzFhMzA2MzIzYjYwZWIxM2IvcmlzY3YtYWJpLnBkZiBbMl0KPgo+IFB1IExl
aHVpICgyKToKPiAgIHJpc2N2LCBicGY6IEFkZCAxMi1hcmd1bWVudCBzdXBwb3J0IGZvciBSVjY0
IGJwZiB0cmFtcG9saW5lCj4gICBzZWxmdGVzdHMvYnBmOiBBZGQgdGVzdGNhc2Ugd2hlcmUgN3Ro
IGFyZ21lbnQgaXMgc3RydWN0CgpUaGFuayB5b3UhCgpGb3IgdGhlIHNlcmllczoKCkFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
