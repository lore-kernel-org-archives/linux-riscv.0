Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7C7E77188
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 15:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/NSv3xh//sFNpDIUDSldCijXR5V6lQ9FNjaV8Twxpg=; b=rHLQZvYEhNDEF6
	+WphNmmBwTwhAbbvp8TJoM6plLuKWEpe+avlG1NHYS/VfxFH4G5vn78hH13ww1fXUa3FbNxgrF2mG
	3snzxLzOziDB3YeN//bbHgaZT948wE6bWq4xiv0kbf2h26NBXQxPp3VKEU+mNrcRr4wPkNci/Oc6b
	VtbWExHF1bjb/eGJKsPTVSsQrxY8nVVnHgoDXJoocqXZw5X64s4uwz+RpX7ke4O9O+PPA/7OnSne9
	gSbhjKBbaGs7q9kjfjIW47RyB1lRzecZKLHWHbhesaG6VOmGBmXbCEu8chroE80oUic7dL3ST2YLk
	KWBri8IgCiupFHLEFHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQpgo-0000000Fy4Q-0qtd;
	Thu, 26 Dec 2024 15:22:18 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQpgk-0000000Fy3c-0d1C
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 15:22:16 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 6B5CC20009E;
	Thu, 26 Dec 2024 10:22:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 26 Dec 2024 10:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1735226532; x=1735233732; bh=9PBKThwQsC
	oEBMlVcV0YVOAr01r6Wd75FiktQTX+myg=; b=slMx5ygnGbiyl8uSIv2ltHyVtz
	mWmBhApz/1RcdlZfXiGE+rlSriu+fGIohAeYxnXTTk1Ktr7Dv8CZ9Sl32sl5ikb2
	1FKfNQirexvBslVcGKdWt9MfTjDEMJF8jVbMCRsRlb8k3NVC6aqlUxnamyeynDSZ
	VcPDwcw8eDSKs5bXHt6VvGi0FTSTxGdRG04hUYkAvNL8+auobIgnkv/eJDJjHCxd
	vLKuJ0WOmktc1s9OQ9hSTc5QMQYtfXvpYJGjeVc4K/7dsh6PV272fTQJN5UF9CDi
	cuPAwyryc0bq+ELSeeaITALSbFpxnzrSkGMyEV8BRdCYPTGrdj5TDQtxDvfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735226532; x=
	1735233732; bh=9PBKThwQsCoEBMlVcV0YVOAr01r6Wd75FiktQTX+myg=; b=o
	5TPm9EepmWxpQrNJUBAwYAbA569TwbzrWANHvYfkSNxykudSN3vTFjopqqpmyMGC
	bgM91TZ7EB3rUqTzKfPKtLsYK1zzEZnAvw1PIH1YtXWjb7xz9mzOZqOo3e1T51MC
	rbbo99gscWs6w8FBCQdE+dF4nK8DlnMVT09wG5ey4vCg85LV0MVuu8ywhOUdlIfe
	boKqvRvZj880z7/rwWmD3twrEQsfiUnTmpzsUcrD3YUiLR73PXMGNtdXPNeUPIkC
	zY8E3PYgOeZEa6TBJKWL/1fZxh/gNfV//Vv5GJ3tqpCz/ekpGjeA2YX6X0dbRg9Q
	embWtt+EJ6wIi2+TcG5Ww==
X-ME-Sender: <xms:onRtZya4uA9TbtofOk_tgS8LFXWjhDUx4y1F9HaiMP2EG388Ta2N9w>
    <xme:onRtZ1aoFqaHxASIa7BU4U6YkQTe8FkxJym4TRbVkFh_hJHUdy1zgExpFJKBm55lO
    94rmNQnkeZAbUzvWe8>
