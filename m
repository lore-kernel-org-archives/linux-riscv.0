Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A7BC67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NhYWsow2OS+gFGla8bTawi+W0OoEVvzK9tI85onDWs=; b=W7gl58cN6DAE8V
	sww9Lp5pF1d32XyOlIsx6bD3/upePKSjNVkNyF9nB6vmM7fe2Ipn0gLx5teSlS1AAQSvFmRUJW1Hc
	kqK2ae4gd9/TZhI1QXORrKeGt8YjuLg3k3ebuGJTG1Fib8fgylkHCLlMX5Q43iFCnMSdr9AStM/+b
	6NW8ulJoZD+24dI7wIZ4WXVd6jGgAt/2pWS1/EVhVtdsK1JSADUFf9IDXYQw9a+Vg14iQheo77CUK
	qF7pydpP/y3hmk4SK3ULKaZVo8MpWe/PlphRuCmZbvH9V7lCUnsB4Q+R8DRPKasBkTAzFvWbQRHWY
	vRQmJuHNHWtFW6j0EwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnvb-00000008MNI-0iM0;
	Fri, 05 Apr 2024 18:04:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnvX-00000008MLy-4Ace
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 18:04:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2a49bce83baso50572a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712340274; x=1712945074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbOOQHHfJnX2pfDfgWCsINU2rgHj1dQeerUU+fle01c=;
        b=bufF7JgOLDoubjsk+sEEBJpnaDrM4AojFUNo0XbveREULRs180WE2Sat3BGh1MQdfL
         NeEdrhUqTfISCTIk9woa1mVmABsHetOwNAOOo3thX2qy8KaL271hfuuEkY+Li7l/lAGF
         Oj2R4aXLoJAVnPdFBPt0poYneYtEAX1x3d/SEfCpaNeG/jRqpAnFhaUS9gkMMSQUQjrX
         APDP///dKQpBi8Pv99pM0l9czw4U9+mYydPUd1YfL5HrdVxk4Z+cXUr6GIvyk3/RApxL
         zqym88awRyZI1OyQpckgu3WuTqoY0FFdZx/iPa3+AHIQkwUWLWGY0Tqe/BG+iL/znikk
         PDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712340274; x=1712945074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbOOQHHfJnX2pfDfgWCsINU2rgHj1dQeerUU+fle01c=;
        b=Iv9g3mdlKoZRW4D2WH7ZdPdMDt77fp7vKEHOQ78VyC17f3xZYDGjGRlvhfOQ6mNWd8
         3QZyl3dVAz7THjwS4jfkU+ImhNdVEQdtmZsmwSgzkRo5VyMA/RHuK/ZOVhtpMMQ3Ryo8
         MWO6kSAi7/C4Qqdk2LZ6VekzKFV3Kxk3GtJTcba0FZzDqlIV64cA+PDpnz0Y3InUT34K
         VM0MwADZHgOqoMSp+4cqE3L7TzEsB/44bd001ibvwsuGUPQmOUSo0oo77vspRVrAdEmI
         OkoAFA2OlaSPDstj4NPrAekwFhDKxOmO5ZIXnHC1mPLzP6G5AV6hOY5vzPWSfYYd1lXg
         hk4A==
X-Forwarded-Encrypted: i=1; AJvYcCVclKlvt51dkU+NocTtRx5W2C2BOONfRbToaCKlOR4BlR0HjuQJOZtCBnD5oywDKuETYtFuZGX48VfsWwBaN7vcMESVJWsyX/1LAHsL8NvC
X-Gm-Message-State: AOJu0Yw3ofI/P4ul1zvkayK8TgTY9IdoA6ZwdcLxT37J+Kq0ARZn6GCH
	vn+X9mBXAuzU5HK6oL5XULq9Suh2L4QN051hFPuX++7IFDYd69SB7fmjxc7CjeGEBbCELyz6drT
	VoOrLknbfLh6t8smN/+QHYplQ7CA=
X-Google-Smtp-Source: AGHT+IFR6c4K6HiUOrAnSGIi/JYq+JJaevdAeZxUHbgCPbjn52JO0QkZBlusRD+P+L2TahE4h5Uhq4seaG3OVeiowIc=
X-Received: by 2002:a17:90b:1bcc:b0:2a2:5860:dea8 with SMTP id
 oa12-20020a17090b1bcc00b002a25860dea8mr1932174pjb.7.1712340274157; Fri, 05
 Apr 2024 11:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240405124348.27644-1-puranjay12@gmail.com>
