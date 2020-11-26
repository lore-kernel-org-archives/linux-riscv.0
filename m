Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3719C56202
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 01:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC7B2075A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 01:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgy3HItF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC7B2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NhHE0znMwYnu973DCFre+ViBD3Kp8PoUCcGjbgLfqAw=; b=pgy3HItFFKuto/ORChFDyEfdn
	7FBJ09eHSz98v2INEu5oFxzUSnjVKW+7yxBDFg3uFTsrkBbSAy0Q+P6UbJrDOTQSHxtfhHEtkK7Ic
	/o6el0UcwPtDNvlvAbMpLtuT6NK9/XzbxPqgXDgN6dTp9sKWy37PTqwdCEZRwTPhHmFE7hAzRUDKk
	cuh9S/QI3AsVY8jJeGJZpWo0vgSxUtrWFtXFrYNbx7G++68yUNpaIHUwq/r63N9AcjKWnZlUpAJzv
	En1A0KCTSnbemGikknwVXAI6wIyjM3CBUhOKrzcBc4cCu6vWp58AT1Ck+BOd8o+q9e3j8UBmMGVXo
	unF2IVD0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki5oF-00077M-Dc; Thu, 26 Nov 2020 01:10:55 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki5oB-00076q-Tt
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 01:10:53 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ChKSH4KJkz15R8Q;
 Thu, 26 Nov 2020 09:10:23 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 09:10:02 +0800
Subject: Re: [PATCH 2/2] riscv: Fix __show_regs printing formats
To: Atish Patra <atishp@atishpatra.org>
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
 <20201124112054.106960-1-wangkefeng.wang@huawei.com>
 <20201124112054.106960-2-wangkefeng.wang@huawei.com>
 <CAOnJCUJH7AFYNsyFzwzHApZhfx_1yiEj+zkQDxryD83zac6f2g@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <c60a5e75-96a5-2fb7-4089-1e3b777c6b0d@huawei.com>
