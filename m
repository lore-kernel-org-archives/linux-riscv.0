Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E1BC433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 19:51:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF5061159
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 19:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF5061159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lv2qhk2DBQag+NWobp5iDt2endDWEL7UWarQRJ92YjE=; b=aHXTHN4MDC5F1byGl9XftJ2z7
	ApALzzL4hRgpi2LA6D/t5Z9GkquLeFr7+M6p1djuDs0CNxHIHUsNLOKuJD84cpxYukvN9YIye1mGN
	WYcd8QmTVJwV/F6dV4HvUO5/rPN0pT7gAi2wvl9bCCjKjRnXyeJou2yN2YJgpoKchp9EddnorBYHT
	iTwDuJ3GHG+LywahO7i8NyLZYLdUOhTrD+oo6se2FT6bdJUbT1nf0DLT/aVBargIkA/Tqt3sp3aK7
	DDnXnku5jY4QbOykvIOf93HEoMuDFDIQDFVlBtPdpk0hg/Ag5edf9wvuJJhJJ+6xV5ViU9JXv/0q7
	Ry+aw/CVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUECW-005scb-M2; Wed, 07 Apr 2021 19:50:56 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUECQ-005sc4-13
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 19:50:54 +0000
Received: by mail-oi1-x235.google.com with SMTP id w70so20036719oie.0
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/6KYvi3qxRc6jQvr4Dp41laAk9y6iyvnOJ43zRUQVDs=;
 b=uMkSxAToTLC2pzNL2A1x2wHmlIPTWtxcS1voRqMd4Wk2cE46uuQ7CmmXoD0JOuyqs3
 j/r0v8HGBIUbdx9KJhzFTPBgwxULt9abG2boBigiWj6wq7Y5a2g+MTn9lwCslBJAFSSR
 QtSYtOj8NU2fJW44APqVse3qTz83MbIraafH5x/GUZ/N7W6mgTWaj9EmmwSXDyFBkxwN
 2JEKRMuJjRTE31eCYpYtlsO3t77N0npLqjK3Tf0enfqNZnvYdL/JJMlqo9upiPJAgcCS
 iFDueF1/k/mFno3kVcSmYVIkS1rnmhCagU6n7O5wZVkMTnDidjrh8Zv2mk9ZwPvvTaAp
 1uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/6KYvi3qxRc6jQvr4Dp41laAk9y6iyvnOJ43zRUQVDs=;
 b=NuuRgLgZPb0jF6gYs8UHBTTYmnW4aZDS0map2hnWFaSLlpE0M4nqQhllwTaxXDDys2
 cOMCTDm7o7OUe9yUHndy/MM1gJXv1pQELskYIlAAOJqIyv8aL1701+qMNTY2RFlNaBV9
 keleMCruw+C6ARSyOqn3RJvfQL5qOL+i/xPjQx859yJHnYuklI0GR0az8J5XzXLuXP1H
 fHXR1CvH7kZQR063WhKZVqCrdzIVtOOVL5cy4uFpV9wFHmTUL3qOXCT0V3eseFrDAjp1
 Io7KoyAEVfYtf1cvaEP5q3eGj+nNAOe5Kt68U635gQJzQbE8avt1fIXVEb7gYyJZ9ZNP
 F4Bw==
X-Gm-Message-State: AOAM531ZBg5+j7np7Srr5iVVHlLOOmh9VExkEppt3AnYMxxB+87plFqX
 WlSKQuhdQTM96Xioe3gkh1JoeKlLlMYW3IppU++Av8t7ZyLQJOTP
X-Google-Smtp-Source: ABdhPJwgDlWh7b9fwq5CxJcqk+iLb58LoK/PouPKlTof9Xft/P6tcdH2xc6ZBnvV9eIhMlUmggxqiokqoy1vOC0BVj8=
X-Received: by 2002:a05:6808:1cb:: with SMTP id
 x11mr3375444oic.89.1617825048444; 
 Wed, 07 Apr 2021 12:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
 <20210407094224.GA3393992@infradead.org>
 <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
 <YG3XDnNc+GaW1Tz4@hirez.programming.kicks-ass.net>
In-Reply-To: <YG3XDnNc+GaW1Tz4@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Wed, 7 Apr 2021 21:50:37 +0200
Message-ID: <CAHB2gtRGMizmWsv+Quf1jA=mzj6-jD5Rgz-XX2jQuR4dn3oDgQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_205051_920769_87E099A9 
X-CRM114-Status: GOOD (  19.66  )
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

