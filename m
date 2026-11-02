Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D8606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q16/SoXi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Qu8rS3/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oAVHMf3F930io7l6Gk3/B43wBVBpNc2lIl+r3NYoMHg=; b=q16/SoXioxOf9ck6/slWOj7Gf6
	22t0qTFl2zOR6PR4di+TgX5+BVzkZAX9M9/EOvqBxKuVf9hCyxX+7I6wjJSAr5awypg8k7x4CqyK7
	A+PV9LTvc93q511zLW1IY+A/WLkHSkhnDYyOjE+5ElfRYVj3g8UPJoIaLLr/nSQLlWMDGXrK96hyM
	s/ZlHyipp+qPOqF2lzNPDW/b9RwxNUIicc7CILGKB+vtxWq9vUWDu8lpKoQMAUFhLjrYTfsy75Btc
	5DwMv7VnSI/79kY9/Fprg6kWM4hulm1XG6rAV7RSFUo+dAVzXOEqAOezuLMogtiZvcNV03ikpqeZv
	gLTLUTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs22-0000000GbCG-0bnY;
	Mon, 02 Nov 2026 13:25:02 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs1y-0000000GbAD-1ETb;
	Mon, 02 Nov 2026 13:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793625848; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f7Xj01KuAiYLRFZ+56umfnvwPieOTuuNKubnySrPhZLWp8JqNxCguowM6NtZlNunGTvzyEub80/7UsQoB3UHHdRgGE4E8B8YU6yGOhy7e0fYJKJmxzTxfX7w5f59SA6NfeWVybPz1QPSC5fvh4iRXGusJSAUJ3aF/XjI1oExzj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793625848; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; 
	b=jps1Uiapc+8FaK5ZxCW3Dc/dkjMP6bgPcwqaiDmdrJgffG/h6FXxNV/lJg/Gnq/mbop4tVkR0C43BTQWMNHTw9vvaLBPvIs+jTSHIQPC+uMc3m5RqyUNaHzaJsXpogybICGB6eo970cBy5VE/y0S5KEYA+zdZJXuSiDPIIwiTfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Qu8rS3/GfL5UlN+4BnbLjwL8zeIrFA6ZMfNA75YGjePSitq7ifCFZq3OxDx3w3zx+AUV4NRctYOeOqe5lJywNMaJGZ47MOco7+J60iLR8JYvU2UrwFvGx4+4GMhHQQ5H2MGJFeHjjLgyrpwdxLwNFnt9/peSWo0dOV/ThUSx1fcddVf2WiPabuAEX3y/TZsD0J7YFy8+araqMgJnFi4dT5Q5ildpQYBzXMxYrCRKwEwAabcp2jBOPx7XeVUXCtvXqVRCxx28ZD2PZM2Dgdsu7IdOEFwxRAnR+jcxFTYmQ81driIwfvwc76pWHgHzTtw6Q0ieNl3VaTQHI0yQKEjnHw==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793625845538857.5780358922513;
	Mon, 2 Nov 2026 05:24:05 -0800 (PST)
Message-ID: <df946ddae7f00aa3fcc2b2ad953392f33a94ad37.camel@icenowy.me>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?=	
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-riscv@lists.infradead.org, Han
 Gao <gaohan@iscas.ac.cn>
Date: Mon, 02 Nov 2026 21:23:56 +0800
In-Reply-To: <20261102-spry-snobbish-hound-384cae@quoll>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
	 <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
	 <20261102-spry-snobbish-hound-384cae@quoll>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_052458_400261_406D6959 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMDLkuIDnmoQgMTI6MjggKzAxMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ
6YGT77yaCj4gT24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgMDM6NDc6NDlQTSArMDgwMCwgSWNlbm93
eSBaaGVuZyB3cm90ZToKPiA+ICvCoCBpbnRlcnJ1cHRzOgo+ID4gK8KgwqDCoCBtYXhJdGVtczog
MQo+ID4gKwo+ID4gK8KgIGNsb2NrczoKPiA+ICvCoMKgwqAgaXRlbXM6Cj4gPiArwqDCoMKgwqDC
oCAtIGRlc2NyaXB0aW9uOiBEU0kgY29udHJvbGxlciBBUEIgY2xvY2sKPiA+ICvCoMKgwqDCoMKg
IC0gZGVzY3JpcHRpb246IFBIWSBjb25maWd1cmF0aW9uIGNsb2NrCj4gPiArwqDCoMKgwqDCoCAt
IGRlc2NyaXB0aW9uOiBQSFkgcmVmZXJlbmNlIGNsb2NrCj4gPiArwqDCoMKgwqDCoCAtIGRlc2Ny
aXB0aW9uOiBEU0kgY29udHJvbGxlciBpbnB1dCBwaXhlbCBjbG9jayBnYXRlCj4gPiArCj4gPiAr
wqAgY2xvY2stbmFtZXM6Cj4gPiArwqDCoMKgIGl0ZW1zOgo+ID4gK8KgwqDCoMKgwqAgLSBjb25z
dDogcGNsawo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDogcGh5X2NmZwo+ID4gK8KgwqDCoMKgwqAg
LSBjb25zdDogcmVmCj4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiBwaXhlbAo+ID4gKwo+ID4gK8Kg
IHN5c2NvbjoKPiAKPiBTdWNoIHByb3BlcnR5IG5hbWVzIGFyZSBub3QgYWxsb3dlZC4gTWlzc2lu
ZyB2ZW5kb3IgcHJlZml4LCBtaXNzaW5nCj4gZGVzY3JpcHRpdmUgbmFtZS4KClNvcnJ5IGJlY2F1
c2UgSSB0aG91Z2h0IGBzeXNjb25gIGlzIGEgZ2VuZXJpYyBuYW1lIC0tIGl0J3MgYXZhaWxhYmxl
IGFzCmEgY29tcGF0aWJsZSBzdHJpbmcgKGFsdGhvdWdoIHdpdGggU29DLXNwZWNpZmljIGZhbGxi
YWNrcykgaW4KbWZkL3N5c2Nvbi55YW1sIC4gSSdtIG9rYXkgdG8gbmFtZSB0aGlzIHByb3BlcnR5
IGB0aGVhZCxzeXNjb25gIG9yCmB0aGVhZCx2b3N5cy1zeXNjb25gIC4KCj4gCj4gPiArwqDCoMKg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiA+ICvCoMKg
wqAgZGVzY3JpcHRpb246Cj4gPiArwqDCoMKgwqDCoCBQaGFuZGxlIHRvIHRoZSBWTyBzdWJzeXN0
ZW0gc3lzdGVtIGNvbnRyb2xsZXIuCj4gCj4gRm9yIHdoYXQgcHVycG9zZT8gSG93IGRvZXMgdGhp
cyBkZXZpY2UgdXNlIFZPPyBXaGF0IGlzIFZPIHN1YnN5c3RlbQo+IHN5c3RlbT8KClZPIGlzIHNo
b3J0IGZvciAiVmlkZW8gT3V0cHV0IiwgdGhlIG5hbWUgZm9yIG9uZSBvZiB0aGUgInN1YnN5c3Rl
bXMiIG9uClRIMTUyMCwgYW5kIHRoaXMgYWJicmV2aWF0aW9uIGlzIHVzZWQgaW4gdGhlIHVzZXIg
bWFudWFsIGluIHN0cmluZ3MgYXMKIlZPX1NVQlNZUyIuIEEgY2VydGFpbiByZWdpc3RlciBpcyB3
aXJlZCB0byBELVBIWSBzaWRlYmFuZCBzaWduYWxzIGFuZAp0aHVzIGJvdW5kIHRvIHRoZSBEU0kg
Y29udHJvbGxlci4KClNob3VsZCBJIGFkZCB0aGUgaW5mb3JtYXRpb24gaW4gdGhlIGxhc3Qgc2Vu
dGVuY2UgdG8gdGhlIGJpbmRpbmc/CgpUaGFua3MsCkljZW5vd3kKCj4gCj4gPiArCj4gPiArcmVx
dWlyZWQ6Cj4gPiArwqAgLSBjb21wYXRpYmxlCj4gPiArwqAgLSByZWcKPiA+ICvCoCAtIGNsb2Nr
cwo+ID4gK8KgIC0gY2xvY2stbmFtZXMKPiA+ICvCoCAtIHJlc2V0cwo+ID4gK8KgIC0gcmVzZXQt
bmFtZXMKPiA+ICvCoCAtIGludGVycnVwdHMKPiA+ICvCoCAtIHN5c2Nvbgo+ID4gK8KgIC0gcG9y
dHMKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
