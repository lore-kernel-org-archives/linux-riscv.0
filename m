Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E120D35698
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dQ1gXVkQfjYQH+3u3wI5100nsRheW4hoFOn1n1rRcg=; b=eS7Yso0/T/5ue8
	CXKPhVPNvlEW9cnMvG7gQDeGXaXP6Ne031khmH9sNT/ubDtbiFzlbAzu1vm3QAPCFsB+zsiglEwL3
	mV4pn52btM6+NacxpINHc/9G1endDXfmX9YRfBNRuO4Oz++oMtWMdwULHSS7P5JPHm2/VCYja2P4T
	7LqtttPkyh4EVItQbblKl3gLy9mypgdfQywvjNrpFJ373XxUgG1egzDKGwcpsb9eMgwenVYxgy60J
	8xvZZxxoyGhJ4kjMiEHHJBKBshk8+6bLDx7FBiQWZNzmMTfEbCzWr0dzn9JeQOtE1fZ2BX+UGhKRI
	yA0nKY1zPKhqLfXRpYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1fy-0000000FjZW-2XHo;
	Wed, 28 Jan 2026 09:17:26 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1fr-0000000FjYC-1Fwk;
	Wed, 28 Jan 2026 09:17:25 +0000
Received: from [192.168.0.109] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowAD3nmr+03lp6YiOBg--.8714S2;
	Wed, 28 Jan 2026 17:16:46 +0800 (CST)
Message-ID: <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
Date: Wed, 28 Jan 2026 17:16:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yao Zi <ziyao@disroot.org>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260128072931.875041-4-inochiama@gmail.com>
X-CM-TRANSID: qwCowAD3nmr+03lp6YiOBg--.8714S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW5Wr48GF4xGryDuF17KFg_yoW5uFWkpF
	WrJF97KrWqyF4fAw4IyFZrZFn3Zr47tr17ur1ftryfGFn5Jr95Wr1FkrWxGr1xCrZ3Ja48
	Z3Wfu3W3Wa9F93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYQeOtUUUUU==
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011722_946585_DD6C5B8E 
X-CRM114-Status: GOOD (  22.39  )
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

