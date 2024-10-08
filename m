Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFA1CED26E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JHJnOMQmXQj3WkfY/re/fcwE34B9+u4/fRZQZZXqSU=; b=4VzFDCqI8LFyKz
	3SpHTZnjjeTXowM/LU50r0pBgYLnu7MdJw9N/2HtrpcVoRdrqDNV5SYTLoWDRWATNPBXc7HF3vYYP
	xUMlkAMoSP5/3aJvRbkjK7TiMaR35/XFlVJBLBPjsQbz3GTMrxu69OMOAfHvMNGlevJ7lMjdo1Rej
	3PpVEHZxZYpKFYR8KlTRrLoh7yuLnngalOjWA1urzjUxO+egKTY5bnv0J24RTx/JUZX43VaBFGxG2
	hknJF5ZSbE0MNr8WLwB5CrylmWClw0ku1xySwYFyWF9X3Ac33AOt9pvMlebqd4hg1qBdoc9vTThy7
	5Q/fsdvvbvcupm+c0wzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3bo-00000004dMK-1SLi;
	Tue, 08 Oct 2024 06:22:12 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3Ys-00000004d55-2m7N
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 06:19:12 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-83493f2dda4so201515939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 23:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1728368349; x=1728973149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRr5KbJ5pCun9Ui+yXUQXX9sN3Sf5UKx3OLBX37YeoY=;
        b=aoBJe2BE4+CxlwE1Y1WJfSfokLCbKom2OJMtBjTkrBA8oSCdFRADCOy918+gVfUUb9
         lufDNPLgx1+6cn4abZMGNNK/Xv3K5ZnJo+koXQWeM+llnUMSGCUeO09m5kWPWQQ4eWaL
         VGY89vjasyNuDASHCI6KNCIglBcS7f2SMiKg1CjxbfH9/XvcWepoB1IeuIUtdwCQ0we1
         RpekI/I1FW0k8Z+ahYQSQyu7GaihDdPMPLVXZ446FJMsJQGwVhCwJ42+u5KL9MFCy8+I
         Ua1dU0ILeKhAF6fUJG+cA2nFJIGTutu6M3VwUI6PRcJpk9dwpRgf0G0CrhyjgS5HK5uE
         LC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728368349; x=1728973149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRr5KbJ5pCun9Ui+yXUQXX9sN3Sf5UKx3OLBX37YeoY=;
        b=E/Z0MA7Yb4EAnPR4pc6vEXKgJYdeEl5tJ2OwjY194Y+qkwKlriS4VpF4ddskSfV3hH
         yRrMuQ6OyE7PrcjnYDylvzFWPzni/gQi++T5bHStRPfUCc6rfqLL02i6JRiMLeFO29U2
         PZG1+6+GKM+Aio0TPckJ278nSdJd7OSnee9t2Y6+ydoghE66tyuf1A8JMoxl8wAIlOLY
         YBA1//i2o9N+zEdYno4K1YxzpfNRiOpR4CAtDFQtxw+ZhYysoO7xW1fJg+DnSnDw3ujv
         itLEehqvHFQ3SB+7Yro193imySZ0Y9tu3aV7vftJ4RvsOQU8aEHBSkRQnZGb+FW+u6+L
         fhDw==
X-Forwarded-Encrypted: i=1; AJvYcCVxEX/d0jT5WUfEjlEGH/kBxmKUXnD2Uq4/TGNsdBRIInUpPq9TGmZ13GE1+GtoCzZ84Zr8BsVN1XR2TA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw156QSnKm36bBl5a22wBML9H2GHGKO9La/qzk8alC96qEL+yk2
	Vi/gnv1+yoLNPC+u5jzm53KFYj5oWk2CH8mGcVZKhnlUj6UBLAqOE7FYGXl2aqR4ynHhgAQupOZ
	wFmnvHNXC2FlnLLfkKxGbsdU0lnNwTFRTOAovnA==
