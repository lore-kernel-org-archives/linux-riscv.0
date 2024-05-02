Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B69C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkNe9Lv6W4bIPWL39OUvWkdWsydg4tXQ8OowV/SZ9Nw=; b=eToVro4eoic54M
	VaT86LfTRaH+sQ3Z7VhumCkZDbmyFOp4JK9dpAih+CqYdQDgOBGBalK4osaij4GJVmce4xd3oFAZW
	d/PReE2Es0M098x/hWlIS/n2drpai08c0PSWAJe833dsZf6zTXFfWojaC+v0lJQDCqJP+3ts/tUDZ
	YweK+9/Ik78OMso+ciP4Kk2dnunPDkCaMiBN2TTOPjmYZiIVQ9IkFoyBZP0O0jf+tdkPo9Wqm63Nf
	I9omBm4Nqp8slHm7YAVuMUvYagOtpXw9mA0afEkZXTV8UBMv1dbh3Gw8tYxd2u7szlhqwyC+fpO7j
	54UKlIr6hrZgVMKtQwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YuN-0000000DDdj-399J;
	Thu, 02 May 2024 16:03:43 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YuL-0000000DDdF-01Nt
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:03:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-61bbb208ea5so202360a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714665819; x=1715270619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAQxuUgTDSs7P51keSTZK2/Vp77QRp7hznvGymhP8aw=;
        b=i3WtB6CI1lkoFd20Q73l5+sOP+CKSJlkQC6iJjvZJkbfnYfucG8LkgNfKrmMW8taDq
         WBGnhxekhOhQoQ+gHuo2qJrGaOR54p8qRIsVsa0y/FX2GcVyfnjWiQGVg4osrXQO8yC/
         7iEU0P0jEAN3EMlwLIdeg2oPdkPPhoG2aZm1sARObEl3x/liKe9UOKVMw65qd3H1ItjO
         B/OGM8lmbs1J56LlCmFJgQKiq77f1GJH2cBF5+w/NdE/o1r8I3gioG0DMzXCKtTJLKpb
         N+cgiG+bnYnJprL84OPYBZNAFRn716UBLm8Gi7JmitqbEJq5ZsnMU5YWwExogdgirfbZ
         ta3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714665819; x=1715270619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAQxuUgTDSs7P51keSTZK2/Vp77QRp7hznvGymhP8aw=;
        b=cq4cyPXXbFdawDY0yNmZ7t+TVA07p9OOOwUHn9P8fFgH+mo72kZG52lUqIPiDHmIoA
         y8/E/5xcWHCz8xXQXJRIL9ocR7ACAM/XKOLZFGS302QcZDKEJV47baYIlwOnqgxks6ul
         qP4M+PRgFZCIw9lPlwo/QXAvgJo9IUQESSiVSV7CjDM19xzlXnV1sn3PF7iZx2yQbG5V
         YXQHfl/xX5g6BlhcsYDah5O9VO7KOHV6NS6xCnZpqB853w0d09q8v14B6bt/ND1uv3+r
         EPGzvo/Ac7xQLNY2cJ0Ee678aRzEyD1nGW7NkYuSx5xIdk4ht5MWHPCpGYITxUVyQN93
         5Q+w==
X-Forwarded-Encrypted: i=1; AJvYcCWqX3Bt3WOKRq8EggoZK6ne9v4uH2MWOD+1zsD+rw4sbFXw/nW4APLH5gmnitj3Pa5z7g80KKqFzAXzkCd6f7an49M2uCxn0qTBC80c8UP0
X-Gm-Message-State: AOJu0YztSWOOhRhwH9Qu6yRIAhzEApoquGubwMzhfQJQeli1OB+BVxjU
	ELthnH21e2p919Jf3L0nuhnCvu05yFk1PmQ5Jq3ehgF1xK0ybkUUMLt0KRA5XN/AFb0Djm5eAdi
	FGSSdy0wlyiWTLFKcjzFVwSKutH4=
X-Google-Smtp-Source: AGHT+IEBwiLi8Ts2gfPfvH/pwb6ep1VySneCkF0yDEYPJ5kxpKt4+M5rbi68A5q1GE15OILzhKjzLax6wr3vdOUwREU=
X-Received: by 2002:a17:90a:6fc4:b0:2b3:28df:91e1 with SMTP id
 e62-20020a17090a6fc400b002b328df91e1mr205916pjk.10.1714665818449; Thu, 02 May
 2024 09:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240430175834.33152-1-puranjay@kernel.org> <20240430175834.33152-3-puranjay@kernel.org>
 <CAEf4Bzb4FYVNjuoghCcDxLgQCOT9Mb=nbjgNktqDarPHkOsuog@mail.gmail.com> <mb61pcyq45p6j.fsf@kernel.org>
