Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF122CCD190
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n+o/ArEyACZz0D7iZU0VsI1XamCpBoo6pvwYpyTmbPA=; b=Ndjccihcd+rhUEmhLXIpMInW/f
	DyADKQRIOsjfWyrb4LgeIOxAHEShch225zRlPsahwUXqy8pzdyhH6CSCwZBS4qfwGzekvED+oc93d
	af++vcRz39zXq2k2/QI7SEWvgtQFmue4yTCBXrZqR5h0DOY8CQ64zf0g3vd+X369R0KzXUwdbEAuz
	Ftz07L5cj9MKFvBM8soSveYWCD+w5dC3KiTFO2qhewtA3IcZKzRdn5Ggngi6aFMYlS8DGw07KeoIO
	Jrd9ZQLaNLQnaLsiZ/r0mv6bMLywXdbQcZDEDg8+8rp/72TgGZGXLfzB7SKAkDOSVaIZvLr01Jr08
	6htjX3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wFC-00000000nvj-3ZyU;
	Wed, 15 Oct 2025 07:48:22 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wFB-00000000nvK-0TJy
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 07:48:22 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CAD2C7A01B8;
	Wed, 15 Oct 2025 03:48:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 03:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760514497;
	 x=1760600897; bh=RPb7u4xx/8qqCuf2oUI5wjlc24oyWMuCecmZxoE4X84=; b=
	Pq+2ekRObjZTvtZI7FGIsKHXZ7rTbxjIXIeXLHekKKFmJglgIlgL/G3JVVKS2cPq
	zmt+s1bJVdERsg24Ov8++y87RCvGIhKTAOZx9XPYADKYar/0rqtZCFz1FcV+iTJ9
	SP9byB1UdPGjXxa3PETMNIeVa/7+SdOt2NQxAwAyC2bxJ77mQ+Yc2Xy0xei0mGls
	dVENzhycADwBQCJM9jKH+aDfz+v92TV6GU3d3Ps4Jx8ohdQ3i7erHqSdN/cZy8GC
	8wgf/RxY3/KNBaUdoR1dWyVtPZJioASGLf908ZdxTr/ASl04cAsEuBChfD2D9lif
	HFVwZp7GONk2shTsHYWrpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760514497; x=
	1760600897; bh=RPb7u4xx/8qqCuf2oUI5wjlc24oyWMuCecmZxoE4X84=; b=P
	P8As33CD5/IVeoE5nDPaUB08USXI3sb0M8eLdwrJ/xa666ST4nxkdPU/820fjm9d
	cadcQmKuC+jMNdiNsUSKF3p3Ih5jtqRClvOH2citjgFU8lcqVwdGay75uNeF/T5U
	P0ToLFsESgxZx3udHJVJWqWEKBrvKGYcsa74+ce3csDBcKV2kCvHx5b+gXK2cnJW
	pR4QygXrl8Gw31vrpGS9ap7CHLpga/R56PHTDbD3F85irFCk73HtPNyTekEAVRD+
	4tpym6B56tn0/nz2/PqyoddWhIc5M6rrLTb+oDrdpkqIZ8UiLjusKl19dbUUPZc4
	fd3ZIAntYp3YYLeGI6MZg==
X-ME-Sender: <xms:v1HvaF1eoori7IPYSnFkTHnRFQMj1BjLOOuctp9sLUBli-Ih2bmbSA>
    <xme:v1HvaG6PNGcjuDfQr4mxHFSUC1rzYJbTJw3TsF_tiNNjKlC4i3MwlAy_1OJay-vHO
    680_rJLK_A_ADNBg1OUXcDkanDl1KYndVZBYp6xz2hJRaYAZTvyn_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhope
    iiudeihedvtdejgeegfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrshgrhhhi
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepihesmhgrshhkrhgrhidrmhgvpdhrtghpthhtoh
    eprhhonhgsohhgohesohhuthhlohhokhdrtghomhdprhgtphhtthhopehlgidvgeesshht
    uhdrhihnuhdrvgguuhdrtghnpdhrtghpthhtohepfhgrlhgtohhnsehtihhnhihlrggsrd
    horhhg
