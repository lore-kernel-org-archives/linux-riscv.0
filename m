Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B5CDB466
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rw91NqIMURLd7kEnWmpW02BEqqYhPAFuMZgHIQP/ogg=; b=ZolLBT4SvLs5FT
	7YopXY5IlLWLPTlm3T6dPuhgIKLOI1MRMbVJaE76Hpm52Ei1Onc4gI3PPEczkpxUJL2LNqRGffaXF
	u+lSpNKyzTyVM5wYrXpMcb81u+ru5+M7FkCLsMvn2VgOajEruNc27oNtHqCi1rV1x/KGmL2gePvds
	XegP4ZnehP0+PjvGQmEdKTGOVtZVWfHRpjbaSLUREQ4Cp/m0JZF6pbysmrIDk00GsCeWxvsYEQq/k
	mPh373XfAn6pxTB+n0W0mukbf4hgMA4Pjb7rM5vd15CthJo/nI1NkYsX0eUDsjKipz9HKxKz/Elzo
	ZReNPmwasxgUVMwh6foA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb5R4-00000003dcS-3fgZ;
	Sat, 20 Jun 2026 23:49:14 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb5R1-00000003dbh-2g0N
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 23:49:13 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-519ed52bcc6so339721cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jun 2026 16:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781999349; cv=none;
        d=google.com; s=arc-20260327;
        b=OLq78q2z0EJif8Vz3KTr5YLa9RVsnlJTANMT2fdUHrlk8N+RNNzs2fP6jhxXIpZemG
         VR/AgcBUzOWRG4qAnSNAQOSoeZXt7y0Up6WS1ehZyJTR3PvkrBZRNml0VIq+tL2mk6Sd
         aupT21RqLys8SmzpjasJ/tUY4DsxHJzWReY4LVaptqA6pxEH0TrzVkNmaiWEgvnGfgyK
         ylw2FYhYhDjsfcn3mzAXR1or2x197/LvqjoSeWTLvWYKRmUjqFAnx6s8krOFewwi96zX
         6GiM3qGMVFgQG/El9p7gXwVXR9a5d4N+PePXjByGNMS3FRFe8l5McQzDSwZgH/sSh42S
         /C/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        fh=gybwqUZz1SvHvrGopLEtGZl0d8yv4h2cfuSx3mwNqZ4=;
        b=fuMCDaJHrEYys7tEiQ6wrkkw56o34HNGl9O6ROu3tE3odJYcQ+4Ns+6zMlSU852F8y
         cJFyY+GHLJoIZ7dE1T0lFRFbCqlWtLs0Tv1FrTDbn6DNFSmAv2n1b4LolcsoIyipiNmk
         Uj7v4hfUtz0dEm9gmpxQZUpvP7V9KTdh6fkJeh3rPWCUdDaukta/Sm0jrgAHFBaUuKOU
         j++nrN6YtYRqRXQ+K46FoUckTSoRpPnKZs/3LB3zzQY8VFKjeUw2Z3iQVZNWmF1cN/K1
         SUN0lst1uxtKDrU0axhT0zj80AoIgeCnsW4PeFkoqbL80BdhkOWb7hstu++LbQsYY7RE
         xUMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781999349; x=1782604149; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        b=Fe4pOa8bc2NXC+p3ak8QibgTjeiaOSXqIXt7XuZIVcFtlQwErXnhKgP3O4V53OSHtx
         EebT3b6h1sS/AAM/weXKOjzvIRgnkV3GteIb8gPkgjbA59NoRf0t3pDWIwALIxe0tf0X
         W4OxU+SXcFzl8jSyJYz77XnZqwU5hRPkJ7RTrPD5JtOt34lwMeSzq06vncwgtJZ8jgz4
         cZNT1DyRouP1HlTXHB/gbf/hp5q4WgIk3Ap6OTJllMN4xpiLzbWi8vsijwWR8JKPPMlk
         YJJ7Jwm3AABOSoHdL7qxtQlZh0LjBB4moe9Bqw65yU5HypHr6x1X3tU2ONvdK31EhP7E
         dHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781999349; x=1782604149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        b=fDqJubUPgeLpbvVfvxdht6GtaQ9aG5zseZkNe35VjwbwBK86nfyKzfFmqhU7bF/Siu
         F9jhKlEVqtI1ZA/TniJzaWr5sQLmkYvMtQrECdPR9xWpmftSz1A+Ouxt/F6652APn7H7
         /L3BZqzcPYUVUxOQ0Fay8jXCQA+4TShxaJqaKuNaRzsWMrWZb8dlnmZ8pVhWyL4J5gh4
         c5X1vrlSY3T/dhNB83gAg2yhVcJRzIurtZPnKHqtP7yoGDxtg5OXzMhamZ0Tekc/hA5d
         zqaduC1GDXIDzpynSvoPOL2E2h34E9RIizMS5Cy3uo7aDM0vvLc0a/DH1MXxvADmN1r9
         p9qg==
