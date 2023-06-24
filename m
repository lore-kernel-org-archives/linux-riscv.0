Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9180EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdfyvSHM2ZyKse8eakYQXP9CBubSzaxVt72HG7W6O3M=; b=ZoazywfQN0gTIr
	IBd5F17H3306W9VIb23i7qCnlJ70Mh4U2z7gY+ZeHLg6oUVNwNIQOKBcufvVkTOgUcN3X1PcayFWZ
	xpTMfDmUVFxkQfdMvg+S9NfqyrEL295+tZin0f/YxaCMJsDvlcZo1EV5Q3V1RughJVG8mmAUUO02b
	ZPybBQKnHn3WoMx1SFtQwUIf58zkH/XUkMpijG9A2AapkyyAqkgy1EDHnt6PDA7pxgtf0GnaEJm6I
	o676MTPl8lOLBHSTbg1EMyzTVNbn/Og8KdJNH7IITI3ocBB0e0MoQKBJTkMh92uAA6L4KIuz0gxWP
	zTdJ4jhP2+Ex7ATVA0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCtsp-0058aE-3B;
	Sat, 24 Jun 2023 03:24:19 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCtsm-0058Yt-0e
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 03:24:18 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E5165C011D;
	Fri, 23 Jun 2023 23:24:10 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Fri, 23 Jun 2023 23:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687577050; x=1687663450; bh=NbdyWgrnQuAJrNoZdsryau1ERtyp1m+gXJN
	ykYa1YxA=; b=aclqciry9m5HbcG/HJc5sV3Muf2uzQZuIE8Kf0t7MWfOFUMm9ZG
	44XKnZa1ch/yAHYgc4GanR9MG4Qf3ITHUToHKGiOxhKOyRcqc0U221PvtVdZUCnm
	Tgmf3aZjwRZVl3KsM0VarOYPOjSbDU+PwYdly7cKyRfkFt6KuDgqJr2ikmYKa2QL
	OTifyVr99i/3/l98CCpb+FuZbgSSbqo4zboRHTqh2//aXiFlc1EwIRSY6LsB+v4i
	qhkaGe/7mG95ZJpFHAlycqJldw+YV3rA4NLCSmWzokU7YRIg7UCtzdwwR7v06XtR
	JJ8dhRVihS4GbO0N5r17hDFdjstWjuebezQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687577050; x=1687663450; bh=NbdyWgrnQuAJrNoZdsryau1ERtyp1m+gXJN
	ykYa1YxA=; b=d4PIRb+zNvInMZXg7uV18TR7u8P2aT5tk84+XExhpTh5ljIz2OZ
	m35wFQL92rhGx0fVwweFIxT6qXgsia+XGffYd6rAPTbBa3JiCdUIBKYsU2gGuw/A
	yY00txf7DV/BSJABn8ovoBPsuiGLN4OT+hv/ewJYy7cLo7QCZgWeJ31X9Iou0eaZ
	rIjBmEsundTHi4yW5HivwET0gmanqQo1Db2VhGqK0ueYXPsp1dgNA62EogH8dyeO
	vzja91pYhtXr5K1OinJ1IUlMeT47m0kmTpCb1Gm2bDrduJPS+DnLZD0953Xd6Y0f
	VPr4F7lVKPAnJlAmIePo66NWylam+qe4QRw==
X-ME-Sender: <xms:2WGWZDZ-zlWm-wRZUpQNB2tWCLs_8mYA2pYeaLdWVJattHGYvoIxBg>
    <xme:2WGWZCZdDoRMR_t-pOKuvs_UclNzmTLC85E_5d6-RdAMigffQuQ-mtl4VRMCNi5r4
    wJirSwvemXk_-YUPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegiedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpeeffeelhfeivdeujeevudehgfduffevhedvkeefudetvdet
    teegveettdektdffheenucffohhmrghinhepshhsthgrthhushdrvhhsrdhithenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhes
    fhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:2WGWZF8lNuyf7OX8HJOQm7ELhJ6nrpqww5girSNtpd9-Slp_8rK_yQ>
    <xmx:2WGWZJqvGFMMCGdNmFRxX47aYza3SQL8-7LiqVBfMdXByFGDTTR11w>
    <xmx:2WGWZOrkgjkJZ8uOi3F8zbOrhfJlk8iHKl05vB72hB6jqICvQl7HwA>
    <xmx:2mGWZLAtrgneWuEZDP1trMqnSjWhhyGe3i8cchhtgGLUaAWIWrWs_A>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9FAB61700096; Fri, 23 Jun 2023 23:24:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <8f1ba16d-42e3-4e45-9fac-a91b3b0556a8@app.fastmail.com>
