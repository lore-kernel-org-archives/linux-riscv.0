Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A6EF531EB
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yYSWDRVcDnunWxam+eQ4BOTqApjyW5va0cx5Jd36SU=; b=dAhwMbGQIdqoCx
	Zayy3PdxEMeIonLImIz8oHM554L0shHcZ9+r0YNiBmVwHdMegLyIPyuH+R+pK0BBYpCfDAkgOdwSQ
	ACSVfZnTxSdAsumxGZMZzfU7/5q3C9IGkOatU2KwKgnycR6yJEJ5MM+Zlpqw4p/rKL7gaijvMvupm
	CrtcIQgaC02SJ8araciP2DP7JUuLYD4RKCUea4Xfe/x6shVmJCMC5gOWk42cj05tyyzbaX+aoVS8h
	hLxE65UobW1Sxab3QAwhXZ9gtMvueN2dxr9dz8CYggNxqNTbVaexmAXAEU4Z1k5SK0OtsdHbZVIx+
	edczOB8XFglFzJI3OSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCURG-0000000GdwS-2tlV;
	Tue, 14 Apr 2026 03:27:46 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCURD-0000000Gdsp-04f7
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=irEOIAeIzUS6UP0UrzOxi19q2YKjJd8JI
	x+Bx+4jCSM=; b=cqk0bxpZfC9XjKKAPxfXrskDLMTDTcUAbb9sHL31WC9y0I8Au
	z3ZPYs4KgWBBxGsu1oMQlaw4C4HCc0+nVMyJxmRSfPRjUiqEvJPW5LqjtebbwWG6
	k6rKLLAMUR9jZKyqZHp5tgMFbnu5U7ojAZSXekD2HvgnYBap26wGae8S40=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEJItN1pVxYCAA--.1182S2;
	Tue, 14 Apr 2026 11:28:09 +0800 (CST)
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
In-Reply-To: <20260408-wise-dividers-ec8a057d4bd2@spud>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-1-2aa2a19a7fb3@ultrarisc.com>
 <20260407-shown-guileless-5c8b8d94f5e5@spud>
 <177561282495.2731393.9548650582911498336.b4-reply@b4>
 <20260408-wise-dividers-ec8a057d4bd2@spud>
Date: Tue, 14 Apr 2026 11:27:22 +0800
Message-Id: <177613724276.4104287.2231755690464498119.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776137243; l=3173;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=KUPRhC1x/yzG3Mxn3e7SBxQSss+cduj2TK+sbO13rAE=;
 b=FN+8w632+RkQXyHIU0y3L8wN9tMkhHCx8tpaVj+B9zlfAi+qfwwpTOvz5rtXb5F8GiCopRgna
 CtdYbZ9/o3kBTsDWMGou2C6uggPr28he/g/30VW3jCVsEBqPlH0jQYA
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEEJItN1pVxYCAA--.1182S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyrur1kAF4DCF4xtF15CFg_yoW5AryxpF
	4rCFyYkFs8KF4ftr9Fqw4UurWavan2qrW5Wr1xJ34rZFZ0kry5XF4DtrWaga4DXrZ8Cw1v
	vFyrK3W7uF45ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWnYc7wAZAAOsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_202743_803842_B5AC60F9 
X-CRM114-Status: GOOD (  31.14  )
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

