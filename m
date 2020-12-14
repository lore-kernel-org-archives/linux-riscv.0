Return-Path: <SRS0=dKKk=FS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500C3C4361B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6AE22A99
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6AE22A99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wdo+xyl1/+3JNRtSksc6E2z5WPRMRrrkjP+jvn01Lvc=; b=QGxaHiqaieM+Rsu7cGrOOc8z6
	Qul3YuoylqmGwdbDi00p6lykclN5QMGto5iTToQC5D/MGEUaWWS/j7I9FXbT5YQvs4uj0PlFcHw//
	3WuUdR54po/ttYC7WJ1pP/x7aIYrfIioBzA7PZKbCf9PCsM9PPUWlQzShi0TAKgGVJ/VwD6e8WlVp
	kAvg4l9ErzTpgyseGC7XlwtGcSBmf0N96y0TMJp/5D3z390od5t+FhGjDBs/Z+dyBj1XtycKZGHNb
	GiApHCsJU/HyIf2ebKWuMvgBkc9SZHfJYOENmln8VR28uGvMRwRAUjoirWnaOXo5eqRPP6np40JJu
	tuIrws0tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kom3s-0002Pa-DU; Mon, 14 Dec 2020 11:30:40 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kom3n-0002Ow-N4
 for linux-riscv@lists.infradead.org; Mon, 14 Dec 2020 11:30:37 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CvfLn1HvZzhsmN;
 Mon, 14 Dec 2020 19:29:53 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 19:30:19 +0800
Subject: Re: [PATCH] riscv: Drop a duplicated PAGE_KERNEL_EXEC
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
References: <20201111115216.31447-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <60ad2faf-87d1-4db9-00f3-c1a380706b5f@huawei.com>
Date: Mon, 14 Dec 2020 19:30:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201111115216.31447-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_063036_000472_577D4F33 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLMKgIGtpbmRseSBwaW5nLi4KCk9uIDIwMjAvMTEvMTEgMTk6NTIsIEtlZmVuZyBX
YW5nIHdyb3RlOgo+IGNvbW1pdCBiOTE1NDBkNTJhMDggKCJSSVNDLVY6IEFkZCBFRkkgcnVudGlt
ZSBzZXJ2aWNlcyIpIGFkZAo+IGEgZHVwbGljYXRlZCBQQUdFX0tFUk5FTF9FWEVDLCBraWxsIGl0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWku
Y29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxIC0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+IGluZGV4IDE4M2YxZjRiMmFlNi4uNzNlOGI1ZTViYjY1IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPiBAQCAtOTksNyArOTksNiBAQAo+ICAgCQkJCXwgX1BBR0VfRElSVFkpCj4g
ICAKPiAgICNkZWZpbmUgUEFHRV9LRVJORUwJCV9fcGdwcm90KF9QQUdFX0tFUk5FTCkKPiAtI2Rl
ZmluZSBQQUdFX0tFUk5FTF9FWEVDCV9fcGdwcm90KF9QQUdFX0tFUk5FTCB8IF9QQUdFX0VYRUMp
Cj4gICAjZGVmaW5lIFBBR0VfS0VSTkVMX1JFQUQJX19wZ3Byb3QoX1BBR0VfS0VSTkVMICYgfl9Q
QUdFX1dSSVRFKQo+ICAgI2RlZmluZSBQQUdFX0tFUk5FTF9FWEVDCV9fcGdwcm90KF9QQUdFX0tF
Uk5FTCB8IF9QQUdFX0VYRUMpCj4gICAjZGVmaW5lIFBBR0VfS0VSTkVMX1JFQURfRVhFQwlfX3Bn
cHJvdCgoX1BBR0VfS0VSTkVMICYgfl9QQUdFX1dSSVRFKSBcCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
