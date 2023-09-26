Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8BDE7E635
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnfDYVF8TPQD3UBFLlxnuReqOrtduQVEpq5eC1UZgks=; b=tyyZRNONzvSSpd
	9sMP3DoKBsiEracdnDSPcOHW6FYswWlTKtXs8A+D87r4TgCvkjHv+VoVo6tovDL7Ooxnkn8kEbmFc
	xsGEOPsd+6iIVXfv0yZTgQhqjmpul4R4o4rzUvh91UUXcKpVrAZ9kM5R8Gbcs5rcxHbqJnKHzXDj8
	iq82nrZ/bANNcFCEF9lfzRGxDGjEoWH/vrdD8fdg6EsXcutJO54Odpyy4meQrZMFlRwndnMRhlsoW
	4hl/dceDGjSoFIua1FzveQHWva1pQDSmYipeT9pqIcXix7SPSkgFtGAGxHN52HILDGKirxULzSoCU
	RUwiw+4bF21EPB8W/eDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql88t-00GTV8-1l;
	Tue, 26 Sep 2023 13:30:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql88r-00GTU1-2X
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 13:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAA186129A;
	Tue, 26 Sep 2023 13:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81973C433C7;
	Tue, 26 Sep 2023 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695735019;
	bh=BuTNpWWd/UAFxk2IYQCtAIX9ygrcQeHn4Wa7NWsusII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ldR49Xpf4JBEqZ3Rc/jRRwnz2VKTfW8HBkk6ZI6ZH+1C+iO2nM/QC0IOmZnphvQe7
	 Kxuj91LbQt1swUkCQlMYWnMfXlikEnFqLYqAW5YsH/BvTLEvwseBEiN0hRDgBHedVe
	 CqF2h8FbLV4DXJuoDLyeEaOK4MLZrDNkGTnDGBYy5zD4m1u3K8EU8pRzdMZjpSqxMX
	 yreHM/bcTyES4ATxki4xFR/6EvMn/yd6DJMieYZOLSeqFHqAN2LK6FPhoZrZ7muSmf
	 lzeQRV9Kl6CrzobN39FJfnCvS1WC8smH/V3wmqJJqy4Dkr9/qVxQzyYbhRQBURlsq8
	 UvskYlen0NJOQ==
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
Subject: Re: [PATCH bpf-next 0/4] Mixing bpf2bpf and tailcalls for RV64
In-Reply-To: <20230919035711.3297256-1-pulehui@huaweicloud.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
Date: Tue, 26 Sep 2023 15:30:14 +0200
Message-ID: <877codoye1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_063021_866882_586556DD 
X-CRM114-Status: GOOD (  10.96  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEluIHRoZSBjdXJy
ZW50IFJWNjQgSklULCBpZiB3ZSBqdXN0IGRvbid0IGluaXRpYWxpemUgdGhlIFRDQyBpbiBzdWJw
cm9nLAo+IHRoZSBUQ0MgY2FuIGJlIHByb3BhZ2F0ZWQgZnJvbSB0aGUgcGFyZW50IHByb2Nlc3Mg
dG8gdGhlIHN1YnByb2Nlc3MsIGJ1dAo+IHRoZSBUQ0Mgb2YgdGhlIHBhcmVudCBwcm9jZXNzIGNh
bm5vdCBiZSByZXN0b3JlZCB3aGVuIHRoZSBzdWJwcm9jZXNzCj4gZXhpdHMuIFNpbmNlIHRoZSBS
VjY0IFRDQyBpcyBpbml0aWFsaXplZCBiZWZvcmUgc2F2aW5nIHRoZSBjYWxsZWUgc2F2ZWQKPiBy
ZWdpc3RlcnMgaW50byB0aGUgc3RhY2ssIHdlIGNhbm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZlZCBy
ZWdpc3RlciB0bwo+IHBhc3MgdGhlIFRDQywgb3RoZXJ3aXNlIHRoZSBvcmlnaW5hbCB2YWx1ZSBv
ZiB0aGUgY2FsbGVlIHNhdmVkIHJlZ2lzdGVyCj4gd2lsbCBiZSBkZXN0cm95ZWQuIFNvIHdlIGlt
cGxlbWVudGVkIG1peGluZyBicGYyYnBmIGFuZCB0YWlsY2FsbHMKPiBzaW1pbGFyIHRvIHg4Nl82
NCwgaS5lLiB1c2luZyBhIG5vbi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8gdHJhbnNmZXIKPiB0
aGUgVENDIGJldHdlZW4gZnVuY3Rpb25zLCBhbmQgc2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8gdGhl
IHN0YWNrIHRvCj4gcHJvdGVjdCB0aGUgVENDIHZhbHVlLiBBdCB0aGUgc2FtZSB0aW1lLCB3ZSBh
bHNvIGNvbnNpZGVyIHRoZSBzY2VuYXJpbwo+IG9mIG1peGluZyB0cmFtcG9saW5lLgo+Cj4gSW4g
YWRkaXRpb24sIHNvbWUgY29kZSBjbGVhbnMgYXJlIGFsc28gYXR0YWNoZWQgdG8gdGhpcyBwYXRj
aHNldC4KPgo+IFRlc3RzIHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFzc2Vk
LCBhcyB3ZWxsIGFzIHRoZSByZWxhdGl2ZQo+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4KCkFw
b2xvZ2llcyBmb3IgdGhlIHJldmlldyBkZWxheS4gSSdtIHRyYXZlbGxpbmcsIGFuZCB3aWxsIHBp
Y2sgaXQgdXAgQVNBUAp3aGVuIEknbSBiYWNrLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
