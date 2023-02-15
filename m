Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5361C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9ay8gAToY26eEu+srrMSny3p8c0DCzLB8sUA292ZjM=; b=QjfWlPibB1Agkq
	q3iJbjSD5maiVrAe1Nul5wI3+mcITtJ7GL4xA3MtembBL6eCHicQmg6GvZbSvPQmA9MAwL43Rq3rJ
	zvGfcxPL5sPQah7iZDo/fvEuVV74DViOCPyxFRrNowgi+gBbSASP1ghGcSmDkIQ05ufpPp6jY0UJG
	0igBfMcolUtAoJ1IDn5H4aPFOpdudEAquDhzchDrzcaqze3gEDG4S8o4I1RTC+q+5HYCZMgDJglYC
	aLlFWI30s7EjPLSAyOZuMjce1OrL0aFuw3CEBmz0HFnGbTwYJp1O+gFgSiA3Jw+UgK3nIzo7iMNYy
	wUrIZz1TdyTbtZC27Rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHGz-005rqs-9K; Wed, 15 Feb 2023 12:52:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHGv-005rmd-Ft; Wed, 15 Feb 2023 12:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=WOYSFfQ0jaebxOnsbFhwjuQF7/Ba3lkdLaUdw2j21OU=; b=YW
	9DTzbhY2DetOrcc4Hed33WxxEKGNvz0hK6keVtjE5/ERT0v+4gUFRND5ckuuXGd4aFj2b3hYyd5P1
	wtPRv6SfTLZdggSPlNEcfSE5P+5t+F06Gwa44BPyXT8Xvxuvxs8JvVuHQ8YQas+MpgTTgxD7me6Ok
	lAHiNqbw2ixbsxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pSHGO-0053CA-4X; Wed, 15 Feb 2023 13:51:56 +0100
Date: Wed, 15 Feb 2023 13:51:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 08/12] net: stmmac: Add glue layer for StarFive JH7100 SoC
Message-ID: <Y+zVbPppy7jvWF5r@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch>
 <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_045229_559380_3238BAD1 
X-CRM114-Status: GOOD (  13.39  )
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

T24gV2VkLCBGZWIgMTUsIDIwMjMgYXQgMDI6MDg6MDFBTSArMDIwMCwgQ3Jpc3RpYW4gQ2lvY2Fs
dGVhIHdyb3RlOgo+IE9uIDIvMTEvMjMgMTg6MTEsIEFuZHJldyBMdW5uIHdyb3RlOgo+ID4gPiAr
Cj4gPiA+ICsjZGVmaW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVSMjggMHg3MAo+ID4gPiArLyog
VGhlIHZhbHVlIGJlbG93IGlzIG5vdCBhIHR5cG8sIGp1c3QgcmVhbGx5IGJhZCBuYW1pbmcgYnkg
U3RhckZpdmUgwq9cXyjjg4QpXy/CryAqLwo+ID4gPiArI2RlZmluZSBKSDcxMDBfU1lTTUFJTl9S
RUdJU1RFUjQ5IDB4YzgKPiA+IAo+ID4gU2VlbXMgbGlrZSB0aGUgY29tbWVudCBzaG91bGQgYmUg
b25lIGxpbmUgZWFybGllcj8KPiA+IAo+ID4gVGhlcmUgaXMgdmFsdWUgaW4gYmFzaW5nIHRoZSBu
YW1lcyBvbiB0aGUgZGF0YXNoZWV0LCBidXQgeW91IGNvdWxkCj4gPiBhcHBlbmQgc29tZXRoaW5n
IG1lYW5pbmdmdWwgb24gdGhlIGVuZDoKPiA+IAo+ID4gI2RlZmluZSBKSDcxMDBfU1lTTUFJTl9S
RUdJU1RFUjQ5X0RMWUNIQUlOIDB4YzgKPiA+IAo+ID4gPz8/Cj4gCj4gVW5mb3J0dW5hdGVseSB0
aGUgSkg3MTAwIGRhdGFzaGVldCBJIGhhdmUgYWNjZXNzIHRvIGRvZXNuJ3QgcHJvdmlkZSBhbnkK
PiBpbmZvcm1hdGlvbiByZWdhcmRpbmcgdGhlIFNZU0NUUkwtTUFJTlNZUyByZWxhdGVkIHJlZ2lz
dGVycy4gTWF5YmUgRW1pbAo+IGNvdWxkIHByb3ZpZGUgc29tZSBkZXRhaWxzIGhlcmU/CgpJZiB5
b3UgaGF2ZSBubyByZWxpYWJsZSBzb3VyY2Ugb2YgbmFtaW5nLCBqdXN0IG1ha2UgYSBuYW1lIHVw
IGZyb20gaG93CnRoZSByZWdpc3RlciBpcyB1c2VkLiBUaGlzIGlzIHdoeSBpIHN1Z2dlc3RlZCBh
ZGRpbmcgX0RMWUNIQUlOLApiZWNhdXNlIHRoYXQgaXMgd2hhdCBpcyB3cml0dGVuIHRvIGl0LiBZ
b3Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gdGhlCnNhbWUgd2l0aCByZWdpc3RlciAyOC4KCiAgICAg
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
