Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8ECE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/YvXkYKsS9VWcLvjs4kIQOh0oWWnjwohLAM+CaeLTo=; b=OBBu6z3eJT++AZ
	1n4fBMQeDM43D1qtpw+kHYw5DEt+858l5641I08j8ZzIC5NMiC3VL4F9teksKgFT2xybckUpxwhdU
	lrQoDLvVChpCvLQR4JxUaxohVjlzo9zBb4Sb+qG49dRpxTxajCtnt3nAv//MXKcj0rVHUuFt0cu6R
	jiglAXFe+O3Rv0Un1fJ33Ehi22vqgbx83jmeHKDbOWRO2wZDBTD5H+54O5HMRSUPSuCyV3NA70EfQ
	onoZ1Qlm6DJT1uEW2v3GQbZwWrCpfMuvWCouOLvss6ZYbgyJozH7kNOjPXa9nTi4Ql5z9i8EatUsQ
	y6mEpvVxDSvepESernww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnbJ-00000009gTI-10UT;
	Tue, 14 Jan 2025 20:33:25 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXna0-00000009gB2-1xTO
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 20:32:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 14FC91D40844;
	Tue, 14 Jan 2025 15:32:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jan 2025 15:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736886722; x=1736893922; bh=k3aK0yvw6s
	3XgHhobmGdwD1q9qT+ce2iJbSudHfZEug=; b=FUu2prLJ1is+E6pfAnsUuGSgwu
	F2PNTmouhWFckCjs7RP2LXWUbMWmQP861AX7k699XzNt+GIDaThA9BaonOyr0wB3
	iOBNfyQNFbIzTXgMB3H+ppZH5/W6rQz4weA10Hc/AtNEvIYMKnecZbn8hzNawett
	e5k0Svbmqo02Pz6x2DLFtXN5gkhamNCZXES/bGFC0DF2EN4wKhon+GiTeaabqU1i
	tg9/r3WaEzNbr/gjzcLugNmDc7KgTA0ki683cFHSSVDIFnDVWapEVt5HqT3XShYb
	AWOgP8mq+fdSDaesmeuadnycx3PzjfS93whEaDRwdC8JjUnWS/1yQ+/kDctA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736886722; x=
	1736893922; bh=k3aK0yvw6s3XgHhobmGdwD1q9qT+ce2iJbSudHfZEug=; b=D
	FgmAYnt5ayLH5wRYBsYb9NOkdf0VuWsBSxpJYNWxtSLbZkROUVUjE98RK+5YnLuS
	NdNPZ2jddAQkFsSM2L7MbdmZ6TlrfmUB8iA7B4Ha5zgsdlb8zGLyyo+HwfuxR/GE
	hmxQ2Z2iqyikGW+/td2nta7C6xy2eeIG+5jVs3Xy1RrYPzRbrDDTufXkBp3eaI3R
	Hw/1e7CpXB3+A3dNpaqxc1vstFlua9yP/s2bbeAU0ltCJ3YR/tf83yvHaE2jQ3cV
	WJiOYY7lBf2hBuwT4le0zSu3DJYTn8q581pqZRks905uKxgPo/ZDjktp8sORvKjb
	iOihm+YdBxecJbouyxGVA==
X-ME-Sender: <xms:wcmGZ8yWRyXxhIcvlmuRbHY6A2sbKJsWVN5lamYYR_kRlWitSZ_nOw>
    <xme:wcmGZwSZ_GThlD7ZWI0cf7dapvWckQSuKJePUeBDxpP5pOk3-RXjC4WNhMenIspfS
    obLIiMupBSlvy4XfNc>
X-ME-Received: <xmr:wcmGZ-UWF3C77y7hucvYopwHtNvkUOjRK2YTmrNo7I25xdN9kbk-_HUWZPJd6E6u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddv
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeefffdujedtleetieffleehjeffudet
    feeghfdtieeiheevueeggfeuiefgvdekvdenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhif
    uhestghovghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdr
    tghomhdprhgtphhtthhopehlughvsehsthhrrggtvgdrihhopdhrtghpthhtohepohhlvg
    hgsehrvgguhhgrthdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehs
    ihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
    dprhgtphhtthhopegvsghivgguvghrmhesgihmihhsshhiohhnrdgtohhmpdhrtghpthht
    ohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhhurghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughu
X-ME-Proxy: <xmx:wcmGZ6jpZW4MqjOd3ak_VcDAOQLuSdpdXsCcWQVmKtGjHt1HiIo67g>
    <xmx:wcmGZ-AwdeQryJpPUW-FMNT3pIq-hYivUf1Mg_Go5E5ykzNFNakRTQ>
    <xmx:wcmGZ7KrNV88kGIaZ3TLH55saBZgmqLpHD7sMHKDpPFt1SXQjuH6ng>
    <xmx:wcmGZ1CY0diCWBx-i2BY_cTyODvMN049uCAh_xGiBRZcQfr9GqJZgw>
    <xmx:wsmGZ_xatnRalfHDXBhBcagXq89TXNU-EnMEZCvBMgZ_6PBtnx-hSnGJ>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:31:53 -0500 (EST)
Message-ID: <6bacd2ec-fd86-41c9-b5dc-e14796737b4b@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:31:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Content-Language: en-GB-large
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrea Bolognani <abologna@redhat.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ron Economos <re@w6rz.net>, Andrew Jones <ajones@ventanamicro.com>,
 Quan Zhou <zhouquan@iscas.ac.cn>, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Eugene Syromyatnikov <evgsyr@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
References: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
 <20241226-riscv-new-regset-v4-2-4496a29d0436@coelacanthus.name>
 <20241226133459.GA30481@strace.io>
 <2e09aedc-44ba-40e3-ae93-1d6dc21b5eb1@coelacanthus.name>
 <Z4CVQKkViqJycnaq@ghost>
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <Z4CVQKkViqJycnaq@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_123204_560210_6E0A8ABC 
X-CRM114-Status: GOOD (  17.01  )
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
Cgp2NSBoYXMgYmVlbiBzZW50LgoKU29ycnkgZm9yIGRlbGF5LiBNeSB0ZXN0IGVudmlyb25tZW50
IHdhcyBicm9rZW4geWVzdGVyZGF5IHNvIEkgaGF2ZSB0bwpzcGVuZCB0aW1lIHRvIHJlcGFpciBp
dCBmaXJzdC4uLgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDExNS1yaXNjdi1u
ZXctcmVnc2V0LXY1LTAtZDBlNmVjMDMxYTIzQGNvZWxhY2FudGh1cy5uYW1lL1QvCgo+IAo+IC0g
Q2hhcmxpZQo+IAo+Pgo+Pj4KPj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
