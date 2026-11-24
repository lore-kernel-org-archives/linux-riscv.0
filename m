Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0212606A33F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p/U8KUiQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2570TPHrEDQpqlnWHRNRGq/TV95PUz6RhNnNDnG5iYE=; b=p/U8KUiQkFO4GMgn35WbA5iuo6
	fIpqFQGg5u9s581MXAXAwHYn8W8Hxd8BfSh78hQGZDAgC16Pjk9KJVBhoFRnroP6KbNUXHKw1ScFh
	PFgtDXyYnmGOdGvVxLuNDtOpyi3M8r/hz1fCzbDqgcXq9npn6MTlh8V7DEGtNDVtlzZhr6/sV8MGw
	tHoxdjUvOpORsi1fibL4/T8O8dftQlZ9sD7SFGVrmvyVvOV494RCZ8QOxlyKQ1th1GmaWSkMgs/iT
	vv/p2/tW1tZGw0dgvmIPXVESDsa32nwwIw7L61yxjhLY2PCyCfD5l4LyKpYHv/a0pEC8XqV+1W+2H
	+0XysX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVm4C-00000005vvc-3pG0;
	Tue, 24 Nov 2026 08:39:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVm49-00000005vuL-3xeJ;
	Tue, 24 Nov 2026 08:39:56 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowADnDfhFTQVrj+mUAQ--.9372S2;
	Tue, 24 Nov 2026 16:39:34 +0800 (CST)
Message-ID: <6fd9adfbb46959316ea18581513e21a71732df80.camel@iscas.ac.cn>
Subject: Re: [PATCH v3 0/2] drm/bridge: add glue driver for T-Head TH1520 DW
 MIPI DSI
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
Date: Tue, 24 Nov 2026 16:39:33 +0800
In-Reply-To: <c89271be-85f9-41ba-9c19-c78743d212c8@rock-chips.com>
References: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
	 <c89271be-85f9-41ba-9c19-c78743d212c8@rock-chips.com>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnDfhFTQVrj+mUAQ--.9372S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4fCr1rGry5Xw4DtF47Arb_yoW5Xr43pa
	17GFy3AFWDJrn2gF97tw1rXFW5Xws5JFyvgrW5tw1fZws8Wa4xXF9Fkrs8WFy8Xr1fuF12
	vF40g34fWrnFvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUVuWlDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_003954_754184_0AC25ECF 
