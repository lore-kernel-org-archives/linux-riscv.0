Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D67C677C4
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hicp1f+Dc7+I/XKiiQ0Pb5VzCUoU/dgobyPd/bXIe+4=; b=3Iyg44rEBIJ/Al
	SMB5ThqbxPUpwwTCBB7a5YZ48zC3V933D8wk5wB+55NwSo4zqJLRxMmB3IUAy3o/rNiNWIVYV0F5T
	3x4wAg6426s7oSIEnJuVXgKyfz7UR6/wzdYua6CAiaPnUQN9SFB8X6TMs5aLWRSRtaJ3VmpkDP8cE
	rZHdrsGH5I9ygIlt05EbTnp17fvubH1oFEpLujlxq07oBfVa2VD16Gd1j0YmQclGYQclJWSAn/q92
	PULV8BeHfR9NbAq8tVZFfKlYOqXmmmYEFBAWMBHxKRJL3I+9jxsRghjmy3c+nyAFSebdeFUWoH3Yg
	xDgpyeVK+vLbS3QAtlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXhX-00000003eOn-22Lm;
	Mon, 09 Jun 2025 08:17:51 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXfP-00000003eCc-0kUa;
	Mon, 09 Jun 2025 08:15:40 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a44b9b2af8so24062851cf.3;
        Mon, 09 Jun 2025 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749456937; x=1750061737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=SMts9hkabMXcQzpHPZrZBCa/dAKmouK8/xf+8QHjuDXCJ7U+a5PG6JfmWwBt/2N3WI
         tms8nsnlT+FCeY7ThjHn+i3OlLg20JDBymScjoXLSH+d0z3XTh/Fzddjdp21AxHrHbeK
         NLUxOArRARMNybxmM+aGMe2vGhMKIR6QLMDqJZUD/XiZkgYpnZkn9VSf2452KL31L2SR
         vcIHxVz7+S2kBsCXkUiSCOqkaYfxnTbNzRUgoTm8kMyFpkvdBnEKswQgR026NqlFRaNO
         rZxBOqM0Y/w986YFHErq53qgNDeVtDwB9X8QaGmJ3Gl0Ce/q6jlXIsNNMSFxizzxSv0l
         xs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456937; x=1750061737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=CRfU+sS+DmjHS1zx4Ui0/Yg4kVn2+uEQUqzM+4UF3m8niMwk1doNTgX82Q9L77BnGh
         fDeQHOmnRtEGRdDDqlifgeqBk0rK6Fx4qCUenWpmp3ndhK0lJbyt3QicGyIzdlsGeiP7
         zXTdQwKwAQ0P1xb+G4lJnMRcvbqB3AJn96t3yZoKTnrrvpSigWwr1a0R1Grpv518eyHD
         Qw2yFfpzeIdeHBytEPZB16iQryTPzS7s08lhiJ7AglZ+luiBKxz9OvfqMjAMxyTIqOgj
         11TaTMbbzOY/rxdnZfvpYXeFxsI5/vMs6ES9rcGDFyY6zqkLydPc5yMTHREx9+IVeEhX
         oIeg==
X-Forwarded-Encrypted: i=1; AJvYcCUdU3hlaLv+8Hlhmf51CXyRYBP1v8xMzW4XIJacYEfuRyXqC/UmLKM6sFNs7cbHdLCnthiyF9lJ1sLid2w=@lists.infradead.org, AJvYcCWnhGZb/Hd+eNwhOw+lxIxlazZXiF3QJpmnW2gy0wpA1sPejWtBPTcRN4Z7QP/NydC3rcEbKkDC9RkxW+x3q5sp@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8jWvsNS6l0aYoyrQBGkAXcnlfCyzvX5NZwzNkQP3BkbG+f3T
	WTRoh8GCJDZnV5hhAMU9bksvHhyPOcNYMpzcei49Z3PtNT3Lg24Frr+dlQtuoOVwIA8EZDmTm6d
	l4HGPbC2gj6A65Hq7IUzr1/bexFh1BBQ=
X-Gm-Gg: ASbGncvZYNdm4WnWLj+4Vprbykqy4UbkTkwXt+UMSGI/ycGTTzZs6PnsAs+PLCet/sx
	6aWpxDun/VBpV/JmwxPPk5CXCn6oDw9cK2Yf36/CB5bcb5dJBVfegoLkijamDiDnTDduttfruzT
	G8bew+0Hcs+jnitMAngdEJ7xSxE3iiGctP
