Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB6BC001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7KEeZR9kLn1u5MXKWVfFp9H0jml2zMM5Rw4n1Zz5TU=; b=s7Ckes+SpChMQ8
	3Km3QrgFsb841AWn/H9xz5WDSXeXH9dhYeQNe4LE/RZ+aA135fGXShH6Jaiax2qwXw4cZ8msubeKW
	AgtDYksQ1GqV5OW+pc3ZgvcQ9M14B0hLgZQCxMfBGocsIsY04y3xil7sitJO4Nh2GXFfri9b6/iOe
	P/6nfcSPdpMZiozxqbwlaNIhEC+el0kQhL21pC6e2f7QTHcSOZsTtBHUYcyXwMU3oX89rN/uGWHu3
	6P1wmIZ57A4pwgoAHj5n0OJR6YAqGLylq/JU742JECfzxxAJAwr4DGlrI9xRJ8CQiiYsTIh8YWJ1Z
	f+mAzGwW1cxwWP9BLwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsgY-00EX63-1k;
	Fri, 21 Jul 2023 16:08:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsgW-00EX5W-0G
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 16:08:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 357B861D29
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 16:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98634C43391
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689955730;
	bh=aFVATYbnHbXl+l/aXY946VlByUUM/RJ2gC+IwOCTwNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tzdHW6zWPwp4AgsuyQ5HxWoNFyI7xT0WtDW/oT93THjgq9F1kGpoUHW6PHgpX/Dbv
	 cHrGuupwj2nmxqlceLkgfOIK4mjW5sQXt6ZsDOj7xZhptco1KtiUCNLTikflDgoW4S
	 xtmCvfJofarYh4i3g7YUHeTGSlasGWyKrnhBuCDC+3q95a1OtsEhiDXCYBpAJK/9Z2
	 pZ67cgiULI8dFMNzALoJ0pbgoyLtw3c1sjpGkDlC/vi/+ZhY28dwd0p29UAoQE7wSw
	 YAmhntfEm/bbOrRYIrdGbFg1AuIBjwKO+/hS0/s8LRAISAU3oSAs+CAWrBn47JTYl4
	 Au1gehkWyrvaw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-992f15c36fcso331908566b.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 09:08:50 -0700 (PDT)
X-Gm-Message-State: ABy/qLbpiIaQUZAbc3ijSTP80TW12ESH9hSDW8nFaMSAJ0MqRwYMPjIJ
	21I00mxJ+PMGJWbvVxvF/saNhq6LPJW5ZRtZF3Q=
X-Google-Smtp-Source: APBJJlFzx8ZYFFr2o+NPKH3p58vjaLT9QNxTJBi8tIkxzVzR9iKmIT333myWzMMGD/LRl9RKizHNRUsBu66ZOvoJM5M=
X-Received: by 2002:a17:906:100c:b0:99b:518a:9de with SMTP id
 12-20020a170906100c00b0099b518a09demr1982530ejm.42.1689955728742; Fri, 21 Jul
 2023 09:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230721145121.1854104-1-guoren@kernel.org> <5e5be2d4-c563-6beb-b5f5-df47edeebc83@ghiti.fr>
In-Reply-To: <5e5be2d4-c563-6beb-b5f5-df47edeebc83@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 22 Jul 2023 00:08:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQMAVUtC6_ftEwp=EeYR_O7yzfGYmxwrqcO6+hn2J32bA@mail.gmail.com>
Message-ID: <CAJF2gTQMAVUtC6_ftEwp=EeYR_O7yzfGYmxwrqcO6+hn2J32bA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Fixup spurious fault of kernel vaddr
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, falcon@tinylab.org, 
	bjorn@kernel.org, conor.dooley@microchip.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_090852_222319_3CD43995 
X-CRM114-Status: GOOD (  23.42  )
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

