Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B4606A33C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jUynaIKr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kb/cyTf0bT4MBAc5t+6Ga/jF4I/5/p31grqQQ8RuobU=; b=jUynaIKrfoGojzgxqt5HGBSF96
	rzMCzYIWJM5i+xcQ9lesg08lzle4MaErfDJWTq+tjxdOsg1IwgnExOHkqU0p331xWT1FOb0QGnZx1
	EI0Lrg+cXKqXJbNjn7WZ5ISj/fVbjNPSbhDcgv6CYcZvavdK8V6r180zo4q0O+cDxHNfCqrIytgEM
	ny8PjofgfOevzezbJgf2Meyw9pm3vEceRjTa5nCgbvBACBB0glnntFI3LlTHX9DdwmiC357i3uW7C
	nO74tleL6KktzRu2v5p7jJ1JIDFYf1TUSQMWDoIA7NywxJWuJPEIplYPcZVu5jyINswhgrXwIyF7u
	D4N7Ax/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVrX-0000000CZlO-419t;
	Thu, 26 Nov 2026 09:33:55 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVrU-0000000CZjf-15AU;
	Thu, 26 Nov 2026 09:33:55 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowABXZ5j7_Adr5R_XAQ--.11314S2;
	Thu, 26 Nov 2026 17:33:48 +0800 (CST)
Message-ID: <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Manivannan Sadhasivam	 <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Wei
 Fu <wefu@redhat.com>, Drew Fustini	 <dfustini@tenstorrent.com>,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Han Gao
 <rabenda.cn@gmail.com>
Date: Thu, 26 Nov 2026 17:33:47 +0800
In-Reply-To: <awXrnQVKZBXKsV2c@thelio>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
	 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
	 <awXrnQVKZBXKsV2c@thelio>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXZ5j7_Adr5R_XAQ--.11314S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4DWr1DAFWxuFyDtF1kKrg_yoW5XF4kpa
	yfGr43CF4kJFZFga1fGr15CFyFyw4xXFy5Gry3J34fZF9IkryrXa9IqFZ8ZFWqqr4rW3yI
	qF1YqFy3CF1Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013352_697508_285FEFBE 
