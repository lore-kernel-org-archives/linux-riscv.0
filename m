Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F95BC9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/I1czoFSYvAJ24MQs4oHjk7YqOoY6268ATiOqdWGJs=; b=hRa+zDZ1Follnk
	4CtRFTyCMfOmE1+DIim6x8MY9AX9L6uXyKa5X8popZouwewJxKZr/kB1LXWuN8uz6YOwEgwD4FVhr
	lhCaF3r9XqM0zdJUFi/cqTDS/og9DxO0Eh/vTNeQM16tiJh5yjIg+yTyiyYXiXqTGRUKd5V/w56F7
	uuaX2baI3SATPjSrIG1GeBYLhEDvfq9ehv9O10c51CdnExc022rtNIO9jYVjqMYjXKF5/eAaP0nid
	jH+6A8bYgpTRH7YZaGyDYWosE0JhYGi1P8UwLPm4y55t6j++f5k/zbOxwmkiERLV73mK5oATSp69W
	KV2yOKdAvf9EUJopdlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArlF-0000000GZld-3eTN;
	Sun, 27 Sep 2026 16:29:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkd-0000000GZ13-1Z4C;
	Sun, 27 Sep 2026 16:29:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B989F60D78;
	Sun, 27 Sep 2026 16:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2088D1F00898;
	Sun, 27 Sep 2026 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526558;
	bh=2fuOrU+/aRvKHB+bkuI9ZfEA7MdxiGHZ/hwHu+G3Nb8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YGEyjPbV6JT1GifxMINWmW6xewJZG4mUegS88xxSJzhf8hg24ChLvOVnMAPybvpuz
	 gpLgdCKWq4S4Dx3Eomi8CZX1jvuZIx0K+YsacmlCmaqevD9BN2hbRq5LJpsP6oVQgZ
	 jWWeCbevU2LtknBmZmf293Wyk/Ft8HLcpo86nvV+OiY4vzcXSH6Esp8dRT6S3oHQkp
	 eh7XLBVV3ZiGUfNuYUdBUotyeBvqP9E28hXu200SmJmZusHYKQXw4S7D0zshWL3qPY
	 QzdUPDQtFOkjQy/6eI3WLjZyWVzsojMWBc0tx5e0OBXPgaC+NZzW4WvUCWU8ZpLdYT
	 ZPOQInYXwFMNA==
