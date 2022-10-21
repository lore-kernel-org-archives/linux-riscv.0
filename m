Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B4FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xrvt8BkfKrjapaf048gT08vZNxH8nd6mnwmkdA0hlg=; b=PkU7yOzCQFKN1e
	12dPKXnSzY2rqkdlwUSvzpM2xM2x1Ww+mpSteQcrHgW8Fo1y1B+EnRrCAIGLqBcWbh9peDNg/e5Ls
	iqXzkk/6q11UoyBG6dFfebwf9+jqflMPxnfGdteIOQkBkNva36shIIEOBoWwuhC1rm2M6oTrwE3iZ
	chIq207sV+njtLzaL6Cgj4G8Z4OnDxWA6q5EuPLrbpfvAmmlvg/3VSBzjMOw2fsSnJGO3XEh4kGRA
	JteKwcKNDiesEzqmS9ETrulefBd5KWWdbQ1APdA0HX2m+FYz5zpPMfWTPhyXADyjj4HWzlNoAfdjs
	d/bntdKG47uQzwXPELFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsM4-0088Mf-4l; Fri, 21 Oct 2022 13:46:32 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsM0-0088Hk-L3
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 13:46:30 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mv5KC5rn4zJn4V;
	Fri, 21 Oct 2022 21:43:43 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:46:25 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:46:24 +0800
Message-ID: <f1eb4756-e1e1-1f12-e767-a69a891786d6@huawei.com>
Date: Fri, 21 Oct 2022 21:46:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Andrea Parri <parri.andrea@gmail.com>
CC: Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20221019154727.2395-1-jszhang@kernel.org>
 <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
 <Y1JaE/ot91Z0KXuC@andrea> <ed7c4027-8e15-245f-cdda-0551063761e7@huawei.com>
 <Y1KdKATQx16Xl/iL@andrea>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Y1KdKATQx16Xl/iL@andrea>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_064628_900710_ED71B871 
X-CRM114-Status: UNSURE (   4.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMi8xMC8yMSAyMToyMiwgQW5kcmVhIFBhcnJpIOWGmemBkzoKPiBIaSBUb25nLAo+
ICAgCj4+Pj4gSSB1c2UgYXRvbWljX3NldF9yZWxlYXNlIGhlcmUsIGJlY2F1c2UgSSBuZWVkIGVh
cmxpZXIgbWVtb3J5Cj4+Pj4gb3BlcmF0aW9ucyBmaW5pc2hlZCB0byBtYWtlIHN1cmUgdGhlIHNw
IGlzIHJlYWR5IHRoZW4gc2V0IHRoZSBzcGluCj4+Pj4gZmxhZy4KPiAKPj4gCUNvbnNpZGVyIHRo
aXMgaW1wbGVtZW50YXRpb246KQo+Pgo+PiAJc21wX3N0b3JlX21iKCZzcGluX3NoYWRvd19zdGFj
aywgMCk7Cj4gCj4gc21wX3N0b3JlX21iKCkgaGFzICJXUklURV9PTkNFKCk7IHNtcF9tYigpIiBz
ZW1hbnRpY3M7IHNvIGl0IGRvZXNuJ3QKPiBndWFyYW50ZWUgdGhhdCB0aGUgc3RvcmUgdG8gc3Bp
bl9zaGFkb3dfc3RhY2sgaXMgb3JkZXJlZCBhZnRlciBwcm9ncmFtCj4gLW9yZGVyIGVhcmxpZXIg
bWVtb3J5IGFjY2Vzc2VzLgo+IAo+ICAgIEFuZHJlYQo+IC4KCkhpIEFuZHJlYToKCklJVUMsIHRo
ZSBlYXJsaWVyIG1lbW9yeSBhY2Nlc3MgYW1vc3dhcC5hcXJsLCBoZXJlIC5hcXJsIGd1YXJhbnRl
ZSBpdC4KQnV0IGFueXdheSwgY29uc2lkZXIgd2UgZG9uJ3QgY2FyZSBhYm91dCBwZXJmb3JtYW5j
ZSBoZXJlLCB1c2luZyAKc21wX3N0b3JlX3JlbGVhc2UoKShhZGQgYmFycmllcigpKSBzdXJlbHkg
cmlnaHQuCgpUaGFua3MsClRvbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
