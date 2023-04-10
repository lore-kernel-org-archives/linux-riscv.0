Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137CDC76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2jyZmK/+VEANpFZweEmBaTYZX5+uH5K2H4Xf+a94yI=; b=2BqqBjVsVcz9rS
	Kl/lXLBDJftyIcnwPwY+vnu66zeZioZL5NLrsSPJRvMFRtp+oYL5fYtf0HZ50HLhd9FyBooIGKJtp
	P6sqTUbPsKuYfpIgPY+9KEGk9UbMmm/WNpFvp9G7XFLBcG0NkzPGEXPWtKScTeFEyu1OZRsQAcP61
	zhBPE6KAFxBgpHoqcTtu4vDrBb5qlbO30ihez6e4sr2PuCk5HSy24Rbf2AXWkAvivRx09TSAIArAS
	v1sn620zCpLR62VJ8zfh6eeYSNgRnsPmNYbPKnvX446x3ZVhYbRrgL5PK2lVb2zKr1CjPwoT38Qyn
	CQdWqzDfiJS2P7tNN7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plqan-00FDfN-0p;
	Mon, 10 Apr 2023 12:25:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plqai-00FDeE-3B;
	Mon, 10 Apr 2023 12:25:50 +0000
Received: from [192.168.1.90] (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B83666015EC;
	Mon, 10 Apr 2023 13:25:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681129544;
	bh=/RVh0dF7TlKpEKSukKX6XhJ5f7HG7CyPyfJnYGJ2eq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n8Ma5Eku/5McQqNsu8IwFYxw9KnoVuC23Rj6LAtvNIsToqBsfeh0EUFCd/RWqEnwQ
	 i4qJQCTKRp1n6d/poomD2CDLmPg1CyS5APgoZYLfXybo50KhK47D7fUdEotp1WwIxn
	 Qfl++XOIdVvDwXxTV6YTO6/TBGuYdkbYWYtpqTuD1KWIrByMgUz1i1bHhotfQR+jDX
	 ZlWYpAr8oi8u6eUSd5j6H/g+mVk82Ujm4ESzZjwnyLO8vHX5xB6/LWSf5hMcXG3CLl
	 tc0pcpRzfS1C1oGS7iXJpQK+p8n3vHZU1wILmBTNtcfkLgYB0H/k+C2ue2DXRq0tMZ
	 PY9Eus4cb4YFw==
Message-ID: <b6c315f7-cc14-4506-6102-e52413848f81@collabora.com>
Date: Mon, 10 Apr 2023 15:25:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 06/10] riscv: dts: allwinner: d1: Switch dma-names
 order for snps,dw-apb-uart nodes
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-7-cristian.ciocaltea@collabora.com>
 <1945003.usQuhbGJ8B@jernej-laptop>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <1945003.usQuhbGJ8B@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_052549_260719_F3C01559 
X-CRM114-Status: GOOD (  12.80  )
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

T24gNC84LzIzIDE1OjM2LCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gRG5lIHRvcmVrLCAyMS4g
bWFyZWMgMjAyMyBvYiAyMjo1NjoyMCBDRVNUIGplIENyaXN0aWFuIENpb2NhbHRlYSBuYXBpc2Fs
KGEpOgo+PiBDb21taXQgMzcwZjY5NmU0NDc0ICgiZHQtYmluZGluZ3M6IHNlcmlhbDogc25wcy1k
dy1hcGItdWFydDogYWRkIGRtYSAmCj4+IGRtYS1uYW1lcyBwcm9wZXJ0aWVzIikgZG9jdW1lbnRl
ZCBkbWEtbmFtZXMgcHJvcGVydHkgdG8gaGFuZGxlIEFsbHdpbm5lcgo+PiBEMSBkdGJzX2NoZWNr
IHdhcm5pbmdzLCBidXQgcmVsaWVzIG9uIHRoZSByeC0+dHggb3JkZXJpbmcsIHdoaWNoIGlzIHRo
ZQo+PiByZXZlcnNlIG9mIHdoYXQgYSBidW5jaCBvZiBkaWZmZXJlbnQgYm9hcmRzIGV4cGVjdC4K
Pj4KPj4gVGhlIGluaXRpYWwgcHJvcG9zZWQgc29sdXRpb24gd2FzIHRvIGFsbG93IGEgZmxleGli
bGUgZG1hLW5hbWVzIG9yZGVyIGluCj4+IHRoZSBiaW5kaW5nLCBkdWUgdG8gcG90ZW50aWFsIEFC
SSBicmVha2FnZSBjb25jZXJucyBhZnRlciBmaXhpbmcgdGhlIERUUwo+PiBmaWxlcy4gQnV0IGx1
Y2tpbHkgdGhlIEFsbHdpbm5lciBib2FyZHMgYXJlIG5vdCBhZmZlY3RlZCwgc2luY2UgdGhleSBh
cmUKPj4gdXNpbmcgYSBzaGFyZWQgRE1BIGNoYW5uZWwgZm9yIHJ4IGFuZCB0eC4KPj4KPj4gSGVu
Y2UsIHRoZSBmaXJzdCBzdGVwIGluIGZpeGluZyB0aGUgaW5jb25zaXN0ZW5jeSB3YXMgdG8gY2hh
bmdlCj4+IGRtYS1uYW1lcyBvcmRlciBpbiB0aGUgYmluZGluZyB0byB0eC0+cnguCj4+Cj4+IERv
IHRoZSBzYW1lIGZvciB0aGUgc25wcyxkdy1hcGItdWFydCBub2RlcyBpbiB0aGUgRFRTIGZpbGUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENyaXN0aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2Fs
dGVhQGNvbGxhYm9yYS5jb20+Cj4gCj4gQXBwbGllZCBwYXRjaGVzIDItNiwgdGhhbmtzIQoKSGkg
SmVybmVqLAoKUGxlYXNlIG5vdGUgdGhlIHBhdGNoZXMgaGF2ZSBiZWVuIGFscmVhZHkgcGlja2Vk
IGJ5IEdyZWcgYW5kIHdlcmUgbWVyZ2VkCmluIG5leHQtMjAyMzAzMzEuCgpSZWdhcmRzLApDcmlz
dGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
