Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F349AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdEL0B7akD5X+qXoTAR6wlW9BpbBj4yeNMf87YLpfQ4=; b=AMqQnnPYfyEmbT
	YSY7+Y8U1i/h5vWAGYK8z8dNuIoc0RhpQux9sGX2B1MGYIX0DYrUyOQzqjbIPENXopiGcxiM8oH3r
	hv75PiPEFVHkl14Y6vylYdezRrkyPqRMyZim3Y2W+zVoSyaK09y9P/AuRt821+w2oniv4SzShvLYK
	yIHCp7U3ki0L2SC14KR0VKt9bypkEcW9vFAjqHkpvpsnfh6TX/OEe1WMTSH0aP3F+G6Yv5ElIW5sA
	HQ44YTIrcNN1DSp2CTT7OKhf3ygu1vth3pIHgjXuFU03B9Ex+iOFTf1nvaLoYUr+K4a85cBUdHEKZ
	dSfKqA3tCBbyHo8CDQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKFN-00000000Zgw-16Aa;
	Fri, 12 Apr 2024 16:59:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKFK-00000000Zg9-21mJ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 16:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38EB8CE21F0;
	Fri, 12 Apr 2024 16:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84F9C113CC;
	Fri, 12 Apr 2024 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712941163;
	bh=vjUt8Ss2air20ASfcUx9xukrTcaaeYFx19lixRDlmP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B7PAvxxFsSFHG7ZCnsELk3yzsJDSXiXUwUaoao8fjYeQgunNY5KA0SHMn7Mm2zdTp
	 sVvu012C7X5XqVa215VQ+KY3HWjwFpLMeLnp1Q3ghYPc8Bq+kZMoO6fWOEQwW3XzTk
	 heHhS7uZJYfnMqMGaZ/mJao/tGod1J5x/tbZC+2SveyvvQuBFPoNCbTtyKhckzG8OQ
	 Kud6G/ycDucl9EMm6zAKzZ9kZ94MjqVqyM5d+nS5sv2G9+xPfotvp4oZrH/KTgQe+2
	 LJZxaVycmHkafDql7cJYNvg5YmO8q5NcvPgvJM3v0N4uSsfqhGyWUZlmVPQP3Ynufd
	 esHkLQ+rsTAJw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Andreas
 Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Conor
 Dooley <conor@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
In-Reply-To: <20240412154342.GA1310856@mit.edu>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240412154342.GA1310856@mit.edu>
Date: Fri, 12 Apr 2024 18:59:19 +0200
Message-ID: <87a5lyecuw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_095926_723966_D1767377 
X-CRM114-Status: GOOD (  14.61  )
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

