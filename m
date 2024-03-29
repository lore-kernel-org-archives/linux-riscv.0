Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E691C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 23:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9j3j1vFsPu0LpiVgZ+Mn2a0/xc9cePUlrF3bIiYQTNo=; b=aC/hayVq8ZzEVL
	6APChYNAHIKOnpVuRzfREauQicghaOdV52xFzOe9TZ6BDwgiVASOVXuWIA3PVnv5LQbMFIsH8i5W+
	XqF1m/peffF9IBzk9mZjGFfY93dD43LvzKeJbUwYpaD9Bk6mQHv+N411vuI/ZYtSN9Cl2kAQ0wTVk
	P0qAqxo2VUK9nem3qEgcEXeaIsuZcKBBgPKxxEgDeA7sHFddrx4PG+Kjtaolh5UVO9LcV8aXF9q2R
	mWb7yEZhJtQxNnYzhpBNMPypH30kohYmQejF80PQnuGQcIcO0pEHsHkW+F5TPWmIN99mK1SCSzoHR
	gSPGCHMGZZm/FV1RyiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqLeZ-00000002Ifc-1DGh;
	Fri, 29 Mar 2024 23:28:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqLeV-00000002IdB-1Bm0;
	Fri, 29 Mar 2024 23:28:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2a21330d093so789924a91.2;
        Fri, 29 Mar 2024 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711754926; x=1712359726; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvV1tZGanDBSafK6edOdycvbQYDEdHbTCxngJvsvk3c=;
        b=To/mI+ZTLTG1hb/fDP8Av1BS/5UoM/3fQjcfptyhib3911NDC08rTiV3bOi+QapIM+
         Jdvky5SdJ0RJ8fu4T/FhauU8TWBK5WY/o5ijOOeYKzV3Z55/J6/b5TrQNeDuDNLJvZcT
         aTc4zGDWGC02R72Elu6ik7P3c/4RWuVqF7iou0jTolxpWnQp9onC1tTVCGMAutizhD3Z
         3NjrbEE/+G0/DOxVBB5ajkHD2ac7mnfXL6OQ4hp1I3dcWU0Z8suYB4RFWuuSaaWhzKxI
         2o16n14Q8IP+fAgv2jQpnET2G43b01vOGI+BA4aaMirNJ8OmitquViubhtVq0zqu8tWN
         lIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711754926; x=1712359726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvV1tZGanDBSafK6edOdycvbQYDEdHbTCxngJvsvk3c=;
        b=oNr8LLnSIbu3hH708AlWfofwXNoj77xpUMHdbYTid9P/KZuOk+Wjn4wREGqbposm2w
         XSXTKxP75kKd4aY2H+jw76ABbp7RNkRn2nB7lKzL6i1LzFVP3SNnhWWxCCtvWLFuJz9H
         gjkJUHTN/qKcWzjjITPRP22ABcOFSZiCxFBuQ7EA6xS+RROVmCF1dc4OT0eLdvh5Kzkf
         gCzVbESOQ3XNlDKrCWIiQocO7Oz/6oP2ufI8WJLOb5oz79iGc0+4kP6LCoEAxo0sbnwq
         hFFQMmyXLAxaBumz353zP4LU9Y9IJGhxJK/OENB9UY1ROxdZDLTe6h2hZUApqOZhSIXf
         +oAA==
X-Forwarded-Encrypted: i=1; AJvYcCXqY6d7+mgEM4YwgFr9pWR3LqNWb9HDsWYoQ/WSd9RJe/fSqeVybAJo49jQz2KaUXSiSGTdn3s60+Ek4yiMW3Qkn85Ue7gsoKDe04BGwGQXcxpaAmwPlh1r1GItEIz2fHBtmujwthx3BopFCkOoX5CJmB43NHM=
X-Gm-Message-State: AOJu0YypHwhLmbmTaLtTkjQjha7x5uofWd6e0P9do27Py8M6IjGH3DbY
	NvuN7Cv1ni1uzWPZri9aH7t7Wp2sKwrpt/151pJcUh7xtwNV6dVfiaP0LqPjxq+e5HF3BOGRF4+
	UAm9ILvzE2wmeabadF4cwclHWbRQ=
