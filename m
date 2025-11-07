Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D245CCFA1A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWMUXGJYa2cgbczsBMmJgVtkgzBWiZDgwByx2xWGgzs=; b=E4zpsvafl6U6oV
	kTzrX8zoIM68cQvzBAxD0E600b3IVArk///rvM0fMvy6HIzAcnqV2i5252MzmdlW0sZZOV6V0PukF
	h+Qd8qFhiohM4rgQasfOMnLBWsnQxdgfkZnIiqmaUR1GrvkW9ieB5Mtv7MHw6U6Sm7l2GZTkjfY5J
	+jXVuTNt+K3eK5DhV6QB5S8fWj+L1G0RFcuAMOD1roZ0Z4DFsxIdDgxNjmU9frffLhoa8oj7Eno0L
	hI+wGUHz8WwYU/BfktN0ryMbATJOzMEbAPHFok7gfjGqsJ4piiqctIOtNpo6K1a5dWyKnhSSjAB8E
	r7ysyjpNF76yeh40ixZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK13-0000000H8Yz-3MnQ;
	Fri, 07 Nov 2025 10:48:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK12-0000000H8Yo-2TpF
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uJIpvz54r9+bBx1+zoyx0bAXShY8Cm2KmRJ2PwBcENk=; b=kDlUvVlLJiHbWtxBdWrYz7792c
	4eIYjdlPxXPROwlIfhDJ8/zI0iOkwyY4LwNsmJuSudti6PyqX0nb4+ZPxNFyvUMIqVkD5sENIIcx8
	rhhtWGcsdjykSNnQ2Dh56T8FnnPA5W5rExUuH9MV2fCloC4BYjmeryUYy3idkgJfKblxmdSqaaAWe
	iZ2pIL6+tZliJZGym6sErCQWUM+KsUvcxJ3apPt6joPH421LeUgMb8lcnKgG5m7bqS8nM4uFt3AJ7
	JZ1SBhRyfS3TD7APs1rRJH6qpqYlFGvJbDMNLDWgSjD5o0o2Ok8/OUGSh+CkiqipTqDc1ycD2fvVw
	48qEUdjg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJ9I-00000006Dwe-1hvA
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 09:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762512501; x=1794048501;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RIICj4penxJBPxqBLKJ+4qUchgJuxa5RrSSLr9xnkn8=;
  b=WOv7q7ofWSurWkAsFkKJaL75nA/skYtTCw9GxvDFtdtFJXrUgO79Npkh
   qYTnKKOLTZwIansjKa6vBVh5hDT8N4h92y8tiQmEJxbFI17QWwHpDmGec
   T69y/tr3zbrHsONYoZImVkc/mZwtUjhvavEUUHiBFVOhzZ3RaJkRkrIVy
   Sci/saM8Cjmx061lT/1xmCeNUpCNd/CJngKmxhI2HdPIZgHRtaHjTKW5E
   COxBc8cQy3b12Ox8PI+xvzQSayE7Z+KiitkYrj2+/yFIplJdPnfGsCrjV
   17l8DSAajE+gbkH9bQ3xlir0jHAHvXF1RXjwsUWiaemwIj46bi2PQFkty
   A==;
X-CSE-ConnectionGUID: fJZAe2bYTL273syaeJeQIg==
X-CSE-MsgGUID: rkdU9O4ORaqK6SACPKG9Kg==
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="49326352"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 03:48:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 7 Nov 2025 03:47:52 -0700
Received: from [10.205.167.104] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 7 Nov 2025 03:47:50 -0700
Message-ID: <427e0f16-0055-47d8-981e-7bc91ad71bfc@microchip.com>
Date: Fri, 7 Nov 2025 10:52:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] spi: add support for microchip "soft" spi
 controller
To: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>
References: <20251105152823.730422-1-prajna.rajendrakumar@microchip.com>
 <20251105152823.730422-4-prajna.rajendrakumar@microchip.com>
 <aQt41uGfmbs7Qa7x@finisterre.sirena.org.uk>
 <20251106-cable-generic-819b798c7068@spud>
Content-Language: en-US
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
In-Reply-To: <20251106-cable-generic-819b798c7068@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095252_999486_8F1876AD 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

T24gMDYvMTEvMjAyNSAxNzo1MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFdlZCwgTm92IDA1
LCAyMDI1IGF0IDA0OjE4OjMwUE0gKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6Cj4+IE9uIFdlZCwg
Tm92IDA1LCAyMDI1IGF0IDAzOjI4OjIzUE0gKzAwMDAsIFByYWpuYSBSYWplbmRyYSBLdW1hciB3
cm90ZToKPj4KPj4+ICAgZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDkgKwo+
Pj4gICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4+PiAgIGRyaXZl
cnMvc3BpL3NwaS1taWNyb2NoaXAtY29yZS5jIHwgNDQyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0NTIgaW5zZXJ0aW9ucygrKQo+Pj4gK2Nv
bmZpZyBTUElfTUlDUk9DSElQX0NPUkUKPj4+ICsJdHJpc3RhdGUgIk1pY3JvY2hpcCBGUEdBIFNQ
SSBjb250cm9sbGVycyIKPj4+ICsJZGVwZW5kcyBvbiBTUElfTUFTVEVSCj4+IFJldXNpbmcgdGhl
IHNhbWUgZmlsZW5hbWUgYW5kIGNvbmZpZyBzeW1ib2wgaXMgYWxtb3N0IGNlcnRhaW5seSBnb2lu
ZyB0bwo+PiBjcmVhdGUgaXNzdWVzIGFuZCBjb25mdXNpb24gZm9yIHBlb3BsZSB1cGdyYWRpbmcg
dGhlaXIga2VybmVsIG9yIGRvaW5nCj4+IGJhY2twb3J0cy4gIFBlcmhhcHMgQ29yZVNQSSBpbnN0
ZWFkPwo+IFRoZSBxc3BpIGRyaXZlciAod2hpY2ggaXMgc2hhcmVkIGJldHdlZW4gU29DIGFuZCBG
UEdBIElQKSB1c2VzCj4gU1BJX01JQ1JPQ0hJUF9DT1JFX1FTUEksIHNvIHByb2JhYmx5IFNQSV9N
SUNST0NISVBfQ09SRV9TUEkgc2hvdWxkIGJlCj4gdXNlZCBoZXJlLiBQcmFqbmE/CgpIaSBNYXJr
LCBDb25vciwKClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJ4oCZbGwgdXBkYXRlIHRoZSBmaWxl
bmFtZSBhbmQgY29uZmlnIHN5bWJvbCB0byAKdXNlIFNQSV9NSUNST0NISVBfQ09SRV9TUEkgaW4g
dGhlIG5leHQgdmVyc2lvbi4KCkJlc3QgcmVnYXJkcywKUHJham5hCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