IlRoZW9kb3JlIFRzJ28iIDx0eXRzb0BtaXQuZWR1PiB3cml0ZXM6Cgo+IE9uIEZyaSwgQXByIDEy
LCAyMDI0IGF0IDA0OjU3OjA4UE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEhpIQo+
PiAKPj4gSSd2ZSBiZWVuIGxvb2tpbmcgYXQgYW4gRVhUNCBzcGxhdCBvbiByaXNjdjMyLCB0aGF0
IExLRlQgZm91bmQgWzFdOgo+Cj4gSSdtIGdldHRpbmcgYSAicGFnZSBub3QgZm91bmQiIGZvciBb
MV0/CgpZb3UgYXJlPyBJdCdzIHdvcmtpbmcgZm9yIG1lIQoKPj4gVGhpcyB3YXMgbm90IHByZXNl
bnQgaW4gNi43LiBCaXNlY3Rpb24gd2Fzbid0IHJlYWxseSBoZWxwZnVsICh0byBtZSBhdAo+PiBs
ZWFzdCk7IEkgZ290IGl0IGRvd24gdG8gY29tbWl0IGM2MDQxMTBlNjYyYSAoIk1lcmdlIHRhZyAn
dmZzLTYuOC5taXNjJwo+PiBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdmZzL3ZmcyIpLCBhbmQgd2hlbiBJCj4+IHJldmVydCB0aGUgY29tbWl0cyBpbiB0
aGUgdmZzIG1lcmdlIHRoZSBzcGxhdCB3ZW50IGF3YXksIGJ1dCBJICpyZWFsbHkqCj4+IHN0cnVn
Z2xlIHRvIHNlZSBob3cgdGhvc2UgYXJlIHJlbGF0ZWQuLi4KPgo+IEl0IHNvdW5kcyBsaWtlIHlv
dSBoYXZlIGEgcmVsaWFibGUgcmVwcm87IGlzIGl0IHNvbWV0aGluZyB0aGF0IGNhbiBiZQo+IHN0
cmVhbWxpbmVkIGludG8gYSBzaW1wbGUgdGVzdCBwcm9ncmFtPyAgSWYgc28sIGlzIGl0IHNvbWV0
aGluZyB0aGF0Cj4gY2FuIGJlIHJlcHJvZHVjZWQgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcz8gIEFu
ZCBjb3VsZCB5b3UgbWFrZSBpdAo+IGF2YWlsYWJsZT8KCkl0J3Mga2luZCBvZiBzdHJlYW1saW5l
ZDogTGluYXJvIGhhcyB0aGlzIG5pY2UgInR1eHJ1biIgdG9vbCwgdGhhdCBjYW4KYmUgaW5zdGFs
bGVkIHZpYSBwaXAsIGUuZy4KCiAgJCBwaXB4IGluc3RhbGwgdHV4cnVuCgppZiB5b3UncmUgb24g
RGViaWFuLgoKVGhlbiB5b3UgY2FuIGdldCB0aGUgc3BsYXQgYnkgcnVubmluZzoKCiAgJCB0dXhy
dW4gIC0tcnVudGltZSBkb2NrZXIgLS1kZXZpY2UgcWVtdS1yaXNjdjMyIC0ta2VybmVsIGh0dHBz
Oi8vc3RvcmFnZS50dXhzdWl0ZS5jb20vcHVibGljL2xpbmFyby9sa2Z0L2J1aWxkcy8yZXNNQmFB
TVFKcGNtY3pqMGFMOTRmcDRRblAvSW1hZ2UuZ3ogLS1wYXJhbWV0ZXJzIFNLSVBGSUxFPXNraXBm
aWxlLWxrZnQueWFtbCAtLXBhcmFtZXRlcnMgU0hBUkRfTlVNQkVSPTEwIC0tcGFyYW1ldGVycyBT
SEFSRF9JTkRFWD0xIC0taW1hZ2UgZG9ja2VyLmlvL2xpbmFyby90dXhydW4tZGlzcGF0Y2hlcjp2
MC42Ni4xIC0tdGVzdHMgbHRwLWNvbnRyb2xsZXJzCgooLS1ydW50aW1lIGtub3dzICJwb2RtYW4i
IGFzIHdlbGwpCgpZb3UgY2FuIHBhc3MgeW91ciBvd24ga2VybmVsIHRvIC0ta2VybmVsLCBhbmQg
dGhlIGNvbmZpZyBmb3IgcmlzY3YzMiBjYW4KYmUgb2J0YWluZWQgaGVyZSBbMl0uCgpCdWlsZCB3
aXRoICJtYWtlIEFSQ0g9cmlzY3YgQ1JPU1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4LWdudS0iLCBh
bmQgbWFrZQpzdXJlIHRvIGhhdmUgdGhlIHJpc2N2NjQgY3Jvc3MtY29tcGlsYXRpb24gc3VwcG9y
dCAoeWVzLCBzYW1lIHRvb2xjaGFpbgpmb3IgcnYzMiEpLgoKSXQncyB3aGVuIHRoZSByb290ZnMg
aXMgbW91bnRlZCwgYW5kIHRoZSBrZXJuZWwgaXMgbG9va2luZyBhbiBpbml0LgoKCkknbGwga2Vl
cCBkZWJ1Z2dpbmcgLS0gaXQgd2FzIG1vcmUgaWYgYW55b25lIGhhZCBzZWVuIGl0IGJlZm9yZS4g
SSdsbAp0cnkgdG8gcmVwcm9kdWNlIG9uIHNvbWUgb3RoZXIgMzJiIHBsYXRmb3JtIGFzIHdlbGwu
CgoKVGhhbmtzLApCasO2cm4KClsyXSBodHRwczovL3N0b3JhZ2UudHV4c3VpdGUuY29tL3B1Ymxp
Yy9saW5hcm8vbGtmdC9idWlsZHMvMmVzTUJhQU1RSnBjbWN6ajBhTDk0ZnA0UW5QL2NvbmZpZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
