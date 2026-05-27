Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D1ECD6E41
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwBXK8TO/UQKohOR6hQBTRPha7SExZvZ08gAy0O5KKs=; b=Lr//YDOtDtSO3N
	szHz+b4v2y0Rlk8CRQ7VvR4Nkkk4OaUs6+KqEf2D6Wq+WJGOEN4hTCO1i+dJYnFLTJVPmeylAHtJp
	K8dlc8yPC/rEkTZephpWj+BF+mc7kFKPJh85bAb9uijXJ9g1RuP1HNgiJYzgQX+2L4oXujclc6XXm
	P8u9moXx5ZVhaYnqh7/JCDGGbnVZmdIqo/BMeUP4ezHGiCp4aTfTGDiTV6136CLkoXvrj0yHZLBGV
	VdT5GeD8hmqkwV4xhSgGg7frKX0SWjq947eZzyShmoVocbAiKfa1G5I9XMuOonYVV3YTBb7bRTm/m
	7GfTfBY7YG5hSGD2PZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8hE-00000003Soq-0RKh;
	Wed, 27 May 2026 07:28:56 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8hA-00000003So7-3jrS
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 07:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=aTzgD1xNBOFZmHe9UcKPBDuGQHLwp2lyF
	LdiyP2gw48=; b=c/epkeuXoLiWYazhe49qYVy8LTpavjCL4MR44L3Dfo0GA7yFL
	4N0fEWq6njm3gMAfrSKKj9I5h/VWhHsiz1sa5AFeDs2D7PDouNHL9JiTyObYS3qT
	ao7YfkGbi4WiD5hoajwrvucgftk2qUGTNP/QbOuSUQ9tP1rfhX1KLNdOf8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkNInRZq+lYGAA--.7935S2;
	Wed, 27 May 2026 15:29:12 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
Date: Wed, 27 May 2026 15:28:33 +0800
Message-Id: <177986691307.2389245.7536116830945296316.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779866913; l=3376;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=vcwwQUyK9n27QlQwBaK17jTaA1swwbBF2mQ7+rIB5eo=;
 b=3s2aR7VhNFkucLVDqg8lLUBYxLlcbU2SHYxTq/poolqPMDfRhsy3KLEMkdqiPufl7/86MvS2n
 u9fuk/K+NjoDLLXyPmoFu6DGxuFxU3XjRNNUBMJNc+EnlhOfHjvM6CQ
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwAnEkNInRZq+lYGAA--.7935S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF45KF4fXryruF18Wr18uFg_yoW5GFyrpF
	WrKa1ayFW5GF4a9Fyj93yDAFyfGFn7G347try5K3yrtrn5Aas3uFyrWrW5CFn8Cr95Wr1a
	va15ury3uay5JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgABsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_002853_496283_1A1FB7A6 
X-CRM114-Status: GOOD (  20.95  )
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

