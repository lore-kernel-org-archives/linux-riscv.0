Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB5FCCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6+uNRdCDXwZPfxpPQN5lLrTA/RmmcynJSO8W3fzUbw=; b=m9lI1599IO6o4z
	Do+VfzaNd/VtmK0p3AWZCkLhNdF26NJwiO2pyoOpVkGr/CXAKdc0IsGcVqhzlJVa6K7veerxr2K6B
	wRmaV9nrrJ7eE33tQ26Fi4erviLsGmJTBw9sGaBKdcealyf3jkPdgpfmVQ9tB3Go8nZ2g9gX5OP8O
	nT6N9y6zTm/yEOCQRzOevhrTIcuBUaIGmdBQhIizmbS6ssq/unNmP5PDn/tbZnCePZtMNQv5lSFfB
	WYvQ1k2sMcevPLiem4a4tIj02V/09ulesYAEEfcI8Le1KZ430ukiKg/ExBFeX0sbf2BGWbyj7L/Ab
	whewikJcMrNo9wAL31Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCg8f-0000000BOKH-3Yc8;
	Sat, 25 Oct 2025 15:25:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCg8d-0000000BOJp-13HF
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 15:25:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so713505066b.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761405901; x=1762010701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEsLv/ORWjWt4JjusiVyw1pkRSWkY2jVnldvJ/kYxAc=;
        b=gemdcTqpH5ikkNfbvbezOAb8AFKbNcNp3dIHt7dbQOgfbYRkmlBFuAO6mnv4iWxuP5
         PJR/5UmcJjLyTVRKTikbOCWMrNS+O2m7s2ZYjVo7zeOqs75M/cKKw4JUMCUebZ0mI2Mz
         nGLo/XSoUgQ2u6/LhPzZHyCxpKFvhJOrZY9IGjmACt8ef5NxJrO6pvKOJsaToRaBngw3
         zeRJaodl/X5ZfYN6elsM6LF0swS91OYFU6+J8xXKhuS6v7GFW6MC5sDDiM5Z2174jiVs
         WCw+PcmKZxo/q/5ASVAdLWoUUASphy11eYA+HFw1vg8ZvaeVwxYbk6ecTIQa7+pKObkx
         A5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761405901; x=1762010701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEsLv/ORWjWt4JjusiVyw1pkRSWkY2jVnldvJ/kYxAc=;
        b=ldR9ZPgDEF/3vpFDcHekdf2a0oJZB/+0yms7Hwm0hpm4ZysTz++uelUr4I+Yp2Ri8Y
         PgJF1p8RKFg3OrjCHc3YtUf8oJw0/iz1hkUWKAL5kkSEZyKn1KFCGcNk8rmqTmS0imAv
         gQA/Vnr/dSeFALcxq410ZQKWYqr4zyeP3HFfq/+pic6s4oThEzjSCsPUzAnBnX3siCVW
         9h5ulNzNEHMXB+kNYmB/4+15B2v+Ugw+JEjqMKUwcBqma5MeAjE/+JBSAXlMIrHHv2ur
         BLYSYojTtH+aj2Q86bPSs4mkW9TBJo4BqSpFFOmozzfiTvey62apF0ZkB2BCseqTijzu
         t2bg==
X-Forwarded-Encrypted: i=1; AJvYcCWPjq6ZRVThB0yYR9NJNHYDedKp4lkm1rAqV+Jh541h5MQGx6YPOPQ3JgDukIw686fva2iJMRCFwnS/7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy08r/zIY0z7rDQJY/RX3aWjCkQCKqXsk9Hm2hWI5XgBkhpsb/k
	5gixgCme5hjY/BgGIPWEAefdKyH3y8rL8+2yM3YxcnU2+8A21rdWFlJAlohyUm2t/EHTsYNob9B
	qxHwDjOkITBb2J73nTdK+5LGBUl4ExRtEeiD/nvsS9w==
X-Gm-Gg: ASbGnctMOYcxviBXT0PVN5R79ZffqqOMUkdVWktGPKxpNQbKkwXDISIs3oagSBRgwvi
	dRzwCopGVu7uZ3b/jM1zI7LZZ/2mW1gmtw4Lm7GrjHvRbbz5ZsdpXdCbirjDkUI3UXoA+k2QQJy
	oXurFSLzVHuTmxEnKEPKScGFYXrc1AU2fqICHVju0y08ZlJMCg1x8QodopN5DqA2j9OkoQqRIeN
	d5hZbpO8276BIMNP7lONW1rqdibkPpa7s/edKULdKZrNP4dOjgQemlw91hIF1psuiLeXPWbkY3U
	nMedvfKBqo/n6soWmAv9kODJnUSi
