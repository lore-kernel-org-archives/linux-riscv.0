Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCAC43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F62d/vNU0V5ZWeOtzHZs2/+BKTaSKHph4sWMuDBV55U=; b=vt5nflohAVgrZa
	VcBfuJ3S9p8t35rQRjwblLleJ3cpD1kQEBvPRkOmH0Zi9o/ZJwRhvZ4lLPF0eB8ZFX+iGzyj7/Pdv
	8wgihXaaZTjpfIomunMwZOgf766b+3dPxLcgFSI7wKLeobgJbG9OsDVUcB2Je3bjBKUX1upOhLS0X
	cTmNGONjasB0JU+hamZggK96NtWzqz5KyC0JvAks/iiTc8HV2S1iifdGH5wrRXlzR2cteqfS1bW2O
	xa3LxlM+O5Z7GMJ2gBGLjHPkLsI6aKcCC/f2aYddGUy6nFLUWR5mxoCG0DDL3UV26FnVsnovQRXAF
	4whwXOj2o1FYFmFvnavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf3M-0000000BuEe-3UZi;
	Mon, 06 Jul 2026 08:51:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf3I-0000000BuDu-17P4
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:51:45 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso2737158a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327903; x=1783932703; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0gzeXbVPPuDm6MFw6rW3cSp3Szz2VQxXfM+6OAkUTo=;
        b=JnwMBPQxepI5ywhlKgEUwCw6/IaXnPemvYZeqnvJ1SctOCDCwinOZFNQdn9PKcJsJt
         ELzY6JBy/yMCCx0mGutCjrtIOOyxUWq9hRre0L1pgiTzV8gV4a1UrJIAYUyGWZd8o92i
         uby6DFJV1+sV8teSlaI6tSS++IampbgvOQZFTSalQNpOOLzne2iAOkS4MWBbqb6+ryVv
         JVFAzYjD0EsKVzYCYaslQdZEYTRq+NZh+yyvcSwq0stBbIOyzm5CWHK5KJ9zROIF/Xbi
         MfZY+WA6nadjQ+CaAKsfl6jloZH73z2wzoS3gLnibYD6TJaPptp3eITv4WtuD3HYxjG+
         ckew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327903; x=1783932703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0gzeXbVPPuDm6MFw6rW3cSp3Szz2VQxXfM+6OAkUTo=;
        b=nCunk9zp8RC0bodvPKPbplbyKq7xszYiiluvnVSct3iBf3o9DZpnO7I9VXygLIojv/
         Ntaglhm1Kr0molEojqFo0JK2/qWhanyzc7tWn7GRv4Bpfyk7P8YN+ySQFlRPxOJigrjg
         zFwGesQ+pkbFaEUpUHiTvrzdyZ0wCMuyjAUI8KV3+31jc6vINKlDy4iB7J7BelBIypD9
         QPEVTb2qUT5qOrtnUFaEhOj4apeoLPOxsLysywqOD2Z2srrEojZ/rPGPG/xvIHuONQOO
         BXv2kd902JC1w8NBi31CRAx4bFhqbeLMepg/shcF3oWANdxjvHJHEjjB/jlHmMzr1V7Y
         c+Hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0I7q/ZldL7BTzR6RqaundraJJmekCYkC6qHNY4VaKdW7X3hgulNxhOy1R+nU4qduCmjOrLkLPpUMCWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnu0HoQ8K2vJyxw8VX+Mgbm2Ur3+qvqS2hEwre0Ev9WruWsE98
	LtvbwUnOBmQt0IkGp3jAmpHc1PNHjWmL3Tq03SkoM4uBmBE179JB6fzg
X-Gm-Gg: AfdE7cneUFvrQqdCbVxbsHte+/59gvF6dAGAaS1cGfxs60Ry15jYQeJOa+NWEw9AjZu
	aGrZDNs0mLH6AUxSwf/vETXIEsJD8vRzLmXq9lbqvHsUIVbmLOL1ymNWT2/Dgb2gUNFgqxqhwkd
	/6qzP8u5cUUCWSDapeMJl4xmN2kvv2S6GlnpDothmLewC9XL4LzsMrfmD0QOTUc7VLMC4BlRGfi
	m+WCiKRhOOUkoNZEKCGESsKkHOnTwpQXWIy/SUL8yl2BRedsb6KxydHxeWPkrvxj9dASfrGmTGT
	F/ymJjIBXdWhq1Xfj7QvI4HQYUSUP598Dnh/yQol2xnp2zCTGvPbE9d4t9TMEX8b1T0Fzwg0niP
	VOfTT+53mwSkbB/N7C3cecQdoEH9Xxx/363pO0p4yafngTlC88hh1yXo8OC2zNOPKao6NJlMRAj
	t8aoIZYF/K1Ny8GIX6W6Oe1gzstOUW6bpV0GIIBxnOrSJTHkz+cv6Ao2ORxw==