In-Reply-To: <1788842.TLkxdtWsSY@diego>
References: <20230228215435.3366914-1-heiko@sntech.de>
 <c01ee919-9abb-4796-9ed4-9bb4565dc863@app.fastmail.com>
 <1961474.usQuhbGJ8B@diego> <1788842.TLkxdtWsSY@diego>
Date: Fri, 23 Jun 2023 23:23:11 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Heiko Stuebner" <heiko@sntech.de>, "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_202416_705503_71858551 
X-CRM114-Status: GOOD (  25.03  )
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

T24gRnJpLCBKdW4gMjMsIDIwMjMsIGF0IDc6MjYgUE0sIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+
IEFtIEZyZWl0YWcsIDIzLiBKdW5pIDIwMjMsIDEyOjIyOjM1IENFU1Qgc2NocmllYiBIZWlrbyBT
dMO8Ym5lcjoKPj4gQW0gRnJlaXRhZywgMjMuIEp1bmkgMjAyMywgMDU6MDY6NDQgQ0VTVCBzY2hy
aWViIFN0ZWZhbiBPJ1JlYXI6Cj4+ID4gT24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDQ6MzUgUE0s
IEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+PiA+ID4gQW0gRG9ubmVyc3RhZywgMjIuIEp1bmkgMjAy
MywgMjA6NTg6MzcgQ0VTVCBzY2hyaWViIFN0ZWZhbiBPJ1JlYXI6Cj4+ID4gPj4gQXJlIHlvdSBh
d2FyZSBvZiAiMy43LiBWZWN0b3IgRml4ZWQtUG9pbnQgRmllbGRzIGluIGZjc3IiIGluCj4+ID4g
Pj4gcmlzY3Ytdi1zcGVjLTAuNy4xLnBkZj8KPj4gPiA+Cj4+ID4gPiBvaCB3b3csIHRoYW5rcyBh
IGxvdCBmb3IgdGhhdCBwb2ludGVyLCBub3cgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4KPj4g
PiA+Cj4+ID4gPiBTbyBpbiB2ZWN0b3ItMC43LjEgZmNzclsxMDo5XSBtaXJyb3JzIHZ4cm0gYW5k
IGZjc3JbOF0gbWlycm9ycyB2eHNhdC4KPj4gPiA+Cj4+ID4gPgo+PiA+ID4gT24gYSBwb3NpdGl2
ZSBub3RlLCB0aGUgVC1IZWFkIGNvcmVzIHNlZW0gdG8gbm90IGltcGxlbWVudCB0aGUgZnVsbAo+
PiA+ID4gdmVjdG9yIDAuNy4xIHNwZWNpZmljYXRpb24gYWZ0ZXIgYWxsLCBpbiB0aGUgZG9jdW1l
bnRhdGlvbiBJIGhhdmUgWzBdCj4+ID4gPiBmY3NyWzMxOjhdIGFyZSBkZWNsYXJlZCBhcyAiMCIg
YW5kIHVwcGVybW9zdCBiaXRzIGFyZSBbNzo1XSBmb3IgdGhlICJmcm0iCj4+ID4gPiBmaWVsZC4K
Pj4gPiAKPj4gPiBHaXZlbiB0aGF0IHRoZSBwZGYgeW91IGxpbmtlZCBkb2VzIG5vdCBtZW50aW9u
IGFueSB2ZWN0b3IgQ1NScywgSSBhbSBub3QKPj4gPiBjb25maWRlbnQgdGhhdCBpdCBwcm92aWRl
cyBhIGNvbXBsZXRlIGFuZCBhY2N1cmF0ZSBkZXNjcmlwdGlvbiBvZiB2ZWN0b3IKPj4gPiBmdW5j
dGlvbmFsaXR5IGluIG90aGVyIHJlZ2lzdGVycyBmb3IgdGhlIEM5MDYgd2l0aCB2ZWN0b3IgZXh0
ZW5zaW9uLgo+PiA+IAo+PiA+IEFzc3VtaW5nIHRoYXQgeW91IGhhdmUgYWNjZXNzIHRvIHN1Y2gg
YSBjaGlwLCBJIHdvdWxkIGJlIG11Y2ggaGFwcGllciB3aXRoCj4+ID4gdGhlIHByb3Bvc2VkICJq
dXN0IGEgY29tbWVudCIgYXBwcm9hY2ggaWYgb3VyIHVuZGVyc3RhbmRpbmcgb2YgdGhlIGJlaGF2
aW9yCj4+ID4gd2VyZSBjb25maXJtZWQgb24gaGFyZHdhcmUgKHNwZWNpZmljYWxseTogY3NyX3dy
aXRlKENTUl9GQ1NSLCAweDcwMCkgc2hvdWxkCj4+ID4gbm90IGFmZmVjdCBjc3JfcmVhZChDU1Jf
VlhSTSkgb3IgY3NyX3JlYWQoQ1NSX1ZYU0FUKSkuCj4+IAo+PiBGb3Igb25lLCB5b3UncmUgcmln
aHQgdGhhdCBJIHNob3VsZCBkZWZpbml0bHkgdHJ5IHRvIGNvbmZpcm0gdGhpcyBvbiBoYXJkd2Fy
ZSA6LSkgLgo+Cj4gb2ssIHNvIG5vdyBJIGtub3cgdGhlIGRvY3VtZW50YXRpb24gaXMgd3Jvbmcu
Cj4KPiAJYmVmb3JlLCB2eHJtIDB4MCwgdnhzYXQgMHgwCj4gd3JpdGluZyB0aGUgMHg3MDAgdG8g
ZmNzcgo+IAlhZnRlciwgdnhybSAweDMsIHZ4c2F0IDB4MQo+Cj4gRXNzZW50aWFsbHkgdGhlIGxp
bmsgYmV0d2VlbiB0aGUgQ1NScyByZWFsbHkgaXMgdGhlcmUgLSBvaCBmdW4uCj4gU28gd2UncmUg
YmFjayBhdCB5b3VyIG9yaWdpbmFsIGNvbmNlcm4gLSBzYWRseS4KPgo+IEkgZ3Vlc3MgSSBuZWVk
IHRvIGZpZ3VyZSBvdXQgaG93IHRvIG5vdCBoYXZlIHRoaXMgc3R1ZmYgYnJlYWsKPiBiZWNhdXNl
IHJlbHlpbmcgb24gdGhlIGZwdSBwYXJ0cyB0byBoYW5kbGUgZmVlbHMgbm90IGNvcnJlY3QKPiBh
dCBmaXJzdCBnbGFuY2UuCgpJIGRvbid0IHNlZSBhIGNvbmNlcHR1YWwgcHJvYmxlbSBoZXJlLgoK
VGhlcmUgYXJlIGEgbGFyZ2UgbnVtYmVyIG9mIHZlY3RvciBpbnN0cnVjdGlvbnMgdGhhdCBhY2Nl
c3MgdGhlIGZsb2F0aW5nIHBvaW50CnN0YXRlIChmcm0sIGZmbGFncywgZnswLi4zMX0pLiAgVGhl
c2UgaW5zdHJ1Y3Rpb25zIHJlcXVpcmUgYSB2YWxpZCBmbG9hdGluZwpwb2ludCBjb250ZXh0LCBz
c3RhdHVzLkZTPjAsIHRyYXAgaWYgc3N0YXR1cy5GUz0wLCBhbmQgc2V0IHNzdGF0dXMuRlM9MyBp
ZiB0aGV5CmNoYW5nZSBhbnl0aGluZy4gIHZmYWRkLCB2ZnN1YiwgdmZtdWwsIHZmZGl2LCB2Zm12
LCBldGMsIGV0YyBpbiBib3RoIDAuNy4xIGFuZCAxLjAuCgowLjcuMSBleHRlbmRzIHRoZSBmbG9h
dGluZyBwb2ludCBzdGF0ZSB0byBpbmNsdWRlIHZ4cm0gYW5kIHZ4c2F0IGFuZCBhZGRzIHZhYWRk
dSwKdm5jbGlwLCB2c211bCwgZXRjIHRvIHRoZSBsaXN0IG9mIGluc3RydWN0aW9ucyB3aGljaCBh
Y2Nlc3MgYm90aCBmbG9hdGluZyBwb2ludCBhbmQKdmVjdG9yIHN0YXRlLiAgVGhpcyBicmVha3Mg
ZmxvYXRpbmctcG9pbnQgZW11bGF0aW9uIChpZiBhIGNvcmUgcHJvdmlkZXMgaW50ZWdlcgp2ZWN0
b3JzIGluIGhhcmR3YXJlLCBpdCBwcm92aWRlcyBhIGZjc3IgcmVnaXN0ZXIgd2l0aCB0aHJlZSB3
cml0ZWFibGUgYml0cywgd2hpY2gKbWVhbnMgdGhhdCBhY2Nlc3NlcyB0byBmY3NyIHdvbid0IHRy
YXAgYW5kIGNhbid0IGJlIGVtdWxhdGVkIHRvIHByb3ZpZGUgYWNjZXNzIHRvCnRoZSBzb2Z0d2Fy
ZSBmcm0gYW5kIGZmbGFncyksIHdoaWNoIGlzIHByb2JhYmx5IHdoeSB0aGUgYmVoYXZpb3Igd2Fz
IGNoYW5nZWQgaW4gMS4wLApidXQgaXMgb3RoZXJ3aXNlIGludGVybmFsbHkgY29uc2lzdGVudC4K
CllvdSBjYW4gY29udGludWUgdG8gdHJlYXQgImZwdSBwYXJ0cyIgYW5kICJ2ZWN0b3IgcGFydHMi
IGFzIGluZGVwZW5kZW50IGFzIGxvbmcgYXMKeW91IHJlY29nbml6ZSB2eHJtIGFuZCB2eHNhdCBh
cyBfZXhjbHVzaXZlbHlfIG93bmVkIGJ5IHRoZSAiZnB1IHBhcnRzIi4KCkFjY2VzcyB0byB2eHJt
IGFuZCB2eHNhdCBzaG91bGQgYmUgZXhjbHVzaXZlbHkgY29udHJvbGxlZCBieSBzc3RhdHVzLkZT
IHNpbmNlIHRoZXkKYXJlIGFsaWFzZXMgZm9yIGZpZWxkcyBpbiBmY3NyLCB3aGlsZSBhY2Nlc3Mg
dG8gdnN0YXJ0L3Z0eXBlL3ZsZW4gc2hvdWxkIGJlCmV4Y2x1c2l2ZWx5IGNvbnRyb2xsZWQgYnkg
c3N0YXR1cy5WUy4gIEl0IHdvdWxkIGJlIGdvb2QgdG8gdGVzdCB0aGlzLCBzaW5jZSBpdCdzIG5v
dAphY3R1YWxseSBpbiB0aGUgc3BlYyAocmlzYy12IGhhcyBhIHJhdGhlciBzeXN0ZW1hdGljIHVu
ZGVyc3BlY2lmaWNhdGlvbiBwcm9ibGVtKSwKYW5kIFQtSGVhZCdzIGlkZWEgb2Ygb2J2aW91c2x5
IGNvcnJlY3QgYmVoYXZpb3IgbWF5IGRpZmZlciBmcm9tIG1pbmUuCgoxLjAgcHV0cyB2eHJtIGFu
ZCB2eHNhdCBpbnRvIHRoZSB2ZWN0b3Igc3RhdGUsIGNvbnRyb2xsZWQgYnkgc3N0YXR1cy5WUzsg
dnNtdWwgbm93CndvcmtzIG9uIHRoZSB2ZWN0b3Igc3RhdGUgb25seSwgc28gYXMgZmFyIGFzIHN0
YXRlIG1hbmFnZW1lbnQgaXMgY29uY2VybmVkIGl0IG5vdwphY3RzIGxpa2UgdmFkZCBhbmQgbm90
IGxpa2UgdmZhZGQuICBUaGlzIGlzIGFsc28gaW50ZXJuYWxseSBjb25zaXN0ZW50LCBidXQgdnhj
c3IKbXVzdCBiZSBvd25lZCBieSB3aG9ldmVyIG1hbmFnZXMgc3N0YXR1cy5WUy4KCkl0J3MgYSBs
aXR0bGUgYml0IHdlaXJkIHRvIHNheSAidnhybSBhbmQgdnhzYXQgbGl2ZSBpbiBkaWZmZXJlbnQg
cGFydHMgb2YgdGhlIGtlcm5lbApzdGF0ZSBkZXBlbmRpbmcgb24gViBleHRlbnNpb24gdmVyc2lv
biIgYnV0IGl0IG1pZ2h0IGJlIGxlc3Mgd2VpcmQgdG8gc2F5ICJmY3NyIGFuZAphbGwgaXRzIHBh
cnRzIGxpdmVzIHNvbWV3aGVyZSwgdnhjc3IgYW5kIGFsbCBpdHMgcGFydHMgbGl2ZXMgc29tZXdo
ZXJlIGVsc2UsCnZ4Y3NyIGRvZXNuJ3QgZXhpc3QgaW4gMC43LjEiLiAgSXMgdGhpcyBhZGVxdWF0
ZT8KCi1zCgo+Cj4gSGVpa28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