X-ME-Proxy: <xmx:v1HvaHGhZmoNBMd1kYBSezIFtgDlQJhQoeDAmRm8ZjtbdWMODQvFmg>
    <xmx:v1HvaAvDypVvQShhy7wsGqQYcrx8Doz1ApqeFWMsNx-OYB8pNGJ4ug>
    <xmx:v1HvaNl-cI05bZPbO9fJsBJe_h29tuGHTXu4P_SjJF7MfM8VzqJvhA>
    <xmx:v1HvaDMNHvClW8XavlcxP4ut7l3HfEmziXf88sKkVS7ouAlId7m79A>
    <xmx:wVHvaP4mykMyhdrihqGaClJRS0DTgfIa8AZQPYxcPVi1I8sJh8yWF1Io>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8177B700054; Wed, 15 Oct 2025 03:48:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-HrBBL8x6OF
Date: Wed, 15 Oct 2025 09:47:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yuan Tan" <tanyuan@tinylab.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 i@maskray.me, "Zhangjin Wu" <falcon@tinylab.org>, ronbogo@outlook.com,
 z1652074432@gmail.com, lx24@stu.ynu.edu.cn
Message-Id: <33333fdd-2aa2-4ce0-8781-92222829ea12@app.fastmail.com>
In-Reply-To: <30C972B6393DBAC5+cover.1760463245.git.tanyuan@tinylab.org>
References: <30C972B6393DBAC5+cover.1760463245.git.tanyuan@tinylab.org>
Subject: Re: [PATCH v2 0/8] dce, riscv: Unused syscall trimming with PUSHSECTION and
 conditional KEEP()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_004821_202869_B8301880 
X-CRM114-Status: GOOD (  19.76  )
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

