Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7007C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 09:17:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B8D64F4D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 09:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B8D64F4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qQmkv/2m6t0qun/ot+EW11TwU/zQse+OUyyDz1PpntU=; b=rIhbWeTt1eoJRY1/wh/xvZcl+
	mGQH2TUTaQ7fzfj7MNyDIRO0xVmhbkDtBBxcltGLE/aw69OKr9KSI8csEaW+qCsoWC5m9Lmpho8BA
	gC+YWvtpOfxw+yVSPzmScMYbOiIavB0aRsSZsbMFs1Sj9nhwbT8pwmB6YMYHmdgbU7x4D+7uW5UuH
	ixbqrNLGqyM4AnjmSNHEe6YyELq8SU47wyU0S2+JR9BxZeogQIL09pH6lsVb5jWGWmaiqtgdchyEz
	XO7v5/HfiTBXEHEHFCdTu1aL9EYkF5o1KQs8Egnyl26PMgD4XogrRtctzHuz21AexvMcJTWzEWiNp
	JjoZ0zGvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7alp-0007lh-FT; Thu, 04 Feb 2021 09:17:49 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7all-0007lB-EB
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 09:17:47 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DWXwJ00V6zMVS6;
 Thu,  4 Feb 2021 17:15:59 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 4 Feb 2021 17:17:35 +0800
Subject: Re: [PATCH -next] RISCV: Add some depends for NUMA
To: Atish Patra <atishp@atishpatra.org>
References: <20210203142343.59781-1-wangkefeng.wang@huawei.com>
 <CAOnJCULd0=FoQjorjmz6EVB7_YphjGBwUCuY+ntOP6JiUb4P6w@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <80f2821a-1c08-ce16-b7a9-7d2debc7f16e@huawei.com>
Date: Thu, 4 Feb 2021 17:17:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCULd0=FoQjorjmz6EVB7_YphjGBwUCuY+ntOP6JiUb4P6w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_041746_236416_C091C5E1 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMi80IDM6NTksIEF0aXNoIFBhdHJhIHdyb3RlOgo+IE9uIFdlZCwgRmViIDMsIDIw
MjEgYXQgNjoyMCBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdy
b3RlOgo+PiBUaGUgbnVtYSBmZWF0dXJlIGlzIHVzZWxlc3MgZm9yIHJpc2N2MzIgcGxhdGZvcm0o
TUFYUEhZU01FTV8xR0IgaWYgMzJiaXQpLAo+PiBhbmQgaXQgc2hvdWxkIGRlcGVuZHMgb24gU01Q
IGZlYXR1cmUsIHRoaXMgYWxzbyBmaXggdGhlIGJ1aWxkIGVycm9yLAo+Pgo+PiAgICByaXNjdjY0
LWJ1aWxkcm9vdC1saW51eC1nbnUtbGQ6IG1tL3BhZ2VfYWxsb2MubzogaW4gZnVuY3Rpb24gYC5M
MCAnOgo+PiAgICBwYWdlX2FsbG9jLmM6KC50ZXh0KzB4NDgwOCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYG5vZGVfcmVjbGFpbV9kaXN0YW5jZScKPj4KPiBUaGFua3MgZm9yIHRoZSBmaXguIFRo
ZSBjb21taXQgdGV4dCBpcyBhIGJpdCBhbWJpZ3VvdXMuIFRoZQo+IGNvbXBpbGF0aW9uIGlzc3Vl
IGVycm9yIGlzIGR1ZSB0byBTTVAuCj4gUlYzMiBkZXBlbmRlbmN5IGlzIGp1c3QgYW5vdGhlciBm
aXggIGFzIE5VTUEgaXMgbm90IHZlcnkgdXNlZnVsIGZvciBSVjMyLgoKWWVzLCB0aGUgdHdvIGRl
cGVuZHMgZml4IGRpZmZlcmVudCBpc3N1Ze+8jHRoZSBsYWNrIG9mIFNNUCBsZWFkcyB0byB0aGUg
CmNvbXBpbGF0aW9uIGlzc3VlLMKgIGFub3RoZXIKCmRlcGVuZCBpcyB0byByZW1vdmUgc3VwcG9y
dCBvbiBSVjMyLgoKVGhhbmtzIGZvciB5b3VyIHJldmlldywgaWYgbmVjZXNzYXJ5LCBJIGNvdWxk
IHJlc2VuZCB3aXRoIGNoYW5nZWxvZyAKdXBkYXRlZC4KCj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBh
dHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
