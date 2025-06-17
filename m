Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E3AC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmeF3EkcBVDg9Y1UBmYwYdh+VmHQVIrIffThRaxiMn4=; b=gP99nTHmEq0DTZ
	fPq8iXNzV1IqHuRH/YQs1CDuzzV9qqwOWj0dh34yji0qz2be9GJYj80U0sXKhSMu/IQ9j0HAB+61R
	EPUHMrvFWSD7/KaGeDtaHmIzRQ81mXPEfeZE3IQb4d+nzXrEJtWSreCSrAKhu/v6o82BUTGccBTbR
	8zehVJx3nRFmiRTSRfkTnK4m30nkwpOUMKmOiHXS2VVdlstBpUrEKDtDogKHsnWXOSFpqTp4iVU5K
	yNYgriSjNUdoOGLlU9RNTeOXEFN6v/sagi/m3DbtyUm0J8/3wIdRWoegQ48t2fy2OpvhzeNdWlEaK
	BIab3iX38azA2pll4NLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTSm-00000006tuJ-44uB;
	Tue, 17 Jun 2025 10:22:44 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTHR-00000006sYz-0HJj
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 10:11:03 +0000
Received: from [192.168.33.151] (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowACnvFQoP1FokJcgBw--.2075S2;
	Tue, 17 Jun 2025 18:10:50 +0800 (CST)
Message-ID: <fd9b3bbc-3318-4845-90ca-7f245049665e@iscas.ac.cn>
Date: Tue, 17 Jun 2025 18:10:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
 <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
 <2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org>
X-CM-TRANSID: rQCowACnvFQoP1FokJcgBw--.2075S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfKrWrJFyDJrW3Xw15twb_yoW5GFy7pF
	Z3GF9akFZ2yFyxWrs2vrnrW340yws7Z3W5Jrs5GryrAFZ8WFySgrs7tw1Y934UXr4rJay7
	ZF4UZ3s7uF45ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUb8hL5UUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_031101_492755_060023C0 
X-CRM114-Status: GOOD (  11.19  )
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

T24gNi8xNy8yNSAxNzozNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxNy8wNi8y
MDI1IDEwOjQ4LCBWaXZpYW4gV2FuZyB3cm90ZToKPj4gSGkgS3J6eXN6dG9mLAo+Pgo+PiBPbiA2
LzE3LzI1IDE0OjIxLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4gT24gMTcvMDYvMjAy
NSAwNzoyMSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+Pj4gVGhlIFNwYWNlbWlUIEsxIGhhcyB2YXJp
b3VzIHN0YXRpYyB0cmFuc2xhdGlvbnMgb2YgRE1BIGFjY2Vzc2VzLiBBZGQKPj4+PiB0aGVzZSBh
cyBzaW1wbGUtYnVzIG5vZGVzLiBEZXZpY2VzIGFjdHVhbGx5IHVzaW5nIHRoZXNlIHRyYW5zbGF0
aW9uIHdpbGwKPj4+PiBiZSBhZGRlZCBpbiBsYXRlciBwYXRjaGVzLgo+Pj4+Cj4+Pj4gVGhlIGJ1
cyBuYW1lcyBhcmUgYXNzaWduZWQgYWNjb3JkaW5nIHRvIGNvbnNlbnN1cyB3aXRoIFNwYWNlbWlU
IFsxXS4KPj4+IFJlYWQgdGhlIGZlZWRiYWNrIHRoZXJlOgo+Pj4KPj4+ICJTbywgYXMgeW91IGFy
ZSBzdWJtaXR0aW5nIHRoZSBmaXJzdCBub2RlKHMpIHVuZGVyIG5ldHdvcmtfYnVzOiBidXNANSwg
eW91Cj4+PiBzaG91bGQgaGF2ZSB0aGlzIGFkZGVkIGludG8geW91ciBwYXRjaHNldCwgaW5zdGVh
ZCBvZiBzZW5kaW5nIG91dCB3aXRoCj4+PiBub25lLiIKPj4gQXMgbWVudGlvbmVkIGluIHRoZSBw
YXRjaCBleHRyYSBtZXNzYWdlLCB0aGlzIGlzIGFuIFJGQyBtZWFudCBmb3IKPj4gYWNoaWV2aW5n
IGNvbnNlbnN1cyBvbiB3aGF0IHRoZSBidXMgbm9kZXMgc2hvdWxkIGxvb2sgbGlrZSwgbm90IGFu
Cj4+IGFjdHVhbCBwYXRjaCBtZWFudCB0byBiZSB0YWtlbi4gSSB3YXMgaG9waW5nIEkgd2FzIGNs
ZWFyIG9uIHRoYXQsIGJ1dCBJCj4+IGd1ZXNzIHRoYXQgcGFyYWdyYXBoIHdhcyBidXJpZWQgdG9v
IGRlZXAuIFdlbGwuLi4KPj4+IFBsdXMgc2ltcGxlIGJ1cyB3aXRoaW4gTU1JTyBub2RlIG5lZWRz
IHVuaXQgYWRkcmVzcy4gSU9XLCBkb24ndCBtaXggTU1JTwo+Pj4gd2l0aCBub24tTU1JTy4gSSBh
bHNvIHN1c3BlY3QgdGhpcyBkb2VzIG5vdCBwYXNzIGNoZWNrcywgc28gdGhlIHRvb2xzCj4+PiBj
YW4gZG8gb3VyIHJldmlldy4uLgo+PiBUaGlzIERUIHBhc3NlcyAibWFrZSBkdGJzX2NoZWNrIiBm
aW5lLCB3aXRoIG9ubHkgdW5yZWxhdGVkIHdhcm5pbmdzIG9uCj4+IHNlY191YXJ0MSB0aGF0IHdh
cyBhbHJlYWR5IHRoZXJlIGJlZm9yZToKPj4KPj4gwqAgRFRDIFtDXSBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0Ygo+PiAuLi4vYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdGI6IHNlcmlhbEBmMDYxMjAwMAo+PiAoc3BhY2Vt
aXQsazEtdWFydCk6ICdjbG9jay1uYW1lcycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+PiDCoMKg
wqDCoMKgwqDCoCBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L3NlcmlhbC84MjUwLnlhbWwjCj4+IMKgIERUQyBbQ10gYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1taWxrdi1qdXBpdGVyLmR0Ygo+PiAuLi4vYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1taWxrdi1qdXBpdGVyLmR0Yjogc2VyaWFsQGYwNjEyMDAwCj4+IChzcGFjZW1pdCxr
MS11YXJ0KTogJ2Nsb2NrLW5hbWVzJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4+IMKgwqDCoMKg
wqDCoMKgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc2Vy
aWFsLzgyNTAueWFtbCMKPj4KPj4gVG8gYmUgaG9uZXN0LCBJIGRvbid0IHVuZGVyc3RhbmQgd2hh
dCAid2l0aGluIE1NSU8gbm9kZSIgbWVhbnMgaGVyZS4KPj4gU2hvdWxkIHRoZSBidXNlcyBiZSB0
YWtlbiBvdXQgb2YgL3NvYyBhbmQgYWRkZWQgYXMgaXRzIHNpYmxpbmdzPwo+IFRoZXNlIGxvb2tz
IGxpa2UgY2hpbGRyZW4gb2Ygc2ltcGxlLWJ1cy4gSWYgdGhhdCdzIHJpZ2h0OiBjaGlsZHJlbiBv
Zgo+IHNpbXBsZS1idXMgYXJlIHN1cHBvc2VkIHRvIGhhdmUgdW5pdCBhZGRyZXNzZXMgKHNlZSBh
bHNvIHNpbXBsZS1idXMgaW4KPiB0aGUgRFQgc2NoZW1hKS4KClRoZSBoaXN0b3J5IG9mIHRoZSBz
aW1wbGUtYnVzLnlhbWwgYmluZGluZ3MgZmlsZSBzdWdnZXN0cyB0aGF0IGEKc2ltcGxlLWJ1cyB3
aXRoIGVtcHR5IHJhbmdlcyBhbmQgbm8gdW5pdCBhZGRyZXNzIGFzIGEgY2hpbGQgb2YgYSBwYXJl
bnQKc2ltcGxlLWJ1c8KgaXMgaW50ZW50aW9uYWxseSBhbGxvd2VkIFsxXS4gVGhlIGNvbW1pdCBt
ZXNzYWdlIGFsc28Kc3VnZ2VzdHMgdGhhdCBldmVuIGluIG9sZGVyIHZlcnNpb25zIG9mIHRoZSBz
YW1lIGZpbGUgaXQgd2FzIG5vdCB0aGUKaW50ZW50aW9uIHRvIGRpc2FsbG93IHN1Y2ggbmVzdGVk
IGJ1c2VzLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1h
L2NvbW1pdC9lZDkxOTBkMjBmMTQ2ZDEzZTI2MmNjOTEzODUwNjMyNmY3ZDRkYTkxCgpSZWdhcmRz
LApWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