Subject: Re: [PATCH net-next v15 6/9] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
From: netdev-bot+sashiko@kernel.org
To: bartosz.golaszewski@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, radu@rendec.net,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org
Date: Sun, 27 Sep 2026 16:29:15 +0000
Message-ID: <179052655571.2160803.8220457316051367747@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-6-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-6-e82f33720737@oss.qualcomm.com>
X-sashiko-severity: Low
MIME-Version: 1.0
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bW9yZSBzZXZlcmUKaXNzdWUocykgaW4gb3RoZXIgcGF0Y2hlcyBvZiB0aGlzIHNlcmllcy4gVGhp
cyBtYWlsIGlzIG9ubHkgYW4gRllJLCBpbiBjYXNlCnlvdSB3YW50IHRvIGFkZHJlc3MgdGhlIG5p
dCBwaWNrcyBiZWxvdyB3aGVuIHlvdSByZXNwaW4uCgpMb3cgcHJpb3JpdHkgLyBuaXQgcGlja3Mg
Zm9yIHlvdXIgY29uc2lkZXJhdGlvbjoKCi0gW0xvd10gVGhpcyBwYXRjaCBmaXhlcyBhIHJlZ3Jl
c3Npb24gYWRkZWQgYnkgdGhlIHByZXZpb3VzIHBhdGNoIGluIHRoZQogIHNhbWUgc2VyaWVzLCAi
bmV0OiBzdG1tYWM6IHFjb20tZXRocW9zOiBzZXQgc2VyZGVzIG1vZGUgYmVmb3Jl4oCmCi0gW0xv
d10gVGhlIG5ldyBjb21tZW50IGluIGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcygpIChkd21hYy1x
Y29tLQogIGV0aHFvcy5jOjYzOC02NDEpIHNheXMgcGh5X21vZGUgaXMga2VwdCBpbiBzeW5jICJm
b3IgbGF0ZXLigKYKCi0tCgpuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6IHVwZGF0ZSBwaHlfbW9k
ZSB0byB0aGUgcmVzb2x2ZWQgaW50ZXJmYWNlIGluIG1hY19maW5pc2goKQoKVGhpcyBwYXRjaCB1
cGRhdGVzIGV0aHFvcy0+cGh5X21vZGUgaW4gZXRocW9zX21hY19maW5pc2hfc2VyZGVzKCkgZnJv
bSB0aGUKaW50ZXJmYWNlIHRoYXQgcGh5bGluayByZXNvbHZlZCwgc28gbGF0ZXIgc2VyZGVzX3Bv
d2VydXAoKSBjYWxscyBwcm9ncmFtCnRoZSBTZXJEZXMgdG8gdGhlIGNvcnJlY3QgbW9kZS4gSXQg
YWxzbyB3aWRlbnMgdGhlIGd1YXJkIGluCnFjb21fZXRocW9zX3NldF9zZ21paV9sb29wYmFjaygp
IHRvIGNvdmVyIFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSS4gVGhpcwprZWVwcyB0aGUgbG9vcGJh
Y2sgaW4gcGxhY2Ugb24gcmVzdW1lIHdpdGggYSAxRyBTR01JSSBsaW5rLgoKPiBldGhxb3MtPnBo
eV9tb2RlIGlzIHJlYWQgYnkgc2VyZGVzX3Bvd2VydXAoKSBhbmQKPiBxY29tX2V0aHFvc19zZXRf
c2dtaWlfbG9vcGJhY2soKSB0byBjb25maWd1cmUgdGhlIFNlckRlcyBhbmQgaXRzCj4gd3JhcHBl
ciBmb3IgdGhlIGNvcnJlY3QgaW50ZXJmYWNlLiBJdCBpcyBzZXQgb25jZSBhdCBwcm9iZSBmcm9t
IHRoZSBEVAo+IHBoeS1tb2RlIHByb3BlcnR5IGFuZCBuZXZlciB1cGRhdGVkLgoKW1NldmVyaXR5
OiBMb3ddCklzIHRoaXMgYSBsb25nLXN0YW5kaW5nIHByb2JsZW0sIG9yIHdhcyBpdCBhZGRlZCBl
YXJsaWVyIGluIHRoaXMgc2VyaWVzPwoKQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHNlcmRlc19wb3dl
cnVwKCkgb25seSBzdGFydGVkIHJlYWRpbmcgcGh5X21vZGUgaW4KdGhlIHByZWNlZGluZyBwYXRj
aCwgIm5ldDogc3RtbWFjOiBxY29tLWV0aHFvczogc2V0IHNlcmRlcyBtb2RlIGJlZm9yZQpwb3dl
cnVwIi4gVGhhdCBwYXRjaCBhZGRlZCB0aGlzIHRvIHFjb21fZXRocW9zX3NlcmRlc19wb3dlcnVw
KCk6CgoJcmV0ID0gcGh5X3NldF9tb2RlX2V4dChldGhxb3MtPnNlcmRlc19waHksIFBIWV9NT0RF
X0VUSEVSTkVULAoJCQkgICAgICAgZXRocW9zLT5waHlfbW9kZSk7CgpCZWZvcmUgdGhhdCBwYXRj
aCwgcG93ZXItdXAgbmV2ZXIgdXNlZCB0aGUgc3RhbGUgcHJvYmUtdGltZSB2YWx1ZS4KCldpdGgg
b25seSB0aGF0IHBhdGNoIGFwcGxpZWQsIGV2ZXJ5IG9wZW4vcmVzdW1lIHJlcGxhY2VzIHRoZSBy
ZXNvbHZlZAppbnRlcmZhY2UgaGVsZCBieSB0aGUgU2VyRGVzIFBIWSBkcml2ZXIgKGRhdGEtPmlu
dGVyZmFjZSBpbgpwaHktcWNvbS1zZ21paS1ldGguYykgd2l0aCB0aGUgRFQgbW9kZS4gVGhpcyBz
dGF5cyBpbiBlZmZlY3QgdW50aWwKcGh5bGlua19tYWNfaW5pdGlhbF9jb25maWcoKS0+ZXRocW9z
X21hY19maW5pc2hfc2VyZGVzKCkgcHJvZ3JhbXMgdGhlCnJlc29sdmVkIG1vZGUgYWdhaW4uCgpU
aGUgY29tbWl0IG1lc3NhZ2UgZG9lc24ndCBtZW50aW9uIHRoaXMgZGVwZW5kZW5jeSwgc28gYmFj
a3BvcnRlcnMgd29uJ3QKa25vdyBhYm91dCBpdC4gQmlzZWN0aW9uIGNhbiBhbHNvIHN0b3Agb24g
dGhlIGludGVybWVkaWF0ZSBjb21taXQuCgpCb3RoIHBhdGNoZXMgYXJlIGluIHRoZSBzYW1lIHVu
bWVyZ2VkIHNlcmllcywgc28gYSBGaXhlczogdGFnIGlzbid0IHRoZQpyaWdodCBmaXQgaGVyZS4g
Q291bGQgdGhpcyBjaGFuZ2UgYmUgZm9sZGVkIGludG8gInNldCBzZXJkZXMgbW9kZSBiZWZvcmUK
cG93ZXJ1cCIsIG9yIHBsYWNlZCBiZWZvcmUgaXQ/IENvdWxkIHRoZSBjb21taXQgbWVzc2FnZSB0
aGVuIHNheSBzbz8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4gaW5kZXggNDdiNzBiNWU3MDZmMi4uZTA2N2Nl
ZWUwMTYyMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1xY29tLWV0aHFvcy5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwoKWyAuLi4gXQoKPiBAQCAtNjM0LDYgKzYzNSwx
MiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1Y3QgbmV0X2Rldmlj
ZSAqbmRldiwgdm9pZCAqcHJpdiwKPiAgCj4gIAlxY29tX2V0aHFvc19zZXRfc2dtaWlfbG9vcGJh
Y2soZXRocW9zLCBmYWxzZSk7Cj4gIAo+ICsJLyogVGhlIGludGVyZmFjZSBtb2RlIGlzIG9ubHkg
a25vd24gb25jZSBwaHlsaW5rIGhhcyByZXNvbHZlZCBpdCBhbmQKPiArCSAqIG1heSBjaGFuZ2Ug
YXQgcnVudGltZSwgc28ga2VlcCBpdCBpbiBzeW5jIGZvciBsYXRlcgo+ICsJICogc2VyZGVzX3Bv
d2VydXAoKS9zZXJkZXNfcG93ZXJkb3duKCkgY2FsbHMuCj4gKwkgKi8KCltTZXZlcml0eTogTG93
XQpUaGlzIGlzbid0IGEgYnVnLCBidXQgaXMgdGhlIG1lbnRpb24gb2Ygc2VyZGVzX3Bvd2VyZG93
bigpIGFjY3VyYXRlPwpxY29tX2V0aHFvc19zZXJkZXNfcG93ZXJkb3duKCkgbmV2ZXIgcmVhZHMg
ZXRocW9zLT5waHlfbW9kZToKCnN0YXRpYyB2b2lkIHFjb21fZXRocW9zX3NlcmRlc19wb3dlcmRv
d24oc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsIHZvaWQgKnByaXYpCnsKCXN0cnVjdCBxY29tX2V0
aHFvcyAqZXRocW9zID0gcHJpdjsKCglwaHlfcG93ZXJfb2ZmKGV0aHFvcy0+c2VyZGVzX3BoeSk7
CglwaHlfZXhpdChldGhxb3MtPnNlcmRlc19waHkpOwp9CgpUaGUgY29tbWVudCBhbHNvIGxlYXZl
cyBvdXQgcWNvbV9ldGhxb3Nfc2V0X3NnbWlpX2xvb3BiYWNrKCkuIFRoYXQKZnVuY3Rpb24gaXMg
Y2FsbGVkIGZyb20gZXRocW9zX2Nsa3NfY29uZmlnKHRydWUpIG9uIGV2ZXJ5IG9wZW4vcmVzdW1l
OgoKCXFjb21fZXRocW9zX3NldF9zZ21paV9sb29wYmFjayhldGhxb3MsIHRydWUpOwoJZXRocW9z
X3NldF9mdW5jX2Nsa19lbihldGhxb3MpOwoKQWZ0ZXIgdGhpcyBwYXRjaCwgaXRzIGxvb3BiYWNr
IGRlY2lzaW9uIGRlcGVuZHMgb24gdGhpcyBhc3NpZ25tZW50LAp3aGljaCBpcyB3aHkgdGhlIGd1
YXJkIGhhZCB0byBiZSB3aWRlbmVkLgoKV291bGQgaXQgYmUgY2xlYXJlciB0byBsaXN0IHNlcmRl
c19wb3dlcnVwKCkgYW5kCnFjb21fZXRocW9zX3NldF9zZ21paV9sb29wYmFjaygpIGFzIHRoZSBy
ZWFkZXJzPwoKPiArCWV0aHFvcy0+cGh5X21vZGUgPSBpbnRlcmZhY2U7Cj4gKwo+ICAJaWYgKGlu
dGVyZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVfU0dNSUkgfHwKPiAgCSAgICBpbnRlcmZhY2Ug
PT0gUEhZX0lOVEVSRkFDRV9NT0RFXzI1MDBCQVNFWCkKPiAgCQlyZXQgPSBwaHlfc2V0X21vZGVf
ZXh0KGV0aHFvcy0+c2VyZGVzX3BoeSwgUEhZX01PREVfRVRIRVJORVQsCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9uZXRkZXYtYWkuYm90cy5saW51eC5kZXYvc2FzaGlrby8jL3Bh
dGNoc2V0LzIwMjYwOTIzLXFjb20tc2E4MjU1cC1lbWFjLXYxNS0wLWU4MmYzMzcyMDczNyU0MG9z
cy5xdWFsY29tbS5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
