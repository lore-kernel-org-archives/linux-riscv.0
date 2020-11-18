Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1BFC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C8324655
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ocG6c22N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DE4SAyk3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C8324655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fEqm99TWcqoknaRcqTPtUnkU/UKSFRtPn0pNiPcBpvo=; b=ocG6c22N5oupKNrVfWT8lEGDn
	4cjdZLUMeBIhi9xKpNa6MhzMjo4Mf1y4qwba5CeULh3n97+QsMMr5wHxoWy5ZpIi0C3p8CaWS5+2L
	o3M4oGFMuJiS8MzTW28nDNJuhoB53ZP6ynMlplABZPjOfIzlkDuaPmhChE+Wcoax9x36gEhouzVDk
	8FluLnXxvTwcGe3OUJ3ZnP8ffZ2F0yWMofNO+VAsejUkJE+4S9AhpOCzTzpQ8lDGBxl3SEUQBbKoM
	fnp4gkZ9rO82M55TlSsV3VjqhMk2K2D9G7ZpDr7eSctx1zbWS23Hn7oz+dATxRrffM4P2ZXgku5lp
	7kchv1Sxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfGvp-0001B4-TM; Wed, 18 Nov 2020 06:27:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfGvm-00019E-MN
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 06:27:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id u12so1059454wrt.0
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 22:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lXz5B4qekJH/fk2qKK6NBevpB96KXoRz/s7GcLEF5U4=;
 b=DE4SAyk3XORT+kK0N5DWBXmPo3mdQuXKcv5cm9vQVv/HYCaTPMs7PBxfgL1HACzHBq
 axhkBL10gEOWJXh9c19JSHYK0MgqkmD/vrbWb3lOfkGUHhY4TfiLf9wwzA0C5vPKstpz
 0WZ0st23WcIWKtQH4IT1t4s0ffY8h0EPA6Ly85HLJLSgMPkfLJiakA6koh3e99SM/V6H
 nfq29rv+1FQqeTQmSTa3SDdtd40dcUD/IRPNldh6YSC/LjnoEktXHn1zOBItZEjN2m/0
 SAEqqoyclOhJOt2H7GoSgfFnWNZVHnTXena6XwZCN+ZOkNEs3bBi9CMwrjnsjqyUrkiu
 +RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lXz5B4qekJH/fk2qKK6NBevpB96KXoRz/s7GcLEF5U4=;
 b=sQUPX5K+dOgB2bYCgsNsusq7uqi8OMpIGrhDtT7tPdbPbUAeCq2pVW238Lew12/OrL
 OaYLoqtI01DW9sYElo12PvJFU0E3+qyVuH+tlcHWDIkIrsGdOfte81p2zG97wZpmqbsM
 9WbuYDk/vOVI7COLRhMdOsxvPWUNzr1TrAMkXS1EDtJ8Z1Nnb0AemfZq6Nte76X/0D4n
 wGIIIdbucCH0+7ChQCMo3l43xhSZqWH9KvqjPg7v7qp2T3NqyfhKl0X+eLbNMAlGOHZq
 8mmyK6+CU5dT7YsyhfwrTqorFZ0E+prC5yu8//ExPyF85Bu3qu53DGNEaP4xsT3XvBGV
 314A==
X-Gm-Message-State: AOAM532E1447sA/R/nTkKKD5Z11MURWFzjKOQ+6eJRci5oGNhmb6+rsA
 RzWioU7OWVAFtreDIA6HZGyjJxG72UN+tUK7NyY=
X-Google-Smtp-Source: ABdhPJxdy7gCitothb88OWtajGPi5c7klssjgVfpw5G21ZUc+qimbGysM4gJHTZxY9HqJOXMppOMZ8xNiTM228mjW6A=
X-Received: by 2002:adf:f241:: with SMTP id b1mr3080042wrp.248.1605680821480; 
 Tue, 17 Nov 2020 22:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20201117082638.43675-1-bjorn.topel@gmail.com>
 <20201117082638.43675-2-bjorn.topel@gmail.com>
 <CAEf4BzYJRqf4ho3hSmXWi2oTMts69ix8nODcoePmnUfg+jjdbQ@mail.gmail.com>
In-Reply-To: <CAEf4BzYJRqf4ho3hSmXWi2oTMts69ix8nODcoePmnUfg+jjdbQ@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 18 Nov 2020 07:26:49 +0100
Message-ID: <CAJ+HfNgL5a4o-EF3-F21dxsauG0cyNSyuNOp+HsrbXkjWCBG_w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/3] selftests/bpf: Fix broken riscv build
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_012702_879704_73A16FDE 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Luke Nelson <luke.r.nels@gmail.com>,
 Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxOCBOb3YgMjAyMCBhdCAwMjo0MywgQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWkubmFr
cnlpa29AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDE3LCAyMDIwIGF0IDEyOjI4
IEFNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
VGhlIHNlbGZ0ZXN0cy9icGYgTWFrZWZpbGUgaW5jbHVkZXMgc3lzdGVtIGluY2x1ZGUgZGlyZWN0
b3JpZXMgZnJvbQo+ID4gdGhlIGhvc3QsIHdoZW4gYnVpbGRpbmcgQlBGIHByb2dyYW1zLiBPbiBS
SVNDLVYgZ2xpYmMgcmVxdWlyZXMgdGhhdAo+ID4gX19yaXNjdl94bGVuIGlzIGRlZmluZWQuIFRo
aXMgaXMgbm90IHRoZSBjYXNlIGZvciAiY2xhbmcgLXRhcmdldCBicGYiLAo+ID4gd2hpY2ggbWVz
c2VzIHVwIF9fV09SRFNJWkUgKGVycm5vLmggLT4gLi4uIC0+IHdvcmRzaXplLmgpIGFuZCBicmVh
a3MKPiA+IHRoZSBidWlsZC4KPiA+Cj4gPiBCeSBleHBsaWNpdGx5IGRlZmluaW5nIF9fcmlzY194
bGVuIGNvcnJlY3RseSBmb3IgcmlzY3YsIHdlIGNhbgo+ID4gd29ya2Fyb3VuZCB0aGlzLgo+ID4K
PiA+IEZpeGVzOiAxNjczODFmM2VhYzAgKCJzZWxmdGVzdHMvYnBmOiBNYWtlZmlsZSBmaXggIm1p
c3NpbmciIGhlYWRlcnMgb24gYnVpbGQgd2l0aCAtaWRpcmFmdGVyIikKPiA+IFNpZ25lZC1vZmYt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSB8IDMgKystCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvTWFrZWZpbGUKPiA+IGluZGV4IGMxNzA4ZmZhNmIxYy4uOWQ0ODc2OWFkMjY4
IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCj4g
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKPiA+IEBAIC0yMTks
NyArMjE5LDggQEAgJChSRVNPTFZFX0JURklEUyk6ICQoQlBGT0JKKSB8ICQoQlVJTERfRElSKS9y
ZXNvbHZlX2J0ZmlkcyAgXAo+ID4gICMgYnVpbGQgd291bGQgaGF2ZSBmYWlsZWQgYW55d2F5cy4K
PiA+ICBkZWZpbmUgZ2V0X3N5c19pbmNsdWRlcwo+ID4gICQoc2hlbGwgJCgxKSAtdiAtRSAtIDwv
ZGV2L251bGwgMj4mMSBcCj4gPiAtICAgICAgIHwgc2VkIC1uICcvPC4uLj4gc2VhcmNoIHN0YXJ0
cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8uKlwpfC1pZGlyYWZ0ZXIgXDF8
cCB9JykKPiA+ICsgICAgICAgfCBzZWQgLW4gJy88Li4uPiBzZWFyY2ggc3RhcnRzIGhlcmU6Lywv
RW5kIG9mIHNlYXJjaCBsaXN0Li97IHN8IFwoLy4qXCl8LWlkaXJhZnRlciBcMXxwIH0nKSBcCj4g
PiArICAgICAgICQoc2hlbGwgJCgxKSAtZE0gLUUgLSA8L2Rldi9udWxsIHwgZ3JlcCAnI2RlZmlu
ZSBfX3Jpc2N2X3hsZW4gJyB8c2VkICdzLyNkZWZpbmUgLy1ELycgfCBzZWQgJ3MvIC89LycpCj4K
PiBqdXN0IG5pdHM6IHNlY29uZCAkKHNoZWxsICkgaW52b2NhdGlvbiBzaG91bGQgYmUgYXQgdGhl
IHNhbWUKPiBpbmRlbnRhdGlvbiBsZXZlbCBhcyB0aGUgZmlyc3Qgb25lCj4KPiBhbHNvICd8c2Vk
JyAtPiAnfCBzZWQnID8KPgo+IE90aGVyd2lzZSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoaXMgZG9l
cyBhbmQgbm8gd2F5IHRvIHRyeSBpdCBvbgo+IFJJU0MtViwgYnV0IGl0IGRvZXNuJ3QgYnJlYWsg
bXkgc2V0dXAsIHNvIEknbSBmaW5lIHdpdGggaXQuIDspCj4KCjotKSBJJ2xsIGZpeCBpdCB1cCBp
biB2Mi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