X-Forwarded-Encrypted: i=1; AFNElJ9QH79Zm/JWxeRY36y6MnTDi9XxNlnpN6VHRAkDO9e66REMXa+mHBThd0VR97NAg18Y8VC0wlWRWn81JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Tqj/AngQSJPis+k6flO51fGWn9taTOHfT8/1my0u3zZGhq2n
	h23ED1d3OhgcbkxOzmD+qY5bREg7KjCbRbCLcYpiT1ymFE+ZvV7xgdawtlAB2M2+2M0QASxf/vM
	UexGoDq9CNROgm8RHN/GU2UGekbxLfzoqktoBDlfV
X-Gm-Gg: AfdE7cnaIATk/WomllBvhmtQUNhpJN0ncE8NTH4eS/R9LW784rVK1mw2KccWyGsFnES
	vZNCEGsWXA+ZuaX+Xyu0VFszm7bY5dkpQeiiIjz4qVV4W54+tn8vpGyn+P9WJ8sWAMJcaFSH4/g
	csMZl3KeXvOqhp3EPxEDpHCmIL0O1+LDboiyDGZk80V982qi2nWJv0C/G8cqgbRCCGNvZ/Qbr0n
	7DY5+qqzMPaPrPxbRO5HOWi7DCALPxsTq/mTTH1dF6n/vVsMbkEq2Qs0bhBe2F80AeEshlS/Rhb
	Eu40bQ==
X-Received: by 2002:a05:622a:580a:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-519e4a744d4mr15890001cf.22.1781999348457; Sat, 20 Jun 2026
 16:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
 <ahB6QyHgYq8ksj65@lucifer> <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 20 Jun 2026 16:48:57 -0700
