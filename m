Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E9DCD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kffi1L6y+8YbHqEzEAh1fb6fKUtAfFbTNCJwipzL36w=; b=CIHrv99jXADmU3
	aOMuRInAnvAYAg4CAb0eMeZ+uB897B3gBU9Ps3GHTPSrQ6p1Vmatvl6aENWoEnHMmK2bq7nnQD8tp
	aye8oPEOWtwxfsfdDlfxAqVarTU5iHPIRHmkYCKqu4s5DrhVR3vm1pUCMyjJDX7wbP08V3+lGkGPY
	GjwJ65EGHxXVVPQVkFigCKWU2ybFtStMPSeUpCgUYyhtsZK64RFl+5bbM7YZOn2A3ECo5eQK8bFnr
	w1EJa/vd0DUlpXg28RKZTeDOj6Evv11Dd3yHyLwO2mfMgrlqUrh8xLBUCyLuFNB0CxQHewcn+OUtB
	zesq0NQVyfXC738st/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhnr-00000004nF9-3Zph;
	Wed, 20 May 2026 14:21:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhnq-00000004nDx-28za;
	Wed, 20 May 2026 14:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GDgiypVIwA/PQvdX7RyrKY/+g5n+NMwhEKvQxfGp7xE=; b=WixYvNLZnwbi+Wy8l7n2aZrSLX
	1n2TMbpSF0rC54FLkAITvIiaNFtItXiawaXRTInMctrMjEEzrwylvBzY6RBZzKHMQlkONqZF/w/Br
	mrNbYV7HySrh6Q8H3z4lHFPCQ63L2NfLep9F9V6FGSqLjFbaM0utByQgJtQI0KbobzkIQ3++FIcHA
	5TV8MENexvq9ipYkRB9iybyZ4KKqFSpIiaUFsTpBSoRg4F4ruxTnjLZz9vSl/uX0DcWK0POygRw1R
	IqbsNY0Jot32XLQBaGSvx3GgH2So52C5w7DCoSUHHWYAmvKUp2IVr6is1ToGaXZBh8ffd8+pgdAMq
	futhAalA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhnm-0000000H3MA-06WD;
	Wed, 20 May 2026 14:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GDgiypVIwA/PQvdX7RyrKY/+g5n+NMwhEKvQxfGp7xE=; b=qKOs1rSHUfFyQjQ2QU90qLmsEG
	E4rO+KqFDvZdMnNVkhT2xM9SqMD/CMUMADckAN8zJzIgHiiRGrfYvDLfVYwvte7zRaDJPjinr9dN7
	W41mCtDYikWfvkdAm1kyTt5Ns2JB93TsQ4vLGQVdLdw8UDj+b5s76SDCSf59Tvpostexn9puA2nth
	1WSXxPyw1cawkSEQwtUp6XpmyN9Z6+X49zn1Jkj0dxFSvWFTrY7Udx+xmwDa/G9o8rsguZyCHlSmu
	oG53XHOV5DRGeBYTKUVFMdMkD5aBSLI4rVQszy9k+eZF8tHtjXWW6HmPSv6IqLIL+WyoyuC5IVfQI
	V1VVfT8w==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-phy@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v8 phy-next 15/31] drm/rockchip: dw_hdmi: avoid direct dereference
 of phy->dev.of_node
Date: Wed, 20 May 2026 16:21:24 +0200
Message-ID: <3758596.1xdlsreqCQ@phil>
In-Reply-To: <20260505100523.1922388-16-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
 <20260505100523.1922388-16-vladimir.oltean@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_152138_835037_C5291ACB 
X-CRM114-Status: GOOD (  10.00  )
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

