Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA84C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 06:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDZ2sPywcphH2uXwQWXAY9oXqBqp0bfPvsLNClANNQY=; b=mtcS302uU3aC77
	nilVu1TI65jsbZ1p07oTTvP8zapXhM2p401E9O2SfCyFNt5CgYNnRH3HFX5xQ4eE5wXCk4YjXfO17
	C4nvlNfvIHRGiulgA6IFiqoe46DfYAIn/3c/tkwiVsdQYUsbQNeYGKjkT9PzCIygrS1wcM0a3bgKX
	rlSR8HSlTsAY4+vHIZAK8kbIqOruwk7wTUumqF48qcAISBgayfiKCZrF4lt2Y4VA5Tbp8LVUL1XGr
	KjgAHm8aTjTBP9V3tOsg9WzPLHjyzMcsVqIAXxx+2BQi8dS1c6l88cfPLHaZmsGoF1qAqxwuTwhCH
	P31dIzy2iHdNT+dvT5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhtG-00000002t2H-3JY3;
	Mon, 08 Jul 2024 06:30:22 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhtE-00000002t0D-06hT
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 06:30:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F62F240009;
	Mon,  8 Jul 2024 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720420215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sdxky0F+LThwvrFQTzQMNsRMRU9pBlRvq7QUYvXBQk0=;
	b=JYGrp/jbfYx0cFgQcLI4vhKOzitq/Kar2e5x7kr2kjzP+1PTfRk0JAsIrQmLfvoIyuHo/v
	arrUu/cJVU2JDt3qBFk7QJgdicftvJL6UtOqaVNkM+DNCeRCwlRYNIQdILK1IZLUHrL57v
	86mQliPtjg9hO4N/uAITEtg2HUKW7kejkzJ837uqDwmahE0exeatkmx3TRgIJXuNKy5k9Y
	9+dzNubFPbkKLP8bfVOZPO1IgZCEb2xF+x87xQ2FCB1pGiz3qGpwIC1idGbRvFTkA7cKzr
	9KLF8sHa8Mn2QUSrAccoy4d0ZYwpHNmQfPO9tnOKmGlbua0qmqKNrvkW3h/1dw==
Date: Mon, 8 Jul 2024 08:30:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc:
 sophgo,cv18xx-saradc.yaml: Add Sophgo SARADC binding documentation
Message-ID: <20240708083011.058d0c57@xps-13>
In-Reply-To: <20240706-remote-undergo-3b9dfe44d16f@spud>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
	<20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
	<20240705-unaired-pesticide-4135eaa04212@spud>
	<6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
	<20240706-remote-undergo-3b9dfe44d16f@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_233020_219316_658694FB 
X-CRM114-Status: GOOD (  11.37  )
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

SGkgQ29ub3IsCgo+ID4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiA+ICsgIGNvbXBhdGlibGU6Cj4g
PiA+ID4gKyAgICBvbmVPZjoKPiA+ID4gPiArICAgICAgLSBpdGVtczoKPiA+ID4gPiArICAgICAg
ICAgIC0gZW51bToKPiA+ID4gPiArICAgICAgICAgICAgICAtIHNvcGhnbyxjdjE4MDBiLXNhcmFk
Ywo+ID4gPiA+ICsgICAgICAgICAgLSBjb25zdDogc29waGdvLGN2MTh4eC1zYXJhZGMgIAo+ID4g
PiAKPiA+ID4gSSBkb24ndCB0aGluayB0aGUgZmFsbGJhY2sgaGVyZSBtYWtlcyBzZW5zZS4gSWYg
dGhlcmUncyBvdGhlciBkZXZpY2VzCj4gPiA+IHdpdGggYSBjb21wYXRpYmxlIHByb2dyYW1taW5n
IG1vZGVsIGFkZGVkIGxhdGVyLCB3ZSBjYW4gZmFsbCBiYWNrIHRvIHRoZQo+ID4gPiBjdjE4MDBi
LgoKSSdtIHNvcnJ5IGJ1dCBpc24ndCB0aGlzIHNsaWdodGx5IGRpc2FncmVlaW5nIHdpdGggdGhl
ICJ3cml0aW5nCmJpbmRpbmdzIiBkb2MgcG9pbnRlZCBpbiB2MT8gSXQgc2F5cywKCiogRE8gdXNl
IGZhbGxiYWNrIGNvbXBhdGlibGVzIHdoZW4gZGV2aWNlcyBhcmUgdGhlIHNhbWUgYXMgb3IgYSBz
dWJzZXQKICBvZiBwcmlvciBpbXBsZW1lbnRhdGlvbnMuCgpJIGJlbGlldmUgd2UgZmFsbCBpbiB0
aGUgImRldmljZXMgYXJlIHRoZSBzYW1lIiBjYXRlZ29yeSwgc28gSSB3b3VsZApoYXZlIG15c2Vs
ZiB3cm90ZSBhIHNpbWlsYXIgYmluZGluZyBoZXJlIHdpdGggYSBjb21wYXRpYmxlIG1hdGNoaW5n
CnRoZW0gYWxsLCBwbHVzIGEgaGFyZHdhcmUtaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgY29tcGF0
aWJsZSBhcyB3ZWxsOwpqdXN0IGluIGNhc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
