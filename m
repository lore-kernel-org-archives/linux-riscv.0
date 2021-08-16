Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E456C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 16:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5CC60F58
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 16:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A5CC60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYHIZ1Rw6pUVy5nazqkbpU1cwGAc9qcnetdPDW9+HM0=; b=dUvovv/W1xyXNzt4Lx6+jQm0fX
	8v5x6TgpHqjm8lopDVq3vLbDddCHNV6zpZXTVSt0FIlMfdkB1UfTO9UKajYCkEgOeL/bWsaPdXK7D
	gKSGTxBY5foDA3lUUPun3iymXcixEZuV2T4fxq8dslFmFrrvjfacWlPZgaKh/JvCy781BNH1Yxrwl
	t3UbDF2aWCwR4H3BskOPVTbJdd8JOfZkW/lYJm0BKG/zgUXac18XRazpjzNioZR2uTu9z6olgZ/pi
	hgiHmhEAs3YDv1eNnnjL52SQuK6beLe7m4gL9xp7PbEhe0fjB9j9pXBbadVFWqOeS8nXJBOtiSLE7
	zOCAI2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFf5T-00HPMS-ID; Mon, 16 Aug 2021 16:03:43 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFf5P-00HPLQ-QB
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 16:03:41 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GpJqN1lHcz86tW;
 Tue, 17 Aug 2021 00:03:28 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 00:03:24 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 00:03:23 +0800
Subject: Re: [PATCH 1/1] riscv: select CONFIG_ARCH_KEEP_MEMBLOCK
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210816144728.1425121-1-heinrich.schuchardt@canonical.com>
 <bef20bf2-538d-1319-ba22-6774efa10ebc@huawei.com>
 <d9d9f764-2bc7-ddf4-2353-dac323e4416d@canonical.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <ae98dc9e-6892-49c2-24f5-1578b5d4a410@huawei.com>
Date: Tue, 17 Aug 2021 00:03:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d9d9f764-2bc7-ddf4-2353-dac323e4416d@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_090340_170668_B5049D25 
X-CRM114-Status: GOOD (  10.04  )
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

Ck9uIDIwMjEvOC8xNiAyMzo1MiwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiBPbiA4LzE2
LzIxIDU6MzAgUE0sIEtlZmVuZyBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDIxLzgvMTYgMjI6NDcs
IEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+PiBGb3IgYW5hbHl6aW5nIG1lbW9yeSBibG9j
a3Mgd2UgY2FuIGVpdGhlciB1c2UgdGhlIG1lbWJsb2NrPWRlYnVnIAo+Pj4gY29tbWFuZAo+Pj4g
bGluZSBhcmd1bWVudCB3aGljaCBjcmVhdGVzIG1hc3NpdmUgb3V0cHV0IG9yIGEgZGVidWcgZmls
ZSBzeXN0ZW0uCj4+Pgo+Pj4gU2VsZWN0IENPTkZJR19BUkNIX0tFRVBfTUVNQkxPQ0sgdG8gcHJv
dmlkZSBhIGRlYnVnZnMgYXQKPj4+IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrIHRvIGFuYWx5
emUgbWVtb3J5IGJsb2Nrcy4gVGhlCj4+PiBzYW1lIGlzIGFscmVhZHkgZG9uZSBmb3IgYXJtLCBh
cm02NCwgbWlwcywgcG93ZXJwYy4KPj4+Cj4+PiBUaGUgYWN0dWFsIHByb3Zpc2lvbmluZyBvZiB0
aGUgZmlsZSBzeXN0ZW0gZGVwZW5kcyBvbiBDT05GSUdfREVCVUdfRlMuCj4+Cj4+IEhp77yMZm9y
IHJpc2N2LCBpdCBkb24ndCB1c2UgbWVtYmxvY2soZWcsIG5vIHByb3ZpZGUgcGZuX3ZhbGlkIHRv
IHVzZSAKPj4gbWVtYmxvY2spLAo+Pgo+PiB3ZSBjb3VsZCBjYWxsIG1lbWJsb2NrX2Rpc2NhcmQo
KSB0byBkaXNjYXJkIG1lbWJsb2NrIHByaXZhdGUgbWVtb3J5IAo+PiB0byBzYXZlCj4+Cj4+IHNv
bWUgbWVtb3J5LCByaWdodD/CoCBTbyBJIHRoaW5rIHdlIGRvbid0IG5lZWQgdGhpcyBjb25maWcg
Zm9yIG5vdy4KPgo+IFdoYXQgZG8geW91IG1lYW4gYnkgIml0IGRvbid0IHVzZSBtZW1ibG9jaz8K
ClNvcnJ5LCBpdCBzaG91bGQgYmXCoCAidGhlIHJpc2N2IGRvbid0IHVzZSBtZW1ibG9jayBhZnRl
ciB0aGUgcGFnZSAKYWxsb2NhdG9yIGlzIGluaXRpYWxpemVkIgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
