Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E131D7360F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+/v2D//tc7iSbblea1WSAdMMarbNazhh/EX4oeiK0w=; b=lbOPF1wZNjL2oS
	HAT/8VXoAES8fzqCwIKYcXGR9J0c4v5QZZqEVGMoij1Z5IAURO+lzw+7w265GFdLz4FcGHHWw/VzQ
	UmsQOENDaJaLit2Y4N6v2A8qN0HL8JrSpUp3HbaV6obRZBMhZPAp2g/nFDJoNvnvcq+Gvcugz7z4L
	2uQasot3sosMjKxPkW+E5VhFt9OUd1Ggft1HdOsb0nH1okKGTB0Hi+Ezm2QUP5flJMv+3kfBms84b
	9c1zBKGLDKtXB5MsPTVyWPr8cxqEbgarlYAfrP4BnJxHSNiV16BC0knJWhpk6zMLNhpp5MajjXI6H
	7fBIBJlGBzraXLjL5n2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHW8C-00000002gIZ-070H;
	Sat, 30 Nov 2024 22:40:04 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHW89-00000002gHz-0xjJ
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 22:40:02 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id 04D882004EB;
	Sat, 30 Nov 2024 17:40:00 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 30 Nov 2024 17:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1733006399; x=1733009999; bh=o3iUlzvotb
	/Rr05MqC6b2VUSP+54UyQ/zj70KE8KR3M=; b=WdUb1XFM/KpugBP8gLO7T0L2jT
	CsZf64i0LPzasyoO2kiwLKxkgJF6VuxKaEb3hZOyRi+HKSx8t/MkOmBZMsx1MbsQ
	1SFmBZn73ScaEhTPmLPRbvkHMB8/hwFIIkznCSRupri8M0WStW7QNm8kHTpaaphQ
	6BUEBtrKlwCc/301SOjrjxt1vCdAefSAVkXS72NgnxDhVkWo9ieOUkQbyWa0dDyX
	rkLgjo53unecAIDIdDFpr42OV+M4yRepXfpG3vSUeWLPqyssqzm3tR93x34oIbfa
	tYiAt0YaZ10ZwQ00eZ5hHiVb6ts3UWJqCNd7CGSpzr/FfE4VM/f3n3KVaWYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733006399; x=
	1733009999; bh=o3iUlzvotb/Rr05MqC6b2VUSP+54UyQ/zj70KE8KR3M=; b=n
	nOw1jLqZL6iDP6T0pSZstvaGvtkHrJkZohaUJXL70Qj7c0/4P4CvqAXXvD/gZsuf
	nCKptGZBef1ZSfREHsLyla7UjzXhavlemzaIcSD3DrFm7bQuic1Mn8hlvNuPPuPG
	+iqmmM96CIIBhiMmp5W6tRMxYu+AFCZoPiHCfgzhZgBzq+EYtm+qXjBBL8+3SRg3
	DejaZhjslCs5QDwCR0p555MtQaU+1hNPdRXFaj0SMrTkCltt5YnCsK3qDBqTIivv
	xaPHNJd0+zAbx3lBexMwQUJYVScBsEEv6AYa3cyRy8MPQnwHJqEZxNV3YzwqBDzn
	J4gZXYY2UERWF+iJBu4ag==
X-ME-Sender: <xms:PZRLZ44BM0NqHsemyQZ8rSnu4Y6Y_-rpC-etXC4GpYGMdMqtMamAMA>
    <xme:PZRLZ55Z-0otXHGaMg5rM4fEnCQ3WDcgxk8gTA-28vfFVf7-CBAEpZIACpfYF5lsv
    hvT3D4x6fM5de-w6Bc>
X-ME-Received: <xmr:PZRLZ3d0kVhJ5VuH37g8EMBRjsnwPjiBiK8bSHFHUmU0PCstOXSSQ8ktdldL4UJ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrheeigddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeen
    ucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhush
    drnhgrmhgvqeenucggtffrrghtthgvrhhnpeefffdujedtleetieffleehjeffudetfeeg
    hfdtieeiheevueeggfeuiefgvdekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhes
    tghovghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepvdefpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtohgvlhgrtggrnhhthhhushhhvgigsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhgvseifiehriidrnhgvthdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhn
    ihigrdguvgdprhgtphhtthhopeguvghvnhhulhhlodgtohgvlhgrtggrnhhthhhushhhvg
    igrdhgmhgrihhlrdgtohhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdr
    figrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesug
    grsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgih
    rdgvughupdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhm
X-ME-Proxy: <xmx:PZRLZ9LsKDnd3zwzXG_oydPRE9Vl3FcBs0s-08XbWCUiMOCjK9dUGw>
    <xmx:PZRLZ8JFDcXE754foOQ2mVxv8Zx6q05zKiTRMnRRIdTL_2bPU5pOPA>
    <xmx:PZRLZ-ybEd-ONBIvyp4lqaXAQv53Hj62dIdsAVIY00nuuiqtfq0_XQ>
    <xmx:PZRLZwL9wqQ4RyfnVCVUc_f6FxburZn_3BVAPy7PVByINWOcU3xSCQ>
    <xmx:P5RLZ8Iwm9_S1rbZG9AaCFcj6zKXtjTSjf1NNs3rmqnAYhkwLZ8OZkL6>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Nov 2024 17:39:49 -0500 (EST)
