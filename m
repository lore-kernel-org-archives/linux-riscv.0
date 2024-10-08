Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D66ECED270
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 06:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKiqPCqRChTZ2Gh3U/ROXDvAEAWVGpBowGgHnWQ21jM=; b=p+eoatocegM90mJ5jiJbQdALEn
	DsWA6DrkDn9E/X5WVIssKpcNPLd0S6la6JBN+MtnKcAPZv4PH2ow9V2V51TVp0eqtIeUEPpVTr40m
	ge/47ukLSGGUFonpGa9GfRVmvhdU0/UsXvMK3Xo83ktB/mOsw1GQ9VaZIshvzxrt525epYNf2o5Dc
	p/Wc+Jz41/kNSs4LFSHbRqcWQWV7MDcoKufrk404sWCU3JH5nhimmayP3Wa0YySr7MP2fYF+V0Y1m
	YKVC1Z32mwTI0ymQP8d2bXMg7Rz+9sDEuswF9OwmLSFBFRAcmfhF46nc4wI9wpaynzUsUtcoOqC7m
	mpwvihJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3nI-00000004fWd-3JDm;
	Tue, 08 Oct 2024 06:34:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3hK-00000004ejT-2eeH
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 06:27:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e28bd0bd13so106216a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728368873; x=1728973673; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yD1uY1GFMUYlwE1Gpa3bWH24Ki4C8p8PksybGuIxKXE=;
        b=yEotS0kEtHgVtgmacnsXLbWzT8hwiMICvHJcyJ+ZwW6314rDBEpE/JauaZiyfVJnw8
         +8dDXQlZ6mXtAkdN9VFKNPYRlt64DDjsRXzpDygS+XnV/rYFt7NpbF0y9hYmlNdHa4mR
         SbO//Byd/lre+3vcrxSF+YB5rwnNqHqTNE844kr1jj0bPgPrRtFxkh4wKdkfD/k8OolN
         IG3jvl2otIJ/wdDdrW3QQo9lPyPxTHxYphJG9EZULVI/A3AGrXs10AzpfmdrNZL205HH
         oylANcKmth1V0DAjWw8ykijxzavL2l6lnf/MwvOx9LRvHwILyFIL443nXOErJeTxwGRl
         DcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728368873; x=1728973673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yD1uY1GFMUYlwE1Gpa3bWH24Ki4C8p8PksybGuIxKXE=;
        b=LIx2XmTBMK0ak3iKsTFm91kFaQUVXbnOu1m1AerQf0RJAePCKzosd7ot0fm+MwO7zY
         a8PFsYyvp5JIG/Wa+DNWQOxQS9L4DSkq4NIm1Lzo1BvDirj3/q/ZvLkWT9uEnOQ9alCw
         Jl6ZlkJPhK+Qbqnt3iyOXFD5NgRFpzXPIvpigy2GFDRLt8B3MfQv38UEn22BJmp8o8oh
         jf3ANQZbnkBcQSA+yNDeXeQEKFsfBsn0E0akre7VYzWYAA61RPQZOAStPKzhc4pTXMY/
         atjs9UmHyofPzG5MlJZcDbNxa2KZGL5TXOCokgPshajpp9X1fynQ5IJShGO/OhdsTzrs
         aKkg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9kZBB7gJLTZtDvNuUq7pjCjD7gOM1BGuBJZJnz/BhDuNC79F8woQVpDM81ABrqIsm/wpnbwVW4HlhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfgvI+Rt+XGcZvURIZwrw/g7+G+YYFWW0vbbleW4b8SOnK/Chn
	AmGUJhnGa1M7TfaHfoVSJaN/OCMoLm0CeMX67VapidX7PzmCcD71PSIIkvcR8AU=
X-Google-Smtp-Source: AGHT+IF/ZQHlU6tp9Sg21rBMwoL6ZDWlzQEcykMAFPhKfSpu/YJnzOfJudFoJo575FCLm+0FY5JUkg==
X-Received: by 2002:a17:90b:1b05:b0:2d3:cd5c:15bb with SMTP id 98e67ed59e1d1-2e1e63698a6mr17009604a91.25.1728368873537;
        Mon, 07 Oct 2024 23:27:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e28b773a77sm464805a91.11.2024.10.07.23.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 23:27:53 -0700 (PDT)
