Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6DBCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Khu9/cgTZQ9+RBIdVtkPgdn4ugTXUYDtuHumxyfMvOI=; b=SaKSwM5NeMYLGz
	k9ECz/hqEWozRVVqmZ/aVp/0kC4aVRIIEQy0IdX5vFmI4oG6SrfE8IUOs3Bgj+IYUCOt5WjtTD2YN
	IL7PvhiLnm6B9HUz84U7gptCSDAbZaUbmWuqDP78AtHYzdFQf7hgMsI9S/p1Kq6bx7IArQYSaCFFF
	G5P66yhnvovSCnCpXhaUp6ylV2p596CMR+IPS08tARkCLpZO7gB1eHoHwRImjhooGX4l13Ah8Jw0R
	jo1YDYDk5RPV2MF/G6MMrugOLa0jnX/nTLkvJnpsWL9iBFyRxoZ9enfP2cx6b8fc4KaAfUnsAGo2F
	pmNArKNhohc+37TnPw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ3k-0000000B09c-42Jb;
	Fri, 22 May 2026 13:37:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ3i-0000000B08e-2vo3
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 189B2445E4
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 13:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0109B1F00ADF
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457022;
	bh=C7jCFBMio8K0Or68UFlDneGQgQYEn3dFY8g5R8vlQ3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dHCPS0j5rxrJjkB2TMCR0j4Cw/BEn0OeWtirMSUhWDXQKhyVGGimD90AnoqgaAi6V
	 bdrBEAKNC9mA+eoiEzvLWvOtr4LeaTn66wBkp8Y6GpL0Z7mESarrh7f8m94qmNlnsD
	 Lc1PyEqv9B+uZ70gVDPyB3Vmirnln+JgEklX/eC8dYG40GTKEjOETf/2Y4jh1BWhi2
	 NOIihQ5qwhsBKs5WSjSiDQbFQPL/BWRfRbAAFcsGRXRnTemitBC3yESCzG2xaEvKEZ
	 g9MgECdHZFjYQ7+P/2rqCKnOX2keCNa/7/kHWuqyMTnWKMGKhaDpfKitlNo7NRghta
	 cej1OCj8WnMGw==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9125284a8ecso841344285a.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 06:37:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n8um0xfeXYtNu9RC7B53tnFUTshOFz5BAhmr63xfkJXXSbMS/3fZCgfDnzpqRWXYCTm4oGSN3ZVO9+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH0povzNddEVsENdI5yLjxZ3dbwbBKw2MSsMS4tHXChhE1i+d/
	vNMcAV37Ff0Se7jc9JoTYBqe8M1CLbv05Ie5do82vF+j41IQCUDyOeUbuLyi11RFeGltQpF0ReS
	EkSdJhPJ8xiKOaoRv4jKFZnjpO9Ds89k=
X-Received: by 2002:a05:620a:6504:b0:8cd:b2e9:b964 with SMTP id
 af79cd13be357-914b46c93e1mr518488285a.10.1779457020872; Fri, 22 May 2026
 06:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <ag4kj84EcKqamdB-@casper.infradead.org> <20260522023305.98223-1-baohua@kernel.org>
 <ahBVh4NM2uoyhPNm@casper.infradead.org>
In-Reply-To: <ahBVh4NM2uoyhPNm@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 22 May 2026 21:36:47 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaSBeriPtvEQSWcigqMwNrFp0xeuPJ9HmpgpM3WX7gXW9tFi64IFdXgU8
Message-ID: <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, bhe@redhat.com, chentao@kylinos.cn, 
	chrisl@kernel.org, david@kernel.org, jack@suse.cz, kasong@tencent.com, 
	kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	liyangouwen1@oppo.com, ljs@kernel.org, loongarch@lists.linux.dev, 
	mhocko@suse.com, nphamcs@gmail.com, nzzhao@126.com, pfalcato@suse.de, 
	rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com, 
	vbabka@kernel.org, wanglian@kylinos.cn, youngjun.park@lge.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063702_749884_F0B37EF5 
X-CRM114-Status: GOOD (  10.71  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgOTowOeKAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDEwOjMzOjA1
QU0gKzA4MDAsIEJhcnJ5IFNvbmcgKFhpYW9taSkgd3JvdGU6Cj4gPiBuZWVkIHRvIHRvdWNoIGBm
aWxlbWFwLmNgIGF0IGFsbCAocHJvYmFibHkgYmVjYXVzZSB5b3UgYXJlIGFscmVhZHkKPiA+IG1h
aW50YWluaW5nIGBmaWxlbWFwLmNgIHBlcmZlY3RseSk6Cj4KPiBJJ20gZ29pbmcgdG8gZ2l2ZSB5
b3Ugb25lIGNoYW5jZSB0byBhcG9sb2dpc2UgZm9yIHRoYXQuCgpBcG9sb2dpZXMgaWYgbXkgd29y
ZGluZyBjYXVzZWQgYW55IG1pc3VuZGVyc3RhbmRpbmcuClRoYXQgd2FzIG5vdCBteSBpbnRlbnRp
b24gYXQgYWxsLgoKV2hhdCBJIG1lYW50IGlzIHRoYXQgZmlsZW1hcC5jIGFscmVhZHkgaGFzIGEg
dmVyeQpzb2xpZCBkZXNpZ24uCgpGb3IgbWVtb3J5LmMsIEkgaGFkIHRvIHRvdWNoIHNldmVyYWwg
cGxhY2VzIGZvciB0aGUKYmxhY2tsaXN0OyBvdGhlcndpc2UsIHRoZSBrZXJuZWwgd291bGQgaGFu
Zy4KCkJ1dCBmb3IgZmlsZW1hcC5jLCBJIGJhc2ljYWxseSBkaWRuJ3QgbmVlZCB0byB0b3VjaAph
bnl0aGluZywgYW5kIHByZWxpbWluYXJ5IHRlc3Rpbmcgc2hvd3Mgbm8gaXNzdWVzIGFmdGVyCm1v
dmluZyBpdCBmcm9tIHRoZSB3aGl0ZWxpc3QgdG8gdGhlIGJsYWNrbGlzdC4gVGhpcyBpcwpwcm9i
YWJseSBiZWNhdXNlIHRoZSBjdXJyZW50IGZpbGVtYXAuYyBkZXNpZ24gaXMKYWxyZWFkeSBoYW5k
bGluZyBzb21lIGFzcGVjdHMgcmVhbGx5IHdlbGwuCgpUaGF0IGlzIGFsbCBJIG1lYW50LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
