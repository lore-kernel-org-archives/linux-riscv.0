Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F059D2F7EF
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vLNUgm16bi04KMiXJLSTESdkkyrQWXh2d6ZifT7OUes=; b=o5Vw7crzRTmLljCE3dOI3ZkU44
	7w1zX+sCkRFH46rn+EZPRpfpVCY7pKjKhHUSbOjXqbwROPkGBJBDKUZ4eUCIpeymxejW1l4G5xAC5
	1QnXQv4eGqMK4dtxLn6U8FejnrnI8zgpGLgd0HHLZN2m7txVwtH3ulWy31/TM5ahrq5L2l6W4Rzui
	dWDUDnOxUwWPF1NbAqsvEhMiLFpodd5vGREpa5zY8uHQQy+kJNpIeTJoqeGHfruuuDyuzteoQQdxS
	yNL2BWFTcDCG06oGoiMpxvHtu2qZ4pEjKQCYiGW0X8HKG9IJ7hpAl/xgJhYPr5Mb+iVH3REem0J2k
	Way+yq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWIi-00000009YJM-2zU7;
	Fri, 05 Dec 2025 13:56:48 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWIe-00000009YIx-2jRK
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 13:56:46 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CFC23EC059A;
	Fri,  5 Dec 2025 08:56:42 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 08:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764943002;
	 x=1765029402; bh=6jIDgDQomoK9NQlUOGMcADl/DSu11Lk9z8Cy7t1RvbY=; b=
	F4xxuDGc0gtaakPjCiWR79J4MlpS0Orv/CX+jp/pcae0eZCVsUG9bJJpNU16r9WC
	Q97J0yMJhPcWHUPSJ3y7AsCKikdIcivHm5Jre7waVdfZgmlk3b5iyNWk0TUqWiH+
	b+G6/knQa0YlX4RkBheoIqPEj12LT6mOc/fX+rAs4hyImiCdcWQ70JJZm/31Gjap
	OxsYCr3wSN0Vd83d1+sI4ZHLKjOG2IPw3OuEDhhXJB0+SgmZ28PBcpVXyBLvCIW8
	fM322kBRxvJv0N+pFVFuTjtlqZ1Er7X8X0N7IrEg72aWxzD/PRYsrszkIH8AAPte
	7x6Ay4Vir6CQzwb1zWl6Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764943002; x=
	1765029402; bh=6jIDgDQomoK9NQlUOGMcADl/DSu11Lk9z8Cy7t1RvbY=; b=M
	TztJQnmfFCAOlzNO3QmXE2FxoP9qsTsJoYtxjRbN4pB6Yj4XdrEuCfkifspBcRtz
	SkjJjSUE4C4arq2LrkQZIJQcZHeVWw2rmIUj2/arM2tqTqq/NQOBuFz6hdZjsnpW
	8i0fSPuYlYCbBLSdvEm3ckJieUvAsUt2mUIMPtU2n9nd3WfhhbDQU8mkLw8EWjm1
	f7ea/FLYK8kpjgJCiS5s8y5qMSewCS/STDCnnN5OWMCSzmJFblW8cmv+x3nsQmRh
	Khf5eK6XDigO3F/SL2ApH3nIU9uZw5DmlhCSnjWSwYq8aVf++Bgnowt7Jqm2jkAQ
	YG7xTBprYQ+pyGjlk0X5Q==
X-ME-Sender: <xms:meQyaQGKYQddJGduzqqBQnUiHc5aV_6Gkd3IFBE-tBJAP0uP64tR-w>
    <xme:meQyaUJ8_7jMdbQX35mjwgAysyMdiMDn7znV7li1NrVThARFTCQq7cN_UVno1Ca6k
    om64IJek5eneduraTsMjBcosUn6b2rHawykJ92pwHLbFAdZZdAUOlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epteefudehvedutdeugfeuveffleduheehfeehffeujeduledvheeivdffleffjedtnecu
    ffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgrlhhmvghrsegurg
    gssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidr
    vgguuhdprhgtphhtthhopegvthhivghnnhgvrdgtrghrrhhivghrvgesfhhoshhsrdhsth
    drtghomhdprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtoheprhgu
    uhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepphhjfieskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhumhhithdrghgrrhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvghnsh
    drfihikhhlrghnuggvrheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:meQyaRO0x8kH-Lzr-tmupzBO5Za-nVg5DkNRm5olew-Ro8cvrDzWGQ>
    <xmx:meQyaU48jQ1nPaWb9U9yNp6BhVA3jjQo1Rc4y9PesZcT1QB4IQuLGg>
    <xmx:meQyaQnH5cNH1hkIuv7_rbKtBaXvYE1F_NT7EQKI8v9cZ5IIohMh8A>
    <xmx:meQyacKeddFIhE7PGDAcC9tHdaTrp9luufxxWCAuQ1RMqAhzGTQJvA>
    <xmx:muQyaQ7yxHPvJzgTkYP1Tv-IGADrMBKVmfrJMJ7wiPryQy8Cr6vvy9Rk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 51D8AC40054; Fri,  5 Dec 2025 08:56:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A173SAdB9O0B
