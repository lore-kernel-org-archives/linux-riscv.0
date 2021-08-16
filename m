Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4931C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 15:30:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854AA60EB5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 15:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 854AA60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crgQ27hP/BD7fzMCQuf6PDloei89jwf7MHqfNI8uuHQ=; b=U5/t6yO3W/CAb905CB2MyHUEk1
	pHwXwktNLrRmqWXH67KN2wnOUMLQ89827SsEerNPfA2j7wpRTuI/0ihO7HC/QvYAdlQBA8AwKEyJt
	ORwYJdP2wZnrSduip/bZPhq7eYWbQIgavvRa7mGEmmCInQgRSQCFywC4Gs3AXFwuwW3CalaefaAB+
	B/PKobR3BgMHDzNsntP1dk01k5PI7vMzmKitK/J9MhLn+xKecoNhBCmAkubbstLyrMnub6tEuWrc1
	BkX+Sk9e3giPhMHCOICgyZTUuv/OYiWLrsq61dclXXWS28XlGS4+7FlBd/m6iux7ZsThWg6XPwpd1
	fAVWNUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFeZU-00HMbR-4M; Mon, 16 Aug 2021 15:30:40 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFeZQ-00HMaE-At
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 15:30:38 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GpJ4v4cC4z1CWsC;
 Mon, 16 Aug 2021 23:30:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 16 Aug 2021 23:30:29 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 16 Aug 2021 23:30:28 +0800
Subject: Re: [PATCH 1/1] riscv: select CONFIG_ARCH_KEEP_MEMBLOCK
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210816144728.1425121-1-heinrich.schuchardt@canonical.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <bef20bf2-538d-1319-ba22-6774efa10ebc@huawei.com>
Date: Mon, 16 Aug 2021 23:30:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210816144728.1425121-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_083037_289546_CB6CDB0E 
X-CRM114-Status: GOOD (  14.52  )
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

Ck9uIDIwMjEvOC8xNiAyMjo0NywgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiBGb3IgYW5h
bHl6aW5nIG1lbW9yeSBibG9ja3Mgd2UgY2FuIGVpdGhlciB1c2UgdGhlIG1lbWJsb2NrPWRlYnVn
IGNvbW1hbmQKPiBsaW5lIGFyZ3VtZW50IHdoaWNoIGNyZWF0ZXMgbWFzc2l2ZSBvdXRwdXQgb3Ig
YSBkZWJ1ZyBmaWxlIHN5c3RlbS4KPgo+IFNlbGVjdCBDT05GSUdfQVJDSF9LRUVQX01FTUJMT0NL
IHRvIHByb3ZpZGUgYSBkZWJ1Z2ZzIGF0Cj4gL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2sgdG8g
YW5hbHl6ZSBtZW1vcnkgYmxvY2tzLiBUaGUKPiBzYW1lIGlzIGFscmVhZHkgZG9uZSBmb3IgYXJt
LCBhcm02NCwgbWlwcywgcG93ZXJwYy4KPgo+IFRoZSBhY3R1YWwgcHJvdmlzaW9uaW5nIG9mIHRo
ZSBmaWxlIHN5c3RlbSBkZXBlbmRzIG9uIENPTkZJR19ERUJVR19GUy4KCkhp77yMZm9yIHJpc2N2
LCBpdCBkb24ndCB1c2UgbWVtYmxvY2soZWcsIG5vIHByb3ZpZGUgcGZuX3ZhbGlkIHRvIHVzZSAK
bWVtYmxvY2spLAoKd2UgY291bGQgY2FsbCBtZW1ibG9ja19kaXNjYXJkKCkgdG8gZGlzY2FyZCBt
ZW1ibG9jayBwcml2YXRlIG1lbW9yeSB0byBzYXZlCgpzb21lIG1lbW9yeSwgcmlnaHQ/wqAgU28g
SSB0aGluayB3ZSBkb24ndCBuZWVkIHRoaXMgY29uZmlnIGZvciBub3cuCgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwu
Y29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCA0ZjdiNzBhZTdjMzEuLmE2ZTU3NjE0YzNmZCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiBAQCAtMzEsNiArMzEsNyBAQCBjb25maWcgUklTQ1YKPiAgIAlzZWxlY3QgQVJDSF9IQVNfU1RS
SUNUX0tFUk5FTF9SV1ggaWYgTU1VICYmICFYSVBfS0VSTkVMCj4gICAJc2VsZWN0IEFSQ0hfSEFT
X1NUUklDVF9NT0RVTEVfUldYIGlmIE1NVSAmJiAhWElQX0tFUk5FTAo+ICAgCXNlbGVjdCBBUkNI
X0hBU19USUNLX0JST0FEQ0FTVCBpZiBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVAo+ICsJ
c2VsZWN0IEFSQ0hfS0VFUF9NRU1CTE9DSwo+ICAgCXNlbGVjdCBBUkNIX09QVElPTkFMX0tFUk5F
TF9SV1ggaWYgQVJDSF9IQVNfU1RSSUNUX0tFUk5FTF9SV1gKPiAgIAlzZWxlY3QgQVJDSF9PUFRJ
T05BTF9LRVJORUxfUldYX0RFRkFVTFQKPiAgIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19IVUdFVExC
RlMgaWYgTU1VCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