T24gV2VkLCBBcHIgNywgMjAyMSBhdCA2OjAwIFBNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciAwNywgMjAyMSBhdCAwNDoyOToxMlBN
ICswMjAwLCBDaHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiBSSVNDLVYgZGVmaW5lcyBMUi9T
QyBsb29wcyBjb25zaXN0aW5nIG9mIHVwIHRvIDE2IGluc3RydWN0aW9ucyBhcwo+ID4gY29uc3Ry
YWluZWQgTFIvU0MgbG9vcHMuICBTdWNoIGNvbnN0cmFpbmVkIExSL1NDIGxvb3BzIHByb3ZpZGUg
dGhlCj4gPiByZXF1aXJlZCBmb3J3YXJkIGd1YXJhbnRlZXMsIHRoYXQgYXJlIGV4cGVjdGVkIChz
aW1pbGFyIHRvIHdoYXQgb3RoZXIKPiA+IGFyY2hpdGVjdHVyZXMsIGxpa2UgQUFyY2g2NCwgaGF2
ZSkuCj4KPiBUaGUgdGV4dCBxdW90ZWQgYnkgb3RoZXJzIGRpZG4ndCBzZWVtIHRvIHNheSBzdWNo
IGEgdGhpbmcsIGJ1dCB3aGF0ZXZlci4KClRoZSBSSVNDLVYgdW5wcml2IHNwZWMgaXMgcHVibGlj
IGNhbiBiZSBmb3VuZCBoZXJlOgpodHRwczovL3Jpc2N2Lm9yZy90ZWNobmljYWwvc3BlY2lmaWNh
dGlvbnMvClZlcnNpb24gMjAxOTEyMTMgZGlzY3Vzc2VzIExSL1NDLWxvb3BzIGluIHNlY3Rpb24g
OC4zIChwYWdlIDUxKS4KU28gaW4gY2FzZSB5b3UgYXJlIGludGVyZXN0ZWQgaW4gdGhlIGV4YWN0
IHdvcmRpbmcsIHlvdSBjYW4gZmluZCBpdCB0aGVyZS4KCj4gPiBXaGF0IFJJU0MtViBkb2VzIG5v
dCBoYXZlIGlzIHN1Yi13b3JkIGF0b21pY3MgYW5kIGlmIHJlcXVpcmVkLCB3ZQo+ID4gd291bGQg
aGF2ZSB0byBpbXBsZW1lbnQgdGhlbSBhcyBMTC9TQyBzZXF1ZW5jZXMuIEFuZCB5ZXMsIHVzaW5n
IGF0b21pYwo+ID4gaW5zdHJ1Y3Rpb25zIGlzIHByZWZlcnJlZCBvdmVyIHVzaW5nIExML1NDLAo+
Cj4gKHBzdWRvIGFzbSwgY2FuJ3QgYmUgYm90aGVyZWQgdG8gZmlndXJlIG91dCB0aGUgYWN0dWFs
IHN5bnRheCkKPgo+ICAgICAgICAgIyBzZXR1cCByX2FuZF9tYXNrLCByX29yX21hc2sKPgo+IC5M
MQo+ICAgICAgICAgTEwgciwgW3dvcmRdCj4gICAgICAgICBBTkQgciwgciwgcl9hbmRfbWFzawo+
ICAgICAgICAgT1Igciwgciwgcl9vcl9tYXNrCj4gICAgICAgICBTQyByLCBbd29yZF0KPiAgICAg
ICAgIEpORSAuTDEKCkkgZnVsbHkgYWdyZWUgd2l0aCB0aGlzLgpJJ3ZlIGltcGxlbWVudGVkIGEg
cGF0Y2ggZm9yIHRoYXQgdHdvIHdlZWtzIGFnbyB1c2luZyB0aGUgZm9sbG93aW5nIGhlbHBlcjoK
CisvKgorICogTWFzayBhbmQgc2V0IGdpdmVuIGJpdHMgYXQgYSBnaXZlbiBhZGRyZXNzIGF0b21p
Y2FsbHkuCisgKiBUaGUgbWFza2VkIG9sZCB2YWx1ZSB3aWxsIGJlIHJldHVybmVkLgorICovCitz
dGF0aWMgaW5saW5lIHUzMiBhdG9taWNfbWFza19hbmRfc2V0KHUzMiogcCwgdTMyIG1hc2ssIHUz
MiB2YWwpCit7CisgICAgICAgdTMyIHJldCwgdG1wOworICAgICAgIF9fYXNtX18gX192b2xhdGls
ZV9fICgKKyAgICAgICAgICAgICAgICIwOiAgICAgbHIudyAlMCwgJTJcbiIKKyAgICAgICAgICAg
ICAgICIgICAgICAgYW5kICAlMCwgJTAsICUzXG4iCisgICAgICAgICAgICAgICAiICAgICAgIG9y
ICAgJTEsICUwLCAlNFxuIgorICAgICAgICAgICAgICAgIiAgICAgICBzYy53ICUxLCAlMSwgJTJc
biIKKyAgICAgICAgICAgICAgICIgICAgICAgYm5leiAlMSwgMGJcbiIKKyAgICAgICAgICAgICAg
IDogIismciIocmV0KSwgIj0mciIgKHRtcCksICIrQSIoKnApCisgICAgICAgICAgICAgICA6ICJy
IiAobWFzayksICJySiIodmFsKQorICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7CisgICAgICAg
cmV0dXJuIHJldDsKK30KCkhvd2V2ZXIsIEd1byBwdXNoZWQgb3V0IGEgbmV3IHBhdGNoc2V0IGlu
IGJldHdlZW4gYW5kIEkgZGVjaWRlZCB0byBub3QgY29udGludWUKbXkgYXBwcm9hY2ggdG8gbm90
IHVuZGVybWluZSBoaXMgYXBwcm9hY2guCgpJIHdpbGwgc3luYyB1cCB3aXRoIEd1byB0byBwcm92
aWRlIGEgY29tbW9uIHBhdGNoc2V0LgoKVGhhbmtzLApDaHJpc3RvcGgKCj4gaXMgd2hhdCB5b3Ug
bmVlZCBmb3IgTEwvU0MgYmFzZWQgeGNoZzE2LCB0aGF0J3MgbGVzcyB0aGFuIDE2Cj4gaW5zdHJ1
Y3Rpb25zLiBJZiBSSVNDLVYgZ3VhcmFudGVlcyBmd2QgcHJvZ3Jlc3Mgb24gdGhhdCwgZ29vZCwg
d3JpdGUgaXQKPiBsaWtlIHRoYXQgYW5kIGxldHMgZW5kIHRoaXMgdGhyZWFkLgo+Cj4gVGhlIGZh
Y3QgdGhhdCB0aGlzIGlzIGFwcGFyZW50bHkgaGFyZCwgaXMgbm90IGdvb2QuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
