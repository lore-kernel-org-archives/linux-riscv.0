Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03C6C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=innX/syCjvsvsV5BscihBo3yeQbCVE8uRMDpqsBUK4o=; b=ea8xOJiOBtI0xN
	F2JaGXu8XaQjxqLGyV/MVtx1Nvd9y4PJkjyCqHZWMzt4RFlhoI3NWOO1xxEIHsdjhVRUOfupU8Gk7
	vmSANW8uZr4G0IULN+UQMq+szDdEz38nO1lAb5oM0C/MyB/BdQTWCaaaYQt92fhhWvBwz2Hm7cWyf
	4uySvS25D8IvB9oJv0xANeZXiSvAbFcUtVZrl7p2YuyCPd3OtGrtGidHgSTcKHWBo72lv0ViR2kh3
	gWEO1RggQqD84Km3ackKFcpun2owkbPmMjmv5BE68e96IIan01fhCfQASY1baQJ89xDfrahwrmAjV
	ADmt52RdvzTS+KuL2PQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOKe-0000000ESwA-0dkF;
	Tue, 20 Feb 2024 11:30:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOKa-0000000ESuA-3NpR;
	Tue, 20 Feb 2024 11:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8IV/wZQmZmc4s7oLURGMbrTnuZsGulpwAe3ozx8f5sY=; b=fsSLVnDrrExhI/ODinstjQY7lP
	HmvWm3h/RGYKlbPxL1A0a3vxKmj936BI7nB63cCc77mwlQtB7EkoPA6H14gi2c2p/E94vjc8iDvBG
	sTYvRG6F3Jh/G9K03LitnZXPFDFStmjvubNkyGKrSSNOKoBdv7pX/cIa7f/wQ/uTRXxgtCGsX+Xd9
	iNnRTbExTSaP+A26vWf8MLn40QWYwDxMJQpAEhTzYKM60BfWf5+Zlf6TMkgCCa9IB3sdf1E4sBH1y
	44k/ZKPTxdYPW/5h1mZtb/SBW5Ce7+ZtjigBjo2MnUsRqUrJzu0YXrD8uzaVjFfif5eSByJylyZiq
	gtWBI+NA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39114)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rcOKU-0002Jp-0v;
	Tue, 20 Feb 2024 11:30:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rcOKT-0000pa-2v; Tue, 20 Feb 2024 11:30:29 +0000
Date: Tue, 20 Feb 2024 11:30:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH RFC v4 01/15] ACPI: Only enumerate enabled (or
 functional) processor devices
Message-ID: <ZdSNVPjsti7XKxCV@shell.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
 <E1rVDmP-0027YJ-EW@rmk-PC.armlinux.org.uk>
 <CAJZ5v0hY_LXp41WMVPhiLosPe7YVzF38Uz=EhmJqVwqFn==Upw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hY_LXp41WMVPhiLosPe7YVzF38Uz=EhmJqVwqFn==Upw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_033036_869972_3F38D59E 