X-ME-Received: <xmr:onRtZ89Ii81TnUZarIxP43FUJMfN7Ev0W65o43UNuWXPZd--jJgymv1fAmbEVGJC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddukedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdej
    necuhfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuh
    hsrdhnrghmvgeqnecuggftrfgrthhtvghrnhepfefhfeefteekgedvfeehhfefvedutedt
    fefhkeeileehgefgveffvdffudehhfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuhifuhestghovghlrggtrghnthhhuhhsrdhnrghmvgdp
    nhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlug
    hvsehsthhrrggtvgdrihhopdhrtghpthhtohepohhlvghgsehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtph
    htthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegvsghivggu
    vghrmhesgihmihhsshhiohhnrdgtohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehshhhurghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigse
    hghhhithhirdhfrh
X-ME-Proxy: <xmx:onRtZ0pmb43OtIMqWtAGWlPjTS-aD-4bTDF1TXUn0COAgu4_QCxfvg>
    <xmx:onRtZ9rN0AK5oO_-8CwpnAZpUT1MfF0DUGcGVitEfDNx26GhKfebiA>
    <xmx:onRtZyQeuB2PJbgdd3sL2bM6xrBuPhkl7g8JceIp8uVdx0h1leKIUw>
    <xmx:onRtZ9q-RoZK6qW4ron4QxAs3P2emewkSm7j7qXvwaIM0Ad7aOsyPA>
    <xmx:pHRtZ0579C5CDjuePJ7TWSFYoqX46UcqNQ2LkpVyXgxiDG_n3V6nwOwz>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Dec 2024 10:22:01 -0500 (EST)
Message-ID: <2e09aedc-44ba-40e3-ae93-1d6dc21b5eb1@coelacanthus.name>
Date: Thu, 26 Dec 2024 23:21:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Content-Language: en-GB-large
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Quan Zhou <zhouquan@iscas.ac.cn>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Guo Ren <guoren@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
References: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
 <20241226-riscv-new-regset-v4-2-4496a29d0436@coelacanthus.name>
 <20241226133459.GA30481@strace.io>
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <20241226133459.GA30481@strace.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_072214_811076_3D50E549 
X-CRM114-Status: GOOD (  18.34  )
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