X-CRM114-Status: GOOD (  25.35  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMjTkuoznmoQgMTE6NTUgLTA4MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAwNDoxNDo0NFBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhlIFVTQiBQSFkgb24gVC1IZWFkIFRIMTUyMCBTb0MgaXMgYSBTeW5vcHN5
cyBVU0IgMy4wIEZlbXRvUEhZLCB3aXRoCj4gPiBzb21lIFBIWSBwYXJhbWV0ZXJzIGV4cG9ydGVk
IGFzIGFub3RoZXIgc3lzdGVtIGNvbnRyb2xsZXIgYWxvbmcgd2l0aCBpdC4KPiA+IAo+ID4gQSBm
ZXcgUEhZIHBhcmFtZXRlcnMgaGF2ZSB1bnVzYWJsZSBkZWZhdWx0cy4gQWRkIGEgZHJpdmVyIHRo
YXQgcHJvZ3JhbXMKPiA+IHRoZW0gYmVmb3JlIHJlbGVhc2luZyB0aGUgUEhZIGZyb20gcmVzZXQg
aW4gYWRkaXRpb24gdG8KPiA+IGNsb2NrL3Jlc2V0L3JlZ3VsYXRvciBtYW5hZ2VtZW50Lgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5j
bj4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+IC0gTWFrZSBleGl0IGNhbGxiYWNrIGFs
d2F5cyBzdWNjZXNzIHRvIHByZXZlbnQgUEhZIHN0YXRlIG1hY2hpbmUgZGVzeW5jCj4gPiAgIHdp
dGggY2xrL3JzdCBzdGF0ZSBhcyBzdWdnZXN0ZWQgYnkgU2FzaGlrby4KPiA+IC0gUmUtd3JhcCBz
b21lIGNvbW1lbnRzIHRhcmdldHRpbmcgZnVsbCA4MCBjb2x1bW5zLgo+ID4gLSBVc2UgZGV2X2Vy
cl9wcm9iZSBmb3IgUEhZIGNyZWF0aW9uIGVycm9yIGhhbmRsaW5nLCB0byBwcmV2ZW50IHNwYW1t
aW5nCj4gPiAgIHRoZSBrZXJuZWwgbG9nIHdpdGggLUVQUk9CRV9ERUZFUi4KPiA+IENoYW5nZXMg
aW4gdjM6Cj4gPiAtIFVzZSBmc2xlZXAoKSB0byByZXBsYWNlIHVkZWxheSgpLCBhbmQgYWRkIHBy
b3BlciBpbmNsdXNpb24gb2YKPiA+ICAgbGludXgvZGVsYXkuaCBmb3IgdGhpcyBmdW5jdGlvbi4g
KGZzbGVlcCgpIHN1Z2dlc3RlZCBieSBEcmV3IGFuZAo+ID4gICBpbmNsdXNpb24gc3VnZ2VzdGVk
IGJ5IFNhc2hpa28pCj4gPiAtIEFkYXB0IERyZXcncyBzdWdnZXN0aW9uIG9uIHRoZSB3b3JkaW5n
IG9mIHRoZSBjb21taXQgbWVzc2FnZSdzIDJuZAo+ID4gICBwYXJhZ3JhcGguCj4gPiBDaGFuZ2Vz
IGluIHYyOgo+ID4gLSBSZW1vdmVkIHVucmVmZXJlbmNlZCByZWdpc3RlciBuYW1lcy4KPiA+IC0g
Q2hhbmdlZCB0aGUgYmVoYXZpb3IgdG8gbGVhdmluZyBidXMgY2xvY2sgb24gaW5zdGVhZCBvZiBi
aW5kaW5nIGl0IHRvCj4gPiAgIHRoZSByZWdtYXAuCj4gPiAtIFJlbW92ZWQgZWFybHkgcmV0dXJu
IGZvciByZXNldCBkZWFzc2VydCBmYWlsdXJlIGluIHBoeSBleGl0IGNhbGxiYWNrLgo+ID4gLSBU
d2Vha2VkIHRoZSBLY29uZmlnIGl0ZW0gKHJlbW92ZWQgZGVmYXVsdCB2YWx1ZSBhbmQgYWRkZWQg
InNlbGVjdAo+ID4gICBSRUdNQVBfTU1JTykuCj4gPiAKPiA+ICBkcml2ZXJzL3BoeS9LY29uZmln
ICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3BoeS9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3BoeS90aGVhZC9LY29uZmlnICAgICAgICAgIHwg
IDEyICsrCj4gPiAgZHJpdmVycy9waHkvdGhlYWQvTWFrZWZpbGUgICAgICAgICB8ICAgMiArCj4g
PiAgZHJpdmVycy9waHkvdGhlYWQvcGh5LXRoMTUyMC11c2IuYyB8IDE3OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTk1IGluc2VydGlvbnMoKykK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waHkvdGhlYWQvS2NvbmZpZwo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9NYWtlZmlsZQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9waHktdGgxNTIwLXVzYi5jCj4gCj4gU29ycnkg
Zm9yIHRoZSBkZWxheSBpbiByZXZpZXcuIEkgdGhpbmsgYmluZGluZyBhbmQgZHJpdmVyIGRpciBz
aG91bGQgYmUKPiBhZGRlZCB1bmRlciB0aGVhZCBzb2Mgc3VwcG9ydCBpbiBNQUlOVEFJTkVSUywg
cmlnaHQ/CgpJIGFtIGFkZGluZyBpdCwgYnV0IG1heWJlIGl0J2QgYmUgd29ydGggdG8gYWRkIGEg
TjogY2xhdXNlIGludG8gdGhlCk1BSU5UQUlORVJTIGZpbGU/CgpBbHRob3VnaCB0aGlzIHdvdWxk
bid0IGJlbG9uZyB0byB0aGlzIHBhdGNoc2V0LgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+ID4gK3N0
cnVjdCB0aDE1MjBfdXNiX3BoeSB7Cj4gPiArCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7
Cj4gCj4gSXQgc2VlbXMgdGhhdCBwZGV2IGlzIG9ubHkgYXNzaWduZWQgaW4gdGgxNTIwX3VzYl9w
aHlfcHJvYmUoKSBhbmQgbmV2ZXIKPiByZWFkLiBJIHRoaW5rIGl0IGNhbiBiZSBkcm9wcGVkLgo+
IAo+IFdpdGggdGhvc2UgYWRkcmVzc2VkOgo+IAo+IFJldmlld2VkLWJ5OiBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4KPiAKPiBCVFcsIEkgc2VlIHRoYXQgSSBuZXZlciBhcHBsaWVk
IHRoZSBNSVNDIGNsb2NrIHBhdGNoZXMgKDEgdG8gMykgZnJvbSB0aGUKPiB2MSBzZXJpZXMgWzFd
IGxpa2UgSSBzYWlkIEkgd291bGQuIERvIHlvdSBzdGlsbCB3YW50IG1lIHRvIGFwcGx5IHRoZW0/
Cj4gSWYgc28sIEkgd2lsbCBmaXggdXAgdGhlIHBsYXRmb3JtIGRhdGEgY2hlY2sgZm9yIHVzYl9z
dXNwZW5kX2Rpdl9jbGsgaW4KPiBwYXRjaCAyIHdoZW4gYXBwbHlpbmcuCj4gCj4gVGhhbmtzLAo+
IERyZXcKPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDUwNzA4MTcxMC40
MDkwODE0LTEtemhlbmd4aW5nZGFAaXNjYXMuYWMuY24vCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
