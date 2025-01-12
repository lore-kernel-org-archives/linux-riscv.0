Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E6FE77188
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jan 2025 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAl+WoFv0M5lGlEsIN2GwnD1Gbv8H94KHwQMbu5zvmg=; b=B2i0aaZomIvkyK
	81WtvbnneVdkIi438WZ5zMCjpuzwsZiM9eaL6QC3FzjWpx4+ziS+I8GNwINq3DniTjb5wA4qMyWVH
	kOo4YxO43IR34rQFzsyeOH0eURCnrJr+D9srWjrfwwy/VXAYsHC0KwUfRSjzrhASKlVDNBW0Mcm4H
	6HEcl74rVUitgBBEdYxZPseRN8Ntj4TSy+a/h19DqcLp4cfkqptQJ5fcZKmA2lPX7y9kmLBObpTeo
	/zr4B7ZS3/URxWle/al6dkZ0OBHu8uU7xjVPUmUUoHf9m5DBjww4wdYDmmxF4B4jj4+NU4vURkpwZ
	17Hl/bIcp/Wh6y/d8fzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWvQ1-00000002Wjq-0Hve;
	Sun, 12 Jan 2025 10:42:09 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWvPy-00000002WjD-1Z3f
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jan 2025 10:42:08 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 4F0DF1D40AA4;
	Sun, 12 Jan 2025 05:42:02 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 12 Jan 2025 05:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736678522; x=1736685722; bh=oaDf/Ac90E
	bejoB/UI1UVChf0YVbXYbpJL+sA5TcwZA=; b=ph2OkD71U6adFSgvCCpweFwQ1u
	ksLpq9skHD0NkR8SWwZaDBvVR/1bzMZbCtABSHPQOQ5F7X5nnDU2x6Sd24UxW0Hv
	F8Of8CWWpECV4frNAjMiwr/MQm2dsxKP4aPwHyds+qdXSfZias6aAk2l8FV/fy+l
	AM0FfqCqzCmTxRFd9ldYQNdRB73BDrjPkSD7qVtKsXTjmSLzA9PT0rcErWBIdhnY
	olz/EhS7L4XICp/7nzhz55P2mEmcV3gKPdTKjtNu4iag1nI+rRK7UKEplugCnoBi
	b6BnWypqnUvztKn/IS5RmncLM+n5KHyV1lYWfLjX+SYxn1Uo7qOTifESXGJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736678522; x=
	1736685722; bh=oaDf/Ac90EbejoB/UI1UVChf0YVbXYbpJL+sA5TcwZA=; b=q
	1z/HPfC5wlgKu1dvVWJdLaRsgHPdXHotzZJ5o1fB8vAVQ+h9V2BDjngziPYn1VNt
	84c/qZLWkCKSqbQfKV/dWei8IHTEZfF5f+3sVKQwG+9gz75ig/T3weSknkMmtuDr
	2mDuIYlK2H5Hbmv6YxvZiva+B5tKPK0AD3peJDbUVem5ef53Hwt2wgMnfvMLoVGP
	O9tI6YrZgITmi9E7moVRtzAgb3p8cgoA+t08IMfVt0yD1jbsjRc2AmaorIVUu5W0
	HRuRc7+RxB+ROWZJ+IJj3iSydC9j5OgwcvzfglRqyuW2E/dC8Xd7+zTeWAlMFLyE
	4ZKkRVIkGDu25EFvwewVQ==
X-ME-Sender: <xms:eJyDZ2RG0QfEE5sJzrKmOa3GKMYNSTar3cymEzku1I4-M1QsaGaXBg>
    <xme:eJyDZ7zsfj3PcfHw8oDBarFmECKDPz7r-n2iYpRt-kkflmD80VAzq7DbSEDSySZJ-
    H0qOnV1FycnAV-_zYs>
X-ME-Received: <xmr:eJyDZz0MbHSWNCu0n3_M68QX8nPAtUFmjt_d4b8KwENphPmMWnvmzW3NKZkpQKIb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehvddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdej
    necuhfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuh
    hsrdhnrghmvgeqnecuggftrfgrthhtvghrnhepfefhfeefteekgedvfeehhfefvedutedt
    fefhkeeileehgefgveffvdffudehhfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuhifuhestghovghlrggtrghnthhhuhhsrdhnrghmvgdp
    nhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthh
    grrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlughvsehsthhrrggt
    vgdrihhopdhrtghpthhtohepohhlvghgsehrvgguhhgrthdrtghomhdprhgtphhtthhope
    hprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghl
    mhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegvsghivgguvghrmhesgihmih
    hsshhiohhnrdgtohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehshhhurghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrohhusegvvg
    gtshdrsggvrhhkvghlvgihrdgvughu
