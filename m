Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F3C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 08:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ba2P1sKw8+R1zxcK11Ab5fTFAOzjS8rgCjuskzZnyqQ=; b=TR1n0s/93ZAw+n
	rIcCYb4MPfvrgXGRrM0HPANNCC0URunU1aEaIKFRB+o4D7ABges1vNBGyrgh03puoxDJBfkQpL9t4
	N5hATyH1vtNcuhslyCQC/zg+fCo8r1g/ofN4VWLKfvV6od3bw3OkJSOQmHLYmWjsBpc1eIuE0L92+
	JWkdN3V9+VFqlCyunMdqXlJ/7X3YHpbr5d8Xntt05GAILJiFWNJFy0ov8lpzjckGq0AG7GFyyUXsh
	7PeFWT6pr+q3FAGoZAKkeWOKRRbnndJHbOR52qI07H1SDNm4erw1FEwZjrrMcgqnxRVaohT651fvB
	ROVrYlK+hxnvIAhNB/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2VA-0000000H3Z2-06mg;
	Fri, 15 Mar 2024 08:01:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2V5-0000000H3WP-3s44
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 08:01:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-29c7512e3b8so1426067a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710489667; x=1711094467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0en/GCOfhc21UxAgSvgpjSxEaCkV+SmFKeaU1UDvXQ=;
        b=eo7QY8FTiFc5tomBYqwwYIDSD8CrO1Uhm8zP9JTdbAzm38XnublkSE2U1V9levAN3F
         5C8pdAvVslaNhrQo2wFGQ4ugYgzU9VAJ2BCmy296HfSV03nUSoVfchb+vJsCUDh+IwC7
         mPwmnbfLmzgmZ8pvm49VB1rUQYlZtnETqCxqnp5NmZjRiOl6nf0v7lPjLXzutPCUYHA4
         XxYIn+BERJNoBayGiLbkbqakO27LDgZlxRDgGry7pVUm2Hnm7C7NAPYUBxxwaS/stSaD
         4FFilCdIUsC35/XK6Yh306RJzH8kkCo0se+e8b7sSzZweHizE02VqF14q+ir7YR+6jT/
         coSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710489667; x=1711094467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0en/GCOfhc21UxAgSvgpjSxEaCkV+SmFKeaU1UDvXQ=;
        b=YUAUnH2gPBXqOh98qAR+igW7xv7DvtqGXAx6NHmdYS9ZnZ2r9KGdn1nh1ry1pSDp0o
         ho+H2v7wZJddgc5ggAmT50nIsi5bixfsgnCYFfvWa0fwlhVqNasQsEXoraFe+gav8i+W
         IQiBpKe0FALDl4U++6AsM+uiazK66pXWT10YkC2ISAoTVjIJETS+u8cGxXg+QB4/Jkxt
         7lKMifY1LhKD3Pv1/ZHI6MiFGNc+ylnb4TY5dr3vhoz/Wdd99aHoTIIkaZe8+Pw/xODb
         feNznJPHXFuOpWPdA/sZcDGlWZ/8ktcNukaFAAls24deV/zv60gCRN+EoU10AzpwXada
         5miA==
X-Forwarded-Encrypted: i=1; AJvYcCV0MEqeRNdg//ECVVix+A9Q4eQO5RHMHBQZR/W1NtI+17Cz8Rt0GPAF86EPlZ0Jj6z1/mTAvjwNL/Wh8DQLtnebc1Aj/AqIHR0lQBvpe9vM
X-Gm-Message-State: AOJu0Yy5Key583qMfBQH2thKrKFZs5yyHIKp90nRaCDJYYnWqFLrwUuW
	yZzKxh9R5QxkxOhapwk4dX7lnCo/ljxeB4iBLJUOvbvmViVnYh5D3TyoFQMLMwmoNOxH1IA6GyB
	62etg6eKofVsoyjLWv6ocghkSK8TqVp/aXm7sbA==
X-Google-Smtp-Source: AGHT+IEpM9Mqa5iEhQbTXQByuieojUsSQiVC/HtuI16NWpRWnCf8v9wukRY0tmuiax6xN5WzRfxP5Mr9rKAT0G28iSY=
X-Received: by 2002:a17:90a:dc0b:b0:29d:fe1c:79e7 with SMTP id
 i11-20020a17090adc0b00b0029dfe1c79e7mr271232pjv.45.1710489666842; Fri, 15 Mar
 2024 01:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com> <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
In-Reply-To: <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Fri, 15 Mar 2024 16:00:55 +0800
Message-ID: <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
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
X-CRM114-CacheID: sfid-20240315_010112_359795_5899D2EA 
X-CRM114-Status: GOOD (  20.08  )
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

