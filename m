Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30A8C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFY78egnEaB69vYUp1e9B2HM40BSvLi55QpXTHab4Rg=; b=QZu0a6UMe3s+7M
	psqJXvWRR7YOwDvxHWsZrNgTJI2wdnbIbeqvo3bFQzFNK0cRRxYaKXT7t5oBJVa94e/cL1Nh7Q394
	ucuXiwxHw7d8jscc7NIeuZfA20SsQtQOQWN0YIMgEgd0R3rpOLLDPq5PwOtXGD3nCy9RGmLVIWjVQ
	Jaqy++uemVMJ2GjeYX7vGay+WbbHMkOnK7YGURMnhNr40i6Ng6v8q4cm7hRrXY+bYpYjppc+IJpnH
	dQ71ZQes0ZO31YpeGxIPLDwNSemKmIiJOyZfQ0VoGbfSsz9VVsoTHEIIiaiKiB4TDYZeqJGX4hBy5
	ZU5SIzKXN8J1KLhEBmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjs60-000000042E4-2Orm;
	Tue, 12 Mar 2024 02:42:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjs5x-000000042Cp-1Zds
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:42:27 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e676ea4e36so2796164b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710211343; x=1710816143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OINlgsu2YF3PvJN8OnOTR/8+uoasAh0pp34EJQtDWyM=;
        b=f4h1NJCjdSKjbUE/X0+clPrPjMaIRWD4N8Kz+uTbeUOKsGvW2lParQmEbdQMgX1ZPS
         DhmEcrIiCjn9X4561xSRdcnXt1V/2Z/e0lXqY6zyGLEiqWaH8CLZbeNOrmD0MAiYfs0Z
         4/SeN1yH8/NShOiiBmdwqmIDd+CYiGkdPayN4BwFnvuWWsK289qBduSXwn8+zJdMLsfH
         k6to+9f7sbvF90/iu3/sLSEEEvsXhqRiicwad/2gY4r8wYSeutvxPjVlYHIxWPVVf/OA
         a4vbT9Wz72hW1DCWodcy0lAMNQI/unX4ykfLJTJVwcdDioPcBDOfl6utUg43bdUpfnut
         sQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710211343; x=1710816143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OINlgsu2YF3PvJN8OnOTR/8+uoasAh0pp34EJQtDWyM=;
        b=OFq46+vqnzugb3nlZ9/Siqz+tlnMeJbs4tGd3nBGNlQtra/6qteSSlceY5B1n2hc9+
         96ObyBx0l4PXeLJTT2AzkiMFINAm8pobhnpz9N5hd9wYfPOrzk2CA/KMeol9ieh6ogzc
         ykb99AQFKfa3gRT2fkIoEmMD6jYccsO9UCUH4BO9OPzXr/iO45CLc7WQMAQ8AzWFKj1l
         TISl79VGegbgdBe27exEYCPL/gz0H0XPri6lgK4/oQPB2XnQ+Pu5YMFEfCFM4RWylyP+
         dJChNI14XFflCol7qR2R3l8NliVmIqHI9ER4PiL+Ggsa0SEJIWI4fQ1hFbwL6THQ1Mrs
         Paxg==
X-Forwarded-Encrypted: i=1; AJvYcCUWDkIhZ5bH+re2olw8Fvu/ki/R0muO2Wqz1+R90WdtO6ZcV9OwEkE0u4suxpTH0jWHikq0hqRjACXnb6zGGOXpPTw2kiO/Q2zvBBBFCFNG
X-Gm-Message-State: AOJu0YxEAEvGvVhENzK/AunfzAedWqu3L0enaWg8rbU8NSgqsEsR6H1k
	Iddgfo2HqgLcJAcRD2ChacxA7RRffDYe+HTxA0Z1qITTiqJdSMZkWZlQVlVXdy3VEFIRiKNPV5E
	UVsuhzdWrF7l8Cqyos3R76qlDKDSWLgvgD/9Srg==
