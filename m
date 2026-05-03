Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54EBCD3427
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXqN2KbTGiSFn1odgIgAlPHmP/PoC3Eo+oITrJ83dn4=; b=P2nnYclccw+gbf
	7u0X4Rqm2m8nH4oEHfajEeF9lWoRT3mf7tXqM1p2JdgS5wQU/R590aJHfybNfHd2glKT+Ran2HHdL
	rT6ZdoZo1gzFdLWYTccruqQjapDheraCJ5gkGikGBWW4SS51TUH9Fvbi3aziV4p/ojX5qPzdRAcHx
	/fmhhH7NS3+XgFyUBpWy/ykp8EFPFj9xPJenIaGt1cpHhoxAWLaDpay2xA9yBWlqJRXd7Zm4EKLKT
	REOwcDlnCmw9vibdDD3NqHmfAqbvU8kc9buGcdXClW1GGHgITLN1oiG14mXxrC9ID+Gzi+4gofFMD
	Tqv8Sl9/EBXpRgcCAMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdb0-0000000Bh7O-2uaW;
	Sun, 03 May 2026 20:39:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdaz-0000000Bh6b-15AF
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 20:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D1194442C
	for <linux-riscv@lists.infradead.org>; Sun,  3 May 2026 20:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74364C2BCB4
	for <linux-riscv@lists.infradead.org>; Sun,  3 May 2026 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777840760;
	bh=OYTEHp7kfu60uKZpC7uNHUoEqcMaDbfVrENwGSgXkAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AaGWexQ13gf82hQWB+FAl3ibjW4mbkDbS1GJh505f+BGfDPc03XYC3Zss3edMV4ZJ
	 DUwtWEtXIsczETxuHWOYHx5CxKBx+mb7JBjjW/Q7AXcxa6UIfwRqV/Zn51WKOcBsMp
	 bFu9MwTUA+HqnMgiioGs52oZhuIjNtt0r82EsdfhdvfpiMubOWOj7+ws6jhlmjB4zW
	 pSMu6gEYh3bgUQrlhgmDaf5Q4E0kn0ZvLr8PAKjVL0HN224g71jgMtdo9zM7PW1Ozr
	 GBYpylIGAZ9+VE5Nv0nw7p4q7jui//Obr0a8J+RuTby7Ph7G6YVOsLlPN/bxxYQa3Z
	 SQoa4rrnaEMrw==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso19487266d6.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 13:39:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kN14kI3e6mLqHzIPTmshYW3yq0DiNgw4rBC3v4R21OXO5fEAglbRJIJ4zhhdUwKRoLIbXSaTZnqbrUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgGDmQvU0DvI2i2LzNGPUxQa/paeJMl27mTTLcs+p8U6w7Ck6l
	ZuUtZQyb9/JYvqU6qjM5PSBgGBjTaSQVOLjeJEW7OLJNyKeFk8UBYzfOMitrKL9AfiTteh1hEQf
	WlkpqAByov6+qgxqM5KFXbhTAFbOVF1M=
X-Received: by 2002:ad4:5be8:0:b0:8a7:16f8:442a with SMTP id
 6a1803df08f44-8b6691f4b71mr126409566d6.39.1777840759244; Sun, 03 May 2026
 13:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
 <afUBXnPVnt7Jt5hh@casper.infradead.org>
In-Reply-To: <afUBXnPVnt7Jt5hh@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 04:39:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z3MfP_sx1+qSr00dP5wshOuCAOcbT3RJ_He6Ddz_LnKA@mail.gmail.com>
X-Gm-Features: AVHnY4J-8SFfwvh8WWDAqxVa-cYngpmLlGJISHly6gCLbGvwUy-qMx6Jb2WhZWc
Message-ID: <CAGsJ_4z3MfP_sx1+qSr00dP5wshOuCAOcbT3RJ_He6Ddz_LnKA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260503_133921_359962_94BEAC26 
X-CRM114-Status: GOOD (  26.14  )
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

