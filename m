Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F8606A324
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1bSxO079;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=JcY10bMX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VFBwaE4XkiKe24cUPUz7wveqdffTEtUSydIdHiw085k=; b=1bSxO079j4keT31c2uHRzPXrOS
	nVrTgN309Cz54JmO/a3KxTu+P8rRqAKbu6WdIYoHv/2lBvDFVi3xuK7dw7p95VLkbV4roIlnmHGQO
	YD39SkPI+mUdw8XAzZrzGm0vPFaI0bWPx/aqN6UNFr5pcUDxjQtCcBKFw4vWbg+0ZJj0AE5D5ukw4
	jcr6WS41hkhkQ3Xyy6A6NsYyT3YcuPp4k/lmfcAVafaNPCP5yl7oLq6ZDKJgavyPdYK5bEqfgBWhU
	YZFPAxRfF2g05xPjPyy1f5F8DaC9Jisl5B7OFdpw0k63vptROVnIp3lPBLiKDoZPBOguwL3z/2KQX
	uuS1ziFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhal-00000004wyf-2208;
	Tue, 27 Oct 2026 13:51:55 +0000
Received: from mail-m49231.qiye.163.com ([45.254.49.231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhah-00000004wxA-12XL;
	Tue, 27 Oct 2026 13:51:53 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528682039;
	Tue, 27 Oct 2026 20:36:42 +0800 (GMT+08:00)
Message-ID: <311338f7-ae03-47b9-96fe-1ec2b2851c7b@rock-chips.com>
Date: Tue, 27 Oct 2026 20:36:41 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/16] PCI: dwc: rockchip: Use cached PCIe capability
 offset
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 jingoohan1@gmail.com
References: <20261027122827.2725643-1-18255117159@163.com>
 <20261027122827.2725643-7-18255117159@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261027122827.2725643-7-18255117159@163.com>
X-HM-Tid: 0aa17d5ce66c03a4kunm8cbf4897570f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGktJVk9ISU0eTR5CHUIeHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JcY10bMX5VWFSTKD/G7A+Y8NZJqvgD8AMt+1D9jMkiqr+9Jj2ehRz18pkYtHT8ZunL5eUiWUhHwAdDix7KG3Iz5rowwLyFwISqEK7Ufpz8TkQo2jzcOTYLFdc41EbsaxeluNB0tsf/s/ByM6UAVG153ph24+T3bO3XlJYxZOroY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=CiGmRdlkoViId5TfscHFKflRSN2mgmPjTQiT6qBmjg0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_065151_790093_CCBAEDB1 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTAvMjcg5pif5pyf5LqMIDIwOjI4LCBIYW5zIFpoYW5nIOWGmemBkzoKPiByb2Nr
Y2hpcF9wY2llX2VuYWJsZV9sMHMoKSBpcyBjYWxsZWQgZnJvbSByb2NrY2hpcF9wY2llX2hvc3Rf
aW5pdCgpLAo+IGkuZS4gZnJvbSB0aGUgLmluaXQgY2FsbGJhY2ssIHdoaWNoIHJ1bnMgYWZ0ZXIg
dGhlIGNvbnRyb2xsZXIgY2xvY2tzIGFuZAo+IHJlc2V0cyBoYXZlIGJlZW4gZW5hYmxlZC4gUmVw
bGFjZSB0aGUgY2FwYWJpbGl0eSBzZWFyY2ggd2l0aAo+IGR3X3BjaWVfZ2V0X3BjaWVfY2FwKCks
IHdoaWNoIHJlYWRzIGFuZCBjYWNoZXMgdGhlIG9mZnNldCBhdCB0aGlzIHZlcnkKPiBwb2ludC4K
PiAKClJldmlld2VkLWJ5OiBTaGF3biBMaW4gPHNoYXduLmxpbkByb2NrLWNoaXBzLmNvbT4KCj4g
U2lnbmVkLW9mZi1ieTogSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4KPiAtLS0KPiAg
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKPiBpbmRleCBhZjI2
YTA3YzBjOWUuLjc1MzYwNjE5Mzg1NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKPiBAQCAtMzczLDcgKzM3Myw3IEBAIHN0YXRpYyB2b2lk
IHJvY2tjaGlwX3BjaWVfZW5hYmxlX2wwcyhzdHJ1Y3QgZHdfcGNpZSAqcGNpKQo+ICAgCXUzMiBj
YXAsIGxua2NhcDsKPiAgIAo+ICAgCS8qIEVuYWJsZSBMMFMgY2FwYWJpbGl0eSBmb3IgYWxsIFNv
Q3MgKi8KPiAtCWNhcCA9IGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9JRF9F
WFApOwo+ICsJY2FwID0gZHdfcGNpZV9nZXRfcGNpZV9jYXAocGNpKTsKPiAgIAlpZiAoY2FwKSB7
Cj4gICAJCWxua2NhcCA9IGR3X3BjaWVfcmVhZGxfZGJpKHBjaSwgY2FwICsgUENJX0VYUF9MTktD
QVApOwo+ICAgCQlsbmtjYXAgfD0gUENJX0VYUF9MTktDQVBfQVNQTV9MMFM7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