X-Google-Smtp-Source: AGHT+IE6GiGxyRIp3/3XVD9fFBz8UVdgjg1PGxNjY7GVvBs/so+9qa/wgGoxFVME4bk660EppcQoDtMhnKII7BlTwZk=
X-Received: by 2002:a05:6a21:32a2:b0:1a1:2b49:9f04 with SMTP id
 yt34-20020a056a2132a200b001a12b499f04mr2426596pzb.46.1710211343317; Mon, 11
 Mar 2024 19:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com> <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
In-Reply-To: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:42:12 +0800
Message-ID: <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240311_194225_649353_1310285A 
X-CRM114-Status: GOOD (  35.96  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6MDnigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTEsIDIw
MjQgYXQgNzowMeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo0NuKAr0FNIEFsZXhlaSBT
dGFyb3ZvaXRvdgo+ID4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCAyOjM04oCvQU0gTWVuZ2xvbmcgRG9uZwo+
ID4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBJbiB0aGlzIGNvbW1pdCwgd2UgYWRkIHRoZSAnYWNjZXNzZWRfYXJncycgZmllbGQgdG8gc3Ry
dWN0IGJwZl9wcm9nX2F1eCwKPiA+ID4gPiB3aGljaCBpcyB1c2VkIHRvIHJlY29yZCB0aGUgYWNj
ZXNzZWQgaW5kZXggb2YgdGhlIGZ1bmN0aW9uIGFyZ3MgaW4KPiA+ID4gPiBidGZfY3R4X2FjY2Vz
cygpLgo+ID4gPiA+Cj4gPiA+ID4gTWVhbndoaWxlLCB3ZSBhZGQgdGhlIGZ1bmN0aW9uIGJ0Zl9j
aGVja19mdW5jX3BhcnRfbWF0Y2goKSB0byBjb21wYXJlIHRoZQo+ID4gPiA+IGFjY2Vzc2VkIGZ1
bmN0aW9uIGFyZ3Mgb2YgdHdvIGZ1bmN0aW9uIHByb3RvdHlwZS4gVGhpcyBmdW5jdGlvbiB3aWxs
IGJlCj4gPiA+ID4gdXNlZCBpbiB0aGUgZm9sbG93aW5nIGNvbW1pdC4KPiA+ID4gPgo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvYnBmLmggfCAgIDQgKysKPiA+
ID4gPiAga2VybmVsL2JwZi9idGYuYyAgICB8IDEwOCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExMCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYnBmLmggYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gPiA+ID4gaW5kZXggOTVlMDc2
NzNjZGMxLi4wZjY3N2ZkY2ZjYzcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9i
cGYuaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvYnBmLmgKPiA+ID4gPiBAQCAtMTQ2MSw2
ICsxNDYxLDcgQEAgc3RydWN0IGJwZl9wcm9nX2F1eCB7Cj4gPiA+ID4gICAgICAgICBjb25zdCBz
dHJ1Y3QgYnRmX3R5cGUgKmF0dGFjaF9mdW5jX3Byb3RvOwo+ID4gPiA+ICAgICAgICAgLyogZnVu
Y3Rpb24gbmFtZSBmb3IgdmFsaWQgYXR0YWNoX2J0Zl9pZCAqLwo+ID4gPiA+ICAgICAgICAgY29u
c3QgY2hhciAqYXR0YWNoX2Z1bmNfbmFtZTsKPiA+ID4gPiArICAgICAgIHU2NCBhY2Nlc3NlZF9h
cmdzOwo+ID4gPiA+ICAgICAgICAgc3RydWN0IGJwZl9wcm9nICoqZnVuYzsKPiA+ID4gPiAgICAg
ICAgIHZvaWQgKmppdF9kYXRhOyAvKiBKSVQgc3BlY2lmaWMgZGF0YS4gYXJjaCBkZXBlbmRlbnQg
Ki8KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBicGZfaml0X3Bva2VfZGVzY3JpcHRvciAqcG9rZV90
YWI7Cj4gPiA+ID4gQEAgLTI1NjUsNiArMjU2Niw5IEBAIHN0cnVjdCBicGZfcmVnX3N0YXRlOwo+
ID4gPiA+ICBpbnQgYnRmX3ByZXBhcmVfZnVuY19hcmdzKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52
ICplbnYsIGludCBzdWJwcm9nKTsKPiA+ID4gPiAgaW50IGJ0Zl9jaGVja190eXBlX21hdGNoKHN0
cnVjdCBicGZfdmVyaWZpZXJfbG9nICpsb2csIGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJvZywK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBz
dHJ1Y3QgYnRmX3R5cGUgKnQpOwo+ID4gPiA+ICtpbnQgYnRmX2NoZWNrX2Z1bmNfcGFydF9tYXRj
aChzdHJ1Y3QgYnRmICpidGYxLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnQxLAo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZjIsIGNvbnN0IHN0cnVj
dCBidGZfdHlwZSAqdDIsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0
IGZ1bmNfYXJncyk7Cj4gPiA+ID4gIGNvbnN0IGNoYXIgKmJ0Zl9maW5kX2RlY2xfdGFnX3ZhbHVl
KGNvbnN0IHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICpwdCwKPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgY29tcF9pZHgsIGNvbnN0
IGNoYXIgKnRhZ19rZXkpOwo+ID4gPiA+ICBpbnQgYnRmX2ZpbmRfbmV4dF9kZWNsX3RhZyhjb25z
dCBzdHJ1Y3QgYnRmICpidGYsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqcHQsCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2tlcm5lbC9icGYvYnRmLmMgYi9rZXJuZWwvYnBmL2J0Zi5jCj4gPiA+ID4gaW5k
ZXggMTcwZDAxN2U4ZTRhLi5jMmEwMjk5ZDQzNTggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEva2VybmVs
L2JwZi9idGYuYwo+ID4gPiA+ICsrKyBiL2tlcm5lbC9icGYvYnRmLmMKPiA+ID4gPiBAQCAtNjEy
NSwxOSArNjEyNSwyNCBAQCBzdGF0aWMgYm9vbCBpc19pbnRfcHRyKHN0cnVjdCBidGYgKmJ0Ziwg
Y29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0KQo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAgc3Rh
dGljIHUzMiBnZXRfY3R4X2FyZ19pZHgoc3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRm
X3R5cGUgKmZ1bmNfcHJvdG8sCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IG9mZikKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgb2ZmLCBpbnQgKmFs
aWduZWRfaWR4KQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgYnRmX3Bh
cmFtICphcmdzOwo+ID4gPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0Owo+ID4g
PiA+ICAgICAgICAgdTMyIG9mZnNldCA9IDAsIG5yX2FyZ3M7Cj4gPiA+ID4gICAgICAgICBpbnQg
aTsKPiA+ID4gPgo+ID4gPiA+ICsgICAgICAgaWYgKGFsaWduZWRfaWR4KQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAqYWxpZ25lZF9pZHggPSAtRU5PRU5UOwo+ID4gPiA+ICsKPiA+ID4gPiAgICAg
ICAgIGlmICghZnVuY19wcm90bykKPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIG9mZiAv
IDg7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIG5yX2FyZ3MgPSBidGZfdHlwZV92bGVuKGZ1bmNf
cHJvdG8pOwo+ID4gPiA+ICAgICAgICAgYXJncyA9IChjb25zdCBzdHJ1Y3QgYnRmX3BhcmFtICop
KGZ1bmNfcHJvdG8gKyAxKTsKPiA+ID4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9hcmdz
OyBpKyspIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKGFsaWduZWRfaWR4ICYmIG9mZnNl
dCA9PSBvZmYpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgKmFsaWduZWRfaWR4ID0g
aTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgdCA9IGJ0Zl90eXBlX3NraXBfbW9kaWZpZXJzKGJ0
ZiwgYXJnc1tpXS50eXBlLCBOVUxMKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgb2Zmc2V0ICs9
IGJ0Zl90eXBlX2lzX3B0cih0KSA/IDggOiByb3VuZHVwKHQtPnNpemUsIDgpOwo+ID4gPiA+ICAg
ICAgICAgICAgICAgICBpZiAob2ZmIDwgb2Zmc2V0KQo+ID4gPiA+IEBAIC02MjA3LDcgKzYyMTIs
NyBAQCBib29sIGJ0Zl9jdHhfYWNjZXNzKGludCBvZmYsIGludCBzaXplLCBlbnVtIGJwZl9hY2Nl
c3NfdHlwZSB0eXBlLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHRuYW1lLCBvZmYp
Owo+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gICAgICAgICB9
Cj4gPiA+ID4gLSAgICAgICBhcmcgPSBnZXRfY3R4X2FyZ19pZHgoYnRmLCB0LCBvZmYpOwo+ID4g
PiA+ICsgICAgICAgYXJnID0gZ2V0X2N0eF9hcmdfaWR4KGJ0ZiwgdCwgb2ZmLCBOVUxMKTsKPiA+
ID4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqKSh0ICsgMSk7Cj4g
PiA+ID4gICAgICAgICAvKiBpZiAodCA9PSBOVUxMKSBGYWxsIGJhY2sgdG8gZGVmYXVsdCBCUEYg
cHJvZyB3aXRoCj4gPiA+ID4gICAgICAgICAgKiBNQVhfQlBGX0ZVTkNfUkVHX0FSR1MgdTY0IGFy
Z3VtZW50cy4KPiA+ID4gPiBAQCAtNjIxNyw2ICs2MjIyLDkgQEAgYm9vbCBidGZfY3R4X2FjY2Vz
cyhpbnQgb2ZmLCBpbnQgc2l6ZSwgZW51bSBicGZfYWNjZXNzX3R5cGUgdHlwZSwKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgLyogc2tpcCBmaXJzdCAndm9pZCAqX19kYXRhJyBhcmd1bWVudCBpbiBi
dGZfdHJhY2VfIyNuYW1lIHR5cGVkZWYgKi8KPiA+ID4gPiAgICAgICAgICAgICAgICAgYXJncysr
Owo+ID4gPiA+ICAgICAgICAgICAgICAgICBucl9hcmdzLS07Cj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHByb2ctPmF1eC0+YWNjZXNzZWRfYXJncyB8PSAoMSA8PCAoYXJnICsgMSkpOwo+ID4gPiA+
ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgcHJvZy0+YXV4LT5hY2Nl
c3NlZF9hcmdzIHw9ICgxIDw8IGFyZyk7Cj4gPiA+Cj4gPiA+IFdoYXQgZG8geW91IG5lZWQgdGhp
cyBhbGlnbmVkX2lkeCBmb3IgPwo+ID4gPiBJJ2QgZXhwZWN0IHRoYXQgYWJvdmUgImFjY2Vzc2Vk
X2FyZ3MgfD0gKDEgPDwgYXJnKTsiIGlzIGVub3VnaC4KPiA+ID4KPiA+Cj4gPiBXaGljaCBhbGln
bmVkX2lkeD8gTm8gYWxpZ25lZF9pZHggaW4gdGhlIGJ0Zl9jdHhfYWNjZXNzKCksIGFuZAo+ID4g
YWxpZ25lZF9pZHggaXMgb25seSB1c2VkIGluIHRoZSBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNo
KCkuCj4gPgo+ID4gSW4gdGhlIGJ0Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2goKSwgSSBuZWVkIHRv
IGNvbXBhcmUgdGhlCj4gPiB0MS0+YXJnc1tpXSBhbmQgdDItPmFyZ3Nbal0sIHdoaWNoIGhhdmUg
dGhlIHNhbWUgb2Zmc2V0LiBBbmQKPiA+IHRoZSBhbGlnbmVkX2lkeCBpcyB0byBmaW5kIHRoZSAi
aiIgYWNjb3JkaW5nIHRvIHRoZSBvZmZzZXQgb2YKPiA+IHQxLT5hcmdzW2ldLgo+Cj4gQW5kIHRo
YXQncyBteSBxdWVzdGlvbi4KPiBXaHkgeW91IGRvbid0IGRvIHRoZSBtYXggb2YgYWNjZXNzZWRf
YXJncyBhY3Jvc3MgYWxsIGF0dGFjaAo+IHBvaW50cyBhbmQgZG8gYnRmX2NoZWNrX2Z1bmNfdHlw
ZV9tYXRjaCgpIHRvIHRoYXQgYXJnbm8KPiBpbnN0ZWFkIG9mIG5hcmdzMS4KPiBUaGlzICdvZmZz
ZXQgKz0gYnRmX3R5cGVfaXNfcHRyKHQxKSA/IDggOiByb3VuZHVwLi4uCj4gaXMgb2RkLgoKSGks
IEknbSB0cnlpbmcgdG8gbWFrZSB0aGUgYnBmIGZsZXhpYmxlIGVub3VnaC4gTGV0J3MgdGFrZSBh
biBleGFtcGxlLApub3cgd2UgaGF2ZSB0aGUgYnBmIHByb2dyYW06CgppbnQgdGVzdDFfcmVzdWx0
ID0gMDsKaW50IEJQRl9QUk9HKHRlc3QxLCBpbnQgYSwgbG9uZyBiLCBjaGFyIGMpCnsKICAgIHRl
c3QxX3Jlc3VsdCA9IGEgKyBjOwogICAgcmV0dXJuIDA7Cn0KCkluIHRoaXMgcHJvZ3JhbSwgb25s
eSB0aGUgMXN0IGFuZCAzcmQgYXJnIGlzIGFjY2Vzc2VkLiBTbyBhbGwga2VybmVsCmZ1bmN0aW9u
cyB3aG9zZSAxc3QgYXJnIGlzIGludCBhbmQgM3JkIGFyZyBpcyBjaGFyIGNhbiBiZSBhdHRhY2hl
ZApieSB0aGlzIGJwZiBwcm9ncmFtLCBldmVuIGlmIHRoZWlyIDJuZCBhcmcgaXMgZGlmZmVyZW50
LgoKQW5kIGxldCdzIHRha2UgYW5vdGhlciBleGFtcGxlIGZvciBzdHJ1Y3QuIFRoaXMgaXMgb3Vy
IGJwZiBwcm9ncmFtOgoKaW50IHRlc3QxX3Jlc3VsdCA9IDA7CmludCBCUEZfUFJPRyh0ZXN0MSwg
bG9uZyBhLCBsb25nIGIsIGNoYXIgYykKewogICAgdGVzdDFfcmVzdWx0ID0gYzsKICAgIHJldHVy
biAwOwp9CgpPbmx5IHRoZSAzcmQgYXJnIGlzIGFjY2Vzc2VkLiBBbmQgd2UgaGF2ZSBmb2xsb3dp
bmcga2VybmVsIGZ1bmN0aW9uOgoKaW50IGtlcm5lbF9mdW5jdGlvbjEobG9uZyBhLCBsb25nIGIs
IGNoYXIgYykKewp4eHgKfQoKc3RydWN0IHRlc3QxIHsKICAgIGxvbmcgYTsKICAgIGxvbmcgYjsK
fTsKaW50IGtlcm5lbF9mdW5jdGlvbjIoc3RydWN0IHRlc3QxIGEsIGNoYXIgYikKewp4eHgKfQoK
VGhlIGtlcm5lbF9mdW5jdGlvbjEgYW5kIGtlcm5lbF9mdW5jdGlvbjIgc2hvdWxkIGJlIGNvbXBh
dGlibGUsCmFzIHRoZSBicGYgcHJvZ3JhbSBvbmx5IGFjY2Vzc2VkIHRoZSBjdHhbMl0sIHdob3Nl
IG9mZnNldCBpcyAxNi4KQW5kIHRoZSBhcmcgaW4ga2VybmVsX2Z1bmN0aW9uMSgpIHdpdGggb2Zm
c2V0IDE2IGlzICJjaGFyIGMiLCB0aGUKYXJnIGluIGtlcm5lbF9mdW5jdGlvbjIoKSB3aXRoIG9m
ZnNldCAxNiBpcyAiY2hhciBiIiwgd2hpY2ggaXMKY29tcGF0aWJsZS4KClRoYXQncyB3aHkgd2Ug
bmVlZCB0byBjaGVjayB0aGUgY29uc2lzdGVuY3kgb2YgYWNjZXNzZWQgYXJncwpieSBvZmZzZXQg
aW5zdGVhZCBvZiBmdW5jdGlvbiBhcmcgaW5kZXguCgpJJ20gbm90IHN1cmUgaWYgSSBleHByZXNz
IG15IGlkZWEgY2xlYXJseSwgaXMgdGhpcyB3aGF0IHlvdSBhcmUKYXNraW5nPwoKVGhhbmtzIQpN
ZW5nbG9uZyBEb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
