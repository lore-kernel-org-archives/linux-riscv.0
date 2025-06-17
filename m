Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A6FC7115A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlkvBYMKB491I+JFBOifypNr0BpsNeW/jQzhULNp7c8=; b=GnmJbBfJrKRQS3
	WEAZZqEQVK3hAr7nBizWhDTvyJDl8F03LInqMZugcToUAhzt298Kvj3vO2s5obW6lxlEZIBCbcil5
	0OvpkX0HKa1Jrg08aE4jii/uzsY4M8uQZIxm1PLPrGvDBf+DqcKKtMal/1XnXwqkR86HHa7v3jW9p
	KCDk0HDX4sWlq0DxNXBc+8cHlmZnW/zIMfiADHnJWpSislf2SDTH+1V99lBPR+OVy2R030YamVCmI
	RM+fcf2F4L2jZZg2pVE53j6WyiJOPe5N7If0lLbAy7Jugxxtq03qjidL9r7pNonYrDPVIF9norCCP
	/SMXFRhWFkAlapPiHT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzv-00000006eAY-2Cyr;
	Tue, 17 Jun 2025 08:48:51 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzg-00000006e66-27kl
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 08:48:39 +0000
Received: from [192.168.33.151] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAAn2dfZK1FoBBEkBw--.8277S2;
	Tue, 17 Jun 2025 16:48:26 +0800 (CST)
Message-ID: <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
Date: Tue, 17 Jun 2025 16:48:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Vivian Wang <uwu@dram.page>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
X-CM-TRANSID: qwCowAAn2dfZK1FoBBEkBw--.8277S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4kCw13Kr1kWF1rZw15CFg_yoW8CF45pr
	Z3u3ZayFZrAF40gws29rZrWa4ruwn7Za15JFn5Gr1rAFZ8XFyagrWxJw1j9w1UXrZ5Xa47
	Xa1DZ3s7uF4UJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUy38nDUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_014836_908753_D1F9EB9D 
X-CRM114-Status: GOOD (  11.02  )
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

SGkgS3J6eXN6dG9mLAoKT24gNi8xNy8yNSAxNDoyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPiBPbiAxNy8wNi8yMDI1IDA3OjIxLCBWaXZpYW4gV2FuZyB3cm90ZToKPj4gVGhlIFNwYWNl
bWlUIEsxIGhhcyB2YXJpb3VzIHN0YXRpYyB0cmFuc2xhdGlvbnMgb2YgRE1BIGFjY2Vzc2VzLiBB
ZGQKPj4gdGhlc2UgYXMgc2ltcGxlLWJ1cyBub2Rlcy4gRGV2aWNlcyBhY3R1YWxseSB1c2luZyB0
aGVzZSB0cmFuc2xhdGlvbiB3aWxsCj4+IGJlIGFkZGVkIGluIGxhdGVyIHBhdGNoZXMuCj4+Cj4+
IFRoZSBidXMgbmFtZXMgYXJlIGFzc2lnbmVkIGFjY29yZGluZyB0byBjb25zZW5zdXMgd2l0aCBT
cGFjZW1pVCBbMV0uCj4KPiBSZWFkIHRoZSBmZWVkYmFjayB0aGVyZToKPgo+ICJTbywgYXMgeW91
IGFyZSBzdWJtaXR0aW5nIHRoZSBmaXJzdCBub2RlKHMpIHVuZGVyIG5ldHdvcmtfYnVzOiBidXNA
NSwgeW91Cj4gc2hvdWxkIGhhdmUgdGhpcyBhZGRlZCBpbnRvIHlvdXIgcGF0Y2hzZXQsIGluc3Rl
YWQgb2Ygc2VuZGluZyBvdXQgd2l0aAo+IG5vbmUuIgpBcyBtZW50aW9uZWQgaW4gdGhlIHBhdGNo
IGV4dHJhIG1lc3NhZ2UsIHRoaXMgaXMgYW4gUkZDIG1lYW50IGZvcgphY2hpZXZpbmcgY29uc2Vu
c3VzIG9uIHdoYXQgdGhlIGJ1cyBub2RlcyBzaG91bGQgbG9vayBsaWtlLCBub3QgYW4KYWN0dWFs
IHBhdGNoIG1lYW50IHRvIGJlIHRha2VuLiBJIHdhcyBob3BpbmcgSSB3YXMgY2xlYXIgb24gdGhh
dCwgYnV0IEkKZ3Vlc3MgdGhhdCBwYXJhZ3JhcGggd2FzIGJ1cmllZCB0b28gZGVlcC4gV2VsbC4u
Lgo+IFBsdXMgc2ltcGxlIGJ1cyB3aXRoaW4gTU1JTyBub2RlIG5lZWRzIHVuaXQgYWRkcmVzcy4g
SU9XLCBkb24ndCBtaXggTU1JTwo+IHdpdGggbm9uLU1NSU8uIEkgYWxzbyBzdXNwZWN0IHRoaXMg
ZG9lcyBub3QgcGFzcyBjaGVja3MsIHNvIHRoZSB0b29scwo+IGNhbiBkbyBvdXIgcmV2aWV3Li4u
CgpUaGlzIERUIHBhc3NlcyAibWFrZSBkdGJzX2NoZWNrIiBmaW5lLCB3aXRoIG9ubHkgdW5yZWxh
dGVkIHdhcm5pbmdzIG9uCnNlY191YXJ0MSB0aGF0IHdhcyBhbHJlYWR5IHRoZXJlIGJlZm9yZToK
CsKgIERUQyBbQ10gYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5k
dGIKLi4uL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRiOiBz
ZXJpYWxAZjA2MTIwMDAKKHNwYWNlbWl0LGsxLXVhcnQpOiAnY2xvY2stbmFtZXMnIGlzIGEgcmVx
dWlyZWQgcHJvcGVydHkKwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9zZXJpYWwvODI1MC55YW1sIwrCoCBEVEMgW0NdIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbWlsa3YtanVwaXRlci5kdGIKLi4uL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEtbWlsa3YtanVwaXRlci5kdGI6IHNlcmlhbEBmMDYxMjAwMAoo
c3BhY2VtaXQsazEtdWFydCk6ICdjbG9jay1uYW1lcycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQrC
oMKgwqDCoMKgwqDCoCBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL3NlcmlhbC84MjUwLnlhbWwjCgpUbyBiZSBob25lc3QsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aGF0ICJ3aXRoaW4gTU1JTyBub2RlIiBtZWFucyBoZXJlLgpTaG91bGQgdGhlIGJ1c2VzIGJlIHRh
a2VuIG91dCBvZiAvc29jIGFuZCBhZGRlZCBhcyBpdHMgc2libGluZ3M/CgpUaGFua3MsClZpdmlh
biAiZHJhbWZvcmV2ZXIiIFdhbmcKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