X-ME-Proxy: <xmx:eJyDZyBwHxi6hGuPnApGDGL0oR7tdXX2zNO3zrctot6Y2dnA2Q4zzA>
    <xmx:eJyDZ_hB490Z5liCm7rcUr7qePELh2VGdIhiSUMGOzE_LTXCXZwqcA>
    <xmx:eJyDZ-qCjgj1e6N2y82jxhJ9fhZvvt-_xPe19VUSaaUZnl349Verog>
    <xmx:eJyDZyiLobx_jdQIJzud-Ztz92M0ohFxjF3pIG_T3dW9tZN_DqaOfg>
    <xmx:epyDZygjILnW2BAo23eprz0jdRwOKUmmO6ZDU0bbZJ2k3wU6b2s9JzL_>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jan 2025 05:41:52 -0500 (EST)
Message-ID: <0b538b70-bc14-4038-a1b2-428192d6f51b@coelacanthus.name>
Date: Sun, 12 Jan 2025 18:41:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrea Bolognani <abologna@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ron Economos <re@w6rz.net>, Andrew Jones <ajones@ventanamicro.com>,
 Quan Zhou <zhouquan@iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
References: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
 <20241226-riscv-new-regset-v4-2-4496a29d0436@coelacanthus.name>
 <20241226133459.GA30481@strace.io>
 <2e09aedc-44ba-40e3-ae93-1d6dc21b5eb1@coelacanthus.name>
 <Z4CVQKkViqJycnaq@ghost>
Content-Language: en-GB-large
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <Z4CVQKkViqJycnaq@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_024206_934594_7D7913BD 
X-CRM114-Status: GOOD (  17.35  )
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