T24gMjAyNi0wNS0yNSAxMToyOCArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBIaSBKaWEs
Cj4gCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+IE9uIEZyaSwgTWF5IDE1LCAyMDI2IGF0
IDM6MTjigK9BTSBKaWEgV2FuZyB2aWEgQjQgUmVsYXkKPiA8ZGV2bnVsbCt3YW5namlhLnVsdHJh
cmlzYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gPiBGcm9tOiBKaWEgV2FuZyA8d2FuZ2pp
YUB1bHRyYXJpc2MuY29tPgo+ID4KPiA+IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgVWx0cmFSSVND
IERQMTAwMCBwaW5jdHJsIGNvbnRyb2xsZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlhIFdh
bmcgPHdhbmdqaWFAdWx0cmFyaXNjLmNvbT4KPiAKPiBQbGVhc2Ugd3JpdGUgYW4gZWxhYm9yYXRl
IGNvbW1pdCBtZXNzYWdlIHdpdGggc29tZSBkZXRhaWxzIGFib3V0Cj4gdGhlIGhhcmR3YXJlIGFu
ZCBpdCdzIGhpc3RvcnkgZXRjLgo+CgpUaGFua3MsIHdpbGwgZXhwYW5kIHRoZSBjb21taXQgbWVz
c2FnZSB3aXRoIG1vcmUgaGFyZHdhcmUgZGV0YWlscyBpbiB2Mi4KCj4gKC4uLikKPiAKPiA+ICtz
dHJ1Y3QgdXJfbGVnYWN5X3Byb3BfZGF0YSB7Cj4gPiArICAgICAgIHN0cnVjdCB1cl9waW5fdmFs
ICpwaW5fdmFsczsKPiA+ICsgICAgICAgdW5zaWduZWQgaW50ICpncm91cF9waW5zOwo+ID4gKyAg
ICAgICB1bnNpZ25lZCBpbnQgbnVtX3BpbnM7Cj4gPiArfTsKPiAKPiA+ICtzdGF0aWMgaW50IHVy
X2xlZ2FjeV9wYXJzZV9wcm9wKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcG5hbWUsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB1cl9sZWdhY3lfcHJvcF9kYXRh
ICpwcm9wKQo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICp1cl9sZWdhY3lfZ2V0X2Z1bmN0aW9uX25h
bWUoY29uc3Qgc3RydWN0IHVyX3BpbmN0cmxfbWF0Y2hfZGF0YSAqbWF0Y2hfZGF0YSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIG1vZGUpCj4g
PiArc3RhdGljIGludCB1cl9sZWdhY3lfY29uZl90b19jb25maWdzKHN0cnVjdCBwaW5jdHJsX2Rl
diAqcGN0bGRldiwgdTMyIGNvbmYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyAqKmNvbmZpZ3MsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpudW1fY29uZmlncykKPiA+ICtzdGF0aWMgaW50
IHVyX2xlZ2FjeV9hZGRfcGluY29uZl9tYXBzKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBpbmN0cmxf
bWFwICoqbWFwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgKnJlc2VydmVkX21hcHMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCAqbnVtX21hcHMsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB1cl9sZWdhY3lfcHJvcF9kYXRhICpwcm9w
KQo+ID4gK3N0YXRpYyBpbnQgdXJfbGVnYWN5X2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJs
X2RldiAqcGN0bGRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcGluY3RybF9tYXAgKiptYXAsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm51bV9tYXBzKQo+IAo+IFdoYXQncyB1cCB3aXRo
IGFsbCB0aGlzIGxlZ2FjeSBzdHVmZj8KPiAKPiBXaGF0IGlzIHRoaXMgYSBsZWdhY3kgb2Y/Cj4g
Cj4gSSB0aG91Z2h0IHRoaXMgd2FzIGEgKm5ldyogZHJpdmVyIHNvIGhvdyBjYW4gaXQgYmUgImxl
Z2FjeSI/Cj4gCgpUaGUgbGVnYWN5IHBhcnRzIHdpbGwgYmUgZHJvcHBlZCBpbiB2Mi4KCj4gPiAr
c3RhdGljIGludCB1cl9nZW5lcmljX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAq
cGN0bGRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wX2NvbmZpZywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcGluY3RybF9tYXAgKiptYXAsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpudW1fbWFwcykKPiA+ICt7Cj4gPiArICAg
ICAgIHJldHVybiBwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXAocGN0bGRldiwgbnBfY29u
ZmlnLCBtYXAsIG51bV9tYXBzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFBJTl9NQVBfVFlQRV9JTlZBTElEKTsKPiA+ICt9Cj4gCj4gSG0gSSB0aGlu
ayBDb25vciBoYXMgbmV3IGhlbHBlcnMgZm9yIHRoaXMgc28geW91IGRvbid0IG5lZWQgdG8gd3Jh
cAo+IGl0IGxpa2UgdGhpcy4KPiAKPiA+ICtzdGF0aWMgdm9pZCB1cl9kdF9mcmVlX21hcChzdHJ1
Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcGluY3RybF9tYXAgKm1hcCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBudW1fbWFwcykKPiA+ICt7Cj4gPiArICAgICAgIHBpbmN0cmxfdXRpbHNfZnJl
ZV9tYXAocGN0bGRldiwgbWFwLCBudW1fbWFwcyk7Cj4gPiArfQo+IAo+IENhbid0IHlvdSBqdXN0
IGFzc2lnbiBwaW5jdHJsX3V0aWxzX2ZyZWVfbWFwIGRpcmVjdGx5IHRvIHVyX3BpbmN0cmxfb3Bz
Pwo+IAoKQWdyZWVkLiBJJ3ZlIHJlbW92ZWQgYm90aCB3cmFwcGVycyBhbmQgc3dpdGNoZWQgdGhl
IGRyaXZlciB0byB1c2UgdGhlCmdlbmVyaWMgcGluY29uZiBEVCBoZWxwZXJzIGRpcmVjdGx5OiBw
aW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXBfYWxsCmZvciBtYXBwaW5nIGFuZCBwaW5jb25m
X2dlbmVyaWNfZHRfZnJlZV9tYXAgZm9yIGZyZWVpbmcgdGhlIG1hcHMuCgo+IFlvdXJzLAo+IExp
bnVzIFdhbGxlaWoKPiAKCkJlc3QgcmVnYXJkcywKSmlhIFdhbmcKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