X-Received: by 2002:a17:90b:3a50:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-382a01beeb4mr9152255a91.33.1783327902707;
        Mon, 06 Jul 2026 01:51:42 -0700 (PDT)
Received: from computer ([2405:201:d015:d26b:41c5:151e:6e02:36c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31164c1c422sm4055231eec.13.2026.07.06.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:51:42 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:21:33 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, bjorn@kernel.org,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	puranjay@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Message-ID: <aktslXMz29C9twvo@computer>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-3-varunrmallya@gmail.com>
 <b6e8c677-5fff-4de1-8483-fc23361898dc@huawei.com>
 <akDOkptnqJt9LDtj@computer>
 <d5810b66-a2f9-4449-a808-c588e4a2ff1c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5810b66-a2f9-4449-a808-c588e4a2ff1c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_015144_430309_1BF01A95 
X-CRM114-Status: GOOD (  32.89  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgMTA6NTM6MjZBTSArMDgwMCwgUHUgTGVodWkgd3JvdGU6
Cj4gCj4gT24gMjAyNi82LzI4IDE1OjM0LCBWYXJ1biBSIE1hbGx5YSB3cm90ZToKPiA+IE9uIFR1
ZSwgSnVuIDIzLCAyMDI2IGF0IDEwOjExOjU3QU0gKzA4MDAsIFB1IExlaHVpIHdyb3RlOgo+ID4g
PiAKPiA+ID4gV2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUgY29kZS4gUGxlYXNlIG1lcmdlIGl0
Lgo+ID4gCj4gPiBNYWtpbmcgdGhpcyBjaGFuZ2UgaW4gdGhlIG5leHQgdmVyc2lvbiEKPiA+IAo+
ID4gPiA+ICsKPiA+ID4gPiArCQlpZiAoIWF1eC0+ZXhjZXB0aW9uX2NiICYmIGF1eC0+ZXhjZXB0
aW9uX2JvdW5kYXJ5KSB7Cj4gPiA+ID4gKwkJCS8qCj4gPiA+ID4gKwkJCSAqIEJvdW5kYXJ5IHBy
b2dyYW06IGFsbG9jYXRlIHRoZSBmcmFtZSBhbmQgc2F2ZSB0aGUKPiA+ID4gPiArCQkJICogZnVs
bCBjYWxsZWUtc2F2ZWQgc2V0LCBjYXB0dXJpbmcgdGhlIGNhbGxlcidzIHZhbHVlcy4KPiA+ID4g
PiArCQkJICovCj4gPiA+ID4gKwkJCWVtaXRfYWRkaShSVl9SRUdfU1AsIFJWX1JFR19TUCwgLXN0
YWNrX2FkanVzdCwgY3R4KTsKPiA+ID4gPiArCQkJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
cnZfZXhjZXB0aW9uX2NzYXZlX3JlZ3MpOyBpKyspIHsKPiA+ID4gPiArCQkJCWVtaXRfc2QoUlZf
UkVHX1NQLCBzdG9yZV9vZmZzZXQsCj4gPiA+ID4gKwkJCQkJcnZfZXhjZXB0aW9uX2NzYXZlX3Jl
Z3NbaV0sIGN0eCk7Cj4gPiA+ID4gKwkJCQlzdG9yZV9vZmZzZXQgLT0gODsKPiA+ID4gPiArCQkJ
fQo+ID4gPiA+ICsJCQllbWl0X2FkZGkoUlZfUkVHX0ZQLCBSVl9SRUdfU1AsIHN0YWNrX2FkanVz
dCwgY3R4KTsKPiA+ID4gPiArCQl9IGVsc2Ugewo+ID4gPiA+ICsJCQkvKgo+ID4gPiA+ICsJCQkg
KiBFeGNlcHRpb24gY2FsbGJhY2ssIHJldXNlIHRoZSBib3VuZGFyeSBwcm9ncmFtJ3MKPiA+ID4g
PiArCQkJICogZnJhbWUsIHdob3NlIGZyYW1lIHBvaW50ZXIgaXMgcGFzc2VkIGluIGEyLiBTZXR0
aW5nCj4gPiA+IAo+ID4gPiBzb21ldGhpbmcgY29uZnVzZWTigJR3aHkgaXMgaXQgQTI/IEkgZmVl
bCBsaWtlIEkgbWlzc2VkIHNvbWV0aGluZy4KPiA+IAo+ID4gYnBmX3Rocm93KCkgaW52b2tlcyB0
aGUgZXhjZXB0aW9uIGNhbGxiYWNrIGFzCj4gPiBicGZfZXhjZXB0aW9uX2NiKGNvb2tpZSwgc3As
IGJwLCAwLCAwKSAsIHdob3NlIDNyZCBhcmd1bWVudCAod2hpY2gsCj4gPiBhY2NvcmRpbmcgdG8g
UklTQy1WJ3MgY2FsbGluZyBjb252ZW50aW9uIHJlc2lkZXMgaW4gQTIpIGlzIHRoZSBib3VuZGFy
eQo+ID4gcHJvZydzIGZyYW1lIHBvaW50ZXIuIFNpbmNlIHRoaXMgZWxzZSBicmFuY2ggaGFuZGxl
cwo+ID4gdGhlIGNhbGxiYWNrLCBpdCBleHBlY3RzIEEyIHRvIGhhdmUgdGhlIGZyYW1lIHBvaW50
ZXIuIFRoZSBhcm0KPiA+IGltcGxlbWVudGF0aW9uIGRvZXMgc29tZXRoaW5nIHZlcnkgc2ltaWxh
ciB3aXRoIGVtaXQoQTY0X01PVigxLCBBNjRfRlAsIEE2NF9SKDIpKSwgY3R4KQo+ID4gd2hlcmUg
QTY0X1IoMikgaXMgdGhlIHRoaXJkIGFyZy4KPiAKPiBvaywgc28gaXQgd291bGQgYmUgYmV0dGVy
IHRvIGNsZWFyIGluIHRoZSBjb21tZW50cyB0aGF0IGl0IGlzIHRoZSB0aGlyZAo+IHBhcmFtZXRl
ci4KPgoKV2lsbCBkbyB0aGF0IGluIHYzLiBTb3JyeSBmb3IgYmVpbmcgdmVyeSBsYXRlIHRvIHJl
cGx5IHRvIHRoaXMuIFRoZXJlCmFyZSBCVEYgaXNzdWVzIEkgYW0gZW5jb3VudGVyaW5nIHdoaWxl
IHJ1bm5pbmcgUklTQy1WIGtlcm5lbHMgd2hpY2ggSQpoYXZlIGZvdW5kIHRoZSBjYXVzZSBmb3Ig
YW5kIHdpbGwgc2VuZCBhIHJlcG9ydCBhbmQgcHJvcG9zZSBhIGZpeCBzb29uLgoKPiA+IAo+ID4g
PiA+ICsJCQkgKiBTUCA9IEZQIC0gc3RhY2tfYWRqdXN0IGxpbmVzIHRoZSBlcGlsb2d1ZSdzIGxv
YWRzIHVwCj4gPiA+ID4gKwkJCSAqIHdpdGggdGhlIHJlZ2lzdGVycyB0aGUgYm91bmRhcnkgc2F2
ZWQuCj4gPiA+ID4gKwkJCSAqLwo+ID4gPiA+ICsJCQllbWl0X212KFJWX1JFR19GUCwgUlZfUkVH
X0EyLCBjdHgpOwo+ID4gPiA+ICsJCQllbWl0X2FkZGkoUlZfUkVHX1NQLCBSVl9SRUdfRlAsIC1z
dGFja19hZGp1c3QsIGN0eCk7Cj4gPiA+ID4gKwkJfQo+ID4gPiA+ICsKPiA+ID4gPiArCQlnb3Rv
IHRhaWxfc2V0dXA7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICAgIAlpZiAoc2Vlbl9y
ZWcoUlZfUkVHX1JBLCBjdHgpKQo+ID4gPiA+ICAgIAkJc3RhY2tfYWRqdXN0ICs9IDg7Cj4gPiA+
ID4gICAgCXN0YWNrX2FkanVzdCArPSA4OyAvKiBSVl9SRUdfRlAgKi8KPiA+ID4gPiBAQCAtMjA4
Miw2ICsyMTczLDcgQEAgdm9pZCBicGZfaml0X2J1aWxkX3Byb2xvZ3VlKHN0cnVjdCBydl9qaXRf
Y29udGV4dCAqY3R4LCBib29sIGlzX3N1YnByb2cpCj4gPiA+ID4gICAgCWVtaXRfYWRkaShSVl9S
RUdfRlAsIFJWX1JFR19TUCwgc3RhY2tfYWRqdXN0LCBjdHgpOwo+ID4gPiA+ICt0YWlsX3NldHVw
Ogo+ID4gPiA+ICAgIAlpZiAoYnBmX3N0YWNrX2FkanVzdCkKPiA+ID4gPiAgICAJCWVtaXRfYWRk
aShSVl9SRUdfUzUsIFJWX1JFR19TUCwgYnBmX3N0YWNrX2FkanVzdCwgY3R4KTsKPiA+ID4gPiBA
QCAtMjE1NywzICsyMjQ5LDEzIEBAIGJvb2wgYnBmX2ppdF9zdXBwb3J0c19mc2Vzc2lvbih2b2lk
KQo+ID4gPiA+ICAgIHsKPiA+ID4gPiAgICAJcmV0dXJuIHRydWU7Cj4gPiA+ID4gICAgfQo+ID4g
PiA+ICsKPiA+ID4gPiArYm9vbCBicGZfaml0X3N1cHBvcnRzX2V4Y2VwdGlvbnModm9pZCkKPiA+
ID4gPiArewo+ID4gPiA+ICsJLyoKPiA+ID4gPiArCSAqIGJwZl90aHJvdygpIHVud2luZHMgYnkg
d2Fsa2luZyB0aGUgZnJhbWUtcG9pbnRlciBjaGFpbiBmcm9tIGluc2lkZQo+ID4gPiA+ICsJICog
dGhlIGtlcm5lbCBiYWNrIGludG8gdGhlIEJQRiBmcmFtZXMgKHNlZSBhcmNoX2JwZl9zdGFja193
YWxrKCkpLCBzbwo+ID4gPiA+ICsJICogZXhjZXB0aW9ucyByZXF1aXJlIHRoZSBmcmFtZS1wb2lu
dGVyIHVud2luZGVyIHRvIGJlIGVuYWJsZWQuCj4gPiA+ID4gKwkgKi8KPiA+ID4gPiArCXJldHVy
biBJU19FTkFCTEVEKENPTkZJR19GUkFNRV9QT0lOVEVSKTsKPiA+ID4gCj4gPiA+IHJpc2N2IHNl
bGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMsIHNvIHRoaXMgd2lsbCBhbHdheXMgdHJ1ZQo+
ID4gCj4gPiBJIGNoZWNrZWQgdGhhdCB0aGUga2VybmVsIGNvbXBpbGVkIGV2ZW4gd2hlbiBJIHR1
cm5lZAo+ID4gQ09ORklHX0ZSQU1FX1BPSU5URVIgZXhwbGljaXRseSBvZmYsIHNvIG5vdCBnYXRp
bmcgdGhpcwo+ID4gd291bGQgYmUgYSBtaXN0YWtlLCByaWdodCA/IEFSQ0hfV0FOVF9GUkFNRV9Q
T0lOVEVSUyBtYWtlcwo+ID4gQ09ORklHX0ZSQU1FX1BPSU5URVIgdXNlciBzZWxlY3RhYmxlIGFu
ZCBtYWtlcyBpdCBkZWZhdWx0IHRvCj4gPiB0cnVlLCBidXQgaXQncyBub3QgYWx3YXlzIHRydWUu
IFdoYXQgZG9lcyBmb3JjZSBpdCBpcyBQRVJGX0VWRU5UUz15IGJ1dCBpZgo+ID4gdGhhdCB0b28g
aXMgdHVybmVkIG9mZiwgdGhlbiBDT05GSUdfRlJBTUVfUE9JTlRFUiBjYW4gYWxzbyBiZSB0dXJu
ZWQKPiA+IG9mZi4KPiAKPiBhbHJpZ2h0LCBsZ3RtCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIHJl
dmlldyEhCj4gPiAtIFZhcnVuCj4gPiA+ID4gK30KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
