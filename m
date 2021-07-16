Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6857EC636C9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:15:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FFC613E0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21FFC613E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHVQN7/GSXaDhDmdFkMHUMem+/XhmpjmyKMpHUsyCek=; b=BzKsMhlWRXd9Dr
	5319s1Q5zE9q3jE/BrBH/jfY3ZY2dvBJWgsIdi7AVh+0H+T7emv0ksIDYKdWmdpSgLEIsF+feIKes
	1XfL6y3HcOPUF0JhZaP8Cs19/NFB2hw3t2olpGshkviVc441BbQsc3vHN71YfT7FdhmgkJoWnTGQS
	u2l40nqX6FgDQ4umsfHiOAM6j8fCfeGG4mYMxU1wtLE+Tb2JODMT5uZ9H99ihTv7fgHrUGYwAu58a
	ovANWMKvAae6WP6ZrAhPGL1hVKHcVhIsU/vleLqB6X2hDeEW72hOw5ykjMgWl8KZeFnSbLPItcVkl
	4eRncI5UNGoSjOeedL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4DNN-002szl-E8; Fri, 16 Jul 2021 02:14:53 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4DN4-002szC-2o
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 02:14:35 +0000
Received: by mail-yb1-xb36.google.com with SMTP id c16so5606063ybl.9
 for <linux-riscv@lists.infradead.org>; Thu, 15 Jul 2021 19:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bDpz3xiBhEz0ZZ2vw/9YGDuwg2vaRKleCOGcjaj3zg4=;
 b=XaId+1qnRj2oNBeX0nz4OjboMoi0KPWUrc9e8pe/yfJdlg4lWqivxBZc2+1h4QdWbK
 yswl4M0mPayEhwrTlL1pWmAt8UpG/rzL71rzXBqpJPt+xiU8GeKPRQbvS6kbltJiUdJa
 b188EH4ApBzyF+jreycjfVEEHOIscxtViw0jQDBpG8mFWFyBGhJOHP7Kd9/cvmQuM5Jp
 XgyW0dWFaEmpBZBK5NGTnUgFqq0UHgiZ2Q7yGqEHZj0k1RPbaCXFjbkaCrGgIRWk/Hrs
 YG9nWZVh55IJJuS15fkNrnN/PytpMAPNWQybCGle4p/OfulLibTwplqNZTCVLQEDFx2e
 oR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bDpz3xiBhEz0ZZ2vw/9YGDuwg2vaRKleCOGcjaj3zg4=;
 b=MIzEQtcY1z77gVHEC0azxyKkWpOAnSva12bXwjqZxgg2ThBgINC0blChMVDNBpw+oI
 le9RcTzPJ84CtRXYxDuUzHvSV6MRNetuxtU7AcGYkKoO+M7F/OipuHXH1yI+YLGS1LwX
 23b6h/zP/NOY3yTvCLHgkJINxjEj1N7R1ye6HOOJQJ6u/Ce/Jw4eQkvmmjmDmqCyIcAi
 fUiQhf5i5L4elmre8eKuMcQ4YO1zb6j7x+lTLG65jX0IQlTkdzESMV+JCBMrXx9w+ryR
 yAbywzpP+WvARsAKEnxw2xrBnQ0a2oPBpkeyXAvrDKtHmTtRvlnXU2UJozQ+UA7plyM6
 oLAg==
X-Gm-Message-State: AOAM532MClKA2sHCYNQATCE/LXwlkbkG2H4X2NTgIW3/gj9j5yqgUREV
 ZbSnC0GMhw9X2n+CCsJ0iX3tCK47cCjaaq024zM=
X-Google-Smtp-Source: ABdhPJzw92hfvOr8tCGDvjfAYyHupxas+W5zP3mI0mOwj/Sbm57yeTdrS56J7ejmHTJIDHhU8zMdkIkAscRyeR4tmpM=
X-Received: by 2002:a25:df11:: with SMTP id w17mr9327459ybg.314.1626401672149; 
 Thu, 15 Jul 2021 19:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
 <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
 <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
 <CAEUhbmUvDSocWobb26PcrV6vi6kHjg8o6pNomt9AnGWGbvAuhw@mail.gmail.com>
 <94a92009-ce49-bbe4-794c-0631520e4c3d@huawei.com>
 <CAEUhbmX8a+rjc4=5QfR4MivMMx-T_7KDq-QHtmrGsVL2VqLQAA@mail.gmail.com>
 <CAEUhbmVQPYQSuYLaTRY112TpUB9g-KfCEREGODxNivHhnWNb_Q@mail.gmail.com>
In-Reply-To: <CAEUhbmVQPYQSuYLaTRY112TpUB9g-KfCEREGODxNivHhnWNb_Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Jul 2021 10:14:20 +0800
Message-ID: <CAEUhbmVO_dV86LJLz3S4PFu9oFp4_5HWSkKLwqc-ZkQK=yYZfw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_191434_185004_9E6EB391 
X-CRM114-Status: GOOD (  30.16  )
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