T24gU2F0LCBNYXkgMiwgMjAyNiBhdCAzOjM54oCvQU0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDI6MjU6MzdB
TSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+IE9uIFNhdCwgTWF5IDIsIDIwMjYgYXQgMTo1
OOKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4g
WWVzLCBidXQgdGhhdCBzdGlsbCBmYWlscyB0byBhbnN3ZXIgImRvZXMgdGhpcyBhY3R1YWxseSBo
YXBwZW4iLiAgSG93IG11Y2gKPiA+ID4gcGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29tcGxleGl0
eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1eWluZyB1cz8KPiA+ID4gSWYgeW91IGRvbid0
IGFuc3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVzdCBnb2luZyB0byBnbyBpbiBhbmQgcmlwIGl0
Cj4gPiA+IGFsbCBvdXQuCgpJIGd1ZXNzIHRoZSBvbmx5IHdheSB0byBhbnN3ZXIgdGhpcyBxdWVz
dGlvbiBpcyB0bwpyZW1vdmUgYWxsIHJldHJ5IGNvZGUgZm9yIGZpbGUgVk1BIGFuZCBydW4gYSBy
ZWFsIHRlc3QuCkZvciBkZWZlbnNpdmUgcHJvZ3JhbW1pbmcsIEkgYW0gZ2VuZXJhbGx5IHZlcnkg
Y2F1dGlvdXMKYWJvdXQgdGhpcyBhcHByb2FjaCwgYnV0IGlmIHRoaXMgaXMgdGhlIG9ubHkgd2F5
IHRvIGNsYXJpZnkKd2hldGhlciB3ZSBzdGlsbCBuZWVkIFBGIHJldHJ5IGZvciBmaWxlLCBJIGNh
biBnaXZlIGl0IGEgdHJ5CmFuZCBydW4gYSBjb21wbGV0ZSB0ZXN0IG9uIEFuZHJvaWQgcGhvbmVz
IGFmdGVyIGxzZi9tbS9icGYuCgo+ID4KPiA+IEnigJltIGdldHRpbmcgcXVpdGUgY29uZnVzZWQu
IEluIHBhdGNoIDQvNSwgeW91IHN1Z2dlc3QgYSBtb3JlCj4gPiByZXN0cmljdGl2ZSBjb25kaXRp
b24gdXNpbmcKPiA+IGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSAmJiAhZm9saW9fdGVz
dF93cml0ZWJhY2soZm9saW8pKQo+ID4gcmF0aGVyIHRoYW4gaWYgKGZvbGlvX3Rlc3RfdXB0b2Rh
dGUoZm9saW8pKSwgYmVmb3JlIHdlIGRlY2lkZSB0byBza2lwCj4gPiByZXRyeWluZyB0aGUgcGFn
ZSBmYXVsdCBbMV0uCj4gPiBUaGF0IHNlZW1zIHRvIHN1Z2dlc3Qgd2Ugc2hvdWxkIGJlIG1vcmUg
Y2F1dGlvdXMgYWJvdXQgd2hlbiB3ZSBjYW4gc2tpcAo+ID4gcmV0cnlpbmcgdGhlIHBhZ2UgZmF1
bHQuCj4gPgo+ID4gSG93ZXZlciwgaW4gdGhlIGNvdmVyIGxldHRlciwgeW91IHN1Z2dlc3QgcmVt
b3ZpbmcgYWxsIHJldHJ5IGNvZGUgZW50aXJlbHkuCj4gPiBEb2VzIHRoaXMgc3VnZ2VzdGlvbiBh
cHBseSBvbmx5IHRvIGZpbGUtYmFja2VkIHBhZ2UgZmF1bHRzPwo+Cj4gSSdtIG1ha2luZyBzdXJl
IHRoYXQgaWYgQW5kcmV3IGRlY2lkZXMgdG8gb3ZlcnJpZGUgbWUgaGUgYXQgbGVhc3Qgc2VlcwoK
Tm8sIEkgZG9u4oCZdCB3YW50IEFuZHJldyB0byBvdmVycmlkZSB5b3UgdW5sZXNzIHRoZXJlIGlz
IGEgcmVhbCBQSQppc3N1ZSBmb3IgZmlsZSwgYW5kIG9ubHkgaWYgeW91IHN0aWxsIHN0aWxsIGlu
c2lzdCBvbiDigJxyaXBwaW5nIGl0IG91dOKAnQphZnRlciBhIHRob3JvdWdoIHRlc3Qgd2l0aCBp
dCByZW1vdmVkLgoKPiB0aGF0IHRoZXJlIGFyZSBvdGhlciBwcm9ibGVtcyB3aXRoIHRoaXMgcGF0
Y2hzZXQgYmV5b25kICJJIGRvbid0IGxpa2UKPiB0aGUgYWRkaXRpb25hbCBjb21wbGV4aXR5Ii4K
ClRoZSBvdGhlciBpc3N1ZSB5b3UgYXJlIHBvaW50aW5nIG91dCBpcyB0aGF0LCBmb3IgYW5vbiwg
d2UKc2hvdWxkIGJlIG1vcmUgY2F1dGlvdXMgYmVmb3JlIGRlY2lkaW5nIHRvIHNraXAgUEYgcmV0
cnksCndoaWNoIHNlZW1zIHRvIGJlIHRoZSBvcHBvc2l0ZSBkaXJlY3Rpb24gb2Ygd2hhdCB5b3Ug
ZXhwZWN0CmZvciBmaWxlLgoKPgo+IEFuZCBtYXliZSB3ZSBkZWNpZGUgdG8gZG8gdGhlIGZhbGxi
YWNrIGZvciBhbm9uLW1tIGJ1dCBub3QgZmlsZSBtZW1vcnkuCgpJIHdhcyB0YXJnZXRpbmcgYSB1
bmlmaWVkIGFwcHJvYWNoIGZvciBib3RoIGZpbGUtYmFja2VkCmFuZCBhbm9ueW1vdXMgbWVtb3J5
LiBGb3IgZXhhbXBsZSwgaWYgYW5vbiByZXF1aXJlcyByZXRyeQp1bmRlciB0aGUgcGVyLVZNQSBs
b2NrLCB3ZSBtYXkgYWxyZWFkeSBoYXZlIHRoZSBuZWNlc3NhcnkKYnJhbmNoIGluIHBsYWNlIHRo
YXQgZmlsZS1iYWNrZWQgY2FzZXMgY2FuIGFsc28gbGV2ZXJhZ2UuCkZvciBhbm9uIGNhc2VzLCBo
aWdoLWxldmVsIGxhbmd1YWdlIEdDcyBjYW4gb3BlcmF0ZSBvbiBhCnNtYWxsIHBvcnRpb24gb2Yg
YSBsYXJnZSBoZWFwIHJlcXVpcmluZyBWTUEgd3JpdGVzLCB3aGljaAppcyBmYWlybHkgY29tbW9u
LCBhcyBJIGV4cGxhaW5lZCB0byBKYW4uCgo+IE9yIG1heWJlIGl0J3MganVzdCBzb21ldGhpbmcg
c29tZWJvZHkgaGFwcGVucyB1cG9uIHdoZW4gcmVhZGluZyB0aGUKPiBtYWlsaW5nIGxpc3QgKG9y
IG1vcmUgbGlrZWx5IGl0J3MganVzdCBncmlzdCBmb3IgYW4gQUkpLgoKTWF5YmUgb25lIG9yIHR3
byB5ZWFycyBmcm9tIG5vdy4gRm9yIG5vdywgYXQgbGVhc3QsIHRoZXJlIGFyZSBzdGlsbApodW1h
bnMgd29ya2luZyBvbiB0aGUga2VybmVsIDotKQoKQmVzdCBSZWdhcmRzCkJhcnJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
