Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C65CCFA46B
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 05:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vez4Npa7/7ct0PfxMz8JkHZk74GESLcJSTKYJFLGlnI=; b=NX22AHzvHT+lTy
	tMhb8jHBxW2oVCSDXV5s5u2jBOmbsHq/sf7UDcVMSqb4gC8QEgiwckpClOO6Ua7C6bEZcD+a6k9J2
	NxvIJ4oQm6XN6TBeL7s25ZutN/3YB2LZuiHYtZDklkE9IhGDaMXPx84qiAUPSNLo0Z6HSEntG+/5/
	obquwPW/bV+RtYnR/XwCNBq5H/zQqUI3fgxw2+dWsds/1fb0vBl3nY5T+YYX0RWoMDCybSSlXcX3a
	5ukM/MYiLzWsACpZNLhpifZXAWSzkyRpmM5QxV8phAfxsOzjkitnaNVn9+DV1KFsV7xOQ/ZjtjO35
	pbaMq+dg7byQ1VSeynew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN2Z5-0000000A9Xr-2g7L;
	Sun, 23 Nov 2025 05:23:11 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN2Yv-0000000A9WX-2kFu
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 05:23:10 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-4331b4d5c6eso13631345ab.2
        for <linux-riscv@lists.infradead.org>; Sat, 22 Nov 2025 21:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1763875379; x=1764480179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9M+bsitxdcyHBcSA8b07GYs4Cob261gapfpxGSvBT4Q=;
        b=BKuDdf4hMdUEG6wKkdXvWE8KxgB/KWhQcv4z8n0XCSd4lYhhPLQfmwhCjhYyWu5gcO
         4JlzBGh48+1OtzZUc8Pzy4MlI17YngCRcOWp3ihREAcbxq/7MWy3znL2eilHydam1Q7X
         HZ3hGpWkFPDipN0px6187rPmt93hWPn2stbLZztICPfB/uZvqkMS677Mxf+UYOMnkG2a
         JuvnJOompD3mCxrd8IJqmlXWjoG+EX+rL/V5GtOvLO/yvjqsjSqsU4+xxtaMgBmeUVKv
         +sBjVqkCAksaqbPUYRUDWAW24ngdX1YNJilclbWhTyPkZrXv/rtUryhaDaNqT3liQsKH
         ltuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763875379; x=1764480179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9M+bsitxdcyHBcSA8b07GYs4Cob261gapfpxGSvBT4Q=;
        b=SPf9pqBd8/riaYCqP9TldjhG6LScu8EwWt6L99OLJPoGONpWgnMN1CjHsmcG+Nl9J1
         3SNIYIBFc50Ce/lwCjuyKGG64Pt5si8/SUfO8jDaVhvyqmUX8x0iKryMKQnwlL5mpIBH
         uq2bdxrQyg3tXjfcpGmZMT8fo3kQ6p7zTe7iAFt7OwGA/rG/zkZ/wEzNnhJXo4YFuZkf
         DlR0x6+RYp+D2DFARgh38e1sSXe+2YG6WdgG7nZVLfW44bII5cyz7/cXmlLKUYVIe9RW
         n7QV7kScDaE+5ruyCyHFoFiZ+hObUlFpxchb63zK29VleJWABPqwFbnU4YCrHHwCfGy1
         BWZA==
X-Forwarded-Encrypted: i=1; AJvYcCW9BYgJ6f8PVCF0PWfrX5oN82FqLkR3myYyqjte+4FEm2u9K82maeaxKAf1P1zlWwJfhH0c1TX4LJfIjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYdRliq7yRzHhhLsfNfxVjDu80c5oWXmQAoWB5GQkRzQdcDkCH
	xFXfOvvIrsODykLo0U0hvmVsLnSubnTXrjeLdL0OnRD3Nvjd7CZc+6EDB7UZO0savFZ77U75sfH
	rfSOhArg3cE3b3vM6IEfMYODySVig7AMwxDmGdmN3Jw==
X-Gm-Gg: ASbGncvxNtB7sK93jpAijYc3v85bRJz45YvJGIK7SLxjCh9kEhbyLl1uzFkFXnAQwC9
	PBaZsoJA5KI2iCnsyLJNAUoJ2SsrH0zcY0lq4cXzHNrx6TLRSujjhAgE9iX59kvPrk22JtObhsy
	5hos+klp06g31JN+lQ76vRKv/jcbyuoTnTUMiCAo0YeQ+NA5JIZDB7Pn7ucTy7cRUmu39cxO73B
	fNobNyY4oehSkJH6x13Uo39wvRVf65+9ELVyIPU/OSjpe5NymixsLk6nee+zQi2QDAOz91q7hdB
	T3yFf0mYFhpxZeBG+Ps9X/KHcDfU1Q==
