Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E19EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 03:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mJEm3iDKy268zIHtMeO1FoVGByyk9Vfdrw8UxMj1Yo=; b=WaAweT7BtDwMZT
	nmgYJz9dfusTPuVvgF8y+0Kn82zu98+8b1BSi3nKNaZnPHKH6VTIYfvYVazsLuIlmQ6mxQFNSb3h+
	7EGMpLf626HOdOKlnqkWq1gE9FXL3VmOI2YNzeiVmS63G75DoyA2R9L783y3wd7KhjNKL8rs3RzVH
	AA5G4wIX6v+waoxYfFSDJZTYt6waPGNrANpM4W+uTk/wDwUwKaHJXy3pjyX1SfqYaDgl1xjc0N8CK
	xSODSrUsjQ9r4DONxW7l0Skg1tt8qFeHAv3wGeI2LDLMs9n5Fv4WpUDPjSRC4s4YFb7XppiRILvpv
	pEooQe/4zWPLBhVUIvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCX8k-002PD1-1B;
	Fri, 23 Jun 2023 03:07:14 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCX8g-002PCN-0r
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 03:07:12 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id B0AE1320093A;
	Thu, 22 Jun 2023 23:07:05 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Thu, 22 Jun 2023 23:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687489625; x=1687576025; bh=zc5Go08f26aOzzulWzMcRDT6ExbHeakAyT6
	t5lQIPUI=; b=h3/AXS9xmtUA7qGJMkyzw4rljncEljhzL6lBelGYvZzE8gcJiF7
	5D/beNqo5yo/Wz/4zC/P9jTU990o3QYPrnrbS+wXtpPewbfLeIgaPSMNmK5KDtYf
	NICu39DortiQ198td2udfa0+sF3qxYS8ZO+1bO236SFQlS4QpHnA5Ovu6Q21ytAR
	O1Klc8eK11F97qkJzNqDS5EmCarn6am9ya1fFNNkNk9ZVUm1rkOFBzS74MoVDGbG
	lQIGzOfZMUa5ctsPpE8L+dhYKO3ixiOrifOR74fy+ChScrcW7zBJWORZIPhSzh8d
	RFzN9b+lwUktcfZal3xOVh4JV2E13qJcCCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687489625; x=1687576025; bh=zc5Go08f26aOzzulWzMcRDT6ExbHeakAyT6
	t5lQIPUI=; b=eHLEqZZwScuPAFSBC5/O6mMNCRgh09UKe9NcmEYuhDuc5UfkSDU
	DHeq5wSxXqQDZtxRZb8SD6eOzK9Fwe4RqMgFAkFL2Mt3qsZYl4/ePdd4336eWsAB
	/TkbZxiHmb6IETi0zOYUITktpwshsu0xGIw3aW2uPhAYPZHDcoIuUNsJhAX3IjB1
	HOmSxh5gN1uj8rjjnjR0x8mWR5rXXAfIVVbilBy+oENtSBfFnvcUzmOGTja+ki/v
	hbtF05uyqFlDeREr/UgAUNwb11MiOlU5Wf9l+kzKad14F5Ua98rnHRL7RKdHzjDe
	lpn7uxePybyf4gMf/5ZBo1lkePilC7HiIsg==
X-ME-Sender: <xms:WQyVZPbgEh_xOEqPUmZ26TrTGRrELfyhWeXYmSICaoig3xatBMosCA>
    <xme:WQyVZObo5C8wQwpMqzBSEbhTvKH4uh_Mm6bg6fUUp_jUq6QC_7zR4sT3xgfJOPh2e
    bm2WWVomo7OejZV-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegfedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpeeijedvffelueelveeitedvkefgjeegueehfedtgfffjefg
    tdfhieffhfdtgeegjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhorhgvrghrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:WQyVZB8mHi2pdopa-_wb-ffWxpyW_XiXZGMP2_BWRHX0BlNuFc-6iQ>
    <xmx:WQyVZFqBjZfTiHFgkMJZzEq9GilHGGWwxUxxSnDtiALPUn46h-dlYQ>
    <xmx:WQyVZKqzsjDU0JbwFCQhHbgxUfEShwkBbX97T6_o0VQakTERMDsKxw>
    <xmx:WQyVZHBTdvB5oHEfX9YOJaHL5KtloSPA9AwgpSNBAMHPn025KvHsbA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ECA061700093; Thu, 22 Jun 2023 23:07:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <c01ee919-9abb-4796-9ed4-9bb4565dc863@app.fastmail.com>
