Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83690C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IH5KDswlneHZn9EnadWIOd/sTJOiBkyfrQxJIXSvM4w=; b=4ydWDt3tOLuJej
	WJai8IUuC9Sqo7H+RG0EDZk6pjZe+/xs1sBurZMcxkV5wK2+nzjTusIWu3gCl9rDGABOgLVq2t20X
	7XzaLqjz8gc5e+GaSnJYJucH+peG8I9uOSxOSiiXlaNtptPs9jf29RVMT8EyHhpp4beUR8CUCowko
	MHI8rp26L6MzESO+SMr/o9ageocI8itiHMzVAEOKrZhDc0xlGm+VIkswkO4NTgJo0Q8tRpfDJRRD5
	ga5krZNant05SKfgjJsajHjou7RKiuY4dGlEpR/sEphaEgImxebv3K93Obefun+Y/pkHptQGswt1j
	lP4fjeUfP1B6AHM/y+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjraI-00000003wUY-04aw;
	Tue, 12 Mar 2024 02:09:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjraE-00000003wSM-1247;
	Tue, 12 Mar 2024 02:09:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33e76d653b5so3628975f8f.3;
        Mon, 11 Mar 2024 19:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710209376; x=1710814176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7OazjLh3TJZJaBxgYhNmL2BYNu/aO7IPEXCMBRgvJk=;
        b=e2RdPkYrqEG5vtkw7R30L5Z/5s1LyH5RjR0mmiZZKoEUMBnGEfBeS4p4ehWEC/XRO4
         it6xA4zsVmh/QFtbPCd32ngx0/rwfEU1ePDv2aa1w500dvBxilKJiQ6J+/I+U75HoEKT
         fEJeNUYmj8+BhzOnz1784rpw1GtMpLCCAE1VB8nxvb0Lvcjo1wX+6M4ZCz6K8cN23zMj
         sDQ3pEtRrGskfp5fKKYrq8lYxHgR02DajaMLo8VQGIAZQZKC6Kx5d6BrBsZyDEuM52Qe
         CIAs7MWeKD/7c8KhKaErSxJ216cgqBuzxU742lvZ6tHkBHuOb+GYsZScJuh/MNcMQgL3
         98NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710209376; x=1710814176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7OazjLh3TJZJaBxgYhNmL2BYNu/aO7IPEXCMBRgvJk=;
        b=myzNuMgaD6Fw1w4ke/2cUbOe+1vBRfT5e0X4luYfN0gZINzSwjgFu94ZIoKefWxIdL
         db+uyzOl/z80HXPREop963Z/pH+SJC1OU6uvcXH3OODhPEMWMVDP1oZRaOafZ5217T4A
         zuP9I2z4Y1h/2tdfZL88dO7DRNgm0DRBiGaiGISnuoYIda3fcN7Ls8QL3DOPe8iUrNKU
         h+2KZwrOJd9gl1GQ6cQCNwVWf+Ie7pC8zTxWOBouE7zHTMdoGr9IxZBRG10DKiY99xZ8
         9T6Pwqsw9J+rXisTg7cjjkUT1A8xos6p+B/zMNWg3v+zImG66/dPNHOWJlZIa6bAp29F
         Ww+A==
X-Forwarded-Encrypted: i=1; AJvYcCXjkFmYtzRkIFR/EM8hicvXaTNKJ8mftNJGy+8IqrqQTf/D0k0QWk/tz00hxIPHhRuMGeIdrLujRM8zfJthv9M5yYJLQgPMgUSN6L0T2bHwWngrsouKpOXDfeYag7upU1KzozPJCoNTCcU9ay2STbY2VbY4mwE=
X-Gm-Message-State: AOJu0YxafqFMmdxcPJoepSX7PGJLes8Ib5eV/73D4u/xgZgamNJZ8+Cn
	hnMDg9TjXzFqV8t8Gi/4A+eE+olhYbNZELd9KGVY3knsyMqvVk8sTTDAQq2D1KhfxD8iU5OFtvU
	+C2/YLzITX618OFoK67VOz98UQEM=