Date: Mon, 7 Oct 2024 23:27:49 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH 16/33] riscv/shstk: If needed allocate a new shadow stack
 on clone
Message-ID: <ZwTQ5c+YOQFHa4YC@debug.ba.rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-16-3ba65b6e550f@rivosinc.com>
 <CANXhq0rpwQkZ9+mZLGVUq=r4WiA8BbZ-eeTDogf3fzeEPqeeqA@mail.gmail.com>
 <ZwRvAEwFbrpq3zZq@debug.ba.rivosinc.com>
 <CANXhq0qaokjDC9hb75_dpGuyOd_ex8+q7YNe8pAg7dbTcxuLSg@mail.gmail.com>
 <ZwTDonkiATv999sS@debug.ba.rivosinc.com>
 <CANXhq0r611Hi7pohDGRXhvi2E_uOFjwLRDrqZcL2WdLHcs+oHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0r611Hi7pohDGRXhvi2E_uOFjwLRDrqZcL2WdLHcs+oHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_232754_713458_2883222E 
X-CRM114-Status: GOOD (  35.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMDI6MTg6NThQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgMTozMeKAr1BNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMDE6MTY6MTdQ
TSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPj4gPk9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgNzozMOKA
r0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gPj4KPj4gPj4g
T24gTW9uLCBPY3QgMDcsIDIwMjQgYXQgMDQ6MTc6NDdQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pj4gPj4gPk9uIFdlZCwgT2N0IDIsIDIwMjQgYXQgMTI6MjDigK9BTSBEZWVwYWsgR3VwdGEgPGRl
YnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4+ID4+Cj4+ID4+ID4+IFVzZXJzcGFjZSBzcGVj
aWZpZXMgQ0xPTkVfVk0gdG8gc2hhcmUgYWRkcmVzcyBzcGFjZSBhbmQgc3Bhd24gbmV3IHRocmVh
ZC4KPj4gPj4gPj4gYGNsb25lYCBhbGxvdyB1c2Vyc3BhY2UgdG8gc3BlY2lmeSBhIG5ldyBzdGFj
ayBmb3IgbmV3IHRocmVhZC4gSG93ZXZlcgo+PiA+PiA+PiB0aGVyZSBpcyBubyB3YXkgdG8gc3Bl
Y2lmeSBuZXcgc2hhZG93IHN0YWNrIGJhc2UgYWRkcmVzcyB3aXRob3V0IGNoYW5naW5nCj4+ID4+
ID4+IEFQSS4gVGhpcyBwYXRjaCBhbGxvY2F0ZXMgYSBuZXcgc2hhZG93IHN0YWNrIHdoZW5ldmVy
IENMT05FX1ZNIGlzIGdpdmVuLgo+PiA+PiA+Pgo+PiA+PiA+PiBJbiBjYXNlIG9mIENMT05FX1ZG
T1JLLCBwYXJlbnQgaXMgc3VzcGVuZGVkIHVudGlsIGNoaWxkIGZpbmlzaGVzIGFuZCB0aHVzCj4+
ID4+ID4+IGNhbiBjaGlsZCB1c2UgcGFyZW50IHNoYWRvdyBzdGFjay4gSW4gY2FzZSBvZiAhQ0xP
TkVfVk0sIENPVyBraWNrcyBpbgo+PiA+PiA+PiBiZWNhdXNlIGVudGlyZSBhZGRyZXNzIHNwYWNl
IGlzIGNvcGllZCBmcm9tIHBhcmVudCB0byBjaGlsZC4KPj4gPj4gPj4KPj4gPj4gPj4gYGNsb25l
M2AgaXMgZXh0ZW5zaWJsZSBhbmQgY2FuIHByb3ZpZGUgbWVjaGFuaXNtcyB1c2luZyB3aGljaCBz
aGFkb3cgc3RhY2sKPj4gPj4gPj4gYXMgYW4gaW5wdXQgcGFyYW1ldGVyIGNhbiBiZSBwcm92aWRl
ZC4gVGhpcyBpcyBub3Qgc2V0dGxlZCB5ZXQgYW5kIGJlaW5nCj4+ID4+ID4+IGV4dGVuc2l2ZWx5
IGRpc2N1c3NlZCBvbiBtYWlsaW5nIGxpc3QuIE9uY2UgdGhhdCdzIHNldHRsZWQsIHRoaXMgY29t
bWl0Cj4+ID4+ID4+IHdpbGwgYWRhcHQgdG8gdGhhdC4KPj4gPj4gPj4KPj4gPj4gPj4gU2lnbmVk
LW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4+ID4+ID4+IC0tLQo+
PiA+PiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmggfCAgMjUgKysrKysrKysK
Pj4gPj4KPj4gPj4gLi4uIHNuaXBwZWQuLi4KPj4gPj4KPj4gPj4gPj4gKwo+PiA+PiA+PiArLyoK
Pj4gPj4gPj4gKyAqIFRoaXMgZ2V0cyBjYWxsZWQgZHVyaW5nIGNsb25lL2Nsb25lMy9mb3JrLiBB
bmQgaXMgbmVlZGVkIHRvIGFsbG9jYXRlIGEgc2hhZG93IHN0YWNrIGZvcgo+PiA+PiA+PiArICog
Y2FzZXMgd2hlcmUgQ0xPTkVfVk0gaXMgc3BlY2lmaWVkIGFuZCB0aHVzIGEgZGlmZmVyZW50IHN0
YWNrIGlzIHNwZWNpZmllZCBieSB1c2VyLiBXZQo+PiA+PiA+PiArICogdGh1cyBuZWVkIGEgc2Vw
YXJhdGUgc2hhZG93IHN0YWNrIHRvby4gSG93IGRvZXMgc2VwYXJhdGUgc2hhZG93IHN0YWNrIGlz
IHNwZWNpZmllZCBieQo+PiA+PiA+PiArICogdXNlciBpcyBzdGlsbCBiZWluZyBkZWJhdGVkLiBP
bmNlIHRoYXQncyBzZXR0bGVkLCByZW1vdmUgdGhpcyBwYXJ0IG9mIHRoZSBjb21tZW50Lgo+PiA+
PiA+PiArICogVGhpcyBmdW5jdGlvbiBzaW1wbHkgcmV0dXJucyAwIGlmIHNoYWRvdyBzdGFjayBh
cmUgbm90IHN1cHBvcnRlZCBvciBpZiBzZXBhcmF0ZSBzaGFkb3cKPj4gPj4gPj4gKyAqIHN0YWNr
IGFsbG9jYXRpb24gaXMgbm90IG5lZWRlZCAobGlrZSBpbiBjYXNlIG9mICFDTE9ORV9WTSkKPj4g
Pj4gPj4gKyAqLwo+PiA+PiA+PiArdW5zaWduZWQgbG9uZyBzaHN0a19hbGxvY190aHJlYWRfc3Rh
Y2soc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssCj4+ID4+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFy
Z3MpCj4+ID4+ID4+ICt7Cj4+ID4+ID4+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCBzaXpl
Owo+PiA+PiA+PiArCj4+ID4+ID4+ICsgICAgICAgLyogSWYgc2hhZG93IHN0YWNrIGlzIG5vdCBz
dXBwb3J0ZWQsIHJldHVybiAwICovCj4+ID4+ID4+ICsgICAgICAgaWYgKCFjcHVfc3VwcG9ydHNf
c2hhZG93X3N0YWNrKCkpCj4+ID4+ID4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gPj4g
Pj4gKwo+PiA+PiA+PiArICAgICAgIC8qCj4+ID4+ID4+ICsgICAgICAgICogSWYgc2hhZG93IHN0
YWNrIGlzIG5vdCBlbmFibGVkIG9uIHRoZSBuZXcgdGhyZWFkLCBza2lwIGFueQo+PiA+PiA+PiAr
ICAgICAgICAqIHN3aXRjaCB0byBhIG5ldyBzaGFkb3cgc3RhY2suCj4+ID4+ID4+ICsgICAgICAg
ICovCj4+ID4+ID4+ICsgICAgICAgaWYgKGlzX3Noc3RrX2VuYWJsZWQodHNrKSkKPj4gPj4gPgo+
PiA+PiA+SGkgRGVlcGFrLAo+PiA+PiA+U2hvdWxkIGl0IGJlICchJyBpc19zaHN0a19lbmFibGVk
KHRzayk/Cj4+ID4+Cj4+ID4+IFllcyBpdCBpcyBhIGJ1Zy4gSXQgc2VlbXMgbGlrZSBmb3JrIHdp
dGhvdXQgQ0xPTkVfVk0gb3Igd2l0aCBDTE9ORV9WRk9SSywgaXQgd2FzIHJldHVybmluZwo+PiA+
PiAwIGFueXdheXMuIEFuZCBpbiB0aGUgY2FzZSBvZiBDTE9ORV9WTSAodXNlZCBieSBwdGhyZWFk
KSwgaXQgd2FzIG5vdCBkb2luZyB0aGUgcmlnaHQgdGhpbmcuCj4+ID4KPj4gPkhpIERlZXBhaywK
Pj4gPkknZCBsaWtlIHRvIGtub3cgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gQ291bGQgSSBr
bm93IHdoZXRoZXIgdGhlcmUKPj4gPm1pZ2h0IGFsc28gYmUgYSByaXNrIHdoZW4gdGhlIHVzZXIg
cHJvZ3JhbSBkb2Vzbid0IGVuYWJsZSB0aGUgQ0ZJIGFuZAo+PiA+dGhlIGtlcm5lbCBkb2Vzbid0
IGFjdGl2YXRlIENGSS4gQmVjYXVzZSB0aGlzIGZsb3cgd2lsbCBzdGlsbCB0cnkgdG8KPj4gPmFs
bG9jYXRlIHRoZSBzaGFkb3cgc3RhY2sgYW5kIGV4ZWN1dGUgdGhlIHNzYW1vd2FwIGNvbW1hbmQu
IFRoYW5rcwo+Pgo+PiBgc2hzdGtfYWxsb2NfdGhyZWFkX3N0YWNrYCBpcyBvbmx5IGNhbGxlZCBm
cm9tIGBjb3B5X3RocmVhZGAgYW5kICBhbGxvY2F0ZXMgYW5kCj4+IHJldHVybnMgbm9uLXplcm8g
KHBvc2l0aXZlIHZhbHVlKSBmb3Igc3NwIG9ubHkgaWYgYENMT05FX1ZNYCBpcyBzcGVjaWZpZWQu
Cj4+IGBDTE9ORV9WTWAgbWVhbnMgdGhhdCBhZGRyZXNzIHNwYWNlIGlzIHNoYXJlZCBhbmQgdXNl
cnNwYWNlIGhhcyBhbGxvY2F0ZWQKPj4gc2VwYXJhdGUgc3RhY2suIFRoaXMgZmxvdyBpcyBlbnN1
cmluZyB0aGF0IG5ld2x5IGNyZWF0ZWQgdGhyZWFkIHdpdGggc2VwYXJhdGUKPj4gZGF0YSBzdGFj
ayBnZXRzIGEgc2VwYXJhdGUgc2hhZG93IHN0YWNrIGFzIHdlbGwuCj4+Cj4+IFJldHJ1bmluZyB6
ZXJvIHZhbHVlIGZyb20gYHNoc3RrX2FsbG9jX3RocmVhZF9zdGFja2AgbWVhbnMgdGhhdCwgbm8g
bmVlZCB0bwo+PiBhbGxvY2F0ZSBhIHNoYWRvdyBzdGFjay4gSWYgeW91IGxvb2sgYXQgYGNvcHlf
dGhyZWFkYCBmdW5jdGlvbiwgaXQgc2ltcGx5IHNldHMKPj4gdGhlIHJldHVybmVkIHNzcCBpbiBu
ZXdseSBjcmVhdGVkIHRhc2sncyB0YXNrX3N0cnVjdCAoaWYgaXQgd2FzIG5vbi16ZXJvKS4KPj4g
SWYgcmV0dXJuZWQgc3NwIHdhcyB6ZXJvLCBgY29weV90aHJlYWRgIGRvZXNuJ3QgZG8gYW55dGhp
bmcuIFRodXMgd2hhdGV2ZXIgaXMKPj4gY3VycmVudCB0YXNrIHNldHRpbmdzIGFyZSB0aGF0IHdp
bGwgYmUgY29waWVkIG92ZXIgdG8gbmV3IGZvcmtlZC9jbG9uZWQgdGFzay4KPj4gSWYgY3VycmVu
dCB0YXNrIGhhZCBzaGFkb3cgc3RhY2sgZW5hYmxlZCwgbmV3IHRhc2sgd2lsbCBhbHNvIGdldCBp
dCBlbmFibGVkIGF0Cj4+IHNhbWUgYWRkcmVzcyAodG8gYmUgQ09XZWQgbGF0ZXIpLgo+Pgo+PiBB
bnkgdGFzayBnZXQgc2hhZG93IHN0YWNrIGVuYWJsZWQgZm9yIGZpcnN0IHRpbWUgdXNpbmcgbmV3
IHByY3RscyAoc2VlIHByY3RsCj4+IHBhdGNoZXMpLgo+Pgo+PiBTbyBvbmx5IHRpbWUgYHNzYW1v
c3dhcGAgd2lsbCBiZSBleGVyY2lzZWQgd2lsbCBiZSBhcmUKPj4gLSBVc2VyIGlzc3VlcyBlbmFi
bGluZyBgcHJjdGxgIChpdCdsbCBiZSBpc3N1ZWQgZnJvbSBsb2FkZXIpCj4+IC0gZm9yay9jbG9u
ZSBoYXBwZW5zCj4+Cj4+IEluIGJvdGggY2FzZXMsIGl0IGlzIGd1YXJkZWQgYWdhaW5zdCBjaGVj
a3Mgb2Ygd2hldGhlciBjcHUgc3VwcG9ydHMgaXQgYW5kIHRhc2sKPj4gaGFzIHNoYWRvdyBzdGFj
ayBlbmFibGVkLgo+Pgo+PiBMZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgSSBtaXNzZWQgYW55IGZs
b3cuCj4KPlRoYW5rcyBhIGxvdCBmb3IgdGhlIGRldGFpbCwgaXQgaXMgdmVyeSBoZWxwZnVsIGZv
ciBtZS4gQnV0IHNvcnJ5IGZvcgo+dGhlIGNvbmZ1c2lvbiwgbXkgcXVlc3Rpb24gaXMgYWN0dWFs
bHkgb24gdGhlIHNpdHVhdGlvbiB3aXRoIHRoaXMgYnVnCj4oaS5lLiwgYmVmb3JlIHRoZSBmaXgp
CgoKWWVhaCB3aXRoIHRoZSBidWcgKGkuZS4gYmVmb3JlIHRoZSBmaXgpLCB0aGlzIGZ1bmN0aW9u
IHdvdWxkIHN0aWxsIHJldHVybiAwCmZvciBgZm9ya2Agb3IgYGNsb25lYCB3aXRoIGAhQ0xPTkVf
Vk1gLiBBbmQgaWYgZXhpc3RpbmcgKGN1cnJlbnQpIHRocmVhZCBoYWQKc2hhZG93IHN0YWNrIGVu
YWJsZWQsIHRoYXQgd2lsbCBiZWNvbWUgc2hhZG93IHN0YWNrIGZvciBuZXcgdGhyZWFkIChDT1dl
ZCBsYXRlcikKClRoZSBidWcgd291bGQgc3VyZmFjZSBvbmx5IHdoZW4gYGNsb25lYCBpcyBjYWxs
ZWQgd2l0aCBgQ0xPTkVfVk1gIGFuZCBpbiB0aGF0IGNhc2UKaW5zdGVhZCBvZiBhbGxvY2F0aW5n
IGEgbmV3IHNoYWRvdyBzdGFjaywgaXQgd291bGQgYmUgcmUtdXNpbmcgc2FtZSBzaGFkb3cgc3Rh
Y2sKZm9yIGJvdGggYHB0aHJlYWRzYC4KCkluIGFueWNhc2UsIHRoYW5rcyBhZ2FpbiBmb3Igbm90
aWNpbmcgYW5kIGJyaW5naW5nIGl0IHVwLgoKPgo+Pgo+PiA+Cj4+ID4+IE1vc3Qgb2YgdGhlIHRl
c3RpbmcgaGFzIGJlZW4gd2l0aCBidXN5Ym94IGJ1aWxkIChpbmRlcGVuZGVudCBiaW5hcmllczAg
ZHJpdmVuIHZpYSBidWlsZHJvb3QKPj4gPj4gc2V0dXAuIFdvbmRlcmluZyB3aHkgaXQgd2Fzbid0
IGNhdWdodC4KPj4gPj4KPj4gPj4gQW55d2F5cywgd2lsbCBmaXggaXQuIFRoYW5rcyBmb3IgY2F0
Y2hpbmcgaXQuCj4+ID4+Cj4+ID4+ID4KPj4gPj4gPj4gKyAgICAgICAgICAgICAgIHJldHVybiAw
Owo+PiA+PiA+PiArCj4+ID4+ID4+ICsgICAgICAgLyoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
