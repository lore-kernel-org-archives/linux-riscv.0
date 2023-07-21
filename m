Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A3EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkZBtA1m+/uRsay6U7QC2JlONqMPeOpvJFhnNRMpVz8=; b=lbkK8JfNKTLL0G
	nIUiRqb1BuSACNAggmvTWHXw9gouDKDsR8SaseIh0hS5kHpg4Pop4CsbxnKxekl3lLZumbzBhB2UV
	BR0DLYiPm9bBygAyUrhjdjvX9knNIuq3/nXusKDV02HATocTugqQU1rXVAhgy21TZKazAqu4ja0Zu
	8exrZAX2vJosYNRphuMJqy4JhR0+U2YVFvzNgD5Jzzaa/Z3C07QIEedzFnjwOMExcw6W9dKttEB6b
	0Fr9rnxufLKYgcTV05L+LBY4qQT9Oq1gWwcwD9ICKRuTgo6H9onnQWPN1N/FEXGNAH89/lmHgOq34
	PM/zbRJ4SO6AcJxiER1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmYS-00DYww-0j;
	Fri, 21 Jul 2023 09:36:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmYO-00DYuG-2P
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:36:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 43D8024DE03;
	Fri, 21 Jul 2023 17:35:36 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:35:36 +0800
Received: from [192.168.50.8] (172.16.6.8) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:35:09 +0800
Message-ID: <12dd5333-7b08-a458-2be6-59e62843a1b5@starfivetech.com>
Date: Fri, 21 Jul 2023 17:34:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/9] Refactoring Microchip PolarFire PCIe driver
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719152626.GA502469@bhelgaas>
 <52ebc991-0e73-8df4-61b2-32989ab4e62c@starfivetech.com>
 <20230720-unkempt-bath-9d320d55577c@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230720-unkempt-bath-9d320d55577c@wendy>
X-Originating-IP: [172.16.6.8]
X-ClientProxiedBy: EXCAS081.cuchost.com (172.16.6.41) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_023604_953960_A4D584E0 
X-CRM114-Status: GOOD (  11.30  )
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

CgpPbiAyMDIzLzcvMjAgMjA6MTIsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUaHUsIEp1bCAy
MCwgMjAyMyBhdCAxMDoxNTo1MUFNICswODAwLCBNaW5kYSBDaGVuIHdyb3RlOgo+PiBPbiAyMDIz
LzcvMTkgMjM6MjYsIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4+ID4gT24gV2VkLCBKdWwgMTksIDIw
MjMgYXQgMDY6MjA6NDhQTSArMDgwMCwgTWluZGEgQ2hlbiB3cm90ZToKPiAKPj4gPj4gVGhpcyBw
YXRjaHNldCBpcyBiYXNlIG9uIHY2LjUtcmMxCj4+ID4gCj4+ID4gRG9lc24ndCBxdWl0ZSBhcHBs
eSBjbGVhbmx5IGZvciBtZToKPj4gPiAKPj4gSSBhbSBzb3JyeSwgVGhlIGRyaXZlciBuZWVkIHN0
ZyBjbGsgYW5kIHN5c2NvbiBkcml2ZXIsIHdoaWNoIGFyZSBoYXZlJ3QgYmUgbWVyZ2UgdG8gbWFp
biBsaW5lLgo+PiBtYWlubHkgZHRzIGlzKHBhdGNoOSkgcmVqZWN0ZWQsIE11c3QgYXBwbHkgdGhp
cyBzZXJpZXMgcGF0Y2ggZmlyc3QuIChJIGZvcmdldCBhZGQgdGhpcyBsaW5rIGluIGNvdmVyIGxl
dHRlcikKPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2
L2NvdmVyLzIwMjMwNzEyMDkyMDA3LjMxMDEzLTEteGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20v
Cj4+IGFuZCB0aGlzIHN5c2NvbiBwYXRjaCAKPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMwNzE3MDIzMDQwLjc4ODYwLTcteGluZ3l1
Lnd1QHN0YXJmaXZldGVjaC5jb20vCj4gCj4gWW91IGNvdWxkIGRldGFjaCB0aGUgZHRzIHBhdGNo
IGZyb20gdGhlIHNlcmllcyAmIHNlbmQgaXQgaW5kZXBlbmRlbnRseSBvbmNlCj4gZXZlcnl0aGlu
ZyBpdCBkZXBlbmRzIG9uIGlzIGluIHBsYWNlLiBJJ20gZ29pbmcgdG8gcGljayB1cCBib3RoIG9m
IHRoZQo+IHBhdGNoZXMgeW91J3ZlIGxpbmtlZCBmb3IgdjYuNiBpbiB0aGUgbmV4dCBkYXkgb3Ig
dHdvLgpUaGFua3MgdmVyeSBtdWNoLiBZZXPvvIwgSSBoYXZlIGNvbnNpZGVyZWQgcmVtb3ZlIHRo
ZSBkdHMgcGF0Y2guIEJ1dCBJIHRoaW5rIHRoZSBtYWludGFpbmVycyBhbHNvCndpbGwgcmV2aWV3
IHRoZSBkdHMgZmlsZS4gU28gSSBhZGQgdGhpcy4uLi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