SGkgVmxhZGltaXIsCgpBbSBEaWVuc3RhZywgNS4gTWFpIDIwMjYsIDEyOjA1OjA3IE1pdHRlbGV1
cm9ww6Rpc2NoZSBTb21tZXJ6ZWl0IHNjaHJpZWIgVmxhZGltaXIgT2x0ZWFuOgo+IFRoZSBkd19o
ZG1pLXJvY2tjaGlwIGRyaXZlciB2YWxpZGF0ZXMgcGl4ZWwgY2xvY2sgcmF0ZXMgYWdhaW5zdCB0
aGUKPiBIRE1JIFBIWSdzIGludGVybmFsIGNsb2NrIHByb3ZpZGVyIG9uIGNlcnRhaW4gU29DcyBs
aWtlIFJLMzMyOC4KPiBUaGlzIGlzIGN1cnJlbnRseSBhY2hpZXZlZCBieSBkZXJlZmVyZW5jaW5n
IGhkbWktPnBoeS0+ZGV2Lm9mX25vZGUKPiB0byBvYnRhaW4gdGhlIHByb3ZpZGVyIG5vZGUsIHdo
aWNoIHZpb2xhdGVzIHRoZSBHZW5lcmljIFBIWSBBUEkncwo+IGVuY2Fwc3VsYXRpb24gKHRoZSBn
b2FsIGlzIGZvciBzdHJ1Y3QgcGh5IHRvIGJlIGFuIG9wYXF1ZSBwb2ludGVyCj4gd2l0aCBhIGhp
ZGRlbiBkZWZpbml0aW9uLCB0byBiZSBpbnRlcmFjdGVkIHdpdGggb25seSB1c2luZyBBUEkKPiBm
dW5jdGlvbnMgb3IgTlVMTCBwb2ludGVyIGNoZWNrcywgZm9yIHRoZSBjYXNlIHdoZXJlIG9wdGlv
bmFsIHZhcmlhbnRzCj4gb2YgcGh5X2dldCgpIGRpZCBub3QgZmluZCBhIFBIWSkuCj4gCj4gUmVm
YWN0b3IgZHdfaGRtaV9yb2NrY2hpcF9iaW5kKCkgdG8gcGVyZm9ybSBhIG1hbnVhbCBwaGFuZGxl
IGxvb2t1cAo+IG9uIHRoZSAiaGRtaSIgUEhZIGluZGV4IHdpdGhpbiB0aGUgY29udHJvbGxlcidz
IERUIG5vZGUuIFRoaXMgcHJvdmlkZXMKPiBhIHBhcmFsbGVsIHBhdGggdG8gdGhlIGNsb2NrIHBy
b3ZpZGVyJ3MgT0Ygbm9kZSB3aXRob3V0IHJlbHlpbmcgb24gdGhlCj4gaW50ZXJuYWwgc3RydWN0
dXJlIG9mIHRoZSBzdHJ1Y3QgcGh5IGhhbmRsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1p
ciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgo+IFJldmlld2VkLWJ5OiBIZWlrbyBT
dHVlYmVyIDxoZWlrb0BzbnRlY2guZGU+Cgp0aGVyZSBpcyBub3cgYWxyZWFkeSBtb3JlIHN0dWZm
IGRlcGVuZGluZyBvbiB0aGlzIGNoYW5nZSBbMF0sIGFuZAp0aGUgY2hhbmdlIGl0c2VsZiBhbHNv
IGlzIHNvcnQgb2YgaW5kZXBlbmRlbnQgb2YgdGhlIHdob2xlCnBoeS1zZXJpZXMuIEFuZCBzb21l
aG93IHRoaXMgc2VyaWVzIGl0c2VsZiBzYWRseSBoYXNuJ3QgZ290dGVuCm11Y2ggcmV2aWV3IHll
dC4KClNvIHdvdWxkIHlvdSBiZSBvayB3aXRoIG1lIGp1c3QgcGlja2luZyB0aGlzIG9uZSBwYXRj
aCBmb3IgdGhlCmRybS1taXNjLXRyZWU/CgoKVGhhbmtzCkhlaWtvCgpbMF0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjYwNTE4MTkzNzQ4LjI0ODI4MjMtMS1qb25hc0Brd2li
b28uc2UvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
