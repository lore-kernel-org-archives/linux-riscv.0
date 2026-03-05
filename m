Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE119F30955
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzikcwXd3CyT/5gh+whuOKysoqBnTENvfH9TE57Uoag=; b=OLfCr+XPVF8NNO
	uLth8lu6++w52o98OWXeG+A7BGHLLjo4FYWeS5LdB5XwINzYPzSGsXllgI7AnaeRlOCfvM0oGhu91
	vDnDbl4n3WnwwvyGo9MT9suRdC4VIRfV8eQ7skBa5DGH+w7eBHeGOaOXY3/50VysJd98ajW3oZf61
	13QOL6maZMT18M1JiTtJvil8zQpNp9C3MiG8YCj0hr0cfTC8prFXIlO1atd2uFfm/cQLOOkXdjg6U
	3MVyLi/XFVFJv/Lv8q/kFVViD1/8DV10ZORtjJ+CiLqWkWc037v9zAtr+sVIwZyEB7nYuIZ182U+D
	0zPOxNjAaZE3anuWxyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83u-00000001neh-0CLM;
	Thu, 05 Mar 2026 12:44:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83q-00000001ncS-3AGV;
	Thu, 05 Mar 2026 12:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L3RgJ7ay7e4JV2CizcjZPXE74NAx+EJwuTVFkQMPa0A=; b=l50LaDmjwGawLaPx5tzHoFyGj9
	uGN8SEcW1FWI6giSjN9Agdyb79Tf3OMhQXp/1gLi0v88hElChCRRTsLpqVYtIZK+paqMnlyltD32A
	LQ0AhdD22P4ujgDapZgRXFYGLCZrA45NiSH8me9Kg1PaTgCmj/ZWbGhtviqwB04DVbNPwnLa8dKI9
	9mxRpqIu1HtkdGIRvZLX3sD9iAPjMIC43yTRproxomlma7C/XuD/8yQmfeCSYHF/SWDmMp1a0l3AJ
	wMvKbs4k9v54egyciEG7tZ4AAqzht7nPQY0ActrFtJhzqMRqqOw4aTsCQSik4pbjnzIjQ7ivxUwR2
	mURwhBjQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54444)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vy83h-000000007wT-3LTg;
	Thu, 05 Mar 2026 12:44:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vy83d-000000000Sp-2FwN;
	Thu, 05 Mar 2026 12:44:01 +0000
Date: Thu, 5 Mar 2026 12:44:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305123956.ojkt4k3ly64xz7fu@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_044414_790239_BB3CAFEC 
X-CRM114-Status: UNSURE (   8.94  )
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

T24gVGh1LCBNYXIgMDUsIDIwMjYgYXQgMDI6Mzk6NTZQTSArMDIwMCwgVmxhZGltaXIgT2x0ZWFu
IHdyb3RlOgo+IE9uIFRodSwgTWFyIDA1LCAyMDI2IGF0IDA5OjI5OjU3UE0gKzA5MDAsIEtyenlz
enRvZiBXaWxjennFhHNraSB3cm90ZToKPiA+IEZvciBjb250ZW50IG1hdGNoLCBpdCBjb3VsZCBh
bHNvIGJlOgo+ID4gCj4gPiAgIEs6ICAgIHBoeQo+ID4gCj4gPiBJIGJlbGlldmUgdGhpcyB3b3Vs
ZCBtYXRjaCBldmVyeXRoaW5nIG9mIGludGVyZXN0Pwo+IAo+IFllYWgsIGFuZCB3YXkgbW9yZS4g
VGhpbmsgVVNCIFBIWSwgbmV0d29yayBQSFksIGV0Yy4gRG9uJ3Qgd2FudCB0byBkcm93bgo+IHRo
ZSBsaW51eC1waHkgbWFpbGluZyBsaXN0IGluIHVucmVsYXRlZCBwYXRjaGVzLCBlaXRoZXIuCgpB
bHNvIHBoeWxpbmssIGFueSBtZW1vcnkgbWFuYWdlbWVudCAvIERNQSBzdHVmZiB0aGF0IGhhcHBl
bnMgdG8gbWVudGlvbgoicGh5c2ljYWwiLCBhbmQgcHJvYmFibHkgbnVtZXJvdXMgb3RoZXIgZXhh
bXBsZXMuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcu
dWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVw
LiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
