Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCE8CD98E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cO+mH5aV2IUuQ+RrWrGeUHuPQLGnxWZP4AZbngsQCU=; b=x5Rz3qBEFFscbH
	n8dppUW58V9fQgtMXEt5bJqYJfais+AYWeFQ3Xfu/3AbHXxiBRXrza0ecYdaU2kG2zeS7oRdQbN4p
	kjmcn/2zx6HU6o+JjMAxBbxBKan0loZ25zSZNc3Nk7M8BOW7QxJQ7hYmfre7uWhdli8hbIvI9ecjl
	rTtdfBCWMYypQYqA1KKvAKccLj9ECrVsn7cmVOXCXD6jGYi7IL5hXl1j2JRizBoMffU9XF1GG8DEH
	zmj33dmiQ4JoUH16DJPcOSaRiv3nd131BVYcjg9uWFhy6u3vqLA9JaS7/KcCmVEEnx5M71bNL0RqA
	qKLXyllGkLVXOtXsAgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ44W-0000000E0oN-3TDU;
	Mon, 15 Jun 2026 09:57:36 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ44T-0000000E0nv-3wOY;
	Mon, 15 Jun 2026 09:57:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c4MJ0qLV8hTTEQqlirPS+MBb0jR5ayNJ62Pv7ajO1fw=;
	b=0RQMYBFxPBYzIaMEWnsmo6JDwMkRJG9Ut5a/GPr2uGbfDY3BSNxxhL1uK7tBWkAmbgwyAvGUD
	AvLrnWC/X/O32vMDUQGnyH6A387fl5Bibf1NUYmrmu52SXzqoqf54qlU/Vw/hTS5N5Ui0IAmJKe
	BHxG3wExIub0PYtWuW1iaas=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gf51f59YnzmV6m;
	Mon, 15 Jun 2026 17:49:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 42EE340571;
	Mon, 15 Jun 2026 17:57:25 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jun 2026 17:57:22 +0800
Message-ID: <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
Date: Mon, 15 Jun 2026 17:57:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
To: Michael Kelley <mhklinux@outlook.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>, "yeoreum.yun@arm.com"
	<yeoreum.yun@arm.com>, "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "kevin.brodsky@arm.com"
	<kevin.brodsky@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_025734_661544_4EC9D8F8 
X-CRM114-Status: GOOD (  12.65  )
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

