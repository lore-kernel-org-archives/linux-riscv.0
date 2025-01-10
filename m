Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFC7E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDSrjwz4SyZ6sBB7MmebIuAgwgLQcp3t2QXotcqV8Vw=; b=QNIoSnKIcuQB8S
	flH2woxumfQiTPpBW91sJfhAK11eLFzMVQs5Puxtu2s+iwEL/GPYSgmAQtyYk6fj4/2jYUVStfGX+
	AYfCNYj5qcn3QnxHqisn02ak/6qmziyWyBAddo5ZyQCnOEROj7aXtNMna1ARgRaNh4bw0MGyXEqsP
	W53azb7PqtzvjjYmkdsiGIJotMNvFY/jaFJZ0n8p5uXzjIMmBaBoz8AS+Dqx/Ajpz/zhPlwaGUQjx
	o5CAu87uowP0lkvcI32aIxGOhU95h9Ghc2S0eNwunAhpBVQ5XyK9gsdzDjkI5LjB/pJm/q5wEsG9W
	sGsEOHt+8lDTkPfDL9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDuA-0000000FDzH-3Zlt;
	Fri, 10 Jan 2025 12:14:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDu7-0000000FDyA-49FS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 12:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 255665C5E7D
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 12:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEBFC4CEDF
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736511258;
	bh=LKo8bpEtYIe5t1VceBxZS22BvfVVDlhIZm0EoNnQYEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XlLK6X/dS8tqVWhYOAJVc4GMdupJU0aj3EbEpgjG5ELiHvIrp92f3An90gvP6r2uF
	 Sdt/RO5yWD7whAscqg2x5vvLmkc9ghXYG5ku1ARD8cLJ+rRcYQpK6BwZxyNBXrnLme
	 hoKYYPLj3VdnAUhSbldJrWSjomkiBzk3BmFpUcOgnUwOCvTxzXaeLySIONJc527TwB
	 GoN3HeoEsM5+phLM6E6RMX5B3AFozfV1N/gDFazPfOTcfg/IFsfnTiWW2eLEI8yR/X
	 f3UuqtrVqHKrjts5F5wgKfObTlnpW+BuOLR6Mb31EUaMP1tc28G3LRp83iL1op8R8U
	 nLg2+pu6IUEeQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1977151e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 04:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjHqKRwyqDd34POC3ET5HKLfathgL72liOTu1VKs0EKDU2zPhtB7p06ZyJwOuc4a113Vgg1MX5Tp/F2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqNLMJT6LsbUiyF7c1bLlXFnzWuQVeKUoWAed9yNrV1rKsO1oB
	501DUjlCSDnvHbg+PXCFLpghhCEW2M7oI8c2DrBoJ095JIydQ9jDrmjMOxQsyVFT2G9+Cs6ey2G
	NASaVLrXIvR4UGFPsQue1g7UcmfM=
X-Google-Smtp-Source: AGHT+IH34RNFIsnvALe6AjqSTDDJWj/TiAsDt+LHFUd3XT4Qq1HhowlIi4/eiuJedBUmy+/wHA0rdXMqF+/iSLbSmak=
X-Received: by 2002:a05:6512:1149:b0:540:2201:57d1 with SMTP id
 2adb3069b0e04-542845c01b8mr3284401e87.49.1736511257474; Fri, 10 Jan 2025
 04:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com>
In-Reply-To: <20250110082744.457067-2-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jan 2025 21:13:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
X-Gm-Features: AbW1kvYJSJ4ULPz9l8U8QGvpjCXJw-r5-U5EtXUed8QBmqt7AOBtvhMEG4S3Zrw
Message-ID: <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041420_111358_F62BF58F 
X-CRM114-Status: GOOD (  10.82  )
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

T24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgNToyOOKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiK2dp
dEBnb29nbGUuY29tPiB3cm90ZToKPgo+IEZyb206IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5l
bC5vcmc+Cj4KPiBEdWUgdG8gdGhlIGZhY3QgdGhhdCBydW50aW1lIGNvbnN0IEVMRiBzZWN0aW9u
cyBhcmUgbmFtZWQgd2l0aG91dCBhCj4gbGVhZGluZyBwZXJpb2Qgb3IgZG91YmxlIHVuZGVyc2Nv
cmUsIHRoZSBSU1RSSVAgbG9naWMgdGhhdCByZW1vdmVzIHRoZQo+IHN0YXRpYyBSRUxBIHNlY3Rp
b25zIGZyb20gdm1saW51eCBmYWlscyB0byBpZGVudGlmeSB0aGVtLiBUaGlzIHJlc3VsdHMKPiBp
biBhIHNpdHVhdGlvbiBsaWtlIGJlbG93LCB3aGVyZSBzb21lIHNlY3Rpb25zIHRoYXQgd2VyZSBz
dXBwb3NlZCB0byBnZXQKPiByZW1vdmVkIGFyZSBsZWZ0IGJlaGluZC4KPgo+ICAgW05yXSBOYW1l
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVHlwZSAgICAgICAgICAgIEFkZHJlc3MgICAg
ICAgICAgT2ZmICAgICBTaXplICAgRVMgRmxnIExrIEluZiBBbAo+Cj4gICBbNThdIHJ1bnRpbWVf
c2hpZnRfZF9oYXNoX3NoaWZ0ICAgICAgICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY1
MCAyOTAwZjUwIDAwMDAxNCAwMCAgIEEgIDAgICAwICAxCj4gICBbNTldIC5yZWxhcnVudGltZV9z
aGlmdF9kX2hhc2hfc2hpZnQgICBSRUxBICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2
ZjAwIDAwMDA3OCAxOCAgIEkgNzAgIDU4ICA4Cj4gICBbNjBdIHJ1bnRpbWVfcHRyX2RlbnRyeV9o
YXNodGFibGUgICAgICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY2OCAyOTAwZjY4IDAw
MDAxNCAwMCAgIEEgIDAgICAwICAxCj4gICBbNjFdIC5yZWxhcnVudGltZV9wdHJfZGVudHJ5X2hh
c2h0YWJsZSBSRUxBICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2Zjc4IDAwMDA3OCAx
OCAgIEkgNzAgIDYwICA4Cj4gICBbNjJdIHJ1bnRpbWVfcHRyX1VTRVJfUFRSX01BWCAgICAgICAg
ICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY4MCAyOTAwZjgwIDAwMDIzOCAwMCAgIEEg
IDAgICAwICAxCj4gICBbNjNdIC5yZWxhcnVudGltZV9wdHJfVVNFUl9QVFJfTUFYICAgICBSRUxB
ICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2ZmYwIDAwMGQ1MCAxOCAgIEkgNzAgIDYy
ICA4Cj4KPiBTbyB0d2VhayB0aGUgbWF0Y2ggZXhwcmVzc2lvbiB0byBzdHJpcCBhbGwgc2VjdGlv
bnMgc3RhcnRpbmcgd2l0aCAucmVsLgo+IFdoaWxlIGF0IGl0LCBjb25zb2xpZGF0ZSB0aGUgbG9n
aWMgdXNlZCBieSBSSVNDLVYsIHMzOTAgYW5kIHg4NiBpbnRvIGEKPiBzaW5nbGUgc2hhcmVkIE1h
a2VmaWxlIGxpYnJhcnkgY29tbWFuZC4KCkkgZG8gbm90IGtub3cgaG93IHRoaXMgd29ya3MgYmVj
YXVzZSBhcmNoLyovTWFrZWZpbGUucG9zdApkbyBub3QgaW5jbHVkZSBzY3JpcHRzL01ha2VmaWxl
LmxpYgoKCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
