Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE020F45A0F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 22:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Z00s0Z8A2uRDriYAGMG3R04JgcaILP1451r0tM6wcY=; b=DfD7rQBRagg0qF
	VlB13/iTz/gUEfjmvuuibSRqnGa1SPyq0yu0fd8wG7dRQ5lyO33jv+f805s81joeD04tQp/BKkhnu
	vMItNi7qg6c4f0DSfVFRyfvKal7Jq1NBTc/ss+eCtsaWC5/IbdiPKqO2/IMp64tvoH9RFDHq6JACW
	eY2VKj1D7NTxhzLf7fBhYRCkhGv0Qi7cIgbBt1IzZ7e/7ot1ghQUkmu3YVTAva7ot3+3/avKjESbQ
	KoKn8D4FaFDjqEMnQRLRM4APsbJNjGTdrW1l93lAFA07y7fK0MDBnDllLz050U8YfJC63Z8yYmqNt
	OTVWr4m55KKytTcEH55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKCu-0000000CsFJ-24KL;
	Fri, 10 Apr 2026 22:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKCs-0000000CsF1-26jR
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 22:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D5524449C
	for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 22:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E95FC4AF0B
	for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775859605;
	bh=CfBrxZMHYu+JoYASsbBXZuZ5K6ehZtv5W3IhWdspxyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g06rx4q589ILyCvwnQmkQeiuRueotxmE6556VBmrLHVTnDJtrsBGu1hbmJ0Ia9u5j
	 7sjWRgo/SlWng+ljVRrgxYjnqtwH3n8p1AKapCASkQQ9M+c9O7lbptbY1bn5fn0osJ
	 qKGmWulAfW/hq2gnnx3W5ph0W8NBpH65Ff8vyhfkaq4gflKZ5/VmaH6OlMG4EcfknU
	 MyFJaOurXtMlKR6ChVuh3kl8spxU61HZEDHNnoWkZR0HEs2zLfgxkPYjaX+QgcS2Lt
	 c9cn2MwB4wQiXu9yOCPkW8J2gev5Xqwsi+z8x7w4YOPoMvxpu+BxSPLHtks4qMc3nB
	 4tMwm2zQPfkow==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79a46ebe2beso26513227b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 15:20:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlPigWzq+akSyI3Ch+c4N0/gpHjhZSmRcQo2IgtLNpEKDLdC+zcaI9oZicmMrrNFWqM11eZMMubpSCiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE9tsOLPbsPymJDKsfQeYQbSo7lQA8/UjCbORJ90sFZRfGeDvr
	13T+3wcdQBKpC3tVq99J0ngKkhjmJTrQxbOAWwyQdRMMdm/Tuj4Z/zT5FFKHfIBbnj3TzkBQWY5
	93qqm+u383bnvs78AbOzR35N++SDjKRY=
X-Received: by 2002:a05:690c:e653:b0:79a:5508:5831 with SMTP id
 00721157ae682-7af6f909682mr40933627b3.20.1775859604680; Fri, 10 Apr 2026
 15:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260403123040-KYC0145825@kernel.org>
In-Reply-To: <20260403123040-KYC0145825@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 11 Apr 2026 00:19:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
X-Gm-Features: AQROBzCuH10sUCp1pWYa5W_5SjPJMPxeW_gppQj455tR-xLUJ3z2UWA4xLhfFaI
Message-ID: <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org, Yixun Lan <dlan@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_152006_586527_C32DA2C0 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

