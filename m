Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C1CD4F4A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vj5y3RS/DWlhbggPpqfC1aDWIALMa/LDzqhaxKL0bAk=; b=p7xkzwa52fVBrv
	oY6j89wSPIAiWNxQEwlX1cVwuAcDm+9E3zFxKP4ngowqIXtNRlf3VGBZjQ6uGNrUdj/qOLq8rUc9D
	1bdVQWYhvDixxKX++OO8DsI7754ENrwjCk9BeTtZBBn6q8UJEZwpptAvsNfAZAeKLfzqoFHon/MF/
	cIX/TCV8az29FbIM9UC0Sugy7+DycxjGdK8N/YkoG/o5H0TSXvrPGq03QRpSH1TdcTCOdKu+VxE9A
	dszXdqA7j3sg5J0jn4TsJ2o/QjdhntMA1T3lK87XVC8sEJNpV7FLBgOD1dht3xOJ7O87XseKP7Lhg
	yDmA5DqqgEDY/0aIa3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4vC-0000000Gvn3-1iw0;
	Mon, 18 May 2026 20:50:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4v9-0000000Gvm3-2bhO
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 20:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CF47445A1
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 20:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634F8C2BCFF
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 20:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137438;
	bh=ypIdx4acKlGusOGofl1Rgy+13Usr/bMeabAYI7vNmVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gk0707fUsk9yWgyWpyCE0usmgctr/2kAHAruO5+nioCbF3DwOXvh3XXJOYYbLkzh5
	 hJ2qI4xZH0TRSFfRaiQZm8jvvSk+DkKMuBR24TjklCVhNb8E02lgN0am+P2km4x9hl
	 l3nDU0T5UpVuJP450DPP64O/nI/FWXc9L0PtdXkLhmZvxkOogzxRVtHB3So0FEMwk9
	 HbI5Rpppz0/1ai5xW+yywawcmbLarPa3mDD/r8dZtjhp9DVlB9KD/EmgzDTH8BwZDU
	 +K9SIW2+RAVZM0fzFYPAz7ugIMm6YeBB/wVGB7FhjefXLk4pr0Zz3bb6JKqwuQ7FFH
	 u1yF44PQXOp+A==
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95fa7cd1392so2342295241.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 13:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tlwDjdrxQCvyy71W8Y2VXWHlElBL3uiCxu9MVWBMTj4jgTukfuoj5Q9BC79RfaivTLfTLyend9biHWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFzt9V26W7BMZ2w+c9XQRy1q2MtyvxmMqZ87XeYFCXDErRwE2c
	fT6nJD/oKwS6P0GuzCgOsGK7gSi3X2QK6OEtux2tiYXZSTK/d0t0ll2H0nnoDvYVZ7+Px8euIU4
	W2QC38jCOdPIPouJGE7NRSgr/KQKvZ1M=
X-Received: by 2002:a05:6102:1497:b0:632:eef7:4b7f with SMTP id
 ada2fe7eead31-63a3f38ed3dmr8946550137.22.1779137437454; Mon, 18 May 2026
 13:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <ags7mPK7Ong0ZsBf@casper.infradead.org>
In-Reply-To: <ags7mPK7Ong0ZsBf@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 19 May 2026 04:50:25 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zBcx2OF20pE4r2FNUXuF_E_SkS2scFS4b=G6v-GCvXYw@mail.gmail.com>
X-Gm-Features: AVHnY4LxjbpsTxssULoY1o3L0OWdx82GerNYGpv8290_rAwvBTy9PmnU1AhgaaM
Message-ID: <CAGsJ_4zBcx2OF20pE4r2FNUXuF_E_SkS2scFS4b=G6v-GCvXYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_135039_700109_A5128B74 
X-CRM114-Status: GOOD (  15.18  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTI6MTfigK9BTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCAwNzoyNTo1
NFBNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gV2UgaGF2ZSBjbGVhcmx5IG9ic2VydmVk
IHRoYXQgdGhlIGBmb3JrKClgIG9wZXJhdGlvbnMgb2YgbWFueQo+ID4gcG9wdWxhciBBbmRyb2lk
IGFwcHMsIHN1Y2ggYXMgaVFpeWksIEJhaWR1IFRpZWJhLCBhbmQgMTAwODYsCj4gPiBlbmQgdXAg
d2FpdGluZyBvbiBwYWdlLWZhdWx0IChQRikgSS9PIHdoZW4gdGhlIFZNQSBsb2NrIGlzCj4gPiBo
ZWxkIGR1cmluZyBJL08gb3BlcmF0aW9ucy4gVGhpcyBoYXMgYWxyZWFkeSBiZWNvbWUgYQo+ID4g
cHJhY3RpY2FsIGlzc3VlLiBJIGFsc28gYmVsaWV2ZSB0aGlzIGNhbiBsZWFkIHRvIGNoYWluZWQK
PiA+IHdhaXRpbmcsIHNpbmNlIHRoZSBnbG9iYWwgYG1tYXBfbG9ja2AgYmxvY2tzIGFsbCB0aHJl
YWRzIHRoYXQKPiA+IG5lZWQgdG8gYWNxdWlyZSBpdC4KPgo+IEl0J3MgYWx3YXlzIGJlZW4gYSB0
ZXJyaWJsZSBpZGVhIHRvIGNhbGwgZm9yaygpIGZyb20gYSBtdWx0aXRocmVhZGVkCj4gYXBwbGlj
YXRpb24uICBGb3IgZXhhbXBsZSwgdGhpcyBxdWVzdGlvbjoKPgo+IGh0dHBzOi8vc3RhY2tvdmVy
Zmxvdy5jb20vcXVlc3Rpb25zLzUzNjAxMjAwL2NhbGxpbmctZm9yay1vbi1hLW11bHRpdGhyZWFk
ZWQtcHJvY2Vzcwo+Cj4gb3IgdGhpcyBsd24gdGhyZWFkOiBodHRwczovL2x3bi5uZXQvQXJ0aWNs
ZXMvNjc0NjYwLwo+Cj4gRG8gd2UgaGF2ZSBhbnkgaW5zaWdodCBpbnRvIHdoeSB0aGVzZSBhcHBs
aWNhdGlvbnMgYXJlIGRvaW5nIHRoaXMKPiBob3JyaWJsZSB0aGluZz8KCkkgc3dlYXIgSSByZWFk
IHRoZSB0d28gbGlua3MgeW91IHNoYXJlZC4gQnV0IHRoZSByZWFsaXR5CmlzIHRoYXQgYXMgbG9u
ZyBhcyBwZW9wbGUgdXNlIHRoZSBBbmRyb2lkIGZyYW1ld29yaywKZXZlbiB0aGUgc2ltcGxlc3Qg
IkhlbGxvIFdvcmxkIiBhcHAgYWxyZWFkeSBydW5zIHdpdGgKMTArIHRocmVhZHMgOi0pCgoKbWFp
bgpSZW5kZXJUaHJlYWQKUmVmZXJlbmNlUXVldWVEYWVtb24KRmluYWxpemVyRGFlbW9uCkZpbmFs
aXplcldhdGNoZG9nRGFlbW9uCkhlYXBUYXNrRGFlbW9uCkJpbmRlcjoxMjM0XzEKQmluZGVyOjEy
MzRfMgpTaWduYWwgQ2F0Y2hlcgpKRFdQCi4uLgoKQmVzdCBSZWdhcmRzCkJhcnJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
