Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BC0C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wmb9mqm1MoUxctesLV7JL5qpPnFx1xWUwF2+DjKURp4=; b=qx92A9Fj+dOTDN
	sBzfnUZyxIUXOdRAu6YCA36ILmXDeSgOxVCtDMP2RCWke3O02Sng1ky3a2QLw4n6w93Z/FhZtSCSE
	KnypEETZH+T0y9U+UhWVTNz2Nijf44Kf9+p3jCKin2LpybVxkTvRnGIUoEGBmVLf27nVY/T7Gj8JU
	6N3qRHbO5FUFomxXRTIc4onD8o1rXD9xWJQ3e/Yqoo13DYs8y9wOu4R7DLjC8A1eFVrCFluX1F7fI
	G4/IIht7F88DI08XKm5BMkp+N4z/Z2MkENQj6cx300jk/AFNn/dROmj8e6J+asOj/acb6HgVGexNZ
	rU5QcKw2yL/ZM/ERSk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjs7r-000000042cP-1nmb;
	Tue, 12 Mar 2024 02:44:23 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjs7n-000000042ao-2lB2
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:44:20 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so3884509a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710211458; x=1710816258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2/zqf8TfkF7fmO3ryrALVmJ2Vqgii1SZQQKBoGp30M=;
        b=D6zKwTaUQb4rv713NOoTJ2LU/PJCk+zVrCi35FQT2oM9+qNwx8TU4/nyOnH+Yl/47v
         eUAuBfAcDR0V8d994xxYCwAK+V7yAlT9L/kOXYn2fawbyGqaQbwGx00s3+UF0OOyy3/r
         +Veb4WJc/J/kAJu71cICNXWbsGqenVfGmzm9qTaaZsDPlEsopstP4OY03z+n06i6xmnK
         GPpqPzhgvzpsoljT+yV7ak0+3+TacC5FWMNwV0LkJJmeI5GCnzy7sPuffzBY014EM4cT
         j+XpifK5sJeuhRJcv7tnVnXKqgdvFaE30LXGvKDNqPRvlwDzIxVyWFHeTZxcIY3ksuGu
         13CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710211458; x=1710816258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2/zqf8TfkF7fmO3ryrALVmJ2Vqgii1SZQQKBoGp30M=;
        b=OwejagykLTeqcPcLaHKQe75LPY+qcEprnn/7cpzAxCH5oK+Lu5BdZ2qFN20sMvyXbx
         2K6QPFAulZQiNYB4l+F6TcRjwz4ibV+HEUcNnSoV4oC3hqY5tDYot0qvfYutWjAYI5G1
         ABlAkPfIAaJd68nDlffz8/2Mk9QnXNHcGAlvbtWVcH+3Hgj8aAqImhpTWqGA6kR5oYWF
         mKPGKXQY2j5ppzFQO78HH0/J0D1+z+1XcOcmkzziMea6+jPr6pAdoi8bE9wU2lAFafJ+
         bUmy1AZRLWCiyRULW86yEqlf5ORpP2vpqINMFM2Asn5Dm7LIRqChjd19NSyivUGmQ5oW
         83rg==
X-Forwarded-Encrypted: i=1; AJvYcCVi1jNuaKxcKuoz/NZePoNKcsMXceqmPLRPrjP4MinDaIX4q2l8jBSQJtZaTFOqtQYQEBUwyZPo02quUgmzBlU9FKtU7yXh/krHGW9Up0Ih
X-Gm-Message-State: AOJu0YyeGBIsgld81xTuF9Gu/7N1gbZYiFl7UJdC543Tq3M5O+KmBNZu
	XJ97cugxagDbA5EaXkHRExjfxUGR0rRIjwAo2fCOqxj7JWvcnjw+VuJ++JKXtuZ2G3Iwo+2ErEJ
	sOuoYeqnNX+6lbMvNqYOedIp0O10Y4k6i2g7qhw==