X-CRM114-Status: GOOD (  23.88  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMjTkuoznmoQgMTY6MjQgKzA4MDDvvIxDaGFveWkgQ2hlbuWGmemBk++8mgo+
IEhpIEljZW5vd3ksCj4gCj4gT24gMTEvMjQvMjAyNiAzOjU2IFBNLCBJY2Vub3d5IFpoZW5nIHdy
b3RlOgo+ID4gVC1IZWFkIFRIMTUyMCBjb250YWlucyBhIERlc2lnbldhcmUgTUlQSSBEU0kgaG9z
dCBjb250cm9sbGVyIHBhaXJlZCB3aXRoCj4gPiBhbiBpbnRlcm5hbCBEZXNpZ25XYXJlIFBIWSwg
YXMgYSBzaW1pbGFyIGRlc2lnbiAoYnV0IHdpdGggYSBkaWZmZXJlbnQKPiA+IFBIWSkgd2l0aCB0
aGUgUm9ja2NoaXAgRFcgTUlQSSBEU0kuCj4gPiAKPiA+IFRoZSBmdW5jdGlvbmFsaXR5IHRvIHdy
aXRlIHRvIHRoZSBQSFkgaXMgc2hhcmVkIGJldHdlZW4gdGhlc2UgdHdvCj4gPiBpbXBsZW1lbnRh
dGlvbnMgb2YgRFcgTUlQSSBEU0ksIHNvIGl0J3MgZXh0cmFjdGVkIGZyb20gdGhlIFJvY2tjaGlw
Cj4gPiBkcml2ZXIgdG8gdGhlIGNvbW1vbiBjb2RlLiAoVGhlIHNhbWUgc2VxdWVuY2UgY291bGQg
YmUgc2VlbiBpbiB0aGUKPiA+IEhpU2lsaWNvbiBLaXJpbiBEUk0gZHJpdmVyLCBidXQgdGhhdCBv
bmUgaGFzbid0IGJlZW4gY29udmVydGVkIHRvIGNvbW1vbgo+ID4gRFcgTUlQSSBEU0kuKQo+ID4g
Cj4gPiBUZXN0ZWQgb24gYSBMaWNoZWUgQ29uc29sZSA0QSAod2l0aCBhIE1pbmdqdW4gTUowNzBC
STMwSUEyIHBhbmVsKSB3aXRoCj4gPiBmdXJ0aGVyIHBlbmRpbmcgRFQgcGF0Y2hlcy4KPiA+IAo+
ID4gT25lIHF1ZXN0aW9uIHJlbWFpbnM6IEkgaGF2ZSB0byBjb3B5IHRoZSBleHRyYSBsYW5lIGJh
bmR3aWR0aCBoZWFkcm9vbQo+ID4gZnJvbSB0aGUgUm9ja2NoaXAgZHJpdmVyLCBvdGhlcndpc2Ug
dGhlIE1pbmdqdW4gcGFuZWwgY2Fubm90IGtlZXAgc3luYwo+ID4gdG8gdGhlIGRpc3BsYXkgc2ln
bmFsOyBmcm9tIG15IHRlc3RpbmcsIGNoYW5naW5nIHRoZSBoYXJkY29kZWQKPiA+IFBIWV9TVE9Q
X1dBSVRfVElNRSBmcm9tIDB4MjAgdG8gMHgyICh3aGljaCBpcyB3cml0dGVuIGJ5IHRoZSB2ZW5k
b3IKPiA+IGRyaXZlcikgY2FuIGFsc28gbWFrZSB0aGlzIHBhbmVsIHRvIHdvcmsgdy9vIHRoZSBl
eHRyYSBoZWFkcm9vbS4gSSB3YW50Cj4gPiBzb21lIGFkdmljZSBvbiB3aGV0aGVyIHRvIGtlZXAg
dGhlIGV4dHJhIGhlYWRyb29tIG9yIGNoYW5naW5nIHRoZSBjb21tb24KPiA+IGNvZGUgdG8gbWFr
ZSB0aGUgUEhZX1NUT1BfV0FJVF9USU1FIHBhcmFtZXRlciBhZGp1c3RhYmxlLgo+ID4gCj4gCj4g
RG9lcyB0aGUgRGVzaWduV2FyZSBQSFkgZGF0YWJvb2sgZGVzY3JpYmUgYWJvdXQgUEhZX1NUT1Bf
V0FJVF9USU1FPwoKVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgdGhlIGRhdGFib29rIGZvciB0
aGlzIHNwZWNpZmljIFBIWSwgYW5kIEkgZG9uJ3QKa25vdyB3aGV0aGVyIHRoaXMgZmllbGQgaXMg
YSBQSFktc3BlY2lmaWMgdmFsdWUuCgpUaGFua3MsCkljZW5vd3kKCj4gICAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+ID4gLS0tCj4g
PiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBGaXhlZCBhIHJlbWFpbmluZyBgc3lzY29uYCBpbiB0aGUg
RFQgYmluZGluZy4KPiA+IC0gTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYxMTE5LXRoMTUyMC1kdy1taXBpLWRzaS12Mi0wLTlhYjVmOTgwOGY4N0Bpc2Nhcy5hYy5jbgo+
ID4gCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBDaGFuZ2VkIGBzeXNjb25gIHRvIGB0aGVhZCx2
by1zeXNjb25gIGluIHRoZSBEVCBiaW5kaW5nLgo+ID4gLSBEcm9wcGVkIHRoZSBwYXRjaCBtb3Zp
bmcgY29tbW9uIFBIWSB3cml0ZSByb3V0aW5lIHRvIGR3LW1pcGktZHNpCj4gPiAgIGNvbW1vbiBj
b2RlLgo+ID4gLSBGaXhlZCBhIGZldyBwcm9ibGVtcyBwb2ludGVkIG91dCBieSBTYXNoaWtvIGlu
IHYxLgo+ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjEwMzAt
dGgxNTIwLWR3LW1pcGktZHNpLXYxLTAtNzUzZjM0ZmQzMDRmQGlzY2FzLmFjLmNuCj4gPiAKPiA+
IC0tLQo+ID4gSWNlbm93eSBaaGVuZyAoMik6Cj4gPiAgICAgICBkdC1iaW5kaW5nczogZGlzcGxh
eTogYnJpZGdlOiBkb2N1bWVudCBUSDE1MjAgTUlQSSBEU0kgY29udHJvbGxlcgo+ID4gICAgICAg
ZHJtL2JyaWRnZTogYWRkIFRIMTUyMCBEZXNpZ25XYXJlIE1JUEkgRFNJIGhvc3QgY29udHJvbGxl
cgo+ID4gCj4gPiAgLi4uL2Rpc3BsYXkvYnJpZGdlL3RoZWFkLHRoMTUyMC1kdy1taXBpLWRzaS55
YW1sICAgfCAxMDMgKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgIHwgIDEyICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90aDE1MjAtZHctbWlwaS1kc2kuYyAgICAgICAgfCA1NzAgKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2ODYgaW5zZXJ0aW9ucygrKQo+ID4gLS0tCj4gPiBiYXNl
LWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNAo+ID4gY2hh
bmdlLWlkOiAyMDI2MTAzMC10aDE1MjAtZHctbWlwaS1kc2ktNTgwZDViMjc5MmY5Cj4gPiAKPiA+
IEJlc3QgcmVnYXJkcywKPiA+IC0tICAKPiA+IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlz
Y2FzLmFjLmNuPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