T24gMjAyNi0wNC0wOCAxODoxMCArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFdlZCwg
QXByIDA4LCAyMDI2IGF0IDA5OjQ3OjA0QU0gKzA4MDAsIEppYSBXYW5nIHdyb3RlOgo+ID4gT24g
MjAyNi0wNC0wNyAxNzoyOSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBUdWUs
IEFwciAwNywgMjAyNiBhdCAxMDo0MDo1MkFNICswODAwLCBKaWEgV2FuZyB3cm90ZToKPiA+ID4g
PiBUaGUgZmlyc3QgU29DIGluIHRoZSBVbHRyYVJJU0Mgc2VyaWVzIGlzIFVSLURQMTAwMCwgY29u
dGFpbmluZyBvY3RhCj4gPiA+ID4gVWx0cmFSSVNDIEMxMDAgY29yZXMuCj4gPiA+IAo+ID4gPiBO
b3QgZ29ubmEgbGllLCBJIGZpbmQgaXQgb2RkIHRoYXQgcGNpZSBpcyB3aGVyZSB0aGlzIHBsYXRm
b3JtIHN0YXJ0cwo+ID4gPiBvZmYsIGJ1dCBzdXJlLiBXaGF0J3MgdGhlIHBsYW4gZm9yIGFkZGlu
ZyB0aGUgcmVzdCBvZiB0aGUgcGxhdGZvcm0/Cj4gPiA+Cj4gPiAKPiA+IEhpIENvbm9yLAo+ID4g
Cj4gPiBUaGFua3MgZm9yIHRoZSBxdWVzdGlvbi4KPiA+IAo+ID4gT3VyIG5leHQgc3RlcCBpcyB0
byB1cHN0cmVhbSB0aGUgcGluY3RybCBkcml2ZXIgdG9nZXRoZXIgd2l0aCB0aGUgcmVsYXRlZAo+
ID4gRFRTIHVwZGF0ZXMuIFRoZSBwaW5jdHJsIHNlcmllcyBvbmx5IGFmZmVjdHMgdGhlIFNvQ+KA
mXMgbG93LXNwZWVkIHBlcmlwaGVyYWwKPiA+IGludGVyZmFjZXMuIEZvciBHTUFDLCBTUEksIEky
QywgYW5kIEdQSU8sIHdlIHBsYW4gdG8gdXNlIHRoZSBleGlzdGluZwo+ID4ga2VybmVsIGRyaXZl
cnMsIHNvIG5vIG5ldyBjb250cm9sbGVyIGRyaXZlcnMgYXJlIG5lZWRlZCAKPiAKPiBBbmQgY2xv
Y2tzPyBwaW5jdHJsIGFuZCBjbG9ja3Mgd291bGQgYmUgdGhlIGJhcmUgbWluaW11bSBsZXZlbCBv
Zgo+IHN1cHBvcnQgcmVxdWlyZWQgYmVmb3JlIGEgcGxhdGZvcm0gc2hvdWxkIGJlIG1lcmdlZC4g
T2J2aW91c2x5LCB5b3UgY2FuCj4gZ2V0IGRldmljZSBkcml2ZXJzIGZvciBQQ0kgZXRjIGV0YyBt
ZXJnZWQgd2l0aG91dCBjbG9jayBkcml2ZXJzLCBidXQgdGhlCj4gaW5pdGlhbCBkdHMgc2hvdWxk
IGNvbnRhaW4gdGhlIGNsb2NrcyB0b28uCj4KCk9uIG91ciBwbGF0Zm9ybSwgYWxsIGZ1bmN0aW9u
YWwgY2xvY2tzIGFyZSBmdWxseSBjb25maWd1cmVkIGFuZCBlbmFibGVkIGJ5CnRoZSBmaXJtd2Fy
ZSBiZWZvcmUgTGludXggYm9vdHMuIFRoZSBrZXJuZWwgaXMgbm90IGV4cGVjdGVkIHRvIGFkanVz
dCBjbG9jawpyYXRlcyBvciBnYXRlL3VuZ2F0ZSBjbG9ja3MgYXQgcnVudGltZS4gIApUaGVyZWZv
cmUsIGluIHRoZSBpbml0aWFsIGRldmljZSB0cmVlIHdlIG9ubHkgZGVzY3JpYmUgdGhlIGZpeGVk
IGNsb2NrcwpyZXF1aXJlZCBieSB0aGUgc3RhbmRhcmQgc3Vic3lzdGVtIGRyaXZlcnMsIHVzaW5n
IGBmaXhlZC1jbG9ja2Agd2hlcmUgbmVlZGVkLgoKU2luY2UgdGhlcmUgaXMgbm8gY2xvY2sgY29u
dHJvbGxlciBhY2Nlc3NpYmxlIHRvIHRoZSBPUywgd2UgZG8gbm90IHBsYW4gdG8KYWRkIGEgY2xv
Y2sgZHJpdmVyIGF0IHRoaXMgc3RhZ2UuIElmIGZ1dHVyZSBoYXJkd2FyZSB2ZXJzaW9ucyBleHBv
c2UgYQpwcm9ncmFtbWFibGUgY2xvY2sgY29udHJvbGxlciB0byBMaW51eCwgd2Ugd2lsbCB1cHN0
cmVhbSB0aGUgY29ycmVzcG9uZGluZwpkcml2ZXIgYW5kIHVwZGF0ZSB0aGUgRFQgYWNjb3JkaW5n
bHkuCiAKPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaWEgV2FuZyA8d2FuZ2ppYUB1
bHRyYXJpc2MuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcuc29j
cyB8IDkgKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
PiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgYi9h
cmNoL3Jpc2N2L0tjb25maWcuc29jcwo+ID4gPiA+IGluZGV4IGQ2MjFiODVkZDYzYi4uOTg3MDg1
NjllYzZhIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gPiA+
ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+ID4gPiBAQCAtODQsNiArODQsMTUg
QEAgY29uZmlnIEFSQ0hfVEhFQUQKPiA+ID4gPiAgCWhlbHAKPiA+ID4gPiAgCSAgVGhpcyBlbmFi
bGVzIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgYmFzZWQgVC1IRUFEIFNvQ3MuCj4gPiA+ID4gIAo+
ID4gPiA+ICtjb25maWcgQVJDSF9VTFRSQVJJU0MKPiA+ID4gPiArCWJvb2wgIlVsdHJhUklTQyBS
SVNDLVYgU29DcyIKPiA+ID4gPiArCWhlbHAKPiA+ID4gPiArCSAgVGhpcyBlbmFibGVzIHN1cHBv
cnQgZm9yIFVsdHJhUklTQyBTb0MgcGxhdGZvcm0gaGFyZHdhcmUsCj4gPiA+ID4gKwkgIGluY2x1
ZGluZyBib2FyZHMgYmFzZWQgb24gdGhlIFVSLURQMTAwMC4KPiA+ID4gCj4gPiA+ID4gKwkgIFVS
LURQMTAwMCBpcyBhbiA4LWNvcmUgNjQtYml0IFJJU0MtViBTb0MgdGhhdCBzdXBwb3J0cwo+ID4g
PiA+ICsJICB0aGUgUlY2NEdDQkhYIElTQS4gSXQgc3VwcG9ydHMgSGFyZHdhcmUgVmlydHVhbGl6
YXRpb24KPiA+ID4gPiArCSAgYW5kIFJJU0MtViBSVjY0IElTQSBIKHYxLjApIEV4dGVuc2lvbi4K
PiA+ID4gCj4gPiA+IERlbGV0ZSB0aGlzIHNlY3Rpb24gSU1PLCBkb2Vzbid0IHByb3ZpZGUgYW55
IHJlYWwgdmFsdWUuIERvbid0IG5lZWQgbm9yCj4gPiA+IHdhbnQgdGhlIG1hcmtldGluZyBicm9j
aHVyZSBpbiB0aGUgaGVscCB0ZXh0LiBUaGUgZmlyc3Qgc2VudGVuY2UgaXMKPiA+ID4gc3VmZmlj
aWVudC4KPiA+ID4KPiA+IAo+ID4gSeKAmWxsIGRyb3AgdGhlIFNvQyBkZXNjcmlwdGlvbiBwYXJ0
IGZyb20gdGhlIEtjb25maWcgaGVscCB0ZXh0IGFzIHlvdQo+ID4gc3VnZ2VzdGVkLgo+ID4gIAo+
ID4gPiA+ICsKPiA+ID4gPiAgY29uZmlnIEFSQ0hfVklSVAo+ID4gPiA+ICAJYm9vbCAiUUVNVSBW
aXJ0IE1hY2hpbmUiCj4gPiA+ID4gIAlzZWxlY3QgUE9XRVJfUkVTRVQKPiA+ID4gPiAKPiA+ID4g
PiAtLSAKPiA+ID4gPiAyLjM0LjEKPiA+ID4gPiAKPiA+IAo+ID4gQmVzdCByZWdhcmRzLAo+ID4g
SmlhIFdhbmcKPiA+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