Ck9uIDIwMjQtMTItMjYgMjE6MzUsIERtaXRyeSBWLiBMZXZpbiB3cm90ZToKPiBPbiBUaHUsIERl
YyAyNiwgMjAyNCBhdCAwNjo1Mjo1MlBNICswODAwLCBDZWxlc3RlIExpdSB3cm90ZToKPj4gVGhp
cyB0ZXN0IGNoZWNrcyB0aGF0IG9yaWdfYTAgYWxsb3dzIGEgc3lzY2FsbCBhcmd1bWVudCB0byBi
ZSBtb2RpZmllZCwKPj4gYW5kIHRoYXQgY2hhbmdpbmcgYTAgZG9lcyBub3QgY2hhbmdlIHRoZSBz
eXNjYWxsIGFyZ3VtZW50Lgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1
YW5AaXNjYXMuYWMuY24+Cj4+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNj
YXMuYWMuY24+Cj4+IENvLWRldmVsb3BlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFt
ZT4KPiBbLi4uXQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
YWJpL3B0cmFjZS5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3B0cmFjZS5j
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAuLjAyMzY5NTM1MjIxNWJiNWRlM2Y5MWMxYTZmNWVhM2I0ZjkzNzNm
ZjkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNj
di9hYmkvcHRyYWNlLmMKPiBbLi4uXQo+PiArCWlmIChwdHJhY2UoUFRSQUNFX0dFVF9TWVNDQUxM
X0lORk8sIHBpZCwgUFRSQUNFX1NZU0NBTExfSU5GT19FTlRSWSwgJnN5c2NhbGxfaW5mb19lbnRy
eSkpCj4+ICsJCXBlcnJfYW5kX2V4aXQoImZhaWxlZCB0byBnZXQgc3lzY2FsbCBpbmZvIG9mIGVu
dHJ5XG4iKTsKPj4gKwlyZXN1bHQtPm9yaWdfYTAgPSBzeXNjYWxsX2luZm9fZW50cnktPmVudHJ5
LmFyZ3NbMF07Cj4+ICsJaWYgKHB0cmFjZShQVFJBQ0VfR0VUX1NZU0NBTExfSU5GTywgcGlkLCBQ
VFJBQ0VfU1lTQ0FMTF9JTkZPX0VYSVQsICZzeXNjYWxsX2luZm9fZXhpdCkpCj4+ICsJCXBlcnJf
YW5kX2V4aXQoImZhaWxlZCB0byBnZXQgc3lzY2FsbCBpbmZvIG9mIGV4aXRcbiIpOwo+PiArCXJl
c3VsdC0+YTAgPSBzeXNjYWxsX2luZm9fZXhpdC0+ZXhpdC5ydmFsOwo+IAo+IEknbSBzb3JyeSBi
dXQgdGhpcyBpcyBub3QgaG93IFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPIHNob3VsZCBiZSB1c2Vk
Lgo+IAo+IFBUUkFDRV9HRVRfU1lTQ0FMTF9JTkZPIG9wZXJhdGlvbiB0YWtlcyBhIHBvaW50ZXIg
YW5kIGEgc2l6ZSwKPiBhbmQgaW4gdGhpcyBleGFtcGxlIGluc3RlYWQgb2Ygc2l6ZSB5b3UgcGFz
cyBjb25zdGFudHMgMSBhbmQgMiwgd2hpY2gKPiBlc3NlbnRpYWxseSBtZWFucyB0aGF0IGJvdGgg
c3lzY2FsbF9pbmZvX2VudHJ5LT5lbnRyeS5hcmdzWzBdIGFuZAo+IHN5c2NhbGxfaW5mb19leGl0
LT5leGl0LnJ2YWwgYXJlIG5vdCBnb2luZyB0byBiZSBhc3NpZ25lZAo+IGFuZCB3b3VsZCBqdXN0
IGNvbnRhaW4gc29tZSBnYXJiYWdlIGZyb20gdGhlIHN0YWNrLgo+IAo+IEFsc28sIFBUUkFDRV9H
RVRfU1lTQ0FMTF9JTkZPIG9wZXJhdGlvbiByZXR1cm5zIHRoZSBudW1iZXIgb2YgYnl0ZXMKPiBh
dmFpbGFibGUgdG8gYmUgd3JpdHRlbiBieSB0aGUga2VybmVsLCB3aGljaCBpcyBhbHdheXMgbm9u
emVybyBvbiBhbnkKPiBQVFJBQ0VfR0VUX1NZU0NBTExfSU5GTy1jYXBhYmxlIGtlcm5lbC4gIElu
IG90aGVyIHdvcmRzLCB0aGlzIGV4YW1wbGUKPiB3aWxsIGFsd2F5cyBlbmQgdXAgd2l0aCBwZXJy
X2FuZF9leGl0KCkgY2FsbC4KPiAKPiBJIHdvbmRlciBob3cgdGhpcyB0ZXN0IHdhcyB0ZXN0ZWQg
YmVmb3JlIHRoZSBzdWJtaXNzaW9uLgoKT29wcy4uLiBJdCBzZWVtcyBJIGZvcmdldCBzeW5jIHRo
ZSBjb2RlIHRvIHRlc3QgYm9hcmQgc28gaXQgcnVucyB3aXRoIHRoZSBvbGQgY29kZS4uLgpUaGUg
Y29kZSBpcyBjb21wbGV0ZWx5IG5vdCB0ZXN0ZWQuLi4KSSdtIHNvIHNvcnJ5IGZvciBteSBtaXN0
YWtlLgoKSSB3aWxsIGNvcnJlY3QgaXQgYW5kIHRlc3QgaXQgY2FyZWZ1bGx5IGxhdGVyLi4uCgo+
IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
