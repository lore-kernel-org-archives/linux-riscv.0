Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95628C04EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:45:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CFE0214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKxLsyAe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vYtxbIFH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1mHTuXE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CFE0214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzHBeX9A7Xv90BKeseV4e+Pz7b/Jz0SyWWGH2SqT6pU=; b=RKxLsyAeNzyxG8
	qczaFfYDYmTnfw0HJ7xAbCKcODlFnHZW6yU9j/wSc/v4Dlo6wBmXVA/uR30pghPIaLuggB7r2Wbb+
	3K68oEzBx/TFBHPrleF1idOvcpt73dZUYZsxkP5SSg6wNLkrQVJSb3ijC0a26f151Ibn1QWa8cdkH
	pLc5N1WQ8/NbNwpxm8PiJxuQ+tsHG2p42Hwem6Fl7ZHWrtJ5p6V9cMQG4/Do2fdAHyuOwX4/2ir0M
	paYpnCHrGyaPgWwls13B/9/Vpa5zzX7BtRMX8NY6E44WCqBIkwuH2SF+YKpRmwpgx76bPlW0XyKE4
	CbZKF2+6x5ARwJTgJg/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOmfX-00033o-2d; Mon, 19 Nov 2018 16:45:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmfV-0002qd-C0
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 16:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ADKlYvoqStJ6xtgbjELNxSEP+2pBGdk3EwQEUhmNpA=; b=vYtxbIFHn4hS8dsoUz3WQohcrE
 z+0tL6KP0rgVqQ2eemsHZysNzOAdhbV6ryktlm9YHwh4xjswxl7uShhpw8lavA0Vi7VMjFnSEOn7w
 nG2OyPFjQ4a5uU5A/nvKvoW1xR8UzhqYqpMUURAWmNQWG7rp5YgAztuowcxs0jcB7LaTDJlUcb1ZO
 IBeEkwt1geRYZ/sqkbvQs8PaNb75ycJR42Q/qxlmpjH2wdgq5OLoeyZVWF9GeRAGVTfQorkXNvbvb
 HW1qAArecc6bbQJ+5YZD8Cn0y+dQe2qPvB/l4CVPfhvKsVrlfyMHaorgYxnyiyry/TtBiZbpazYFS
 FIDLly8A==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmfS-0001zx-Go
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 16:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=1ADKlYvoqStJ6xtgbjELNxSEP+2pBGdk3EwQEUhmNpA=; 
 b=1mHTuXE+gvQxc3bvCyJ7ustNyHQV8cqH8uO/yLvQyg43xU8GwwYDNm+UL6B/ZGoTjPBxBd+tvoemh4u6TIggW6fRF+ygyaCvwxI6AsbmYBqGa/s/kRFXcdqbN/LiupU/G9friRtj5LjcHHzxrJgrOdqXpD+9Dnf0jezqLq//AuU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1gOmfC-0008WJ-Ba; Mon, 19 Nov 2018 17:44:42 +0100
