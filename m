Return-Path: <SRS0=Z71o=LW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05864C48BC2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 02:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A8761421
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 02:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A8761421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw5bF22YQ8SGVwKdKOIb1K6Cb5uCD7y3MlX54ygaJSI=; b=U4TpNGZ08R01xfWTwkWCuGGQhn
	MStwWW4js/J5zYZVdrlfZS/RWSkV8XVCpo/dqcUICnsIi/0oQzlIbTtdjFngFy0r6cq6qNL+6GPcQ
	hOd7FFDcMuDqzHFtDFm+6LNxodaAeHPK5zKQbwrw7suW8odT8o94iXXQpNmN6sxJom/8n0/o3a+Pv
	YVzmvrDY5tABz7JcAghnMYD51VldxI+MI+bJTLnmsiosITtFL30sxnC5VfTAZ7IWhACFxv7W3MzGE
	1E2BsdvZf6SOR7/663L4CLBFMEIanLmjqfWz8fty68QMXYqh7fdqSilHSLah1hG4s+Dd37qldrrZo
	TKYo52tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxh0Z-006XQR-CI; Mon, 28 Jun 2021 02:28:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxh0W-006XPd-Oy
 for linux-riscv@lists.infradead.org; Mon, 28 Jun 2021 02:28:22 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GCrzp26ZnzZkdZ;
 Mon, 28 Jun 2021 10:25:10 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 10:28:10 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 10:28:10 +0800
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Bin Meng <bmeng.cn@gmail.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra
 <atish.patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, stable
 <stable@vger.kernel.org>
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
Date: Mon, 28 Jun 2021 10:28:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_192821_024376_E70354FF 
X-CRM114-Status: GOOD (  13.82  )
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

Ck9uIDIwMjEvNi8yOCA5OjE1LCBCaW4gTWVuZyB3cm90ZToKPiBPbiBNb24sIEp1biAyOCwgMjAy
MSBhdCA4OjUzIEFNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4+IEhp77yMIHNvcnJ5IGZvciB0aGUgbWlzdGFrZe+8jHRoZSBidWcgaXMgZml4ZWQgYnkK
Pj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMTA2MDIwODU1MTcu
MTI3NDgxLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vCj4gV2hhdCBhcmUgd2Ugb24gdGhl
IHBhdGNoIHlvdSBtZW50aW9uZWQ/Cj4KPiBJIGRvbid0IHNlZSBpdCBhcHBsaWVkIGluIHRoZSBs
aW51eC9tYXN0ZXIuCj4KPiBBbHNvIHRoZXJlIHNob3VsZCBiZSBhICJGaXhlcyIgdGFnIGFuZCBz
dGFibGVAdmdlci5rZXJuZWwub3JnIGNjJ2VkCj4gYmVjYXVzZSAzMi1iaXQgaXMgYnJva2VuIHNp
bmNlIHY1LjEyLgoKaHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXgvKy9jOTgxMWUzNzliMjExYzY3YmEyOWZiMDlkNmY2NDRk
ZDQ0Y2ZjZmYyCgppdCdzIG9uIFBhbG1lcicgcmlzY3YtbmV4dC4KCkhpIFBhbG1lciwgc2hvdWxk
IEkgcmVzZW5kIG9yIGNvdWxkIHlvdSBoZWxwIG1lIHRvIGFkZCB0aGUgZml4ZXMgdGFnPwoKPgo+
IFJlZ2FyZHMsCj4gQmluCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
