Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F9DC83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 07:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55jAUBOJ4B/jxlP2j7TYC2JBXVAw8qbcnQgB+GWKWws=; b=EGU5dHx8QWVKQ5
	W74jsyhEKDvt2BbuCm9KTk0hWL6J/HPBbR00th9wAWeL+LWGBefQaFSZp2XHwW2+4M+D1YdzvdwUV
	/xoyKTWtaXckxxeAAY6GdPFvLPQ/kXQn0mNx8jenBmIeX966SH+Som0pPHcWKKIpPDT+LUokRrjv8
	QbHKF6a1qPW7h//r/ssQLn/HVgGVZyy6XUSYj1WKDj/xg8k7/RWz7MCiTHZkOES5GqAvbdGD56VuQ
	KX2nnGAJsaLDhezA4sm9R9r0hc+liVotEWO2s34JI4196XefHUxLdAuTrJBWea2Mjku0mDRQIfcMP
	X1jWMSpN03HZ/EklzX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFv1-00D26j-1x;
	Wed, 30 Aug 2023 07:47:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFuz-00D24c-0L
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 07:47:14 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-26b41112708so3401360a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693381626; x=1693986426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCs5oUbQ1jJL1mASlnk3DDNvqxPdGJwje0jZ0qvyXiA=;
        b=OJDWfXD1xcKF+wEfU0TCOfQ6EHfUK9Gplzxm0X+JjaYrrnRxKY8A6N9+bRmZiztI6x
         ++Ky8UW1ZS3W8vvmW5t2fanh9uCzmw5IeKrbbjx799z5ZT7DAHpJ7zaZaRZNArhFjvhx
         LkE3E4JCUI1UETjReP9KfB+csNtyDZqvsuG2NF4ulft326QK1sy31GpDYjz8cBfteymp
         OSoAZU9W7Xh9PI0lSeUoGDz6ZkI8cS7U9TOIacWWDgl/YieQlQG0jZrJi5VR78ExbinT
         29UAaSfVoINtAhmIQzU0bycMbNBxiUyw3RKAF/YZ+N+qSo3xm09qQkG3cbVBWUbEQ3rH
         3qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693381626; x=1693986426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCs5oUbQ1jJL1mASlnk3DDNvqxPdGJwje0jZ0qvyXiA=;
        b=NnqaBWi8L0ljWR0/RCviN+x48g4992IG3bBwMOdhaSFq47l/NXV+Egw89RZUTg1wB2
         0H7cofB3RW/9K5Cx5dN1Rx8UTP6qKIZhlkpoEOh1BJ90DOM/FXn0TlMbe5NYYLmr1l1E
         mWJBhDYnJ6AKzzkDtUxvWG3m3KMZQ0jNJw94E4m99o5qhd05DUWygADoQPn3vD98KzFH
         QZhh9S/sUj+1nV/JS2C9A/BlTo5YmXA2RqpK6eqg/Xpf67+61tOz/WpnJQ1Nkk+Igl51
         4sFBayWOdEOEw/vKlwsi3DHSg7WdxFRBSSzEnn4YxnGKybTzyOrCuOcG2RjuRmFxMZzZ
         WBvw==
X-Gm-Message-State: AOJu0Yy3+8tgvvM8sgriHcqriAQUuXItA4L0YQUnz59grZHA5fN/glsK
	ScgmuJCMovJaloYJ88NEMJQ3xw+Tg/YY0rehVII=
X-Google-Smtp-Source: AGHT+IFzKz0Ti7vI4CKRwOqZP7MwOhQS4dbp7cvjcvGpgnK8C0GTkeCPqS/KzD/64rmO2llKXoRa/9f7xiFr7uo1dJw=
X-Received: by 2002:a17:90a:fe8b:b0:267:a859:dfef with SMTP id
 co11-20020a17090afe8b00b00267a859dfefmr1352320pjb.27.1693381625844; Wed, 30
 Aug 2023 00:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230827205641.46836-1-namcaov@gmail.com> <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
 <ZOyhozSq3S36eRSq@nam-dell> <ZOymDqhE9STgx4Mm@nam-dell> <87edjmz864.fsf@all.your.base.are.belong.to.us>
 <ZO4+/P9B29Bpb0Yz@nam-dell> <87il8xm1d1.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87il8xm1d1.fsf@all.your.base.are.belong.to.us>