X-Google-Smtp-Source: AGHT+IGvIums+DTS3WHK+W5NCGfLkPUVfEDar4QbCGrncl6WQdDDS8a1T8ll9cvRYezwajGoT7cszDUrP5tYmNtBalM=
X-Received: by 2002:a17:90b:3ec9:b0:29c:4082:2d0b with SMTP id
 rm9-20020a17090b3ec900b0029c40822d0bmr49744pjb.28.1710211457742; Mon, 11 Mar
 2024 19:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com> <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
In-Reply-To: <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:44:06 +0800
Message-ID: <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 8/9] libbpf: add support for
 the multi-link of tracing
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_194419_716195_E4946F64 
X-CRM114-Status: GOOD (  13.31  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1NuKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPgo+ID4gLSAgICAgICAgICAgICAgIGVyciA9IGxpYmJwZl9maW5k
X2F0dGFjaF9idGZfaWQocHJvZywgYXR0YWNoX25hbWUsICZidGZfb2JqX2ZkLCAmYnRmX3R5cGVf
aWQpOwo+ID4gKyAgICAgICAgICAgICAgIG5hbWVfZW5kID0gc3RyY2hyKGF0dGFjaF9uYW1lLCAn
LCcpOwo+ID4gKyAgICAgICAgICAgICAgIC8qIGZvciBtdWx0aS1saW5rIHRyYWNpbmcsIHVzZSB0
aGUgZmlyc3QgdGFyZ2V0IHN5bWJvbCBkdXJpbmcKPiA+ICsgICAgICAgICAgICAgICAgKiBsb2Fk
aW5nLgo+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgIGlmICgoZGVm
ICYgU0VDX0FUVEFDSF9CVEZfTVVMVEkpICYmIG5hbWVfZW5kKSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgbGVuID0gbmFtZV9lbmQgLSBhdHRhY2hfbmFtZSArIDE7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjaGFyICpmaXJzdF90Z3Q7Cj4gPiArCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBmaXJzdF90Z3QgPSBtYWxsb2MobGVuKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmICghZmlyc3RfdGd0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cm5jcHko
Zmlyc3RfdGd0LCBhdHRhY2hfbmFtZSwgbGVuKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGZpcnN0X3RndFtsZW4gLSAxXSA9ICdcMCc7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBl
cnIgPSBsaWJicGZfZmluZF9hdHRhY2hfYnRmX2lkKHByb2csIGZpcnN0X3RndCwgJmJ0Zl9vYmpf
ZmQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZidGZfdHlwZV9pZCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBmcmVlKGZp
cnN0X3RndCk7Cj4gPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGVyciA9IGxpYmJwZl9maW5kX2F0dGFjaF9idGZfaWQocHJvZywgYXR0YWNoX25h
bWUsICZidGZfb2JqX2ZkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmYnRmX3R5cGVfaWQpOwo+ID4gKyAgICAgICAgICAgICAgIH0K
Pgo+IFBscyB1c2UgZ2xvYl9tYXRjaCB0aGUgd2F5IFtrdV1wcm9iZSBtdWx0aSBhcmUgZG9pbmcK
PiBpbnN0ZWFkIG9mIGV4YWN0IG1hdGNoLgoKSGVsbG8sCgpJJ20gYSBsaXR0bGUgc3VzcGVjdGlu
ZyB0aGUgZWZmZWN0IG9mIGdsb2JfbWF0Y2guIEkgc2VsZG9tIGZvdW5kCnRoZSB1c2UgY2FzZSB0
aGF0IHRoZSBrZXJuZWwgZnVuY3Rpb25zIHdoaWNoIHdlIHdhbnQgdG8gdHJhY2UKaGF2ZSB0aGUg
c2FtZSBuYW1pbmcgcGF0dGVybi4gQW5kIHRoZSBleGFjdCBtYXRjaCBzZWVtcyBtb3JlCnVzZWZ1
bC4KCkNhbiB3ZSB1c2UgYm90aCBleGFjdCBhbmQgZ2xvYiBtYXRjaCBoZXJlPwoKVGhhbmtzIQpN
ZW5nbG9uZyBEb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