X-CRM114-Status: GOOD (  24.15  )
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

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMDk6MTA6MzlQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNTo0OeKAr1BNIFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IEZyb206IEphbWVz
IE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4KPiA+IFRvZGF5IHRoZSBBQ1BJIGVudW1l
cmF0aW9uIGNvZGUgJ3Zpc2l0cycgYWxsIGRldmljZXMgdGhhdCBhcmUgcHJlc2VudC4KPiA+Cj4g
PiBUaGlzIGlzIGEgcHJvYmxlbSBmb3IgYXJtNjQsIHdoZXJlIENQVXMgYXJlIGFsd2F5cyBwcmVz
ZW50LCBidXQgbm90Cj4gPiBhbHdheXMgZW5hYmxlZC4gV2hlbiBhIGRldmljZS1jaGVjayBvY2N1
cnMgYmVjYXVzZSB0aGUgZmlybXdhcmUtcG9saWN5Cj4gPiBoYXMgY2hhbmdlZCBhbmQgYSBDUFUg
aXMgbm93IGVuYWJsZWQsIHRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzOgo+ID4gfCBhY3BpIEFD
UEkwMDA3OjQ4OiBFbnVtZXJhdGlvbiBmYWlsdXJlCj4gPgo+ID4gVGhpcyBpcyB1bHRpbWF0ZWx5
IGJlY2F1c2UgYWNwaV9kZXZfcmVhZHlfZm9yX2VudW1lcmF0aW9uKCkgcmV0dXJucwo+ID4gdHJ1
ZSBmb3IgYSBkZXZpY2UgdGhhdCBpcyBub3QgZW5hYmxlZC4gVGhlIEFDUEkgUHJvY2Vzc29yIGRy
aXZlcgo+ID4gd2lsbCBub3QgcmVnaXN0ZXIgc3VjaCBDUFVzIGFzIHRoZXkgYXJlIG5vdCAnZGVj
b2RpbmcgdGhlaXIgcmVzb3VyY2VzJy4KPiA+Cj4gPiBBQ1BJIGFsbG93cyBhIGRldmljZSB0byBi
ZSBmdW5jdGlvbmFsIGluc3RlYWQgb2YgbWFpbnRhaW5pbmcgdGhlCj4gPiBwcmVzZW50IGFuZCBl
bmFibGVkIGJpdCwgYnV0IHdlIGNhbid0IHNpbXBseSBjaGVjayB0aGUgZW5hYmxlZCBiaXQKPiA+
IGZvciBhbGwgZGV2aWNlcyBzaW5jZSBmaXJtd2FyZSBjYW4gYmUgYnVnZ3kuCj4gPgo+ID4gSWYg
QUNQSSBpbmRpY2F0ZXMgdGhhdCB0aGUgZGV2aWNlIGlzIHByZXNlbnQgYW5kIGVuYWJsZWQsIHRo
ZW4gYWxsIHdlbGwKPiA+IGFuZCBnb29kLCB3ZSBjYW4gZW51bWF0ZSBpdC4gSG93ZXZlciwgaWYg
dGhlIGRldmljZSBpcyBwcmVzZW50IGFuZCBub3QKPiA+IGVuYWJsZWQsIHRoZW4gd2UgYWxzbyBj
aGVjayB3aGV0aGVyIHRoZSBkZXZpY2UgaXMgYSBwcm9jZXNzb3IgZGV2aWNlCj4gPiB0byBsaW1p
dCB0aGUgaW1wYWN0IG9mIHRoaXMgbmV3IGNoZWNrIHRvIGp1c3QgcHJvY2Vzc29yIGRldmljZXMu
Cj4gPgo+ID4gVGhpcyBhdm9pZHMgZW51bWVyYXRpbmcgcHJlc2VudCAmJiBmdW5jdGlvbmFsIHBy
b2Nlc3NvciBkZXZpY2VzIHRoYXQKPiA+IGFyZSBub3QgZW5hYmxlZC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+IENvLWRldmVsb3Bl
ZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJqd0Byand5c29ja2kubmV0Pgo+ID4gVGVzdGVkLWJ5
OiBKb25hdGhhbiBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4KPiAKPiBJIGNhbiBxdWV1ZSB0aGlzIHVwIGZvciA2LjkgYXMgaXQgbG9va3Mg
bGlrZSB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzCj4gd2lsbCBzdGlsbCBuZWVkIHNvbWUgd29yay4g
IFdoYXQgZG8geW91IHRoaW5rPwoKVGhhdCBzZWVtcyB0byBiZSB0aGUgb25seSB3YXkgd2UgY2Fu
IG1ha2Ugc29tZSBwcm9ncmVzcyB3aXRoIHRoaXMKc2VyaWVzLiBJJ3ZlIG5vIGlkZWEgaG93IHdl
IHByb2dyZXNzIGZyb20gaGVyZSBiZWNhdXNlIEkgY2FuJ3QgYW5zd2VyCnlvdXIgcXVlc3Rpb25z
IG9uIHBhdGNoIDIuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51
eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBN
YnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