From: Nam Cao <namcaov@gmail.com>
Date: Wed, 30 Aug 2023 09:46:54 +0200
Message-ID: <CA+sZ8B8uMqYOE56T3TqDnGGyaEo+sffC_7rWFH78M8OsWc6BSg@mail.gmail.com>
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_004713_150751_8648606F 
X-CRM114-Status: GOOD (  31.10  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgOTozMuKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gTmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoK
Pgo+ID4gT24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMDg6MTQ6NTlBTSArMDIwMCwgQmrDtnJuIFTD
tnBlbCB3cm90ZToKPiA+PiBOYW0gQ2FvIDxuYW1jYW92QGdtYWlsLmNvbT4gd3JpdGVzOgo+ID4+
Cj4gPj4gPiBPbiBNb24sIEF1ZyAyOCwgMjAyMyBhdCAwMzozMToxNVBNICswMjAwLCBOYW0gQ2Fv
IHdyb3RlOgo+ID4+ID4+IE9uIE1vbiwgQXVnIDI4LCAyMDIzIGF0IDAyOjQ4OjA2UE0gKzAyMDAs
IEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gPj4gPj4gPiBOYW0gQ2FvIDxuYW1jYW92QGdtYWlsLmNv
bT4gd3JpdGVzOgo+ID4+ID4+ID4KPiA+PiA+PiA+ID4gdXByb2JlcyBleHBlY3RzIGlzX3RyYXBf
aW5zbigpIHRvIHJldHVybiB0cnVlIGZvciBhbnkgdHJhcCBpbnN0cnVjdGlvbnMsCj4gPj4gPj4g
PiA+IG5vdCBqdXN0IHRoZSBvbmUgdXNlZCBmb3IgaW5zdGFsbGluZyB1cHJvYmUuIFRoZSBjdXJy
ZW50IGRlZmF1bHQKPiA+PiA+PiA+ID4gaW1wbGVtZW50YXRpb24gb25seSByZXR1cm5zIHRydWUg
Zm9yIDE2LWJpdCBjLmVicmVhayBpZiBDIGV4dGVuc2lvbiBpcwo+ID4+ID4+ID4gPiBlbmFibGVk
LiBUaGlzIGNhbiBjb25mdXNlIHVwcm9iZXMgaWYgYSAzMi1iaXQgZWJyZWFrIGdlbmVyYXRlcyBh
IHRyYXAKPiA+PiA+PiA+ID4gZXhjZXB0aW9uIGZyb20gdXNlcnNwYWNlOiB1cHJvYmVzIGFza3Mg
aXNfdHJhcF9pbnNuKCkgd2hvIHNheXMgdGhlcmUgaXMgbm8KPiA+PiA+PiA+ID4gdHJhcCwgc28g
dXByb2JlcyBhc3N1bWUgYSBwcm9iZSB3YXMgdGhlcmUgYmVmb3JlIGJ1dCBoYXMgYmVlbiByZW1v
dmVkLCBhbmQKPiA+PiA+PiA+ID4gcmV0dXJuIHRvIHRoZSB0cmFwIGluc3RydWN0aW9uLiBUaGlz
IGNhdXNlIGFuIGluZmluaXRlIGxvb3Agb2YgZW50ZXJpbmcKPiA+PiA+PiA+ID4gYW5kIGV4aXRp
bmcgdHJhcCBoYW5kbGVyLgo+ID4+ID4+ID4gPgo+ID4+ID4+ID4gPiBJbnN0ZWFkIG9mIHVzaW5n
IHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uLCBpbXBsZW1lbnQgdGhpcyBmdW5jdGlvbgo+ID4+
ID4+ID4gPiBzcGVmaWNpYWxseSBmb3IgcmlzY3Ygd2hpY2ggY2hlY2tzIGZvciBib3RoIGVicmVh
ayBhbmQgYy5lYnJlYWsuCj4gPj4gPj4gPgo+ID4+ID4+ID4gSSB0b29rIHRoaXMgZm9yIGEgc3Bp
biwgYW5kIGl0IGluZGVlZCBmaXhlcyB0aGlzIG5ldyBoYW5nISBOaWNlIQo+ID4+ID4+Cj4gPj4g
Pj4gR3JlYXQhIFRoYW5rcyBmb3IgdGVzdGluZyBpdC4KPiA+PiA+Pgo+ID4+ID4+ID4gSG93ZXZl
ciwgd2hlbiBJIHRyaWVkIHNldHRpbmcgYW4gdXByb2JlIG9uIHRoZSBlYnJlYWsgaW5zdHJ1Y3Rp
b24KPiA+PiA+PiA+IChvZmZzZXQgMHgxMTgpIGZyb20geW91ciBleGFtcGxlIFsxXSwgdGhlIHBy
b2JlIGRvZXMgbm90IHNob3cgdXAgaW4gdGhlCj4gPj4gPj4gPiB0cmFjZSBidWZmZXIuCj4gPj4g
Pj4gPgo+ID4+ID4+ID4gQW55IGlkZWFzPwo+ID4+ID4+Cj4gPj4gPj4gPkZyb20gbXkgdW5kZXJz
dGFuZGluZywgYm90aCB1cHJvYmVzIGFuZCBrcHJvYmVzIHJlZnVzZSB0byBpbnN0YWxsIGJyZWFr
IHBvaW50cwo+ID4+ID4+IGludG8gZXhpc3RpbmcgdHJhcCBpbnN0cnVjdGlvbnMuIE90aGVyd2lz
ZSwgd2UgbWF5IGNvbmZsaWN0IHdpdGggc29tZXRoaW5nIGVsc2UKPiA+PiA+PiB0aGF0IGlzIGFs
c28gdXNpbmcgdHJhcCBpbnN0cnVjdGlvbnMuCj4gPj4gPgo+ID4+ID4gSSBqdXN0IHJlYWxpemUg
eW91IHByb2JhYmx5IGFzayB0aGlzIGJlY2F1c2UgdXByb2JlIGNhbiBzdGlsbCBiZSBpbnN0YWxs
ZWQgYmVmb3JlCj4gPj4gPiBhcHBseWluZyB0aGUgcGF0Y2guIEJ1dCBJIHRoaW5rIHRoYXQgaXMg
YW5vdGhlciBidWcgdGhhdCBteSBwYXRjaCBhbHNvCj4gPj4gPiBhY2NpZGVudGFsbHkgZml4OiB1
cHJvYmVzIHNob3VsZCBub3QgaW5zdGFsbCBicmVha3BvaW50IGludG8gZWJyZWFrIGluc3RydWN0
aW9ucywKPiA+PiA+IGJ1dCBpdCBpbmNvcnJlY3RseSBkb2VzIHNvIGJlY2F1c2UgaXQgZG9lcyBu
b3QgZXZlbiBrbm93IGFib3V0IHRoZSBleGlzdGVuY2Ugb2YKPiA+PiA+IDMyLWJpdCBlYnJlYWsu
Cj4gPj4KPiA+PiBGV0lXLCBJIGNhbiBzdGlsbCBpbnN0YWxsIHRoZSB1cHJvYmUgYXQgYW4gZWJy
ZWFrIHdpdGggeW91IHBhdGNoLiBJdCdzCj4gPj4gbm90IGhpdCwgYnV0IHN1Y2NlZWRzIHRvIGlu
c3RhbGwuCj4gPgo+ID4gSXQgc2VlbXMgdXByb2JlcyBpbnN0YWxsIGZhaWx1cmVzIGFyZSBjb21w
bGV0ZWx5IHNpbGVudCAoc2VlIHVwcm9iZV9tbWFwKCkgaW4KPiA+IGtlcm5lbC9ldmVudHMvdXBy
b2Jlcy5jKS4gU28gSSB0aGluayBhbHRob3VnaCB1cHJvYmVzIGluc3RhbGwgc2VlbXMgZmluZSwg
aXQKPiA+IGFjdHVhbGx5IGlzIG5vdC4KPgo+IEh1aCwgc28gdGhlcmUncyBubyBjaGVjayBpZiB0
aGUgaW5zdHJ1Y3Rpb24gaXMgYSB2YWxpZCBvbmUgYXQgZXZlbnQKPiByZWdpc3RlciBwb2ludD8K
ClRoZXJlIGFyZSBzb21lIGNoZWNrcyAoZWcuIGlmIHRoZSBwcm9iZSBpcyB3aXRoaW4gdGhlIGJp
bmFyeSksIGJ1dAp0aGV5IGFyZSBub3QgY29tcGxldGUuCgpUaGUgYWN0dWFsIGNoZWNrcyBmb3Ig
dGhlIHZhbGlkaXR5IG9mIHRoZSBpbnN0cnVjdGlvbiBpcyBub3QgZG9uZQp1bnRpbCBpbnN0YWxs
YXRpb24uCgpCZXN0IHJlZ2FyZHMsCk5hbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
