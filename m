Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD6C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDxLB6nEE65brRS4IaiDPefUK3wA6sjw2dSFe8mhewc=; b=KW4ODjwmMi40La
	yduU7ppjsxFdBf1Rqw7w9i4AKLWLMEJizAOwgQpxxk3R3YHOrXP8b4fMayLJqmIMJerEWE80dXXV9
	pbIRVHfF3VLXegFELvQHB1eKyRlune5t9t4zKfA/EnrvNi7+15WXkc3Fwse21X7zIEVGsoupCQYMi
	zC64F9ofmi7pAtsEQnM/1Bh8cY0uyg6ZwHcadLfXvlNEMa4SfDCjB7XiV7XGPcM24tiJjz7jK6d32
	4w0yqrp7hPhvk+C3FGPJbhm7WiRmV66bJogtqCJ/XsMdUYUsVog6WXiQWSArgb9uOyRuyKdzFZqtX
	v0arwMrGYUpFQcNpJ6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw16g-00EdgD-1W;
	Thu, 26 Oct 2023 14:13:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw16d-00EdfV-30
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 51608B83679;
	Thu, 26 Oct 2023 14:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582D9C433C8;
	Thu, 26 Oct 2023 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698329581;
	bh=R9KYlxKWJB6gGknm8vcTM/7d21Ua9yVnP7SPGGNg3F8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I+pbggTwVY91xNv6JzPJe0+EhGE8yqPwCyN35wXhk0kpS8Z5wL8DvoBhVSCpQGsU/
	 mseFpitVquPjtup7BzOhKG0+8vzJDQ0M2S9uVE39GOC3iB2uGkkMbONH5TVjO/g9no
	 pvoRuFWAvthmfQufhMai5On3siiWdFDtL/PXLOI0=
Date: Thu, 26 Oct 2023 07:13:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, Qinglin
 Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Message-Id: <20231026071300.e12dab3be1edd26007db85ee@linux-foundation.org>
In-Reply-To: <CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
	<305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
	<20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
	<CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_071304_130366_BE89CD15 
X-CRM114-Status: GOOD (  14.31  )
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

T24gVGh1LCAyNiBPY3QgMjAyMyAxMDo1NzoyNyArMDIwMCBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDY6MDTi
gK9QTSBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBUdWUsIDMgT2N0IDIwMjMgMTc6NDM6MTAgKzAyMDAgQWxleGFuZHJlIEdoaXRpIDxh
bGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+Cj4gPiA+ICtjYyBBbmRyZXc6IFdvdWxkICB5b3UgbWlu
ZCB0YWtpbmcgdGhpcyBwYXRjaHNldCBpbiB5b3VyIHRyZWUgZm9yIHRoZQo+ID4gPiBuZXh0IHJj
PyBUaGlzIHBhdGNoc2V0IGRlcGVuZHMgb24gYSBwcmV2aW91cyBmaXggZm9yIGFybTY0IHRoYXQg
eW91Cj4gPiA+IG1lcmdlZCBpbiByYzQgd2hpY2ggaXMgbm90IGluIHRoZSByaXNjdiAtZml4ZXMg
YnJhbmNoIHlldC4KPiA+ID4KPiA+ID4gSSBzYXcgd2l0aCBQYWxtZXIgYW5kIGhlIHNob3VsZCBh
Y2sgdGhpcyBzaG9ydGx5Lgo+ID4KPiA+IFdlbGwgSSBncmFiYmVkIHRoZW0gaW50byBtbS5naXQn
cyBtbS1ob3RmaXhlcy11bnN0YWJsZSBxdWV1ZS4gIEFsbAo+ID4gYmVpbmcgd2VsbCBJJ2xsIG1v
dmUgdGhlbSBpbnRvIG1tLWhvdGZpeGVzLXN0YWJsZSB3aXRoaW4gYSB3ZWVrIHRoZW4KPiA+IGlu
dG8gTGludXMgc2hvcnRseSBhZnRlci4KPiAKPiBUaG9zZSBmaXhlcyBmaW5hbGx5IGRpZCBub3Qg
bWFrZSBpdCB0byA2LjYsIEkgd2FzIGhvcGluZyBmb3IgdGhlbSB0bwo+IGxhbmQgaW4gLXJjNiBv
ciAtcmM3OiBmb3IgdGhlIGZ1dHVyZSwgd2hhdCBzaG91bGQgaGF2ZSBJIGRvbmUgdG8gYXZvaWQK
PiB0aGF0PwoKVGhleSdyZSBtZXJnZWQgaW4gTGludXMncyB0cmVlLgoKNmYxYmFjZTlhOWZiIGFy
bTY0OiBodWdldGxiOiBmaXggc2V0X2h1Z2VfcHRlX2F0KCkgdG8gd29yayB3aXRoIGFsbCBzd2Fw
IGVudHJpZXMKOTM1ZDRmMGM2ZGM4IG1tOiBodWdldGxiOiBhZGQgaHVnZSBwYWdlIHNpemUgcGFy
YW0gdG8gc2V0X2h1Z2VfcHRlX2F0KCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