X-Google-Smtp-Source: AGHT+IH9me4CEdVFtIOCuIg1XAKf5VF3TkyjvnvcV85fkEmF6RBw78F2p/ZOsZjFija3GtR5SXP0ijToaYQxk0VMGhA=
X-Received: by 2002:ad4:5f09:0:b0:6fa:c81a:6204 with SMTP id
 6a1803df08f44-6fb08f50942mr228433326d6.10.1749456937558; Mon, 09 Jun 2025
 01:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org>
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 9 Jun 2025 18:15:24 +1000
X-Gm-Features: AX0GCFtpUUxU8yEaZey6YSh4XuBhQlOITIBZOiB21tfxDGQbnIThjp-0HFxjxHQ
Message-ID: <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_011539_220370_E62FA96B 
X-CRM114-Status: GOOD (  23.10  )
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

SGkgRXJpYywKCk9uIFN1biwgSnVuIDgsIDIwMjUgYXQgNjowN+KAr0FNIEVyaWMgQmlnZ2VycyA8
ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBpcyBhbHNvIGF2YWls
YWJsZSBhdDoKPgo+ICAgICBnaXQgZmV0Y2ggaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvZWJpZ2dlcnMvbGludXguZ2l0IGxpYi1jcmMtYXJjaC12Mgo+Cj4g
VGhpcyBzZXJpZXMgaW1wcm92ZXMgaG93IGxpYi9jcmMgc3VwcG9ydHMgYXJjaC1vcHRpbWl6ZWQg
Y29kZS4gIEZpcnN0LAo+IGluc3RlYWQgb2YgdGhlIGFyY2gtb3B0aW1pemVkIENSQyBjb2RlIGJl
aW5nIGluIGFyY2gvJChTUkNBUkNIKS9saWIvLCBpdAo+IHdpbGwgbm93IGJlIGluIGxpYi9jcmMv
JChTUkNBUkNIKS8uICBTZWNvbmQsIHRoZSBBUEkgZnVuY3Rpb25zIChlLmcuCj4gY3JjMzJjKCkp
LCBhcmNoLW9wdGltaXplZCBmdW5jdGlvbnMgKGUuZy4gY3JjMzJjX2FyY2goKSksIGFuZCBnZW5l
cmljCj4gZnVuY3Rpb25zIChlLmcuIGNyYzMyY19iYXNlKCkpIHdpbGwgbm93IGJlIHBhcnQgb2Yg
YSBzaW5nbGUgbW9kdWxlIGZvcgo+IGVhY2ggQ1JDIHR5cGUsIGFsbG93aW5nIGJldHRlciBpbmxp
bmluZyBhbmQgZGVhZCBjb2RlIGVsaW1pbmF0aW9uLiAgVGhlCj4gc2Vjb25kIGNoYW5nZSBpcyBt
YWRlIHBvc3NpYmxlIGJ5IHRoZSBmaXJzdC4KPgo+IEFzIGFuIGV4YW1wbGUsIGNvbnNpZGVyIENP
TkZJR19DUkMzMj1tIG9uIHg4Ni4gIFdlJ2xsIG5vdyBoYXZlIGp1c3QKPiBjcmMzMi5rbyBpbnN0
ZWFkIG9mIGJvdGggY3JjMzIteDg2LmtvIGFuZCBjcmMzMi5rby4gIFRoZSB0d28gbW9kdWxlcwo+
IHdlcmUgYWxyZWFkeSBjb3VwbGVkIHRvZ2V0aGVyIGFuZCBhbHdheXMgYm90aCBnb3QgbG9hZGVk
IHRvZ2V0aGVyIHZpYQo+IGRpcmVjdCBzeW1ib2wgZGVwZW5kZW5jeSwgc28gdGhlIHNlcGFyYXRp
b24gcHJvdmlkZWQgbm8gYmVuZWZpdC4KPgo+IE5vdGU6IGxhdGVyIEknZCBsaWtlIHRvIGFwcGx5
IHRoZSBzYW1lIGRlc2lnbiB0byBsaWIvY3J5cHRvLyB0b28sIHdoZXJlCj4gb2Z0ZW4gdGhlIEFQ
SSBmdW5jdGlvbnMgYXJlIG91dC1vZi1saW5lIHNvIHRoaXMgd2lsbCB3b3JrIGV2ZW4gYmV0dGVy
Lgo+IEluIHRob3NlIGNhc2VzLCBmb3IgZWFjaCBhbGdvcml0aG0gd2UgY3VycmVudGx5IGhhdmUg
MyBtb2R1bGVzIGFsbAo+IGNvdXBsZWQgdG9nZXRoZXIsIGUuZy4gbGlic2hhMjU2LmtvLCBsaWJz
aGEyNTYtZ2VuZXJpYy5rbywgYW5kCj4gc2hhMjU2LXg4Ni5rby4gIFdlIHNob3VsZCBoYXZlIGp1
c3Qgb25lLCBpbmxpbmUgdGhpbmdzIHByb3Blcmx5LCBhbmQKPiByZWx5IG9uIHRoZSBjb21waWxl
cidzIGRlYWQgY29kZSBlbGltaW5hdGlvbiB0byBkZWNpZGUgdGhlIGluY2x1c2lvbiBvZgo+IHRo
ZSBnZW5lcmljIGNvZGUgaW5zdGVhZCBvZiBtYW51YWxseSBzZXR0aW5nIGl0IHZpYSBrY29uZmln
Lgo+Cj4gSGF2aW5nIGFyY2gtc3BlY2lmaWMgY29kZSBvdXRzaWRlIGFyY2gvIHdhcyBzb21ld2hh
dCBjb250cm92ZXJzaWFsIHdoZW4KPiBaaW5jIHByb3Bvc2VkIGl0IGJhY2sgaW4gMjAxOC4gIEJ1
dCBJIGRvbid0IHRoaW5rIHRoZSBjb25jZXJucyBhcmUKPiB3YXJyYW50ZWQuICBJdCdzIGJldHRl
ciBmcm9tIGEgdGVjaG5pY2FsIHBlcnNwZWN0aXZlLCBhcyBpdCBlbmFibGVzIHRoZQo+IGltcHJv
dmVtZW50cyBtZW50aW9uZWQgYWJvdmUuICBUaGlzIG1vZGVsIGlzIGFscmVhZHkgc3VjY2Vzc2Z1
bGx5IHVzZWQKPiBpbiBvdGhlciBwbGFjZXMgaW4gdGhlIGtlcm5lbCBzdWNoIGFzIGxpYi9yYWlk
Ni8uICBUaGUgY29tbXVuaXR5IG9mIGVhY2gKPiBhcmNoaXRlY3R1cmUgc3RpbGwgcmVtYWlucyBm
cmVlIHRvIHdvcmsgb24gdGhlIGNvZGUsIGV2ZW4gaWYgaXQncyBub3QgaW4KPiBhcmNoLy4gIEF0
IHRoZSB0aW1lIHRoZXJlIHdhcyBhbHNvIGEgZGVzaXJlIHRvIHB1dCB0aGUgbGlicmFyeSBjb2Rl
IGluCj4gdGhlIHNhbWUgZmlsZXMgYXMgdGhlIG9sZC1zY2hvb2wgY3J5cHRvIEFQSSwgYnV0IHRo
YXQgd2FzIGEgbWlzdGFrZTsgbm93Cj4gdGhhdCB0aGUgbGlicmFyeSBpcyBzZXBhcmF0ZSwgdGhh
dCdzIG5vIGxvbmdlciBhIGNvbnN0cmFpbnQgZWl0aGVyLgoKUXVpY2sgcXVlc3Rpb24sIGFuZCBh
cG9sb2dpZXMgaWYgdGhpcyBoYXMgYmVlbiBjb3ZlcmVkIGVsc2V3aGVyZS4KCldoeSBub3QganVz
dCB1c2UgY2hvaWNlIGJsb2NrcyBpbiBLY29uZmlnIHRvIGNob29zZSB0aGUgY29tcGlsZWQtaW4K
Y3JjMzIgdmFyaWFudCBpbnN0ZWFkIG9mIHRoaXMgc29tZXdoYXQgaW5kaXJlY3Qgc2NoZW1lPwoK
VGhpcyB3b3VsZCBrZWVwIHRoZSBkZXBlbmRlbmNpZXMgZ3JvdXBlZCBieSBhcmNoIGFuZCBwcm92
aWRlIGEgc2luZ2xlCnBsYWNlIHRvIGNob29zZSB3aGV0aGVyIHRoZSBnZW5lcmljIG9yIGFyY2gt
c3BlY2lmaWMgbWV0aG9kIGlzIHVzZWQuCgpJdCB3b3VsZCBhbHNvIGFsbG93IGZvciBhbHRlcm5h
dGl2ZXMgaWYgdGhhdCBldmVyIGJlY29tZXMgYSB0aGluZyBhbmQKY29tcGlsZSB0ZXN0aW5nIG9m
IHRoZSBhcmNoLXNwZWNpZmljIHZhcmlhbnRzIGlmIHRoYXQgZXZlbiBvZmZlcnMgYW55CmFjdHVh
bCB2YWx1ZS4KClRoYW5rcywKCi0tIApKdWxpYW4gQ2FsYWJ5CgpFbWFpbDoganVsaWFuLmNhbGFi
eUBnbWFpbC5jb20KUHJvZmlsZTogaHR0cDovL3d3dy5nb29nbGUuY29tL3Byb2ZpbGVzL2p1bGlh
bi5jYWxhYnkvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