SGkgWWl4dW4sCgpJIGxvb2tlZCBpbnRvIHRoaXMgcHVsbCByZXF1ZXN0LgoKSSdtIHNvcnJ5IGlm
IEkgZG8gc3R1cGlkIG1pc3Rha2VzIGluIGhhbmRsaW5nIGl0LCBJJ20gbmV3IHRvIG1haW50YWlu
aW5nCnRoZSBTb0MgdHJlZS4gQmVhciB3aXRoIG1lLgoKT24gRnJpLCBBcHIgMywgMjAyNiBhdCAy
OjMy4oCvUE0gWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBBdXJlbGllbiBK
YXJubyAoNyk6Cj4gICAgICAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGRyb3AgaW5jb3JyZWN0IHBp
bmN0cmwgZm9yIGNvbWJvIFBIWQooLi4uKQo+IFlpeHVuIExhbiAoOSk6Cj4gICAgICAgcmlzY3Y6
IGR0czogc3BhY2VtaXQ6IHBjaWU6IGZpeCBtaXNzaW5nIHBvd2VyIHJlZ3VsYXRvcgoKW0ZpeGVz
XQpmYXRhbDogTm90IGEgdmFsaWQgb2JqZWN0IG5hbWUgbGludXMvbWFzdGVyCkNvbW1pdDogYzY4
MzYwYzBkNjM2ICgicmlzY3Y6IGR0czogc3BhY2VtaXQ6IGRyb3AgaW5jb3JyZWN0IHBpbmN0cmwK
Zm9yIGNvbWJvIFBIWSIpCiAgICBGaXhlcyB0YWc6IEZpeGVzOiAwYmUwMTZhNGI1ZDFiOSAoInJp
c2N2OiBkdHM6IHNwYWNlbWl0OiBQQ0llIGFuZApQSFktcmVsYXRlZCB1cGRhdGVzIikKICAgIEhh
cyB0aGVzZSBwcm9ibGVtKHMpOgogICAgICAgIC0gSW5zcGVjdDogVGFyZ2V0IFNIQSBpcyBub3Qg
YW5jZXN0b3Igb2YgTGludXMnIG1hc3RlciBicmFuY2gsCndoaWNoIG1lYW5zIGl0IGlzIGZpeGlu
ZyBjb21taXQgaW4geW91ciBicmFuY2gKZmF0YWw6IE5vdCBhIHZhbGlkIG9iamVjdCBuYW1lIGxp
bnVzL21hc3RlcgpDb21taXQ6IDhhOTA3MTI5OWRlYyAoInJpc2N2OiBkdHM6IHNwYWNlbWl0OiBw
Y2llOiBmaXggbWlzc2luZyBwb3dlciByZWd1bGF0b3IiKQogICAgRml4ZXMgdGFnOiBGaXhlczog
MGJlMDE2YTRiNWQxICgicmlzY3Y6IGR0czogc3BhY2VtaXQ6IFBDSWUgYW5kClBIWS1yZWxhdGVk
IHVwZGF0ZXMiKQogICAgSGFzIHRoZXNlIHByb2JsZW0ocyk6CiAgICAgICAgLSBJbnNwZWN0OiBU
YXJnZXQgU0hBIGlzIG5vdCBhbmNlc3RvciBvZiBMaW51cycgbWFzdGVyIGJyYW5jaCwKd2hpY2gg
bWVhbnMgaXQgaXMgZml4aW5nIGNvbW1pdCBpbiB5b3VyIGJyYW5jaAoKU28gdGhpcyBtZWFucyB5
b3UgaW50cm9kdWNlZCBidWdzIGFuZCBmaXggdGhlbSBpbiB0aGUgc2FtZSBwdWxsIHJlcXVlc3Q/
CgpXaHk/CgpUaGUgcHJhY3RpY2UgaXMgdG8gc3F1YXNoIHN1Y2ggZml4ZXMgaW50byB0aGUgb2Zm
ZW5kaW5nIHBhdGNoZXMgd2hlbgpwcmVzZW50aW5nIHB1bGwgcmVxdWVzdHMuIEJ1dCBJIHdlbnQg
YWhlYWQgYW55d2F5LCB0cnlpbmcgdG8gbm90IGJlIHNvCnBpY2t5LiAoVGhlIGNvbW1pdHMgYXJl
IHRoZXJlLCBpbiB5b3VyIGJyYW5jaCBpbmRlZWQuKQoKLSBDaGVja2VkIHRoYXQgaXQgd2FzIGlu
IGxpbnV4LW5leHQgT0sKLSBidWlsdCBEVEJTIE9LCgpQdWxsZWQgaW4sIHRoYW5rcy4KCllvdXJz
LApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
