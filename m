Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77EDC44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3hSeuuHa0hzm6OJzm/tSp+iWC6rqYIwZ9kjUpwiNbU=; b=Ice0c403ZnoRuT
	4hUuyUvLGpktfhS7QZgK37H7uncQnoiQ/sHCr/XETsDCfcukm0rPuVy3AbsGB4b73JrgsVQf8xCmB
	shlZTvWqUHVhoEAcaLOPgf5rhywTfbRYlKv/jzIJrDivkMfaNEvQR/E0HU4yUgQqX/FB1s0FKga67
	s3K8BHFIFStUVC/PF4AEBKQ8HdbwqbtmDzXDUvBiNKgtBE4N40qmeJYq8/npg4pq2PKJ8hrI2qVY5
	Hir4ARWgiQ4Mpl/9aiZ3fei8USjg2h1PutwNLk6ini5w41lmxtGklItNHqP0iATTSr8PnEMUiMnML
	xh6hMNpXwZQINEATZMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjfX-00000001MvH-2dgZ;
	Thu, 09 Jul 2026 07:59:39 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjfU-00000001Muo-0Td1
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:59:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=amF18KHfc8NodmLlIFl9+tYxitLhQeTXu6ioMRTAIhg=;
	b=DwmhEa4JsZH1zyt75IBFUEkYJMYW+ez6g3GqbaAAdGlvMivx7XQMpEbeY+BIMBJbg82eFYJRv
	A6w879pWEbnndkDFcInfs1Lz7SgEszZcAusSMg9XCYhmUtHeZlgmbQA/qxsMc6wVD2uKd7y78Pu
	9gaY7eN4pgIJHOHwJ3k/0pg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gwnF96JgNzcb0T;
	Thu,  9 Jul 2026 15:50:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C128A40537;
	Thu,  9 Jul 2026 15:59:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 15:59:22 +0800
Message-ID: <dfc05f53-6cef-4da2-83c1-6e765ec419fe@huawei.com>
Date: Thu, 9 Jul 2026 15:59:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] syscall_user_dispatch: Introduce
 ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
CC: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <nathan@kernel.org>,
	<kees@kernel.org>, <xur@google.com>, <peterz@infradead.org>,
	<gourry@gourry.net>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<yangtiezhu@loongson.cn>, <sshegde@linux.ibm.com>, <mchauras@linux.ibm.com>,
	<austin.kim@lge.com>, <arnd@arndb.de>, <jchrist@linux.ibm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20260709072803.3843948-1-ruanjinjie@huawei.com>
 <20260709093404-0b19988f-8d19-4fae-86d8-396aa747307d@linutronix.de>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709093404-0b19988f-8d19-4fae-86d8-396aa747307d@linutronix.de>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_005936_798322_9DD8405E 
X-CRM114-Status: GOOD (  12.34  )
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

CgpPbiA3LzkvMjAyNiAzOjM2IFBNLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPiBPbiBUaHUs
IEp1bCAwOSwgMjAyNiBhdCAwMzoyODowM1BNICswODAwLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4g
Q3VycmVudGx5LCBvbmx5IHg4NiBnZW51aW5lbHkgaW1wbGVtZW50cyBhbmQgc3VwcG9ydHMgU3lz
Y2FsbCBVc2VyCj4+IERpc3BhdGNoIChTVUQpLiBNdWx0aXBsZSBhcmNoaXRlY3R1cmVzIHByb3Zp
ZGUgYSBzdHViCj4+IGFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybigpIHJldHVybmluZyAn
ZmFsc2UnIHNpbXBseSB0byBzYXRpc2Z5Cj4+IEdFTkVSSUNfRU5UUlkgY29tcGlsYXRpb24sIHdo
aWNoIGNyZWF0ZXMgYSBmYWxzZSBpbXByZXNzaW9uIG9mIGZlYXR1cmUKPj4gc3VwcG9ydC4KPj4K
Pj4gSW50cm9kdWNlIEFSQ0hfU1VQUE9SVFNfU1lTQ0FMTF9VU0VSX0RJU1BBVENIIHRvIGRlY291
cGxlIHRoaXMgbWVjaGFuaXNtCj4+IGZyb20gR0VORVJJQ19FTlRSWS4gU2VsZWN0IGl0IGV4Y2x1
c2l2ZWx5IG9uIHg4NiBhbmQgcmVtb3ZlIHRoZSByZWR1bmRhbnQKPj4gc3R1YiBmdW5jdGlvbnMg
ZnJvbSBvdGhlciBhcmNoaXRlY3R1cmVzLgo+IAo+IE5pY2UsIHRoaXMgY29uZnVzZWQgbWUgYmVm
b3JlLgo+IAo+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVs
L2FrWmdWMFk0WUFtQjQzX2dASjJON1FUUjlSMy5jYW1icmlkZ2UuYXJtLmNvbS8KPj4gQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+PiBDYzogTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4KPj4gQ2M6IEFkYSBDb3VwcmllIERpYXogPGFkYS5jb3VwcmllZGlh
ekBhcm0uY29tPgo+PiBDYzogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxp
bnV0cm9uaXguZGU+Cj4+IFN1Z2dlc3RlZC1ieTogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2Vp
LmNvbT4KPj4gLS0tCj4+ICBhcmNoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAx
ICsKPj4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N5c2NhbGwuaCB8IDYgLS0tLS0tCj4+
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAgfCA1IC0tLS0tCj4+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3N5c2NhbGwuaCAgICAgfCA1IC0tLS0tCj4+ICBhcmNoL3MzOTAv
aW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICAgfCA1IC0tLS0tCj4+ICBhcmNoL3g4Ni9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgfCAxICsKPj4gIDYgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyMSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvS2NvbmZpZyBi
L2FyY2gvS2NvbmZpZwo+PiBpbmRleCAwYzAxNTIxYzJmM2YuLjM5M2QwZmI3NWVhYyAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9LY29uZmlnCj4+ICsrKyBiL2FyY2gvS2NvbmZpZwo+PiBAQCAtMTE2LDYg
KzExNiw3IEBAIGNvbmZpZyBHRU5FUklDX0VOVFJZCj4+ICAKPj4gIGNvbmZpZyBTWVNDQUxMX1VT
RVJfRElTUEFUQ0gKPj4gIAlib29sICJTeXNjYWxsIFVzZXIgRGlzcGF0Y2giCj4+ICsJZGVwZW5k
cyBvbiBBUkNIX1NVUFBPUlRTX1NZU0NBTExfVVNFUl9ESVNQQVRDSAo+IAo+IEFSQ0hfU1VQUE9S
VFNfU1lTQ0FMTF9VU0VSX0RJU1BBVENIIGlzIG5vdCBkZWNsYXJlZCBhcyBhIGNvbmZpZyBvcHRp
b24sCj4gc28gdGhlICdzZWxlY3QnIHdpbGwgbm90IGRvIGFueXRoaW5nLiBOZWVkcyB0aGlzOgo+
IAo+IGNvbmZpZyBBUkNIX1NVUFBPUlRTX1NZU0NBTExfVVNFUl9ESVNQQVRDSAo+IAlib29sCgpZ
ZXMsIHRoaXMgaXMgbWlzc2luZyBoZXJlLgo+IAo+PiAgCWRlcGVuZHMgb24gR0VORVJJQ19FTlRS
WQo+PiAgCWRlZmF1bHQgeQo+PiAgCWhlbHAKPiAKPiAoLi4uKQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
