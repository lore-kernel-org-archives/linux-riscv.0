Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DCFC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ccdp+xcz/xJxN0+YrRteKVxNZZ7opbLzRMTo9UZEuGI=; b=fmARFNqcSCBNQK
	DphCxs4nSYJ0kwexMv+3+QZkMdBgknHVtDJXC9zDa6wrC/DQG3iZvUNAV9R8Ff67lzsecb0mtWcKH
	HIjbssmGtgB9hl6XyHPXOf2YMQKETLNKVL7tTG0b7biX57TLTLUU4HYMXfgm1xPosnqr6WxETh5wy
	MlRv74GPzVRg3t8YP/J4qscgq9a/kNb2q0fa+ZQphIYgEuJ0ihVnaf38Kfw3dbalwlb1ERo6YfUdG
	JXocmGCH1Oy/GrawMYzFSG+3zV649IRREADPfhvba4GgDSRU/fapnk0Eqo6oq5hCMYk44e6yeSuwa
	yruT4Gre67NxNZ++cOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4znR-00CNcL-OG; Tue, 13 Dec 2022 07:33:49 +0000
Received: from mail-m11880.qiye.163.com ([115.236.118.80])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4znN-00CNFY-Em
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 07:33:47 +0000
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by mail-m11880.qiye.163.com (Hmail) with ESMTPA id E0491201C6;
	Tue, 13 Dec 2022 15:33:34 +0800 (CST)
Message-ID: <cd4639e4-b0e4-3141-5b9f-1a7bd14cb799@rock-chips.com>
Date: Tue, 13 Dec 2022 15:33:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Cc: shawn.lin@rock-chips.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/3] mmc: starfive: Add sdio/emmc driver support
Content-Language: en-GB
To: William Qiu <william.qiu@starfivetech.com>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-3-william.qiu@starfivetech.com>
 <faea4932-add6-fc51-836d-b113e8c9a194@rock-chips.com>
 <26e9c3eb-aaeb-8cbd-dda0-20f28331dbeb@starfivetech.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <26e9c3eb-aaeb-8cbd-dda0-20f28331dbeb@starfivetech.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR0eVh5DGUlMTR4aTUxIGVUTARMWGhIXJB
	QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MEk6EQw*DD0jOE0rIzoZQjAt
	NTkKCzJVSlVKTUxLQkpNQ0pOTU9CVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlDSkM3Bg++
X-HM-Tid: 0a850a67395a2eb6kusne0491201c6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_233345_656966_143EE26C 
X-CRM114-Status: GOOD (  11.01  )
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

SGkKCk9uIDIwMjIvMTIvMTMgMTU6MjEsIFdpbGxpYW0gUWl1IHdyb3RlOgo+IAo+IAo+IE9uIDIw
MjIvMTIvMTMgMTA6MjQsIFNoYXduIExpbiB3cm90ZToKPj4gSGkKPgo+PiB1c2UgIi5jb21tb25f
Y2FwcyA9IE1NQ19DQVBfQ01EMjMiIGluc3RlYWQuCj4+Cj4gCj4gSGkgU2hhd24sCj4gCj4gVGhh
bmsgeW91IGZvciB0YWtpbmcgdGltZSB0byByZXZpZXcuCj4gVGhlIC5jb21tb25fY2FwcyBpcyBu
b3QgZGVmaW5lZCBpbiBkd19tY2lfZHJ2X2RhdGEuCj4gQW5kIC5udW1fY2FwcyBpcyBhbHNvIHVz
ZWQgaW4gZHdfbWNpLXJvY2tjaGlwLmMuCj4gCgpUaGF0IG1lYW5zIHlvdXIgcGF0Y2ggaXMgYmFz
ZWQgb24gb2xkIHVwc3RyZWFtIGtlcm5lbCB3aGljaCBoYXNuJ3QKYmVlbiB1cGRhdGVkIGZvciBh
dCBsZWFzdCBvbmUgeWVhci46KQoKPiBCZXN0IHJlZ2FyZHMsCj4gV2lsbGlhbSBRaXUKPj4+ICvC
oMKgwqAgLnNldF9pb3MgPSBkd19tY2lfc3RhcmZpdmVfc2V0X2lvcywKPj4+ICvCoMKgwqAgLnBh
cnNlX2R0ID0gZHdfbWNpX3N0YXJmaXZlX3BhcnNlX2R0LAo+Pj4gK8KgwqDCoCAuZXhlY3V0ZV90
dW5pbmcgPSBkd19tY2lfc3RhcmZpdmVfZXhlY3V0ZV90dW5pbmcsCj4+PiArfTsKPj4+ICsKPj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd19tY2lfc3RhcmZpdmVfbWF0Y2hb
XSA9IHsKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
