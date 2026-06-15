Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49809CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCUb/SnPXk8DAOxYT0W96Q8kmaRxIKY0v3v9MRvAQIE=; b=CDAUs0KgcdpmNg
	Y3GuuCN44XEx6Zl8MCSZtnsaL8aQmTRtfbryTi3F0TcNAvdw5h0IHEUz9gEsDWWqalKRqJo75ZdAc
	6oEtess/ia6+Vcdze9oTI5FaqFdwD6teQ4t1BMdMo8oWZz+p8Fy2HJ8fd8gEEHEX+nKo8PHIU8xpJ
	tYoAK3ooLK19X9gNDkfjH8zA+8C+Nr/KS7E5lH54eCMe4IJCvXIW8rl4WzV1ua1auUFHMJIZM4jF/
	O8XD9ZGshZrCASeW9a+NMKaJetfeXq8QdW/D47wU7nXq+vnOFmle2LPMLaiu8LsRPJp4/Ueof8Ujs
	qULRLHEco55l6UEEVPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ336-0000000Dudt-0xw1;
	Mon, 15 Jun 2026 08:52:04 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ332-0000000Duag-1Sfd;
	Mon, 15 Jun 2026 08:52:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+06dmrtJLnZdbs87rF1+ux5dsEP9LjcZvNfLN8dlHk4=;
	b=kZyP2QYInrYpJQGT8hI5P+hzIwOXSNn8KJm9IS3ZYsPNJNgOq6PHW0HqyEuMjHqjtILV0h5xR
	r4MxUI+Vo26dHexDRGEwgNHCBbrelR7D98by6DQq07Z1T+R8iajyTTcGvtBDTO3IGBAQ7OdfI0/
	rCKwnClmHHwWxOuokS4VOTg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gf3Yz0m9lzpSw0;
	Mon, 15 Jun 2026 16:43:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E3A940571;
	Mon, 15 Jun 2026 16:51:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jun 2026 16:51:48 +0800
Message-ID: <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
Date: Mon, 15 Jun 2026 16:51:48 +0800
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_015201_071288_1469ECA4 
X-CRM114-Status: GOOD (  15.92  )
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
IGEgbG9uZ2VyIGJvb3QgdGltZS4KCkhpLCBNaWNoYWVsLAoKVGhlIHJlc3VsdHMgYXJlIGNvcnJl
Y3QgYW5kIG5vdCBtaXhlZCB1cC4KCkNvbXBhcmVkIHRvIHRoZSBvcmlnaW5hbCBub27igJFIT1RQ
TFVHX1BBUkFMTEVMIGFwcHJvYWNoLCB0aGUgYWR2YW50YWdlIG9mCmNwdWhwLnBhcmFsbGVsPTAg
bGllcyBpbiBpdHMgdXNlIG9mIGNwdV9yZWxheChgeWllbGRgIG9uIGFybTY0KSBpbnN0ZWFkCm9m
IHRoZSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBtZWNoYW5pc20gKHdoaWNoIG1heSBj
YXVzZSBzbGVlcAphbmQgY29udGV4dCBzd2l0Y2hpbmcpLiBUaGlzIHNpZ25pZmljYW50bHkgcmVk
dWNlcyB0aGUgb3ZlcmhlYWQgb2YgVk0KZXhpdHMgYW5kIGNvbnRleHQgc3dpdGNoZXMgaW4gYSBL
Vk0gZ3Vlc3QsIHRoZXJlYnkgY3V0dGluZyB0aGUgc2Vjb25kYXJ5CkNQVSBib290IHRpbWUgYnkg
bW9yZSB0aGFuIGhhbGYuCgpSZWdhcmRpbmcgY3B1aHAucGFyYWxsZWw9MSwgSSBiZWxpZXZlIHRo
ZSByZWFzb24gaXQgZmFpbHMgdG8gb3B0aW1pemUKYm9vdCB0aW1lIGlzIHRoYXQgd2hlbiBhIGxh
cmdlIG51bWJlciBvZiBDUFVzIGlzc3VlIHRoZSBLSUNLX0FQIGNhbGwKc2ltdWx0YW5lb3VzbHks
IGl0IHJlc3VsdHMgaW4gc2V2ZXJlIGxvY2sgY29udGVudGlvbiB3aXRoaW4gS1ZNLCB3aGljaApw
YXJhZG94aWNhbGx5IHNsb3dzIGRvd24gc2Vjb25kYXJ5IENQVSBicmluZ3VwLiBIb3dldmVyLCB0
aGlzIG5lZWRzCmZ1cnRoZXIgaW52ZXN0aWdhdGlvbiBpbnRvIHRoZSBQU0NJX0NQVV9PTiBjb2Rl
IGluIEtWTS4KCkknbSB0ZXN0aW5nIHRoZXNlIHBlcmZvcm1hbmNlIGFzcGVjdHMgb24gcGh5c2lj
YWwgaGFyZHdhcmUsIHNvIHRoZQpyZXN1bHRzIG1pZ2h0IGJlIHNvbWV3aGF0IGRpZmZlcmVudCBi
ZWNhdXNlIHNlY29uZGFyeSBDUFUgYnJpbmd1cApyZXF1aXJlcyB0cmFwcGluZyBpbnRvIHRoZSBB
VEYgZmlybXdhcmUuCgpCZXN0IHJlZ2FyZHMsCkppbmppZQoKPiAKPiBNaWNoYWVsCj4gCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Cj4+IC0t
LQo+PiAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICB8ICAxICsKPj4gIGFyY2gvYXJtNjQv
aW5jbHVkZS9hc20vc21wLmggfCAgOCArKysrKysrKwo+PiAgYXJjaC9hcm02NC9rZXJuZWwvaGVh
ZC5TICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4+ICBhcmNoL2FybTY0L2tlcm5l
bC9zbXAuYyAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICA0IGZpbGVz
IGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKPj4KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