X-Google-Smtp-Source: AGHT+IEkKuyMVmFsWXRY0bxtHWTNzex75v+WBGMxRJwOZQScs1xFZAgq+kDpvorbdJ+d0KcQ27kL7+tqDAzCdvkawvY=
X-Received: by 2002:a17:907:da1:b0:b6d:5e64:c36b with SMTP id
 a640c23a62f3a-b6d6fe9fac7mr565664566b.29.1761405901273; Sat, 25 Oct 2025
 08:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <3-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <3-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:24:25 -0400
X-Gm-Features: AWmQ_bkMrpRaMfcHcpe107aX1k_bm11BfLXJjxsMDuts5-Fo-hDichMUKRxipls
Message-ID: <CA+CK2bC5=rb1C6i5yMad_tG9JpbYYgSRxAX-vhYctuoLvcQbWg@mail.gmail.com>
Subject: Re: [PATCH v7 03/15] iommupt: Add the basic structure of the iommu implementation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_082503_311928_C9E301EF 
X-CRM114-Status: GOOD (  18.79  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjoyMeKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gVGhlIGV4aXN0aW5nIElPTU1VIHBhZ2UgdGFibGUgaW1wbGVt
ZW50YXRpb25zIGR1cGxpY2F0ZSBhbGwgb2YgdGhlIHdvcmtpbmcKPiBhbGdvcml0aG1zIGZvciBl
YWNoIGZvcm1hdC4gQnkgdXNpbmcgdGhlIGdlbmVyaWMgcGFnZSB0YWJsZSBBUEkgYSBzaW5nbGUg
Qwo+IHZlcnNpb24gb2YgdGhlIElPTU1VIGFsZ29yaXRobXMgY2FuIGJlIGNyZWF0ZWQgYW5kIHJl
LXVzZWQgZm9yIGFsbCBvZiB0aGUKPiBkaWZmZXJlbnQgZm9ybWF0cyB1c2VkIGluIHRoZSBkcml2
ZXJzLiBUaGUgaW1wbGVtZW50YXRpb24gd2lsbCBwcm92aWRlIGEKPiBzaW5nbGUgQyB2ZXJzaW9u
IG9mIHRoZSBpb21tdSBkb21haW4gb3BlcmF0aW9uczogaW92YV90b19waHlzLCBtYXAsIHVubWFw
LAo+IGFuZCByZWFkX2FuZF9jbGVhcl9kaXJ0eS4KPgo+IEZ1cnRoZXIsIGFkZGluZyBuZXcgYWxn
b3JpdGhtcyBhbmQgdGVjaG5pcXVlcyBiZWNvbWVzIGVhc3kgdG8gZG8gYWNyb3NzCj4gdGhlIGVu
dGlyZSBmbGVldCBvZiBkcml2ZXJzIGFuZCBmb3JtYXRzLgoKSXQgaXMgYW4gZW5hYmxlciBmb3Ig
Y3Jvc3MtYXJjaCBwYWdlX3RhYmxlX2NoZWNrIGZvciBJT01NVS4gVGhlcmUgaXMKYWxzbyBhIGxv
bmctc3RhbmRpbmcgaXNzdWUgd2hlcmUgUFQgcGFnZXMgYXJlIG5vdCBmcmVlZCBvbiB1bm1hcCwK
bGVhZGluZyB0byBzdWJzdGFudGlhbCBvdmVyaGVhZCBvbiBzb21lIGNvbmZpZ3VyYXRpb25zLCBl
c3BlY2lhbGx5CndoZXJlIElPVkEgaXMgY3ljbGVkIHRocm91Z2ggZm9yIHNlY3VyaXR5IHB1cnBv
c2VzIChhcyBpdCB3YXMgZG9uZSBpbgpvdXIgZW52aXJvbm1lbnQpLiBIYXZpbmcgYSBzaW5nbGUs
IHNvbGlkIGZpeCBmb3IgdGhpcyBpc3N1ZSB0aGF0CmFmZmVjdHMgYWxsIGFyY2hlcyBpcyB2ZXJ5
IG11Y2ggZGVzaXJhYmxlLgoKPgo+IFRoZSBDIGZ1bmN0aW9ucyBhcmUgZHJvcCBpbiBjb21wYXRp
YmxlIHdpdGggdGhlIGV4aXN0aW5nIGlvbW11X2RvbWFpbl9vcHMKPiB1c2luZyB0aGUgSU9NTVVf
UFRfRE9NQUlOX09QUygpIG1hY3JvLiBFYWNoIHBlci1mb3JtYXQgaW1wbGVtZW50YXRpb24KPiBj
b21waWxhdGlvbiB1bml0IHdpbGwgcHJvZHVjZSBleHBvcnRlZCBzeW1ib2xzIGZvbGxvd2luZyB0
aGUgcGF0dGVybgo+IHB0X2lvbW11X0ZNVF9tYXBfcGFnZXMoKSB3aGljaCB0aGUgbWFjcm8gZGly
ZWN0bHkgbWFwcyB0byB0aGUKPiBpb21tdV9kb21haW5fb3BzIG1lbWJlcnMuIFRoaXMgYXZvaWRz
IHRoZSBhZGRpdGlvbmFsIGZ1bmN0aW9uIHBvaW50ZXIKPiBpbmRpcmVjdGlvbiBsaWtlIGlvLXBn
dGFibGUgaGFzLgo+Cj4gVGhlIHRvcCBsZXZlbCBzdHJ1Y3QgdXNlZCBieSB0aGUgZHJpdmVycyBp
cyBwdF9pb21tdV90YWJsZV9GTVQuIEl0Cj4gY29udGFpbnMgdGhlIG90aGVyIHN0cnVjdHMgdG8g
YWxsb3cgY29udGFpbmVyX29mKCkgdG8gbW92ZSBiZXR3ZWVuIHRoZQo+IGRyaXZlciwgaW9tbXUg
cGFnZSB0YWJsZSwgZ2VuZXJpYyBwYWdlIHRhYmxlLCBhbmQgZ2VuZXJpYyBmb3JtYXQgbGF5ZXJz
Lgo+Cj4gICAgc3RydWN0IHB0X2lvbW11X3RhYmxlX2FtZHYxIHsKPiAgICAgICAgc3RydWN0IHB0
X2lvbW11IHsKPiAgICAgICAgICAgICAgIHN0cnVjdCBpb21tdV9kb21haW4gZG9tYWluOwo+ICAg
ICAgICB9IGlvbW11Owo+ICAgICAgICBzdHJ1Y3QgcHRfYW1kdjEgewo+ICAgICAgICAgICAgICAg
c3RydWN0IHB0X2NvbW1vbiBjb21tb247Cj4gICAgICAgIH0gYW1kcHQ7Cj4gICAgfTsKPgo+IFRo
ZSBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8gdW5pb24gdGhlIHB0X2lvbW11X3RhYmxlX0ZNVCB3aXRo
IGl0cyBvd24KPiBleGlzdGluZyBkb21haW4gc3RydWN0Ogo+Cj4gICAgc3RydWN0IGRyaXZlcl9k
b21haW4gewo+ICAgICAgICB1bmlvbiB7Cj4gICAgICAgICAgICAgICAgc3RydWN0IGlvbW11X2Rv
bWFpbiBkb21haW47Cj4gICAgICAgICAgICAgICAgc3RydWN0IHB0X2lvbW11X3RhYmxlX2FtZHYx
IGFtZHYxOwo+ICAgICAgICB9Owo+ICAgIH07Cj4gICAgUFRfSU9NTVVfQ0hFQ0tfRE9NQUlOKHN0
cnVjdCBkcml2ZXJfZG9tYWluLCBhbWR2MSwgZG9tYWluKTsKPgo+IFRvIGNyZWF0ZSBhbiBhbGlh
cyB0byBhdm9pZCByZW5hbWluZyAnZG9tYWluJyBpbiBhIGxvdCBvZiBkcml2ZXIgY29kZS4KPgo+
IFRoaXMgYWxsb3dzIGFsbCB0aGUgbGF5ZXJzIHRvIGFjY2VzcyBhbGwgdGhlIG5lY2Vzc2FyeSBm
dW5jdGlvbnMgdG8KPiBpbXBsZW1lbnQgdGhlaXIgZGlmZmVyZW50IHJvbGVzIHdpdGggbm8gY2hh
bmdlIHRvIGFueSBvZiB0aGUgZXhpc3RpbmcKPiBpb21tdSBjb3JlIGNvZGUuCj4KPiBJbXBsZW1l
bnQgdGhlIGJhc2ljIHN0YXJ0aW5nIHBvaW50OiBwdF9pb21tdV9pbml0KCksIGdldF9pbmZvKCkg
YW5kCj4gZGVpbml0KCkuCj4KPiBUZXN0ZWQtYnk6IEFsZWphbmRybyBKaW1lbmV6IDxhbGVqYW5k
cm8uai5qaW1lbmV6QG9yYWNsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+CgpSZXZpZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNv
bGVlbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
