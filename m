Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED0FC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0SIYlGYhiZC/Zvah2V8TrU1dpUM7/OGMPMjyKytwoQ=; b=Ndv0Vv+aE2UaJc
	8KwM2ZHYG4yCaQVAbksxJ8Cz/lzpDf13mF/eVjvECbl6ocrFSaXqDj4+t5d2nPe3x1Usy2Hj7d3nq
	4aYcZE3d1ZsKSdffbPJEGnxrKyC/44JzWgHg2gDE4+62W5iDzXCS+eT3xHswhkwHuPLr0TEXNIJWf
	v+Z4b++4xtEKIQbxo0vu8yk4oVOatkJH3utyM5AUoajH/D5IzT8iHTdHhNpwyJxc7n4F7CAA8KKwv
	cvrdni1BqHhhhgjpSpbNLLtOLnNUSLhEK8QRE5rKXVZNTaqgfeTPCo7+RDjgbWpTdfDh43/tYoWUb
	w2mtYB3Iv1a0EjSvOW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrSm-00000003uvo-1Dd3;
	Tue, 12 Mar 2024 02:01:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrSf-00000003utv-3lwI
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:01:51 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-29a2545a1e7so3257484a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710208905; x=1710813705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04korNn+ptS1gdtp9bjAZOdgzha5IIX0Ncig6I/SdC8=;
        b=e+jfHc2Houshg1Dta5QptMnUxOcGw5okiJywsMdTUriG8EV/2xrpAkUTQoUCWksouB
         ipDhyTHB+Ggmv/WbHZuh7YJ65hDnNUBtcErNiEgBFWsXSSLLojb06XQRcrUKa3oq31zH
         53Th2Rbk+SyuHTBAZ8xAeXbVQtVCIg0luux3nKg4p6AuoIWbb6bw+2/0RliMlLDNwzer
         FI3LlNl6gEP7syln2Vdu9ZCs+9kjCfufwDdBxnqEjZLNaWKCvuBfjqlSeNtzxo5+SN0F
         zwwdev03bZvcDFYNO3ppZiwtM3nHUD9RrEJYAd8J9ozLnikCkxaZFjsQkYnPkvPH2jEf
         H9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208905; x=1710813705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04korNn+ptS1gdtp9bjAZOdgzha5IIX0Ncig6I/SdC8=;
        b=eXT1hw7xqkECYH1zZcoVKnnmcVJh3TpNPpaNZ/0TqQJJEFRZuJ9VLmmnLBftd7LcPL
         eFW0AlDmcnjCeyZPqYMXYl13ab/R5jtIHj+5w0rhgGyO2Olwug456TpVjCqZnqdBaTdk
         Ol83rw2oUwVbEmmxSirGJqKw8py0DZiQ/ysF14tvWrAQdrKegLTENe78RNCfObyNHDBx
         BKfugxhGuLTNOlojFD5A8WJ3cCmyFU2GcX8fRCKrfVTQTsivL6iCS2/h1Dug5TXeI1q4
         6gg1Eg58WHoizpLmLUWbYdOsQ6YFJu064Sc3YBXt5Xw6pPJv/BuiZRxivKzETqGlyzAM
         fXKA==
X-Forwarded-Encrypted: i=1; AJvYcCXicUsy7NJfeTVSDzsC/xblpdqb+33qpMQ7NvLjICa4hxKsO2JSXGKkZpe0hvojxVVsJbY941q54Q2V1A5H866xrv7+tCsakUXmPsK9jwIw
X-Gm-Message-State: AOJu0YzxfBGfjMRXTSrwaewGD1qGM/aDImkqWWsw1Pf+oVXBPA8K8sKb
	YbAHoOmbdrjc66eyRb92v+MBA8KipUKTJ5cFcs18aS82rlAjOAV9Ms/bRIt10Yf1VMyjhLddsas
	DLgcPdZ8dfPmD3J2ug0UC6MtFuhEbizpN6ec8yQ==
X-Google-Smtp-Source: AGHT+IFU9d58jLiUu+dw8DkQB5XXLOOej/TsY11ssdad2M5fQNKdmpNs98xYJ42I4OgsPLsEE36ekbfce1jUks2RugY=
X-Received: by 2002:a17:90a:df11:b0:29b:b0c1:60cd with SMTP id
 gp17-20020a17090adf1100b0029bb0c160cdmr6423688pjb.23.1710208905551; Mon, 11
 Mar 2024 19:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
