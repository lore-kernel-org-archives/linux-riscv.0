Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DB9E7F150
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 01:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/36sIXbsc+Cn/SVvad/51d3W2rOtxeUACpTSn5zjUU=; b=tX8wrROrEXiUY0
	BfVMlIHSN/xLwKSXDt/PYL4XUq6s9uhp1+Jku95B5KwjgwUkw9bBq/PHlWeSeiJnAFqDGMkA7x4PA
	qvdlImu6BHgJjmmeVbj8s0dj9OVmH9TgbXJGZ/OP+BP7B9AloCCpAM8TRFi64XRCdE04SLfTVxQKM
	86KdZclGoKVSUCBPmADW3KgtN+ZIN92wrXEucPdnpny49n+2DiK39WAbIizgk+hCs7t+BkSy06gRQ
	egTDF3kICltKM+4R9h55sO3tPIWL1PswwLdKf65gp8H6hYEtZ5ZBdtYvqUFLbMJhvia9s3NzaOI0H
	OzGuJj5Nd2wghK64dkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlJIv-00HIhZ-1C;
	Wed, 27 Sep 2023 01:25:29 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlJIq-00HIgB-0H
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 01:25:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9AB9924E268;
	Wed, 27 Sep 2023 09:24:53 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 09:24:53 +0800
Received: from [192.168.125.107] (113.72.144.128) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 09:24:52 +0800
Message-ID: <ada7a449-cc23-84e2-0d7f-5b90c4f07ded@starfivetech.com>
Date: Wed, 27 Sep 2023 09:24:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for
 JH7110
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
CC: <ulf.hansson@linaro.org>, Conor Dooley <conor.dooley@microchip.com>,
	<arnd@arndb.de>, <jiajie.ho@starfivetech.com>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <robh@kernel.org>,
	<walker.chen@starfivetech.com>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <20230913-grumbly-rewrite-34c85539f2ed@spud>
 <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_182524_292212_684958D7 
X-CRM114-Status: UNSURE (   6.68  )
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

CgpPbiAyMDIzLzkvMjYgMTg6NTUsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBDb25v
ciwgQ2hhbmdodWFuZywKPiAKPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAzOjU44oCvUE0gQ29u
b3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4gRnJvbTogQ2hhbmdodWFuZyBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPgo+Pgo+PiBBZGQgcG93ZXIt
ZG9tYWluIGhlYWRlciBmb3IgSkg3MTEwIFNvQywgaXQgY2FuIHVzZSB0byBvcGVyYXRlIGRwaHkK
Pj4gcG93ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVh
bmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gs
IHdoaWNoIGlzIG5vdyBjb21taXQgNDFiNjZiNTRhNzJiZDc5Ngo+ICgiZHQtYmluZGluZ3M6IHBv
d2VyOiBBZGQgcG93ZXItZG9tYWluIGhlYWRlciBmb3IgSkg3MTEwIikKPiBpbiBwbWRvbWFpbi9u
ZXh0Lgo+IAoKSGkgR2VlcnQsCgpXaGVyZSBpcyB0aGUgd2Vic2l0ZSBsaW5rIGZvciB0aGUgcG1k
b21haW4vbmV4dD8KClRoYW5rcywKQ2hhbmdodWFuZwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
