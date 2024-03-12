Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B71CC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1vDttd0Cf1q9i+9B0McpVvhtVlNBeWQ7zLUhE4D5KU=; b=BIpGZ/RLry49cb
	oFTeNweMOtLhcnRkrX2mxhMnBMs4+dxrBsCyYOwfXknwkOoMc6B2wS0OqkppVieQMgCCtvb1f+LkC
	Ww32+7AfAA516uU/X412WxYiWTQZVwo7lSXyEsOKYnOHLlEAMU50j+BsmQOn2izz8Zny2z6CISJOw
	wnDP4K23tToJGHbMA6uMvJM4ipzVJTsF4n6wRR9D1oKEfjDe1qCYKM44mts2Qh2ToTJxd0vsZuTU3
	dQSBAKDU0zxbz3b7u/H4dojAdzaT/WQRRAVXzn2eeu2DgnUuG8x88nRWCM4TK6T7CAhUhiletJDo7
	KIE4XBw2igTty2/lF/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjsCj-000000043RR-2yqs;
	Tue, 12 Mar 2024 02:49:25 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjsCf-000000043QI-3d2F
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:49:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-29bcc1c7cc4so1832314a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710211761; x=1710816561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp8FDAIHogCGtdOtPeOiQYNfgQ9IDPgMIvR+XSfvvHk=;
        b=kb2k2+sQf8yGt731wWt6H1OQC3vxddr1DEqmKiW4LFpXVvSOznOogo0dTB3fiu2qhF
         LaEu0PWFMq+uB9AUKm15Ka3PtnBEMU+EA9/4gFr4SKKvs7rfAgtuazJTIApLbvbcbUk3
         1nzzvUd9w+OA4xZmz5+SMo90CWSFLT3bk2jmTSvjnuDPy23NhbXUXz3TE1kgwkBlFl8v
         sV5QvHTGVhE3LqTc0YAAqfZzEZRF31l5tSBdATNYQUOle8qBkHoRWyZRGUepH5hi+rwI
         rtYP/TCLNVaEwVUGObtuClQbGLNw+HD0X5UKhdSeriEdLprEuKeTYka4O2sLA7downBi
         clQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710211761; x=1710816561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kp8FDAIHogCGtdOtPeOiQYNfgQ9IDPgMIvR+XSfvvHk=;
        b=FEdLOcP48QdQYtY9jurWcBZgRhncmd825Y29hoi8Rnjpk3R5zZFgwVdbA3VANt+OXR
         0NaXtcUgmdVh5Lwzv2SqguVJFYsNF/opooNjPSxHbwZlVIgZUlzgr3L8SrNmBo5P492y
         Uhyr8zSL3339QAZHj0jJempN8kPDxY4RMbACXW7Pl8oD3ATACb371lHMqM6aN1FuebV8
         V3gds+v+Jeuf819YiJiobgoaG7oQHfRMAHo0YgC2r7X5+fpIfA9hm/8NNciOvl04mGTR
         L3Un4CvWgSNmaWzKrkrkKj2zxVyXxLftaEF2rYJ0Ru2zXANJJp7LqHhE9OK7m/wLoAEU
         FPIg==
X-Forwarded-Encrypted: i=1; AJvYcCUqtYYKPo7k3GIUPS4H5EuB6Bnk/KvqRJbpcYZbtIRAtbF0Flw4BLrygkPV4NoAVPfbcDb0De6Lvm4xXDfGUxAnTiodJhdsWSYptZqvWlUE
X-Gm-Message-State: AOJu0YweRmdaEihJAY1hZ9pNSxXOsYnPKnFcRreGK8itlUiwgS6J+EhL
	jPlDNlW6A6+SmxR3NrIwesFoQdS7Uc/ZYrH6rh2GduJtXgum7br2Bores+lxKtOvaSp8rxutLjL
	YiLnxx02HhWH0b90ibVGSfgMNXFgIJm5XAwvVDeJ77ov8uNLdf0MEsw==
X-Google-Smtp-Source: AGHT+IETNLgyzh6uZkS12wgDyCLo8umv6nNmoijBBhhnpR8bMML+3pXMk3jZN+hl1DDgFHg+n8EoqP5QSNQlrqeKH1w=
X-Received: by 2002:a17:90a:5d8c:b0:29a:2860:28b9 with SMTP id
 t12-20020a17090a5d8c00b0029a286028b9mr6080591pji.48.1710211761009; Mon, 11
 Mar 2024 19:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com> <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
