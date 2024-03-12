Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF1DC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOw+ClMS1AcWeHfYd/iQF2DTKmpQOxOv1bB7W7NuhDc=; b=SId38k7GW+ysXW
	1nojf8AI21CxnpPaEyWP6xD16lAepKoMci72hvUZJjbGf6kjzP5lpkvHdHGK3fPPb2aLQg67AfWHU
	o4JxJy5R1wsbmEi4Qubg9Fh6ZB4Q9nwTY0Utt519Qc2scQieU8d60F5xXMQeQgsBElNG6dHbcnF9F
	THWhA3xNeOpI73M4z/I7IUhtd/SQkvog3EM1Dcej01qj1m3OPLyxIl0UXy5Akc6S11wE9XEf/w4De
	7JeYeWywZ8cnT6dZMP1UIjlJTmsxCTcv55SJGvI44P3b6Pn2QigeWKX9ZbMS2pvN3NlSIaikFbA8z
	e6/3CLYN2VmNjJJZQ/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrDx-00000003sAJ-4BLh;
	Tue, 12 Mar 2024 01:46:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrDu-00000003s8N-19Kk;
	Tue, 12 Mar 2024 01:46:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33e92b3b5c9so2101989f8f.2;
        Mon, 11 Mar 2024 18:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710207992; x=1710812792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFvEiqhX2i2GoBS6IFsYFhmAGUUKO86Ht6WflbVQ8Y8=;
        b=JQrenM42BCEaATOCGUTWnpUFRZRlTGsGNPZcaMLSmTctR4BXtT+5AcKOjiust+TtAj
         7RDIhxTZuLFjQ93N1YgufgTCTtQVZtL+Opt4sjpO57yqCa3UZjuKIYb06TUu+3igLJF5
         gr+9ietRDpM/WGvm/totG+uPTr3wO0qIL7C1eZXgFD6FoqyG8lzzfx3agTOw33Fkkx5F
         rzGpvcOacyUzgr32qcQMQ4U7EzChAzoVHajQrAN10/FuULLw4Zhnx5ZE1KXhfXHUvdbR
         h5rKm4lQ5cXrec+26dQlIg449XgGKPwrrDQenHBlff9Fj5PG5OLgDlFoC1NAbaXKGueK
         AqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710207992; x=1710812792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFvEiqhX2i2GoBS6IFsYFhmAGUUKO86Ht6WflbVQ8Y8=;
        b=OvmW3ZfNATdANxLkd2tWBdS3qpDMMnkeT+IH+ogDUH0vC2ZddQFPrATWQEhzrf+f4d
         oWiU09yRFL2MrSASHzPdBbDC7ak3hWYLSWHPqY2rS5MR3awxc7i3oOsfVkuD5v/9Ptjk
         EeT351pF6ZGbwPHy2QQOAyiOqaOrJo1KJScJhk1zkZoEXSsDIpZW2oXvIFjrmRcnvWO8
         dTBNd5lScmORq3kosVFzcITkeP+PcMUXItDBbi0mwvHmWWMJAVS0u52ub0TPbCzmS6dk
         mZATiiBGFoxRBMZqFqMcDvNKCxKJGi0U0LgFCsWaUqZwinRp3GPjBi0HIXodDkuruQjc
         a6GA==
X-Forwarded-Encrypted: i=1; AJvYcCXhebnmmruxUxLUW5ASNGSA936R4PoYHeEcOcz9nFmryJVDbEHCMn/fuVmIHpvCzvueRRcSRwHFByrm7ym58OH8lmBu+pVKqtTTHCY6jEqqfeXgfrM67qe1JYtNoxIyZ918wgSLeumvHYL1+hTa7wkMbLZAWiY=
X-Gm-Message-State: AOJu0YyC+yPWc0rR+hGzg9V93mReWTzxf5rJWKarGIDbStEv+Esdu54i
	971k1OsEq+6EziKACUpXDJuQc3JjaZMVQU3XP+I7vkS5kejHmx7/n9hp7Ppb4z2t+dP6Pyz+XSe
	Y3GW5wVrANje7INbpBCTwonQd9OgnigwMGHQ=