In-Reply-To: <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:01:34 +0800
Message-ID: <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240311_190149_980575_55604AC7 
X-CRM114-Status: GOOD (  30.91  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo0NuKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM04oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPiBJbiB0aGlzIGNvbW1pdCwgd2UgYWRkIHRoZSAnYWNjZXNzZWRf
YXJncycgZmllbGQgdG8gc3RydWN0IGJwZl9wcm9nX2F1eCwKPiA+IHdoaWNoIGlzIHVzZWQgdG8g
cmVjb3JkIHRoZSBhY2Nlc3NlZCBpbmRleCBvZiB0aGUgZnVuY3Rpb24gYXJncyBpbgo+ID4gYnRm
X2N0eF9hY2Nlc3MoKS4KPiA+Cj4gPiBNZWFud2hpbGUsIHdlIGFkZCB0aGUgZnVuY3Rpb24gYnRm
X2NoZWNrX2Z1bmNfcGFydF9tYXRjaCgpIHRvIGNvbXBhcmUgdGhlCj4gPiBhY2Nlc3NlZCBmdW5j
dGlvbiBhcmdzIG9mIHR3byBmdW5jdGlvbiBwcm90b3R5cGUuIFRoaXMgZnVuY3Rpb24gd2lsbCBi
ZQo+ID4gdXNlZCBpbiB0aGUgZm9sbG93aW5nIGNvbW1pdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBNZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4g
PiAgaW5jbHVkZS9saW51eC9icGYuaCB8ICAgNCArKwo+ID4gIGtlcm5lbC9icGYvYnRmLmMgICAg
fCAxMDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9saW51eC9icGYuaAo+
ID4gaW5kZXggOTVlMDc2NzNjZGMxLi4wZjY3N2ZkY2ZjYzcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L2JwZi5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gPiBAQCAtMTQ2
MSw2ICsxNDYxLDcgQEAgc3RydWN0IGJwZl9wcm9nX2F1eCB7Cj4gPiAgICAgICAgIGNvbnN0IHN0
cnVjdCBidGZfdHlwZSAqYXR0YWNoX2Z1bmNfcHJvdG87Cj4gPiAgICAgICAgIC8qIGZ1bmN0aW9u
IG5hbWUgZm9yIHZhbGlkIGF0dGFjaF9idGZfaWQgKi8KPiA+ICAgICAgICAgY29uc3QgY2hhciAq
YXR0YWNoX2Z1bmNfbmFtZTsKPiA+ICsgICAgICAgdTY0IGFjY2Vzc2VkX2FyZ3M7Cj4gPiAgICAg
ICAgIHN0cnVjdCBicGZfcHJvZyAqKmZ1bmM7Cj4gPiAgICAgICAgIHZvaWQgKmppdF9kYXRhOyAv
KiBKSVQgc3BlY2lmaWMgZGF0YS4gYXJjaCBkZXBlbmRlbnQgKi8KPiA+ICAgICAgICAgc3RydWN0
IGJwZl9qaXRfcG9rZV9kZXNjcmlwdG9yICpwb2tlX3RhYjsKPiA+IEBAIC0yNTY1LDYgKzI1NjYs
OSBAQCBzdHJ1Y3QgYnBmX3JlZ19zdGF0ZTsKPiA+ICBpbnQgYnRmX3ByZXBhcmVfZnVuY19hcmdz
KHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGludCBzdWJwcm9nKTsKPiA+ICBpbnQgYnRm
X2NoZWNrX3R5cGVfbWF0Y2goc3RydWN0IGJwZl92ZXJpZmllcl9sb2cgKmxvZywgY29uc3Qgc3Ry
dWN0IGJwZl9wcm9nICpwcm9nLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBi
dGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0KTsKPiA+ICtpbnQgYnRmX2NoZWNrX2Z1
bmNfcGFydF9tYXRjaChzdHJ1Y3QgYnRmICpidGYxLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnQx
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmMiwgY29u
c3Qgc3RydWN0IGJ0Zl90eXBlICp0MiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHU2NCBmdW5jX2FyZ3MpOwo+ID4gIGNvbnN0IGNoYXIgKmJ0Zl9maW5kX2RlY2xfdGFnX3ZhbHVl
KGNvbnN0IHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICpwdCwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBjb21wX2lkeCwgY29uc3QgY2hh
ciAqdGFnX2tleSk7Cj4gPiAgaW50IGJ0Zl9maW5kX25leHRfZGVjbF90YWcoY29uc3Qgc3RydWN0
IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+ID4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9icGYvYnRmLmMgYi9rZXJuZWwvYnBmL2J0Zi5jCj4gPiBpbmRleCAxNzBkMDE3ZThlNGEu
LmMyYTAyOTlkNDM1OCAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9icGYvYnRmLmMKPiA+ICsrKyBi
L2tlcm5lbC9icGYvYnRmLmMKPiA+IEBAIC02MTI1LDE5ICs2MTI1LDI0IEBAIHN0YXRpYyBib29s
IGlzX2ludF9wdHIoc3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnQpCj4g
PiAgfQo+ID4KPiA+ICBzdGF0aWMgdTMyIGdldF9jdHhfYXJnX2lkeChzdHJ1Y3QgYnRmICpidGYs
IGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqZnVuY19wcm90bywKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBvZmYpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgb2Zm
LCBpbnQgKmFsaWduZWRfaWR4KQo+ID4gIHsKPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl9w
YXJhbSAqYXJnczsKPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0Owo+ID4gICAg
ICAgICB1MzIgb2Zmc2V0ID0gMCwgbnJfYXJnczsKPiA+ICAgICAgICAgaW50IGk7Cj4gPgo+ID4g
KyAgICAgICBpZiAoYWxpZ25lZF9pZHgpCj4gPiArICAgICAgICAgICAgICAgKmFsaWduZWRfaWR4
ID0gLUVOT0VOVDsKPiA+ICsKPiA+ICAgICAgICAgaWYgKCFmdW5jX3Byb3RvKQo+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiBvZmYgLyA4Owo+ID4KPiA+ICAgICAgICAgbnJfYXJncyA9IGJ0Zl90
eXBlX3ZsZW4oZnVuY19wcm90byk7Cj4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0
Zl9wYXJhbSAqKShmdW5jX3Byb3RvICsgMSk7Cj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBu
cl9hcmdzOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoYWxpZ25lZF9pZHggJiYgb2Zm
c2V0ID09IG9mZikKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICphbGlnbmVkX2lkeCA9IGk7
Cj4gPiAgICAgICAgICAgICAgICAgdCA9IGJ0Zl90eXBlX3NraXBfbW9kaWZpZXJzKGJ0ZiwgYXJn
c1tpXS50eXBlLCBOVUxMKTsKPiA+ICAgICAgICAgICAgICAgICBvZmZzZXQgKz0gYnRmX3R5cGVf
aXNfcHRyKHQpID8gOCA6IHJvdW5kdXAodC0+c2l6ZSwgOCk7Cj4gPiAgICAgICAgICAgICAgICAg
aWYgKG9mZiA8IG9mZnNldCkKPiA+IEBAIC02MjA3LDcgKzYyMTIsNyBAQCBib29sIGJ0Zl9jdHhf
YWNjZXNzKGludCBvZmYsIGludCBzaXplLCBlbnVtIGJwZl9hY2Nlc3NfdHlwZSB0eXBlLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgdG5hbWUsIG9mZik7Cj4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ID4gICAgICAgICB9Cj4gPiAtICAgICAgIGFyZyA9IGdldF9jdHhfYXJn
X2lkeChidGYsIHQsIG9mZik7Cj4gPiArICAgICAgIGFyZyA9IGdldF9jdHhfYXJnX2lkeChidGYs
IHQsIG9mZiwgTlVMTCk7Cj4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0Zl9wYXJh
bSAqKSh0ICsgMSk7Cj4gPiAgICAgICAgIC8qIGlmICh0ID09IE5VTEwpIEZhbGwgYmFjayB0byBk
ZWZhdWx0IEJQRiBwcm9nIHdpdGgKPiA+ICAgICAgICAgICogTUFYX0JQRl9GVU5DX1JFR19BUkdT
IHU2NCBhcmd1bWVudHMuCj4gPiBAQCAtNjIxNyw2ICs2MjIyLDkgQEAgYm9vbCBidGZfY3R4X2Fj
Y2VzcyhpbnQgb2ZmLCBpbnQgc2l6ZSwgZW51bSBicGZfYWNjZXNzX3R5cGUgdHlwZSwKPiA+ICAg
ICAgICAgICAgICAgICAvKiBza2lwIGZpcnN0ICd2b2lkICpfX2RhdGEnIGFyZ3VtZW50IGluIGJ0
Zl90cmFjZV8jI25hbWUgdHlwZWRlZiAqLwo+ID4gICAgICAgICAgICAgICAgIGFyZ3MrKzsKPiA+
ICAgICAgICAgICAgICAgICBucl9hcmdzLS07Cj4gPiArICAgICAgICAgICAgICAgcHJvZy0+YXV4
LT5hY2Nlc3NlZF9hcmdzIHw9ICgxIDw8IChhcmcgKyAxKSk7Cj4gPiArICAgICAgIH0gZWxzZSB7
Cj4gPiArICAgICAgICAgICAgICAgcHJvZy0+YXV4LT5hY2Nlc3NlZF9hcmdzIHw9ICgxIDw8IGFy
Zyk7Cj4KPiBXaGF0IGRvIHlvdSBuZWVkIHRoaXMgYWxpZ25lZF9pZHggZm9yID8KPiBJJ2QgZXhw
ZWN0IHRoYXQgYWJvdmUgImFjY2Vzc2VkX2FyZ3MgfD0gKDEgPDwgYXJnKTsiIGlzIGVub3VnaC4K
PgoKV2hpY2ggYWxpZ25lZF9pZHg/IE5vIGFsaWduZWRfaWR4IGluIHRoZSBidGZfY3R4X2FjY2Vz
cygpLCBhbmQKYWxpZ25lZF9pZHggaXMgb25seSB1c2VkIGluIHRoZSBidGZfY2hlY2tfZnVuY19w
YXJ0X21hdGNoKCkuCgpJbiB0aGUgYnRmX2NoZWNrX2Z1bmNfcGFydF9tYXRjaCgpLCBJIG5lZWQg
dG8gY29tcGFyZSB0aGUKdDEtPmFyZ3NbaV0gYW5kIHQyLT5hcmdzW2pdLCB3aGljaCBoYXZlIHRo
ZSBzYW1lIG9mZnNldC4gQW5kCnRoZSBhbGlnbmVkX2lkeCBpcyB0byBmaW5kIHRoZSAiaiIgYWNj
b3JkaW5nIHRvIHRoZSBvZmZzZXQgb2YKdDEtPmFyZ3NbaV0uCgo+ID4gICAgICAgICB9Cj4gPgo+
ID4gICAgICAgICBpZiAoYXJnID4gbnJfYXJncykgewo+ID4gQEAgLTcwMjQsNiArNzAzMiwxMDIg
QEAgaW50IGJ0Zl9jaGVja190eXBlX21hdGNoKHN0cnVjdCBicGZfdmVyaWZpZXJfbG9nICpsb2cs
IGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHIKPiA+ICAgICAgICAgcmV0dXJuIGJ0Zl9jaGVja19m
dW5jX3R5cGVfbWF0Y2gobG9nLCBidGYxLCB0MSwgYnRmMiwgdDIpOwo+ID4gIH0KPiA+Cj4gPiAr
c3RhdGljIHUzMiBnZXRfY3R4X2FyZ190b3RhbF9zaXplKHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qg
c3RydWN0IGJ0Zl90eXBlICp0KQo+ID4gK3sKPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl9w
YXJhbSAqYXJnczsKPiA+ICsgICAgICAgdTMyIHNpemUgPSAwLCBucl9hcmdzOwo+ID4gKyAgICAg
ICBpbnQgaTsKPiA+ICsKPiA+ICsgICAgICAgbnJfYXJncyA9IGJ0Zl90eXBlX3ZsZW4odCk7Cj4g
PiArICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqKSh0ICsgMSk7Cj4gPiAr
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9hcmdzOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAg
ICB0ID0gYnRmX3R5cGVfc2tpcF9tb2RpZmllcnMoYnRmLCBhcmdzW2ldLnR5cGUsIE5VTEwpOwo+
ID4gKyAgICAgICAgICAgICAgIHNpemUgKz0gYnRmX3R5cGVfaXNfcHRyKHQpID8gOCA6IHJvdW5k
dXAodC0+c2l6ZSwgOCk7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIHNp
emU7Cj4gPiArfQo+ID4gKwo+ID4gKy8qIFRoaXMgZnVuY3Rpb24gaXMgc2ltaWxhciB0byBidGZf
Y2hlY2tfZnVuY190eXBlX21hdGNoKCksIGV4Y2VwdCB0aGF0IGl0Cj4gPiArICogb25seSBjb21w
YXJlIHNvbWUgZnVuY3Rpb24gYXJncyBvZiB0aGUgZnVuY3Rpb24gcHJvdG90eXBlIHQxIGFuZCB0
Mi4KPiA+ICsgKi8KPiA+ICtpbnQgYnRmX2NoZWNrX2Z1bmNfcGFydF9tYXRjaChzdHJ1Y3QgYnRm
ICpidGYxLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKmZ1bmMxLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmMiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICpm
dW5jMiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBmdW5jX2FyZ3MpCj4K
PiBUaGlzIGlzIHdheSB0b28gbXVjaCBjb3B5IHBhc3RlLgo+IFBsZWFzZSBzaGFyZSB0aGUgY29k
ZSB3aXRoIGJ0Zl9jaGVja19mdW5jX3R5cGVfbWF0Y2guCgpPa2F5IQoKVGhhbmtzIQpNZW5nbG9u
ZyBEb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
