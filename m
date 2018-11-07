Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04540C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE98220862
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPq+bwIZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ZKMcN8J2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE98220862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kO71LYFJR3SuWt6jP7TpYoqio4ZPhVpVzXJVHoPcBFI=; b=dPq+bwIZ8r2j32
	RXFRMMa7MG3fiGjnpgQtg2JucT5n9AH7Ks8W5414gBkPZlnQ3jnflLNVKqBzwSAKLfr58q6814woZ
	07Ld4rd90frq2f7kfKnmnJvFVw7BdLCzipyhcIbEBRy9JDyj1377AylInOOGmGfB6eEWGtJZwZK9w
	DE0tHaXRWyfEEV+T49lmgBXMxnQN2MSaAbncY5/oVR6wTOPPieBZ13GgSJfufELl4t92ppnY0jPFz
	3FkuPwNjEB0Obp+ez1CXE+ZQBzXnqWV90jufl3+uh6e1kUblzd0Elpzm+dvyb5cTgEdCo5to/8jzo
	m1/iSz++wWWZ1TUN5P4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKRkq-0008SV-1t; Wed, 07 Nov 2018 17:36:36 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKRkg-0008JM-8N
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 17:36:27 +0000
Received: by mail-lj1-x244.google.com with SMTP id s15-v6so15492879lji.3
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 09:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=94VwVroRz8OsQAeOpOtXrrHyWiA98PnE8gQ8bs66pwo=;
 b=ZKMcN8J2/l2cZ3FGpvfYIsp32gIvXAYX7ncuk3iTSj8Lc3Lxb0YpTqeW6elvM+evQ0
 FaR/OQlDRRlCVAIgB2xWBYamib1gMatV5SYlzScvZbEJiWaagvI3x3yQOcWizM3Mvfny
 sfcofHDnQqsrcMiLs10+W9+smK8rU+SM1nHPQcJjuv7p4trqF810BxmlX8fAXAd8riH+
 we5MTiQC7hyFfSik7plzvnAjcQfrh5wxwelBuPELyOPZhSROsN2oRKSUnjaiE1t+Ummj
 31XyDRSBQ/jF5VtKNlqIAX/T62rjLu1vIgICVTDSb+zc2Al5mPtLFHSrows1+yt8dcrX
 4wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=94VwVroRz8OsQAeOpOtXrrHyWiA98PnE8gQ8bs66pwo=;
 b=o7l5fkLbU0bSO8WfQQIsNqHsF+cQTPZ48rC2nWqevFRW20i2WQuKMULBMidbEbnII5
 OcpF19RcpBHui+yDo7ez76H8Ecazx01HY5/zyxE8GMwRBCv5nDdKwAVEcirxUlkwNbuV
 M5zJ2f8J+CqBX+h2gN9gH30MhN/PIklEyS9V1lfmpJui5LjCXo+YFIn6210UwpZGbF3Q
 +BXLItgSINBuYXGEu1AEO2FRNFQXgXyo2pMj524Xq73WXCION02OPE2cfCNLVF1Ewo7W
 hOLCVFlYfWOEHiuhSm01GOpXupZsS497u/b9RwNE99sw7FfJrBnYNkPwp5tAntaQNd55
 BtMQ==
X-Gm-Message-State: AGRZ1gIwu9ubvjB0r4/WRkPsW7/7AxS16+PUgZSF4/8C2VyElOGWmxs5
 BEMOxvBkGuzOxElrc2yPb3knCCQyyVvnL4umjZa37A==
X-Google-Smtp-Source: AJdET5dFIb2fmt9q2LrEYHJOS7KwJc2OyQYHMrRN/YjSk+1FbyKoKnrqmNKJrhgz2SKSKjAZer9XbVJqSYDf73eOlqo=
X-Received: by 2002:a2e:90ca:: with SMTP id
 o10-v6mr720453ljg.134.1541612174263; 
 Wed, 07 Nov 2018 09:36:14 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <3189677.9XQFCzzJyO@avalon>