X-Google-Smtp-Source: AGHT+IE2O3q08IG7koprpVBAqPH51TPrr8tIiRdpN+Hjlh32uUAnsmvFQ7iaUIR3l+9EpCJWnXc/E2rl/5o+a1GbZgw=
X-Received: by 2002:a05:600c:4711:b0:413:1a5d:96c1 with SMTP id
 v17-20020a05600c471100b004131a5d96c1mr5075871wmo.40.1710207992248; Mon, 11
 Mar 2024 18:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com> <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:46:21 -0700
Message-ID: <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support to record and
 check the accessed args
To: Menglong Dong <dongmenglong.8@bytedance.com>
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
X-CRM114-CacheID: sfid-20240311_184634_392768_77407CCB 
X-CRM114-Status: GOOD (  27.95  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNOKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSW4gdGhpcyBjb21taXQsIHdlIGFkZCB0
aGUgJ2FjY2Vzc2VkX2FyZ3MnIGZpZWxkIHRvIHN0cnVjdCBicGZfcHJvZ19hdXgsCj4gd2hpY2gg
aXMgdXNlZCB0byByZWNvcmQgdGhlIGFjY2Vzc2VkIGluZGV4IG9mIHRoZSBmdW5jdGlvbiBhcmdz
IGluCj4gYnRmX2N0eF9hY2Nlc3MoKS4KPgo+IE1lYW53aGlsZSwgd2UgYWRkIHRoZSBmdW5jdGlv
biBidGZfY2hlY2tfZnVuY19wYXJ0X21hdGNoKCkgdG8gY29tcGFyZSB0aGUKPiBhY2Nlc3NlZCBm
dW5jdGlvbiBhcmdzIG9mIHR3byBmdW5jdGlvbiBwcm90b3R5cGUuIFRoaXMgZnVuY3Rpb24gd2ls
bCBiZQo+IHVzZWQgaW4gdGhlIGZvbGxvd2luZyBjb21taXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBN
ZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBpbmNs
dWRlL2xpbnV4L2JwZi5oIHwgICA0ICsrCj4gIGtlcm5lbC9icGYvYnRmLmMgICAgfCAxMDggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9saW51eC9icGYuaAo+IGluZGV4IDk1ZTA3Njcz
Y2RjMS4uMGY2NzdmZGNmY2M3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvYnBmLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gQEAgLTE0NjEsNiArMTQ2MSw3IEBAIHN0cnVjdCBi
cGZfcHJvZ19hdXggewo+ICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICphdHRhY2hfZnVu
Y19wcm90bzsKPiAgICAgICAgIC8qIGZ1bmN0aW9uIG5hbWUgZm9yIHZhbGlkIGF0dGFjaF9idGZf
aWQgKi8KPiAgICAgICAgIGNvbnN0IGNoYXIgKmF0dGFjaF9mdW5jX25hbWU7Cj4gKyAgICAgICB1
NjQgYWNjZXNzZWRfYXJnczsKPiAgICAgICAgIHN0cnVjdCBicGZfcHJvZyAqKmZ1bmM7Cj4gICAg
ICAgICB2b2lkICpqaXRfZGF0YTsgLyogSklUIHNwZWNpZmljIGRhdGEuIGFyY2ggZGVwZW5kZW50
ICovCj4gICAgICAgICBzdHJ1Y3QgYnBmX2ppdF9wb2tlX2Rlc2NyaXB0b3IgKnBva2VfdGFiOwo+
IEBAIC0yNTY1LDYgKzI1NjYsOSBAQCBzdHJ1Y3QgYnBmX3JlZ19zdGF0ZTsKPiAgaW50IGJ0Zl9w
cmVwYXJlX2Z1bmNfYXJncyhzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBpbnQgc3VicHJv
Zyk7Cj4gIGludCBidGZfY2hlY2tfdHlwZV9tYXRjaChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2xvZyAq
bG9nLCBjb25zdCBzdHJ1Y3QgYnBmX3Byb2cgKnByb2csCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0KTsKPiAraW50IGJ0
Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2goc3RydWN0IGJ0ZiAqYnRmMSwgY29uc3Qgc3RydWN0IGJ0
Zl90eXBlICp0MSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYnRmICpi
dGYyLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnQyLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU2NCBmdW5jX2FyZ3MpOwo+ICBjb25zdCBjaGFyICpidGZfZmluZF9kZWNsX3RhZ192
YWx1ZShjb25zdCBzdHJ1Y3QgYnRmICpidGYsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqcHQsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGNvbXBfaWR4LCBjb25zdCBj
aGFyICp0YWdfa2V5KTsKPiAgaW50IGJ0Zl9maW5kX25leHRfZGVjbF90YWcoY29uc3Qgc3RydWN0
IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+IGRpZmYgLS1naXQgYS9rZXJu
ZWwvYnBmL2J0Zi5jIGIva2VybmVsL2JwZi9idGYuYwo+IGluZGV4IDE3MGQwMTdlOGU0YS4uYzJh
MDI5OWQ0MzU4IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9icGYvYnRmLmMKPiArKysgYi9rZXJuZWwv
YnBmL2J0Zi5jCj4gQEAgLTYxMjUsMTkgKzYxMjUsMjQgQEAgc3RhdGljIGJvb2wgaXNfaW50X3B0
cihzdHJ1Y3QgYnRmICpidGYsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqdCkKPiAgfQo+Cj4gIHN0
YXRpYyB1MzIgZ2V0X2N0eF9hcmdfaWR4KHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0
Zl90eXBlICpmdW5jX3Byb3RvLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGludCBvZmYp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IG9mZiwgaW50ICphbGlnbmVkX2lkeCkK
PiAgewo+ICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqYXJnczsKPiAgICAgICAgIGNv
bnN0IHN0cnVjdCBidGZfdHlwZSAqdDsKPiAgICAgICAgIHUzMiBvZmZzZXQgPSAwLCBucl9hcmdz
Owo+ICAgICAgICAgaW50IGk7Cj4KPiArICAgICAgIGlmIChhbGlnbmVkX2lkeCkKPiArICAgICAg
ICAgICAgICAgKmFsaWduZWRfaWR4ID0gLUVOT0VOVDsKPiArCj4gICAgICAgICBpZiAoIWZ1bmNf
cHJvdG8pCj4gICAgICAgICAgICAgICAgIHJldHVybiBvZmYgLyA4Owo+Cj4gICAgICAgICBucl9h
cmdzID0gYnRmX3R5cGVfdmxlbihmdW5jX3Byb3RvKTsKPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qg
c3RydWN0IGJ0Zl9wYXJhbSAqKShmdW5jX3Byb3RvICsgMSk7Cj4gICAgICAgICBmb3IgKGkgPSAw
OyBpIDwgbnJfYXJnczsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChhbGlnbmVkX2lkeCAm
JiBvZmZzZXQgPT0gb2ZmKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICphbGlnbmVkX2lkeCA9
IGk7Cj4gICAgICAgICAgICAgICAgIHQgPSBidGZfdHlwZV9za2lwX21vZGlmaWVycyhidGYsIGFy
Z3NbaV0udHlwZSwgTlVMTCk7Cj4gICAgICAgICAgICAgICAgIG9mZnNldCArPSBidGZfdHlwZV9p
c19wdHIodCkgPyA4IDogcm91bmR1cCh0LT5zaXplLCA4KTsKPiAgICAgICAgICAgICAgICAgaWYg
KG9mZiA8IG9mZnNldCkKPiBAQCAtNjIwNyw3ICs2MjEyLDcgQEAgYm9vbCBidGZfY3R4X2FjY2Vz
cyhpbnQgb2ZmLCBpbnQgc2l6ZSwgZW51bSBicGZfYWNjZXNzX3R5cGUgdHlwZSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICB0bmFtZSwgb2ZmKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICAgICAgICAgfQo+IC0gICAgICAgYXJnID0gZ2V0X2N0eF9hcmdfaWR4KGJ0ZiwgdCwg
b2ZmKTsKPiArICAgICAgIGFyZyA9IGdldF9jdHhfYXJnX2lkeChidGYsIHQsIG9mZiwgTlVMTCk7
Cj4gICAgICAgICBhcmdzID0gKGNvbnN0IHN0cnVjdCBidGZfcGFyYW0gKikodCArIDEpOwo+ICAg
ICAgICAgLyogaWYgKHQgPT0gTlVMTCkgRmFsbCBiYWNrIHRvIGRlZmF1bHQgQlBGIHByb2cgd2l0
aAo+ICAgICAgICAgICogTUFYX0JQRl9GVU5DX1JFR19BUkdTIHU2NCBhcmd1bWVudHMuCj4gQEAg
LTYyMTcsNiArNjIyMiw5IEBAIGJvb2wgYnRmX2N0eF9hY2Nlc3MoaW50IG9mZiwgaW50IHNpemUs
IGVudW0gYnBmX2FjY2Vzc190eXBlIHR5cGUsCj4gICAgICAgICAgICAgICAgIC8qIHNraXAgZmly
c3QgJ3ZvaWQgKl9fZGF0YScgYXJndW1lbnQgaW4gYnRmX3RyYWNlXyMjbmFtZSB0eXBlZGVmICov
Cj4gICAgICAgICAgICAgICAgIGFyZ3MrKzsKPiAgICAgICAgICAgICAgICAgbnJfYXJncy0tOwo+
ICsgICAgICAgICAgICAgICBwcm9nLT5hdXgtPmFjY2Vzc2VkX2FyZ3MgfD0gKDEgPDwgKGFyZyAr
IDEpKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIHByb2ctPmF1eC0+YWNj
ZXNzZWRfYXJncyB8PSAoMSA8PCBhcmcpOwoKV2hhdCBkbyB5b3UgbmVlZCB0aGlzIGFsaWduZWRf
aWR4IGZvciA/CkknZCBleHBlY3QgdGhhdCBhYm92ZSAiYWNjZXNzZWRfYXJncyB8PSAoMSA8PCBh
cmcpOyIgaXMgZW5vdWdoLgoKPiAgICAgICAgIH0KPgo+ICAgICAgICAgaWYgKGFyZyA+IG5yX2Fy
Z3MpIHsKPiBAQCAtNzAyNCw2ICs3MDMyLDEwMiBAQCBpbnQgYnRmX2NoZWNrX3R5cGVfbWF0Y2go
c3RydWN0IGJwZl92ZXJpZmllcl9sb2cgKmxvZywgY29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcgo+
ICAgICAgICAgcmV0dXJuIGJ0Zl9jaGVja19mdW5jX3R5cGVfbWF0Y2gobG9nLCBidGYxLCB0MSwg
YnRmMiwgdDIpOwo+ICB9Cj4KPiArc3RhdGljIHUzMiBnZXRfY3R4X2FyZ190b3RhbF9zaXplKHN0
cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0KQo+ICt7Cj4gKyAgICAgICBj
b25zdCBzdHJ1Y3QgYnRmX3BhcmFtICphcmdzOwo+ICsgICAgICAgdTMyIHNpemUgPSAwLCBucl9h
cmdzOwo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAgICAgbnJfYXJncyA9IGJ0Zl90eXBlX3Zs
ZW4odCk7Cj4gKyAgICAgICBhcmdzID0gKGNvbnN0IHN0cnVjdCBidGZfcGFyYW0gKikodCArIDEp
Owo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX2FyZ3M7IGkrKykgewo+ICsgICAgICAgICAg
ICAgICB0ID0gYnRmX3R5cGVfc2tpcF9tb2RpZmllcnMoYnRmLCBhcmdzW2ldLnR5cGUsIE5VTEwp
Owo+ICsgICAgICAgICAgICAgICBzaXplICs9IGJ0Zl90eXBlX2lzX3B0cih0KSA/IDggOiByb3Vu
ZHVwKHQtPnNpemUsIDgpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBzaXplOwo+
ICt9Cj4gKwo+ICsvKiBUaGlzIGZ1bmN0aW9uIGlzIHNpbWlsYXIgdG8gYnRmX2NoZWNrX2Z1bmNf
dHlwZV9tYXRjaCgpLCBleGNlcHQgdGhhdCBpdAo+ICsgKiBvbmx5IGNvbXBhcmUgc29tZSBmdW5j
dGlvbiBhcmdzIG9mIHRoZSBmdW5jdGlvbiBwcm90b3R5cGUgdDEgYW5kIHQyLgo+ICsgKi8KPiAr
aW50IGJ0Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2goc3RydWN0IGJ0ZiAqYnRmMSwgY29uc3Qgc3Ry
dWN0IGJ0Zl90eXBlICpmdW5jMSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgYnRmICpidGYyLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmZ1bmMyLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHU2NCBmdW5jX2FyZ3MpCgpUaGlzIGlzIHdheSB0b28gbXVjaCBj
b3B5IHBhc3RlLgpQbGVhc2Ugc2hhcmUgdGhlIGNvZGUgd2l0aCBidGZfY2hlY2tfZnVuY190eXBl
X21hdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
