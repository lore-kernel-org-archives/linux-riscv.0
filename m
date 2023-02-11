Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29684C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0z/KbQPGZM9t4csogneiAVU8HrsDtm13S7ul4ybYHw=; b=hchvjCMYvd91W1
	dBsIu4Rja7SRJEbeO1YfspqcxBUv7bjMHGSS+QUUv5/lZRSdNvdi2ALOChCbS9nxzwiB8fG9hz46v
	M6zssx7knaqbkRBGdmxDXc6o40QHIbJiiMu3aZwWfMMhOR4gJmjxGAvr+tRNyaU6fuKBcWw+ygiXZ
	s4kK62exumN6M3pceLZUVUsBWH3v4L7oSspFWZuOpqKEFaEs9FHLWvowaaqW6dVzNKfdtA/KPbdkU
	dkZtFgqNsMF54+ZIp5ct9BQXNbec+lhQPAff0HhPsv4sIyA+8NmuhDtNMywkAEXDqIEFiIdGGmHxI
	/mpcjD1Y58VZs13r1plg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsTo-009s87-5R; Sat, 11 Feb 2023 16:12:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsTk-009s5X-9d; Sat, 11 Feb 2023 16:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=QIsGxB3foIcUzmrB1itBt2fP/mbnt75It4usqWhNhqE=; b=P7
	vtKGwpGWflFG3N+B1RRIjxiM27gprx3GRBS7un6JwuWk8/FV4d9LEQ4CwLk+IFnSxLF22ydIkzt32
	X9aBWQyuop1jYaVXEqsxufkvQT5F3P3eUtKeDSavDF2GGB9RX3+B35o5Hygx+fQ2daJPJiXTvnERk
	aEASDZm9A+FlUko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pQsTP-004iBC-Gy; Sat, 11 Feb 2023 17:11:35 +0100
Date: Sat, 11 Feb 2023 17:11:35 +0100
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
Message-ID: <Y+e+N/aiqCctIp6e@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_081156_397684_AF2342B0 
X-CRM114-Status: UNSURE (   9.91  )
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

PiArCj4gKyNkZWZpbmUgSkg3MTAwX1NZU01BSU5fUkVHSVNURVIyOCAweDcwCj4gKy8qIFRoZSB2
YWx1ZSBiZWxvdyBpcyBub3QgYSB0eXBvLCBqdXN0IHJlYWxseSBiYWQgbmFtaW5nIGJ5IFN0YXJG
aXZlIMKvXF8o44OEKV8vwq8gKi8KPiArI2RlZmluZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5
IDB4YzgKClNlZW1zIGxpa2UgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIG9uZSBsaW5lIGVhcmxpZXI/
CgpUaGVyZSBpcyB2YWx1ZSBpbiBiYXNpbmcgdGhlIG5hbWVzIG9uIHRoZSBkYXRhc2hlZXQsIGJ1
dCB5b3UgY291bGQKYXBwZW5kIHNvbWV0aGluZyBtZWFuaW5nZnVsIG9uIHRoZSBlbmQ6CgojZGVm
aW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVSNDlfRExZQ0hBSU4gMHhjOAoKPz8/Cgo+ICsJaWYg
KCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInN0YXJmaXZlLGd0eGNsay1kbHljaGFpbiIsICZn
dHhjbGtfZGx5Y2hhaW4pKSB7Cj4gKwkJcmV0ID0gcmVnbWFwX3dyaXRlKHN5c21haW4sIEpINzEw
MF9TWVNNQUlOX1JFR0lTVEVSNDksIGd0eGNsa19kbHljaGFpbik7Cj4gKwkJaWYgKHJldCkKPiAr
CQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJlcnJvciBzZWxlY3RpbmcgZ3R4Y2xr
IGRlbGF5IGNoYWluXG4iKTsKPiArCX0KCllvdSBzaG91bGQgcHJvYmFibHkgZG9jdW1lbnQgdGhh
dCBpZiBzdGFyZml2ZSxndHhjbGstZGx5Y2hhaW4gaXMgbm90CmZvdW5kIGluIHRoZSBEVCBibG9i
LCB0aGUgdmFsdWUgZm9yIHRoZSBkZWxheSBjaGFpbiBpcyB1bmRlZmluZWQuICBJdAp3b3VsZCBh
Y3R1YWxseSBiZSBiZXR0ZXIgdG8gZGVmaW5lIGl0LCBzZXQgaXQgdG8gMCBmb3IgZXhhbXBsZS4g
VGhhdAp3YXksIHlvdSBrbm93IHlvdSBkb24ndCBoYXZlIGFueSBkZXBlbmRlbmN5IG9uIHRoZSBi
b290bG9hZGVyIGZvcgpleGFtcGxlLgoKCUFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
