Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768CBC54E90
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2ocQgG8I9TzXfWTAIYAiebq/LMPL5qOXjclfhgVhPNo=; b=LLuNw6Zd8xzYyKkai7TFrXZGvW
	no05XBNi6or4ebvyEMygUQOuBqoWdQJeSnZVppuLqnkQx6FRY+w2vutmxbj/zle8ns+jOArlqu+SQ
	0qSbRJNYRDZy6PyJHGXJgY3f+k54XPkxlX6OB961mtp8Dx8qBnHP7oa1vFyL5vqyPjwfdy2E5gW0a
	Qm20rUWusQqXZMH3UgAFc0pZs1hftDOvEo5cVnfDRnck9CcfNEJZQ2i2ogy02W3F9Oj5l8Ll7cQos
	2xnqY5XU42ykUK7qSvRnvEifIbrr0rNOtBG9qdtax7fCZDXvZpKIQsXMD9he87x4jAssObuHJzdfI
	rGF2tEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpUQ-0000000GkvJ-3nTp;
	Wed, 21 May 2025 19:52:34 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHpUN-0000000GkuX-0WOU
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 19:52:33 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5A21C1140138;
	Wed, 21 May 2025 15:52:29 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 15:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747857149;
	 x=1747943549; bh=vrJOBnORlJ76z7DTYBnqd66weSA7jp1DtSP1OwHgLjg=; b=
	TwXx5gxSvyAwO6Z6Z/FE6xPiGxYRJa6J2jq9/+BntDJJkLDgVtvELNsxf+qac5YA
	9z4JxfvWP3uECEh10qq7s+sEeX322a5oxAnRy9eot0UjIlDxznKAJHtu92nrC9SO
	906wxVqqi7g1eaorDCkS+Nm+vCZ6FDHlx3AiNYnSaCnBaG8PcEFshs7E8gMxt1f3
	Ku53BOPLLi0Lmq4tXziyT/9wvwH1qu2vibt1fIuXJJdpoEETRG27ZQnQq6wIMcEl
	Qy29fBgr6wJuUD4KrGalndKuHNOScD88DWDkdL4p0xfS0eb7nLGa4bMXOtG2NwMp
	lwfY9CvlR5Tg4vnQ0YK9Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747857149; x=1747943549; bh=v
	rJOBnORlJ76z7DTYBnqd66weSA7jp1DtSP1OwHgLjg=; b=Ecs8cHPKFgGWM2t8O
	yJnBt9feMXhFKo0IBo3lnpEEIVPC53dqTaH/0zj0mbbzpaPKYTtZV/uSOZ+qrYUs
	xE544ANMQvRRVMqXksWIqalHxjjGF5k5GgH/KO0UzjMfgrnuKPxbzDSDyRbFOZPm
	yZIVpTknA7pqybhjcmW1c6/0YV7wpjSxPcgRlU1ueuzlCns/dHhmLquGGcEgZlMU
	Cta8mIjIqRYfghy7Kam6vvzuf4CwIOFs7a+k/0hwaUTIqoDMblrdqCkp/KFI/kd8
	C0k5sNR4WspqYj/GtOYP7yaQjv5p3Vkw92VtJx4HwH4pzIOLztZtIeOk00q9FrcN
	KgFPA==
X-ME-Sender: <xms:-y4uaGwVAGRQASYTk74tCTz_MVFrVxII3wdsvt9SRZ0sg6xQEP_5KA>
    <xme:-y4uaCRDzlbB0iS98t2G71oHgk6DZ8H7TNfZO4_uSVjxd97SjjisowKum0miDU0l_
    tm46_93ZQjdkbyXLkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefleeiucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghf
    ufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpedtgeevteeiteelleeh
    keffteeuffevleethfefvdegheeuteehhfekgeegheeuvdenucffohhmrghinhepsghooh
    htlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
    pdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtth
    hopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtohepshihiihkrghllhgvrhdqsghu
    ghhssehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrh
    hvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    rhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprg
    hulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehmphgvrghr
    shhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtohepshihiigsohhtod
    dvtggrvgelvdguvggujeehkedtkeeffhehsgguvgesshihiihkrghllhgvrhdrrghpphhs
    phhothhmrghilhdrtghomh
X-ME-Proxy: <xmx:-y4uaIVGtVrYPk8SCNYfsoJQfotrEhR3knHsnHwijsQNQUNeQp_9Lg>
    <xmx:-y4uaMjwCRpmKYl72u-RxtXw5uPFIePzKTmD0got7NPQI-D17QioRA>
    <xmx:-y4uaID5MqkIbAEL87qTMRO3FwGY-W0M1vW7dnBL987csBsRHjQ9Vw>
    <xmx:-y4uaNLXw1mZJPVJ7NJ3b1hD3-6eeU0p8nZOx2IjTLBi0oUaqd0hnw>
    <xmx:_S4uaPis0yfxq6H4Ug4LlXX8Ruh9g92plOtQx_Ya5JgEV3Dz_myaNKQE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 89E001060061; Wed, 21 May 2025 15:52:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T583c151a77edcc97