X-Google-Smtp-Source: AGHT+IEeM18++lwaiORFJZl8Hjs+peRhie1yZlJt5sthIKBDB3m3u408rffnRcPQtJ+QKEExmaV3WTWoC+TcPLmKbAA=
X-Received: by 2002:a05:6e02:3f09:b0:433:7826:2b69 with SMTP id
 e9e14a558f8ab-435b8e4fcb7mr70415215ab.11.1763875379029; Sat, 22 Nov 2025
 21:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Nov 2025 10:52:46 +0530
X-Gm-Features: AWmQ_bmj4zuHx-QBwVeyguW577J_Oqmu-RcG3kza0f4RZhq14OWm6aCQT2gQVtM
Message-ID: <CAAhSdy2Y=qk27Khy+fzOCidop7+tNqoDb0CFwAJ_p090NV46vQ@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Fix guest page fault within HLV* instructions
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	ajones@ventanamicro.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_212302_012265_EF0AB2A0 
X-CRM114-Status: GOOD (  22.11  )
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

T24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgNzowNuKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIGV4ZWN1dGluZyBITFYqIGluc3RydWN0aW9ucyBhdCB0aGUgSFMgbW9k
ZSwgYSBndWVzdCBwYWdlIGZhdWx0Cj4gbWF5IG9jY3VyIHdoZW4gYSBnLXN0YWdlIHBhZ2UgdGFi
bGUgbWlncmF0aW9uIGJldHdlZW4gdHJpZ2dlcmluZyB0aGUKPiB2aXJ0dWFsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbiBhbmQgZXhlY3V0aW5nIHRoZSBITFYqIGluc3RydWN0aW9uLgo+Cj4gVGhpcyBt
YXkgYmUgYSBjb3JuZXIgY2FzZSwgYW5kIG9uZSBzaW1wbGVyIHdheSB0byBoYW5kbGUgdGhpcyBp
cyB0bwo+IHJlLWV4ZWN1dGUgdGhlIGluc3RydWN0aW9uIHdoZXJlIHRoZSB2aXJ0dWFsICBpbnN0
cnVjdGlvbiBleGNlcHRpb24KPiBvY2N1cnJlZCwgYW5kIHRoZSBndWVzdCBwYWdlIGZhdWx0IHdp
bGwgYmUgYXV0b21hdGljYWxseSBoYW5kbGVkLgo+Cj4gRml4ZXM6IGI5MWYwZTRjYjhhMyAoIlJJ
U0MtVjogS1ZNOiBGYWN0b3Itb3V0IGluc3RydWN0aW9uIGVtdWxhdGlvbiBpbnRvIHNlcGFyYXRl
IHNvdXJjZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFs
aWJhYmEuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTkKClJlZ2FyZHMsCkFudXAK
Cj4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gQWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGF2
b2lkIHJlcGVhdGluZyB0aGUgc2FtZSBwYXJhZ3JhcGgoc3VnZ2VzdGVkIGJ5IGRyZXcpCj4gLSBM
aW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MTExMTEz
NTUwNi44NTI2LTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tLwo+Cj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIFJlbW92ZSB1bm5lY2Vzc2FyeSBtb2RpZmljYXRpb25zIGFuZCBhZGQgY29tbWVudHMo
c3VnZ2VzdGVkIGJ5IEFudXApCj4gLSBVcGRhdGUgRml4ZXMgdGFnCj4gLSBMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDkxMjEzNDMzMi4yMjA1My0x
LWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV9pbnNuLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNu
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IGluZGV4IGRlMWY5NmVhNjIyNS4uNGQ4
OWI5NDEyOGFlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiBAQCAtMjk4LDYgKzI5OCwyMiBAQCBzdGF0
aWMgaW50IHN5c3RlbV9vcGNvZGVfaW5zbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBr
dm1fcnVuICpydW4sCj4gICAgICAgICByZXR1cm4gKHJjIDw9IDApID8gcmMgOiAxOwo+ICB9Cj4K
PiArc3RhdGljIGJvb2wgaXNfbG9hZF9ndWVzdF9wYWdlX2ZhdWx0KHVuc2lnbmVkIGxvbmcgc2Nh
dXNlKQo+ICt7Cj4gKyAgICAgICAvKioKPiArICAgICAgICAqIElmIGEgZy1zdGFnZSBwYWdlIGZh
dWx0IG9jY3VycywgdGhlIGRpcmVjdCBhcHByb2FjaAo+ICsgICAgICAgICogaXMgdG8gbGV0IHRo
ZSBnLXN0YWdlIHBhZ2UgZmF1bHQgaGFuZGxlciBoYW5kbGUgaXQKPiArICAgICAgICAqIG5hdHVy
YWxseSwgaG93ZXZlciwgY2FsbGluZyB0aGUgZy1zdGFnZSBwYWdlIGZhdWx0Cj4gKyAgICAgICAg
KiBoYW5kbGVyIGhlcmUgc2VlbXMgcmF0aGVyIHN0cmFuZ2UuCj4gKyAgICAgICAgKiBDb25zaWRl
cmluZyB0aGlzIGlzIGEgY29ybmVyIGNhc2UsIHdlIGNhbiBkaXJlY3RseQo+ICsgICAgICAgICog
cmV0dXJuIHRvIHRoZSBndWVzdCBhbmQgcmUtZXhlY3V0ZSB0aGUgc2FtZSBQQywgdGhpcwo+ICsg
ICAgICAgICogd2lsbCB0cmlnZ2VyIGEgZy1zdGFnZSBwYWdlIGZhdWx0IGFnYWluIGFuZCB0aGVu
IHRoZQo+ICsgICAgICAgICogcmVndWxhciBnLXN0YWdlIHBhZ2UgZmF1bHQgaGFuZGxlciB3aWxs
IHBvcHVsYXRlCj4gKyAgICAgICAgKiBnLXN0YWdlIHBhZ2UgdGFibGUuCj4gKyAgICAgICAgKi8K
PiArICAgICAgIHJldHVybiAoc2NhdXNlID09IEVYQ19MT0FEX0dVRVNUX1BBR0VfRkFVTFQpOwo+
ICt9Cj4gKwo+ICAvKioKPiAgICoga3ZtX3Jpc2N2X3ZjcHVfdmlydHVhbF9pbnNuIC0tIEhhbmRs
ZSB2aXJ0dWFsIGluc3RydWN0aW9uIHRyYXAKPiAgICoKPiBAQCAtMzIzLDYgKzMzOSw4IEBAIGlu
dCBrdm1fcmlzY3ZfdmNwdV92aXJ0dWFsX2luc24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjdC0+c2VwYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnV0cmFwKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAodXRyYXAuc2NhdXNlKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoaXNfbG9hZF9ndWVzdF9wYWdlX2ZhdWx0KHV0cmFwLnNjYXVzZSkpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdXRyYXAuc2VwYyA9IGN0LT5zZXBjOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdHJhcF9yZWRpcmVjdCh2Y3B1
LCAmdXRyYXApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4g
QEAgLTM3OCw2ICszOTYsOCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19sb2FkKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgICAgICAgICAgaW5z
biA9IGt2bV9yaXNjdl92Y3B1X3VucHJpdl9yZWFkKHZjcHUsIHRydWUsIGN0LT5zZXBjLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnV0cmFwKTsK
PiAgICAgICAgICAgICAgICAgaWYgKHV0cmFwLnNjYXVzZSkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChpc19sb2FkX2d1ZXN0X3BhZ2VfZmF1bHQodXRyYXAuc2NhdXNlKSkKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIFJlZGlyZWN0IHRyYXAgaWYgd2UgZmFpbGVkIHRvIHJlYWQgaW5zdHJ1Y3Rpb24g
Ki8KPiAgICAgICAgICAgICAgICAgICAgICAgICB1dHJhcC5zZXBjID0gY3QtPnNlcGM7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdHJhcF9yZWRpcmVjdCh2Y3B1LCAm
dXRyYXApOwo+IEBAIC01MDQsNiArNTI0LDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X21taW9fc3Rv
cmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAg
ICAgICAgICBpbnNuID0ga3ZtX3Jpc2N2X3ZjcHVfdW5wcml2X3JlYWQodmNwdSwgdHJ1ZSwgY3Qt
PnNlcGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmdXRyYXApOwo+ICAgICAgICAgICAgICAgICBpZiAodXRyYXAuc2NhdXNlKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGlzX2xvYWRfZ3Vlc3RfcGFnZV9mYXVsdCh1dHJhcC5zY2F1
c2UpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgLyogUmVkaXJlY3QgdHJhcCBpZiB3ZSBmYWlsZWQgdG8gcmVhZCBp
bnN0cnVjdGlvbiAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHV0cmFwLnNlcGMgPSBjdC0+
c2VwYzsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGly
ZWN0KHZjcHUsICZ1dHJhcCk7Cj4gLS0KPiAyLjUwLjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
