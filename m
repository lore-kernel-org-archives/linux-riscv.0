Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEFBEE3F3F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZFZNxaytfFeEv/dRNskygjjfkWAdcPqWxpDaBhgu1E=; b=rK1DWIRQv+YVw8
	yuiz0/e9KDxCo47mcCMYTN/JyDruBFdxC8/azVuTL3fSGXRb/yAQyQM3mCsUjKqaL2K3l/QYGqW5n
	noY2YZFhvBUJGPSlX8xnkWFB4C2IQgZp72vQRr92vZ4KjLmX9goR7ndemnZFKHHKYGl4/1LwkF8Ad
	8It3iqmeIkmIN7NUZOtR8yBxtK7gWPxrUQw+9ixRMjtQscudcga0eYxGhlqAaFPXC3AXCjSIlWUoB
	VXn+an1MxKwfAMsyJZTTL9l3Br+2dANdXvX0tp/p4zjHxFE29dpBEq/U+UcFqm6Cd5kukBM1i1GVB
	U50mcsynAqjYQxqIlYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDTG-004KnY-0w;
	Wed, 13 Sep 2023 00:11:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDTC-004KmD-38;
	Wed, 13 Sep 2023 00:11:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50078e52537so10538600e87.1;
        Tue, 12 Sep 2023 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694563854; x=1695168654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDU5pSKkCf+ROG6Vvo9qMmmrl9dENDhQwvux9jW53fk=;
        b=ijegopQdt6GqWH+YbehMXvTR1hSMb8Vu4jJTl7xplO6pZ4Gmv6qN7umLShH6cJhuXm
         pLU3Mteh7QZR9VZ0ONvPwARir05k5TR+Z6G/LPTA1fBQff9kfG5/qF5x8voA2OFRyfwL
         /z23mMKP6lO4oUIhGGukej3uvCQ4b5LqOkibd3LAPItMAUX+pedhJyF7V984z5Lf7bQS
         xDwLNilxE1WOID41XJ324cq8CKmnHP4fTahmIcHQe6wbi0B6VIu/TETR3ZlkCPOAu0zT
         a6OEhwe85fpqDZcxkXmS7B7YpCmaoTlFRrJypRh6AIL1/s5WRe66G0HYI+lH/m/w5hwL
         EcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694563854; x=1695168654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDU5pSKkCf+ROG6Vvo9qMmmrl9dENDhQwvux9jW53fk=;
        b=r7fGpW5tMlUSe9opEp93org6jkUpoHXCjkwB6d29hEwInV68m7I9y8Jmw9LvN8LNUW
         3gqoq+w8grCJZDz2+5RO4UrLV505kp7wjVRFQxI7FR+nzJ4EMBgsq+6+NWBbh5XI9VeZ
         g308KNJsVDIaC9z5T+NqWyptz78yZpVaT2h0/OAigt85i/UfQGl94FUzKJbWEeO+sZ9G
         pdxoPstbSE4RjmS/9xHvhdjf3LsbSnYqKt8tFM2EEF4BFkA5bwjz9wzc3S0Ni6yC2xDb
         xX+j3m4jwNdn7PS21VfgNQmmaKU5nFxDtwz5tC/B9OSSFMl9XPc+PjFKkZb853ogf9pg
         AtLA==
X-Gm-Message-State: AOJu0YxghwVwSZJ45P0+fxo0VqxWD2G36CgWv6/qpRzxurVYdYU94Kml
	JUHIx40BflBG9Fc/KB7Coi9/Ev9SNfvNGyYFzOw=
X-Google-Smtp-Source: AGHT+IE0DJ1yIeH5yZxGYgPrqT6xeFSkjh5Zl6R/0fUeOPfMg57L6CIwSvBEee3CSY3IGdEklD5DOU0AfhXdAtHa5js=
X-Received: by 2002:a19:e012:0:b0:502:9dc3:9c68 with SMTP id
 x18-20020a19e012000000b005029dc39c68mr597128lfg.63.1694563853416; Tue, 12 Sep
 2023 17:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230912224654.6556-1-puranjay12@gmail.com> <20230912224654.6556-6-puranjay12@gmail.com>
 <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk> <CANk7y0iFdgHgu+RXYJvP3swaRS+-Lr0CgOAdcQWtjs4VkrOzdQ@mail.gmail.com>
