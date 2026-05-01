Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168CFCD3423
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fN8Fg15d3xTix/CsVpMgxqL3BLKf/o7m1Y7TQVQiXo=; b=plXLAWDw0yubmp
	EhcKGbE7YPXPjpOGt0c+FjcEKhaveVnUSm4OiYggALM06lboMsV5gxKZGPQE6lTu/nfpT33h0vR9l
	as3lWfuBsphKAnB+zFKSuC/UjaB61TmQCy4oX22XhSTsgamgcUFoEREkLuRQlGiJ04QF6nO8tc0X4
	/rqyfI2bazH1Yb1JdIrvSU6QtajS5kRr9oAUXxQKFPjikQ86BsAQ9VKIcp5L5mHvIF7MlrTrh469S
	vrW//Bi7rLoSUbTq8sC+OjEl7vHyzl+tHeurwoj93yYdoX00PsUzlAvW+UlLoL0Zr5DKrDmhl0ktT
	MHmfNfI2lwidKxqZF0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrv1-00000007WeB-1hti;
	Fri, 01 May 2026 17:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIruy-00000007WdI-2kg5
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 17:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67B704454C
	for <linux-riscv@lists.infradead.org>; Fri,  1 May 2026 17:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB01C2BCF4
	for <linux-riscv@lists.infradead.org>; Fri,  1 May 2026 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777657487;
	bh=Hl2YiWTcbo74Gxc6IpUU70j+aHuYqyHn+c9GqocmPS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cokKUJ4cVjTc6Fh+umuWaKXjfGu696YYSrhlsdu275noHQdipmmX0gkSiihTIc2Sl
	 fpYV1mlggK7Yc6cXYI+XurdET3PGISSUYmW2rPT5S58wxIfAaO5cGneYrdxbKBfIlB
	 XZEkY0bHXwj5IHxfWfRQxZg9bVbm6Czf+haANPTe/D+0YAlQo7B5g+S/t38bZMqyZA
	 Hvwafr5cJ0ewDjxPrc13qWWQ0oTeI8rTw7+kBgHhpYucb3owFD/0kIrKesBp3DFJve
	 SXoo+/ZlI3WZftzrouDPSabfXV4IkYxfnkLGV13yzz1iWbpLIbSY4Ytn/c7yT/Hw0B
	 9r576Ai8d9MRA==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b5de17382cso4308956d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 10:44:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gCp4psiOKN1roHzthWAm2caevMCS2W7shj1Yvn2/pcvCP8KJcRKlxZitLmJL9hjloIwZdv2opB69ZEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJLGgQS3xOAmx9A7kOicnkJA1S7tP856kfqH3kfRKMt0WJnvJA
	Z7crsgfgrkZc4JsY4yQqWlviBjlUzfIsCNFDU5fChXPisaUxD2bxTXtYqNhJNU1w/SxzvQ9O7g+
	pRgoJ9Cxj082cJkoKwEiNyECpMKs1Hkg=
X-Received: by 2002:a05:6214:260a:b0:8ab:4ab9:bb50 with SMTP id
 6a1803df08f44-8b668638bfamr8385726d6.37.1777657486245; Fri, 01 May 2026
 10:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com> <afS_L-5XeWIldTXA@casper.infradead.org>
In-Reply-To: <afS_L-5XeWIldTXA@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Sat, 2 May 2026 01:44:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
X-Gm-Features: AVHnY4L9r5jHmXxuaat24ga_fMfUkn2-2M0MEFhZDB6ITf6AdiWvpvcS2QZoKTw
Message-ID: <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_104448_733848_C92F1DF8 
X-CRM114-Status: GOOD (  16.78  )
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

T24gRnJpLCBNYXkgMSwgMjAyNiBhdCAxMDo1N+KAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDAxLCAyMDI2IGF0IDA2OjQ5OjU4
QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiAxLiBUaGVyZSBpcyBubyBkZXRlcm1pbmlz
dGljIGxhdGVuY3kgZm9yIEkvTyBjb21wbGV0aW9uLiBJdCBkZXBlbmRzIG9uCj4gPiBib3RoIHRo
ZSBoYXJkd2FyZSBhbmQgdGhlIHNvZnR3YXJlIHN0YWNrIChiaW8vcmVxdWVzdCBxdWV1ZXMgYW5k
IHRoZQo+ID4gYmxvY2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0
OyBhdCBvdGhlciB0aW1lcyBpdCBjYW4KPiA+IGJlIHF1aXRlIGxvbmcuIEluIHN1Y2ggY2FzZXMs
IGEgaGlnaC1wcmlvcml0eSB0aHJlYWQgcGVyZm9ybWluZyBvcGVyYXRpb25zCj4gPiBzdWNoIGFz
IG1wcm90ZWN0LCB1bm1hcCwgcHJjdGxfc2V0X3ZtYSwgb3IgbWFkdmlzZSBtYXkgYmUgZm9yY2Vk
IHRvIHdhaXQKPiA+IGZvciBhbiB1bnByZWRpY3RhYmxlIGFtb3VudCBvZiB0aW1lLgo+Cj4gQnV0
IGRvZXMgdGhhdCBhY3R1YWxseSBoYXBwZW4/ICBJIGZpbmQgaXQgaGFyZCB0byBiZWxpZXZlIHRo
YXQgdGhyZWFkIEEKPiB1bm1hcHMgYSBWTUEgd2hpbGUgdGhyZWFkIEIgaXMgaW4gdGhlIG1pZGRs
ZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4gdGhhdCBzYW1lIFZNQS4gIG1wcm90ZWN0KCkg
YW5kIG1hZHZpc2UoKSBhcmUgbW9yZSBsaWtlbHkgdG8gaGFwcGVuLCBidXQKPiBpdCBzdGlsbCBz
ZWVtcyByZWFsbHkgdW5saWtlbHkgdG8gbWUuCgpJdCBkb2VzbuKAmXQgaGF2ZSB0byBpbnZvbHZl
IHVubWFwcGluZyBvciBhcHBseWluZyBtcHJvdGVjdCB0bwp0aGUgZW50aXJlIFZNQeKAlGp1c3Qg
YSBwb3J0aW9uIG9mIGl0IGlzIHN1ZmZpY2llbnQuCgpCVFcsIHRoZSBjaGFpbiBjYW4gcHJvcGFn
YXRlOiBhIHBhZ2UgZmF1bHQgb2NjdXJzLCBCIHdhbnRzIHRvIHdyaXRlIHRoaXMKVk1BLCBhbmQg
QyAoYSBoaWdoZXItcHJpb3JpdHkgdGFzaykgd2FudHMgdG8gd3JpdGUgYW5vdGhlciBWTUEuIEQg
bWF5IG5lZWQKdG8gaXRlcmF0ZSBWTUFzIHVuZGVyIG1tYXBfbG9jaywgc28gQiBjYW4gZW5kIHVw
IGJsb2NraW5nIGJvdGggQyBhbmQgRC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