Date: Mon, 19 Nov 2018 17:44:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
Message-ID: <20181119164442.GB31955@lunn.ch>
References: <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch> <mvmva4t9h8x.fsf@suse.de>
 <20181119162529.GA31955@lunn.ch> <mvmo9al9gfl.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmo9al9gfl.fsf@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_164458_584653_2A4C0EFC 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119164442.lpLOijc7iIjfO8iGS2XSRCzSrTh5WK7dD7Y9J8xTnSc@z>

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDU6MzI6MTRQTSArMDEwMCwgQW5kcmVhcyBTY2h3YWIg
d3JvdGU6Cj4gT24gTm92IDE5IDIwMTgsIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3Jv
dGU6Cj4gCj4gPiBMb2NrIGRlYnVnZ2luZzogcHJvdmUgbG9ja2luZyBjb3JyZWN0bmVzcwo+IAoK
TGV0cyBzZWUgaG93IG11Y2ggdGhpcyBnZXRzIG1lc3NlZCB1cCBieSBlbWFpbC4uLgoKLmNvbmZp
ZyAtIExpbnV4L2FybSA0LjIwLjAtcmMyIEtlcm5lbCBDb25maWd1cmF0aW9uCiA+IEtlcm5lbCBo
YWNraW5nID4gTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKSDilIDi
lIDilIDilIDilIDilIAKICDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIAgTG9jayBEZWJ1
Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKSDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJAKICDilIIgIEFycm93IGtleXMgbmF2aWdhdGUgdGhlIG1lbnUuICA8RW50ZXI+
IHNlbGVjdHMgc3VibWVudXMgLS0tPiAg4pSCICAKICDilIIgIChvciBlbXB0eSBzdWJtZW51cyAt
LS0tKS4gIEhpZ2hsaWdodGVkIGxldHRlcnMgYXJlIGhvdGtleXMuICAg4pSCICAKICDilIIgIFBy
ZXNzaW5nIDxZPiBpbmNsdWRlcywgPE4+IGV4Y2x1ZGVzLCA8TT4gbW9kdWxhcml6ZXMgICAgICAg
ICAg4pSCICAKICDilIIgIGZlYXR1cmVzLiAgUHJlc3MgPEVzYz48RXNjPiB0byBleGl0LCA8Pz4g
Zm9yIEhlbHAsIDwvPiBmb3IgICAg4pSCICAKICDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQIOKUgiAgCiAg
4pSCIOKUgiAgICBbKl0gTG9jayBkZWJ1Z2dpbmc6IHByb3ZlIGxvY2tpbmcgY29ycmVjdG5lc3Mg
ICAgICAgICAgIOKUgiDilIIgIAogIOKUgiDilIIgICAgWyBdIExvY2sgdXNhZ2Ugc3RhdGlzdGlj
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDilIIg4pSCICAKICDilIIg4pSCICAgIC0q
LSBSVCBNdXRleCBkZWJ1Z2dpbmcsIGRlYWRsb2NrIGRldGVjdGlvbiAgICAgICAgICAgICAg4pSC
IOKUgiAgCiAg4pSCIOKUgiAgICAtKi0gU3BpbmxvY2sgYW5kIHJ3LWxvY2sgZGVidWdnaW5nOiBi
YXNpYyBjaGVja3MgICAgICAgIOKUgiDilIIgIAogIOKUgiDilIIgICAgLSotIE11dGV4IGRlYnVn
Z2luZzogYmFzaWMgY2hlY2tzICAgICAgICAgICAgICAgICAgICAgICDilIIg4pSCICAKICDilIIg
4pSCICAgIC0qLSBXYWl0L3dvdW5kIG11dGV4IGRlYnVnZ2luZzogU2xvd3BhdGggdGVzdGluZyAg
ICAgICAg4pSCIOKUgiAgCiAg4pSCIOKUgiAgICAtKi0gUlcgU2VtYXBob3JlIGRlYnVnZ2luZzog
YmFzaWMgY2hlY2tzICAgICAgICAgICAgICAgIOKUgiDilIIgIAogIOKUgiDilIIgICAgLSotIExv
Y2sgZGVidWdnaW5nOiBkZXRlY3QgaW5jb3JyZWN0IGZyZWVpbmcgb2YgbGl2ZSBsb2PilIIg4pSC
ICAKICDilIIg4pSCICAgIFsgXSBMb2NrIGRlcGVuZGVuY3kgZW5naW5lIGRlYnVnZ2luZyAgICAg
ICAgICAgICAgICAgICAg4pSCIOKUgiAgCiAg4pSCIOKUgiAgICBbKl0gU2xlZXAgaW5zaWRlIGF0
b21pYyBzZWN0aW9uIGNoZWNraW5nICAgICAgICAgICAgICAgIOKUgiDilIIgIAogIOKUgiDilIIg
ICAgWyBdIExvY2tpbmcgQVBJIGJvb3QtdGltZSBzZWxmLXRlc3RzICAgICAgICAgICAgICAgICAg
ICDilIIg4pSCICAKICDilIIg4pSCICAgIDwgPiB0b3J0dXJlIHRlc3RzIGZvciBsb2NraW5nICAg
ICAgICAgICAgICAgICAgICAgICAgICAg4pSCIOKUgiAgCiAg4pSCIOKUgiAgICA8ID4gV2FpdC93
b3VuZCBtdXRleCBzZWxmdGVzdHMgICAgICAgICAgICAgICAgICAgICAgICAgIOKUgiDilIIgIAog
IOKUgiDilJTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilJgg4pSCICAKICDilJzilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKQg
IAogIOKUgiAgICA8U2VsZWN0PiAgICA8IEV4aXQgPiAgICA8IEhlbHAgPiAgICA8IFNhdmUgPiAg
ICA8IExvYWQgPiAgICDilIIgIAogIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgCiAgICAK
SWYgeW91IGNhbm5vdCBzZWUgaXQgYXQgYWxsLCBpdCBwcm9iYWJseSBtZWFucyB5b3UgYXJlIG1p
c3NpbmcgYQpkZXBlbmRlbmN5OgoKICDilIIgICBEZXBlbmRzIG9uOiBERUJVR19LRVJORUwgWz15
XSAmJiBcICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCICAKICDilIIgTE9DS19ERUJVR0dJ
TkdfU1VQUE9SVCBbPXldICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCICAK
CiAgICBBbmRyZXcKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
