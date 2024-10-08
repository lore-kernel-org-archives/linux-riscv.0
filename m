Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CD5CED268
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 05:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/g3RX35GpwEYywjETphOZzSayudj3o5rr8PgjENsZo=; b=Zz81XcsngkLfly
	8TndgadAt7zS9/316BUOo1hzUdvPpq3/vNcE/8H5i1DJMiwVKGWBH+8ZfAUXHZxSgSmAvfxt5WN3f
	A5NSXNz7vmI46bit0BYpfPHfMwoGjHZelp8oS1FG5VlixiBfKQbHVFzxP4I0X1A8xM7iFTc7Zifkx
	jdW7gqMgXF5W+9hiZLV2pRao1DfmlRaAGp7C0Ymbz4Rit2qf9kM/NtpUN5PKSnuc74xBm/O8EiaLo
	zQWx28i5XpQP7LmFGE8XkeDEE5I71VeP7WYI5hhP5ExxR0m+Av68CPoRNh07yWekV5RIDfsrIklDz
	2+Wxjh90ShzbvlJBf/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2aH-00000004XLv-2Vj7;
	Tue, 08 Oct 2024 05:16:33 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2aE-00000004XL5-18T0
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 05:16:31 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-82aa3f65864so238170439f.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 22:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1728364589; x=1728969389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4w/TdKOPPfwgKMj85c6/te+TDmMrhbBdxi4k1LLIvc=;
        b=ClHHmy6qFKNIs5/cjJNsdM+seOj+MU0E6hdruCNkS5NzNbtfmIjNeU+JTlbx6QyXzG
         EC/EIGdCAHz15n64SVPeq/uKC0bCnOgfxqb6aYTJJCwqFEob73n4DZTHj91lCaU5yIhO
         3hf7atQUwjDhn1VFbp8F2aZTs49Qmx5V9Ev1ccC/1BPc4qCGWvCyE9gpKAnf1XT4kzBi
         r9/qEgApVCGXO9C/Vxz3n51Y+s6cRze+ztCFEuDMKitXaQyf1j2zEFE/w05INgj0PbeY
         ii2hezAbndLEVjCREl5fkrwV2cxTq78d7LyfzRWFLj/FGKWqAZnnOxD17tLAE+nqUQjJ
         Tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728364589; x=1728969389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4w/TdKOPPfwgKMj85c6/te+TDmMrhbBdxi4k1LLIvc=;
        b=r4j7godouCO6jIh/tPkQiNS4AoIraP5eCJe/O4ceiprVIUK8PFYcaJd/pAD6wuPSBG
         PT1Xa5hcveC4sjS9YUXn+dUpGen+6y6mFUX7z4PJARMzyxkwPBw0zL4GcBlTvkihDpjj
         3ivbNomSo43JeakyMRMyqjkavf2k1VSVpvKrHZeN7QoISuom+RBWAxZtFJkZgb8T0mNP
         N6MxWp52G71XvWnmjCGEdKdOz5iH/U3clkvkdKWnK8RIqVilztc8tdOTjhhGD4sTqeQo
         KtLK13Ii+DeQZHatblDeWvi7B/x4TA4wpLsdmNV/Az0OIx8A7tS4hSlOVCKBTrcGbZ8n
         +pIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdD/kzy0xx9B3P9/RsYOLSrh7TxcccsGHb1XIYMznIRgdfWwCXJqo6Txtyof7OYexuUJBJayD1mLrqQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyioJ2L72kUdOd6mh2WEf33Tdsa9hqrLIrjEdNwccagPs8BgpKY
	sxU6qyRQPs3iXF0iSYAVRaRmm/qwN30XtCoR36P1ZtFCG9HR06pMMxBnsUV/j+7AzjB4Fj8/9Xm
	wyqhWCqjqybpe+nEQBiRBNKue2H6y5Gt+seIHew==
X-Google-Smtp-Source: AGHT+IHj+3nyjDRUlzo6HU3+Ye4UA98AMbnjv3+zlmAvnKbqvLOrOys0YnN7vCUlZP6Nh+cnnTYFiH4anmDFOKj+zMw=
X-Received: by 2002:a05:6602:14c1:b0:82a:2143:8 with SMTP id
 ca18e2360f4ac-834f7d65974mr1658309439f.10.1728364589159; Mon, 07 Oct 2024
 22:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-16-3ba65b6e550f@rivosinc.com>
 <CANXhq0rpwQkZ9+mZLGVUq=r4WiA8BbZ-eeTDogf3fzeEPqeeqA@mail.gmail.com> <ZwRvAEwFbrpq3zZq@debug.ba.rivosinc.com>