Date: Thu, 26 Nov 2020 09:10:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJH7AFYNsyFzwzHApZhfx_1yiEj+zkQDxryD83zac6f2g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_201052_247210_75F3B2B4 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 John Ogness <john.ogness@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KyBKb2huCgpPbiAyMDIwLzExLzI2IDY6NTgsIEF0aXNoIFBhdHJhIHdyb3RlOgo+IE9uIFR1ZSwg
Tm92IDI0LCAyMDIwIGF0IDM6MTcgQU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3
ZWkuY29tPiB3cm90ZToKPj4gVXNpbmcgcHJpbnRrIGRpcmVjdGx5IGFuZCBhbGlnbiB0aGUgcHJp
bnRpbmcgZm9ybWF0cy4KPj4KPiBXaHkgc3dpdGNoIHRvIHByaW50ayA/IElJUkMsIHByXyogaXMg
cHJlZmVycmVkIG92ZXIgcHJpbnRrIGZvciBhbnkgbmV3IGNvZGUuCgpUaGUgc3RhY2sgb3V0cHV0
IGlzIHN0cmFuZ2UswqAgdGhhdCBpcyB3aHkgSSBtb3ZlIHRvIHByaW50ayzCoCBhbmQgdGhlIG9s
ZCAKa2VybmVsIGxvb2tzIGdvb2QuCgphZnRlciBzb21lIHRlc3QsIEkgZm91bGQgZmlyc3QgYmFk
IGNvbW1pdDogCltjZmUyNzkwYjE2M2FjZGM5YzA1OGE2M2JmZjMxMDkyM2U4NGExNmI0XSBwcmlu
dGs6IG1vdmUgcHJpbnRrX2luZm8gaW50byAKc2VwYXJhdGUgYXJyYXkKCkhpIEpvaG4swqAgdGhl
cmUgaXMgcHJpbnRrLXJld29yayBmcm9tIHlvdSBpbiB2NS4xMC1yYzEswqAgY291bGQgeW91IGNo
ZWNrIAppdCA/CgpUaGFua3MKCj4KPj4gQmVmb3JlOgo+PiBlcGM6IGZmZmZmZmUwMDA4ZGMyM2Eg
cmEgOiBmZmZmZmZlMDAwOGRjMjM4IHNwIDogZmZmZmZmZTA4MWRkYmQ4MCBncCA6IGZmZmZmZmUw
MDEwZTJjNzAgdHAgOiBmZmZmZmZlMDgwMGQ0N2MwIHQwIDogZmZmZmZmZTAwMTAxODYyMAo+PiAg
IHQxIDogMDAwMDAwMDAwMDAwMDA2NCB0MiA6IDAwMDAwMDAwMDAwMDAwMGEgczAgOiBmZmZmZmZl
MDgxZGRiZGEwIHMxIDogMDAwMDAwMDAwMDAwMDI3MCBhMCA6IDAwMDAwMDAwMDAwMDAwMmUgYTEg
OiBmZmZmZmZlMDAwYmFhZjkwCj4+ICAgYTIgOiAwMDAwMDAwMDAwMDAwMDEwIGEzIDogMDAwMDAw
MDAwMDAwMDAwMSBhNCA6IDFkYjkzZTMzM2QxZTEyMDAgYTUgOiAxZGI5M2UzMzNkMWUxMjAwIGE2
IDogMDAwMDAwMDAwMDAwMDAzMCBhNyA6IGZmZmZmZmZmZmZmZmZmZmYKPj4gICBzMiA6IDAwMDAw
MDAwMDAwMDAwMDAgczMgOiBmZmZmZmZlMDAwYjlhYzgwIHM0IDogZmZmZmZmZTA4MWQ5ZjAwMCBz
NSA6IDAwMDAwMDAwMDAwMDAwNDggczYgOiAwMDAwMDAwMDAwMDAwMDBjIHM3IDogZmZmZmZmZTA4
MWRkYmU4MAo+PiAgIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAwYjE2ODgg
czEwOiAwMDAwMDAwMDAwMDk5ZGM4IHMxMTogMDAwMDAwM2ZmZmJkOWZhMiB0MyA6IDFkYjkzZTMz
M2QxZTEyMDAgdDQgOiAwMDAwMDAwMDAwMDAwMDAyCj4+ICAgdDUgOiAwMDAwMDAzZmY3NzhlYWM4
IHQ2IDogZmZmZmZmZTA4MWRkYmFjOHN0YXR1czogMDAwMDAwMDAwMDAwMDEyMCBiYWRhZGRyOiAw
MDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4+Cj4+IEFmdGVyOgo+PiBl
cGM6IGZmZmZmZmUwMDA4ZGMyM2UgcmEgOiBmZmZmZmZlMDAwOGRjMjNjIHNwIDogZmZmZmZmZTA4
MjIxYmQ4MAo+PiBncCA6IGZmZmZmZmUwMDEwZTJjNzAgdHAgOiBmZmZmZmZlMDgxY2IxZWMwIHQw
IDogZmZmZmZmZTAwMTAxODYyMAo+PiB0MSA6IDAwMDAwMDAwMDAwMDAwNjQgdDIgOiAwMDAwMDAw
MDAwMDAwMDBhIHMwIDogZmZmZmZmZTA4MjIxYmRhMAo+PiBzMSA6IDAwMDAwMDAwMDAwMDAyNzAg
YTAgOiAwMDAwMDAwMDAwMDAwMDJlIGExIDogZmZmZmZmZTAwMGJhYWZiOAo+PiBhMiA6IDAwMDAw
MDAwMDAwMDAwMTAgYTMgOiAwMDAwMDAwMDAwMDAwMDAxIGE0IDogZWVlNGEzZGU1Y2I4MTcwMAo+
PiBhNSA6IGVlZTRhM2RlNWNiODE3MDAgYTYgOiAwMDAwMDAwMDAwMDAwMDMwIGE3IDogZmZmZmZm
ZmZmZmZmZmZmZgo+PiBzMiA6IDAwMDAwMDAwMDAwMDAwMDAgczMgOiBmZmZmZmZlMDAwYjlhY2E4
IHM0IDogZmZmZmZmZTA4MWQ1MjAwMAo+PiBzNSA6IDAwMDAwMDAwMDAwMDAwNDggczYgOiAwMDAw
MDAwMDAwMDAwMDBjIHM3IDogZmZmZmZmZTA4MjIxYmU4MAo+PiBzOCA6IDAwMDAwMDAwMDAwMDAw
MDAgczkgOiAwMDAwMDAwMDAwMGIxNjg4IHMxMDogMDAwMDAwMDAwMDA5OWRjOAo+PiBzMTE6IDAw
MDAwMDNmZmZlMzNmYTIgdDMgOiBlZWU0YTNkZTVjYjgxNzAwIHQ0IDogMDAwMDAwMDAwMDAwMDAw
Mgo+PiB0NSA6IDAwMDAwMDNmY2M0NTRhYzggdDYgOiBmZmZmZmZlMDgyMjFiYWM4Cj4+IHN0YXR1
czogMDAwMDAwMDAwMDAwMDEyMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAw
MDAwMDAwMDAwMDBkCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
