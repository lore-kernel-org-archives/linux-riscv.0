Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07515C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFnaKBpv4Et+aS7w8hFrP6vs3HQBQUDcBuJE/BvTcXg=; b=Q2W0i7ukNGsbaE
	BiPwI1JDg2J9kTsJ2T711civPcIhUGrDgQahI5el93gVk7mjw2b6/k/qfs0mGbJKRHAP2NTCtWl/T
	MryLWAj78uyD9AB3Vq8WIqYMV7mr9CT87Ag4Ve3nfmxP5kC9uDraKqnO5wftQnKslVtc3BTj3hUgu
	mw/as136XP5Ol8JWFMnME2goUn9btVhlgej3N4V000oSvgtFBPvppMHvhaBPlenwJpX29Sl8/CAku
	TklOibFr3sCirUGI3txlWiO94Syyk7VOxCf97zCWd/Kmo4gyTstrGB2q8TQA3fgLRetri+c0gSdNd
	mio9OCmxmSy9607TnQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIev-0000000Df8Q-0SuG;
	Thu, 19 Jun 2025 17:02:41 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSG10-0000000DGL7-3MqA
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 14:13:21 +0000
Received: from [192.168.0.110] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowACH2VHxGlRoB2WXBw--.1804S2;
	Thu, 19 Jun 2025 22:13:07 +0800 (CST)
Message-ID: <b73c0d8e-9869-469e-a46a-ddec9328885e@iscas.ac.cn>
Date: Thu, 19 Jun 2025 22:13:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
 <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
 <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
X-CM-TRANSID: rQCowACH2VHxGlRoB2WXBw--.1804S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xw1xtryfJrWkGF4rtF1UZFb_yoW8Jr1fpF
	4av3sIkwn5JFW8Zr4Durn7X3WFgF48Xa47Jr15Xr43Z34DWa129Fs2ka1Yvay8Xr95GF12
	9w4qqryvkFyDZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jgPEfUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_071319_213397_E26F19BB 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNi8xOS8yNSAyMToyMywgQWxleCBFbGRlciB3cm90ZToKPiBPbiA2LzE5LzI1IDE6MTUgQU0s
IFZpdmlhbiBXYW5nIHdyb3RlOgo+PiBBbHNvLCBjb25zaWRlciBuYW1pbmcgdGhpcyBjb25zaXN0
ZW50bHk6ICJzcGFjZW1pdC1wMSIsIG9yCj4+ICJzcGFjZW1pdC1wMS1yZWd1bGF0b3IiPwo+Cj4g
TGV0IG1lIHNlZSBpZiBJIHVuZGVyc3RhbmQgeW91ciBjb21tZW50LCBieSBleHBsYWluaW5nIHRo
ZQo+IG5hbWluZyBJIHVzZWQuCj4KPiBUaGUgUE1JQyBkcml2ZXIgY291bGQgc3VwcG9ydCBhIGRp
ZmZlcmVudCBQTUlDLsKgIEl0cyBPRgo+IG1hdGNoIHRhYmxlIHNwZWNpZmllcyBhIGNvbXBhdGli
bGUgc3RyaW5nIHdpdGggbWF0Y2hpbmcKPiBkYXRhLCBhbmQgdGhlIGRhdGEgZGVzY3JpYmVzIGF0
dHJpYnV0ZXMgb2YgdGhlIFAxIFBNSUMuCj4gU28gdGhhdCBkcml2ZXIgdXNlcyBNT0RfTkFNRSAi
c3BhY2VtaXQtcG1pYyIuCj4KPiBUaGlzIGRyaXZlciBkZXNjcmliZXMgc3BlY2lmaWNhbGx5IHRo
ZSByZWd1bGF0b3JzIGZvdW5kCj4gaW4gdGhlIFAxIFBNSUMsIHNvIGl0IHVzZXMgInNwYWNlbWl0
LXAxLXJlZ3VsYXRvciIgYXMKPiBpdHMgTU9EX05BTUUuCj4KPiBZb3UgbWlnaHQgc3RpbGwgYmUg
cmlnaHQ7IGJ1dCBkb2VzIHRoaXMgY2hhbmdlIHdoYXQgeW91Cj4gYXJlIHN1Z2dlc3Rpbmc/CgpP
aCBzb3JyeSBpdCB3YXMgc2ltcGxlciB0aGFuIHRoYXQuIEl0J3MganVzdCBJJ3ZlIG5vdGVkIHRo
YXQgdGhpcyAKcmVndWxhdG9yIG1vZHVsZSBmaWxlIGlzIGNhbGxlZCAic3BhY2VtaXQtcDEiOgoK
PiArb2JqLSQoQ09ORklHX1JFR1VMQVRPUl9TUEFDRU1JVF9QMSkgKz0gc3BhY2VtaXQtcDEubwoK
Li4uIGJ1dCB0aGUgTU9EX05BTUUgaXMgInNwYWNlbWl0LXAxLXJlZ3VsYXRvciIsIGFuZCBJIHdh
cyB3b25kZXJpbmcgaWYgCml0IG1hZGUgc2Vuc2UgdG8gcmVuYW1lIHRoZSBtb2R1bGUgdG8gYWxz
byAic3BhY2VtaXQtcDEtcmVndWxhdG9yIi4gSW4gCmFkZGl0aW9uIHRvIGNvbnNpc3RlbmN5LCBt
b2R1bGVzIGFyZSBmcmVlIHRvIGhhdmUgYWxsIHNvcnRzIG9mIG5hbWVzIGluIApMaW51eCwgYnV0
IHRoZSBuYW1lcyBoYXZlIHRvIGJlIHVuaXF1ZSwgc28gaWYgdGhpcyBpcyBvbmx5IHRoZSByZWd1
bGF0b3IgCmRyaXZlciBwYXJ0LCB0aGUgbmFtZSBzaG91bGQgcmVmbGVjdCB0aGF0LgoKVml2aWFu
ICJkcmFtZm9yZXZlciIgV2FuZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
