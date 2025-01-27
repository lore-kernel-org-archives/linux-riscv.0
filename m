Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CF2C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pObNDanqbxEPp63vO+Iia4G2DuAqdmcQ5ac44qv9KS0=; b=HqKJDPY6D9VQIJ
	xtRLCoNxv0PgVwrQnO8DZofOpJjOgeS0oy/lw+3gLd4lzJ10TaiHWN7YwGAqcUue31v15BBen5LT0
	HgR1x7Iqdi0V4TJG+CCJsgFJSF3lGL/uPO+cRI0qEk8mrzyg/5c1SaVk20hBTk3Ib3U5i4FgyXhSe
	wlF206Ac1Td6BRuNwszAjTGStM9zKcdp0isSHEQyHdSa9UM6FM+1B1s8LpoaKagfXQ81Ggo6yt57B
	XLSo1rpjP3/J1F76Zh2k7QgLZPRqB1I/NBarYx1j36yN3MV9kdiWlzE1ahqXvHxgQy5GA4AP71klb
	J3zQ9tuZ1NPt5tYVouCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcS7q-00000002niA-0jNf;
	Mon, 27 Jan 2025 16:38:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcS7n-00000002nhg-1VMe
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 16:38:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so7998863a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 08:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737995890; x=1738600690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMOdLWgzruCtPh1k1RLn1fjsT+4UwMCnqF4YXgLhyqY=;
        b=jHtRQC4ls+frs4olp6Y4DQUs8UUa+CvJy1/pMIkBvZxS8rfbQq/nyEK/F9g1fIbYvp
         vDnlnARy3svujed+KpzhOp8oJPQEzorCEGN2zTzUCr3pr1ZHCH5j1WmE/lKzAaPIB35p
         OFxr3reLeJeaO1gUr9evrGeuuDjYqcvo1x9Su5MKyDuHG3Su5UdUIMrVIU5R2Oeszl5z
         k1dcfO/mGou/3mgaeidkiV8dwQAHfyLGMXD1OdrNe/ykQigsYKklbSOnWrtiurLd94ZL
         JRrDf7pRildOHDZtyFpSOJhF7tI4UIJ68Wgutbr0Ej1uggsedA1QCJ6NWvEbHCsI4dbI
         sYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995890; x=1738600690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMOdLWgzruCtPh1k1RLn1fjsT+4UwMCnqF4YXgLhyqY=;
        b=Hcn4DGbspYXkSEsIRP7s0mgN2R7ukQg2mOM37vvHDmNoD+M27DIVDTivK1ex9bIkUH
         hBSAPpvYIUgxk88XGjk/c9U988FnIq/ObSmV9tE7oeRb/jDTjY9f7MCZ0bG2IvnUY8w5
         iwbK5PI4OBH6fOw7m9v8/aLlcpdg2e84XR/wvAO3G4B5UvRqC2nFlLNqeXOSAJYon1DW
         TOB5cgXi9RmS03DYUgU9Lsbmvysfu5aNMpOXJm3GN3zaI/frjRgj4t/D+9oPae9H993H
         DoyvLKkygAqfXKABDhxUeomSeEGicrtG7DsED2bdBgVGKvBzl0x+EEzsjnWIHnDRbTPX
         acDg==
X-Forwarded-Encrypted: i=1; AJvYcCUxPE50jvFLSs3Y2NYgHnh9Psxa91EYSQ9/3cSX0X8PWOZBKyT1dj+eotxGmw568duyzXkCbMjmHEpctA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwe6TN9+AxSbP4u7rU2Zqod4WGoneu7zCksC5LsaOzIL5HIV8i
	Qw8aJeooxMOacgmyVyM4JEAcWtSNSQ1dEQCPy57T3Rsy4bT/AgL6VgTTvIcBsfvSOKT1Zi+ixq7
	2k9WD4CtCPvAX4hNsBWy9yd75TCpk81TdcirmFQ==
