Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1628AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD06960F70
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD06960F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qx48+/IY3whiPx3gRUkjzdH4XGT4GZsXzVm7qvPvrfU=; b=hSUAHm8+gVfn0V
	XLk8apcqCtlPbDdY+KRb+gm7BwDgY7YECN+xdwRACOKtOSmNs9yTlXjTapGTXHkg+QSe9hd7C0EAq
	9nsZdoyaUw/TBnrUdiicJ4cnpn7e23S3PpWa1PpzlNjjLq2L2BwMYMuPApchLAot5OWpvj9W6Cbxb
	taazSDlX++Mv0PF5oLP38Z2xubrAq2+U42nH5cmMjpRbu4yCn7fbn10capI3jkzSzx90EeJGFdgnH
	jcClvpm5tXHJVbqDGqNdVUosv53CCDT7G+V4A0dE+1ZMNmbTvZV8O7+lmnw/yg9Xp6LyRe6fKMWiP
	GTHSGz4nv0biH8bewUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miGQx-005LFl-Jv; Wed, 03 Nov 2021 13:36:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miGQu-005LDs-Rj
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 13:36:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso4636666wmc.1
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Uvh5caEZPaBGsYkz+RB5PR1cX52FmrRW0kzG11c76w=;
 b=qI/UsZ2Mq1UosSHGW96E1Ln6Ohj4iHO3r5lBIvPiiNnSxIBIgcvQTvfRZyeI4uu4O/
 HYbGeRhksts0ElYrEG0INKEe7aXhGIbNRoa+5SfNLfBRpFlXkAKGayX0LZ63aqDWcpJu
 dosgFRYQhPioiFxg3dKiHepeHKdbG2JsP/JMlRyX4UEPlfgB3nyfKFkz67tWL42Oz4Lq
 haeTteOxmjvqdt2T96vQoPKq68khNWceoi3kbQKOgXwGPz4h2E6HMJQpKmhk4bbm2avI
 AoSD57sN9RO2aPG2Vw102MrdVN2OMUIaMVVTVHFMc1zAox6M/EelPvrtB3rZV8jRItpA
 XAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Uvh5caEZPaBGsYkz+RB5PR1cX52FmrRW0kzG11c76w=;
 b=6TNF7mS6bVF/bgwra4VEGcVrpAwMnEtCFmrb253CVnbGKKN+8u5OQjy/c4cNc7ZDd9
 SMSTg95J08ep0Fxl41pF8Bf43xNBMWhkYkZELccq5mCeWs1t0vtKRucIFt/Zp1T+z66R
 lUQBxavvkDkMt8oYkMCiytbBTECrmCDzro8OvkLaVJsRTSvJUqlDXBLQstbAMdcqQEsk
 eq9z8KrXq3TsZI9ZMa6cnzA9n7ICticv8wJMHwME4bSjNu2fxG0aVKXsAdjCJ3Xhp3Y5
 3IjVpazC+eaq0oj9Mq88tcWjwy20BtDptZLv1mZYSqeA4ELrutzKIK5bZDvi3nK1c94o
 oDag==
X-Gm-Message-State: AOAM533EvMfjVe0D3hkB1faaUqrSX0tiUKLoeWG1Mgz7xmfustIZQDuc
 NuqzvkLeo19EaFw9VrUSeLStLM2XLLKQRIy9n06h36qVsiaTfQ==
X-Google-Smtp-Source: ABdhPJyk9Vedichm0HF4wrXK3I6wCZMF2YAnKWK9qhd5b6mRw8h4ORBTyVOJ9T9BtxHsr3rVBwd+WcJuTZ2OQtcKxVM=
X-Received: by 2002:a1c:740e:: with SMTP id p14mr15144147wmc.109.1635946563010; 
 Wed, 03 Nov 2021 06:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211103115453.397209-1-bjorn@kernel.org>
 <f98b15c9-bd06-267e-e404-ae4f607d8740@iogearbox.net>
