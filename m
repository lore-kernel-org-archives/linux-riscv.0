Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B88C47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMjsEpq6Ldq1DUKjOTckX4K4lcm0bHw4ZqBB9zVC1N4=; b=bsdyvtj5szyeSu
	9bIGuYiHbyoazmcFboVTEYYVY+WK8jvY2r8eD80CrWE741czeIILAjB5DBnrnC4LFAvPwEds4IW9J
	Ko7xCb8ZfMrGhMVmDPexAwnm2RHPrpAOoXrqScJZM364cA2lGkGQ756S9+wc7SWgbPThG+qWIhix1
	eqVY7IkJfTWPXKJeuNSil2EQi+FPCuEbb7eXsi8pkpWDOKj4lHlLyy6q+s7EHIaapsj9gyTT45msb
	RnQ11Kh2ApFflFMlGQylHArfv93qtsk6y3otzrOWFNXt+tRejWy+KULBqKbluy8mWCt+tPBb3LiC/
	4c8QZEpSuN/oMaNISgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVU2H-00000007PJc-1Zp5;
	Thu, 01 Feb 2024 10:11:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVU2E-00000007PIo-2sVG
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 10:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32F5ECE257F;
	Thu,  1 Feb 2024 10:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1183C43390;
	Thu,  1 Feb 2024 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706782258;
	bh=kNpL087SdTjcpHpZyVDVxwYbgFh8TGavz5zFaqFwx9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HUZcF9T20LH5e967YRRqhKtkEzGG4/wImL8agSCSMROtzuPTo5wxkrHi8X2bPfk43
	 GCIHf0ozPYQ/ZxXgsbkEuvC6hEal/smcL0umPsIak4Qfgcp/Jm9XOgd7Gd3luyibVc
	 JhXeNbVaYqFdQyQHbop8xfeg4NU8vog1t7OMJh++kPawtlRmpsDla6p7QUvsCYUMd2
	 Zsb+Pibhxk6hsD80w1VLYcVx2Bxdk8dWKK6p0ViXP/YSkIh7xYe+6h+3ubHCPf8c+G
	 UP/swblYGgpBa49CYmBU2FKpCbCGXRRSawTajia0vXJljo0fZlKnbB6cbgVhunLSXp
	 IcAy6LT3+IdJA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
In-Reply-To: <fab22b9e-7b56-4fef-ba92-bf62ec43007d@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-5-pulehui@huaweicloud.com>
 <87sf2eohj2.fsf@all.your.base.are.belong.to.us>
 <fab22b9e-7b56-4fef-ba92-bf62ec43007d@huaweicloud.com>
Date: Thu, 01 Feb 2024 11:10:55 +0100
Message-ID: <878r44mr4g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_021106_914618_7EEF6879 
X-CRM114-Status: UNSURE (   7.08  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+Pj4gQEAgLTI1Miwx
MCArMjIwLDcgQEAgc3RhdGljIHZvaWQgX19idWlsZF9lcGlsb2d1ZShib29sIGlzX3RhaWxfY2Fs
bCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCj4+PiAgIAkJZW1pdF9sZChSVl9SRUdfUzUs
IHN0b3JlX29mZnNldCwgUlZfUkVHX1NQLCBjdHgpOwo+Pj4gICAJCXN0b3JlX29mZnNldCAtPSA4
Owo+Pj4gICAJfQo+Pj4gLQlpZiAoc2Vlbl9yZWcoUlZfUkVHX1M2LCBjdHgpKSB7Cj4+PiAtCQll
bWl0X2xkKFJWX1JFR19TNiwgc3RvcmVfb2Zmc2V0LCBSVl9SRUdfU1AsIGN0eCk7Cj4+PiAtCQlz
dG9yZV9vZmZzZXQgLT0gODsKPj4+IC0JfQo+Pj4gKwllbWl0X2xkKFJWX1JFR19UQ0MsIHN0b3Jl
X29mZnNldCwgUlZfUkVHX1NQLCBjdHgpOwo+PiAKPj4gV2h5IGRvIHlvdSBuZWVkIHRvIHJlc3Rv
cmUgUlZfUkVHX1RDQz8gV2UncmUgcGFzc2luZyBSVl9SRUdfVENDIChhNikgYXMKPj4gYW4gYXJn
dW1lbnQgYXQgYWxsIGNhbGwtc2l0ZXMsIGFuZCBmb3IgdGFpbGNhbGxzIHdlJ3JlIGxvYWRpbmcg
ZnJvbSB0aGUKPj4gc3RhY2suCj4+IAo+PiBJcyB0aGlzIHRvIGZha2UgdGhlIGE2IGFyZ3VtZW50
IGZvciB0aGUgdGFpbC1jYWxsPyBJZiBzbywgaXQncyBiZXR0ZXIgdG8KPj4gbW92ZSBpdCB0byBl
bWl0X2JwZl90YWlsX2NhbGwoKSwgaW5zdGVhZCBvZiBsZXR0aW5nIGFsbCBwcm9ncmFtcyBwYXkg
Zm9yCj4+IGl0Lgo+Cj4gWWVzLCB3ZSBjYW4gcmVtb3ZlIHRoaXMgZHVwbGljYXRlIGxvYWQuIHdp
bGwgZG8gdGhhdCBhdCBuZXh0IHZlcnNpb24uCgpIbW0sIG5vIHJlbW92ZSwgYnV0ICptb3ZlKiBy
aWdodD8gT3RoZXJ3aXNlIGE2IGNhbiBjb250YWluIGdhcmdhYmUgb24KZW50ZXJpbmcgdGhlIHRh
aWxjYWxsPwoKTW92ZSBpdCBiZWZvcmUgX19lbWl0X2VwaWxvZ3VlKCkgaW4gdGhlIHRhaWxjYWxs
LCBubz8KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