X-Google-Smtp-Source: AGHT+IFNbTnA2C1UowyvpIWfWMecar3RYOVPJRlOoVy5NMmPOOKB6ZhvqfzCxbpKkf/w3Z3THbX/GA+A1iwjf07EvPY=
X-Received: by 2002:a17:90a:be04:b0:2a2:1415:723d with SMTP id
 a4-20020a17090abe0400b002a21415723dmr3177860pjs.42.1711754926271; Fri, 29 Mar
 2024 16:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com> <20240328111330.194dcbe5@gandalf.local.home>
In-Reply-To: <20240328111330.194dcbe5@gandalf.local.home>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 29 Mar 2024 16:28:33 -0700
Message-ID: <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Steven Rostedt <rostedt@goodmis.org>
Cc: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_162851_334035_57FB6A5E 
X-CRM114-Status: GOOD (  29.70  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgODoxMOKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMjggTWFyIDIwMjQgMjI6NDM6NDYgKzA4
MDAKPiDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4g
PiBJIGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAo+ID4gdHJh
bXBvbGluZXMuIEl0IGlzIHNsb3csIHF1aXRlIHNsb3csIHdoaWNoIGNvbnN1bWUgdXAgdG8KPiA+
IDYwcy4gV2UgY2FuJ3QgZG8gaXQgdGhpcyB3YXkuCj4gPgo+ID4gTm93LCBJIGhhdmUgYSBiYWQg
aWRlYS4gSG93IGFib3V0IHdlIGludHJvZHVjZQo+ID4gYSAiZHluYW1pYyB0cmFtcG9saW5lIj8g
VGhlIGJhc2ljIGxvZ2ljIG9mIGl0IGNhbiBiZToKPiA+Cj4gPiAiIiIKPiA+IHNhdmUgcmVncwo+
ID4gYnBmcyA9IHRyYW1wb2xpbmVfbG9va3VwX2lwKGlwKQo+ID4gZmVudHJ5ID0gYnBmcy0+ZmVu
dHJpZXMKPiA+IHdoaWxlIGZlbnRyeToKPiA+ICAgZmVudHJ5KGN0eCkKPiA+ICAgZmVudHJ5ID0g
ZmVudHJ5LT5uZXh0Cj4gPgo+ID4gY2FsbCBvcmlnaW4KPiA+IHNhdmUgcmV0dXJuIHZhbHVlCj4g
Pgo+ID4gZmV4aXQgPSBicGZzLT5mZXhpdHMKPiA+IHdoaWxlIGZleGl0Ogo+ID4gICBmZXhpdChj
dHgpCj4gPiAgIGZleGl0ID0gZmV4aXQtPm5leHQKPiA+Cj4gPiB4eHh4eHgKPiA+ICIiIgo+ID4K
PiA+IEFuZCB3ZSBsb29rdXAgdGhlICJicGZzIiBieSB0aGUgZnVuY3Rpb24gaXAgaW4gYSBoYXNo
IG1hcAo+ID4gaW4gdHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoK
PiA+Cj4gPiBzdHJ1Y3QgYnBmX2FycmF5IHsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpmZW50cmll
czsKPiA+ICBzdHJ1Y3QgYnBmX3Byb2cgKmZleGl0czsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpt
b2RpZnlfcmV0dXJuczsKPiA+IH0KPiA+Cj4gPiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHRoZSBi
cGYgcHJvZ0EgdG8gZnVuY3Rpb24gQS9CL0MsCj4gPiB3ZSBvbmx5IG5lZWQgdG8gY3JlYXRlIHRo
ZSBicGZfYXJyYXlBLCBicGZfYXJyYXlCLCBicGZfYXJyYXlDCj4gPiBhbmQgYWRkIHRoZSBwcm9n
QSB0byB0aGVtLCBhbmQgaW5zZXJ0IHRoZW0gdG8gdGhlIGhhc2ggbWFwCj4gPiAiZGlyZWN0X2Nh
bGxfYnBmcyIsIGFuZCBhdHRhY2ggdGhlICJkeW5hbWljIHRyYW1wb2xpbmUiIHRvCj4gPiBBL0Iv
Qy4gSWYgYnBmX2FycmF5QSBleGlzdCwganVzdCBhZGQgcHJvZ0EgdG8gdGhlIHRhaWwgb2YKPiA+
IGJwZl9hcnJheUEtPmZlbnRyaWVzLiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHByb2dCIHRvCj4g
PiBCL0MsIGp1c3QgYWRkIHByb2dCIHRvIGJwZl9hcnJheUItPmZlbnRyaWVzIGFuZAo+ID4gYnBm
X2FycmF5Qi0+ZmVudHJpZXMuCj4gPgo+ID4gQ29tcGFyZWQgdG8gdGhlIHRyYW1wb2xpbmUsIGV4
dHJhIG92ZXJoZWFkIGlzIGludHJvZHVjZWQKPiA+IGJ5IHRoZSBoYXNoIGxvb2t1cGluZy4KPiA+
Cj4gPiBJIGhhdmUgbm90IGJlZ3VuIHRvIGNvZGUgeWV0LCBhbmQgSSBhbSBub3Qgc3VyZSB0aGUg
b3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGUuIENvbnNpZGVyaW5nIHRoYXQgd2UgYWxzbyBuZWVk
IHRvIGRvIGhhc2ggbG9va3VwCj4gPiBieSB0aGUgZnVuY3Rpb24gaW4ga3Byb2JlX211bHRpLCBt
YXliZSB0aGUgb3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGU/Cj4KPiBTb3VuZHMgbGlrZSB5b3Ug
YXJlIGp1c3QgcmVjcmVhdGluZyB0aGUgZnVuY3Rpb24gbWFuYWdlbWVudCB0aGF0IGZ0cmFjZQo+
IGhhcy4gSXQgYWxzbyBjYW4gYWRkIHRob3VzYW5kcyBvZiB0cmFtcG9saW5lcyB2ZXJ5IHF1aWNr
bHksIGJlY2F1c2UgaXQgZG9lcwo+IGl0IGluIGJhdGNoZXMuIEl0IHRha2VzIHNwZWNpYWwgc3lu
Y2hyb25pemF0aW9uIHN0ZXBzIHRvIGF0dGFjaCB0byBmZW50cnkuCj4gZnRyYWNlIChhbmQgSSBi
ZWxpZXZlIG11bHRpLWtwcm9iZXMpIHVwZGF0ZXMgYWxsIHRoZSBhdHRhY2htZW50cyBmb3IgZWFj
aAo+IHN0ZXAsIHNvIHRoZSBzeW5jaHJvbml6YXRpb24gbmVlZGVkIGlzIG9ubHkgZG9uZSBvbmNl
Lgo+Cj4gSWYgeW91IHJlYWxseSB3YW50IHRvIGhhdmUgdGhvdXNhbmRzIG9mIGZ1bmN0aW9ucywg
d2h5IG5vdCBqdXN0IHJlZ2lzdGVyIGl0Cj4gd2l0aCBmdHJhY2UgaXRzZWxmLiBJdCB3aWxsIGdp
dmUgeW91IHRoZSBhcmd1bWVudHMgdmlhIHRoZSBmdHJhY2VfcmVncwo+IHN0cnVjdHVyZS4gQ2Fu
J3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPgo+IEl0IHdp
bGwgcHJvYmFibHkgbWFrZSB5b3VyIGFjY291bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxl
dCBmdHJhY2UKPiBoYW5kbGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2FzIG1h
ZGUgdG8gZG8uCj4KCkkgdGhvdWdodCBJJ2xsIGp1c3QgYXNrIGluc3RlYWQgb2YgZGlnZ2luZyB0
aHJvdWdoIGNvZGUsIHNvcnJ5IGZvcgpiZWluZyBsYXp5IDopIElzIHRoZXJlIGFueSB3YXkgdG8g
cGFzcyBwdF9yZWdzL2Z0cmFjZV9yZWdzIGNhcHR1cmVkCmJlZm9yZSBmdW5jdGlvbiBleGVjdXRp
b24gdG8gYSByZXR1cm4gcHJvYmUgKGZleGl0L2tyZXRwcm9iZSk/IEkuZS4sCmhvdyBoYXJkIGlz
IGl0IHRvIHBhc3MgaW5wdXQgZnVuY3Rpb24gYXJndW1lbnRzIHRvIGEga3JldHByb2JlPyBUaGF0
J3MKdGhlIGJpZ2dlc3QgYWR2YW50YWdlIG9mIGZleGl0IG92ZXIga3JldHByb2JlLCBhbmQgaWYg
d2UgY2FuIG1ha2UKdGhlc2Ugb3JpZ2luYWwgcHRfcmVncy9mdHJhY2VfcmVncyBhdmFpbGFibGUg
dG8ga3JldHByb2JlLCB0aGVuCm11bHRpLWtyZXRwcm9iZSB3aWxsIGVmZmVjdGl2ZWx5IGJlIHRo
aXMgbXVsdGktZmV4aXQuCgo+IC0tIFN0ZXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
