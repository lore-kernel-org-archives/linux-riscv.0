Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F378D105D992
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 01:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFWnA44OqI4nglm5jUBq69SFwEA1QAbm2FxWT8yW0CQ=; b=2eYjbe0JbYxyJP
	S0SaLGsPf2Mkei+889477KW/CnG0egs7zGL0PyZN25gTZRFUj7spbeR+ph/aH4/iVqrmYOHXimClK
	b9Swocpy2vVYg4pq4EX62VK+MUX4YCPYBRGmvu3ybEPzgqiNMtlpPzBF4V+8P/a3p1+lHVdbC4DJx
	vdp91Ti0NVBRnRbho54XLt48PgJkzXv6Hgx3D3HtaODkkIgRiJp5PbaP7MGGBNi+OxxkEEEOZ89Ou
	3IfZdioPNa2ljRGrlRHALD7h2O9z69y8HJ9irVZFdbPQo9Nu1k4QcuWCiY8FvSnVl6p2WSagHnXEt
	sgw6CiA89+ETFbcCZ62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI0o-000000086B8-1rbj;
	Wed, 08 Apr 2026 01:47:22 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI0k-000000086A9-32Os
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 01:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=v2ZpFKZ/AQsdYQlk9IBkKHx5XqLUslRX6
	ByqCZmbkEU=; b=gnxAX7UuBfJ1Cmi6979zEjTRxBFPE5BC4BbJ7sFxJ0VGCoL55
	LD/FAe1VImik0zBDYqS413oC66xMZy+5dvo5oac6Hrx3blJWdzuNTPiYZ5zDPyA3
	Kv+waxeqryrSQixZXTDrFVDpLunOJw6QNh9WbcxTBILfEyxTtN1VP2cdIU=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEELHs9Vp+6kBAA--.905S2;
	Wed, 08 Apr 2026 09:47:52 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] riscv: add UltraRISC SoC family Kconfig support
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260407-shown-guileless-5c8b8d94f5e5@spud>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-1-2aa2a19a7fb3@ultrarisc.com>
 <20260407-shown-guileless-5c8b8d94f5e5@spud>
Date: Wed, 08 Apr 2026 09:47:04 +0800
Message-Id: <177561282495.2731393.9548650582911498336.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775612825; l=1927;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=i0dYsL4yUueJ1cAqUP1xzFPT+0rfwfboD6UwNL4rbjc=;
 b=9i1+wyuOTnFY16LgLMob0IB6IKa/m+ARZPhZWrHM+Tr9j8ZgcpSyhohOfC976wd4wrolWJ3k4
 gzVv0pkedoQB+5Etk8kISb9ErzxusztZpRbkoIS1wIdOy0KhkoWbXH+
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEELHs9Vp+6kBAA--.905S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy3JrW3KF1UKF45Xr1kKrg_yoW8Aw4xpF
	4rCa45CFZxGF1ftF9aqw409rW3uFsaq3y5uw4UJw1rAFZ8Cry5ZFnrKry3W3WDZFWkJryf
	KFyFg3W3uF45Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQALEWnUfzsANAAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_184719_425563_B5D47C6F 
X-CRM114-Status: GOOD (  21.81  )
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

