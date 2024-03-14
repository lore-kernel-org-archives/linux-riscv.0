Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E05C54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmAqKXlCtSYSNLPvCI7UOTfEzPGK+we6Adrh48AzUm8=; b=ixw7GSHeHae80o
	ybvklfQ/hzPJ4uh7z+g+F0s5SNTzdGEk18qUjOUTZ7q1SwNcBPML8YVVlTHl81iepMXFj7Gkz84ov
	k4g0y+2BKxfJPYRAEGPDAKU8bx68EaRajog0ag/P+/+9OxCBoD9lvcru4OY8TEXdXU5X9Uj/yQvT1
	m7i2Sk/ijutIz73IaUB220qKyQ5K8qGJ7YGgN2zPQzJd7/Jm8GEhkiDsSkisB0iJJxL9gEfssNizD
	l5y59S2RlA7ZdY1UUFIprRr2arWn9zDuB9nrEvVo+lL7AGMZCDIlSDUqP1yX/ilvu58ybhM2uS2Pr
	H/0RGP749Zps2EzkbQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkYuz-0000000CNl6-0NhR;
	Thu, 14 Mar 2024 00:25:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkYuu-0000000CNhL-0Mgv;
	Thu, 14 Mar 2024 00:25:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33e94c12cfaso290106f8f.3;
        Wed, 13 Mar 2024 17:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710375948; x=1710980748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1pXXVSLcJWs+QWrQ+i4P/taCr8L+0F6xiRmk8ycZXY=;
        b=CjtFN4tc+u/j/lsRSnOws99CO0L4wunvvXjhWxqOeyGOhdaLH4+o+6J6sUZ/fIMTT0
         K1JV/d/odz76MoStDW75xiZE25KZNnjTsNhEZYrAHU46xYqnXBmQwwgp4Dz1gg16439R
         rNUHDEqC/Ek0nzHmiHJfqZY9VnjBsJlelZFlXHTQNO8cdvnC9NWTAHKFeIr7ZwTPPlnq
         7A+GjxKS90M0k/Zp6g/r0E8siP2AdX6zSK/EMtpCsljTGEpGkg6nH1AtzolcVx1YN24O
         DeZzE1sd7PmbY4v7ZKWr4KwrSMdMobiI3dG7Gr7jVNopKE9Byzr3xfDjS/iDl6YfdZZv
         ophg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710375948; x=1710980748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1pXXVSLcJWs+QWrQ+i4P/taCr8L+0F6xiRmk8ycZXY=;
        b=t9/C2xD/MQqj4Oz9NbTN3kkuXGL+IT3zL5XTUgwLI/RiCAPPMihLW/Qcpsl/+T3PMA
         +EdvqnT7TArhaDRKrDltLDb4RazMSWWZKJ08w/ICPyrqcESaiR2z6FoB5suwyhXvmeOa
         c14cgPypiteip8Br8fmMICprJ0EUcbmDCtFMZTigqcqXpUnc+/5SIcsWzNNXRJHc3ZKN
         W9GKvh3WCl7guoT+cjDwaJBbjD34UOIqXTQlkgRX53AenCTSnZkx3FjlW1bbj61I7Zys
         WfcP34fwO7MPhQ8tJuW4ZtdXbK5Yii94tec0vlKv0jty7c9G3ZXFTc1I9H0YFp2vaGDI
         5nDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEYwtDTcoYAeIjDyeuAOKcHPHcA4UNEpbmZ1M+hvsUEqvWMrRRKZRII+OnH1HKi6nnkoAYxpQhS6s362casGobAkc4e8fm7+wA2UnJHUwdQTwYLoCYOUCaHXGhcu3lPyZ0vyhtmJDHgjNLy6Ys0QD/yBHYLOw=
