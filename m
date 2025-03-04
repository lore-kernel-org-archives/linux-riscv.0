Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F2EC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzEzRIMcA+ZhiGlxbZYJ6F2nC7mY4xFy9tons2Ks3wM=; b=NAdqDyovrMKp0K
	7pmt1IO74GeOm3aTbkovDmBHHa7YuYFLLJIADhn8MkcWYFWCbXHme4cUnhIYwRdXppKUwCoCOSsau
	vAJP5M72VTFo8t+GEBgy5adytfQMSyfNlcO0U8531B6KRXB4R6XehgC5TOtSB93yg7vm3WSxMoeah
	QRMmnla1cWrxBG4A0hnoQoBZRH8IoTdubZrcMh0yacofVCJMXXpMI7LEyDjmm/c8V/58hWbkbcVDo
	FkiWpkssglPxdfNrxU6PvtEB6088lwaeg3J9TtOf7DmPtItu2BHlR2RqCuviQmKfWPi2UVPwzs2vG
	jOtN8WlH1Q/pN33jd4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMrv-00000003Ssb-0R1I;
	Tue, 04 Mar 2025 07:39:11 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMrs-00000003Srd-2E1P
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:39:09 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B8E58343072;
	Tue, 04 Mar 2025 07:39:05 +0000 (UTC)
Date: Tue, 4 Mar 2025 07:39:01 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250304073901-GYA60841@gentoo>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx>
 <20250303124011-GYA59067@gentoo>
 <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_233908_592167_567A2D64 
X-CRM114-Status: GOOD (  20.05  )
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

SGkgTGludXMgV2FsbGVpajoKCk9uIDA4OjMxIFR1ZSAwNCBNYXIgICAgICwgTGludXMgV2FsbGVp
aiB3cm90ZToKPiBPbiBNb24sIE1hciAzLCAyMDI1IGF0IDE6NDDigK9QTSBZaXh1biBMYW4gPGRs
YW5AZ2VudG9vLm9yZz4gd3JvdGU6Cj4gPiBPbiAxOTozMCBTdW4gMDIgTWFyICAgICAsIFRob21h
cyBHbGVpeG5lciB3cm90ZToKPiAKPiA+ID4gV2h5IGlzIHRoZSB0aHJlZSBjZWxsIHRyYW5zbGF0
aW9uIG5vdCBmb2xsb3dpbmcgdGhlIG9uZS90d28gY2VsbCBzY2hlbWUKPiA+ID4gYW5kIGhhcyB0
aGUgcGFyYW1ldGVycyBhdCB0aGUgc2FtZSBwbGFjZSAoaW5kZXggMCwxKSwgaS5lLiBhZGRpbmcg
dGhlCj4gPiA+IGV4dHJhIGluZm9ybWF0aW9uIGF0IHRoZSBlbmQ/IFRoYXQgbWFrZXMgc2Vuc2Ug
dG8gbWUgYXMgdGhlIGV4dHJhIGNlbGwKPiA+ID4gaXMgb2J2aW91c2x5IG5vdCBkaXJlY3RseSBy
ZWxhdGVkIHRvIHRoZSBpbnRlcnJ1cHQgbWFwcGluZy4KPiA+Cj4gPiBJIHRoaW5rIHdlIGN1cnJl
bnRseSBqdXN0IGZvbGxvd2luZyB0aGUgc2NoZW1lIHdpdGggZ3BpbyBjZWxscyBvcmRlcgo+ID4g
c2NoZW1lLCB3aGljaCBpcyAoaW5kZXgoaW5zdGFuY2UpIG9mZnNldCBmbGFnLi4pLCB0aGUgaW5k
ZXggYW5kIG9mZnNldAo+ID4gYXJlIHBhcmFtZXRlcnMgdG8gbG9jYXRlIHRoZSBpcnEgd2hpY2gg
Y2FuIGVhc2lseSBkZXJpdmUgZnJvbSBnbG9iYWwKPiA+IGdwaW8gcGluIG51bWJlciwgc28gSSB0
aG91Z2h0IGl0J3MgbW9yZSBpbnR1aXRpdmUgdG8gZ3JvdXAgdGhlbQo+ID4gb3JkZXJseSB0b2dl
dGhlci4uCj4gCj4gUmlnaHQsIHRoZSBEVCBiaW5kaW5ncyBhcmUgbWFpbmx5IGZvciBodW1hbiBj
b25zdW1wdGlvbiwgYW5kIHRoZQo+IGNlbGxzIGFyZSBwb3NpdGlvbmVkIGluIGxlZnQtdG8tcmln
aHQgaW50dWl0aXZlIG9yZGVyLgo+IAo+IElmIHRoZXkgd2VyZSBvbmx5IGZvciBtYWNoaW5lcyBp
dCB3b3VsZCBiZSBhbm90aGVyIGlzc3VlLCBidXQgaXQncwo+IHBlb3BsZSB3aG8gaGF2ZSB0byB3
cml0ZSBhbmQgbWFpbnRhaW4gdGhlc2UgZmlsZXMuCj4gCj4gRm9yIGV4YW1wbGUsIGluIGEgbGli
cmFyeSBhIG1hY2hpbmUgY291bGQgYXJyYW5nZSBib29rcyBieQo+IGZpcnN0IGxldHRlciBpbiB0
aGUgdGl0bGUsIHRoZW4gYnkgc2Vjb25kIGxldHRlciBpbiB0aGUgdGl0bGUgZXRjLCBidXQKPiB0
aGF0IHdvdWxkIGJlIHZlcnkgY29uZnVzaW5nIGZvciBodW1hbnMgd2hvIGV4cGVjdCB0byBmaW5k
Cj4gdGhlbSBpbiBhdXRob3Igb3JkZXIuCj4gCj4gVGhlcmUgYXJlIG1hbnkgZXhhbXBsZXMgb2Yg
dGhpcyBpbiB0aGUgRFQgYmluZGluZ3MuCj4gCk9rLCBJIGdvdCB5b3VyIGlkZWEuLiB0aGFua3MK
SSB3aWxsIHJld29yayB0aGUgcGF0Y2ggdG8gYWRkcmVzcyBUaG9tYXMncyBjb25jZXJuCgo+IFlv
dXJzLAo+IExpbnVzIFdhbGxlaWoKPiAKCi0tIApZaXh1biBMYW4gKGRsYW4pCkdlbnRvbyBMaW51
eCBEZXZlbG9wZXIKR1BHIEtleSBJRCBBQUJFRkQ1NQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
