Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAFE106B502
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhaD0D5YUP7g+H4S6yGhsNG9GqsaZrjzMNxOtUCpX/s=; b=5A4Wx6P4+toTYQ
	4sPQh1DSzWPDC1evudTR+C5363aIBJQbstfSaeV/H1dHqnShSkzUrCS2zoXxJrF1fpG25tok1MpC5
	LAq0EG384oq9cSqfxC+3GwJh/ftAI7BVd7PEd/OfbCcgMHVpDM+vK9jdT/erN17vE9Ju0W7y0uqMr
	t+IVhyQHSmmO54TQgA51QuFMFePnVU14VKHYNu95IBLTGVeX8wS2mDJaowgxqMJYlBLGIQw8XA5OO
	a+kgkYeiMfVvO76KzJq3/NvK2zE5SVdkzIh/HRhNP4pugs5AiCNSfGlz7zFElLm3unxuna/+m3bkQ
	4+kONB+UEO+BQo3G3AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mm4-00000003JcM-2dz7;
	Wed, 25 Mar 2026 11:51:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mlj-00000003JCv-2CT8;
	Wed, 25 Mar 2026 11:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3E2143A4F;
	Wed, 25 Mar 2026 11:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F905C2BCB2;
	Wed, 25 Mar 2026 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439486;
	bh=ijQZYkQ8huX8bzZfiuwKK5l/O+taUFGXBf7mUcCwX/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8VoBQpQxXDFHPLwjgn+FimF064VYiGnb02ISTZuo7sMCK/Or3p4aIxqTZnuLA+uL
	 /r3T+Vz7lEc5yc54KjVTpnI+VbV4XN+l9Nl46axhDOOVHgzVdpo/UGmLK8hQXPEUNR
	 ynBx5dd5yG3uJQWeeWTgH1cW2In1W0YVJ8QoBnAUk6K4WIL8a0REi+e01oXpRwalXe
	 gSeFc6w+k+DbJNNIa/GojyKKWjfTcx03289D4/2LfiEs6Mel5pKCUogETaR2OKLgYy
	 1ahoOxct2eimH12qdt9HBRcDZVXFXVZm9/7QyfTkESgul2vKzgUyr+V1bDmNBkVBYO
	 nsJxO9bsBzs0w==
Date: Wed, 25 Mar 2026 17:21:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH v5 phy-next 10/27] scsi: ufs: qcom: keep parallel track
 of PHY power state
Message-ID: <vu3cxpynr5mu2fzkrtmjcwijc5jz323wlnbc3r7lp2wxqmhydx@z5xhgf4myw2d>
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
 <20260319223241.1351137-11-vladimir.oltean@nxp.com>
 <ezrcjjwtg5n76w4m65l27szu5mywx66ti3xuprkfcp3x6quvbf@2rew4zrnnbt2>
 <20260325114309.3k7xkfrffpxp5xq4@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325114309.3k7xkfrffpxp5xq4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_045127_619889_E2614978 