X-Gm-Features: AVVi8CdrqLszoGfh6nxxBjM6ZU4jlgAaXlfN0swetCJNc_4l9-uU6mX0T8CUJHo
Message-ID: <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_164911_705819_F8BE33E9 
X-CRM114-Status: GOOD (  25.23  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMjozMeKAr1BNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+ID4KPiA+IEFnYWluIHRoaXMgaXMgbWFraW5nIG1lIHdhbnQgdG8g
c2l0IG91dHNpZGUgYW5kIHNpcCBvbiBzb21lIGxlbW9uYWRlIGFuZAo+ID4gaWNlIDopCj4gPgo+
ID4gWWVzIC0gYW5kcm9pZCBwcm9jZXNzZXMgYXJlIGFnZ3Jlc3NpdmVseSBtdWx0aS10aHJlYWRl
ZCwgc3VyZSBvZiBjb3Vyc2UuCj4gPgo+ID4gVGhlIG1pc3NpbmcgYml0IGhlcmUgaXMgdGhlIGZv
cmtpbmcgLSB3aGF0LCB3aGVyZSwgd2h5LCB3aGVuPwo+ID4KPgo+IEkgcmVhbGx5IHdhbnQgdG8g
a25vdyB0aGUgd2hhdCwgd2hlcmUsIHdoeSwgYW5kIHdoZW4KPiBhcyB3ZWxsLiBCdXQgc2luY2Ug
bW9zdCBhcHBsaWNhdGlvbnMgYXJlIG5vdAo+IG9wZW4tc291cmNlLCBpdCBpcyBiYXNpY2FsbHkg
YSBibGFjayBob2xlIGZvciBhbnlvbmUKPiBvdGhlciB0aGFuIHRoZSBvd25lcnMgb2YgdGhvc2Ug
YXBwcy4KPgo+IExldCBtZSB0cnkgdG8gZG8gbW9yZSBpbnZlc3RpZ2F0aW9uIHRvIHVuZGVyc3Rh
bmQgd2hhdAo+IGlzIGdvaW5nIG9uLCBhbHRob3VnaCBpdCBpcyByZWFsbHkgaGFyZC4KPiBUbyBi
ZSBob25lc3QsIEkgd291bGQgcmF0aGVyIHRoZSBBbmRyb2lkIGZyYW1ld29yawo+IGNvbXBsZXRl
bHkgcHJvaGliaXQgYXBwcyBmcm9tIGNhbGxpbmcgZm9yaygpLCBpZgo+IHBvc3NpYmxlLgo+Cj4g
PiBBbmQgdGhlbiB5b3Ugc2F5IHp5Z290ZSBpcyBzb21ldGltZXMgbXVsdGktdGhyZWFkZWQgYnV0
IHNvbWV0aW1lcwo+ID4gc2luZ2xlLXRocmVhZGVkLCB3aGljaCBpcyBhZGRpbmcgYSB3aG9sZSBi
dW5jaCBvZiBjb25mdXNpb24gb24gdG9wIG9mIGFsbAo+ID4gdGhhdC4KPiA+Cj4gPiBJIGRvbid0
IGZpbmQgdGhlc2Ugc3RhY2sgdHJhY2UgZHVtcHMgYWxsIHRoYXQgdXNlZnVsICh0aG91Z2ggdGhh
bmtzIG9mCj4gPiBjb3Vyc2UgZm9yIHRha2luZyB0aGUgdGltZSB0byBnYXRoZXIgdGhlbSksIEkg
dGhpbmsgd2UnZCBiZSBiZXR0ZXIgb2ZmIHdpdGgKPiA+IHNwZWNpZmljIGRhdGEgb24gZm9ya2lu
ZywgaW4gc29tZSBfY29uY2lzZV8gX3N1bW1hcmlzZWRfIGZvcm0sIGlkZWFsbHkgd2l0aAo+ID4g
bnVtYmVycy4KPiA+Cj4gPiBUaGVyZSdzIHN1Y2ggYSB0aGluZyBhcyB0b28gbXVjaCBpbmZvcm1h
dGlvbiA6KSkKPgo+IFRoaXMgdHJhY2Ugc2hvd3MgUEYgSS9PIGluIG9uZSB0aHJlYWQgb3Zlcmxh
cHBpbmcKPiB3aXRoIGEgZm9yaygpIGNhbGwgaW4gYW5vdGhlciB0aHJlYWQuCj4gQnV0IGFzIEkg
ZXhwbGFpbmVkLCBJIHJlYWxseSBkbyBub3Qga25vdyB3aGF0IGtpbmQgb2YKPiB1c2VyIGJlaGF2
aW9yIGlzIGJlaGluZCBpdC4KPgo+ID4KPiA+IEFueXdheSwgYWdhaW4sIHBsZWFzZSBsZXQncyBz
ZWUgYSBuZXcgX1JGQ18gd2l0aCB0aGUgYXBwcm9hY2ggcHJvcG9zZWQgYnkKPiA+IFN1cmVuLCB3
aXRoIHNvbWUgX3N1Y2NpbmN0XyBkYXRhIGRlbW9uc3RyYXRpbmcgX2V4YWN0bHlfIHdoYXQgdGhl
IHByb2JsZW0KPiA+IGlzLCBzbyB3ZSBjYW4gbWFrZSBzb21lIGhlYWR3YXkgaGVyZS4KPgo+IE9r
YXksIHN1cmUuIFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZS4KCkp1c3QgY2hlY2tpbmcgaW4gb24g
dGhlIGZvbGxvd3VwIHBsYW5zLiBJSVVDIHRoZSBSRkMgbWVudGlvbmVkIHdpbGwKdHJ5IHRvIGlt
cGxlbWVudCB0aGUgc29sdXRpb24gd2UgZGlzY3Vzc2VkIGF0IExTRk1NOiBzcGxpdHRpbmcKVk1f
RkFVTFRfUkVUUlkgaW50byB0d28gZmxhZ3MgLSBvbmUgZm9yIHJldHJ5aW5nIHVuZGVyIHBlci1W
TUEgbG9ja3MKYW5kIGFub3RoZXIgb25lIHRvIGZhbGxiYWNrIHRvIG1tYXBfbG9jay4KCkJhcnJ5
LCBpZiB5b3UgbmVlZCBhbnkgaGVscCBvciBjbGFyaWZpY2F0aW9uLCBwbGVhc2UgZG8gbm90IGhl
c2l0YXRlCnRvIGNvbnRhY3QgbWUuClRoYW5rcywKU3VyZW4uCgo+Cj4gPgo+ID4gQW5kIG5vdyBJ
J20gb2ZmIGZvciBhIGNvcm5ldHRvISA6KQo+Cj4gU291bmRzIGdvb2QgOikgRW5qb3kgeW91ciBj
b3JuZXR0byEKPgo+IEJlc3QgUmVnYXJkcwo+IEJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