X-Gm-Gg: ASbGnctD1pNUzdYc2k6zyGMGBnzXT0Yp2L1aHBgujvQ95b52WHQnHd6HUlhPLsqK0nx
	RFiQGkEZYoynYwj93p1kFCRl1+Ncmp2JBuXpiA46pjXGqFltVP4M7vw8xFR/QDX3m
X-Google-Smtp-Source: AGHT+IFRYQDgGAlxpuyP6F5Z7RaISZNaZ2D+OJF5GWa9/zTfvuVdKObwEF+LucM85N/3Px+2rORXWhlhlMLAJb/FB3o=
X-Received: by 2002:a17:90b:3d4e:b0:2ee:7870:8835 with SMTP id
 98e67ed59e1d1-2f782d97f47mr67401510a91.33.1737995880453; Mon, 27 Jan 2025
 08:38:00 -0800 (PST)
MIME-Version: 1.0
References: <20250127093846.98625-1-luxu.kernel@bytedance.com> <a7d9b0e5-7ef6-457e-ace6-c56e745c3150@app.fastmail.com>
In-Reply-To: <a7d9b0e5-7ef6-457e-ace6-c56e745c3150@app.fastmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 28 Jan 2025 00:37:49 +0800
X-Gm-Features: AWEUYZmDP1k6aWrWrlOgQTMC7s5NBiXPrHUqeHPlh8HrZuvgn9WCfnSSwa7uIx4
Message-ID: <CAPYmKFtx6GNE5r-R33aiHeF-qgFESH0sbsorttjJ88wTL8yr9w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND] irqchip: riscv: Order normal writes
 and IPI writes
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, lihangjing@bytedance.com, 
	Xie Yongji <xieyongji@bytedance.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_083811_588126_8959E1B0 
