Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE257C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:05:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E17565015
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E17565015
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vnwteNksE+cPcTt3OntR+teUOKBLwq6yedE6SytB/M4=; b=OAoivFowhIXjmQ32xscwhN55O
	1kpeEsVt8/S4GiscL7tmT7wuL23/9NuCAtl1itKo1PuFhnVNe08bxxyABMmO1Van6tELQHLGCvXA4
	Xbizx0dquFKGd+an7xvFrYyXZoCKz6iiTx2LwDWytyGFbvJ+D32xHbqsO53zR/SgsvaeHz6fhC4f/
	jg+srO8zb76nH0VU+Cwm8/SvuZ+kY0Kj3OauWy5lHRQ7sylQFDtVy+jaX4G3NE24uS6/DbFnpLnet
	bKeT/4XxHfVBDVySNXU8lJGJ9a0chAyQR6OCLmsEferSUx6bfVKGV5dr9SyRZ7FOvljnlIjdVtUFP
	LEEE1R04A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8GB-00EgPi-4I; Fri, 05 Mar 2021 11:04:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8F4-00EfoH-Tq
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:43 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsPt94q38zjV5X;
 Fri,  5 Mar 2021 19:01:05 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:41 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 1/9] riscv: traps: Fix no prototype warnings
Date: Fri, 5 Mar 2021 19:33:24 +0800
Message-ID: <20210305113332.428048-2-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110338_908035_1425117F 
X-CRM114-Status: UNSURE (   5.60  )
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

Rml4IGFsbCBXPTEgY29tcGlsYXRpb24gd2FybmluZ3M6J25vIHByZXZpb3VzIHByb3RvdHlwZSBm
b3InIGluIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6CmFyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmM6OTY6MTU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZG9fdHJhcF91
bmtub3du4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KICAgOTYgfCBET19FUlJPUl9JTkZPKGRv
X3RyYXBfdW5rbm93biwKICAgICAgfCAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgphcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jOjkxOjI3OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3Jv
IOKAmERPX0VSUk9SX0lORk/igJkKICAgOTEgfCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIG5h
bWUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpICAgXAogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fgphcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOjk4OjE1OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRvX3RyYXBfaW5zbl9taXNhbGlnbmVk4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KICAgOTggfCBET19FUlJPUl9JTkZPKGRvX3RyYXBfaW5zbl9taXNh
bGlnbmVkLAogICAgICB8ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYzo5MToyNzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNy
byDigJhET19FUlJPUl9JTkZP4oCZCiAgIDkxIHwgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBu
YW1lKHN0cnVjdCBwdF9yZWdzICpyZWdzKSAgIFwKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn4KYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzoxMDA6MTU6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZG9fdHJhcF9pbnNuX2ZhdWx04oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KLi4uCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdl
aS5jb20+ClNpZ25lZC1vZmYtYnk6IE5hbnlvbmcgU3VuIDxzdW5uYW55b25nQGh1YXdlaS5jb20+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIHwgMTYgKysrKysr
KysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgIHwgIDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hc20tcHJvdG90eXBlcy5oCmluZGV4IDI3ZTAwNWZjYTU4NC4uNmQ4MWFiZjVkOWY4IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCkBAIC05LDQgKzksMjAgQEAgbG9u
ZyBsb25nIF9fbHNocnRpMyhsb25nIGxvbmcgYSwgaW50IGIpOwogbG9uZyBsb25nIF9fYXNocnRp
Myhsb25nIGxvbmcgYSwgaW50IGIpOwogbG9uZyBsb25nIF9fYXNobHRpMyhsb25nIGxvbmcgYSwg
aW50IGIpOwogCisKKyNkZWZpbmUgREVDTEFSRV9ET19FUlJPUl9JTkZPKG5hbWUpCWFzbWxpbmth
Z2Ugdm9pZCBuYW1lKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKKworREVDTEFSRV9ET19FUlJPUl9J
TkZPKGRvX3RyYXBfdW5rbm93bikKK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2luc25f
bWlzYWxpZ25lZCkKK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2luc25fZmF1bHQpCitE
RUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9pbnNuX2lsbGVnYWwpCitERUNMQVJFX0RPX0VS
Uk9SX0lORk8oZG9fdHJhcF9sb2FkX2ZhdWx0KQorREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3Ry
YXBfbG9hZF9taXNhbGlnbmVkKQorREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfc3RvcmVf
bWlzYWxpZ25lZCkKK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX3N0b3JlX2ZhdWx0KQor
REVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfdSkKK0RFQ0xBUkVfRE9fRVJST1Jf
SU5GTyhkb190cmFwX2VjYWxsX3MpCitERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9lY2Fs
bF9tKQorREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfYnJlYWspCisKICNlbmRpZiAvKiBf
QVNNX1JJU0NWX1BST1RPVFlQRVNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXggM2VkMmMyMzYwMWEwLi4w
ODc5YjVkZjExYjkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMTcsNiArMTcsNyBAQAogI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L2lycS5oPgogCisjaW5jbHVkZSA8YXNtL2Fz
bS1wcm90b3R5cGVzLmg+CiAjaW5jbHVkZSA8YXNtL2J1Zy5oPgogI2luY2x1ZGUgPGFzbS9wcm9j
ZXNzb3IuaD4KICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Ci0tIAoyLjI1LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
