Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE12D6554E
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0QiALqP6mdKwiV0wkLTg5x+Sea6amCZyOcsowPjEmU=; b=V0FdpSScwiJmSl
	Odj1jH3jP+a5Hbky8vKgirsIQ1+7Dt5Y+hzNX5+sM9Mn1zw92gS1WrDCEUSIPCoLDokQZsJmJtHKL
	GEIAjaZRLT5D96CRSiDmDCLRLoKY7FMJpCGbQFggFzJwEjA9TV9NFI6j9V/k6o8cgmf/MeWhgK70O
	5QrwOlbNgRl7n8ySmZuMufftWWit4RakNR47o+dFLRQp9cR8f04TwwqUaI+hdFdH+O9CuY8SBmLtV
	ZPXIuj1frzb9b4RAg+QR30L5AKSDUo9qSCrEliA6hhIJ8liyKNRKYV/zS40UqcZ1MASfAdngRHfxT
	XfDdoiFfQUFh0/9HSZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0w1-0000000BW0e-40mn;
	Tue, 26 Nov 2024 19:09:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0vZ-0000000BVwi-3OF0
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 19:08:50 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7fc2dbee20fso2126684a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Nov 2024 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732648129; x=1733252929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzpJHFBf+UwrpTd1/ASOxsImqCiQ35Pf7i1O4FF/kBw=;
        b=KMsJmyGrIUTkpmyjGaAeQRcFwCMxGrGlDN4SIp6JlA/5Px+dKnSt8I6JLsPCan0rJZ
         M6zgyTEkSwyWCYRzTstj57dxvmV/hXZxPYieGBxrzcZ19xrvCf+SC5DHkVDADJbQjtIO
         uERJPhGs28czBc2tlgIoZ+nmDqudY3dfsMhajz3NId1eHMZNujk7sFDK3mKk3DaUhf5/
         UzSyDZxz9yZgmHqQ8+/BmEixpti66dZ3A4tP/I8V1B1+7lo4C6s2TXfJNCXnrgy0MzDH
         qOAMMUsYL+6k8F9fQYI4LRBToc3LRni8YYw42qpoEEowSrUT5uYG7EFjk0+Q3EWO7Xh1
         oP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732648129; x=1733252929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzpJHFBf+UwrpTd1/ASOxsImqCiQ35Pf7i1O4FF/kBw=;
        b=fNAbC4Nw9chSATlyz62U99Ui+06sJetMKE8lG7nQH3+DFbnOmeUWmxdKxrqZfwK/5/
         Zef1X/QKFlm7sHhz7AptMoM0TgisNRNwtMwyn6PzX4MkAesvsCCKgHZUpM1PwwJMvYht
         I74MEKWQR6Nw0Q5tUsd2H9A82jeSoe9hiGarhnxbUJ0Q2E791UGkH4XlSqo4rrBslKxx
         vS+Tet06mTaW8Cgkbw5CkmppxFmfnq+ij1L6kqYkgkLOk5rHSRv3toyp62wvvGQDDy8N
         WJPG/cWs2tYAiwG1SSH62HdJtigoOHlEdlbCA57QXX1CjF+AGEa4Ud3skoJk/94zWdWE
         oxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPu7J9lCx7+QJ3hVfoxK6wNPG1b+8VXSiQ6+cJviJAK65X2PMH8UyOA8MZVEWsfvMg3fIoKq2yFDfFOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytgzt3GZUoK23ZswHEX7ZQj9U2S5gHm/ws9/P+ntvzwNf2tmn+
	DyYaLz3Y7ZqOzrhfHLNjbQA2eo1atANiHNGv+JmG9r0EPsZ9r/NEJoDWcJ56KaY0bxQBE+hDort
	p3MmP9lT1WAecN4jQRzdO+NbgjGw=
X-Gm-Gg: ASbGnct03b1ZTrqeQBRX8nk+NJGT7wQwPQsv2o4P7+hI4aIQEyNjjlQ3MoutjYR3VZ3
	xVeQkXsHmVpvwlULQGqSy0qb2E0i+9623UQudaz1O0XFNB7s=
X-Google-Smtp-Source: AGHT+IHcYrRCh6RNI0uiagGqqkaq3FZL8c+Kw3Z8YZqY6vK95MlFLapo/aFhwibPheHhsonc+9ZqeeDqk3LMLFpN7X0=
X-Received: by 2002:a05:6a21:670f:b0:1e0:d5fb:6fa9 with SMTP id
 adf61e73a8af0-1e0e0baf8b9mr790086637.31.1732648128845; Tue, 26 Nov 2024
 11:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20241106193208.290067-1-bjorn@kernel.org> <87r076nikd.fsf@all.your.base.are.belong.to.us>
 <Zz7Ng9CzrF_ciAz-@google.com> <6a960374-0cd2-4de9-8fc6-c8fe21097b6b@kernel.org>
In-Reply-To: <6a960374-0cd2-4de9-8fc6-c8fe21097b6b@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 26 Nov 2024 11:08:36 -0800
Message-ID: <CAEf4BzbY6E4cfFKvnjjXYX=03yGdMa6oLAAca8JXSh9e6b-6iw@mail.gmail.com>
Subject: Re: [PATCH] tools: Override makefile ARCH variable if defined, but empty
To: Quentin Monnet <qmo@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Abdurachmanov <davidlt@rivosinc.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_110849_847144_3CB5690E 
X-CRM114-Status: GOOD (  20.97  )
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