T24gVGh1LCBKdWwgOCwgMjAyMSBhdCA5OjI5IFBNIEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gSGkgUGFsbWVyLAo+Cj4gT24gVGh1LCBKdWwgMSwgMjAyMSBhdCAxMDoy
MCBBTSBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IEp1bCAxLCAyMDIxIGF0IDEwOjA4IEFNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+Cj4gPiA+IE9uIDIwMjEvNi8zMCAxOTo1OCwgQmlu
IE1lbmcgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgMTE6MjEgQU0gQmlu
IE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4+IE9uIE1vbiwgSnVuIDI4
LCAyMDIxIGF0IDEwOjI4IEFNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gT24gMjAyMS82LzI4IDk6MTUsIEJpbiBNZW5n
IHdyb3RlOgo+ID4gPiA+Pj4+IE9uIE1vbiwgSnVuIDI4LCAyMDIxIGF0IDg6NTMgQU0gS2VmZW5n
IFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToKPiA+ID4gPj4+Pj4gSGnv
vIwgc29ycnkgZm9yIHRoZSBtaXN0YWtl77yMdGhlIGJ1ZyBpcyBmaXhlZCBieQo+ID4gPiA+Pj4+
Pgo+ID4gPiA+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDYw
MjA4NTUxNy4xMjc0ODEtMi13YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbS8KPiA+ID4gPj4+PiBX
aGF0IGFyZSB3ZSBvbiB0aGUgcGF0Y2ggeW91IG1lbnRpb25lZD8KPiA+ID4gPj4+Pgo+ID4gPiA+
Pj4+IEkgZG9uJ3Qgc2VlIGl0IGFwcGxpZWQgaW4gdGhlIGxpbnV4L21hc3Rlci4KPiA+ID4gPj4+
Pgo+ID4gPiA+Pj4+IEFsc28gdGhlcmUgc2hvdWxkIGJlIGEgIkZpeGVzIiB0YWcgYW5kIHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcgY2MnZWQKPiA+ID4gPj4+PiBiZWNhdXNlIDMyLWJpdCBpcyBicm9r
ZW4gc2luY2UgdjUuMTIuCj4gPiA+ID4+PiBodHRwczovL2tlcm5lbC5nb29nbGVzb3VyY2UuY29t
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC8rL2M5ODExZTM3OWIyMTFjNjdi
YTI5ZmIwOWQ2ZjY0NGRkNDRjZmNmZjIKPiA+ID4gPj4+Cj4gPiA+ID4+PiBpdCdzIG9uIFBhbG1l
cicgcmlzY3YtbmV4dC4KPiA+ID4gPj4gTm90IHN1cmUgcmlzY3YtbmV4dCBpcyBmb3Igd2hpY2gg
cmVsZWFzZT8gVGhpcyBpcyBhIHJlZ3Jlc3Npb24gYW5kCj4gPiA+ID4+IHNob3VsZCBiZSBvbiA1
LjEzLgo+ID4gPiA+Pgo+ID4gPiA+Pj4gSGkgUGFsbWVyLCBzaG91bGQgSSByZXNlbmQgb3IgY291
bGQgeW91IGhlbHAgbWUgdG8gYWRkIHRoZSBmaXhlcyB0YWc/Cj4gPiA+ID4gWW91ciBwYXRjaCBt
aXhlZCAyIHRoaW5ncyAoZml4IHBsdXMgb25lIGZlYXR1cmUpIHRvZ2V0aGVyLCBzbyBpdCBpcwo+
ID4gPiA+IG5vdCBwcm9wZXIgdG8gYmFjayBwb3J0IHlvdXIgcGF0Y2guCj4gPiA+Cj4gPiA+ICJt
ZW09IiB3aWxsIGNoYW5nZSB0aGUgcmFuZ2Ugb2YgbWVtYmxvY2ssIHNvIHRoZSBmaXggcGFydCBt
dXN0IGJlIGluY2x1ZGVkLgo+ID4gPgo+ID4KPiA+IFllcywgc28geW91IGNhbiByZWJhc2UgdGhl
ICJtZW09IiBjaGFuZ2VzIG9uIHRvcCBvZiBteSBwYXRjaC4KPiA+Cj4gPiBUaGUgcHJhY3RpY2Ug
aXMgdGhhdCB3ZSBzaG91bGQgbm90IG1peCAyIHRoaW5ncyBpbiBvbmUgcGF0Y2guIEkgY2FuCj4g
PiBpbWFnaW5lIHRoYXQgeW91IHdhbnRlZCB0byBhZGQgIm1lbT0iIHRvIFJJU0MtViBhbmQgc3Vk
ZGVubHkgZm91bmQgdGhlCj4gPiBleGlzdGluZyBsb2dpYyB3YXMgYnJva2VuLCBzbyB5b3Ugc2Vu
dCBvbmUgcGF0Y2ggdG8gZG8gYm90aC4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBIZXJlIGlz
IG15IDIgY2VudHM6Cj4gPiA+ID4KPiA+ID4gPiAxLiBEcm9wIHlvdXIgcGF0Y2ggZnJvbSByaXNj
di1uZXh0Cj4gPiA+ID4gMi4gQXBwbHkgbXkgcGF0Y2ggYXMgaXQgaXMgYSBzaW1wbGUgZml4IHRv
IHByZXZpb3VzIGNvbW1pdC4gVGhpcwo+ID4gPiA+IGFsbG93cyBzdGFibGUga2VybmVsIHRvIGNo
ZXJyeS1waWNrIHRoZSBmaXggdG8gdjUuMTIgYW5kIHY1LjEzLgo+ID4gPiA+IDMuIFJlYmFzZSB5
b3VyIHBhdGNoIGFnYWluc3QgbWluZSwgYW5kIHJlc2VuZCB2Mgo+ID4gPiA+Cj4gPiA+ID4gTGV0
IG1lIGtub3cgaWYgdGhpcyBtYWtlcyBzZW5zZS4KPiA+ID4KPiA+ID4gSXQgaXMgbm90IGEgYmln
IHByb2JsZW0gZm9yIG1lLCBidXQgSSBoYXZlIG5vIHJpZ2h0IGFib3VydCByaXNjdi1uZXh0LAo+
ID4gPgo+ID4gPiBsZXQncyB3YWl0IFBhbG1lcidzIGFkdmlzZS4KPiA+ID4KPiA+Cj4gPiBTdXJl
LiBQYWxtZXIsIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuCj4KPiBQaW5nPwoKUGluZz8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
