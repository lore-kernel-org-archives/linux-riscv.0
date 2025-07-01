Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B66EC83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgwxcHuyjMA0vFD2y6mobnGeHW7UjEER/oh/hAKYlEs=; b=Y78YbubUYYfcnu
	tPB7wRWIxxxqdctnDpNo8Ay94gvuglwaAllpvI7VmYGR6zcAsCRt90LCBdxh8kyUmM+C8kBHbqjQ7
	+QiAwnF087aPr0I3LwJv58kAFmtqKDGSqXmXu4CafTrdAquZgkw2IGLRvr1ALkx0V85G9N7zH5czr
	8Y+mDQ5W3Mu8hn5mlNcPZ1wQRD9tEu+MiRR1hQcsOznN2ms2OkO1+5PwhV+b+t6jBuelmfmCa8vp4
	wU38bZqxtoT0nT9MG7+WdlVi6ilifDEzMo2l/o10oFSktAuD5GRDXWRsgcqfr0bt91NBykc062P59
	ORjCqBHHls0SpHX05ApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzI-00000006Mfo-02kZ;
	Tue, 01 Jul 2025 18:45:48 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdNO-00000005xHN-1dEY
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 15:58:32 +0000
Message-ID: <da00c7cf-a433-4498-9deb-87c34c731413@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751385506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2kAki3XpnwBL+mLkNUk+5SoguiQ5CR7AwD5fcQ1qkE=;
	b=LCf6D5nMVousjPj22Yq9MIVuXuCsGUWRMJQL8yIpDDKKskQYVmtbtQKehikg9+R6TFSI+k
	VHbp+IJMsuRaF06E9UCcz8Xk6J2YufaEsM/Kt6ByOy/tzA1zK8q/YEVNNsLUApgBaGKAOY
	iAd+YdRiUPR3RcXq3EPn65URvIMBELM=
Date: Tue, 1 Jul 2025 11:58:17 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 09/18] net: macb: sort #includes
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-9-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-9-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_085830_565380_8B5C0C18 
X-CRM114-Status: UNSURE (   9.96  )
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IFNvcnQgI2luY2x1ZGUgcHJl
cHJvY2Vzc29yIGRpcmVjdGl2ZXMuCj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRy
ZXdAbHVubi5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJv
b3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFp
bi5jIHwgMzYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+IGluZGV4IGJlNjY3Y2I1YWNjZTg1YTlkMTFhYWVh
MWY1MDgxYTMzODBiNjBlZjIuLmE2NjMzZTA3NjY0NDA4OWM3OTY0NTNmODU2YTc2NjI5OWJhZTJl
YzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4u
Ywo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBAQCAt
NiwzNiArNiwzNiBAQAo+ICAgKi8KPiAgCj4gICNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxEX01P
RE5BTUUgIjogIiBmbXQKPiAtI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvY2lyY19idWYuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgo+ICsjaW5j
bHVkZSA8bGludXgvY2xrLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcmMzMi5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2V0aGVyZGV2aWNlLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS94bG54LXp5bnFtcC5oPgo+ICsjaW5jbHVkZSA8
bGludXgvaW5ldGRldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvaW9wb2xsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pcC5oPgo+ICsjaW5jbHVkZSA8
bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZXBhcmFtLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAtI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9jaXJjX2J1Zi5oPgo+IC0j
aW5jbHVkZSA8bGludXgvc2xhYi5oPgo+IC0jaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+IC0jaW5j
bHVkZSA8bGludXgvaW8uaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5j
bHVkZSA8bGludXgvbmV0ZGV2aWNlLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9ldGhlcmRldmljZS5o
Pgo+IC0jaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvcGh5bGluay5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvb2YuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX21kaW8uaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L29mX25ldC5oPgo+IC0jaW5jbHVkZSA8bGludXgvaXAuaD4KPiAtI2luY2x1ZGUgPGxp
bnV4L3VkcC5oPgo+IC0jaW5jbHVkZSA8bGludXgvdGNwLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9p
b3BvbGwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3BoeWxpbmsuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5j
bHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcHRwX2NsYXNzaWZ5
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+IC0jaW5jbHVkZSA8bGludXgvZmlybXdh
cmUveGxueC16eW5xbXAuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2luZXRkZXZpY2UuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3RjcC5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3VkcC5oPgo+ICAjaW5jbHVkZSAi
bWFjYi5oIgo+ICAKPiAgLyogVGhpcyBzdHJ1Y3R1cmUgaXMgb25seSB1c2VkIGZvciBNQUNCIG9u
IFNpRml2ZSBGVTU0MCBkZXZpY2VzICovCj4gCgpSZXZpZXdlZC1ieTogU2VhbiBBbmRlcnNvbiA8
c2Vhbi5hbmRlcnNvbkBsaW51eC5kZXY+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