T24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMzozMOKAr0FNIFF1ZW50aW4gTW9ubmV0IDxxbW9Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiAyMDI0LTExLTIwIDIyOjA0IFVUQy0wODAwIH4gTmFtaHl1bmcg
S2ltIDxuYW1oeXVuZ0BrZXJuZWwub3JnPgo+ID4gT24gV2VkLCBOb3YgMjAsIDIwMjQgYXQgMDI6
MjU6MjJQTSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+PiBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gPj4KPiA+Pj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+ID4+Pgo+ID4+PiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgdG9v
bHMgKGJwZnRvb2wsIHNlbGZ0ZXN0cyksIHRoYXQgcmVxdWlyZSBhCj4gPj4+ICJib290c3RyYXAi
IGJ1aWxkLiBIZXJlLCBhIGJvb3RzdHJhcCBidWlsZCBpcyBhIGJ1aWxkIGhvc3QgdmFyaWFudCBv
Zgo+ID4+PiBhIHRhcmdldC4gRS5nLiwgYXNzdW1lIHRoYXQgeW91J3JlIHBlcmZvcm1pbmcgYSBi
cGZ0b29sIGNyb3NzLWJ1aWxkIG9uCj4gPj4+IHg4NiB0byByaXNjdiwgYSBib290c3RyYXAgYnVp
bGQgd291bGQgdGhlbiBiZSBhbiB4ODYgdmFyaWFudCBvZgo+ID4+PiBicGZ0b29sLiBUaGUgdHlw
aWNhbCB3YXkgdG8gcGVyZm9ybSB0aGUgaG9zdCBidWlsZCB2YXJpYW50LCBpcyB0byBwYXNzCj4g
Pj4+ICJBUkNIPSIgaW4gYSBzdWItbWFrZS4gSG93ZXZlciwgaWYgYSB2YXJpYWJsZSBoYXMgYmVl
biBzZXQgd2l0aCBhCj4gPj4+IGNvbW1hbmQgYXJndW1lbnQsIHRoZW4gb3JkaW5hcnkgYXNzaWdu
bWVudHMgaW4gdGhlIG1ha2VmaWxlIGFyZQo+ID4+PiBpZ25vcmVkLgo+ID4+Pgo+ID4+PiBUaGlz
IHNpZGUtZWZmZWN0IHJlc3VsdHMgaW4gdGhhdCBBUkNILCBhbmQgdmFyaWFibGVzIGRlcGVuZGlu
ZyBvbiBBUkNICj4gPj4+IGFyZSBub3Qgc2V0Lgo+ID4+Pgo+ID4+PiBXb3JrYXJvdW5kIGJ5IG92
ZXJyaWRpbmcgQVJDSCB0byB0aGUgaG9zdCBhcmNoLCBpZiBBUkNIIGlzIGVtcHR5Lgo+ID4+Pgo+
ID4+PiBGaXhlczogODg1OWIwZGE1YWFjICgidG9vbHMvYnBmdG9vbDogRml4IGNyb3NzLWJ1aWxk
IikKPiA+Pj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+ID4KPiA+IFJldmlld2VkLWJ5OiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+
Cj4KPgo+IEFja2VkLWJ5OiBRdWVudGluIE1vbm5ldCA8cW1vQGtlcm5lbC5vcmc+Cj4KPgo+ID4+
IEFybmFsZG8vUGFsbWVyL1F1ZW50aW46Cj4gPj4KPiA+PiBBIGJpdCB1bnN1cmUgd2hhdCB0cmVl
IHRoaXMgcGF0Y2ggc2hvdWxkIGdvLiBJdCdzIHZlcnkgaW1wb3J0YW50IGZvciB0aGUKPiA+PiBS
SVNDLVYgYnVpbGRzLCBzbyBtYXliZSB2aWEgUGFsbWVyJ3MgUklTQy1WIHRyZWU/Cj4gPgo+ID4g
SSB0aGluayBpdCdkIGJlIGJlc3QgdG8gcm91dGUgdGhpcyB0aHJvdWdoIHRoZSBicGYgdHJlZSBh
cyBpdCBzZWVtcyB0aGUKPiA+IG1haW4gdGFyZ2V0IGlzIGJwZnRvb2wuICBCdXQgZ2l2ZW4gdGhl
IHNpemUgYW5kIHRoZSBzY29wZSBvZiB0aGUgY2hhbmdlLAo+ID4gaXQgc2hvdWxkIGJlIGZpbmUg
d2l0aCBwZXJmLXRvb2xzIG9yIFJJU0MtViB0cmVlLgo+Cj4KPiBUaGUgYnBmIHRyZWUgd291bGQg
bWFrZSBzZW5zZSB0byBtZSBhcyB3ZWxsIChidXQgSSBkb24ndCBtZXJnZSBwYXRjaGVzCj4gbXlz
ZWxmOyBsZXQgbWUgQ2MgQlBGIG1haW50YWluZXJzKS4KCkRvZXNuJ3Qgc2VlbSBsaWtlIHRoaXMg
ZmlsZSBpcyBvd25lZCBieSBhbnlvbmUgc3BlY2lmaWMsIEkgZ3Vlc3MgaXQncwpmaW5lIHRvIHJv
dXRlIGl0IHRocm91Z2ggQlBGIGR1ZSB0byBicGZ0b29sPyBTaG91bGQgdGhpcyBiZSBicGYgb3IK
YnBmLW5leHQ/IEFsc28sIHBsZWFzZSByZXNlbmQgdGFyZ2V0aW5nIHRoZSByaWdodCB0cmVlLCBz
byBCUEYgQ0kgY2FuCnRlc3QgdGhpcy4KCj4KPiBRdWVudGluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
