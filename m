Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74555C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpty4W/Sto7vqCBCFxC/AjRLCJSWJ09tZ6ZgleY2TWk=; b=P3G3uU14p00KQg
	5VbvMzlkpdTTYYQxeJ3pkOLifozL4DnE8cOqDfF83qBlKdPDcJwUH9ZMAd2sK6G/dvVUzEM3LmNE1
	xZ5g+3mLAjud4VORqMnBe2g685cr4GMxVTYHtbqL4MRU+phJcclT1NbQeC0jMN5DvclOMa+vYlsoM
	MthxxJNDERpmfQjLK62HOPNh+5lnwpobe6ld9GIwBApaDw0CxR49E+Fl1ktFebtgWacEc7zNqtxBW
	u148f30NnkwYfaPAyeG0nzRjLY7Knz7mE8XhV1QlWua2oD53oc3o0ZrHBnlZUA44YTkj+IpoTUx4A
	XXJJJPW05oybath4ZqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCmf-006epf-1J;
	Tue, 25 Jul 2023 07:48:41 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCmW-006el1-2U
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:48:36 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 23DF824DBCE;
	Tue, 25 Jul 2023 15:48:00 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 15:48:00 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 15:47:58 +0800
Message-ID: <fd30b319-f537-54f7-2651-1a20ca5f484c@starfivetech.com>
Date: Tue, 25 Jul 2023 15:47:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [-next v1 1/1] riscv: dts: starfive: visionfive 2: Add v1.3B gmac
 phy configuration
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Conor Dooley" <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
References: <20230725073039.14382-1-samin.guo@starfivetech.com>
 <20230725073039.14382-2-samin.guo@starfivetech.com>
 <20230725-rental-struck-d49a18d1c382@wendy>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230725-rental-struck-d49a18d1c382@wendy>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_004832_972399_F8E08A83 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy83LzI1IDE1OjQ0OjA2LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBK
dWwgMjUsIDIwMjMgYXQgMDM6MzA6MzlQTSArMDgwMCwgU2FtaW4gR3VvIHdyb3RlOgo+PiBBZGQg
dmlzaW9uZml2ZSAyIHYxLjNCIGdtYWMgcGh5IGNvbmZpZ3VyYXRpb24sIGluY2x1ZGluZyBkcml2
ZSBzdHJlbmd0aAo+PiBhbmQgaW52ZXJ0aW5nIGNvbmZpZ3VyYXRpb24uCj4+Cj4+IFJldmlld2Vk
LWJ5OiBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogU2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPiAKPiBJIG9wdGVkIHRv
IHNxdWFzaCB0aGlzIChhbmQgbXkgdGVtcG9yYXJ5IHJldmVydCB0aGF0IGJlY29tZXMgYSBOT1Ap
IGludG8KPiB0aGUgb3JpZ2luYWwgcGF0Y2guIEl0IHNob3VsZCBhcHBlYXIgaW4gbGludXgtbmV4
dCB0b21vcnJvdyBhcyAwMTA0MzQwYTY3YjEKPiAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiB2aXNp
b25maXZlIDI6IEFkZCBjb25maWd1cmF0aW9uIG9mIGdtYWMgYW5kIHBoeSIpLgo+IAo+IFRoYW5r
cywKPiBDb25vci4KClRoYW5rIHlvdSBzbyBtdWNoIQoKQmVzdCByZWdhcmRzLApTYW1pbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