T24gMjAyNS0wMS0xMCAxMTozNCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+IE9uIFRodSwgRGVj
IDI2LCAyMDI0IGF0IDExOjIxOjU5UE0gKzA4MDAsIENlbGVzdGUgTGl1IHdyb3RlOgo+Pgo+PiBP
biAyMDI0LTEyLTI2IDIxOjM1LCBEbWl0cnkgVi4gTGV2aW4gd3JvdGU6Cj4+PiBPbiBUaHUsIERl
YyAyNiwgMjAyNCBhdCAwNjo1Mjo1MlBNICswODAwLCBDZWxlc3RlIExpdSB3cm90ZToKPj4+PiBU
aGlzIHRlc3QgY2hlY2tzIHRoYXQgb3JpZ19hMCBhbGxvd3MgYSBzeXNjYWxsIGFyZ3VtZW50IHRv
IGJlIG1vZGlmaWVkLAo+Pj4+IGFuZCB0aGF0IGNoYW5naW5nIGEwIGRvZXMgbm90IGNoYW5nZSB0
aGUgc3lzY2FsbCBhcmd1bWVudC4KPj4+Pgo+Pj4+IENvLWRldmVsb3BlZC1ieTogUXVhbiBaaG91
IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpo
b3VxdWFuQGlzY2FzLmFjLmNuPgo+Pj4+IENvLWRldmVsb3BlZC1ieTogQ2hhcmxpZSBKZW5raW5z
IDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPHV3
dUBjb2VsYWNhbnRodXMubmFtZT4KPj4+IFsuLi5dCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wdHJhY2UuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L2FiaS9wdHJhY2UuYwo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5k
ZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMDIzNjk1MzUyMjE1
YmI1ZGUzZjkxYzFhNmY1ZWEzYjRmOTM3M2ZmOQo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcHRyYWNlLmMKPj4+IFsuLi5dCj4+
Pj4gKwlpZiAocHRyYWNlKFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPLCBwaWQsIFBUUkFDRV9TWVND
QUxMX0lORk9fRU5UUlksICZzeXNjYWxsX2luZm9fZW50cnkpKQo+Pj4+ICsJCXBlcnJfYW5kX2V4
aXQoImZhaWxlZCB0byBnZXQgc3lzY2FsbCBpbmZvIG9mIGVudHJ5XG4iKTsKPj4+PiArCXJlc3Vs
dC0+b3JpZ19hMCA9IHN5c2NhbGxfaW5mb19lbnRyeS0+ZW50cnkuYXJnc1swXTsKPj4+PiArCWlm
IChwdHJhY2UoUFRSQUNFX0dFVF9TWVNDQUxMX0lORk8sIHBpZCwgUFRSQUNFX1NZU0NBTExfSU5G
T19FWElULCAmc3lzY2FsbF9pbmZvX2V4aXQpKQo+Pj4+ICsJCXBlcnJfYW5kX2V4aXQoImZhaWxl
ZCB0byBnZXQgc3lzY2FsbCBpbmZvIG9mIGV4aXRcbiIpOwo+Pj4+ICsJcmVzdWx0LT5hMCA9IHN5
c2NhbGxfaW5mb19leGl0LT5leGl0LnJ2YWw7Cj4+Pgo+Pj4gSSdtIHNvcnJ5IGJ1dCB0aGlzIGlz
IG5vdCBob3cgUFRSQUNFX0dFVF9TWVNDQUxMX0lORk8gc2hvdWxkIGJlIHVzZWQuCj4+Pgo+Pj4g
UFRSQUNFX0dFVF9TWVNDQUxMX0lORk8gb3BlcmF0aW9uIHRha2VzIGEgcG9pbnRlciBhbmQgYSBz
aXplLAo+Pj4gYW5kIGluIHRoaXMgZXhhbXBsZSBpbnN0ZWFkIG9mIHNpemUgeW91IHBhc3MgY29u
c3RhbnRzIDEgYW5kIDIsIHdoaWNoCj4+PiBlc3NlbnRpYWxseSBtZWFucyB0aGF0IGJvdGggc3lz
Y2FsbF9pbmZvX2VudHJ5LT5lbnRyeS5hcmdzWzBdIGFuZAo+Pj4gc3lzY2FsbF9pbmZvX2V4aXQt
PmV4aXQucnZhbCBhcmUgbm90IGdvaW5nIHRvIGJlIGFzc2lnbmVkCj4+PiBhbmQgd291bGQganVz
dCBjb250YWluIHNvbWUgZ2FyYmFnZSBmcm9tIHRoZSBzdGFjay4KPj4+Cj4+PiBBbHNvLCBQVFJB
Q0VfR0VUX1NZU0NBTExfSU5GTyBvcGVyYXRpb24gcmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVz
Cj4+PiBhdmFpbGFibGUgdG8gYmUgd3JpdHRlbiBieSB0aGUga2VybmVsLCB3aGljaCBpcyBhbHdh
eXMgbm9uemVybyBvbiBhbnkKPj4+IFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPLWNhcGFibGUga2Vy
bmVsLiAgSW4gb3RoZXIgd29yZHMsIHRoaXMgZXhhbXBsZQo+Pj4gd2lsbCBhbHdheXMgZW5kIHVw
IHdpdGggcGVycl9hbmRfZXhpdCgpIGNhbGwuCj4+Pgo+Pj4gSSB3b25kZXIgaG93IHRoaXMgdGVz
dCB3YXMgdGVzdGVkIGJlZm9yZSB0aGUgc3VibWlzc2lvbi4KPj4KPj4gT29wcy4uLiBJdCBzZWVt
cyBJIGZvcmdldCBzeW5jIHRoZSBjb2RlIHRvIHRlc3QgYm9hcmQgc28gaXQgcnVucyB3aXRoIHRo
ZSBvbGQgY29kZS4uLgo+PiBUaGUgY29kZSBpcyBjb21wbGV0ZWx5IG5vdCB0ZXN0ZWQuLi4KPj4g
SSdtIHNvIHNvcnJ5IGZvciBteSBtaXN0YWtlLgo+Pgo+PiBJIHdpbGwgY29ycmVjdCBpdCBhbmQg
dGVzdCBpdCBjYXJlZnVsbHkgbGF0ZXIuLi4KPiAKPiBJdCB3b3VsZCBiZSBncmVhdCB0byBnZXQg
dGhpcyBpbnRvIDYuMTQuIExldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBsaWtlCj4gYW55IGhlbHAh
CgpTb3JyeSwgZGVsYXllZCBkdWUgdG8gcGVyc29uYWwgcmVhc29ucy4gSSBoYXZlIHJldHVybmVk
IHRvIHRoaXMgam9iIHJlY2VudGx5LgpUaGUgdXBkYXRlIHBhdGNoc2V0IHdpbGwgYmUgc2VudCB0
b21vcnJvdy4KCj4gCj4gLSBDaGFybGllCj4gCj4+Cj4+Pgo+Pj4KPj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
