Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEFC83F07
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGjZ8n1BxRfama28Lm100swcaSvf7+SffSNDXv8nApY=; b=LAIgCQ1ihJ43FW
	silSNkTH45ALV5FFtjLF0S3eMfD0ZjUAlhgOXkWG4bz878ZqWFYX75r3l7zDxpcz2BQFnbU93L3Pu
	tFAYOBHK0Xc3L7RDqaB/2/uLPXD4I2ZxqmE9vBhMKIhFgCAoZx0SK/S9GZYZw0womgEiQjNtilOma
	plH39K1vDOZ7KDRYDwELUXBxm71JR/W4klCL1/TPSrEUXlnhZlH78PNVOs24fcJOY1pNhUUqxvtw7
	ixOQp5psUiV9j8hjTYJW+lCWXo+2Ei7go5RbixX4G3QRgH6AdZ9rtWx7x7aMKdGI/62lCpbTZiu38
	rIn09w5CYScaLwlbVREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflM-00000006KoX-2umf;
	Tue, 01 Jul 2025 18:31:24 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd1g-00000005uSZ-1pQb
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 15:36:05 +0000
Message-ID: <1a4afc5b-4418-4dc1-8779-b9d999f8022f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751384160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCxKnSswnNtpFGvtkXVBmSxifi7UjWwGEwVedZPlbCM=;
	b=fwBE/RaNY/JxaBidGlMSzanuOo6Pzf7xVEkWcviwChwDS/G+6I+EFkG6H0+T50EDv3gjGv
	IkBa9ZzIUZJI4vL1XHDE4iLlR/Ssszp163h/q6XXdQjdU9FapdalrcSshXefzgctZRvX8d
	g2hTUfDK8UkDL7ieiT8vj5oeVYgzuk8=
Date: Tue, 1 Jul 2025 11:35:53 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 06/18] net: macb: Remove local variables
 clk_init and init in macb_probe()
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
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-6-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-6-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083604_611531_FEAD7B64 
X-CRM114-Status: GOOD (  15.90  )
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IFJlbW92ZSBsb2NhbCB2YXJp
YWJsZXMgY2xrX2luaXQgYW5kIGluaXQuIFRob3NlIGZ1bmN0aW9uIHBvaW50ZXJzIGFyZQo+IGFs
d2F5cyBlcXVpdmFsZW50IHRvIG1hY2JfY29uZmlnLT5jbGtfaW5pdCBhbmQgbWFjYl9jb25maWct
PmluaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290
bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4u
YyB8IDEzICsrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Nh
ZGVuY2UvbWFjYl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFp
bi5jCj4gaW5kZXggNTNhYWY2YjA4ZTM5YTQ1YmRlNWFmNjFhMDVmYjJiOWZkNjUzYjJlNy4uNmM4
YTM0ZTQwYjc3ZWEzN2VkMjVjMmIwNDE0NDQwY2QzZjY5NjJjMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+IEBAIC01MTY2LDEwICs1MTY2LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyBkZWZhdWx0X2dlbV9jb25maWcgPSB7Cj4gIHN0
YXRpYyBpbnQgbWFjYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4g
IAljb25zdCBzdHJ1Y3QgbWFjYl9jb25maWcgKm1hY2JfY29uZmlnID0gJmRlZmF1bHRfZ2VtX2Nv
bmZpZzsKPiAtCWludCAoKmNsa19pbml0KShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICosIHN0cnVj
dCBjbGsgKiosCj4gLQkJCXN0cnVjdCBjbGsgKiosIHN0cnVjdCBjbGsgKiosICBzdHJ1Y3QgY2xr
ICoqLAo+IC0JCQlzdHJ1Y3QgY2xrICoqKSA9IG1hY2JfY29uZmlnLT5jbGtfaW5pdDsKPiAtCWlu
dCAoKmluaXQpKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKikgPSBtYWNiX2NvbmZpZy0+aW5pdDsK
PiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsKPiAgCXN0cnVj
dCBjbGsgKnBjbGssICpoY2xrID0gTlVMTCwgKnR4X2NsayA9IE5VTEwsICpyeF9jbGsgPSBOVUxM
Owo+ICAJc3RydWN0IGNsayAqdHN1X2NsayA9IE5VTEw7Cj4gQEAgLTUxOTEsMTQgKzUxODcsMTEg
QEAgc3RhdGljIGludCBtYWNiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAkJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7Cj4gIAo+ICAJCW1hdGNoID0gb2Zf
bWF0Y2hfbm9kZShtYWNiX2R0X2lkcywgbnApOwo+IC0JCWlmIChtYXRjaCAmJiBtYXRjaC0+ZGF0
YSkgewo+ICsJCWlmIChtYXRjaCAmJiBtYXRjaC0+ZGF0YSkKPiAgCQkJbWFjYl9jb25maWcgPSBt
YXRjaC0+ZGF0YTsKPiAtCQkJY2xrX2luaXQgPSBtYWNiX2NvbmZpZy0+Y2xrX2luaXQ7Cj4gLQkJ
CWluaXQgPSBtYWNiX2NvbmZpZy0+aW5pdDsKPiAtCQl9Cj4gIAl9Cj4gIAo+IC0JZXJyID0gY2xr
X2luaXQocGRldiwgJnBjbGssICZoY2xrLCAmdHhfY2xrLCAmcnhfY2xrLCAmdHN1X2Nsayk7Cj4g
KwllcnIgPSBtYWNiX2NvbmZpZy0+Y2xrX2luaXQocGRldiwgJnBjbGssICZoY2xrLCAmdHhfY2xr
LCAmcnhfY2xrLCAmdHN1X2Nsayk7Cj4gIAlpZiAoZXJyKQo+ICAJCXJldHVybiBlcnI7Cj4gIAo+
IEBAIC01MzM2LDcgKzUzMjksNyBAQCBzdGF0aWMgaW50IG1hY2JfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCQlicC0+cGh5X2ludGVyZmFjZSA9IGludGVyZmFjZTsKPiAg
Cj4gIAkvKiBJUCBzcGVjaWZpYyBpbml0ICovCj4gLQllcnIgPSBpbml0KHBkZXYpOwo+ICsJZXJy
ID0gbWFjYl9jb25maWctPmluaXQocGRldik7Cj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gZXJyX291
dF9mcmVlX25ldGRldjsKPiAgCj4gCgpSZXZpZXdlZC1ieTogU2VhbiBBbmRlcnNvbiA8c2Vhbi5h
bmRlcnNvbkBsaW51eC5kZXY+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
