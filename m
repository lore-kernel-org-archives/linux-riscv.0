Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A023606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mcHks57b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZbvNsITI8vU5S1IFO79KJp5BEGsMaTAvjc4lxdTgL3s=; b=mcHks57b45fl2rdNdaJVekh3da
	3GwHF2pBvPUisorAFYS8MSx+qVrDt1VA4gWF0DwY5Oj6jZH+WQkdI/uMC9/jKRCT/mdN7ULNgVTDf
	b0GKrPjfv7K2DhI2SrcWUTMjp/88s4OMObBCIISascjBPIwpL//6CbobU0LFFLzm28ecEThTqAlDT
	iP0Mjc74UzJQYu4CiGNad5dfQziCQAMMqRAO6NkWlZokKB4lAg1znevNhfF2kWXiDBJ+fRUogCql7
	ZnevKdMwY7QXOHLHt5XdYVbsOetCOhj95HAGAkBbv7nEojOmGoKJeh1/tTWHX7+aT9u2QDnVLm0vy
	AYhFq3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9k6-00000009Oey-0tSf;
	Wed, 25 Nov 2026 09:56:46 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9k1-00000009OcC-0reO;
	Wed, 25 Nov 2026 09:56:44 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-05 (Coremail) with SMTP id zQCowAAHoLXNsAZr2kjpAQ--.1098S2;
	Wed, 25 Nov 2026 17:56:30 +0800 (CST)
Message-ID: <0caf6ab1187bc701815f4777e8f15697b61c9089.camel@iscas.ac.cn>
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
Date: Wed, 25 Nov 2026 17:56:29 +0800
In-Reply-To: <awXrnQVKZBXKsV2c@thelio>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
	 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
	 <awXrnQVKZBXKsV2c@thelio>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHoLXNsAZr2kjpAQ--.1098S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4DWr1DAFWxuFyDtF1kKrg_yoW5Gw45pa
	97GF45CF4ktF9Fga1fGF1UuFyFyw4IqFy5Wry3J34fZFyakryrXa9IqFW5ZFWqqr4rW34I
	q3WYqFy3CF1YyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07betCcUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015641_661523_DE1E4E76 
X-CRM114-Status: GOOD (  25.18  )
X-Spam-Score: -1.9 (-)
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
cmlnaHQ/CgpBaCwgeWVzLgoKPiAKPiA+ICtzdHJ1Y3QgdGgxNTIwX3VzYl9waHkgewo+ID4gKwlz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Owo+IAo+IEl0IHNlZW1zIHRoYXQgcGRldiBpcyBv
bmx5IGFzc2lnbmVkIGluIHRoMTUyMF91c2JfcGh5X3Byb2JlKCkgYW5kIG5ldmVyCj4gcmVhZC4g
SSB0aGluayBpdCBjYW4gYmUgZHJvcHBlZC4KPiAKPiBXaXRoIHRob3NlIGFkZHJlc3NlZDoKPiAK
PiBSZXZpZXdlZC1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+CgpUaGFua3Mg
Zm9yIHRoZSByZXZpZXcuCgo+IAo+IEJUVywgSSBzZWUgdGhhdCBJIG5ldmVyIGFwcGxpZWQgdGhl
IE1JU0MgY2xvY2sgcGF0Y2hlcyAoMSB0byAzKSBmcm9tIHRoZQo+IHYxIHNlcmllcyBbMV0gbGlr
ZSBJIHNhaWQgSSB3b3VsZC4gRG8geW91IHN0aWxsIHdhbnQgbWUgdG8gYXBwbHkgdGhlbT8KPiBJ
ZiBzbywgSSB3aWxsIGZpeCB1cCB0aGUgcGxhdGZvcm0gZGF0YSBjaGVjayBmb3IgdXNiX3N1c3Bl
bmRfZGl2X2NsayBpbgo+IHBhdGNoIDIgd2hlbiBhcHBseWluZy4KClBsZWFzZSBhcHBseSB0aGVt
LgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+IFRoYW5rcywKPiBEcmV3Cj4gCj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNjA1MDcwODE3MTAuNDA5MDgxNC0xLXpoZW5neGluZ2RhQGlz
Y2FzLmFjLmNuLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