Message-ID: <bded8cfb-c881-4c78-a8a8-1e0c8abe327f@coelacanthus.name>
Date: Sun, 1 Dec 2024 06:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
Content-Language: en-GB-large
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Celeste Liu <coelacanthushex@gmail.com>
Cc: Ron Economos <re@w6rz.net>, Thomas Gleixner <tglx@linutronix.de>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <87ldya4nv0.ffs@tglx>
 <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com> <87a5ep4k0n.ffs@tglx>
 <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com> <877c9t43jw.ffs@tglx>
 <81afb4bf-084b-e061-8ce4-90b76da16256@w6rz.net>
 <109afaab-05c0-4228-8ea0-1dc1aabe904f@gmail.com>
 <CAJ+HfNj4d8_Ow1GyA3uX+2f79V8173e9RWfcX6_KjTPfinZCiw@mail.gmail.com>
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <CAJ+HfNj4d8_Ow1GyA3uX+2f79V8173e9RWfcX6_KjTPfinZCiw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_144001_352317_13A6D4D5 
X-CRM114-Status: GOOD (  11.18  )
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

Ck9uIDIwMjQtMTAtMjkgMDM6MzMsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gT24gTW9uLCAyOCBP
Y3QgMjAyNCBhdCAxNzoyNiwgQ2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+
IHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDI0LTEwLTI4IDA4OjE3LCBSb24gRWNvbm9tb3Mgd3JvdGU6
Cj4+PiBPbiAxMC8yNy8yNCAyOjUyIFBNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+Pj4gT24g
TW9uLCBPY3QgMjggMjAyNCBhdCAwMTowMSwgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4+Pj4+IE9uIDIw
MjQtMTAtMjcgMjM6NTYsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4+Pj4+IEVxdWl2YWxlbnRs
eSB5b3UgbmVlZCB0byBiZSBhYmxlIHRvIG1vZGlmeSBvcmlnX2EwIGZvciBjaGFuZ2luZyBhcmcw
LAo+Pj4+Pj4gbm8/Cj4+Pj4+IE9rLgo+Pj4+Pgo+Pj4+PiBHcmVnLCBjb3VsZCB5b3UgYWNjZXB0
IGEgYmFja3BvcnQgYSBuZXcgQVBJIHBhcmFtZXRlciBmb3IKPj4+Pj4gUFRSQUNFX0dFVFJFR1NF
VC9QVFJBQ0VfU0VUUkVHU0VUIHRvIDQuMTkgTFRTIGJyYW5jaD8KPj4+PiBGaXggdGhlIHByb2Js
ZW0gcHJvcGVybHkgYW5kIHB1dCBhIHByb3BlciBGaXhlcyB0YWcgb24gaXQgYW5kIHdvcnJ5Cj4+
Pj4gYWJvdXQgdGhlIGJhY2twb3J0IGxhdGVyLgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4g
ICAgICAgICAgdGdseAo+Pj4+Cj4+PiBJIHdvdWxkbid0IHdvcnJ5IGFib3V0IGJhY2twb3J0aW5n
IHRvIHRoZSA0LjE5IGtlcm5lbC4gSXQncyBlc3NlbnRpYWxseSBwcmVoaXN0b3JpYyBmb3IgUklT
Qy1WLiBUaGVyZSdzIG5vIGRldmljZSB0cmVlIHN1cHBvcnQgZm9yIGFueSBoYXJkd2FyZS4gQWxz
bywgNC4xOSB3aWxsIGJlIGdvaW5nIEVPTCB2ZXJ5IHNvb24gKERlY2VtYmVyIDIwMjQpLgo+Pgo+
PiBPaywgSSB3aWxsIHdvcmsgb24gcHJlcGFyaW5nIGEgbmV3IHBhdGNoIHRvIGFkZCBhIG5ldyBz
ZXQgaW4KPj4gUFRSQUNFX0dFVFJFR1NFVC9QVFJBQ0VfU0VUUkVHU0VULgo+IAo+IFRoYW5rcyBm
b3Igd29ya2luZy9maW5kaW5nIHdvcmtpbmcgb24gdGhpcyEgTG9va2luZyBmb3J3YXJkIHRvIHRo
ZSBwYXRjaCEKClRoZSBwYXRjaCB0byBhZGQgbmV3IHJlZ3NldCBoYXMgYmVlbiBzZW50LgpTZWUg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MTIwMS1yaXNjdi1uZXctcmVnc2V0LXYx
LTEtYzgzYzU4YWJjYzdiQGNvZWxhY2FudGh1cy5uYW1lL1QvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
