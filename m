Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B2CD5BD5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT9UhWTAxCgAw7L1j3CyorzQNZfP1YkEwFLvvgrfeKw=; b=IZDDuaLA0dXLIl
	eVxYEMOlpjQV6AEwHcHBnxRIgXCMaF/xiAQZbagOdtuCRsK9E20KPNBfIMGbG0p96zwUqV10LthVF
	y4kBgHkUK+tlQc9uMZx+qAsgHzXzH+PIJ9UODe1w5PW7Hh+GjYJDRE21MgW2h7imGekPDSKRChCev
	hbH/7n31nsXy2LaJNMHOPqoCDax4MxSXvpRbWohBg1zpFvvslO9WtF7GfNSKLKYNImaAudPnYpYh1
	fzEuEWBKK09GIeMhdGPrZ3fzTJOY+ctcHHiHlRQ9X/jPZFMPu0CbJlKFLIVrTyqsR37oLjdfu51oc
	mjBHFOTg/ND7tkFtB6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVLC-00000005HL1-2IWC;
	Thu, 28 May 2026 07:39:42 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVL9-00000005HJx-1hSk;
	Thu, 28 May 2026 07:39:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=u5ZL+hZHbV/pTWWeaWLQdg762ZQtOkbcULKixMOn0bQ=;
	b=1WB2GNzIiq2qfSiouaY2eBpNlTCp9CXSIQnP/DR+JRdUP9LOzMG39nBxhaSnx3i1EvTkk0koF
	MP95rV5mkYXdTAj5/1AL8Fatw2aQLMSIwUnEOl/84G4vPpz+9p58t8kHNA5P7Gcj6jk63HEJBED
	bJc80/B28puWomV5/AKUkWE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gQyq556rjzcb23;
	Thu, 28 May 2026 15:31:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 13B044056A;
	Thu, 28 May 2026 15:39:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 May 2026 15:39:28 +0800
Message-ID: <8aaa1d2e-09cc-4d58-b90e-1869d1bf55b2@huawei.com>
Date: Thu, 28 May 2026 15:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Mike Rapoport <rppt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <ardb@kernel.org>,
	<masahiroy@kernel.org>, <mark.rutland@arm.com>, <maz@kernel.org>,
	<james.morse@arm.com>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <kas@kernel.org>,
	<debug@rivosinc.com>, <namcao@linutronix.de>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <seanjc@google.com>, <guoren@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
 <ahQ0WRiMsB011tym@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ahQ0WRiMsB011tym@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_003940_521672_9DDD9D16 
X-CRM114-Status: UNSURE (   9.85  )
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