In-Reply-To: <mb61pcyq45p6j.fsf@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 May 2024 09:03:26 -0700
Message-ID: <CAEf4Bza5ZRhX51oK-rVwoHnoy7mMn1EMW5P+cczZp3arcHdeyQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] riscv, bpf: inline bpf_get_smp_processor_id()
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_090341_071326_7C100AE0 
X-CRM114-Status: GOOD (  27.14  )
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

T24gVGh1LCBNYXkgMiwgMjAyNCBhdCA2OjE24oCvQU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWkubmFrcnlpa29A
Z21haWwuY29tPiB3cml0ZXM6Cj4KPiA+IE9uIFR1ZSwgQXByIDMwLCAyMDI0IGF0IDEwOjU54oCv
QU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4g
SW5saW5lIHRoZSBjYWxscyB0byBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWQoKSBpbiB0aGUgcmlz
Y3YgYnBmIGppdC4KPiA+Pgo+ID4+IFJJU0NWIHNhdmVzIHRoZSBwb2ludGVyIHRvIHRoZSBDUFUn
cyB0YXNrX3N0cnVjdCBpbiB0aGUgVFAgKHRocmVhZAo+ID4+IHBvaW50ZXIpIHJlZ2lzdGVyLiBU
aGlzIG1ha2VzIGl0IHRyaXZpYWwgdG8gZ2V0IHRoZSBDUFUncyBwcm9jZXNzb3IgaWQuCj4gPj4g
QXMgdGhyZWFkX2luZm8gaXMgdGhlIGZpcnN0IG1lbWJlciBvZiB0YXNrX3N0cnVjdCwgd2UgY2Fu
IHJlYWQgdGhlCj4gPj4gcHJvY2Vzc29yIGlkIGZyb20gVFAgKyBvZmZzZXRvZihzdHJ1Y3QgdGhy
ZWFkX2luZm8sIGNwdSkuCj4gPj4KPiA+PiAgICAgICAgICAgUklTQ1Y2NCBKSVQgb3V0cHV0IGZv
ciBgY2FsbCBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWRgCj4gPj4gICAgICAgICAgID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4+Cj4gPj4g
ICAgICAgICAgICAgICAgIEJlZm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgIEFmdGVyCj4g
Pj4gICAgICAgICAgICAgICAgLS0tLS0tLS0gICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0t
LQo+ID4+Cj4gPj4gICAgICAgICAgYXVpcGMgICB0MSwweDg0OGMgICAgICAgICAgICAgICAgICBs
ZCAgICBhNSwzMih0cCkKPiA+PiAgICAgICAgICBqYWxyICAgIDYwNCh0MSkKPiA+PiAgICAgICAg
ICBtdiAgICAgIGE1LGEwCj4gPj4KPiA+Cj4gPiBOaWNlLCBncmVhdCBmaW5kISBXb3VsZCB5b3Ug
YmUgYWJsZSB0byBkbyBzaW1pbGFyIGlubGluaW5nIGZvciB4ODYtNjQKPiA+IGFzIHdlbGw/IERp
c2Fzc2VtYmxpbmcgYnBmX2dldF9zbXBfcHJvY2Vzc29yX2lkIGZvciB4ODYtNjQgc2hvd3MgdGhp
czoKPiA+Cj4gPiBEdW1wIG9mIGFzc2VtYmxlciBjb2RlIGZvciBmdW5jdGlvbiBicGZfZ2V0X3Nt
cF9wcm9jZXNzb3JfaWQ6Cj4gPiAgICAweGZmZmZmZmZmODEwZjkxYTAgPCswPjogICAgIDBmIDFm
IDQ0IDAwIDAwICBub3BsICAgMHgwKCVyYXgsJXJheCwxKQo+ID4gICAgMHhmZmZmZmZmZjgxMGY5
MWE1IDwrNT46ICAgICA2NSA4YiAwNSA2MCA3OSBmMyA3ZSAgICBtb3YKPiA+ICVnczoweDdlZjM3
OTYwKCVyaXApLCVlYXggICAgICAgICMgMHgzMGIwYyA8cGNwdV9ob3QrMTI+Cj4gPiAgICAweGZm
ZmZmZmZmODEwZjkxYWMgPCsxMj46ICAgIDQ4IDk4ICAgY2x0cQo+ID4gICAgMHhmZmZmZmZmZjgx
MGY5MWFlIDwrMTQ+OiAgICBjMyAgICAgIHJldAo+ID4gRW5kIG9mIGFzc2VtYmxlciBkdW1wLgo+
ID4gV2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gdGhlIHNhbWUgaW4geDg2LTY0IEJQRiBKSVQuIChp
dCdzIGFjdHVhbGx5IGhvdwo+ID4gSSBzdGFydGVkIGluaXRpYWxseSwgSSBoYWQgYSBkZWRpY2F0
ZWQgaW5zdHJ1Y3Rpb24gcmVhZGluZyBwZXItY3B1Cj4gPiBtZW1vcnksIGJ1dCBlbmRlZCB1cCB3
aXRoIG1vcmUgZ2VuZXJhbCAiY2FsY3VsYXRlIHBlci1jcHUgYWRkcmVzcyIpLgo+Cj4gSSBmZWVs
IGluIHg4Ni02NCdzIGNhc2UgSklUIGNhbiBub3QgZG8gYSAobXVjaCkgYmV0dGVyIGpvYiBjb21w
YXJlZCB0byB0aGUKPiBjdXJyZW50IGFwcHJvYWNoIGluIHRoZSB2ZXJpZmllci4KClRoaXMgZGly
ZWN0IG1lbW9yeSByZWFkICh1c2luZyBncyBzZWdtZW50KSBvdWdodCB0byBiZSBhIGJpdCBmYXN0
ZXIKdGhhbiBjYWxjdWxhdGluZyBvZmZzZXQgYW5kIHRoZW4gZG9pbmcgbWVtb3J5IGRlcmVmZXJl
bmNlLCBidXQgeWVzLAp0aGUgZGlmZmVyZW5jZSB3b24ndCBiZSBhcyBiaWcgYXMgeW91IGdvdCB3
aXRoIFJJU0MtViBhbmQgQVJNNjQuIE9rLApuZXZlciBtaW5kLCB3ZSBjYW4gYWx3YXlzIGJlbmNo
bWFyayBhbmQgYWRkIHRoYXQgbGF0ZXIsIG5vIGJpZyBkZWFsLgoKPgo+IE9uIFJJU0MtViBhbmQg
QVJNNjQsIEpJVCB3YXMgYWJsZSB0byBkbyBpdCBiZXR0ZXIgYmVjYXVzZSBib3RoIG9mIHRoZXNl
Cj4gYXJjaGl0ZWN0dXJlcyBzYXZlIGEgcG9pbnRlciB0byB0aGUgdGFzayBzdHJ1Y3QgaW4gYSBz
cGVjaWFsIENQVQo+IHJlZ2lzdGVyLiBBcyB4ODYtNjQgZG9lc24ndCBoYXZlIGVub3VnaCBleHRy
YSByZWdpc3RlcnMsIGl0IHVzZXMgYQo+IHBlcmNwdSB2YXJpYWJsZSB0byBzdG9yZSB0YXNrIHN0
cnVjdCwgdGhyZWFkX2luZm8sIGFuZCB0aGUgY3B1Cj4gbnVtYmVyLgo+Cj4gUC5TLiAtIFdoaWxl
IGRvaW5nIHRoaXMgZm9yIEJQRiwgSSByZWFsaXplZCB0aGF0IEFSTTY0IGtlcm5lbCBjb2RlIGlz
Cj4gYWxzbyBub3Qgb3B0aW1hbCBhcyBpdCBpcyB1c2luZyB0aGUgcGVyY3B1IHZhcmlhYmxlIGFu
ZCBpcyBub3QgcmVhZGluZwo+IHRoZSBDUFUgcmVnaXN0ZXIgZGlyZWN0bHkuIFNvLCBJIHNlbnQg
YSBwYXRjaFsxXSB0byBmaXggaXQgaW4gdGhlIGtlcm5lbAo+IGFuZCBnZXQgcmlkIG9mIHRoZSBw
ZXItY3B1IHZhcmlhYmxlIGluIEFSTTY0Lgo+Cj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjQwNTAyMTIzNDQ5LjI2OTAtMi1wdXJhbmpheUBrZXJuZWwub3JnLwo+Cj4gPiBB
bnl3YXlzLCBncmVhdCB3b3JrLCBhIHNtYWxsIG5pdCBiZWxvdy4KPiA+Cj4gPiBBY2tlZC1ieTog
QW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9yZz4KPgo+IFRoYW5rcywKPiBQdXJhbmph
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
