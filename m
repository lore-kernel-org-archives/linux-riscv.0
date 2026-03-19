Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8363A1075290
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+LSqswI7tikuCXyEHpHeJEa+ilOYwbpUk6/LCze0x4=; b=yNPxDkhMXHXEgR
	ber1i91FYSxVlEB8R+iQXE4Oc/YPpCNHlGKCfncVuUScNbhygcZAkDUMrvXE9hZLzsc0LWFsn/ANt
	GWQoRtXGVo4kMz+Hw4xt644UK5PcwPrCcjiL77VzVviA1WOhaz9xXNlaLJp05ToOcHxdywaHnd62/
	Qu5Mkny7BGSJuZKbQducuQeIOlQUY3igZtc4yeADp5wh8YhyED5U8PeV+p22kSNLdmoUtXnjPbvVw
	TjG5ofjo1EaOAEeUeDSUubMNS14j6w4vGGPmhj3lDyhwg9ee39Ys7xlJ7Gcs3KbXE0yyIHH1/1cxc
	l3VIfv3JMT3cKIAaNJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AK6-0000000ANh1-31sX;
	Thu, 19 Mar 2026 10:09:50 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AK3-0000000ANft-0voK
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 10:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=pl6+j3qZ6SPny0RsBwu35gcI0En9PkQfw
	3D0Ql0HKkA=; b=JB/zsiToGsDec65b0by5RGbK2X0wDr3EoNxR7MNjJWWpJwH4u
	gTXaZSuUDYbyoH8wckvl7kAxSACrU/OaCEp+wU04Gu0Vh2hEQJqIxIRVDZilH8Zy
	eY6z4UlCdlFFJ6KqPqlg0c5QiqCKaAVPrwW5G0PaPRIzEzxSog35/2K5t4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAHtSSRy7tpApIBAA--.1409S2;
	Thu, 19 Mar 2026 18:10:25 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
From: Jia Wang <wangjia@ultrarisc.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
In-Reply-To: <177364929764.1046214.13699651740074271027.robh@kernel.org>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
 <177364929764.1046214.13699651740074271027.robh@kernel.org>
Date: Thu, 19 Mar 2026 18:09:35 +0800
Message-Id: <177391497590.2824357.9030407054711939789.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773914976; l=2688;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=FDsasxUAcM2aks4WAPlnuBI/DJ39aq2QyDS6b0IaW0c=;
 b=gOkDhGLqisBONr0ktCvrVB+i65X0cLepvAmTgmCLMkQRoh5JJ3pdv3Zmoz8taqeI1a1NRgmWH
 t58CiJrwyh3DUheOizd8l87ZVSPR8frdFrJWSL9bdbSSVZg6+UvFfKa
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAHtSSRy7tpApIBAA--.1409S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy8Cr1fZFWfWr4UuF4Uurg_yoW5Xw1fp3
	y2krn3tFWvvr13Ww4fta4xK3WrXrn7Aay3tF4DGr17tF15u3Wrt39xKw15uF1DGw48ZFy3
	Ar1a9w4xG3y2yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQALEWm7kgkAFQABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_030947_975962_7A1CCFB6 
X-CRM114-Status: GOOD (  16.45  )
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