In-Reply-To: <9132027.CDJkKcVGEf@diego>
References: <20230228215435.3366914-1-heiko@sntech.de>
 <1941316.PYKUYFuaPT@diego>
 <23381fc8-c297-46ed-9e11-a2643e18e4c9@app.fastmail.com>
 <9132027.CDJkKcVGEf@diego>
Date: Thu, 22 Jun 2023 23:06:44 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Heiko Stuebner" <heiko@sntech.de>, "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_200710_861229_EE01E359 
X-CRM114-Status: GOOD (  11.23  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDQ6MzUgUE0sIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+
IEFtIERvbm5lcnN0YWcsIDIyLiBKdW5pIDIwMjMsIDIwOjU4OjM3IENFU1Qgc2NocmllYiBTdGVm
YW4gTydSZWFyOgo+PiBBcmUgeW91IGF3YXJlIG9mICIzLjcuIFZlY3RvciBGaXhlZC1Qb2ludCBG
aWVsZHMgaW4gZmNzciIgaW4KPj4gcmlzY3Ytdi1zcGVjLTAuNy4xLnBkZj8KPgo+IG9oIHdvdywg
dGhhbmtzIGEgbG90IGZvciB0aGF0IHBvaW50ZXIsIG5vdyBJIHVuZGVyc3RhbmQgeW91ciBjb25j
ZXJuLgo+Cj4gU28gaW4gdmVjdG9yLTAuNy4xIGZjc3JbMTA6OV0gbWlycm9ycyB2eHJtIGFuZCBm
Y3NyWzhdIG1pcnJvcnMgdnhzYXQuCj4KPgo+IE9uIGEgcG9zaXRpdmUgbm90ZSwgdGhlIFQtSGVh
ZCBjb3JlcyBzZWVtIHRvIG5vdCBpbXBsZW1lbnQgdGhlIGZ1bGwKPiB2ZWN0b3IgMC43LjEgc3Bl
Y2lmaWNhdGlvbiBhZnRlciBhbGwsIGluIHRoZSBkb2N1bWVudGF0aW9uIEkgaGF2ZSBbMF0KPiBm
Y3NyWzMxOjhdIGFyZSBkZWNsYXJlZCBhcyAiMCIgYW5kIHVwcGVybW9zdCBiaXRzIGFyZSBbNzo1
XSBmb3IgdGhlICJmcm0iCj4gZmllbGQuCgpHaXZlbiB0aGF0IHRoZSBwZGYgeW91IGxpbmtlZCBk
b2VzIG5vdCBtZW50aW9uIGFueSB2ZWN0b3IgQ1NScywgSSBhbSBub3QKY29uZmlkZW50IHRoYXQg
aXQgcHJvdmlkZXMgYSBjb21wbGV0ZSBhbmQgYWNjdXJhdGUgZGVzY3JpcHRpb24gb2YgdmVjdG9y
CmZ1bmN0aW9uYWxpdHkgaW4gb3RoZXIgcmVnaXN0ZXJzIGZvciB0aGUgQzkwNiB3aXRoIHZlY3Rv
ciBleHRlbnNpb24uCgpBc3N1bWluZyB0aGF0IHlvdSBoYXZlIGFjY2VzcyB0byBzdWNoIGEgY2hp
cCwgSSB3b3VsZCBiZSBtdWNoIGhhcHBpZXIgd2l0aAp0aGUgcHJvcG9zZWQgImp1c3QgYSBjb21t
ZW50IiBhcHByb2FjaCBpZiBvdXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgYmVoYXZpb3IKd2VyZSBj
b25maXJtZWQgb24gaGFyZHdhcmUgKHNwZWNpZmljYWxseTogY3NyX3dyaXRlKENTUl9GQ1NSLCAw
eDcwMCkgc2hvdWxkCm5vdCBhZmZlY3QgY3NyX3JlYWQoQ1NSX1ZYUk0pIG9yIGNzcl9yZWFkKENT
Ul9WWFNBVCkpLgoKLXMKCj4gU28gSSBndWVzcyBhIGNvZGUgY29tbWVudCBzaG91bGQgc3VmZmlj
ZSB0byBleHBsYWluIDotKQo+Cj4KPiBSZWdhcmRzCj4gSGVpa28KPgo+Cj4gWzBdIAo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkwNi9ibG9iL21haW4vZG9jLyVFNyU4RSU4
NCVFOSU5MyU4MUM5MDYlRTclOTQlQTglRTYlODglQjclRTYlODklOEIlRTUlODYlOEMucGRmCj4g
MTYuMy4xLjMg5rWu54K55o6n5Yi254q25oCB5a+E5a2Y5Zmo77yIRkNTUu+8iSBvbiBwYWdlIDMz
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