X-Google-Smtp-Source: AGHT+IEEV1iKS64xo2W8tSXTVgZ9wK0tVm8MaNOWH+N+f0lrse/SrQLSt9EsGck2HE3GwEbRPJ5ayCLs8lBdAbKu4jQ=
X-Received: by 2002:a05:6e02:1a2c:b0:3a0:abd0:122 with SMTP id
 e9e14a558f8ab-3a38af6a526mr16553285ab.8.1728368349400; Mon, 07 Oct 2024
 23:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-16-3ba65b6e550f@rivosinc.com>
 <CANXhq0rpwQkZ9+mZLGVUq=r4WiA8BbZ-eeTDogf3fzeEPqeeqA@mail.gmail.com>
 <ZwRvAEwFbrpq3zZq@debug.ba.rivosinc.com> <CANXhq0qaokjDC9hb75_dpGuyOd_ex8+q7YNe8pAg7dbTcxuLSg@mail.gmail.com>
 <ZwTDonkiATv999sS@debug.ba.rivosinc.com>
In-Reply-To: <ZwTDonkiATv999sS@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 8 Oct 2024 14:18:58 +0800
Message-ID: <CANXhq0r611Hi7pohDGRXhvi2E_uOFjwLRDrqZcL2WdLHcs+oHA@mail.gmail.com>
Subject: Re: [PATCH 16/33] riscv/shstk: If needed allocate a new shadow stack
 on clone
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_231910_765614_042C28FA 
X-CRM114-Status: GOOD (  40.40  )
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

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCAxOjMx4oCvUE0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMDE6MTY6MTdQTSAr
MDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+T24gVHVlLCBPY3QgOCwgMjAyNCBhdCA3OjMw4oCvQU0g
RGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gTW9u
LCBPY3QgMDcsIDIwMjQgYXQgMDQ6MTc6NDdQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+PiA+
T24gV2VkLCBPY3QgMiwgMjAyNCBhdCAxMjoyMOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPiA+PiA+Pgo+ID4+ID4+IFVzZXJzcGFjZSBzcGVjaWZpZXMgQ0xP
TkVfVk0gdG8gc2hhcmUgYWRkcmVzcyBzcGFjZSBhbmQgc3Bhd24gbmV3IHRocmVhZC4KPiA+PiA+
PiBgY2xvbmVgIGFsbG93IHVzZXJzcGFjZSB0byBzcGVjaWZ5IGEgbmV3IHN0YWNrIGZvciBuZXcg
dGhyZWFkLiBIb3dldmVyCj4gPj4gPj4gdGhlcmUgaXMgbm8gd2F5IHRvIHNwZWNpZnkgbmV3IHNo
YWRvdyBzdGFjayBiYXNlIGFkZHJlc3Mgd2l0aG91dCBjaGFuZ2luZwo+ID4+ID4+IEFQSS4gVGhp
cyBwYXRjaCBhbGxvY2F0ZXMgYSBuZXcgc2hhZG93IHN0YWNrIHdoZW5ldmVyIENMT05FX1ZNIGlz
IGdpdmVuLgo+ID4+ID4+Cj4gPj4gPj4gSW4gY2FzZSBvZiBDTE9ORV9WRk9SSywgcGFyZW50IGlz
IHN1c3BlbmRlZCB1bnRpbCBjaGlsZCBmaW5pc2hlcyBhbmQgdGh1cwo+ID4+ID4+IGNhbiBjaGls
ZCB1c2UgcGFyZW50IHNoYWRvdyBzdGFjay4gSW4gY2FzZSBvZiAhQ0xPTkVfVk0sIENPVyBraWNr
cyBpbgo+ID4+ID4+IGJlY2F1c2UgZW50aXJlIGFkZHJlc3Mgc3BhY2UgaXMgY29waWVkIGZyb20g
cGFyZW50IHRvIGNoaWxkLgo+ID4+ID4+Cj4gPj4gPj4gYGNsb25lM2AgaXMgZXh0ZW5zaWJsZSBh
bmQgY2FuIHByb3ZpZGUgbWVjaGFuaXNtcyB1c2luZyB3aGljaCBzaGFkb3cgc3RhY2sKPiA+PiA+
PiBhcyBhbiBpbnB1dCBwYXJhbWV0ZXIgY2FuIGJlIHByb3ZpZGVkLiBUaGlzIGlzIG5vdCBzZXR0
bGVkIHlldCBhbmQgYmVpbmcKPiA+PiA+PiBleHRlbnNpdmVseSBkaXNjdXNzZWQgb24gbWFpbGlu
ZyBsaXN0LiBPbmNlIHRoYXQncyBzZXR0bGVkLCB0aGlzIGNvbW1pdAo+ID4+ID4+IHdpbGwgYWRh
cHQgdG8gdGhhdC4KPiA+PiA+Pgo+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8
ZGVidWdAcml2b3NpbmMuY29tPgo+ID4+ID4+IC0tLQo+ID4+ID4+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3VzZXJjZmkuaCB8ICAyNSArKysrKysrKwo+ID4+Cj4gPj4gLi4uIHNuaXBwZWQuLi4K
PiA+Pgo+ID4+ID4+ICsKPiA+PiA+PiArLyoKPiA+PiA+PiArICogVGhpcyBnZXRzIGNhbGxlZCBk
dXJpbmcgY2xvbmUvY2xvbmUzL2ZvcmsuIEFuZCBpcyBuZWVkZWQgdG8gYWxsb2NhdGUgYSBzaGFk
b3cgc3RhY2sgZm9yCj4gPj4gPj4gKyAqIGNhc2VzIHdoZXJlIENMT05FX1ZNIGlzIHNwZWNpZmll
ZCBhbmQgdGh1cyBhIGRpZmZlcmVudCBzdGFjayBpcyBzcGVjaWZpZWQgYnkgdXNlci4gV2UKPiA+
PiA+PiArICogdGh1cyBuZWVkIGEgc2VwYXJhdGUgc2hhZG93IHN0YWNrIHRvby4gSG93IGRvZXMg
c2VwYXJhdGUgc2hhZG93IHN0YWNrIGlzIHNwZWNpZmllZCBieQo+ID4+ID4+ICsgKiB1c2VyIGlz
IHN0aWxsIGJlaW5nIGRlYmF0ZWQuIE9uY2UgdGhhdCdzIHNldHRsZWQsIHJlbW92ZSB0aGlzIHBh
cnQgb2YgdGhlIGNvbW1lbnQuCj4gPj4gPj4gKyAqIFRoaXMgZnVuY3Rpb24gc2ltcGx5IHJldHVy
bnMgMCBpZiBzaGFkb3cgc3RhY2sgYXJlIG5vdCBzdXBwb3J0ZWQgb3IgaWYgc2VwYXJhdGUgc2hh
ZG93Cj4gPj4gPj4gKyAqIHN0YWNrIGFsbG9jYXRpb24gaXMgbm90IG5lZWRlZCAobGlrZSBpbiBj
YXNlIG9mICFDTE9ORV9WTSkKPiA+PiA+PiArICovCj4gPj4gPj4gK3Vuc2lnbmVkIGxvbmcgc2hz
dGtfYWxsb2NfdGhyZWFkX3N0YWNrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLAo+ID4+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga2Vy
bmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCj4gPj4gPj4gK3sKPiA+PiA+PiArICAgICAgIHVuc2lnbmVk
IGxvbmcgYWRkciwgc2l6ZTsKPiA+PiA+PiArCj4gPj4gPj4gKyAgICAgICAvKiBJZiBzaGFkb3cg
c3RhY2sgaXMgbm90IHN1cHBvcnRlZCwgcmV0dXJuIDAgKi8KPiA+PiA+PiArICAgICAgIGlmICgh
Y3B1X3N1cHBvcnRzX3NoYWRvd19zdGFjaygpKQo+ID4+ID4+ICsgICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+PiA+PiArCj4gPj4gPj4gKyAgICAgICAvKgo+ID4+ID4+ICsgICAgICAgICogSWYg
c2hhZG93IHN0YWNrIGlzIG5vdCBlbmFibGVkIG9uIHRoZSBuZXcgdGhyZWFkLCBza2lwIGFueQo+
ID4+ID4+ICsgICAgICAgICogc3dpdGNoIHRvIGEgbmV3IHNoYWRvdyBzdGFjay4KPiA+PiA+PiAr
ICAgICAgICAqLwo+ID4+ID4+ICsgICAgICAgaWYgKGlzX3Noc3RrX2VuYWJsZWQodHNrKSkKPiA+
PiA+Cj4gPj4gPkhpIERlZXBhaywKPiA+PiA+U2hvdWxkIGl0IGJlICchJyBpc19zaHN0a19lbmFi
bGVkKHRzayk/Cj4gPj4KPiA+PiBZZXMgaXQgaXMgYSBidWcuIEl0IHNlZW1zIGxpa2UgZm9yayB3
aXRob3V0IENMT05FX1ZNIG9yIHdpdGggQ0xPTkVfVkZPUkssIGl0IHdhcyByZXR1cm5pbmcKPiA+
PiAwIGFueXdheXMuIEFuZCBpbiB0aGUgY2FzZSBvZiBDTE9ORV9WTSAodXNlZCBieSBwdGhyZWFk
KSwgaXQgd2FzIG5vdCBkb2luZyB0aGUgcmlnaHQgdGhpbmcuCj4gPgo+ID5IaSBEZWVwYWssCj4g
PkknZCBsaWtlIHRvIGtub3cgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gQ291bGQgSSBrbm93
IHdoZXRoZXIgdGhlcmUKPiA+bWlnaHQgYWxzbyBiZSBhIHJpc2sgd2hlbiB0aGUgdXNlciBwcm9n
cmFtIGRvZXNuJ3QgZW5hYmxlIHRoZSBDRkkgYW5kCj4gPnRoZSBrZXJuZWwgZG9lc24ndCBhY3Rp
dmF0ZSBDRkkuIEJlY2F1c2UgdGhpcyBmbG93IHdpbGwgc3RpbGwgdHJ5IHRvCj4gPmFsbG9jYXRl
IHRoZSBzaGFkb3cgc3RhY2sgYW5kIGV4ZWN1dGUgdGhlIHNzYW1vd2FwIGNvbW1hbmQuIFRoYW5r
cwo+Cj4gYHNoc3RrX2FsbG9jX3RocmVhZF9zdGFja2AgaXMgb25seSBjYWxsZWQgZnJvbSBgY29w
eV90aHJlYWRgIGFuZCAgYWxsb2NhdGVzIGFuZAo+IHJldHVybnMgbm9uLXplcm8gKHBvc2l0aXZl
IHZhbHVlKSBmb3Igc3NwIG9ubHkgaWYgYENMT05FX1ZNYCBpcyBzcGVjaWZpZWQuCj4gYENMT05F
X1ZNYCBtZWFucyB0aGF0IGFkZHJlc3Mgc3BhY2UgaXMgc2hhcmVkIGFuZCB1c2Vyc3BhY2UgaGFz
IGFsbG9jYXRlZAo+IHNlcGFyYXRlIHN0YWNrLiBUaGlzIGZsb3cgaXMgZW5zdXJpbmcgdGhhdCBu
ZXdseSBjcmVhdGVkIHRocmVhZCB3aXRoIHNlcGFyYXRlCj4gZGF0YSBzdGFjayBnZXRzIGEgc2Vw
YXJhdGUgc2hhZG93IHN0YWNrIGFzIHdlbGwuCj4KPiBSZXRydW5pbmcgemVybyB2YWx1ZSBmcm9t
IGBzaHN0a19hbGxvY190aHJlYWRfc3RhY2tgIG1lYW5zIHRoYXQsIG5vIG5lZWQgdG8KPiBhbGxv
Y2F0ZSBhIHNoYWRvdyBzdGFjay4gSWYgeW91IGxvb2sgYXQgYGNvcHlfdGhyZWFkYCBmdW5jdGlv
biwgaXQgc2ltcGx5IHNldHMKPiB0aGUgcmV0dXJuZWQgc3NwIGluIG5ld2x5IGNyZWF0ZWQgdGFz
aydzIHRhc2tfc3RydWN0IChpZiBpdCB3YXMgbm9uLXplcm8pLgo+IElmIHJldHVybmVkIHNzcCB3
YXMgemVybywgYGNvcHlfdGhyZWFkYCBkb2Vzbid0IGRvIGFueXRoaW5nLiBUaHVzIHdoYXRldmVy
IGlzCj4gY3VycmVudCB0YXNrIHNldHRpbmdzIGFyZSB0aGF0IHdpbGwgYmUgY29waWVkIG92ZXIg
dG8gbmV3IGZvcmtlZC9jbG9uZWQgdGFzay4KPiBJZiBjdXJyZW50IHRhc2sgaGFkIHNoYWRvdyBz
dGFjayBlbmFibGVkLCBuZXcgdGFzayB3aWxsIGFsc28gZ2V0IGl0IGVuYWJsZWQgYXQKPiBzYW1l
IGFkZHJlc3MgKHRvIGJlIENPV2VkIGxhdGVyKS4KPgo+IEFueSB0YXNrIGdldCBzaGFkb3cgc3Rh
Y2sgZW5hYmxlZCBmb3IgZmlyc3QgdGltZSB1c2luZyBuZXcgcHJjdGxzIChzZWUgcHJjdGwKPiBw
YXRjaGVzKS4KPgo+IFNvIG9ubHkgdGltZSBgc3NhbW9zd2FwYCB3aWxsIGJlIGV4ZXJjaXNlZCB3
aWxsIGJlIGFyZQo+IC0gVXNlciBpc3N1ZXMgZW5hYmxpbmcgYHByY3RsYCAoaXQnbGwgYmUgaXNz
dWVkIGZyb20gbG9hZGVyKQo+IC0gZm9yay9jbG9uZSBoYXBwZW5zCj4KPiBJbiBib3RoIGNhc2Vz
LCBpdCBpcyBndWFyZGVkIGFnYWluc3QgY2hlY2tzIG9mIHdoZXRoZXIgY3B1IHN1cHBvcnRzIGl0
IGFuZCB0YXNrCj4gaGFzIHNoYWRvdyBzdGFjayBlbmFibGVkLgo+Cj4gTGV0IG1lIGtub3cgaWYg
eW91IHRoaW5rIEkgbWlzc2VkIGFueSBmbG93LgoKVGhhbmtzIGEgbG90IGZvciB0aGUgZGV0YWls
LCBpdCBpcyB2ZXJ5IGhlbHBmdWwgZm9yIG1lLiBCdXQgc29ycnkgZm9yCnRoZSBjb25mdXNpb24s
IG15IHF1ZXN0aW9uIGlzIGFjdHVhbGx5IG9uIHRoZSBzaXR1YXRpb24gd2l0aCB0aGlzIGJ1Zwoo
aS5lLiwgYmVmb3JlIHRoZSBmaXgpCgo+Cj4gPgo+ID4+IE1vc3Qgb2YgdGhlIHRlc3RpbmcgaGFz
IGJlZW4gd2l0aCBidXN5Ym94IGJ1aWxkIChpbmRlcGVuZGVudCBiaW5hcmllczAgZHJpdmVuIHZp
YSBidWlsZHJvb3QKPiA+PiBzZXR1cC4gV29uZGVyaW5nIHdoeSBpdCB3YXNuJ3QgY2F1Z2h0Lgo+
ID4+Cj4gPj4gQW55d2F5cywgd2lsbCBmaXggaXQuIFRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQuCj4g
Pj4KPiA+PiA+Cj4gPj4gPj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4+ID4+ICsKPiA+
PiA+PiArICAgICAgIC8qCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