T24gMjAyNi0wMy0xNiAwMzoyMSAtMDUwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4gCj4g
T24gTW9uLCAxNiBNYXIgMjAyNiAxNTowNjo1OSArMDgwMCwgSmlhIFdhbmcgd3JvdGU6Cj4gPiBB
ZGQgVWx0cmFSSVNDIERQMTAwMCBTb0MgUENJZSBjb250cm9sbGVyIGRldmljZXRyZWUgYmluZGlu
Z3MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEppYSBXYW5nIDx3YW5namlhQHVsdHJhcmlzYy5j
b20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3MvcGNpL3VsdHJhcmlzYyxkcDEwMDAtcGNpZS55
YW1sICAgICAgICB8IDEwOCArKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTA4IGluc2VydGlvbnMoKykKPiA+IAo+IAo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmlu
ZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOgo+IAo+IHlhbWxsaW50IHdh
cm5pbmdzL2Vycm9yczoKPiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
dWx0cmFyaXNjLGRwMTAwMC1wY2llLnlhbWw6MjY6NzogW3dhcm5pbmddIHdyb25nIGluZGVudGF0
aW9uOiBleHBlY3RlZCA0IGJ1dCBmb3VuZCA2IChpbmRlbnRhdGlvbikKPiAuL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvdWx0cmFyaXNjLGRwMTAwMC1wY2llLnlhbWw6Mzg6
MTk6IFtlcnJvcl0gc3ludGF4IGVycm9yOiBtYXBwaW5nIHZhbHVlcyBhcmUgbm90IGFsbG93ZWQg
aGVyZSAoc3ludGF4KQo+IAo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4gL2J1aWxk
cy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGNpL3VsdHJhcmlzYyxkcDEwMDAtcGNpZS55YW1sOiBpZ25vcmluZywgZXJyb3Ig
cGFyc2luZyBmaWxlCj4gbWFrZVsyXTogKioqIERlbGV0aW5nIGZpbGUgJ0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvdWx0cmFyaXNjLGRwMTAwMC1wY2llLmV4YW1wbGUuZHRz
Jwo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvdWx0cmFyaXNjLGRwMTAw
MC1wY2llLnlhbWw6Mzg6MTk6IG1hcHBpbmcgdmFsdWVzIGFyZSBub3QgYWxsb3dlZCBoZXJlCj4g
bWFrZVsyXTogKioqIFtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvTWFrZWZpbGU6
MjY6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvdWx0cmFyaXNjLGRwMTAw
MC1wY2llLmV4YW1wbGUuZHRzXSBFcnJvciAxCj4gbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVu
ZmluaXNoZWQgam9icy4uLi4KPiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvdWx0cmFyaXNjLGRwMTAwMC1wY2llLnlhbWw6Mzg6MTk6IG1hcHBpbmcgdmFsdWVzIGFyZSBu
b3QgYWxsb3dlZCBoZXJlCj4gbWFrZVsxXTogKioqIFsvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2
aWV3LWNpL2xpbnV4L01ha2VmaWxlOjE2MDY6IGR0X2JpbmRpbmdfY2hlY2tdIEVycm9yIDIKPiBt
YWtlOiAqKiogW01ha2VmaWxlOjI0ODogX19zdWItbWFrZV0gRXJyb3IgMgo+IAo+IGRvYyByZWZl
cmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6Cj4gCj4gU2VlIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kZXZpY2V0cmVlL3BhdGNoLzIwMjYwMzE2LXVsdHJhcmlz
Yy1wY2llLXYxLTMtZWYyOTQ2ZWRlNjk4QHVsdHJhcmlzYy5jb20KPiAKPiBUaGUgYmFzZSBmb3Ig
dGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVu
ZGVuY3kKPiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLgo+IAo+IElmIHlvdSBhbHJl
YWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUK
PiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0
LXNjaGVtYSBpcyB1cCB0bwo+IGRhdGU6Cj4gCj4gcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBn
cmFkZQo+IAo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFi
b3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUKPiB0aGF0IERUX1NDSEVNQV9GSUxFUyBjYW4gYmUg
c2V0IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcKPiB5b3VyIHNjaGVt
YS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlv
dXIgc2NoZW1hLgo+IAo+ClRoYW5rcyBmb3IgdGhlIHJlcG9ydC4KCknigJl2ZSByZS1ydW4gYG1h
a2UgZHRfYmluZGluZ19jaGVja2AgbG9jYWxseSB3aXRoIHVwZGF0ZWQgYHlhbWxsaW50YCBhbmQK
YGR0c2NoZW1hYCwgYW5kIEkgY2FuIHJlcHJvZHVjZSB0aGUgaXNzdWVzIHlvdSBwb2ludGVkIG91
dC4KCkkgd2lsbCBmaXggdGhlIGluZGVudGF0aW9uIGFuZCBjb3JyZWN0IHRoZSBzeW50YXggZXJy
b3IsIHJlLXZhbGlkYXRlIHRoZQpzY2hlbWEgdXNpbmcgdGhlIGZ1bGwgYGR0X2JpbmRpbmdfY2hl
Y2tgLCBhbmQgc2VuZCBhIHYyLgoKVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UuCgpCZXN0IHJlZ2Fy
ZHMsCkppYSAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
