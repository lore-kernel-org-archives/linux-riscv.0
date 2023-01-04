Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F46C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Byo4LoXSBtWIHKBQEtv8a3X5sBRb8hR7NllP6Qb6Z0=; b=IAu5BTAkYIVV79
	Y2+EEQphfsHxLX75z39D/5faW01o60A5AB5pif9MyGGZJbznSp2FztcQdedxjtCCHDihSZj44ci7E
	TTqIfuiO+TKFrB1UMifPjjXFU/CI0wt+6FtwPxtxJxr2Z14RT597ubvE2UqSAt4kkm+HYamRHvn8C
	JzlsxWKLRgbnNByEE/AVZCvqiiyLOorhVjLQrLY8A3ipLs7lyzB5pDa4aPLx3gd2CIaQSd9bTclxU
	zcKafXdZ2bt2YrCogapPtEbSKylerPkXc7jPO7hNKacWPohD9/Ax4llrxmPhvSYwZcrH6z5MclzL8
	1tjGl8ZiOxxEs+e8hpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzGC-007gLD-D8; Wed, 04 Jan 2023 08:36:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzEV-007fk3-79
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:34:48 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Nn2pd51FpzqTmH;
	Wed,  4 Jan 2023 16:30:01 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:34:40 +0800
Message-ID: <51bc99fe-3fa0-b3f8-1fe0-327395e1f45a@huawei.com>
Date: Wed, 4 Jan 2023 16:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 3/9] riscv/kprobe: Prepare the skeleton to prepare
 optimized kprobe
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
 <87358sxbtu.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87358sxbtu.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003447_479019_05A7BDA3 
X-CRM114-Status: UNSURE (   2.97  )
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

CgrlnKggMjAyMy8xLzMgMTY6MjcsIEJqw7ZybiBUw7ZwZWwg5YaZ6YGTOgo+IENoZW4gR3Vva2Fp
IDxjaGVuZ3Vva2FpMTdAbWFpbHMudWNhcy5hYy5jbj4gd3JpdGVzOgo+IAo+PiBGcm9tOiBMaWFv
IENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+Cj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMK
Pj4gaW5kZXggNTZjOGEyMjdjODU3Li5hNDI3MWU2MDMzYmEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMvb3B0LmMKPj4gQEAgLTEwLDYgKzEwLDU0IEBACj4+ICAKPj4gICNpbmNsdWRlIDxsaW51eC9r
cHJvYmVzLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2twcm9iZXMuaD4KPj4gKyNpbmNsdWRlIDxhc20v
cGF0Y2guaD4KPj4gKwo+PiArc3RhdGljIGlubGluZSBpbnQgaW5fYXVpcGNfamFscl9yYW5nZShs
b25nIHZhbCkKPiAKPiBMZWF2ZSAiaW5saW5lIiBvdXQ7IExldCB0aGUgY29tcGlsZXIgZGVjaWRl
LgoKV2lsbCBkby4KCi0tIApCUiwKTGlhbywgQ2hhbmcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