Date: Wed, 21 May 2025 21:51:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Ghiti" <alex@ghiti.fr>,
 syzbot <syzbot+2cae92ded758083f5bde@syzkaller.appspotmail.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, syzkaller-bugs@googlegroups.com,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-acpi@vger.kernel.org
Message-Id: <fcbb98be-3a15-4a24-96ab-74d169337983@app.fastmail.com>
In-Reply-To: <8368aa6d-e5a9-4136-8eb6-c059bc888979@ghiti.fr>
References: <682b0412.a70a0220.3849cf.00b1.GAE@google.com>
 <8368aa6d-e5a9-4136-8eb6-c059bc888979@ghiti.fr>
Subject: Re: [syzbot] riscv/fixes test error: can't ssh into the instance (2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_125232_019014_3F91F456 
X-CRM114-Status: GOOD (  14.80  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUsIGF0IDE4OjM1LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4g
T24gNS8xOS8yNSAxMjoxMiwgc3l6Ym90IHdyb3RlOgo+Cj4gQmVjYXVzZSB3ZSBkb24ndCBoYXZl
IGFjcGkgZW5hYmxlZCBhbmQgdGhlbiBhY3BpX2tvYmogaXMgbnVsbCAKPiAoaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTUtcmM2L3NvdXJjZS9mcy9zeXNmcy9ncm91cC5jI0wx
MzEpLgo+Cj4gVGhlIGZvbGxvd2luZyBwYXRjaCBmaXhlcyBpdCwgYnV0IG5vdCBzdXJlIHRoaXMg
aXMgdGhlIHJpZ2h0IHdheSwgbGV0IG1lIAo+IGtub3cgaWYgSSBzaG91bGQgc2VuZCBpdCwgaXQg
d291bGQgYmUgbmljZSB0byBoYXZlIGl0IGluIDYuMTU6Cj4KCj4gLS0tIGEvZHJpdmVycy9hY3Bp
L3BsYXRmb3JtX3Byb2ZpbGUuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9wbGF0Zm9ybV9wcm9maWxl
LmMKPiBAQCAtNjg4LDYgKzY4OCw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHBsYXRmb3JtX3Byb2Zp
bGVfaW5pdCh2b2lkKQo+ICDCoHsKPiAgwqDCoMKgwqDCoMKgwqAgaW50IGVycjsKPgo+ICvCoMKg
wqDCoMKgwqAgaWYgKGFjcGlfZGlzYWJsZWQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9UU1VQUDsKPiArCj4gIMKgwqDCoMKgwqDCoMKgIGVyciA9IGNsYXNzX3Jl
Z2lzdGVyKCZwbGF0Zm9ybV9wcm9maWxlX2NsYXNzKTsKPiAgwqDCoMKgwqDCoMKgwqAgaWYgKGVy
cikKClRoZSBjaGFuZ2UgbWFrZXMgc2Vuc2UgdG8gbWUuCgpJIGRvdWJsZS1jaGVja2VkIHRoYXQg
cmV0dXJuaW5nIGFuIGVycm9yIGZyb20gdGhlIGluaXRjYWxsCmNhdXNlcyBubyBwcm9ibGVtcywg
YnV0IGl0IGlzIG9ubHkgdXNlZCBmb3IgcHJpbnRpbmcgaXQgd2l0aCB0cmFjZV9pbml0Y2FsbF9m
aW5pc2hfY2IoKS4KCkFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGUgcHJvYmxlbSBoYXMgZXhpc3Rl
ZCBpbiB0aGVvcnkgc2luY2UKbGludXgtNi4xNCwgd2hlbiB0aGUgc3lzZnNfY3JlYXRlX2dyb3Vw
KCkgY2FsbCB3YXMgbW92ZWQKZnJvbSBwbGF0Zm9ybV9wcm9maWxlX3JlZ2lzdGVyKCkgdG8gdGhl
IG1vZHVsZV9pbml0IGNhbGwuCgpNYXliZSBjbGFyaWZ5IHRoaXMgYW5kIGFkZAoKRml4ZXM6IDc3
YmU1Y2FjYjJjMiAoIkFDUEk6IHBsYXRmb3JtX3Byb2ZpbGU6IENyZWF0ZSBjbGFzcyBmb3IgQUNQ
SSBwbGF0Zm9ybSBwcm9maWxlIikKCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