X-Gm-Message-State: AOJu0YwUl5/+EvxKbczer7w4b3F1blFpSo7uMbgtrv1o4t4fiqc78d0U
	PUgzWhWmqBA8SzcebHVVAWzKz8O/Hxd8lMjVpGSSIHhDi8sGPDZiPhTumjW2UjsIwOINvZSVAyo
	YE6TNITas76o3U7P8YPPIDgwT2C4=
X-Google-Smtp-Source: AGHT+IEluUxpksFRvEO4amy8bxc8cXhNS84YSmujwUrBqdFTzudYkIWBqt3bc5Ekgo5hTd/k08iQyCGhQiEqmdJKoSg=
X-Received: by 2002:a5d:438e:0:b0:33e:44da:827 with SMTP id
 i14-20020a5d438e000000b0033e44da0827mr112820wrq.57.1710375947716; Wed, 13 Mar
 2024 17:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com> <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
In-Reply-To: <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 Mar 2024 17:25:35 -0700
Message-ID: <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
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
X-CRM114-CacheID: sfid-20240313_172552_210324_4F46AC5E 
X-CRM114-Status: GOOD (  32.10  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgNjo1M+KAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1hciAxMywgMjAyNCBhdCAxMjo0
MuKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo+IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCA3OjQy4oCvUE0g5qKm6b6Z
6JGjIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiBbLi4uLi4u
XQo+ID4KPiA+IEkgc2VlLgo+ID4gSSB0aG91Z2h0IHlvdSdyZSBzaGFyaW5nIHRoZSB0cmFtcG9s
aW5lIGFjcm9zcyBhdHRhY2htZW50cy4KPiA+IChzaW5jZSBicGYgcHJvZyBpcyB0aGUgc2FtZSku
Cj4KPiBUaGF0IHNlZW1zIHRvIGJlIGEgZ29vZCBpZGVhLCB3aGljaCBJIGhhZG4ndCB0aG91Z2h0
IGJlZm9yZS4KPgo+ID4gQnV0IGFib3ZlIGFwcHJvYWNoIGNhbm5vdCBwb3NzaWJseSB3b3JrIHdp
dGggYSBzaGFyZWQgdHJhbXBvbGluZS4KPiA+IFlvdSBuZWVkIHRvIGNyZWF0ZSBpbmRpdmlkdWFs
IHRyYW1wb2xpbmUgZm9yIGFsbCBhdHRhY2htZW50Cj4gPiBhbmQgcG9pbnQgdGhlbSB0byBzaW5n
bGUgYnBmIHByb2cuCj4gPgo+ID4gdGJoIEknbSBsZXNzIGV4Y2l0ZWQgYWJvdXQgdGhpcyBmZWF0
dXJlIG5vdywgc2luY2Ugc2hhcmluZwo+ID4gdGhlIHByb2cgYWNyb3NzIGRpZmZlcmVudCBhdHRh
Y2htZW50cyBpcyBuaWNlLCBidXQgaXQgd29uJ3Qgc2NhbGUKPiA+IHRvIHRob3VzYW5kcyBvZiBh
dHRhY2htZW50cy4KPiA+IEkgYXNzdW1lZCB0aGF0IHRoZXJlIHdpbGwgYmUgYSBzaW5nbGUgdHJh
bXBvbGluZSB3aXRoIG1heChhcmdubykKPiA+IGFjcm9zcyBhdHRhY2htZW50cyBhbmQgYXR0YWNo
L2RldGFjaCB3aWxsIHNjYWxlIHRvIHRob3VzYW5kcy4KPiA+Cj4gPiBXaXRoIGluZGl2aWR1YWwg
dHJhbXBvbGluZSB0aGlzIHdpbGwgd29yayBmb3IgdXAgdG8gYSBodW5kcmVkCj4gPiBhdHRhY2ht
ZW50cyBtYXguCj4KPiBXaGF0IGRvZXMgImEgaHVuZHJlZCBhdHRhY2htZW50cyBtYXgiIG1lYW5z
PyBDYW4ndCBJCj4gdHJhY2UgdGhvdXNhbmRzIG9mIGtlcm5lbCBmdW5jdGlvbnMgd2l0aCBhIGJw
ZiBwcm9ncmFtIG9mCj4gdHJhY2luZyBtdWx0aS1saW5rPwoKSSBtZWFuIHdoYXQgdGltZSBkb2Vz
IGl0IHRha2UgdG8gYXR0YWNoIG9uZSBwcm9ncmFtCnRvIDEwMCBmZW50cnktcyA/CldoYXQgaXMg
dGhlIHRpbWUgZm9yIDFrIGFuZCBmb3IgMTBrID8KClRoZSBrcHJvYmUgbXVsdGkgdGVzdCBhdHRh
Y2hlcyB0byBwcmV0dHkgbXVjaCBhbGwgZnVuY3MgaW4KL3N5cy9rZXJuZWwvdHJhY2luZy9hdmFp
bGFibGVfZmlsdGVyX2Z1bmN0aW9ucwphbmQgaXQncyBmYXN0IGVub3VnaCB0byBydW4gaW4gdGVz
dF9wcm9ncyBvbiBldmVyeSBjb21taXQgaW4gYnBmIENJLgpTZWUgZ2V0X3N5bXMoKSBpbiBwcm9n
X3Rlc3RzL2twcm9iZV9tdWx0aV90ZXN0LmMKCkNhbiB0aGlzIG5ldyBtdWx0aSBmZW50cnkgZG8g
dGhhdD8KYW5kIGF0IHdoYXQgc3BlZWQ/ClRoZSBhbnN3ZXIgd2lsbCBkZWNpZGUgaG93IGFwcGxp
Y2FibGUgdGhpcyBhcGkgaXMgZ29pbmcgdG8gYmUuCkdlbmVyYXRpbmcgZGlmZmVyZW50IHRyYW1w
b2xpbmVzIGZvciBldmVyeSBhdHRhY2ggcG9pbnQKaXMgYW4gYXBwcm9hY2ggYXMgd2VsbC4gUGxz
IGJlbmNobWFyayBpdCB0b28uCgo+ID4KPiA+IExldCdzIHN0ZXAgYmFjay4KPiA+IFdoYXQgaXMg
dGhlIGV4YWN0IHVzZSBjYXNlIHlvdSdyZSB0cnlpbmcgdG8gc29sdmU/Cj4gPiBOb3QgYW4gYXJ0
aWZpY2lhbCBvbmUgYXMgc2VsZnRlc3QgaW4gcGF0Y2ggOSwgYnV0IHRoZSByZWFsIHVzZSBjYXNl
Pwo+Cj4gSSBoYXZlIGEgdG9vbCwgd2hpY2ggaXMgdXNlZCB0byBkaWFnbm9zZSBuZXR3b3JrIHBy
b2JsZW1zLAo+IGFuZCBpdHMgbmFtZSBpcyAibmV0dHJhY2UiLiBJdCB3aWxsIHRyYWNlIG1hbnkg
a2VybmVsIGZ1bmN0aW9ucywgd2hvc2UKPiBmdW5jdGlvbiBhcmdzIGNvbnRhaW4gInNrYiIsIGxp
a2UgdGhpczoKPgo+IC4vbmV0dHJhY2UgLXAgaWNtcAo+IGJlZ2luIHRyYWNlLi4uCj4gKioqKioq
KioqKioqKioqKiogZmZmZjg4OWJlOGZiZDUwMCxmZmZmODg5YmU4ZmJjZDAwICoqKioqKioqKioq
KioqKgo+IFsxMjcyMzQ5LjYxNDU2NF0gW2Rldl9ncm9fcmVjZWl2ZSAgICAgXSBJQ01QOiAxNjku
MjU0LjEyOC4xNSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwCj4gWzEy
NzIzNDkuNjE0NTc5XSBbX19uZXRpZl9yZWNlaXZlX3NrYl9jb3JlXSBJQ01QOiAxNjkuMjU0LjEy
OC4xNSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwCj4gWzEyNzIzNDku
NjE0NTg1XSBbaXBfcmN2ICAgICAgICAgICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4g
MTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiBbMTI3MjM0OS42MTQ1OTJdIFtp
cF9yY3ZfY29yZSAgICAgICAgIF0gSUNNUDogMTY5LjI1NC4xMjguMTUgLT4KPiAxNzIuMjcuMC42
IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMAo+IFsxMjcyMzQ5LjYxNDU5OV0gW3NrYl9jbG9uZSAg
ICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1
ZXN0LCBzZXE6IDQ4MjIwCj4gWzEyNzIzNDkuNjE0NjE2XSBbbmZfaG9va19zbG93ICAgICAgICBd
IElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTog
NDgyMjAKPiBbMTI3MjM0OS42MTQ2MjldIFtuZnRfZG9fY2hhaW4gICAgICAgIF0gSUNNUDogMTY5
LjI1NC4xMjguMTUgLT4KPiAxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMAo+IFsx
MjcyMzQ5LjYxNDYzNV0gW2lwX3Jjdl9maW5pc2ggICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4x
NSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwCj4gWzEyNzIzNDkuNjE0
NjQzXSBbaXBfcm91dGVfaW5wdXRfc2xvdyBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4gMTcy
LjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiBbMTI3MjM0OS42MTQ2NDddIFtmaWJf
dmFsaWRhdGVfc291cmNlIF0gSUNNUDogMTY5LjI1NC4xMjguMTUgLT4KPiAxNzIuMjcuMC42IHBp
bmcgcmVxdWVzdCwgc2VxOiA0ODIyMAo+IFsxMjcyMzQ5LjYxNDY1Ml0gW2lwX2xvY2FsX2RlbGl2
ZXIgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0
LCBzZXE6IDQ4MjIwCj4gWzEyNzIzNDkuNjE0NjU4XSBbbmZfaG9va19zbG93ICAgICAgICBdIElD
TVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgy
MjAKPiBbMTI3MjM0OS42MTQ2NjNdIFtpcF9sb2NhbF9kZWxpdmVyX2ZpbmlzaF0gSUNNUDogMTY5
LjI1NC4xMjguMTUgLT4KPiAxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMAo+IFsx
MjcyMzQ5LjYxNDY2Nl0gW2ljbXBfcmN2ICAgICAgICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4x
NSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0LCBzZXE6IDQ4MjIwCj4gWzEyNzIzNDkuNjE0
NjcxXSBbaWNtcF9lY2hvICAgICAgICAgICBdIElDTVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4gMTcy
LjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgyMjAKPiBbMTI3MjM0OS42MTQ2NzVdIFtpY21w
X3JlcGx5ICAgICAgICAgIF0gSUNNUDogMTY5LjI1NC4xMjguMTUgLT4KPiAxNzIuMjcuMC42IHBp
bmcgcmVxdWVzdCwgc2VxOiA0ODIyMAo+IFsxMjcyMzQ5LjYxNDcxNV0gW2NvbnN1bWVfc2tiICAg
ICAgICAgXSBJQ01QOiAxNjkuMjU0LjEyOC4xNSAtPgo+IDE3Mi4yNy4wLjYgcGluZyByZXF1ZXN0
LCBzZXE6IDQ4MjIwCj4gWzEyNzIzNDkuNjE0NzIyXSBbcGFja2V0X3JjdiAgICAgICAgICBdIElD
TVA6IDE2OS4yNTQuMTI4LjE1IC0+Cj4gMTcyLjI3LjAuNiBwaW5nIHJlcXVlc3QsIHNlcTogNDgy
MjAKPiBbMTI3MjM0OS42MTQ3MjVdIFtjb25zdW1lX3NrYiAgICAgICAgIF0gSUNNUDogMTY5LjI1
NC4xMjguMTUgLT4KPiAxNzIuMjcuMC42IHBpbmcgcmVxdWVzdCwgc2VxOiA0ODIyMAo+Cj4gRm9y
IG5vdywgSSBoYXZlIHRvIGNyZWF0ZSBhIGJwZiBwcm9ncmFtIGZvciBldmVyeSBrZXJuZWwKPiBm
dW5jdGlvbiB0aGF0IEkgd2FudCB0byB0cmFjZSwgd2hpY2ggaXMgdXAgdG8gMjAwLgo+Cj4gV2l0
aCB0aGlzIG11bHRpLWxpbmssIEkgb25seSBuZWVkIHRvIGNyZWF0ZSA1IGJwZiBwcm9ncmFtLAo+
IGxpa2UgdGhpczoKPgo+IGludCBCUEZfUFJPRyh0cmFjZV9za2JfMSwgc3RydWN0ICpza2IpOwo+
IGludCBCUEZfUFJPRyh0cmFjZV9za2JfMiwgdTY0IGFyZzAsIHN0cnVjdCAqc2tiKTsKPiBpbnQg
QlBGX1BST0codHJhY2Vfc2tiXzMsIHU2NCBhcmcwLCB1NjQgYXJnMSwgc3RydWN0ICpza2IpOwo+
IGludCBCUEZfUFJPRyh0cmFjZV9za2JfNCwgdTY0IGFyZzAsIHU2NCBhcmcxLCB1NjQgYXJnMiwg
c3RydWN0ICpza2IpOwo+IGludCBCUEZfUFJPRyh0cmFjZV9za2JfNSwgdTY0IGFyZzAsIHU2NCBh
cmcxLCB1NjQgYXJnMiwgdTY0IGFyZzMsIHN0cnVjdCAqc2tiKTsKPgo+IFRoZW4sIEkgY2FuIGF0
dGFjaCB0cmFjZV9za2JfMSB0byBhbGwgdGhlIGtlcm5lbCBmdW5jdGlvbnMgdGhhdAo+IEkgd2Fu
dCB0byB0cmFjZSBhbmQgd2hvc2UgZmlyc3QgYXJnIGlzIHNrYjsgYXR0YWNoIHRyYWNlX3NrYl8y
IHRvIGtlcm5lbAo+IGZ1bmN0aW9ucyB3aG9zZSAybmQgYXJnIGlzIHNrYiwgZXRjLgo+Cj4gT3Is
IEkgY2FuIGNyZWF0ZSBvbmx5IG9uZSBicGYgcHJvZ3JhbSBhbmQgc3RvcmUgdGhlIGluZGV4Cj4g
b2Ygc2tiIHRvIHRoZSBhdHRhY2htZW50IGNvb2tpZSwgYW5kIGF0dGFjaCB0aGlzIHByb2dyYW0g
dG8gYWxsCj4gdGhlIGtlcm5lbCBmdW5jdGlvbnMgdGhhdCBJIHdhbnQgdG8gdHJhY2UuCj4KPiBU
aGlzIGlzIG15IHVzZSBjYXNlLiBXaXRoIHRoZSBtdWx0aS1saW5rLCBub3cgSSBvbmx5IGhhdmUK
PiAxIGJwZiBwcm9ncmFtLCAxIGJwZiBsaW5rLCAyMDAgdHJhbXBvbGluZXMsIGluc3RlYWQgb2Yg
MjAwCj4gYnBmIHByb2dyYW1zLCAyMDAgYnBmIGxpbmsgYW5kIDIwMCB0cmFtcG9saW5lcy4KCkkg
c2VlLiBUaGUgdXNlIGNhc2UgbWFrZXMgc2Vuc2UgdG8gbWUuCkFuZHJpaSdzIHJldHNub29wIGlz
IHVzZWQgdG8gZG8gc2ltaWxhciB0aGluZyBiZWZvcmUga3Byb2JlIG11bHRpIHdhcwppbnRyb2R1
Y2VkLgoKPiBUaGUgc2hhcmVkIHRyYW1wb2xpbmUgeW91IG1lbnRpb25lZCBzZWVtcyB0byBiZSBh
Cj4gd29uZGVyZnVsIGlkZWEsIHdoaWNoIGNhbiBtYWtlIHRoZSAyMDAgdHJhbXBvbGluZXMKPiB0
byBvbmUuIExldCBtZSBoYXZlIGEgbG9vaywgd2UgY3JlYXRlIGEgdHJhbXBvbGluZSBhbmQKPiBy
ZWNvcmQgdGhlIG1heCBhcmdzIGNvdW50IG9mIGFsbCB0aGUgdGFyZ2V0IGZ1bmN0aW9ucywgbGV0
J3MKPiBtYXJrIGl0IGFzIGFyZ19jb3VudC4KPgo+IER1cmluZyBnZW5lcmF0aW5nIHRoZSB0cmFt
cG9saW5lLCB3ZSBhc3N1bWUgdGhhdCB0aGUKPiBmdW5jdGlvbiBhcmdzIGNvdW50IGlzIGFyZ19j
b3VudC4gRHVyaW5nIGF0dGFjaGluZywgd2UKPiBjaGVjayB0aGUgY29uc2lzdGVuY3kgb2YgYWxs
IHRoZSB0YXJnZXQgZnVuY3Rpb25zLCBqdXN0IGxpa2UKPiB3aGF0IHdlIGRvIG5vdy4KCkZvciBv
bmUgdHJhbXBvbGluZSB0byBoYW5kbGUgYWxsIGF0dGFjaCBwb2ludHMgd2UgbWlnaHQKbmVlZCBz
b21lIGFyY2ggc3VwcG9ydCwgYnV0IHdlIGNhbiBzdGFydCBzaW1wbGUuCk1ha2UgYnRmX2Z1bmNf
bW9kZWwgd2l0aCBNQVhfQlBGX0ZVTkNfUkVHX0FSR1MKYnkgY2FsbGluZyBidGZfZGlzdGlsbF9m
dW5jX3Byb3RvKCkgd2l0aCBmdW5jPT1OVUxMLgpBbmQgdXNlIHRoYXQgdG8gYnVpbGQgYSB0cmFt
cG9saW5lLgoKVGhlIGNoYWxsZW5nZSBpcyBob3cgdG8gdXNlIG1pbmltYWwgbnVtYmVyIG9mIHRy
YW1wb2xpbmVzCndoZW4gYnBmX3Byb2dBIGlzIGF0dGFjaGVkIGZvciBmdW5jMSwgZnVuYzIsIGZ1
bmMzCmFuZCBicGZfcHJvZ0IgaXMgYXR0YWNoZWQgdG8gZnVuYzMsIGZ1bmM0LCBmdW5jNS4KV2Un
ZCBzdGlsbCBuZWVkIDMgdHJhbXBvbGluZXM6CmZvciBmdW5jWzEyXSB0byBjYWxsIGJwZl9wcm9n
QSwKZm9yIGZ1bmMzIHRvIGNhbGwgYnBmX3Byb2dBIGFuZCBicGZfcHJvZ0IsCmZvciBmdW5jWzQ1
XSB0byBjYWxsIGJwZl9wcm9nQi4KCkppcmkgd2FzIHRyeWluZyB0byBzb2x2ZSBpdCBpbiB0aGUg
cGFzdC4gSGlzIHNsaWRlcyBmcm9tIExQQzoKaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE2L2Nv
bnRyaWJ1dGlvbnMvMTM1MC9hdHRhY2htZW50cy8xMDMzLzE5ODMvcGx1bWJlcnMucGRmCgpQbHMg
c3R1ZHkgdGhlbSBhbmQgaGlzIHByaW9yIHBhdGNoc2V0cyB0byBhdm9pZCBzdGVwcGluZyBvbiB0
aGUgc2FtZSByYWtlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
