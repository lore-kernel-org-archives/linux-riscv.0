Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E546D606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0BKKHS7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dund0MGZXCSEckTk0GRNv987g8itxGAVbsFiQkt6ehU=; b=S0BKKHS7SnU1T30oQfD94Iyd2M
	53O1Zvr38zzbM2Cf1D6fcKqOkdQWDfHsqOWh0xv3vpxzbJnUY05fst+cExZQK1SLG/PUqifWoLAYA
	gypLiE52j0kdZ98qgVQzgx4KReT6cKgyrhFNSlh8cmRq6NED71R1jOrajyruzJOfKAsQStXYprnq2
	Yv4VqoJ/mSVQ3Kx0R0LLspxCdFEqNP7aRQltb+fq5zob0BywmlIKwQTKOp9DAQoq/secFUJcVGiMc
	fnQRGcRBX1r5humzGrs96RH/H2KG8yNJrUip6WCRCoRBpXFfTBAVvBI4bPO61mEmk3nQI3C2sMktM
	VcmMlQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTfn-00000003V3A-0xIj;
	Mon, 23 Nov 2026 13:01:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTfa-00000003UwU-0k18;
	Mon, 23 Nov 2026 13:01:20 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowAB3Zf8VOQRrtNSJAQ--.29336S2;
	Mon, 23 Nov 2026 21:01:11 +0800 (CST)
Message-ID: <6041ed36835d0c1c34ea590e79a2130a4352e5eb.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Manivannan Sadhasivam	 <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Wei
 Fu <wefu@redhat.com>, Drew Fustini	 <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Han Gao
	 <rabenda.cn@gmail.com>
Date: Mon, 23 Nov 2026 21:01:09 +0800
In-Reply-To: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3Zf8VOQRrtNSJAQ--.29336S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF48Xr1xtr4rWr18Jw18Zrb_yoWfCrcE93
	W8urW7AayDAas5GFWUAr1xXryUtF4aqFykJF1SqFy5Zrn3AryYv348u3W3W3WDGr45GF1k
	A34rZFW8Ar9rKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8fpnPUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_050118_637271_99956B03 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMDPkuoznmoQgMTY6MTQgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77ya
Cj4gVGhpcyBwYXRjaHNldCBpcyBzcGxpdCBmcm9tIHRoZSAiQWRkIFRIMTUyMCBVU0Igc3VwcG9y
dCIgcGF0Y2hzZXQsCj4gd2l0aCBvbmx5IHRoZSBQSFkgYmluZGluZy9kcml2ZXIgcGFydC4KPiAK
PiBJY2Vub3d5IFpoZW5nICgyKToKPiAgIGR0LWJpbmRpbmdzOiBwaHk6IGFkZCBiaW5kaW5nIGZv
ciBULUhlYWQgVEgxNTIwIFVTQiBQSFkKPiAgIHBoeTogYWRkIGEgZHJpdmVyIGZvciBULUhlYWQg
VEgxNTIwIFVTQiBQSFkKCkdlbnRseSBwaW5nIGZvciBzb21lIHJldmlldy4KClRoYW5rcywKSWNl
bm93eQoKPiAKPiAgLi4uL2JpbmRpbmdzL3BoeS90aGVhZCx0aDE1MjAtdXNiLXBoeS55YW1sICAg
IHwgIDc1ICsrKysrKysrCj4gIGRyaXZlcnMvcGh5L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvcGh5L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvcGh5L3RoZWFkL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICB8ICAxMiArKwo+ICBkcml2ZXJzL3BoeS90aGVhZC9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL3BoeS90aGVhZC9waHktdGgxNTIwLXVzYi5jICAg
ICAgICAgICAgfCAxNzkgKysrKysrKysrKysrKysrKysrCj4gIDYgZmlsZXMgY2hhbmdlZCwgMjcw
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvdGhlYWQsdGgxNTIwLXVzYi1waHkueWFtbAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9waHkvdGhlYWQvS2NvbmZpZwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9waHkvdGhlYWQvTWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
cGh5L3RoZWFkL3BoeS10aDE1MjAtdXNiLmMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