In-Reply-To: <20240405124348.27644-1-puranjay12@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 5 Apr 2024 11:04:22 -0700
Message-ID: <CAEf4BzZ2Tz5-GwbQKYg7KoGwqN8ewPBakmghHaH20MfoATe74g@mail.gmail.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: add internal-only MOV instruction to
 resolve per-CPU addrs
To: Puranjay Mohan <puranjay12@gmail.com>
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
X-CRM114-CacheID: sfid-20240405_110436_144691_7386335B 
X-CRM114-Status: GOOD (  23.95  )
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

T24gRnJpLCBBcHIgNSwgMjAyNCBhdCA1OjQ04oCvQU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5
MTJAZ21haWwuY29tPiB3cm90ZToKPgo+IFN1cHBvcnQgYW4gaW5zdHJ1Y3Rpb24gZm9yIHJlc29s
dmluZyBhYnNvbHV0ZSBhZGRyZXNzZXMgb2YgcGVyLUNQVQo+IGRhdGEgZnJvbSB0aGVpciBwZXIt
Q1BVIG9mZnNldHMuIFRoaXMgaW5zdHJ1Y3Rpb24gaXMgaW50ZXJuYWwtb25seSBhbmQKPiB1c2Vy
cyBhcmUgbm90IGFsbG93ZWQgdG8gdXNlIHRoZW0gZGlyZWN0bHkuIFRoZXkgd2lsbCBvbmx5IGJl
IHVzZWQgZm9yCj4gaW50ZXJuYWwgaW5saW5pbmcgb3B0aW1pemF0aW9ucyBmb3Igbm93IGJldHdl
ZW4gQlBGIHZlcmlmaWVyIGFuZCBCUEYKPiBKSVRzLgo+Cj4gUklTQy1WIHVzZXMgZ2VuZXJpYyBw
ZXItY3B1IGltcGxlbWVudGF0aW9uIHdoZXJlIHRoZSBvZmZzZXRzIGZvciBDUFVzCj4gYXJlIGtl
cHQgaW4gYW4gYXJyYXkgY2FsbGVkIF9fcGVyX2NwdV9vZmZzZXRbY3B1X251bWJlcl0uIFJJU0NW
IHN0b3Jlcwo+IHRoZSBhZGRyZXNzIG9mIHRoZSB0YXNrX3N0cnVjdCBpbiBUUCByZWdpc3Rlci4g
VGhlIGZpcnN0IGVsZW1lbnQgaW4KPiB0YXN0X3N0cnVjdCBpcyBzdHJ1Y3QgdGhyZWFkX2luZm8s
IGFuZCB3ZSBjYW4gZ2V0IHRoZSBjcHUgbnVtYmVyIGJ5Cj4gcmVhZGluZyBmcm9tIHRoZSBUUCBy
ZWdpc3RlciArIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KS4KPgo+IE9uY2Ugd2Ug
aGF2ZSB0aGUgY3B1IG51bWJlciBpbiBhIHJlZ2lzdGVyIHdlIHJlYWQgdGhlIG9mZnNldCBmb3Ig
dGhhdAo+IGNwdSBmcm9tIGFkZHJlc3M6ICZfX3Blcl9jcHVfb2Zmc2V0ICsgY3B1X251bWJlciA8
PCAzLiBUaGVuIHdlIGFkZCB0aGlzCj4gb2Zmc2V0IHRvIHRoZSBkZXN0aW5hdGlvbiByZWdpc3Rl
ci4KPgo+IFRvIG1lYXN1cmUgdGhlIGltcHJvdmVtZW50IGZyb20gdGhpcyBjaGFuZ2UsIHRoZSBi
ZW5jaG1hcmsgaW4gWzFdIHdhcwo+IHVzZWQgb24gUWVtdToKPgo+IEJlZm9yZToKPiBnbG9iLWFy
ci1pbmMgICA6ICAgIDEuMTI3IMKxIDAuMDEzTS9zCj4gYXJyLWluYyAgICAgICAgOiAgICAxLjEy
MSDCsSAwLjAwNE0vcwo+IGhhc2gtaW5jICAgICAgIDogICAgMC42ODEgwrEgMC4wNTJNL3MKPgo+
IEFmdGVyOgo+IGdsb2ItYXJyLWluYyAgIDogICAgMS4xMzggwrEgMC4wMTFNL3MKPiBhcnItaW5j
ICAgICAgICA6ICAgIDEuMzY2IMKxIDAuMDA2TS9zCj4gaGFzaC1pbmMgICAgICAgOiAgICAwLjY3
NiDCsSAwLjAwMU0vcwoKVEJILCBJIGRvbid0IHRydXN0IGJlbmNobWFya3MgZG9uZSBpbnNpZGUg
UUVNVS4gQ2FuIHlvdSB0cnkgcnVubmluZwp0aGlzIG9uIHNvbWUgcmVhbCBoYXJkd2FyZT8KCj4K
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2FuYWtyeWlrby9saW51eC9jb21taXQvOGRlYzkwMDk3
NWVmCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyNCArKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IDE1ZTQ4MmYyYzY1Ny4uZTk1YmQxZDQ1OWE0
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiArKysgYi9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTEyLDYgKzEyLDcgQEAKPiAgI2lu
Y2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5oPgo+ICAjaW5jbHVkZSA8YXNtL3BhdGNoLmg+Cj4g
ICNpbmNsdWRlIDxhc20vY2ZpLmg+Cj4gKyNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+Cj4gICNpbmNs
dWRlICJicGZfaml0LmgiCj4KPiAgI2RlZmluZSBSVl9GRU5UUllfTklOU05TIDIKPiBAQCAtMTA4
OSw2ICsxMDkwLDI0IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2lu
c24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGVtaXRfb3IoUlZfUkVHX1QxLCByZCwgUlZfUkVHX1QxLCBjdHgpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGVtaXRfbXYocmQsIFJWX1JFR19UMSwgY3R4KTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgfSBlbHNlIGlmIChpbnNuX2lz
X21vdl9wZXJjcHVfYWRkcihpbnNuKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChy
ZCAhPSBycykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfbXYocmQsIHJz
LCBjdHgpOwoKSXMgdGhpcyBhbiB1bmNvbmRpdGlvbmFsIG1vdmUgaW5zdHJ1Y3Rpb24/IGluIHg4
Ni02NCwgRU1JVF9tb3YgY2hlY2tzCndoZXRoZXIgc291cmNlIGFuZCBkZXN0aW5hdGlvbiByZWdp
c3RlcnMgYXJlIHRoZSBzYW1lIGFuZCBkb2Vzbid0IGVtaXQKYW55dGhpbmcgaWYgdGhleSBtYXRj
aCAod2hpY2ggbWFrZXMgc2Vuc2UsIHJpZ2h0KT8KCj4gKyNpZmRlZiBDT05GSUdfU01QCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBMb2FkIGN1cnJlbnQgQ1BVIG51bWJlciBp
biBUMSAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9sZChSVl9SRUdf
VDEsIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KSwgUlZfUkVHX1RQLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHgpOwoKbml0OiBtYXliZSBrZWVw
IHRoaXMgb24gdGhlIHNhbWUgbGluZT8KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiA8PCAzIGJlY2F1c2Ugb2Zmc2V0cyBhcmUgOCBieXRlcyAqLwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZW1pdF9zbGxpKFJWX1JFR19UMSwgUlZfUkVHX1QxLCAzLCBjdHgp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogTG9hZCBhZGRyZXNzIG9mIF9f
cGVyX2NwdV9vZmZzZXQgYXJyYXkgaW4gVDIgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVtaXRfaW1tKFJWX1JFR19UMiwgKHU2NCkmX19wZXJfY3B1X29mZnNldCwgY3R4KTsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEFkZCBvZmZzZXQgb2YgY3VycmVu
dCBDUFUgdG8gIF9fcGVyX2NwdV9vZmZzZXQgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVtaXRfYWRkKFJWX1JFR19UMSwgUlZfUkVHX1QyLCBSVl9SRUdfVDEsIGN0eCk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBMb2FkIF9fcGVyX2NwdV9vZmZzZXRb
Y3B1XSBpbiBUMSAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9sZChS
Vl9SRUdfVDEsIDAsIFJWX1JFR19UMSwgY3R4KTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIEFkZCB0aGUgb2Zmc2V0IHRvIFJkICovCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbWl0X2FkZChyZCwgcmQsIFJWX1JFR19UMSwgY3R4KTsKPiArI2VuZGlmCj4g
ICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgaWYgKGltbSA9PSAxKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgLyogU3BlY2lhbCBtb3YzMiBmb3IgemV4dCAqLwo+IEBAIC0y
MDM4LDMgKzIwNTcsOCBAQCBib29sIGJwZl9qaXRfc3VwcG9ydHNfYXJlbmEodm9pZCkKPiAgewo+
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPiArCj4gK2Jvb2wgYnBmX2ppdF9zdXBwb3J0c19w
ZXJjcHVfaW5zbih2b2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPiArfQo+IC0tCj4g
Mi40MC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