T24gV2VkLCBPY3QgMTUsIDIwMjUsIGF0IDA4OjE2LCBZdWFuIFRhbiB3cm90ZToKPiBIaSBhbGws
Cj4KPiBUaGlzIHNlcmllcyBhaW1zIHRvIGludHJvZHVjZSBzeXNjYWxsIHRyaW1taW5nIHN1cHBv
cnQgYmFzZWQgb24gZGVhZCBjb2RlCj4gYW5kIGRhdGEgZWxpbWluYXRpb24gKERDRSkuIFRoaXMg
Y2FuIHJlZHVjZSB0aGUgZmluYWwgaW1hZ2Ugc2l6ZSwgd2hpY2ggaXMKPiBwYXJ0aWN1bGFybHkg
dXNlZnVsIGZvciBlbWJlZGRlZCBkZXZpY2VzLCB3aGlsZSBhbHNvIHJlZHVjaW5nIHRoZSBhdHRh
Y2sKPiBzdXJmYWNlLiBJdCBtaWdodCBmdXJ0aGVyIGJlbmVmaXQgc3BlY2lhbGl6ZWQgc2NlbmFy
aW9zIHN1Y2ggYXMgdW5pa2VybmVscwo+IG9yIExUTyBidWlsZHMsIGFuZCBjb3VsZCBwb3RlbnRp
YWxseSBoZWxwIHNocmluayB0aGUgaW5zdHJ1Y3Rpb24gY2FjaGUKPiBmb290cHJpbnQuCj4KPiBC
ZXNpZGVzIHRoYXQsIHRoaXMgc2VyaWVzIGFsc28gaW50cm9kdWNlcyBhIG5ldyBQVVNIU0VDVElP
TiBtYWNyby4gVGhpcwo+IHdyYXBwZXIgYWxsb3dzIHNlY3Rpb25zIGNyZWF0ZWQgYnkgLnB1c2hz
ZWN0aW9uIHRvIGhhdmUgYSBwcm9wZXIgcmVmZXJlbmNlCj4gcmVsYXRpb25zaGlwIHdpdGggdGhl
aXIgY2FsbGVycywgc28gdGhhdCAtLWdjLXNlY3Rpb25zIGNhbiBzYWZlbHkgd29yawo+IHdpdGhv
dXQgcmVxdWlyaW5nIHVuY29uZGl0aW9uYWwgS0VFUCgpIGVudHJpZXMgaW4gbGlua2VyIHNjcmlw
dHMuCj4KPiBTaW5jZSB0aGUgbmV3IHN5c2NhbGx0Ymwuc2ggaW5mcmFzdHJ1Y3R1cmUgaGFzIGJl
ZW4gbWVyZ2VkLCBJIHRoaW5rIGl04oCZcyBhCj4gZ29vZCB0aW1lIHRvIHB1c2ggdGhpcyBwYXRj
aHNldFRPRE8/IGZvcndhcmQuCj4KPiBQYXRjaCAx4oCTMyBpbnRyb2R1Y2UgdGhlIGluZnJhc3Ry
dWN0dXJlIGZvciBUUklNX1VOVVNFRF9TWVNDQUxMUywgbWFpbmx5Cj4gYWxsb3dpbmcgc3lzY2Fs
bHRibC5zaCB0byBkZWNpZGUgd2hpY2ggc3lzY2FsbHMgdG8ga2VlcCBhY2NvcmRpbmcgdG8KPiBV
U0VEX1NZU0NBTExTLgo+IFBhdGNoIDQgZW5hYmxlcyBUUklNX1VOVVNFRF9TWVNDQUxMUyBmb3Ig
dGhlIFJJU0MtViBhcmNoaXRlY3R1cmUuIFdpdGgKPiBzeXNjYWxsdGJsLnNoIG5vdyBhdmFpbGFi
bGUsIHRoaXMgZmVhdHVyZSBzaG91bGQgYmUgYXBwbGljYWJsZSB0byBhbGwKPiBhcmNoaXRlY3R1
cmVzIHRoYXQgc3VwcG9ydCBMRF9ERUFEX0NPREVfREFUQV9FTElNSU5BVElPTiBhbmQgdXNlCj4g
c3lzY2FsbHRibC5zaCwgYnV0IGxldOKAmXMgZm9jdXMgb24gUklTQy1WIGZpcnN0Lgo+IFBhdGNo
IDXigJM4IGFkZHJlc3MgdGhlIGRlcGVuZGVuY3kgaW52ZXJzaW9uIHByb2JsZW0gY2F1c2VkIGJ5
IHNlY3Rpb25zCj4gY3JlYXRlZCB3aXRoIC5wdXNoc2VjdGlvbiB0aGF0IGFyZSBmb3JjaWJseSBy
ZXRhaW5lZCBieSBLRUVQKCkgaW4gbGlua2VyCj4gc2NyaXB0cy4KClRoYW5rcyBhIGxvdCBmb3Ig
eW91ciB3b3JrIG9uIHRoaXMuIEkgdGhpbmsgaXQgaXMgaW5kZWVkIHZhbHVhYmxlIHRvCmJlIGFi
bGUgdG8gb3B0aW1pemUga2VybmVscyB3aXRoIGEgc21hbGxlciBzdWJzZXQgb2Ygc3lzdGVtIGNh
bGxzIGZvcgprbm93biB3b3JrbG9hZHMsIGFuZCBoYXZlIGFzIG11Y2ggZGVhZCBjb2RlIGVsaW1p
bmF0aW9uIGFzIHBvc3NpYmxlLgoKSG93ZXZlciwgSSBjb250aW51ZSB0byB0aGluayB0aGF0IHRo
ZSBhZGRlZCBzY3JpcHRpbmcgd2l0aCBhIGtub3duCnNldCBvZiBzeXNjYWxsIG5hbWVzIGlzIGZ1
bmRhbWVudGFsbHkgdGhlIHdyb25nIGFwcHJvYWNoIHRvIGdldCB0bwp0aGlzIGxpc3Q6IFRoaXMg
YWRkcyBjb21wbGV4aXR5IHRvIHRoZSBidWlsZCBwcm9jZXNzIGluIG9uZSBvZgp0aGUgYXJlYXMg
dGhhdCBpcyBhbHJlYWR5IHRvbyBjb21wbGljYXRlZCwgYW5kIGl0IGR1cGxpY2F0ZXMgd2hhdAp3
ZSBjYW4gYWxyZWFkeSBkbyB3aXRoIEtjb25maWcgZm9yIGEgc3Vic2V0IG9mIHRoZSBzeXN0ZW0g
Y2FsbHMuCgpJIHRoaW5rIHRoZSB3YXkgd2Ugc2hvdWxkIGNvbmZpZ3VyZSB0aGUgc2V0IG9mIHN5
c2NhbGxzIGluc3RlYWQgaXMKdG8gYWRkIG1vcmUgS2NvbmZpZyBzeW1ib2xzIGd1YXJkZWQgYnkg
Q09ORklHX0VYUEVSVCB0aGF0IHR1cm4KY2xhc3NlcyBvZiBzeXNjYWxscyBvbiBvciBvZmYuIFlv
dSBoYXZlIG9idmlvdXNseSBkb25lIHRoZSByZXNlYXJjaAp0byBjb21lIHVwIHdpdGggYSBsaXN0
IG9mIHVzZWQvdW51c2VkIGVudHJ5IHBvaW50cyBmb3Igb25lIG9yIG1vcmUKd29ya2xvYWRzLiBD
YW4geW91IHNoYXJlIHRob3NlIGxpc3RzPwoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