CgpPbiA1LzI1LzIwMjYgNzozNiBQTSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBIaSBIdWFjYWks
Cj4gCj4gT24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMDY6MTQ6NTJQTSArMDgwMCwgSHVhY2FpIENo
ZW4gd3JvdGU6Cj4+IE9uIE1vbiwgTWF5IDI1LCAyMDI2IGF0IDQ6NTDigK9QTSBKaW5qaWUgUnVh
biA8cnVhbmppbmppZUBodWF3ZWkuY29tPiB3cm90ZToKPj4+Cj4+PiBKaW5qaWUgUnVhbiAoMTYp
Ogo+Pj4gICByaXNjdjoga2V4ZWNfZmlsZTogRml4IGNyYXNoa19sb3dfcmVzIG5vdCBleGNsdWRl
IGJ1Zwo+Pj4gICBwb3dlcnBjL2NyYXNoOiBGaXggcG9zc2libGUgbWVtb3J5IGxlYWsgaW4gdXBk
YXRlX2NyYXNoX2VsZmNvcmVoZHIoKQo+Pj4gICBhcm02NDoga2V4ZWM6IEZpeCBpbWFnZS0+ZWxm
X2hlYWRlcnMgbWVtb3J5IGxlYWsgZHVyaW5nIHJldHJ5IGxvb3AKPj4+ICAgeDg2L2tleGVjOiBG
aXggcG90ZW50aWFsIGJ1ZmZlciBvdmVyZmxvdyBpbiBwcmVwYXJlX2VsZl9oZWFkZXJzKCkKPj4+
ICAgYXJtNjQ6IGtleGVjX2ZpbGU6IEZpeCBwb3RlbnRpYWwgYnVmZmVyIG92ZXJmbG93IGluCj4+
PiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygpCj4+PiAgIHJpc2N2OiBrZXhlY19maWxlOiBGaXgg
cG90ZW50aWFsIGJ1ZmZlciBvdmVyZmxvdyBpbgo+Pj4gICAgIHByZXBhcmVfZWxmX2hlYWRlcnMo
KQo+Pj4gICBMb29uZ0FyY2g6IGtleGVjOiBGaXggcG90ZW50aWFsIGJ1ZmZlciBvdmVyZmxvdyBp
bgo+Pj4gICAgIHByZXBhcmVfZWxmX2hlYWRlcnMoKQo+Pj4gICBjcmFzaDogQWRkIGNyYXNoX3By
ZXBhcmVfaGVhZGVycygpIHRvIGV4Y2x1ZGUgY3Jhc2gga2VybmVsIG1lbW9yeQo+Pj4gICBhcm02
NDoga2V4ZWNfZmlsZTogVXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGhlbHBlciB0byBzaW1w
bGlmeSBjb2RlCj4+PiAgIHg4Ni9rZXhlYzogVXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGhl
bHBlciB0byBzaW1wbGlmeSBjb2RlCj4+PiAgIHJpc2N2OiBrZXhlY19maWxlOiBVc2UgY3Jhc2hf
cHJlcGFyZV9oZWFkZXJzKCkgaGVscGVyIHRvIHNpbXBsaWZ5IGNvZGUKPj4+ICAgTG9vbmdBcmNo
OiBrZXhlYzogVXNlIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGhlbHBlciB0byBzaW1wbGlmeSBj
b2RlCj4+PiAgIGNyYXNoOiBVc2UgY3Jhc2hfZXhjbHVkZV9jb3JlX3JhbmdlcygpIG9uIHBvd2Vy
cGMKPj4+ICAgYXJtNjQ6IGtleGVjOiBBZGQgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwgQ01BIHJl
c2VydmF0aW9uCj4+PiAgIHJpc2N2OiBrZXhlYzogQWRkIHN1cHBvcnQgZm9yIGNyYXNoa2VybmVs
IENNQSByZXNlcnZhdGlvbgo+Pj4gICBhcm02NC9jcmFzaDogQWRkIGNyYXNoIGhvdHBsdWcgc3Vw
cG9ydAo+PiBJIGhhdmUgc29tZSBiaWtlc2hlZWRpbmdzIGFib3V0IHRoZSBzdWJqZWN0cy4gQ2Fu
IHdlIHVuaWZ5IHRoZSBwcmVmaXggZm9ybWF0cz8KPj4geDg2L2tleGVjLCBhcm02NDoga2V4ZWNf
ZmlsZSwgcmlzY3Y6IGtleGVjX2ZpbGUsIExvb25nQXJjaDoga2V4ZWMgLi4uLi4KPiAKPiBJdCBt
aWdodCBsb29rIHdlaXJkIGluIHRoZSBzZXJpZXMsIGJ1dCBwb3dlcnBjIGFuZCB4ODYgdXNlICcv
JyBhbmQgYXJtNjQgYW5kCj4gcmlzY3YgdXNlICc6JyBzbyBpbiB0aGUgbG9ncyBpbiBhcmNoLyB0
aGlzIHdvdWxkIGJlIGFjdHVhbGx5IGZpbmUuCj4gCj4gV2l0aCB0aGUgb25seSBleGNlcHRpb24g
b2YgYXJtNjQvY3Jhc2ggdGhhdCBzaG91bGQgaGF2ZSBiZWVuIGFybTY0OiBjcmFzaDoKClRoYW5r
cywgd2lsbCB1cGRhdGUgaXQgaW4gbmV4dCB2ZXJzaW9uLgoKPiAgCj4+IEh1YWNhaQo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