Date: Fri, 05 Dec 2025 14:56:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Harshal Dev" <harshal.dev@oss.qualcomm.com>,
 "Jens Wiklander" <jens.wiklander@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>,
 "Sumit Garg" <sumit.garg@oss.qualcomm.com>,
 "Sumit Garg" <sumit.garg@kernel.org>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Etienne Carriere" <etienne.carriere@foss.st.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Message-Id: <9e44024d-a649-49d6-825f-97f2a11e1691@app.fastmail.com>
In-Reply-To: <45b5f14b-3746-4b05-a4b4-dc9f88e89e52@oss.qualcomm.com>
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <45b5f14b-3746-4b05-a4b4-dc9f88e89e52@oss.qualcomm.com>
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_055645_308171_95751840 
X-CRM114-Status: GOOD (  12.36  )
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

T24gRnJpLCBEZWMgNSwgMjAyNSwgYXQgMTQ6NDUsIEhhcnNoYWwgRGV2IHdyb3RlOgo+IE9uIDEy
LzQvMjAyNSA2OjU3IFBNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPj4gT24gVGh1LCBEZWMgNCwg
MjAyNSBhdCAxMToxN+KAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+IAo+IFRoZSBvbmx5IHVzZXItc3BhY2UgY2xpZW50IHdoaWNoIGlzIGN1cnJlbnRseSB1c2lu
ZyB0aGlzIEFCSSAoYXMgcGVyIAo+IG91ciBrbm93bGVkZ2UpCj4gaXMgdGhlIGxpYnFjb210ZWUg
bGlicmFyeTogCj4gaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcXVpYy10ZWVjL2Jsb2IvbWFpbi9s
aWJxY29tdGVlL3NyYy9saW51eC90ZWUuaCNMNDMyCj4KPiBJZiBJIHVuZGVyc3RhbmQgQXJuZCdz
IGNvbmNlcm4gY29ycmVjdGx5LCBpZiBhIGNvbXBpbGVyIHVzZWQgdG8gYnVpbGQgCj4gdGhlIHVz
ZXItc3BhY2UKPiBjbGllbnQgc2tpcHMgdGhlIHBhZGRpbmcgZm9yIHRlZV9pb2N0bF9vYmplY3Rf
aW52b2tlX2FyZywgaXQgY291bGQgbGVhZCAKPiB0byBpc3N1ZXMuCj4KPiBMZXQncyB3YWl0IGZv
ciBBbWlyJ3MgdmlldyBoZXJlIGFzIHdlbGwsIGhvd2V2ZXIgSSBkbyB0aGluayB0aGUgCj4gZXhw
bGljaXQgcGFkZGluZyB3b3VsZAo+IGJlbmVmaXQgaGVyZS4KPgoKVGhlIHByb2JsZW0gaXMgbXVj
aCBuYXJyb3dlcjogYXMgdGhlIGFtb3VudCBvZiBwYWRkaW5nIGlzIGRldGVybWluZWQKYnkgdGhl
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBBQkksIGtlcm5lbCBhbmQgdXNlcnNwYWNlIG9uIHRoZSBz
YW1lCmFyY2hpdGVjdHVyZSBhbHdheXMgYWdyZWUsIGFuZCBzcGVjaWZpY2FsbHkgMzItYml0IEFy
bSB1c2Vyc3BhY2UKYW5kIDY0LWJpdCBBcm0gdXNlcnNwYWNlIChhYXJjaDY0KSBhbHNvIGhhdmUg
dGhlIHNhbWUgcnVsZXMsIHNvIHRoZXJlCmlzIG5vIHByb2JsZW0gb24gUXVhbGNvbW0ncyBwbGF0
Zm9ybXMgZXZlbiB3aXRoIGNvbXBhdCAzMi1iaXQgdXNlcnNwYWNlLgoKVGhlIG9ubHkgYWN0dWFs
IEFCSSBwcm9ibGVtIHdvdWxkIGhhcHBlbiBvbiAzMi1iaXQgeDg2IChpMzg2KQp1c2Vyc3BhY2Ug
cnVubmluZyBvbiBhIDY0LWJpdCB4ODYga2VybmVsLCBzaW5jZSBpMzg2LWxpbnV4IGNvbXBpbGVy
cwpoYXZlIGRpZmZlcmVudCBhbGlnbm1lbnQgcnVsZXMgZnJvbSBtb3N0IG90aGVyIGFyY2hpdGVj
dHVyZXMuCgogICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