CgpPbiA2LzEyLzIwMjYgMTE6NDUgUE0sIE1pY2hhZWwgS2VsbGV5IHdyb3RlOgo+IEZyb206IEpp
bmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEx
LCAyMDI2IDY6MzggQU0KPj4KPj4gU3VwcG9ydCBmb3IgcGFyYWxsZWwgc2Vjb25kYXJ5IENQVSBi
cmluZ3VwIGlzIGFscmVhZHkgdXRpbGl6ZWQgYnkgeDg2LAo+PiBNSVBTLCBhbmQgUklTQy1WLiBU
aGlzIHBhdGNoIGJyaW5ncyB0aGlzIGNhcGFiaWxpdHkgdG8gdGhlIGFybTY0Cj4+IGFyY2hpdGVj
dHVyZS4KPj4KPj4gUmV3b3JrIHRoZSBnbG9iYWwgYHNlY29uZGFyeV9kYXRhYCBhY2Nlc3NlZCBk
dXJpbmcgZWFybHkgYm9vdCBpbnRvCj4+IGEgcGVyLUNQVSBhcnJheS4gVGhpcyBhcnJheSBtYXBz
IGxvZ2ljYWwgQ1BVIElEcyB0byBNUElEUl9FTDEgdmFsdWVzLAo+PiBlbmFibGluZyB0aGUgZWFy
bHkgYm9vdCBjb2RlIGluIGhlYWQuUyB0byByZXNvbHZlIGVhY2ggc2Vjb25kYXJ5IENQVSdzCj4+
IGxvZ2ljYWwgSUQgY29uY3VycmVudGx5Lgo+Pgo+PiBUbyBmdWxseSBlbmFibGUgSE9UUExVR19Q
QVJBTExFTCwgdGhpcyBwYXRjaCBpbXBsZW1lbnRzOgo+PiAxKSBBbiBhcm02NC1zcGVjaWZpYyBh
cmNoX2NwdWhwX2tpY2tfYXBfYWxpdmUoKSBoYW5kbGVyLgo+PiAyKSBDYWxsYmFja3MgdG8gY3B1
aHBfYXBfc3luY19hbGl2ZSgpIGluc2lkZSBzZWNvbmRhcnlfc3RhcnRfa2VybmVsKCkuCj4+Cj4+
IFN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gUUVNVSBBUk02NCB2aXJ0IG1hY2hpbmUgKEtWTSBvbiwg
MTI4IHZDUFVzKS4KPj4KPj4gfCAgICAgdGVzdCBrZXJuZWwJICAgfCBzZWNvbmRhcnkgQ1BVcyBi
b290IHRpbWUgfAo+PiB8ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gICB8CS0tLS0tLS0tLS0tLS0t
LS0tLS0tICB8Cj4+IHwgICBXaXRob3V0IHRoaXMgcGF0Y2ggICAgIHwJCTE1NS42NzIJICAgICAg
fAo+PiB8ICAgY3B1aHAucGFyYWxsZWw9MAkgICB8CQk2Mi44OTcJICAgICAgfAo+PiB8ICAgY3B1
aHAucGFyYWxsZWw9MQkgICB8CQkxNjYuNzAzCSAgICAgIHwKPiAKPiBUaGUgbGFzdCB0d28gcm93
cyBzZWVtIG1peGVkIHVwLiBJIHdvdWxkIGV4cGVjdCBwYXJhbGxlbD0wIHRvCj4gcmVzdWx0IGlu
IGEgbG9uZ2VyIGJvb3QgdGltZS4KCldpdGhvdXQgdGhpcyBwYXRjaDoKCktWTSBldmVudCBzdGF0
aXN0aWNzICg2IGVudHJpZXMpCkV2ZW50IG5hbWUgICAgICAgU2FtcGxlcyAgICAgICBTYW1wbGUl
ICAgICBUaW1lIChucykgICAgICAgICBUaW1lJQpNZWFuIFRpbWUgKG5zKQogIERBQlRfTE9XICAg
ICAgICAzMjMxMTIgICAgICAgIDc1LjAwJSAgICAxNjY5MTQ4MDAwICAgICAgICAxNy4wMCUKNTE2
NQogICAgICAgV0Z4ICAgICAgICAgODU4MTcgICAgICAgIDE5LjAwJSAgICAgNzIzMjE1ODAwICAg
ICAgICAgNy4wMCUKODQyNwogICAgIFNZUzY0ICAgICAgICAgMTQ5MTQgICAgICAgICAzLjAwJSAg
ICAgNDE5OTM0NTMwICAgICAgICAgNC4wMCUKMjgxNTcKICAgICAgIElSUSAgICAgICAgICA1NjQz
ICAgICAgICAgMS4wMCUgICAgNjczMjQzOTI1MCAgICAgICAgNzAuMDAlCjExOTMwNjAKICAgICBI
VkM2NCAgICAgICAgICAgMjgyICAgICAgICAgMC4wMCUgICAgICAzNTU0Mzk3MCAgICAgICAgIDAu
MDAlCjEyNjA0MgogIElBQlRfTE9XICAgICAgICAgICAgIDEgICAgICAgICAwLjAwJSAgICAgICAg
ICA2MTMwICAgICAgICAgMC4wMCUKNjEzMAoKY3B1aHAucGFyYWxsZWw9MDoKCkV2ZW50IG5hbWUg
ICAgICAgU2FtcGxlcyAgICAgICBTYW1wbGUlICAgICBUaW1lIChucykgICAgICAgICBUaW1lJQpN
ZWFuIFRpbWUgKG5zKQogREFCVF9MT1cgICAgICAgIDMwODE3NSAgICAgICAgODAuMDAlICAgICA2
NDM2MjgwNTAgICAgICAgICA2LjAwJQoyMDg4CiAgICAgIFdGeCAgICAgICAgIDU1MjA4ICAgICAg
ICAxNC4wMCUgICAgIDI2MTkyNTI3MCAgICAgICAgIDIuMDAlCjQ3NDQKICAgIFNZUzY0ICAgICAg
ICAgMTQ5NzUgICAgICAgICAzLjAwJSAgICAgMTU1NzI3ODgwICAgICAgICAgMS4wMCUKMTAzOTkK
ICAgICAgSVJRICAgICAgICAgIDQ3NTUgICAgICAgICAxLjAwJSAgICA4NDk2MTYyMjEwICAgICAg
ICA4OC4wMCUKMTc4Njc4NAogICAgSFZDNjQgICAgICAgICAgIDI4MCAgICAgICAgIDAuMDAlICAg
ICAgMTk0Mjk5MDAgICAgICAgICAwLjAwJQo2OTM5MgogSUFCVF9MT1cgICAgICAgICAgICAgMSAg
ICAgICAgIDAuMDAlICAgICAgICAgIDU4NTAgICAgICAgICAwLjAwJQo1ODUwCgpjcHVocC5wYXJh
bGxlbD0xOgoKIEV2ZW50IG5hbWUgICAgICAgU2FtcGxlcyAgICAgICBTYW1wbGUlICAgICBUaW1l
IChucykgICAgICAgICBUaW1lJQpNZWFuIFRpbWUgKG5zKQogREFCVF9MT1cgICAgICAgIDMwNzky
MyAgICAgICAgNzcuMDAlICAgICA2OTI5NjUwNTAgICAgICAgICAyLjAwJQogICAgIDIyNTAKICAg
ICAgV0Z4ICAgICAgICAgNTk1NDkgICAgICAgIDE1LjAwJSAgICAgMjg3ODg4OTYwICAgICAgICAg
MC4wMCUKICAgICA0ODM0CiAgICBTWVM2NCAgICAgICAgIDE1MTI3ICAgICAgICAgMy4wMCUgICAg
IDMzNDM2NjIzMCAgICAgICAgIDEuMDAlCiAgICAyMjEwMwogICAgICBJUlEgICAgICAgICAxMjg2
MSAgICAgICAgIDMuMDAlICAgMjk3ODQwMDQ5NzAgICAgICAgIDk1LjAwJQogIDIzMTU4MzgKICAg
IEhWQzY0ICAgICAgICAgICAyODAgICAgICAgICAwLjAwJSAgICAgIDIxODY5OTQwICAgICAgICAg
MC4wMCUKICAgIDc4MTA2CiBJQUJUX0xPVyAgICAgICAgICAgICAxICAgICAgICAgMC4wMCUgICAg
ICAgICAgOTMyMCAgICAgICAgIDAuMDAlCiAgICAgOTMyMAoKLSBEZWZhdWx0IChubyBwYXRjaCk6
IFNsb3dlc3QgSFZDNjQgaGFuZGxpbmcgKDEyNuKAr868cyksIGhpZ2hlc3QgV0Z4IGNvdW50Cig4
NWspLCBhbmQgbW9zdCB0b3RhbCBWTeKAkWV4aXRzLgoKLSBjcHVocC5wYXJhbGxlbD0xOiBIVkM2
NCBsYXRlbmN5IGltcHJvdmVkIHRvIDc44oCvzrxzIChjbG9zZSB0bwpjcHVocC5wYXJhbGxlbD0w
KSwgYnV0IElSUSBleGl0cyBpbmNyZWFzZWQgZHJhbWF0aWNhbGx5ICgxMi45aywgMi43w5cKdGhh
dCBvZiBgY3B1aHAucGFyYWxsZWw9MGApLCBhY2NvdW50aW5nIGZvciA5NSUgb2YgZXZlbnQgdGlt
ZSBhbmQKYmVjb21pbmcgdGhlIG5ldyBib3R0bGVuZWNrLgoKLSBjcHVocC5wYXJhbGxlbD0wOiBG
YXN0ZXN0IEhWQzY0ICg2OeKAr868cyksIGxvd2VzdCBJUlEgZXhpdHMgKDQuOGspLCBhbmQKbG93
ZXN0IHRvdGFsIHNhbXBsZXMsIGRlbGl2ZXJpbmcgdGhlIGJlc3Qgb3ZlcmFsbCBib290IHBlcmZv
cm1hbmNlLgoKVGhlcmVmb3IsIGBjcHVocC5wYXJhbGxlbD0xYCByZWR1Y2VzIEhWQyBjb3N0IGJ1
dCBzdWZmZXJzIGZyb20gYSBtYXNzaXZlCmluY3JlYXNlIGluIElSUSBleGl0cywgd2hpbGUgYGNw
dWhwLnBhcmFsbGVsPTBgIGF2b2lkcyB0aGlzIGludGVycnVwdApzdG9ybSBhbmQgdGhlcmVmb3Jl
IHBlcmZvcm1zIGJlc3QgaW4gYSBLVk0gZ3Vlc3QuCgo+IAo+IE1pY2hhZWwKPiAKPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KPj4gLS0tCj4+
ICBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgIHwgIDEgKwo+PiAgYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9zbXAuaCB8ICA4ICsrKysrKysrCj4+ICBhcmNoL2FybTY0L2tlcm5lbC9oZWFkLlMg
ICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPj4gIGFyY2gvYXJtNjQva2VybmVsL3Nt
cC5jICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDQgZmlsZXMgY2hh
bmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+Pgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