In-Reply-To: <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:49:10 +0800
Message-ID: <CALz3k9jy43zLe6DFjjA8K4mMFPNOxkagOEs2o8RY468ZWwfVSw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240311_194921_962219_A1053ABF 
X-CRM114-Status: GOOD (  38.42  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6NDLigK9BTSDmoqbpvpnokaMgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6
MDnigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPiA8YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzowMeKAr1BNIOaipum+
meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDk6NDbigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPiA+ID4g
PGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24g
TW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNOKAr0FNIE1lbmdsb25nIERvbmcKPiA+ID4gPiA8ZG9u
Z21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSW4g
dGhpcyBjb21taXQsIHdlIGFkZCB0aGUgJ2FjY2Vzc2VkX2FyZ3MnIGZpZWxkIHRvIHN0cnVjdCBi
cGZfcHJvZ19hdXgsCj4gPiA+ID4gPiB3aGljaCBpcyB1c2VkIHRvIHJlY29yZCB0aGUgYWNjZXNz
ZWQgaW5kZXggb2YgdGhlIGZ1bmN0aW9uIGFyZ3MgaW4KPiA+ID4gPiA+IGJ0Zl9jdHhfYWNjZXNz
KCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gTWVhbndoaWxlLCB3ZSBhZGQgdGhlIGZ1bmN0aW9uIGJ0
Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2goKSB0byBjb21wYXJlIHRoZQo+ID4gPiA+ID4gYWNjZXNz
ZWQgZnVuY3Rpb24gYXJncyBvZiB0d28gZnVuY3Rpb24gcHJvdG90eXBlLiBUaGlzIGZ1bmN0aW9u
IHdpbGwgYmUKPiA+ID4gPiA+IHVzZWQgaW4gdGhlIGZvbGxvd2luZyBjb21taXQuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWVuZ2xvbmcgRG9uZyA8ZG9uZ21lbmdsb25nLjhA
Ynl0ZWRhbmNlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGluY2x1ZGUvbGludXgvYnBm
LmggfCAgIDQgKysKPiA+ID4gPiA+ICBrZXJuZWwvYnBmL2J0Zi5jICAgIHwgMTA4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiA+ID4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9icGYuaCBiL2luY2x1ZGUvbGludXgvYnBm
LmgKPiA+ID4gPiA+IGluZGV4IDk1ZTA3NjczY2RjMS4uMGY2NzdmZGNmY2M3IDEwMDY0NAo+ID4g
PiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9icGYuaAo+ID4gPiA+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9icGYuaAo+ID4gPiA+ID4gQEAgLTE0NjEsNiArMTQ2MSw3IEBAIHN0cnVjdCBicGZfcHJv
Z19hdXggewo+ID4gPiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmF0dGFjaF9m
dW5jX3Byb3RvOwo+ID4gPiA+ID4gICAgICAgICAvKiBmdW5jdGlvbiBuYW1lIGZvciB2YWxpZCBh
dHRhY2hfYnRmX2lkICovCj4gPiA+ID4gPiAgICAgICAgIGNvbnN0IGNoYXIgKmF0dGFjaF9mdW5j
X25hbWU7Cj4gPiA+ID4gPiArICAgICAgIHU2NCBhY2Nlc3NlZF9hcmdzOwo+ID4gPiA+ID4gICAg
ICAgICBzdHJ1Y3QgYnBmX3Byb2cgKipmdW5jOwo+ID4gPiA+ID4gICAgICAgICB2b2lkICpqaXRf
ZGF0YTsgLyogSklUIHNwZWNpZmljIGRhdGEuIGFyY2ggZGVwZW5kZW50ICovCj4gPiA+ID4gPiAg
ICAgICAgIHN0cnVjdCBicGZfaml0X3Bva2VfZGVzY3JpcHRvciAqcG9rZV90YWI7Cj4gPiA+ID4g
PiBAQCAtMjU2NSw2ICsyNTY2LDkgQEAgc3RydWN0IGJwZl9yZWdfc3RhdGU7Cj4gPiA+ID4gPiAg
aW50IGJ0Zl9wcmVwYXJlX2Z1bmNfYXJncyhzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBp
bnQgc3VicHJvZyk7Cj4gPiA+ID4gPiAgaW50IGJ0Zl9jaGVja190eXBlX21hdGNoKHN0cnVjdCBi
cGZfdmVyaWZpZXJfbG9nICpsb2csIGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJvZywKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYnRmICpidGYsIGNvbnN0IHN0cnVj
dCBidGZfdHlwZSAqdCk7Cj4gPiA+ID4gPiAraW50IGJ0Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2go
c3RydWN0IGJ0ZiAqYnRmMSwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0MSwKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZjIsIGNvbnN0IHN0cnVj
dCBidGZfdHlwZSAqdDIsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
NjQgZnVuY19hcmdzKTsKPiA+ID4gPiA+ICBjb25zdCBjaGFyICpidGZfZmluZF9kZWNsX3RhZ192
YWx1ZShjb25zdCBzdHJ1Y3QgYnRmICpidGYsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqcHQsCj4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgY29tcF9pZHgs
IGNvbnN0IGNoYXIgKnRhZ19rZXkpOwo+ID4gPiA+ID4gIGludCBidGZfZmluZF9uZXh0X2RlY2xf
dGFnKGNvbnN0IHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICpwdCwKPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL2J0Zi5jIGIva2VybmVsL2JwZi9idGYuYwo+
ID4gPiA+ID4gaW5kZXggMTcwZDAxN2U4ZTRhLi5jMmEwMjk5ZDQzNTggMTAwNjQ0Cj4gPiA+ID4g
PiAtLS0gYS9rZXJuZWwvYnBmL2J0Zi5jCj4gPiA+ID4gPiArKysgYi9rZXJuZWwvYnBmL2J0Zi5j
Cj4gPiA+ID4gPiBAQCAtNjEyNSwxOSArNjEyNSwyNCBAQCBzdGF0aWMgYm9vbCBpc19pbnRfcHRy
KHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0KQo+ID4gPiA+ID4gIH0K
PiA+ID4gPiA+Cj4gPiA+ID4gPiAgc3RhdGljIHUzMiBnZXRfY3R4X2FyZ19pZHgoc3RydWN0IGJ0
ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmZ1bmNfcHJvdG8sCj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgb2ZmKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IG9mZiwgaW50ICphbGlnbmVkX2lkeCkKPiA+ID4gPiA+ICB7Cj4gPiA+
ID4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBidGZfcGFyYW0gKmFyZ3M7Cj4gPiA+ID4gPiAgICAg
ICAgIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqdDsKPiA+ID4gPiA+ICAgICAgICAgdTMyIG9mZnNl
dCA9IDAsIG5yX2FyZ3M7Cj4gPiA+ID4gPiAgICAgICAgIGludCBpOwo+ID4gPiA+ID4KPiA+ID4g
PiA+ICsgICAgICAgaWYgKGFsaWduZWRfaWR4KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICph
bGlnbmVkX2lkeCA9IC1FTk9FTlQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgICAgICAgIGlmICgh
ZnVuY19wcm90bykKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gb2ZmIC8gODsKPiA+
ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIG5yX2FyZ3MgPSBidGZfdHlwZV92bGVuKGZ1bmNfcHJv
dG8pOwo+ID4gPiA+ID4gICAgICAgICBhcmdzID0gKGNvbnN0IHN0cnVjdCBidGZfcGFyYW0gKiko
ZnVuY19wcm90byArIDEpOwo+ID4gPiA+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfYXJn
czsgaSsrKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKGFsaWduZWRfaWR4ICYmIG9m
ZnNldCA9PSBvZmYpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAqYWxpZ25lZF9p
ZHggPSBpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHQgPSBidGZfdHlwZV9za2lwX21vZGlm
aWVycyhidGYsIGFyZ3NbaV0udHlwZSwgTlVMTCk7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
b2Zmc2V0ICs9IGJ0Zl90eXBlX2lzX3B0cih0KSA/IDggOiByb3VuZHVwKHQtPnNpemUsIDgpOwo+
ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChvZmYgPCBvZmZzZXQpCj4gPiA+ID4gPiBAQCAt
NjIwNyw3ICs2MjEyLDcgQEAgYm9vbCBidGZfY3R4X2FjY2VzcyhpbnQgb2ZmLCBpbnQgc2l6ZSwg
ZW51bSBicGZfYWNjZXNzX3R5cGUgdHlwZSwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHRuYW1lLCBvZmYpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
PiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gLSAgICAgICBhcmcgPSBnZXRfY3R4X2FyZ19p
ZHgoYnRmLCB0LCBvZmYpOwo+ID4gPiA+ID4gKyAgICAgICBhcmcgPSBnZXRfY3R4X2FyZ19pZHgo
YnRmLCB0LCBvZmYsIE5VTEwpOwo+ID4gPiA+ID4gICAgICAgICBhcmdzID0gKGNvbnN0IHN0cnVj
dCBidGZfcGFyYW0gKikodCArIDEpOwo+ID4gPiA+ID4gICAgICAgICAvKiBpZiAodCA9PSBOVUxM
KSBGYWxsIGJhY2sgdG8gZGVmYXVsdCBCUEYgcHJvZyB3aXRoCj4gPiA+ID4gPiAgICAgICAgICAq
IE1BWF9CUEZfRlVOQ19SRUdfQVJHUyB1NjQgYXJndW1lbnRzLgo+ID4gPiA+ID4gQEAgLTYyMTcs
NiArNjIyMiw5IEBAIGJvb2wgYnRmX2N0eF9hY2Nlc3MoaW50IG9mZiwgaW50IHNpemUsIGVudW0g
YnBmX2FjY2Vzc190eXBlIHR5cGUsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgLyogc2tpcCBm
aXJzdCAndm9pZCAqX19kYXRhJyBhcmd1bWVudCBpbiBidGZfdHJhY2VfIyNuYW1lIHR5cGVkZWYg
Ki8KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBhcmdzKys7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgbnJfYXJncy0tOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHByb2ctPmF1eC0+YWNj
ZXNzZWRfYXJncyB8PSAoMSA8PCAoYXJnICsgMSkpOwo+ID4gPiA+ID4gKyAgICAgICB9IGVsc2Ug
ewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHByb2ctPmF1eC0+YWNjZXNzZWRfYXJncyB8PSAo
MSA8PCBhcmcpOwo+ID4gPiA+Cj4gPiA+ID4gV2hhdCBkbyB5b3UgbmVlZCB0aGlzIGFsaWduZWRf
aWR4IGZvciA/Cj4gPiA+ID4gSSdkIGV4cGVjdCB0aGF0IGFib3ZlICJhY2Nlc3NlZF9hcmdzIHw9
ICgxIDw8IGFyZyk7IiBpcyBlbm91Z2guCj4gPiA+ID4KPiA+ID4KPiA+ID4gV2hpY2ggYWxpZ25l
ZF9pZHg/IE5vIGFsaWduZWRfaWR4IGluIHRoZSBidGZfY3R4X2FjY2VzcygpLCBhbmQKPiA+ID4g
YWxpZ25lZF9pZHggaXMgb25seSB1c2VkIGluIHRoZSBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNo
KCkuCj4gPiA+Cj4gPiA+IEluIHRoZSBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNoKCksIEkgbmVl
ZCB0byBjb21wYXJlIHRoZQo+ID4gPiB0MS0+YXJnc1tpXSBhbmQgdDItPmFyZ3Nbal0sIHdoaWNo
IGhhdmUgdGhlIHNhbWUgb2Zmc2V0LiBBbmQKPiA+ID4gdGhlIGFsaWduZWRfaWR4IGlzIHRvIGZp
bmQgdGhlICJqIiBhY2NvcmRpbmcgdG8gdGhlIG9mZnNldCBvZgo+ID4gPiB0MS0+YXJnc1tpXS4K
PiA+Cj4gPiBBbmQgdGhhdCdzIG15IHF1ZXN0aW9uLgo+ID4gV2h5IHlvdSBkb24ndCBkbyB0aGUg
bWF4IG9mIGFjY2Vzc2VkX2FyZ3MgYWNyb3NzIGFsbCBhdHRhY2gKPiA+IHBvaW50cyBhbmQgZG8g
YnRmX2NoZWNrX2Z1bmNfdHlwZV9tYXRjaCgpIHRvIHRoYXQgYXJnbm8KPiA+IGluc3RlYWQgb2Yg
bmFyZ3MxLgo+ID4gVGhpcyAnb2Zmc2V0ICs9IGJ0Zl90eXBlX2lzX3B0cih0MSkgPyA4IDogcm91
bmR1cC4uLgo+ID4gaXMgb2RkLgo+Cj4gSGksIEknbSB0cnlpbmcgdG8gbWFrZSB0aGUgYnBmIGZs
ZXhpYmxlIGVub3VnaC4gTGV0J3MgdGFrZSBhbiBleGFtcGxlLAo+IG5vdyB3ZSBoYXZlIHRoZSBi
cGYgcHJvZ3JhbToKPgo+IGludCB0ZXN0MV9yZXN1bHQgPSAwOwo+IGludCBCUEZfUFJPRyh0ZXN0
MSwgaW50IGEsIGxvbmcgYiwgY2hhciBjKQo+IHsKPiAgICAgdGVzdDFfcmVzdWx0ID0gYSArIGM7
Cj4gICAgIHJldHVybiAwOwo+IH0KPgo+IEluIHRoaXMgcHJvZ3JhbSwgb25seSB0aGUgMXN0IGFu
ZCAzcmQgYXJnIGlzIGFjY2Vzc2VkLiBTbyBhbGwga2VybmVsCj4gZnVuY3Rpb25zIHdob3NlIDFz
dCBhcmcgaXMgaW50IGFuZCAzcmQgYXJnIGlzIGNoYXIgY2FuIGJlIGF0dGFjaGVkCj4gYnkgdGhp
cyBicGYgcHJvZ3JhbSwgZXZlbiBpZiB0aGVpciAybmQgYXJnIGlzIGRpZmZlcmVudC4KPgo+IEFu
ZCBsZXQncyB0YWtlIGFub3RoZXIgZXhhbXBsZSBmb3Igc3RydWN0LiBUaGlzIGlzIG91ciBicGYg
cHJvZ3JhbToKPgo+IGludCB0ZXN0MV9yZXN1bHQgPSAwOwo+IGludCBCUEZfUFJPRyh0ZXN0MSwg
bG9uZyBhLCBsb25nIGIsIGNoYXIgYykKPiB7Cj4gICAgIHRlc3QxX3Jlc3VsdCA9IGM7Cj4gICAg
IHJldHVybiAwOwo+IH0KPgo+IE9ubHkgdGhlIDNyZCBhcmcgaXMgYWNjZXNzZWQuIEFuZCB3ZSBo
YXZlIGZvbGxvd2luZyBrZXJuZWwgZnVuY3Rpb246Cj4KPiBpbnQga2VybmVsX2Z1bmN0aW9uMShs
b25nIGEsIGxvbmcgYiwgY2hhciBjKQo+IHsKPiB4eHgKPiB9Cj4KPiBzdHJ1Y3QgdGVzdDEgewo+
ICAgICBsb25nIGE7Cj4gICAgIGxvbmcgYjsKPiB9Owo+IGludCBrZXJuZWxfZnVuY3Rpb24yKHN0
cnVjdCB0ZXN0MSBhLCBjaGFyIGIpCj4gewo+IHh4eAo+IH0KPgo+IFRoZSBrZXJuZWxfZnVuY3Rp
b24xIGFuZCBrZXJuZWxfZnVuY3Rpb24yIHNob3VsZCBiZSBjb21wYXRpYmxlLAo+IGFzIHRoZSBi
cGYgcHJvZ3JhbSBvbmx5IGFjY2Vzc2VkIHRoZSBjdHhbMl0sIHdob3NlIG9mZnNldCBpcyAxNi4K
PiBBbmQgdGhlIGFyZyBpbiBrZXJuZWxfZnVuY3Rpb24xKCkgd2l0aCBvZmZzZXQgMTYgaXMgImNo
YXIgYyIsIHRoZQo+IGFyZyBpbiBrZXJuZWxfZnVuY3Rpb24yKCkgd2l0aCBvZmZzZXQgMTYgaXMg
ImNoYXIgYiIsIHdoaWNoIGlzCj4gY29tcGF0aWJsZS4KPgo+IFRoYXQncyB3aHkgd2UgbmVlZCB0
byBjaGVjayB0aGUgY29uc2lzdGVuY3kgb2YgYWNjZXNzZWQgYXJncwo+IGJ5IG9mZnNldCBpbnN0
ZWFkIG9mIGZ1bmN0aW9uIGFyZyBpbmRleC4KPgoKQW5kIHRoYXQncyB3aHkgSSBkaWRuJ3Qgc2hh
cmUgdGhlIGNvZGUgd2l0aCBidGZfY2hlY2tfZnVuY190eXBlX21hdGNoKCkuCkluIGJ0Zl9jaGVj
a19mdW5jX3BhcnRfbWF0Y2goKSwgSSdtIHRyeWluZyB0byBjaGVjayB0aGUgInJlYWwiIGFjY2Vz
c2VkCmFyZ3Mgb2YgdDEgYW5kIHQyLCBub3QgYnkgdGhlIGZ1bmN0aW9uIGluZGV4LCB3aGljaCBo
YXMgcXVpdGUgYSBkaWZmZXJlbmNlCndpdGggYnRmX2NoZWNrX2Z1bmNfdHlwZV9tYXRjaCgpLgoK
PiBJJ20gbm90IHN1cmUgaWYgSSBleHByZXNzIG15IGlkZWEgY2xlYXJseSwgaXMgdGhpcyB3aGF0
IHlvdSBhcmUKPiBhc2tpbmc/Cj4KPiBUaGFua3MhCj4gTWVuZ2xvbmcgRG9uZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