T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgODoyN+KAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAy
NCBhdCA2OjUz4oCvUE0g5qKm6b6Z6JGjIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3
cm90ZToKWy4uLi4uLl0KPiA+IFdoYXQgZG9lcyAiYSBodW5kcmVkIGF0dGFjaG1lbnRzIG1heCIg
bWVhbnM/IENhbid0IEkKPiA+IHRyYWNlIHRob3VzYW5kcyBvZiBrZXJuZWwgZnVuY3Rpb25zIHdp
dGggYSBicGYgcHJvZ3JhbSBvZgo+ID4gdHJhY2luZyBtdWx0aS1saW5rPwo+Cj4gSSBtZWFuIHdo
YXQgdGltZSBkb2VzIGl0IHRha2UgdG8gYXR0YWNoIG9uZSBwcm9ncmFtCj4gdG8gMTAwIGZlbnRy
eS1zID8KPiBXaGF0IGlzIHRoZSB0aW1lIGZvciAxayBhbmQgZm9yIDEwayA/Cj4KPiBUaGUga3By
b2JlIG11bHRpIHRlc3QgYXR0YWNoZXMgdG8gcHJldHR5IG11Y2ggYWxsIGZ1bmNzIGluCj4gL3N5
cy9rZXJuZWwvdHJhY2luZy9hdmFpbGFibGVfZmlsdGVyX2Z1bmN0aW9ucwo+IGFuZCBpdCdzIGZh
c3QgZW5vdWdoIHRvIHJ1biBpbiB0ZXN0X3Byb2dzIG9uIGV2ZXJ5IGNvbW1pdCBpbiBicGYgQ0ku
Cj4gU2VlIGdldF9zeW1zKCkgaW4gcHJvZ190ZXN0cy9rcHJvYmVfbXVsdGlfdGVzdC5jCj4KPiBD
YW4gdGhpcyBuZXcgbXVsdGkgZmVudHJ5IGRvIHRoYXQ/Cj4gYW5kIGF0IHdoYXQgc3BlZWQ/Cj4g
VGhlIGFuc3dlciB3aWxsIGRlY2lkZSBob3cgYXBwbGljYWJsZSB0aGlzIGFwaSBpcyBnb2luZyB0
byBiZS4KPiBHZW5lcmF0aW5nIGRpZmZlcmVudCB0cmFtcG9saW5lcyBmb3IgZXZlcnkgYXR0YWNo
IHBvaW50Cj4gaXMgYW4gYXBwcm9hY2ggYXMgd2VsbC4gUGxzIGJlbmNobWFyayBpdCB0b28uCgpJ
IHNlZS4gQ3JlYXRpbmcgcGxlbnR5IG9mIHRyYW1wb2xpbmVzIGRvZXMgdGFrZSBhIGxvdCBvZiB0
aW1lLAphbmQgSSdsbCBkbyB0ZXN0aW5nIG9uIGl0LgoKPgo+ID4gPgo+ID4gPiBMZXQncyBzdGVw
IGJhY2suClsuLi4uLi5dCj4KPiBGb3Igb25lIHRyYW1wb2xpbmUgdG8gaGFuZGxlIGFsbCBhdHRh
Y2ggcG9pbnRzIHdlIG1pZ2h0Cj4gbmVlZCBzb21lIGFyY2ggc3VwcG9ydCwgYnV0IHdlIGNhbiBz
dGFydCBzaW1wbGUuCj4gTWFrZSBidGZfZnVuY19tb2RlbCB3aXRoIE1BWF9CUEZfRlVOQ19SRUdf
QVJHUwo+IGJ5IGNhbGxpbmcgYnRmX2Rpc3RpbGxfZnVuY19wcm90bygpIHdpdGggZnVuYz09TlVM
TC4KPiBBbmQgdXNlIHRoYXQgdG8gYnVpbGQgYSB0cmFtcG9saW5lLgo+Cj4gVGhlIGNoYWxsZW5n
ZSBpcyBob3cgdG8gdXNlIG1pbmltYWwgbnVtYmVyIG9mIHRyYW1wb2xpbmVzCj4gd2hlbiBicGZf
cHJvZ0EgaXMgYXR0YWNoZWQgZm9yIGZ1bmMxLCBmdW5jMiwgZnVuYzMKPiBhbmQgYnBmX3Byb2dC
IGlzIGF0dGFjaGVkIHRvIGZ1bmMzLCBmdW5jNCwgZnVuYzUuCj4gV2UnZCBzdGlsbCBuZWVkIDMg
dHJhbXBvbGluZXM6Cj4gZm9yIGZ1bmNbMTJdIHRvIGNhbGwgYnBmX3Byb2dBLAo+IGZvciBmdW5j
MyB0byBjYWxsIGJwZl9wcm9nQSBhbmQgYnBmX3Byb2dCLAo+IGZvciBmdW5jWzQ1XSB0byBjYWxs
IGJwZl9wcm9nQi4KPgo+IEppcmkgd2FzIHRyeWluZyB0byBzb2x2ZSBpdCBpbiB0aGUgcGFzdC4g
SGlzIHNsaWRlcyBmcm9tIExQQzoKPiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTYvY29udHJp
YnV0aW9ucy8xMzUwL2F0dGFjaG1lbnRzLzEwMzMvMTk4My9wbHVtYmVycy5wZGYKPgo+IFBscyBz
dHVkeSB0aGVtIGFuZCBoaXMgcHJpb3IgcGF0Y2hzZXRzIHRvIGF2b2lkIHN0ZXBwaW5nIG9uIHRo
ZSBzYW1lIHJha2VzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