X-CRM114-Status: GOOD (  21.03  )
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMTI6MjPigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDI3LCAyMDI1LCBhdCAxMDozOCwgWHUgTHUg
d3JvdGU6Cj4gPiBSSVNDLVYgZGlzdGluZ3Vpc2hlcyBiZXR3ZWVuIG5vcm1hbCBtZW1vcnkgYWNj
ZXNzZXMgYW5kIGRldmljZSBJL08gYW5kCj4gPiB1c2VzIEZFTkNFIGluc3RydWN0aW9uIHRvIG9y
ZGVyIHRoZW0gYXMgdmlld2VkIGJ5IG90aGUgUklTQy1WIGhhcnRzIGFuZAo+ID4gZXh0ZXJuYWwg
ZGV2aWNlcyBvciBjb3Byb2Nlc3NvcnMuIFRoZSBGRU5DRSBpbnN0cnVjdGlvbiBjYW4gb3JkZXIg
YW55Cj4gPiBjb21iaW5hdGlvbiBvZiBkZXZpY2UgaW5wdXQoSSksIGRldmljZSBvdXRwdXQoTyks
IG1lbW9yeSByZWFkcyhSKSBhbmQKPiA+IG1lbW9yeSB3cml0ZXMoVykuIEZvciBleGFtcGxlLCAn
ZmVuY2UgdywgbycgY2FuIGJlIHVzZWQgdG8gZW5zdXJlIGFsbAo+ID4gbWVtb3J5IHdyaXRlcyBm
cm9tIGluc3RydWN0aW9ucyBwcmVjZWRpbmcgdGhlIEZFTkNFIGluc3RydWN0aW9uIGFwcGVhcgo+
ID4gZWFybGllciBpbiB0aGUgZ2xvYmFsIG1lbW9yeSBvcmRlciB0aGFuIGRldmljZSBvdXRwdXQg
d3JpdGVzIGZyb20KPiA+IGluc3RydWN0aW9ucyBhZnRlciB0aGUgRkVOQ0UgaW5zdHJ1Y3Rpb24u
Cj4KPiBUaGVyZSBpcyBub3RoaW5nIHJpc2MtdiBzcGVjaWZpYyBpbiBoZXJlIHJlYWxseSwgaXQn
cyBqdXN0IGEgYnVnCj4gaW4gdGhlIGRyaXZlcjogd3JpdGVsKCkgbWVhbnMgYWNjZXNzIHRoZSBt
bWlvIHJlZ2lzdGVyIHdpdGggYXBwcm9wcmlhdGUKPiBiYXJyaWVycywgd2hpbGUgd3JpdGVsX3Jl
bGF4ZWQoKSBpcyBhIHNwZWNpYWwgY2FzZSB0aGF0IHNob3VsZAo+IG9ubHkgZXZlciBiZSB1c2Vk
IGlmIGEgcGFydGljdWxhciBmdW5jdGlvbiBpcyBzZW5zaXRpdmUgdG8KPiBwZXJmb3JtYW5jZSBh
bmQgbmV2ZXIgbmVlZHMgdG8gYmUgc2VyaWFsaXplZC4KPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaXJxY2hpcC9pcnEtdGhlYWQtYzkwMC1hY2xpbnQtc3N3aS5jCj4gPiBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtdGhlYWQtYzkwMC1hY2xpbnQtc3N3aS5jCj4gPiBpbmRleCBiMGUzNjZhZGU0Mjcu
LjhmZjZlN2ExMzYzYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtdGhlYWQt
YzkwMC1hY2xpbnQtc3N3aS5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXRoZWFkLWM5
MDAtYWNsaW50LXNzd2kuYwo+ID4gQEAgLTMxLDcgKzMxLDcgQEAgc3RhdGljIERFRklORV9QRVJf
Q1BVKHZvaWQgX19pb21lbSAqLCBzc3dpX2NwdV9yZWdzKTsKPiA+Cj4gPiAgc3RhdGljIHZvaWQg
dGhlYWRfYWNsaW50X3Nzd2lfaXBpX3NlbmQodW5zaWduZWQgaW50IGNwdSkKPiA+ICB7Cj4gPiAt
ICAgICB3cml0ZWxfcmVsYXhlZCgweDEsIHBlcl9jcHUoc3N3aV9jcHVfcmVncywgY3B1KSk7Cj4g
PiArICAgICB3cml0ZWwoMHgxLCBwZXJfY3B1KHNzd2lfY3B1X3JlZ3MsIGNwdSkpOwo+ID4gIH0K
PiA+Cj4gPiAgc3RhdGljIHZvaWQgdGhlYWRfYWNsaW50X3Nzd2lfaXBpX2NsZWFyKHZvaWQpCj4g
PiAtLQo+Cj4gdGhlYWRfYWNsaW50X3Nzd2lfaXBpX2NsZWFyKCkgc2VlbXMgdG8gaGF2ZSB0aGUg
c2FtZSBidWcsCj4gaXQgYWxzbyB1c2VzIHRoZSBfcmVsYXhlZCgpIHZlcnNpb24gZm9yIG5vIGFw
cGFyZW50IHJlYXNvbi4KCkhpIEFybmQsCgpUaGVyZSBzZWVtcyBubyBuZWVkIHRvIG1vZGlmeSB0
aGVhZF9hY2xpbnRfc3N3aV9pcGlfY2xlYXIoKSBhcyBpdCBvbmx5CmNsZWFycyBwZW5kaW5nIElQ
SSBvbiBjdXJyZW50IGhhcnQuIE5vIG90aGVyIGhhcnRzIHJlcXVpcmUgdG8gc2VlCnN0cmljdCBv
cmRlciBiZXR3ZWVuIHByZWNlZGluZyBtZW1vcnkgd3JpdGVzIGFuZCB0aGlzIEFDTElOVCBNTUlP
CndyaXRlLiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3NlZCBhbnl0aGluZy4KClRoYW5rcywK
Clh1IEx1Cgo+Cj4gICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