SGkgSW5vY2hpLAoKSSBoYXZlIHNvbWUgY29tbWVudHMgYmVsb3cuCgpPbiAxLzI4LzI2IDE1OjI5
LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IFRoZSBldGhlcmVuZXQgY29udHJvbGxlciBvbiBTcGFj
ZW1pdCBLMyBTb0MgaXMgU3lub3BzeXMgRGVzaWduV2FyZQpUeXBvOiBldGhlcmVuZXQgLT4gZXRo
ZXJuZXQKPiBNQUMgKHZlcnNpb24gNS40MGEpLCB3aXRoIHRoZSBmb2xsb3dpbmcgc3BlY2lhbCBw
b2ludDoKTml0OiBwb2ludCAtPiBwb2ludHPCoAo+IDEuIFRoZSByYXRlIG9mIHRoZSB0eCBjbG9j
ayBsaW5lIGlzIGF1dG8gY2hhbmdlZCB3aGVuIHRoZSBtYWMgc3BlZWQKPiAgICByYXRlIGlzIGNo
YW5nZWQsIGFuZCBubyBuZWVkIGZvciBjaGFuZ2luZyB0aGUgaW5wdXQgdHggY2xvY2suCj4gMi4g
VGhpcyBjb250cm9sbGVyIHJlcXVpcmUgYSBleHRyYSBzeXNjb24gZGV2aWNlIHRvIGNvbmZpZ3Vy
ZSB0aGUKPiAgICBpbnRlcmZhY2UgdHlwZSwgZW5hYmxlIHdha2UgdXAgaW50ZXJydXB0IGFuZCBk
ZWxheSBjb25maWd1cmF0aW9uCj4gICAgaWYgbmVlZGVkLgo+Cj4gQWRkIFNwYWNlbWl0IGR3bWFj
IGRyaXZlciBzdXBwb3J0IG9uIHRoZSBTcGFjZW1pdCBLMyBTb0MuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgfCAgMTIgKwo+ICBkcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZSAgfCAgIDEgKwo+ICAuLi4vZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3BhY2VtaXQuYyAgfCAyMTggKysrKysrKysrKysrKysr
KysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNwYWNlbWl0
LmMKPgo+IFsuLi5dCj4KPiArCj4gKy8qIGRsaW5lIHJlZ2lzdGVyIGJpdHMgKi8KPiArI2RlZmlu
ZSBSR01JSV9SWF9ETElORV9FTgkJQklUKDApCj4gKyNkZWZpbmUgUkdNSUlfUlhfRExJTkVfU1RF
UAkJR0VOTUFTSyg1LCA0KQo+ICsjZGVmaW5lIFJHTUlJX1JYX0RMSU5FX0NPREUJCUdFTk1BU0so
MTUsIDgpCj4gKyNkZWZpbmUgUkdNSUlfVFhfRExJTkVfRU4JCUJJVCgxNikKPiArI2RlZmluZSBS
R01JSV9UWF9ETElORV9TVEVQCQlHRU5NQVNLKDIxLCAyMCkKPiArI2RlZmluZSBSR01JSV9UWF9E
TElORV9DT0RFCQlHRU5NQVNLKDMxLCAyNCkKPiArCj4gKyNkZWZpbmUgTUFYX0RMSU5FX0RFTEFZ
X0NPREUJCTB4ZmYKPiArI2RlZmluZSBNQVhfV09SS0VEX0RFTEFZCQkyODAwCj4gKwo+ICsvKiBO
b3RlOiB0aGUgZGVsYXkgc3RlcCB2YWx1ZSBpcyBhdCAwLjFwcyAqLwo+ICtzdGF0aWMgY29uc3Qg
dW5zaWduZWQgaW50IGszX2RlbGF5X3N0ZXBfMTB4WzRdID0gewo+ICsJMzY3LCA0OTMsIDU1OSwg
Njg1Cj4gK307Cj4gKwo+ICtzdGF0aWMgaW50IHNwYWNlbWl0X2R3bWFjX3NldF9kZWxheShzdHJ1
Y3QgcmVnbWFwICphcG11LAo+ICsJCQkJICAgIHVuc2lnbmVkIGludCBkbGluZV9vZmZzZXQsCj4g
KwkJCQkgICAgdW5zaWduZWQgaW50IHR4X2NvZGUsIHVuc2lnbmVkIGludCB0eF9jb25maWcsCj4g
KwkJCQkgICAgdW5zaWduZWQgaW50IHJ4X2NvZGUsIHVuc2lnbmVkIGludCByeF9jb25maWcpCj4g
K3sKPiArCXVuc2lnbmVkIGludCBtYXNrLCB2YWw7Cj4gKwo+ICsJbWFzayA9IFJHTUlJX1RYX0RM
SU5FX1NURVAgfCBSR01JSV9UWF9ETElORV9DT0RFIHwgUkdNSUlfVFhfRExJTkVfRU4gfAo+ICsJ
ICAgICAgIFJHTUlJX1JYX0RMSU5FX1NURVAgfCBSR01JSV9SWF9ETElORV9DT0RFIHwgUkdNSUlf
UlhfRExJTkVfRU47Cj4gKwl2YWwgPSBGSUVMRF9QUkVQKFJHTUlJX1RYX0RMSU5FX1NURVAsIHR4
X2NvbmZpZykgfAo+ICsJICAgICAgRklFTERfUFJFUChSR01JSV9UWF9ETElORV9DT0RFLCB0eF9j
b2RlKSB8IFJHTUlJX1RYX0RMSU5FX0VOIHwKPiArCSAgICAgIEZJRUxEX1BSRVAoUkdNSUlfUlhf
RExJTkVfU1RFUCwgcnhfY29uZmlnKSB8Cj4gKwkgICAgICBGSUVMRF9QUkVQKFJHTUlJX1JYX0RM
SU5FX0NPREUsIHJ4X2NvZGUpIHwgUkdNSUlfUlhfRExJTkVfRU47Cj4gKwo+ICsJcmV0dXJuIHJl
Z21hcF91cGRhdGVfYml0cyhhcG11LCBkbGluZV9vZmZzZXQsIG1hc2ssIHZhbCk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfZHdtYWNfZGV0ZWN0ZWRfZGVsYXlfdmFsdWUodW5zaWdu
ZWQgaW50IGRlbGF5LAo+ICsJCQkJCSAgICAgICB1bnNpZ25lZCBpbnQgKmNvbmZpZykKPiArewo+
ICsJdW5zaWduZWQgaW50IGJlc3RfZGVsYXkgPSAwOwo+ICsJdW5zaWduZWQgaW50IGJlc3RfY29u
ZmlnID0gMDsKPiArCWludCBiZXN0X2NvZGUgPSAwOwo+ICsJaW50IGk7Cj4gKwo+ICsJaWYgKGRl
bGF5ID09IDApCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJaWYgKGRlbGF5ID4gTUFYX1dPUktFRF9E
RUxBWSkKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwkvKgo+ICsJICogTm90ZSBLMyByZXF1
aXJlIGEgc3BlY2lmaWMgZmFjdG9yIGZvciBjYWxjdWxhdGUKPiArCSAqIHRoZSBkZWxheSwgaW4g
dGhpcyBzY2VuYXJpbyBpdCBpcyAwLjkuIFNvIHRoZQo+ICsJICogZm9ybXVsYSBpcyBjb2RlICog
c3RlcCAvIDEwICogMC45Cj4gKwkgKi8KPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGsz
X2RlbGF5X3N0ZXBfMTB4KTsgaSsrKSB7Cj4gKwkJdW5zaWduZWQgaW50IHN0ZXAgPSBrM19kZWxh
eV9zdGVwXzEweFtpXTsKPiArCQlpbnQgY29kZSA9IERJVl9ST1VORF9DTE9TRVNUKGRlbGF5ICog
MTAgKiAxMCwgc3RlcCAqIDkpOwo+ICsJCXVuc2lnbmVkIGludCB0bXAgPSBjb2RlICogc3RlcCAq
IDkgLyAxMCAvIDEwOwo+ICsKPiArCQlpZiAoYWJzKHRtcCAtIGRlbGF5KSA8IGFicyhiZXN0X2Rl
bGF5IC0gZGVsYXkpKSB7Cj4gKwkJCWJlc3RfY29kZSA9IGNvZGU7Cj4gKwkJCWJlc3RfZGVsYXkg
PSB0bXA7Cj4gKwkJCWJlc3RfY29uZmlnID0gaTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJKmNvbmZp
ZyA9IGJlc3RfY29uZmlnOwo+ICsKPiArCXJldHVybiBiZXN0X2NvZGU7CgpJcyB0aGlzIHJlYWxs
eSBuZWNlc3Nhcnk/IEZvciBLMSBJIGp1c3QgdXNlZCB0aGUgc21hbGxlc3Qgc3RlcCBzaXplLgoK
SXQgc2VlbXMgdG8gbWUgeW91IGhhdmUsIGZvciB0aGUgc21hbGxlc3Qgc3RlcCBzaXplLCBhYm91
dCAzNi43cHMgKiAwLjkKPSAzM3BzIHBlciBzdGVwLiBUaGVvcmV0aWNhbGx5IHNwZWFraW5nIHRo
YXQgbGV0cyB5b3UgZmluZSB0dW5lIHRoZQpkZWxheSB0byB3aXRoaW4gMSUgb2YgdGhlIDJucyB0
b3RhbCByZXF1aXJlZCBSR01JSSBkZWxheSAoTUFDICsgUENCICsKUEhZKS4gSW4gcHJhY3RpY2Ug
dGhpcyBudW1iZXIgc2hvdWxkbid0IGJlIHRoYXQgbWFyZ2luYWwuwqAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