X-CRM114-Status: GOOD (  27.78  )
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

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMDE6NDM6MDlQTSArMDIwMCwgVmxhZGltaXIgT2x0ZWFu
IHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDI0LCAyMDI2IGF0IDExOjAwOjEwQU0gKzA1MzAsIE1hbml2
YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIEZyaSwgTWFyIDIwLCAyMDI2IGF0IDEyOjMy
OjI0QU0gKzAyMDAsIFZsYWRpbWlyIE9sdGVhbiB3cm90ZToKPiA+ID4gQXMgZXhwbGFpbmVkIGlu
IHRoZSBzaW1pbGFyIHVmcy1leHlub3MuYyBjaGFuZ2UsIFBIWSBjb25zdW1lciBkcml2ZXJzCj4g
PiA+IHNob3VsZCBub3QgbG9vayBhdCB0aGUgcGh5LT5wb3dlcl9jb3VudCwgYmVjYXVzZSBpbiB0
aGUgZ2VuZXJhbCBjYXNlCj4gPiA+IHRoZXJlIG1pZ2h0IGFsc28gYmUgb3RoZXIgY29uc3VtZXJz
IHdobyBoYXZlIGNhbGxlZCBwaHlfcG93ZXJfb24oKSB0b28sCj4gPiA+IHNvIHRoZSBmYWN0IHRo
YXQgdGhlIHBvd2VyX2NvdW50IGlzIG5vbi16ZXJvIGRvZXMgbm90IG1lYW4gdGhhdCB3ZSBkaWQu
Cj4gPiA+IAo+ID4gPiBNb3Jlb3Zlciwgc3RydWN0IHBoeSB3aWxsIGJlY29tZSBvcGFxdWUgc29v
biwgc28gdGhlIHFjb20gVUZTIGRyaXZlcgo+ID4gPiB3aWxsIG5vdCBiZSBhYmxlIHRvIGFwcGx5
IHRoaXMgcGF0dGVybi4gS2VlcCBwYXJhbGxlbCB0cmFjayBvZiB0aGUgUEhZCj4gPiA+IHBvd2Vy
IHN0YXRlLCBpbnN0ZWFkIG9mIGxvb2tpbmcgYXQgYSBmaWVsZCB3aGljaCB3aWxsIGJlY29tZSB1
bmF2YWlsYWJsZQo+ID4gPiAocGh5LT5wb3dlcl9jb3VudCkuCj4gPiA+IAo+ID4gPiBBYm91dCB0
cmVhdGluZyB0aGUgcGh5X3Bvd2VyX29mZigpIHJldHVybiBjb2RlOiBmcm9tIGFuIEFQSSBwZXJz
cGVjdGl2ZSwKPiA+ID4gdGhpcyBzaG91bGQgaGF2ZSBwcm9iYWJseSByZXR1cm5lZCB2b2lkLCBv
dGhlcndpc2UgY29uc3VtZXJzIHdvdWxkIGJlCj4gPiA+IHN0dWNrIGluIGEgc3RhdGUgdGhleSBj
YW4ndCBlc2NhcGUuIFRoZSBwcm92aWRlciwgcGh5LXFjb20tcW1wLXVmcy5jLAo+ID4gPiBkb2Vz
IHJldHVybiAwIGluIGl0cyBwb3dlcl9vZmYoKSBpbXBsZW1lbnRhdGlvbi4gSSBjb25zaWRlciBp
dCBzYWZlIHRvCj4gPiA+IGRpc2NhcmQgcG90ZW50aWFsIGVycm9ycyBmcm9tIHBoeV9wb3dlcl9v
ZmYoKSBpbnN0ZWFkIG9mIGNvbXBsaWNhdGluZwo+ID4gPiB0aGUgcGh5X3Bvd2VyZWRfb24gbG9n
aWMuCj4gPiA+IAo+ID4gCj4gPiBZb3UgY291bGQgZXZlbiBzaW1wbGlmeSB0aGUgY29kZSBieSBn
ZXR0aW5nIHJpZCBvZiB0aGUgJ3BoeV9wb3dlcmVkX29uJyBjaGVjawo+ID4gYWx0b2dldGhlci4g
VGhlcmUgaXMgbm8gcmVhbCBuZWVkIHRvIHRyYWNrIHRoZSBQSFkgcG93ZXIgc3RhdGUgaW4gdGhp
cyBkcml2ZXIuCj4gPiBJdCBpcyBzYWZlIHRvIGNhbGwgcGh5X3Bvd2VyX29mZigpIHdpdGhvdXQg
YW55IGNoZWNrcy4KPiA+IAo+ID4gLSBNYW5pCj4gCj4gT2suLiBhcyB0aGUgYXV0aG9yIG9mIGNv
bW1pdCA3YmFjNjU2ODc1MTAgKCJzY3NpOiB1ZnM6IHFjb206IFBvd2VyIG9mZgo+IHRoZSBQSFkg
aWYgaXQgd2FzIGFscmVhZHkgcG93ZXJlZCBvbiBpbiB1ZnNfcWNvbV9wb3dlcl91cF9zZXF1ZW5j
ZSgpIiksCj4gSSBhc3N1bWUgeW91IGhhdmUgaGFyZHdhcmUgdG8gdGVzdC4gV291bGQgeW91IG1p
bmQgd3JpdGluZyBhIHBhdGNoIHRoYXQKPiBJIGNvdWxkIHBpY2sgdXAgdG8gcmVwbGFjZSB0aGlz
IG9uZSB3aXRoPwo+IAoKU3VyZSwgd2lsbCBkby4KCj4gSSBzdXBwb3NlIHRoYXQgdGhlIHBvd2Vy
X2NvdW50IHRlc3QgaXMgc29tZWhvdyBubyBsb25nZXIgbmVjZXNzYXJ5IGFmdGVyCj4gY29tbWl0
IDc3ZDJmYTU0YTk0NSAoInNjc2k6IHVmczogcWNvbSA6IFJlZmFjdG9yIHBoeV9wb3dlcl9vbi9v
ZmYKPiBjYWxscyIpLCBidXQgZnJhbmtseSBJIGRvbid0IHNlZSBpdCAtIHRoZSB1ZnNoY2Qgc3Rh
dGUgbWFjaGluZSBpcyBhIGJpdAo+IHRvbyBjb21wbGljYXRlZCBmb3IgbWUgdG8ganVzdCBzdGF0
aWNhbGx5IGFuYWx5emUuCgpJIGJlbGlldmUgSSBhZGRlZCB0aGUgcG93ZXJfY291bnQgY2hlY2sg
Zm9yIHBoeV9leGl0KCkuIEJ1dCBzaW5jZSB0aGF0IGdvdAptb3ZlZCwgdGhlIGNoZWNrIGJlY29t
ZXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeS4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCu
o+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