In-Reply-To: <f98b15c9-bd06-267e-e404-ae4f607d8740@iogearbox.net>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 3 Nov 2021 14:35:50 +0100
Message-ID: <CAJ+HfNg9Ko93D1M5En8wv4f-7j_by=OwnewRDiM+xQ0EZLw06w@mail.gmail.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: Fix RV32 broken build, and silence
 RV64 warning
To: Daniel Borkmann <daniel@iogearbox.net>, jszhang@kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Netdev <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Tong Tiangen <tongtiangen@huawei.com>, Luke Nelson <luke.r.nels@gmail.com>, 
 Xi Wang <xi.wang@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_063604_946803_544B7749 
X-CRM114-Status: GOOD (  23.54  )
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

T24gV2VkLCAzIE5vdiAyMDIxIGF0IDE0OjE1LCBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dl
YXJib3gubmV0PiB3cm90ZToKPgo+IE9uIDExLzMvMjEgMTI6NTQgUE0sIEJqw7ZybiBUw7ZwZWwg
d3JvdGU6Cj4gPiBDb21taXQgMjUyYzc2NWJkNzY0ICgicmlzY3YsIGJwZjogQWRkIEJQRiBleGNl
cHRpb24gdGFibGVzIikgb25seQo+ID4gYWRkcmVzc2VkIFJWNjQsIGFuZCBicm9rZSB0aGUgUlYz
MiBidWlsZCBbMV0uIEZpeCBieSBnYXRpbmcgdGhlIGV4Y2VwdGlvbgo+ID4gdGFibGVzIGNvZGUg
d2l0aCBDT05GSUdfQVJDSF9SVjY0SS4KPiA+Cj4gPiBGdXJ0aGVyLCBzaWxlbmNlIGEgIi1XbWlz
c2luZy1wcm90b3R5cGVzIiB3YXJuaW5nIFsyXSBpbiB0aGUgUlY2NCBCUEYKPiA+IEpJVC4KPiA+
Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGx2bS8yMDIxMTEwMjA2MTAuOW95OVJy
MEctbGtwQGludGVsLmNvbS8KPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sbHZtLzIw
MjExMDI5MDMzNC4yemRNeVJxNC1sa3BAaW50ZWwuY29tLwo+ID4KPiA+IEZpeGVzOiAyNTJjNzY1
YmQ3NjQgKCJyaXNjdiwgYnBmOiBBZGQgQlBGIGV4Y2VwdGlvbiB0YWJsZXMiKQo+ID4gU2lnbmVk
LW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gVG9u
Zy9EYW5pZWw6IFRoZSBSVjMyIGJ1aWxkIGhhcyBiZWVuIGJyb2tlbiBzaW5jZSBUaHVyc2RheS4g
SSdsbCB0cnkKPiA+IHRvIGZhc3QtdHJhY2sgYSBiaXQsIGFuZCBjb21taXQgYSBxdWljay1maXgg
Zm9yIGl0LiBIb3BlIHRoYXQncyBPSwo+ID4gd2l0aCB5b3UsIFRvbmchCj4gPgo+ID4gSSd2ZSB2
ZXJpZmllZCB0aGUgYnVpbGQgb24gbXkgbWFjaGluZSB1c2luZyByaXNjdjMyIEdDQyA5LjMuMCBh
bmQKPiA+IHJpc2N2NjQgR0NDIDExLjIuMC4KPgo+IFRoYW5rcyBmb3IgdGhlIGZpeCBCam9ybiEK
Pgo+ID4gYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMgICAgICAgICB8IDQgKystLQo+ID4gICBhcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMiArKwo+ID4gICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS9leHRhYmxlLmMgYi9hcmNoL3Jpc2N2L21tL2V4dGFibGUuYwo+ID4gaW5kZXgg
MThiZjMzODMwM2I2Li5kZGI3ZDNiOTllODkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21t
L2V4dGFibGUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMKPiA+IEBAIC0xMSw3
ICsxMSw3IEBACj4gPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICAgI2luY2x1ZGUg
PGxpbnV4L3VhY2Nlc3MuaD4KPiA+Cj4gPiAtI2lmZGVmIENPTkZJR19CUEZfSklUCj4gPiArI2lm
IGRlZmluZWQoQ09ORklHX0JQRl9KSVQpICYmIGRlZmluZWQoQ09ORklHX0FSQ0hfUlY2NEkpCj4g
PiAgIGludCBydl9icGZfZml4dXBfZXhjZXB0aW9uKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFi
bGVfZW50cnkgKmV4LCBzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiAgICNlbmRpZgo+ID4KPiA+
IEBAIC0yMyw3ICsyMyw3IEBAIGludCBmaXh1cF9leGNlcHRpb24oc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4gPiAgICAgICBpZiAoIWZpeHVwKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
Cj4gPiAtI2lmZGVmIENPTkZJR19CUEZfSklUCj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0JQRl9K
SVQpICYmIGRlZmluZWQoQ09ORklHX0FSQ0hfUlY2NEkpCj4gPiAgICAgICBpZiAocmVncy0+ZXBj
ID49IEJQRl9KSVRfUkVHSU9OX1NUQVJUICYmIHJlZ3MtPmVwYyA8IEJQRl9KSVRfUkVHSU9OX0VO
RCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJ2X2JwZl9maXh1cF9leGNlcHRpb24oZml4dXAs
IHJlZ3MpOwo+ID4gICAjZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4gaW5kZXgg
MmNhMzQ1YzdiMGJmLi5mMmE3NzljN2UyMjUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jCj4gPiBAQCAtNDU5LDYgKzQ1OSw4IEBAIHN0YXRpYyBpbnQgZW1pdF9jYWxsKGJvb2wgZml4
ZWQsIHU2NCBhZGRyLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiA+ICAgI2RlZmluZSBC
UEZfRklYVVBfT0ZGU0VUX01BU0sgICBHRU5NQVNLKDI2LCAwKQo+ID4gICAjZGVmaW5lIEJQRl9G
SVhVUF9SRUdfTUFTSyAgICAgIEdFTk1BU0soMzEsIDI3KQo+ID4KPiA+ICtpbnQgcnZfYnBmX2Zp
eHVwX2V4Y2VwdGlvbihjb25zdCBzdHJ1Y3QgZXhjZXB0aW9uX3RhYmxlX2VudHJ5ICpleCwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPgo+
IEknbSBva2F5IHRvIHRha2UgdGhpcyBhcyBhIHF1aWNrIGZpeCwgYnV0IGlmIGl0cyBub3QgdG9v
IG11Y2ggaGFzc2xlLCBjb3VsZCB3ZSBhZGQgYQo+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXh0
YWJsZS5oIGluIHNpbWlsYXIgZmFzaGlvbiBsaWtlIGFybTY0IG9yIHg4NiB3aGVyZSB3ZSBtb3Zl
Cj4gdGhlIGV4X2hhbmRsZXJfYnBmKCkgc2lnbmF0dXJlIHRoZXJlLCBkaWQgeW91IGhhdmUgYSBj
aGFuY2UgdG8gY2hlY2s/Cj4KCk9LISBJJ3ZlIG5vdCBsb29rZWQgaW50byBpdCB5ZXQhCgpUaGVy
ZSdzIGEgcGF0Y2ggb3V0IGZyb20gSmlzaGVuZyBvbiB0aGUgUlYgbGlzdCwgd2hpY2ggaXMgc3Rh
cnRpbmcKc29tZSBjb25zb2xpZGF0aW9uIHdvcmsgWzFdLgoKQEppc2hlbmcgV2hhdCBkbyB5b3Ug
dGhpbmsgYWJvdXQgYWRkaW5nIHR5cGUvaGFuZGxlcnMgWzIsM10gYXMKYXJtNjQveDg2IHJlY2Vu
dGx5IGRpZCwgdG8geW91ciBzZXJpZXM/CgoKQmrDtnJuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyMTEwMjIwMDE5NTcuMWViYThmMDRAeGhhY2tlci8KWzJdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMTEwMTkxNjAyMTkuNTIw
Mi0xMS1tYXJrLnJ1dGxhbmRAYXJtLmNvbS8KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvMjAyMTA5MDgxMzI1MjUuMjExOTU4NzI1QGxpbnV0cm9uaXguZGUvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