T24gMjAyNi0wNC0wNyAxNzoyOSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFR1ZSwg
QXByIDA3LCAyMDI2IGF0IDEwOjQwOjUyQU0gKzA4MDAsIEppYSBXYW5nIHdyb3RlOgo+ID4gVGhl
IGZpcnN0IFNvQyBpbiB0aGUgVWx0cmFSSVNDIHNlcmllcyBpcyBVUi1EUDEwMDAsIGNvbnRhaW5p
bmcgb2N0YQo+ID4gVWx0cmFSSVNDIEMxMDAgY29yZXMuCj4gCj4gTm90IGdvbm5hIGxpZSwgSSBm
aW5kIGl0IG9kZCB0aGF0IHBjaWUgaXMgd2hlcmUgdGhpcyBwbGF0Zm9ybSBzdGFydHMKPiBvZmYs
IGJ1dCBzdXJlLiBXaGF0J3MgdGhlIHBsYW4gZm9yIGFkZGluZyB0aGUgcmVzdCBvZiB0aGUgcGxh
dGZvcm0/Cj4KCkhpIENvbm9yLAoKVGhhbmtzIGZvciB0aGUgcXVlc3Rpb24uCgpPdXIgbmV4dCBz
dGVwIGlzIHRvIHVwc3RyZWFtIHRoZSBwaW5jdHJsIGRyaXZlciB0b2dldGhlciB3aXRoIHRoZSBy
ZWxhdGVkCkRUUyB1cGRhdGVzLiBUaGUgcGluY3RybCBzZXJpZXMgb25seSBhZmZlY3RzIHRoZSBT
b0PigJlzIGxvdy1zcGVlZCBwZXJpcGhlcmFsCmludGVyZmFjZXMuIEZvciBHTUFDLCBTUEksIEky
QywgYW5kIEdQSU8sIHdlIHBsYW4gdG8gdXNlIHRoZSBleGlzdGluZwprZXJuZWwgZHJpdmVycywg
c28gbm8gbmV3IGNvbnRyb2xsZXIgZHJpdmVycyBhcmUgbmVlZGVkIAo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKaWEgV2FuZyA8d2FuZ2ppYUB1bHRyYXJpc2MuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9LY29uZmlnLnNvY3MgfCA5ICsrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5z
b2NzIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+IGluZGV4IGQ2MjFiODVkZDYzYi4uOTg3
MDg1NjllYzZhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gPiBAQCAtODQsNiArODQsMTUgQEAgY29uZmln
IEFSQ0hfVEhFQUQKPiA+ICAJaGVscAo+ID4gIAkgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0
aGUgUklTQy1WIGJhc2VkIFQtSEVBRCBTb0NzLgo+ID4gIAo+ID4gK2NvbmZpZyBBUkNIX1VMVFJB
UklTQwo+ID4gKwlib29sICJVbHRyYVJJU0MgUklTQy1WIFNvQ3MiCj4gPiArCWhlbHAKPiA+ICsJ
ICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgVWx0cmFSSVNDIFNvQyBwbGF0Zm9ybSBoYXJkd2Fy
ZSwKPiA+ICsJICBpbmNsdWRpbmcgYm9hcmRzIGJhc2VkIG9uIHRoZSBVUi1EUDEwMDAuCj4gCj4g
PiArCSAgVVItRFAxMDAwIGlzIGFuIDgtY29yZSA2NC1iaXQgUklTQy1WIFNvQyB0aGF0IHN1cHBv
cnRzCj4gPiArCSAgdGhlIFJWNjRHQ0JIWCBJU0EuIEl0IHN1cHBvcnRzIEhhcmR3YXJlIFZpcnR1
YWxpemF0aW9uCj4gPiArCSAgYW5kIFJJU0MtViBSVjY0IElTQSBIKHYxLjApIEV4dGVuc2lvbi4K
PiAKPiBEZWxldGUgdGhpcyBzZWN0aW9uIElNTywgZG9lc24ndCBwcm92aWRlIGFueSByZWFsIHZh
bHVlLiBEb24ndCBuZWVkIG5vcgo+IHdhbnQgdGhlIG1hcmtldGluZyBicm9jaHVyZSBpbiB0aGUg
aGVscCB0ZXh0LiBUaGUgZmlyc3Qgc2VudGVuY2UgaXMKPiBzdWZmaWNpZW50Lgo+CgpJ4oCZbGwg
ZHJvcCB0aGUgU29DIGRlc2NyaXB0aW9uIHBhcnQgZnJvbSB0aGUgS2NvbmZpZyBoZWxwIHRleHQg
YXMgeW91CnN1Z2dlc3RlZC4KIAo+ID4gKwo+ID4gIGNvbmZpZyBBUkNIX1ZJUlQKPiA+ICAJYm9v
bCAiUUVNVSBWaXJ0IE1hY2hpbmUiCj4gPiAgCXNlbGVjdCBQT1dFUl9SRVNFVAo+ID4gCj4gPiAt
LSAKPiA+IDIuMzQuMQo+ID4gCgpCZXN0IHJlZ2FyZHMsCkppYSBXYW5nCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