In-Reply-To: <ZwRvAEwFbrpq3zZq@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 8 Oct 2024 13:16:17 +0800
Message-ID: <CANXhq0qaokjDC9hb75_dpGuyOd_ex8+q7YNe8pAg7dbTcxuLSg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241007_221630_371504_9E95D53B 
X-CRM114-Status: GOOD (  33.05  )
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

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCA3OjMw4oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMDcsIDIwMjQgYXQgMDQ6MTc6NDdQTSAr
MDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+T24gV2VkLCBPY3QgMiwgMjAyNCBhdCAxMjoyMOKAr0FN
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Pgo+ID4+IFVzZXJz
cGFjZSBzcGVjaWZpZXMgQ0xPTkVfVk0gdG8gc2hhcmUgYWRkcmVzcyBzcGFjZSBhbmQgc3Bhd24g
bmV3IHRocmVhZC4KPiA+PiBgY2xvbmVgIGFsbG93IHVzZXJzcGFjZSB0byBzcGVjaWZ5IGEgbmV3
IHN0YWNrIGZvciBuZXcgdGhyZWFkLiBIb3dldmVyCj4gPj4gdGhlcmUgaXMgbm8gd2F5IHRvIHNw
ZWNpZnkgbmV3IHNoYWRvdyBzdGFjayBiYXNlIGFkZHJlc3Mgd2l0aG91dCBjaGFuZ2luZwo+ID4+
IEFQSS4gVGhpcyBwYXRjaCBhbGxvY2F0ZXMgYSBuZXcgc2hhZG93IHN0YWNrIHdoZW5ldmVyIENM
T05FX1ZNIGlzIGdpdmVuLgo+ID4+Cj4gPj4gSW4gY2FzZSBvZiBDTE9ORV9WRk9SSywgcGFyZW50
IGlzIHN1c3BlbmRlZCB1bnRpbCBjaGlsZCBmaW5pc2hlcyBhbmQgdGh1cwo+ID4+IGNhbiBjaGls
ZCB1c2UgcGFyZW50IHNoYWRvdyBzdGFjay4gSW4gY2FzZSBvZiAhQ0xPTkVfVk0sIENPVyBraWNr
cyBpbgo+ID4+IGJlY2F1c2UgZW50aXJlIGFkZHJlc3Mgc3BhY2UgaXMgY29waWVkIGZyb20gcGFy
ZW50IHRvIGNoaWxkLgo+ID4+Cj4gPj4gYGNsb25lM2AgaXMgZXh0ZW5zaWJsZSBhbmQgY2FuIHBy
b3ZpZGUgbWVjaGFuaXNtcyB1c2luZyB3aGljaCBzaGFkb3cgc3RhY2sKPiA+PiBhcyBhbiBpbnB1
dCBwYXJhbWV0ZXIgY2FuIGJlIHByb3ZpZGVkLiBUaGlzIGlzIG5vdCBzZXR0bGVkIHlldCBhbmQg
YmVpbmcKPiA+PiBleHRlbnNpdmVseSBkaXNjdXNzZWQgb24gbWFpbGluZyBsaXN0LiBPbmNlIHRo
YXQncyBzZXR0bGVkLCB0aGlzIGNvbW1pdAo+ID4+IHdpbGwgYWRhcHQgdG8gdGhhdC4KPiA+Pgo+
ID4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+ID4+
IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCB8ICAyNSArKysrKysr
Kwo+Cj4gLi4uIHNuaXBwZWQuLi4KPgo+ID4+ICsKPiA+PiArLyoKPiA+PiArICogVGhpcyBnZXRz
IGNhbGxlZCBkdXJpbmcgY2xvbmUvY2xvbmUzL2ZvcmsuIEFuZCBpcyBuZWVkZWQgdG8gYWxsb2Nh
dGUgYSBzaGFkb3cgc3RhY2sgZm9yCj4gPj4gKyAqIGNhc2VzIHdoZXJlIENMT05FX1ZNIGlzIHNw
ZWNpZmllZCBhbmQgdGh1cyBhIGRpZmZlcmVudCBzdGFjayBpcyBzcGVjaWZpZWQgYnkgdXNlci4g
V2UKPiA+PiArICogdGh1cyBuZWVkIGEgc2VwYXJhdGUgc2hhZG93IHN0YWNrIHRvby4gSG93IGRv
ZXMgc2VwYXJhdGUgc2hhZG93IHN0YWNrIGlzIHNwZWNpZmllZCBieQo+ID4+ICsgKiB1c2VyIGlz
IHN0aWxsIGJlaW5nIGRlYmF0ZWQuIE9uY2UgdGhhdCdzIHNldHRsZWQsIHJlbW92ZSB0aGlzIHBh
cnQgb2YgdGhlIGNvbW1lbnQuCj4gPj4gKyAqIFRoaXMgZnVuY3Rpb24gc2ltcGx5IHJldHVybnMg
MCBpZiBzaGFkb3cgc3RhY2sgYXJlIG5vdCBzdXBwb3J0ZWQgb3IgaWYgc2VwYXJhdGUgc2hhZG93
Cj4gPj4gKyAqIHN0YWNrIGFsbG9jYXRpb24gaXMgbm90IG5lZWRlZCAobGlrZSBpbiBjYXNlIG9m
ICFDTE9ORV9WTSkKPiA+PiArICovCj4gPj4gK3Vuc2lnbmVkIGxvbmcgc2hzdGtfYWxsb2NfdGhy
ZWFkX3N0YWNrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLAo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3Mg
KmFyZ3MpCj4gPj4gK3sKPiA+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgc2l6ZTsKPiA+
PiArCj4gPj4gKyAgICAgICAvKiBJZiBzaGFkb3cgc3RhY2sgaXMgbm90IHN1cHBvcnRlZCwgcmV0
dXJuIDAgKi8KPiA+PiArICAgICAgIGlmICghY3B1X3N1cHBvcnRzX3NoYWRvd19zdGFjaygpKQo+
ID4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+PiArCj4gPj4gKyAgICAgICAvKgo+ID4+
ICsgICAgICAgICogSWYgc2hhZG93IHN0YWNrIGlzIG5vdCBlbmFibGVkIG9uIHRoZSBuZXcgdGhy
ZWFkLCBza2lwIGFueQo+ID4+ICsgICAgICAgICogc3dpdGNoIHRvIGEgbmV3IHNoYWRvdyBzdGFj
ay4KPiA+PiArICAgICAgICAqLwo+ID4+ICsgICAgICAgaWYgKGlzX3Noc3RrX2VuYWJsZWQodHNr
KSkKPiA+Cj4gPkhpIERlZXBhaywKPiA+U2hvdWxkIGl0IGJlICchJyBpc19zaHN0a19lbmFibGVk
KHRzayk/Cj4KPiBZZXMgaXQgaXMgYSBidWcuIEl0IHNlZW1zIGxpa2UgZm9yayB3aXRob3V0IENM
T05FX1ZNIG9yIHdpdGggQ0xPTkVfVkZPUkssIGl0IHdhcyByZXR1cm5pbmcKPiAwIGFueXdheXMu
IEFuZCBpbiB0aGUgY2FzZSBvZiBDTE9ORV9WTSAodXNlZCBieSBwdGhyZWFkKSwgaXQgd2FzIG5v
dCBkb2luZyB0aGUgcmlnaHQgdGhpbmcuCgpIaSBEZWVwYWssCkknZCBsaWtlIHRvIGtub3cgaWYg
SSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gQ291bGQgSSBrbm93IHdoZXRoZXIgdGhlcmUKbWlnaHQg
YWxzbyBiZSBhIHJpc2sgd2hlbiB0aGUgdXNlciBwcm9ncmFtIGRvZXNuJ3QgZW5hYmxlIHRoZSBD
RkkgYW5kCnRoZSBrZXJuZWwgZG9lc24ndCBhY3RpdmF0ZSBDRkkuIEJlY2F1c2UgdGhpcyBmbG93
IHdpbGwgc3RpbGwgdHJ5IHRvCmFsbG9jYXRlIHRoZSBzaGFkb3cgc3RhY2sgYW5kIGV4ZWN1dGUg
dGhlIHNzYW1vd2FwIGNvbW1hbmQuIFRoYW5rcwoKPiBNb3N0IG9mIHRoZSB0ZXN0aW5nIGhhcyBi
ZWVuIHdpdGggYnVzeWJveCBidWlsZCAoaW5kZXBlbmRlbnQgYmluYXJpZXMwIGRyaXZlbiB2aWEg
YnVpbGRyb290Cj4gc2V0dXAuIFdvbmRlcmluZyB3aHkgaXQgd2Fzbid0IGNhdWdodC4KPgo+IEFu
eXdheXMsIHdpbGwgZml4IGl0LiBUaGFua3MgZm9yIGNhdGNoaW5nIGl0Lgo+Cj4gPgo+ID4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+PiArCj4gPj4gKyAgICAgICAvKgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
