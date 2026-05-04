Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EBCCD3430
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXyrqBop9DtWlqvwnMak2XZwyGCC9Crf7h9A1g77ugM=; b=Fp0gcyiwv6r8oM
	8fGh4HPbvXmIZ/yVQk9uKzF/TGdclsZ/pQuv2p4ZTtPrlSRJs4+BtwL71Lyx7i5kGMLcr9MYwQL0o
	8RFqA1hLHmKkQbHDuQns5cCx6Na4dL8ybd0jnS0gYLCHUNChbt0wBVjtYcleTVzAZT1dc8IOp0Pe/
	2dK6i+P/IsmSuIKaT5/NN4rGEwGfZvq6hLbw6+RtiZpTAhXEJonb8wx6QAfsGuEU67asmUgBzkCqQ
	RvsERksauqwl8mHjw2N3oy9DSy4/1/SjtE58it98I0T7nI2z+nNn947Q/9Xj50+t1B/9CKUZ95Nfe
	KquQiy9Sdm/Od03Jying==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtSk-0000000DK5m-2yfH;
	Mon, 04 May 2026 13:35:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtSi-0000000DK4v-1Uoc
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 13:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFE9A44232
	for <linux-riscv@lists.infradead.org>; Mon,  4 May 2026 13:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FB7C2BCF5
	for <linux-riscv@lists.infradead.org>; Mon,  4 May 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777901751;
	bh=anAXTn2WVNJfQBijdvlVjx89L+KjLxZQUrMBMBAvn58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lm8czak3ojKL/iSeFyCXKqI7NTDydVsOyB2+Hmt8nIK2EusB+d4Z4frGvii94dCYM
	 jWu0DSEVVN+bGYmtnqjUZ613RrBl279QTX5Q4GXGY/7uhrANxd69oXqVhg4v9RhlDr
	 j0Bf6ACKU0YROCTpFS5awmkcjdKqVuM+Cdbkq4OknL3HDQb1DpvjyXBC7KufyhvzqD
	 7zI8a4XUxzPdXMbnVIlJrXSGL14ML23Gg2KG7zpTnsaZSKWHibluTUhcKe4kIIwY+6
	 YESTlho5Ct6TbII6iOg1nmDm+rg+TnF6JT9MWtZidEiRLMooEyQHzB5HaaV3YK9SH9
	 zy3fy169eVGyw==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b9f2295a9dso4063996d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 06:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/mLLaotAN8lGm7NlSW4kgMNl1fUwiTry84vxOVK9OwhHc8GJkuPXozQpGO9oPG7htDvGO80xThctnafw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMQ4pIpjTGYLiFPRLM62RvfE7RQKtBSxIYh/mP4l3PtOoE+NJ
	JomHK+1l0Ngo4vyjQbAwwHQyLXvUMoiEzGL4Or7C7THnXA0/HGq+Z7ckdIfGVRkr2l5REAW0CZw
	1/m4MmP6fC37s8OoycXq7PbPCZSsDSwU=
X-Received: by 2002:a05:6214:260a:b0:8ac:4fd1:2d4a with SMTP id
 6a1803df08f44-8b668a259e6mr167277966d6.33.1777901750649; Mon, 04 May 2026
 06:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
 <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com> <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
In-Reply-To: <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 21:35:38 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zBiRTttf1nR0Ni9BRT3Cv5XFZhyYP8oipFodpS7saGwQ@mail.gmail.com>
X-Gm-Features: AVHnY4I0u-Qbkg0vrggpRHSUVs_cQpUa3gydJwrEbvTBOzz3MxeuFlaWucVZXHg
Message-ID: <CAGsJ_4zBiRTttf1nR0Ni9BRT3Cv5XFZhyYP8oipFodpS7saGwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_063552_425275_DA95A2D8 
X-CRM114-Status: GOOD (  14.28  )
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