X-Google-Smtp-Source: AGHT+IEicWbuFZqdg/xqQNzdGQlw9skotEo3jcZk3zVibmZ6sCWBpxxOKUqsLebol1eFrvMKXlFvA4Sc4ycQD3B2uCo=
X-Received: by 2002:a5d:424d:0:b0:33e:7adc:516c with SMTP id
 s13-20020a5d424d000000b0033e7adc516cmr5003733wrr.57.1710209376134; Mon, 11
 Mar 2024 19:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
In-Reply-To: <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 19:09:25 -0700
Message-ID: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240311_190938_320061_19E43A47 
X-CRM114-Status: GOOD (  29.85  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzowMeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCA5OjQ2
4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDI6MzTigK9BTSBNZW5nbG9u
ZyBEb25nCj4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEluIHRoaXMgY29tbWl0LCB3ZSBhZGQgdGhlICdhY2Nlc3NlZF9hcmdzJyBmaWVsZCB0byBz
dHJ1Y3QgYnBmX3Byb2dfYXV4LAo+ID4gPiB3aGljaCBpcyB1c2VkIHRvIHJlY29yZCB0aGUgYWNj
ZXNzZWQgaW5kZXggb2YgdGhlIGZ1bmN0aW9uIGFyZ3MgaW4KPiA+ID4gYnRmX2N0eF9hY2Nlc3Mo
KS4KPiA+ID4KPiA+ID4gTWVhbndoaWxlLCB3ZSBhZGQgdGhlIGZ1bmN0aW9uIGJ0Zl9jaGVja19m
dW5jX3BhcnRfbWF0Y2goKSB0byBjb21wYXJlIHRoZQo+ID4gPiBhY2Nlc3NlZCBmdW5jdGlvbiBh
cmdzIG9mIHR3byBmdW5jdGlvbiBwcm90b3R5cGUuIFRoaXMgZnVuY3Rpb24gd2lsbCBiZQo+ID4g
PiB1c2VkIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIGluY2x1ZGUvbGludXgvYnBmLmggfCAgIDQgKysKPiA+ID4gIGtlcm5lbC9icGYvYnRm
LmMgICAgfCAxMDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9s
aW51eC9icGYuaAo+ID4gPiBpbmRleCA5NWUwNzY3M2NkYzEuLjBmNjc3ZmRjZmNjNyAxMDA2NDQK
PiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9icGYuaAo+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4
L2JwZi5oCj4gPiA+IEBAIC0xNDYxLDYgKzE0NjEsNyBAQCBzdHJ1Y3QgYnBmX3Byb2dfYXV4IHsK
PiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmF0dGFjaF9mdW5jX3Byb3RvOwo+
ID4gPiAgICAgICAgIC8qIGZ1bmN0aW9uIG5hbWUgZm9yIHZhbGlkIGF0dGFjaF9idGZfaWQgKi8K
PiA+ID4gICAgICAgICBjb25zdCBjaGFyICphdHRhY2hfZnVuY19uYW1lOwo+ID4gPiArICAgICAg
IHU2NCBhY2Nlc3NlZF9hcmdzOwo+ID4gPiAgICAgICAgIHN0cnVjdCBicGZfcHJvZyAqKmZ1bmM7
Cj4gPiA+ICAgICAgICAgdm9pZCAqaml0X2RhdGE7IC8qIEpJVCBzcGVjaWZpYyBkYXRhLiBhcmNo
IGRlcGVuZGVudCAqLwo+ID4gPiAgICAgICAgIHN0cnVjdCBicGZfaml0X3Bva2VfZGVzY3JpcHRv
ciAqcG9rZV90YWI7Cj4gPiA+IEBAIC0yNTY1LDYgKzI1NjYsOSBAQCBzdHJ1Y3QgYnBmX3JlZ19z
dGF0ZTsKPiA+ID4gIGludCBidGZfcHJlcGFyZV9mdW5jX2FyZ3Moc3RydWN0IGJwZl92ZXJpZmll
cl9lbnYgKmVudiwgaW50IHN1YnByb2cpOwo+ID4gPiAgaW50IGJ0Zl9jaGVja190eXBlX21hdGNo
KHN0cnVjdCBicGZfdmVyaWZpZXJfbG9nICpsb2csIGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJv
ZywKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qg
c3RydWN0IGJ0Zl90eXBlICp0KTsKPiA+ID4gK2ludCBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNo
KHN0cnVjdCBidGYgKmJ0ZjEsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqdDEsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZjIsIGNvbnN0IHN0cnVjdCBi
dGZfdHlwZSAqdDIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBmdW5j
X2FyZ3MpOwo+ID4gPiAgY29uc3QgY2hhciAqYnRmX2ZpbmRfZGVjbF90YWdfdmFsdWUoY29uc3Qg
c3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgY29tcF9pZHgsIGNvbnN0IGNoYXIgKnRh
Z19rZXkpOwo+ID4gPiAgaW50IGJ0Zl9maW5kX25leHRfZGVjbF90YWcoY29uc3Qgc3RydWN0IGJ0
ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+ID4gPiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL2JwZi9idGYuYyBiL2tlcm5lbC9icGYvYnRmLmMKPiA+ID4gaW5kZXggMTcwZDAxN2U4ZTRh
Li5jMmEwMjk5ZDQzNTggMTAwNjQ0Cj4gPiA+IC0tLSBhL2tlcm5lbC9icGYvYnRmLmMKPiA+ID4g
KysrIGIva2VybmVsL2JwZi9idGYuYwo+ID4gPiBAQCAtNjEyNSwxOSArNjEyNSwyNCBAQCBzdGF0
aWMgYm9vbCBpc19pbnRfcHRyKHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBl
ICp0KQo+ID4gPiAgfQo+ID4gPgo+ID4gPiAgc3RhdGljIHUzMiBnZXRfY3R4X2FyZ19pZHgoc3Ry
dWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmZ1bmNfcHJvdG8sCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBvZmYpCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBvZmYsIGludCAqYWxpZ25lZF9pZHgpCj4gPiA+ICB7Cj4gPiA+ICAgICAg
ICAgY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqYXJnczsKPiA+ID4gICAgICAgICBjb25zdCBzdHJ1
Y3QgYnRmX3R5cGUgKnQ7Cj4gPiA+ICAgICAgICAgdTMyIG9mZnNldCA9IDAsIG5yX2FyZ3M7Cj4g
PiA+ICAgICAgICAgaW50IGk7Cj4gPiA+Cj4gPiA+ICsgICAgICAgaWYgKGFsaWduZWRfaWR4KQo+
ID4gPiArICAgICAgICAgICAgICAgKmFsaWduZWRfaWR4ID0gLUVOT0VOVDsKPiA+ID4gKwo+ID4g
PiAgICAgICAgIGlmICghZnVuY19wcm90bykKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBv
ZmYgLyA4Owo+ID4gPgo+ID4gPiAgICAgICAgIG5yX2FyZ3MgPSBidGZfdHlwZV92bGVuKGZ1bmNf
cHJvdG8pOwo+ID4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqKShm
dW5jX3Byb3RvICsgMSk7Cj4gPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX2FyZ3M7IGkr
Kykgewo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGFsaWduZWRfaWR4ICYmIG9mZnNldCA9PSBv
ZmYpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICphbGlnbmVkX2lkeCA9IGk7Cj4gPiA+
ICAgICAgICAgICAgICAgICB0ID0gYnRmX3R5cGVfc2tpcF9tb2RpZmllcnMoYnRmLCBhcmdzW2ld
LnR5cGUsIE5VTEwpOwo+ID4gPiAgICAgICAgICAgICAgICAgb2Zmc2V0ICs9IGJ0Zl90eXBlX2lz
X3B0cih0KSA/IDggOiByb3VuZHVwKHQtPnNpemUsIDgpOwo+ID4gPiAgICAgICAgICAgICAgICAg
aWYgKG9mZiA8IG9mZnNldCkKPiA+ID4gQEAgLTYyMDcsNyArNjIxMiw3IEBAIGJvb2wgYnRmX2N0
eF9hY2Nlc3MoaW50IG9mZiwgaW50IHNpemUsIGVudW0gYnBmX2FjY2Vzc190eXBlIHR5cGUsCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHRuYW1lLCBvZmYpOwo+ID4gPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiAgICAgICAgIH0KPiA+ID4gLSAgICAgICBhcmcgPSBn
ZXRfY3R4X2FyZ19pZHgoYnRmLCB0LCBvZmYpOwo+ID4gPiArICAgICAgIGFyZyA9IGdldF9jdHhf
YXJnX2lkeChidGYsIHQsIG9mZiwgTlVMTCk7Cj4gPiA+ICAgICAgICAgYXJncyA9IChjb25zdCBz
dHJ1Y3QgYnRmX3BhcmFtICopKHQgKyAxKTsKPiA+ID4gICAgICAgICAvKiBpZiAodCA9PSBOVUxM
KSBGYWxsIGJhY2sgdG8gZGVmYXVsdCBCUEYgcHJvZyB3aXRoCj4gPiA+ICAgICAgICAgICogTUFY
X0JQRl9GVU5DX1JFR19BUkdTIHU2NCBhcmd1bWVudHMuCj4gPiA+IEBAIC02MjE3LDYgKzYyMjIs
OSBAQCBib29sIGJ0Zl9jdHhfYWNjZXNzKGludCBvZmYsIGludCBzaXplLCBlbnVtIGJwZl9hY2Nl
c3NfdHlwZSB0eXBlLAo+ID4gPiAgICAgICAgICAgICAgICAgLyogc2tpcCBmaXJzdCAndm9pZCAq
X19kYXRhJyBhcmd1bWVudCBpbiBidGZfdHJhY2VfIyNuYW1lIHR5cGVkZWYgKi8KPiA+ID4gICAg
ICAgICAgICAgICAgIGFyZ3MrKzsKPiA+ID4gICAgICAgICAgICAgICAgIG5yX2FyZ3MtLTsKPiA+
ID4gKyAgICAgICAgICAgICAgIHByb2ctPmF1eC0+YWNjZXNzZWRfYXJncyB8PSAoMSA8PCAoYXJn
ICsgMSkpOwo+ID4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBwcm9n
LT5hdXgtPmFjY2Vzc2VkX2FyZ3MgfD0gKDEgPDwgYXJnKTsKPiA+Cj4gPiBXaGF0IGRvIHlvdSBu
ZWVkIHRoaXMgYWxpZ25lZF9pZHggZm9yID8KPiA+IEknZCBleHBlY3QgdGhhdCBhYm92ZSAiYWNj
ZXNzZWRfYXJncyB8PSAoMSA8PCBhcmcpOyIgaXMgZW5vdWdoLgo+ID4KPgo+IFdoaWNoIGFsaWdu
ZWRfaWR4PyBObyBhbGlnbmVkX2lkeCBpbiB0aGUgYnRmX2N0eF9hY2Nlc3MoKSwgYW5kCj4gYWxp
Z25lZF9pZHggaXMgb25seSB1c2VkIGluIHRoZSBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNoKCku
Cj4KPiBJbiB0aGUgYnRmX2NoZWNrX2Z1bmNfcGFydF9tYXRjaCgpLCBJIG5lZWQgdG8gY29tcGFy
ZSB0aGUKPiB0MS0+YXJnc1tpXSBhbmQgdDItPmFyZ3Nbal0sIHdoaWNoIGhhdmUgdGhlIHNhbWUg
b2Zmc2V0LiBBbmQKPiB0aGUgYWxpZ25lZF9pZHggaXMgdG8gZmluZCB0aGUgImoiIGFjY29yZGlu
ZyB0byB0aGUgb2Zmc2V0IG9mCj4gdDEtPmFyZ3NbaV0uCgpBbmQgdGhhdCdzIG15IHF1ZXN0aW9u
LgpXaHkgeW91IGRvbid0IGRvIHRoZSBtYXggb2YgYWNjZXNzZWRfYXJncyBhY3Jvc3MgYWxsIGF0
dGFjaApwb2ludHMgYW5kIGRvIGJ0Zl9jaGVja19mdW5jX3R5cGVfbWF0Y2goKSB0byB0aGF0IGFy
Z25vCmluc3RlYWQgb2YgbmFyZ3MxLgpUaGlzICdvZmZzZXQgKz0gYnRmX3R5cGVfaXNfcHRyKHQx
KSA/IDggOiByb3VuZHVwLi4uCmlzIG9kZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