In-Reply-To: <3189677.9XQFCzzJyO@avalon>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 7 Nov 2018 09:36:02 -0800
Message-ID:
 <CAOesGMi84d+ZSK49Cf26Wvy5mU8D8VkUK1zvfs-a=eSYD+4osw@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] SoC maintainer group
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_093626_291063_5AA0D9AE 
X-CRM114-Status: GOOD (  25.97  )
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
Cc: Russell King <rmk@armlinux.org.uk>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107173602.vhvbnJ5uttynkiFgRUuk_Xzru9fqb-nfSaJM_yyWoWo@z>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCAzOjMyIFBNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBIaSBPbG9mLAo+Cj4gT24gV2Vk
bmVzZGF5LCA3IE5vdmVtYmVyIDIwMTggMDA6MTY6MjcgRUVUIE9sb2YgSm9oYW5zc29uIHdyb3Rl
Ogo+ID4gSGkgS1Mgb3JnYW5pemVycyAoYW5kIG90aGVycyksCj4gPgo+ID4gVGhpcyBpcyBhIGxh
dGUgdG9waWMgcHJvcG9zYWwsIGhvcGVmdWxseSB0aGVyZSBpcyBzdGlsbCB0aW1lIG9uIHRoZSBh
Z2VuZGEuCj4gPgo+ID4gV2XigJl2ZSByZWNlbnRseSBiZWVuIGRpc2N1c3Npbmcgc29tZSBtYWlu
dGFpbmVyIG1vZGVsIGNoYW5nZXMgYXMKPiA+IGRlc2NyaWJlZCBiZWxvdywgYW5kIHdvdWxkIGxp
a2UgYSBzbG90IHRvIGRpc2N1c3MgdGhlIGlkZWEgYW5kIHNvbGljaXQKPiA+IGZlZWRiYWNrL2Nv
bW1lbnRzIGZyb20gdGhlIG90aGVycyB0aGVyZS4KPiA+Cj4gPgo+ID4gVGhpcyBzdGFydGVkIHdp
dGggQXJuZCBhbmQgSSBmaW5hbGx5IGJlaW5nIGluIG9uZSBwbGFjZSBhdCB0aGUgc2FtZQo+ID4g
dGltZSwgYW5kIHRhbGtpbmcgYWJvdXQgaG93IHdlIHdhbnQgdG8gZXZvbHZlIGFybS1zb2MgbWFp
bnRhaW5lcnNoaXAKPiA+IG1vdmluZyBmb3J3YXJkLiBXZSd2ZSBiZWVuIGluZGVwZW5kZW50bHkg
dGhpbmtpbmcgb2Ygd2F5cyB0byBleHBhbmQKPiA+IHRoZSBncm91cCBhbmQgbWFraW5nIGl0IG1v
cmUgc2VsZi1zZXJ2aWNlIGZvciBldmVyeWJvZHksIGJ1dCB0aGVyZSdzIGEKPiA+IGJ1bmNoIG9m
IHRvb2xpbmcgbmVlZGVkIHRvIG1ha2UgaXQgcnVuIHNtb290aGx5IGJleW9uZCB0aGUgc21hbGxl
cgo+ID4gZ3JvdXAgd2UgaGF2ZSBub3cuCj4gPgo+ID4gSW4gdGhlIGVuZCwgd2UgZW5kZWQgdXAg
bG9va2luZyBhdCBpdCBmcm9tIGEgc2xpZ2h0bHkgZGlmZmVyZW50IGFuZ2xlOgo+ID4gUmlnaHQg
bm93LCB3aGVuIGNvbnRyaWJ1dG9ycyBzaG93IHVwIHdpdGggbmV3IHBsYXRmb3JtIHN1cHBvcnQs
IHRoZQo+ID4gZmlyc3QgaGlsbCB0aGV5IG5lZWQgdG8gY2xpbWIgaXMgZmlndXJpbmcgb3V0IGhv
dyB0aGV5IG5lZWQgdG8gY2FydmUKPiA+IHVwIHRoZWlyIHBsYXRmb3JtIGFtb25nIGFsbCB0aGUg
dmFyaW91cyBtYWludGFpbmVycywgaG93IHRvIG1ha2Ugc3VyZQo+ID4gdGhleSdyZSBhbGwgaGFu
ZHNoYWtpbmcgb24ga2VlcGluZyB0aGluZ3Mgc3RhYmxlLCBhbmQgZ2V0IGNvZGUKPiA+IHN1Ym1p
dHRlZC4gSXQncyBhd2t3YXJkLCBub3Qgd2VsbCBkb2N1bWVudGVkIGFuZCBvbmUgb2YgdGhlIGJp
Z2dlc3QKPiA+IG92ZXJoZWFkcyB3ZSBoYXZlIG9uIG91ciBzaWRlIGFzIHdlbGwuCj4gPgo+ID4g
V2hlbiB3ZSBzdGFydGVkIHRhbGtpbmcgdG8gb3RoZXIgbWFpbnRhaW5lcnMsIHdlJ3JlIGFsc28g
cmVhbGl6aW5nCj4gPiB0aGF0IHdlIGFyZSBjdXJyZW50bHkgZHVwbGljYXRpbmcgYSBsb3Qgb2Yg
d29yay4gSW4gcGFydGljdWxhciwgd2UKPiA+IG9mdGVuIGFsbCBnZXQgY2M6ZCBvbiBwYXRjaCBz
ZXJpZXMsIHNvIHdlIGFsbCBuZWVkIHRvIHJlYWQgYW5kIGZpbHRlciwKPiA+IGFuZCBhc3N1bWUg
dGhhdCBvdGhlciBtYWludGFpbmVycyBzcG90IHRoZSByaWdodCBwYXRjaGVzLCBldGMuCj4gPgo+
ID4gV2UgaGF2ZSBkaXNjdXNzZWQgYSBmZXcgZGlmZmVyZW50IG9wdGlvbnMsIGFuZCBpdCBzZWVt
cyBsaWtlIHBvb2xpbmcKPiA+IG1vcmUgb2YgdGhlIGNvbnRyaWJ1dGlvbiBmbG93IHRvIGEgZ3Jv
dXAgb2YgY28tbWFpbnRhaW5lcnMgaXMgYSB1c2VmdWwKPiA+IGFwcHJvYWNoLiBJbml0aWFsbHks
IHdlJ3JlIGNvbnNpZGVyaW5nIHRoZSBhcm0tc29jIHBsYXRmb3JtcywgY2xvY2sKPiA+IGRyaXZl
cnMgYW5kIHBpbmN0cmwgZHJpdmVycywgd2hpY2ggYWxsIHRlbmQgdG8gYmUgYWZmZWN0ZWQgYnkg
bmV3Cj4gPiBwbGF0Zm9ybSBjb250cmlidXRpb25zIGluIHRoaXMgd2F5LCBhbmQgb2Z0ZW4gZW5k
IHVwIGNyb3NzLWNjOmQgb24KPiA+IGV2ZXJ5dGhpbmcuIEFkZGl0aW9uYWxseSwgdGhlIGZsb3cg
Zm9yIHN1Y2Nlc3NmdWxseSBtZXJnaW5nIGEgbmV3Cj4gPiBwbGF0Zm9ybSBvciBTb0MgbmVlZHMg
dG8gYmUgZG9jdW1lbnRlZCBhbmQgYWR2ZXJ0aXNlZC4gVGhpcyBpcyB0cnVlCj4gPiB3aGV0aGVy
IG9yIG5vdCB3ZSBjaGFuZ2UgdGhlIHdheSB0aGF0IG1haW50YWluZXJzIGNvb3JkaW5hdGUgYW1v
bmdzdAo+ID4gdGhlbXNlbHZlcywgb3Igd2hldGhlciBvciBub3Qgd2UgY2hhbmdlIHRoZSBjdXJy
ZW50IHdvcmtmbG93IHVzZWQgYnkKPiA+IHBsYXRmb3JtIGNvbnRyaWJ1dG9ycyB0b2RheS4KPiA+
Cj4gPiBTbywgd2UncmUgcGxhbm5pbmcgdG8gY2hhbmdlIHRoaW5ncyB1cCBhIGJpdC4gV2UncmUg
c3RhcnRpbmcgYSBuZXcKPiA+IGdyb3VwIHRoYXQgcG9vbHMgY3VycmVudCBhcm0tc29jLCBjbGsg
YW5kIHBpbmN0cmwgZHJpdmVycyBhbmQKPiA+IG1haW50YWluZXJzIGludG8gb25lIGZ1bm5lbC4g
V2UnbGwgc2V0IHVwIGEgbmV3IG1haWwgYWxpYXMgZm9yIHRoZQo+ID4gbWFpbnRhaW5lciBncm91
cCwgYW5kIG9uZSBzaGFyZWQgcGF0Y2h3b3JrIHRvIGNvbGxlY3QgY29udHJpYnV0aW9ucy4KPiA+
IFdlIHN0aWxsIGV4cGVjdCBkZXZlbG9wZXJzIHRvIHVzZSBleGlzdGluZyBtYWlsaW5nIGxpc3Rz
LCBhbmQgd2Ugc3RpbGwKPiA+IGV4cGVjdCBmb3IgZXhhbXBsZSBBUk0gcGxhdGZvcm0gbWFpbnRh
aW5lcnMgdG8ga2VlcCB0aGVpciB3b3JrZmxvdyBvZgo+ID4gY29sbGVjdGluZyBwYXRjaGVzIGZv
ciB0aGVpciBwbGF0Zm9ybSBsaWtlIHRoZXkgZG8gdG9kYXkuIERvd24gdGhlCj4gPiByb2FkIGl0
IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gaW5jb3Jwb3JhdGUgb3RoZXIgZHJpdmVyIHN1YnN5c3RlbXMg
YXMKPiA+IHdlbGwuCj4gPgo+ID4gQmV5b25kIHRoaXMsIHdlJ3JlIGdvaW5nIHRvIGtlZXAgYSBj
bG9zZSBleWUgb24gdGhlIGRybS1taXNjIHRyZWUsCj4gPiB3aGljaCBpcyBleHBsb3JpbmcgYSBt
b3ZlIHRvIGdpdGxhYiAoYW5kIHdvcmtpbmcgd2l0aCBnaXRsYWIgb24gYWRkaW5nCj4gPiB0aGUg
ZmVhdHVyZXMgdGhleSBuZWVkIHRvIG1vdmUgb3ZlcikuIElmIHRoZXkgZ2V0IGEgYnJvYWQgbWFp
bnRhaW5lcgo+ID4gbW9kZWwgd29ya2luZyB3ZWxsIGluIHRoYXQgZW52aXJvbm1lbnQgaXQgY291
bGQgYmUgc29tZXRoaW5nIHdlIHJldXNlCj4gPiBmb3Igb3Vyc2VsdmVzIHRvby4KPgo+IGdpdGxh
YiBpcyBhbiB1bWJyZWxsYSB0ZXJtIHRoYXQgY292ZXJzIG1hbnkgZmVhdHVyZXMgcHJvcG9zZWQg
YnkgdGhlIHByb2R1Y3QuCj4gQXJlIHRoZXJlIHBhcnRpY3VsYXIgZmVhdHVyZXMgdGhhdCB5b3Ug
YWxyZWFkeSB0aGluayB5b3Ugd291bGQgYmUgaW50ZXJlc3RlZAo+IGluLCBvciBmZWF0dXJlcyB0
aGF0IHlvdSBhbHJlYWR5IGtub3cgeW91IHdvdWxkbid0IHdhbnQgdG8gdXNlID8KClRvIGJlIGhv
bmVzdCwgSSBoYXZlbid0IGxvb2tlZCBjbG9zZWx5IHlldCBhbmQgSSdtIGxvb2tpbmcgZm9yd2Fy
ZCB0bwpsZWFybmluZyBhYm91dCB3aGF0IHRoZSBEUk0gcGxhbnMgYXJlIGR1cmluZyBMUEMuCgoK
LU9sb2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