T24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgMTE6MTnigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4KPiBPbiAyMS8wNy8yMDIzIDE2OjUxLCBndW9yZW5Aa2VybmVs
Lm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4K
PiA+Cj4gPiBSSVNDLVYgc3BlY2lmaWNhdGlvbiBwZXJtaXRzIHRoZSBjYWNoaW5nIG9mIFBURXMg
d2hvc2UgViAoVmFsaWQpCj4gPiBiaXQgaXMgY2xlYXIuIE9wZXJhdGluZyBzeXN0ZW1zIG11c3Qg
YmUgd3JpdHRlbiB0byBjb3BlIHdpdGggdGhpcwo+ID4gcG9zc2liaWxpdHksIGJ1dCBpbXBsZW1l
bnRlcnMgYXJlIHJlbWluZGVkIHRoYXQgZWFnZXJseSBjYWNoaW5nCj4gPiBpbnZhbGlkIFBURXMg
d2lsbCByZWR1Y2UgcGVyZm9ybWFuY2UgYnkgY2F1c2luZyBhZGRpdGlvbmFsIHBhZ2UKPiA+IGZh
dWx0cy4KPiA+Cj4gPiBTbyB3ZSBtdXN0IGtlZXAgdm1hbGxvY19mYXVsdCBmb3IgdGhlIHNwdXJp
b3VzIHBhZ2UgZmF1bHRzIG9mIGtlcm5lbAo+ID4gdmlydHVhbCBhZGRyZXNzIGZyb20gYW4gT29P
IG1hY2hpbmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFs
aWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jIHwgMyArLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+IGlu
ZGV4IDg1MTY1ZmU0MzhkOC4uZjY2MmM5ZWFlN2Q0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9tbS9mYXVsdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+IEBAIC0yNTgs
OCArMjU4LDcgQEAgdm9pZCBoYW5kbGVfcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiA+ICAgICAgICAqIG9ubHkgY29weSB0aGUgaW5mb3JtYXRpb24gZnJvbSB0aGUgbWFzdGVyIHBh
Z2UgdGFibGUsCj4gPiAgICAgICAgKiBub3RoaW5nIG1vcmUuCj4gPiAgICAgICAgKi8KPiA+IC0g
ICAgIGlmICgoIUlTX0VOQUJMRUQoQ09ORklHX01NVSkgfHwgIUlTX0VOQUJMRUQoQ09ORklHXzY0
QklUKSkgJiYKPiA+IC0gICAgICAgICB1bmxpa2VseShhZGRyID49IFZNQUxMT0NfU1RBUlQgJiYg
YWRkciA8IFZNQUxMT0NfRU5EKSkgewo+ID4gKyAgICAgaWYgKHVubGlrZWx5KGFkZHIgPj0gVEFT
S19TSVpFKSkgewo+ID4gICAgICAgICAgICAgICB2bWFsbG9jX2ZhdWx0KHJlZ3MsIGNvZGUsIGFk
ZHIpOwo+ID4gICAgICAgICAgICAgICByZXR1cm47Cj4gPiAgICAgICB9Cj4KPgo+IENhbiB5b3Ug
c2hhcmUgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBmaXggaGVyZT8KV2UgbWV0IGEgc3B1cmlvdXMg
cGFnZSBmYXVsdCBwYW5pYyBvbiBhbiBPb08gbWFjaGluZS4KCjEuIFRoZSBwcm9jZXNzb3Igc3Bl
Y3VsYXRpdmUgZXhlY3V0aW9uIGJyaW5ncyB0aGUgVj0wIGVudHJpZXMgaW50byB0aGUKVExCIGlu
IHRoZSBrZXJuZWwgdmlydHVhbCBhZGRyZXNzLgoyLiBMaW51eCBrZXJuZWwgaW5zdGFsbHMgdGhl
IGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Mgd2l0aCB0aGUgcGFnZSwgYW5kIFY9MQozLiBXaGVuIGtl
cm5lbCBjb2RlIGFjY2VzcyB0aGUga2VybmVsIHZpcnR1YWwgYWRkcmVzcywgaXQgd291bGQgcmFp
c2UKYSBwYWdlIGZhdWx0IGFzIHRoZSBWPTAgZW50cnkgaW4gdGhlIHRsYi4KNC4gTm8gdm1hbGxv
Y19mYXVsdCwgdGhlbiBwYW5pYy4KCj4KPiBJIGhhdmUgYSBmaXggKHRoYXQncyBjdXJyZW50bHkg
cnVubmluZyBvdXIgQ0kpIGZvciBjb21taXQgN2QzMzMyYmUwMTFlCj4gKCJyaXNjdjogbW06IFBy
ZS1hbGxvY2F0ZSBQR0QgZW50cmllcyBmb3Igdm1hbGxvYy9tb2R1bGVzIGFyZWEiKSB0aGF0Cj4g
aW1wbGVtZW50cyBmbHVzaF9jYWNoZV92bWFwKCkgc2luY2Ugd2UgbG9zdCB0aGUgdm1hbGxvY19m
YXVsdC4KQ291bGQgeW91IHNoYXJlIHRoYXQgcGF0Y2g/Cgo+CgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