T24gTW9uLCBNYXkgNCwgMjAyNiBhdCA5OjA04oCvUE0gSmFuIEthcmEgPGphY2tAc3VzZS5jej4g
d3JvdGU6ClsuLi5dCj4KPiA+ID4gQlRXIEknbSBub3Qgc3VyZSBJIHF1aXRlIHVuZGVyc3RhbmQg
QmFycnkncyBwcmlvcml0eSBpbnZlcnNpb24gcHJvYmxlbQo+ID4gPiBzaW5jZSBJJ2QgZXhwZWN0
IGFsbCB0aHJlYWRzIG9mIGEgdGFzayB0byBnZW5lcmFsbHkgYmUgdHJlYXRlZCB3aXRoIHRoZQo+
ID4gPiBzYW1lIHByaW9yaXR5Li4uCj4gPgo+ID4gRXhhY3RseSBub3QuIE1heWJlIHRoZXNlIHNs
aWRlc1syXSBhbmQgdGhpcyBwcm9qZWN0WzNdIGNhbiBnaXZlCj4gPiB5b3UgYSBoaW504oCUdGhl
eSBhaW0gdG8gc3RhbmRhcmRpemUgdGhpbmdzIG9uIExpbnV4IGJ5Cj4gPiBsZWFybmluZyBmcm9t
IEFwcGxlIE9TLiBCYXNpY2FsbHksIHRhc2tzIGFyZSBjbGFzc2lmaWVkCj4gPiBpbnRvIGZpdmUg
dHlwZXM6Cj4gPgo+ID4gVVNFUl9JTlRFUkFDVElWRTogUmVxdWlyZXMgaW1tZWRpYXRlIHJlc3Bv
bnNlLgo+ID4gVVNFUl9JTklUSUFURUQ6IFRvbGVyYXRlcyBhIHNob3J0IGRlbGF5LCBidXQgbXVz
dCByZXNwb25kIHF1aWNrbHkgc3RpbGwuCj4gPiBVVElMSVRZOiBUb2xlcmF0ZXMgbG9uZyBkZWxh
eXMsIGJ1dCBub3QgcHJvbG9uZ2VkIG9uZXMuCj4gPiBCQUNLR1JPVU5EOiBEb2VzbuKAmXQgbWlu
ZCBwcm9sb25nZWQgZGVsYXlzLgo+ID4gREVGQVVMVDogU3lzdGVtIGRlZmF1bHQgYmVoYXZpb3Iu
Cj4KPiBBZ2FpbiwgdGhpcyBpcyBhIGNsYXNpZmljYXRpb24gb2YgdGFza3MgYnV0IG5vdCByZWFs
bHkgb2YgdGhyZWFkcyBpbiBhIHRhc2sKPiBzbyBhdCBsZWFzdCBmb3IgVk1BIGxvY2sgdGhlcmUn
cyBubyBpbnZlcnNpb24gc28gaGF2ZT8KCknigJltIHNwZWNpZmljYWxseSByZWZlcnJpbmcgdG8g
YSB0YXNrIChpLmUuLCBhIHRocmVhZCkgd2hlbgpkaXNjdXNzaW5nIHNjaGVkdWxlciBjb250ZXh0
LiBJdCBtYXkgYmUgY2xlYXJlciB0byB1c2UgdGhlCnRlcm1zIHByb2Nlc3MgYW5kIHRocmVhZCBl
eHBsaWNpdGx5LgoKSW4gYSB0eXBpY2FsIHByb2Nlc3Mgc2hhcmluZyBhbiBtbV9zdHJ1Y3QsIGVh
Y2ggdGhyZWFkIGNhbgpoYXZlIGEgZGlmZmVyZW50IHByaW9yaXR5LgoKSW4gYW4gQW5kcm9pZCBh
cHAsIHNvbWUgdGhyZWFkcyBoYW5kbGUgdGhlIFVJIGFuZCByZXF1aXJlCmhpZ2hlciBwcmlvcml0
eSwgc3VjaCBhcyB0aGUgbWFpbiB0aHJlYWQgYW5kIFJlbmRlclRocmVhZDsKb3RoZXJ3aXNlLCBm
cmFtZSBkcm9wcyBtYXkgb2NjdXIuCgpUaGUgTGludXggc2NoZWR1bGVyIGNhbiBjb250cm9sIHNj
aGVkdWxpbmcgcG9saWN5IGFuZApwcmlvcml0eSBmb3IgZWFjaCB0aHJlYWQuCgpUaGFua3MKQmFy
cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