In-Reply-To: <CANk7y0iFdgHgu+RXYJvP3swaRS+-Lr0CgOAdcQWtjs4VkrOzdQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Sep 2023 17:10:42 -0700
Message-ID: <CAADnVQLzbyG3xWVDFyTsDPRSC=fnAskaeyc1erQVLYo_b6Lg_w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with B/H/W
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shubham Bansal <illusionist.neo@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Wang YanQing <udknight@gmail.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-parisc@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Network Development <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_171103_012780_E96990E2 
X-CRM114-Status: GOOD (  29.58  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgNDoxN+KAr1BNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eTEyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAxOjA04oCv
QU0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6
Cj4gPgo+ID4gT24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTA6NDY6NTNQTSArMDAwMCwgUHVyYW5q
YXkgTW9oYW4gd3JvdGU6Cj4gPiA+IFRoZSBKSVRzIHNob3VsZCBub3QgZGVwZW5kIG9uIHRoZSB2
ZXJpZmllciBmb3IgemVybyBleHRlbmRpbmcgdGhlIHVwcGVyCj4gPiA+IDMyIGJpdHMgb2YgdGhl
IGRlc3RpbmF0aW9uIHJlZ2lzdGVyIHdoZW4gbG9hZGluZyBhIGJ5dGUsIGhhbGYtd29yZCwgb3IK
PiA+ID4gd29yZC4KPiA+ID4KPiA+ID4gQSBmb2xsb3dpbmcgcGF0Y2ggd2lsbCBtYWtlIHRoZSB2
ZXJpZmllciBzdG9wIHBhdGNoaW5nIHpleHQgaW5zdHJ1Y3Rpb25zCj4gPiA+IGFmdGVyIExEWC4K
PiA+Cj4gPiBUaGlzIHdhcyBpbnRyb2R1Y2VkIGJ5Ogo+ID4KPiA+IDE2MzU0MWU2YmEzNCAoImFy
bTogYnBmOiBlbGltaW5hdGUgemVybyBleHRlbnNpb24gY29kZS1nZW4iKQo+ID4KPiA+IGFsb25n
IHdpdGggYW4gYWRkaXRpb25hbCBmdW5jdGlvbi4gU28gdGhyZWUgcG9pbnRzOgo+ID4KPiA+IDEp
IHRoZSBjb21taXQgc2hvdWxkIHByb2JhYmx5IGV4cGxhaW4gd2h5IGl0IGhhcyBub3cgYmVjb21l
IHVuZGVzaXJhYmxlCj4gPiB0byBhY2Nlc3MgdGhpcyB2ZXJpZmllciBzdGF0ZSwgd2hlcmVhcyBp
dCBhcHBlYXJzIGl0IHdhcyBleHBsaWNpdGx5Cj4gPiBhZGRlZCB0byBwZXJtaXQgdGhpcyBvcHRp
bWlzYXRpb24uCj4KPiBJIGFkZGVkIHNvbWUgZGV0YWlscyBpbiB0aGUgY292ZXIgbGV0dGVyLgo+
Cj4gRm9yIHRoZSBjb21wbGV0ZSBkaXNjdXNzaW9uIHNlZTogWzFdCj4KPiA+IDIpIHlvdSBzdGF0
ZSB0aGF0IGppdHMgc2hvdWxkIG5vdCBkZXBlbmQgb24gdGhpcyBzdGF0ZSwgYnV0IHRoZSBhYm92
ZQo+ID4gY29tbWl0IGFkZHMgbW9yZSByZWZlcmVuY2VzIHRoYW4geW91J3JlIHJlbW92aW5nLCBz
byBhcmVuJ3QgdGhlcmUgc3RpbGwKPiA+IHJlZmVyZW5jZXMgdG8gdGhlIHZlcmlmaWVyIHJlbWFp
bmluZyBhZnRlciB0aGlzIHBhdGNoPyBJIGNvdW50IGEgdG90YWwKPiA+IG9mIDEwLCBhbmQgdGhl
IHBhdGNoIGJlbG93IHJlbW92ZXMgdGhyZWUuCj4KPiBUaGUgSklUcyBzaG91bGQgbm90IGRlcGVu
ZCBvbiB0aGlzIHN0YXRlIGZvciBMRFggKGxvYWRpbmcKPiBhIEIvSC9XLgo+IFRoaXMgcGF0Y2gg
cmVtb3ZlcyB0aGUgdXNhZ2Ugb25seSBmb3IgTERYLgo+Cj4gPiAzKSB3aGF0IGFib3V0IHRoZSBi
cGZfaml0X25lZWRzX3pleHQoKSBmdW5jdGlvbiB0aGF0IHdhcyBhZGRlZCB0bwo+ID4gc3VwcG9y
dCB0aGUgZXhwb3J0IG9mIHRoaXMgemV4dCBzdGF0ZT8KPgo+IFRoYXQgaXMgc3RpbGwgYXBwbGlj
YWJsZSwgVGhlIHZlcmlmaWVyIHdpbGwgc3RpbGwgZW1pdCB6ZXh0Cj4gaW5zdHJ1Y3Rpb25zIGZv
ciBvdGhlcgo+IGluc3RydWN0aW9ucyBsaWtlIEJQRl9BTFUgLyBCUEZfQUxVNjQKPgo+ID4KPiA+
IEVzc2VudGlhbGx5LCB0aGUgbG9naWMgc3RhdGVkIGluIHRoZSBjb21taXQgbWVzc2FnZSBkb2Vz
bid0IHNlZW0gdG8gYmUKPiA+IHJlZmxlY3RlZCBieSB0aGUgcHJvcG9zZWQgY29kZSBjaGFuZ2Uu
Cj4KPiBJIHdpbGwgdHJ5IHRvIHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbi4KPiBDdXJyZW50bHkg
SSBoYXZlIGFza2VkIEFsZXhlaSBpZiB3ZSByZWFsbHkgbmVlZCB0aGlzIGluIFsyXS4KPiBJIHN0
aWxsIHRoaW5rIHRoaXMgb3B0aW1pemF0aW9uIGlzIHVzZWZ1bCBhbmQgd2Ugc2hvdWxkIGtlZXAg
aXQuCgpSaWdodC4gc3VicmVnIHRyYWNraW5nIGlzIGluZGVlZCBmdW5jdGlvbmFsIGZvciBuYXJy
b3cgbG9hZHMuCkxldCdzIGRyb3AgdGhpcyBwYXRjaCBzZXQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
