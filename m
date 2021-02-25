Return-Path: <SRS0=t5Vp=H3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C5AC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 01:29:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC24264EF1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 01:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC24264EF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T3LVK9/g0UAop6TR1DLBmb2iXWey1mDGJmrSXo04RQs=; b=EkNyB2egfu7POW3bJDwudNHOD
	Aig0gHNjUlGqKyJXl26sjd6u2F3UtvmUTMix01Nk5Y/CBcc+W/y+X/hdoawb8aj6IoDtFh74r9qrL
	RT618RLO5ySxJ2NyL1F8J37ZUEhYNBvxs0OAea0zdhfWt5atYBG66HRbYuU9s2y3Ai3Kpp1NbvgLl
	Um5UgU43PnDbeWvzz5NvoRxT1+sgWcW7a5AVeYA0KnTVALyK8NX2VzUT0LGMftI851/yv4kIgH1jl
	6rFA8dtIQdHf0uVmQsoN6eE9L6MghwfzC5sN/3SFUCB2+sbMmA+LH3dSreIMlw6BsvpMDKBwlWm/n
	FsAQaE8fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF5Sn-0006YG-4P; Thu, 25 Feb 2021 01:29:09 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF5Sj-0006Xo-MI
 for linux-riscv@lists.infradead.org; Thu, 25 Feb 2021 01:29:07 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmFWK6TSbzMc0V;
 Thu, 25 Feb 2021 09:26:53 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 09:28:51 +0800
Subject: Re: question about RISCV EFI stub support
To: Atish Patra <atishp@atishpatra.org>
References: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
 <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <89b97904-e069-35cd-0a42-217cafe17e15@huawei.com>
Date: Thu, 25 Feb 2021 09:28:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_202906_007901_4EF151AD 
X-CRM114-Status: GOOD (  16.55  )
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
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMi8yNSA3OjM1LCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiBXZWQsIEZlYiAyNCwg
MjAyMSBhdCAzOjE0IEFNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4g
d3JvdGU6Cj4+IEhpIEF0aXNoIGFuZCBBcmQsCj4+Cj4+IFRoZSBjb21taXQgImNiN2QyZGQ1NjEy
YSBSSVNDLVY6IEFkZCBQRS9DT0ZGIGhlYWRlciBmb3IgRUZJIHN0dWIiIHVzZQo+PiBjLmxpIHRv
Cj4+Cj4+IGFkZCBNYWdpYyAiTVoiIHNpZ25hdHVyZSBmb3IgUEUvQ09GRiBoZWFkZXIsIHdoaWNo
IHNlbGVjdCBSSVNDVl9JU0FfQywKPj4gYnV0ICJDIgo+Pgo+PiB0byB0aGUgSVNBIGlzIG9wdGlv
bmFsLCAgYW5kIGlmICJDIiBpcyBub3Qgc3VwcG9ydCAsICBFRkkgYm9vdCBpcyBub3QKPj4gc3Vw
cG9ydGVkLgo+Pgo+PiBDb3VsZCB3ZSB1c2UgIi53b3JkIE1aX01BR0lDIiBsaWtlIHg4NiBjb2Rl
IG9yIHNvbWUgb3RoZXIgd2F5IHRvIHN1cHBvcnQKPj4gIk1aIiBzaWduYXR1cmU/Cj4+Cj4gLndv
cmQgd29uJ3Qgd29yayBidXQgLnNob3J0IHdpbGwuIFdpdGggLndvcmQsIHlvdSBlbmQgdXAgMDAw
MCBpbiB0aGUgMgo+IGJ5dGVzIHdoaWNoIGNhbiBiZSBpbnRlcnByZXRlZCBhcyBpbGxlZ2FsIGlu
c3RydWN0aW9uLgpZZXMsIHNob3VsZCB1c2UgIi5zaG9ydCIgaW4gUlYuCj4KPiBJIGd1ZXNzIHlv
dXIgbGFyZ2VyIG9iamVjdGl2ZSBpcyB0byBtYWtlIHRoZSBDIGV4dGVuc2lvbiBvcHRpb25hbCBh
bmQKPiBub3QgZW5hYmxlZCBieSBkZWZhdWx0IGZvciB0aGUgTGludXgga2VybmVsLgoKIkMiIGV4
dGVuc2lvbiBpcyBvcHRpb25hbCwgYW5kIHRoZSB1cHN0cmVhbSBrZXJuZWwgaGFzIHRoZSBSSVND
Vl9JU0FfQyB3aGljaAoKY291bGQgYmUgY29uZmlndXJhYmxlLsKgIGFuZCBJIHRoaW5rIHRoZSBF
RklfU1RVQiBzaG91bGQgbm90IGRlcGVuZCBvciAKc2VsZWN0IGl0LAoKYW5kIG1heWJlIHdlIG9u
bHkgd2FudCB0byBzdXBwb3J0IFJWNjRHIGluIHNvbWUgY2FzZXMswqAgd2hhdCdzIHlvdXIgb3B0
aW9uPwoKPiBEbyB5b3UganVzdCB3YW50IGl0IGZvciBhIGN1c3RvbSBrZXJuZWwgb3IgdGhlIHVw
c3RyZWFtIGtlcm5lbCA/Cj4KPj4gVGhhbmtzLAo+Pgo+PiBLZWZlbmcKPj4KPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
