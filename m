Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA5BC388F9
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 05:36:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5BE22210
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 05:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2mhhTW/m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5BE22210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vYrSIuiztPEXOV/baMIFDM5oVsaPpX1WDGy1Dj9imeA=; b=2mhhTW/m5Z6Nmo+7+EcOw2UMW
	G6VWGc2h0PoFuOPrVOue9CKa7klAkDfJH8Fti1hn3jwr5LGqqB69K9KnSxOogNkqH1VZqA58Bz1iW
	NNC17gabRJbgEHoBSZjvSGIfhwXEp6bilYFza1g0ATBA1xW5w7YWY9/j9Kmo7qETdCYRAkvNPEhpG
	qQrCF+Fmdl5KeYvW9vqq3f50mKoUYVGw1RPZ8bYvoyTrUfelTZNcsIwGPdHQ1G4JU6IVgeO2qmRTy
	Aut2hPtMkU42m59eI7kk+obLa6Lq/nIXUXamGIYDMRJFTeF/Zqn6biZWJTeDOsgwc0DflMsE8q9gj
	FhLOb2J0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgLYe-0006S3-CQ; Sat, 21 Nov 2020 05:35:36 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgLYa-0006RO-2V
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 05:35:34 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CdMYg1pZczkZ4S;
 Sat, 21 Nov 2020 13:34:47 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 21 Nov 2020 13:35:06 +0800
Subject: Re: [PATCH] riscv: Enable CMA support
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-a2fc73b4-833b-46c3-aa5c-e1d09a69accb@palmerdabbelt-glaptop1>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <4df7d7ac-4424-ca14-2e31-fc83458e83b5@huawei.com>
Date: Sat, 21 Nov 2020 13:35:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-a2fc73b4-833b-46c3-aa5c-e1d09a69accb@palmerdabbelt-glaptop1>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_003533_334396_2456915F 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMTEvMjEgMTA6MDMsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFRodSwgMTIg
Tm92IDIwMjAgMDA6NTU6MzAgUFNUICgtMDgwMCksIHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29t
IAo+IHdyb3RlOgo+PiBBbnkgY29tbWVudHMsIGtpbmRseSBwaW5nLi4uCj4KPiBTb3JyeSwgSSBt
dXN0IGhhdmUgbWlzc2VkIHRoaXMgb25lLsKgIEl0J3Mgb24gZm9yLW5leHQuwqAgVGhhbmtzIQoK
YW5kIGNvdWxkIHlvdSB0YWtlIGEgbG9vayBhdCB0aGUgdHdvIHBhdGNoZXMsIHRoYW5rcyA7KQoK
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIw
MjAxMTExMTE1MjE2LjMxNDQ3LTEtd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vCgpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyMDExMTYw
ODEyMzguNDQyMjMtMS13YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbS8KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
