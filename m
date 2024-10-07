Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B5CED24C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQC33lXbAhvHFTLoqW+Glq2+3NP+mczzKZlNZoNE9pI=; b=pUYBOXObK+zR3k5O05mAZFxO8E
	yQYZ7fLe1xO/qRQSMn9kshU8CoZYu845/VIaQv5PPMG3E5xsM8XcneOwpME5cECdgjxb5mfBODW00
	wBhsmtVczA567PjC1drdlmx6Jbj3Gos47kS/TAoEcoAQ9agkgQWeJnAu1gYrgPjBH9rvwaK4LdqbW
	4nWFFB4XNb08OQBq+g09SdS/bS79y2C1Vk0vw4A3WoHFHlRi5t8IyUQ2c+LRxM5AngFky9XamKTAf
	+aS/GiY098Ol2RMgHJETLIyMKxHyxqW0WveWfVi8P077wsbU4GXMWspe1Sg8L+a9nfS80+DaboLke
	uJWX9CBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxBA-000000041fg-2B4N;
	Mon, 07 Oct 2024 23:30:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxB7-000000041f0-2HrL
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 23:30:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e02249621so1118015b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 16:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728343812; x=1728948612; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e7/GR1vy5g6MzSW/6AGsBA6lPgGhyPg9oR0WwZB3CYI=;
        b=J2dPzNsbIy/zrYjg+SQp51wzXiLSQr/Ojvaun2/LJJn/d9ax+F52GYN9Eh2/Xj5q02
         RH6x/Qtv7LMCpfdC03tNuacqiUs4pioznC/5KTC3YN9xhLaodvsZcu52HFvUwnOQSpj4
         YZ6UGKQehJ7AQoPzATkgBAzKa2nvbeTO0ponmPnGKjC+jpq3U5UqfDAOEGSE8vLD2oyl
         /tx2VgoNcx/DZV8YL2tsFVE50zzB9hAwZpCW7+SdHRrFdb5eLAXexKcCoO1+bpT84fUe
         jldxiQo2V9J4hmIj4kBipf79OqjMBnP4kKL0kRE91gDhJc+KppQ+fONU/OKIrn/aEjef
         seJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728343812; x=1728948612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7/GR1vy5g6MzSW/6AGsBA6lPgGhyPg9oR0WwZB3CYI=;
        b=Vz5LS68nv+h2cugxq79WdWtZK6261vZL9DDD0kZg9+6dBGlDJxafoG89Qp+i8n2yTD
         rE2gVmKBE+1Z0fye2z19VCRGS+vSX/4aUTEzJYVdJ8CZdWD3vLKCTpBX8sMCrBDtW0DG
         g7/Uwcy7v//Fj2lMoZtVDy6IrJEzWtwAzPJkRWFpMvo3btvBmRfthynPdpnjQCmAtNix
         bDJI/PJ+TGf2V3z7CwB2OjoEgB1IbNSq8PcqxkUinFbCeWqcdQQzNAdRiPytK8zvzeTq
         YhYTmjuzqZncNZ/9kUh6nUzbt4pMqVcr8+TKISl09x4o7lTmGrfwAIZO1jXT1s+BORWD
         DcXA==
X-Forwarded-Encrypted: i=1; AJvYcCX4BVmLWlEiblRAV4uWev+qdwsxGFVBMIG3+hFS5y0x2jp3pf/E8ToyJCyoCztBTzt0lfExIaQO9cAWwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmzafF97wWNrISUGggOt7uSdp6YXgQhdzq58d4bMCqX6T7MOIJ
	cOZQXyFIHlp0lEaELtnO3hrlai1s7Xv8CRKDMZERx7jqlm8fUjNaei6siYk8+vI=
X-Google-Smtp-Source: AGHT+IGbBDU9FuYkbc/ROL+eEuwX1ANHvoegHjKgVYPBMiJcEOGbwaOtHTQqomqAdeFDnRJFbE5XwQ==
X-Received: by 2002:a05:6a00:8a03:b0:71d:ee1b:c854 with SMTP id d2e1a72fcca58-71dee1bcacamr11916142b3a.9.1728343812103;
        Mon, 07 Oct 2024 16:30:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbba1csm4970382b3a.33.2024.10.07.16.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 16:30:11 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:30:08 -0700
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
Message-ID: <ZwRvAEwFbrpq3zZq@debug.ba.rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-16-3ba65b6e550f@rivosinc.com>
 <CANXhq0rpwQkZ9+mZLGVUq=r4WiA8BbZ-eeTDogf3fzeEPqeeqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0rpwQkZ9+mZLGVUq=r4WiA8BbZ-eeTDogf3fzeEPqeeqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_163013_892073_1D3A8136 
X-CRM114-Status: GOOD (  23.66  )
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

T24gTW9uLCBPY3QgMDcsIDIwMjQgYXQgMDQ6MTc6NDdQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFdlZCwgT2N0IDIsIDIwMjQgYXQgMTI6MjDigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IFVzZXJzcGFjZSBzcGVjaWZpZXMgQ0xPTkVfVk0gdG8g
c2hhcmUgYWRkcmVzcyBzcGFjZSBhbmQgc3Bhd24gbmV3IHRocmVhZC4KPj4gYGNsb25lYCBhbGxv
dyB1c2Vyc3BhY2UgdG8gc3BlY2lmeSBhIG5ldyBzdGFjayBmb3IgbmV3IHRocmVhZC4gSG93ZXZl
cgo+PiB0aGVyZSBpcyBubyB3YXkgdG8gc3BlY2lmeSBuZXcgc2hhZG93IHN0YWNrIGJhc2UgYWRk
cmVzcyB3aXRob3V0IGNoYW5naW5nCj4+IEFQSS4gVGhpcyBwYXRjaCBhbGxvY2F0ZXMgYSBuZXcg
c2hhZG93IHN0YWNrIHdoZW5ldmVyIENMT05FX1ZNIGlzIGdpdmVuLgo+Pgo+PiBJbiBjYXNlIG9m
IENMT05FX1ZGT1JLLCBwYXJlbnQgaXMgc3VzcGVuZGVkIHVudGlsIGNoaWxkIGZpbmlzaGVzIGFu
ZCB0aHVzCj4+IGNhbiBjaGlsZCB1c2UgcGFyZW50IHNoYWRvdyBzdGFjay4gSW4gY2FzZSBvZiAh
Q0xPTkVfVk0sIENPVyBraWNrcyBpbgo+PiBiZWNhdXNlIGVudGlyZSBhZGRyZXNzIHNwYWNlIGlz
IGNvcGllZCBmcm9tIHBhcmVudCB0byBjaGlsZC4KPj4KPj4gYGNsb25lM2AgaXMgZXh0ZW5zaWJs
ZSBhbmQgY2FuIHByb3ZpZGUgbWVjaGFuaXNtcyB1c2luZyB3aGljaCBzaGFkb3cgc3RhY2sKPj4g
YXMgYW4gaW5wdXQgcGFyYW1ldGVyIGNhbiBiZSBwcm92aWRlZC4gVGhpcyBpcyBub3Qgc2V0dGxl
ZCB5ZXQgYW5kIGJlaW5nCj4+IGV4dGVuc2l2ZWx5IGRpc2N1c3NlZCBvbiBtYWlsaW5nIGxpc3Qu
IE9uY2UgdGhhdCdzIHNldHRsZWQsIHRoaXMgY29tbWl0Cj4+IHdpbGwgYWRhcHQgdG8gdGhhdC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4+
IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmggfCAgMjUgKysrKysrKysK
Ci4uLiBzbmlwcGVkLi4uCgo+PiArCj4+ICsvKgo+PiArICogVGhpcyBnZXRzIGNhbGxlZCBkdXJp
bmcgY2xvbmUvY2xvbmUzL2ZvcmsuIEFuZCBpcyBuZWVkZWQgdG8gYWxsb2NhdGUgYSBzaGFkb3cg
c3RhY2sgZm9yCj4+ICsgKiBjYXNlcyB3aGVyZSBDTE9ORV9WTSBpcyBzcGVjaWZpZWQgYW5kIHRo
dXMgYSBkaWZmZXJlbnQgc3RhY2sgaXMgc3BlY2lmaWVkIGJ5IHVzZXIuIFdlCj4+ICsgKiB0aHVz
IG5lZWQgYSBzZXBhcmF0ZSBzaGFkb3cgc3RhY2sgdG9vLiBIb3cgZG9lcyBzZXBhcmF0ZSBzaGFk
b3cgc3RhY2sgaXMgc3BlY2lmaWVkIGJ5Cj4+ICsgKiB1c2VyIGlzIHN0aWxsIGJlaW5nIGRlYmF0
ZWQuIE9uY2UgdGhhdCdzIHNldHRsZWQsIHJlbW92ZSB0aGlzIHBhcnQgb2YgdGhlIGNvbW1lbnQu
Cj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHNpbXBseSByZXR1cm5zIDAgaWYgc2hhZG93IHN0YWNrIGFy
ZSBub3Qgc3VwcG9ydGVkIG9yIGlmIHNlcGFyYXRlIHNoYWRvdwo+PiArICogc3RhY2sgYWxsb2Nh
dGlvbiBpcyBub3QgbmVlZGVkIChsaWtlIGluIGNhc2Ugb2YgIUNMT05FX1ZNKQo+PiArICovCj4+
ICt1bnNpZ25lZCBsb25nIHNoc3RrX2FsbG9jX3RocmVhZF9zdGFjayhzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRzaywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKPj4gK3sKPj4gKyAgICAgICB1bnNp
Z25lZCBsb25nIGFkZHIsIHNpemU7Cj4+ICsKPj4gKyAgICAgICAvKiBJZiBzaGFkb3cgc3RhY2sg
aXMgbm90IHN1cHBvcnRlZCwgcmV0dXJuIDAgKi8KPj4gKyAgICAgICBpZiAoIWNwdV9zdXBwb3J0
c19zaGFkb3dfc3RhY2soKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+PiArCj4+ICsg
ICAgICAgLyoKPj4gKyAgICAgICAgKiBJZiBzaGFkb3cgc3RhY2sgaXMgbm90IGVuYWJsZWQgb24g
dGhlIG5ldyB0aHJlYWQsIHNraXAgYW55Cj4+ICsgICAgICAgICogc3dpdGNoIHRvIGEgbmV3IHNo
YWRvdyBzdGFjay4KPj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBpZiAoaXNfc2hzdGtfZW5hYmxl
ZCh0c2spKQo+Cj5IaSBEZWVwYWssCj5TaG91bGQgaXQgYmUgJyEnIGlzX3Noc3RrX2VuYWJsZWQo
dHNrKT8KClllcyBpdCBpcyBhIGJ1Zy4gSXQgc2VlbXMgbGlrZSBmb3JrIHdpdGhvdXQgQ0xPTkVf
Vk0gb3Igd2l0aCBDTE9ORV9WRk9SSywgaXQgd2FzIHJldHVybmluZwowIGFueXdheXMuIEFuZCBp
biB0aGUgY2FzZSBvZiBDTE9ORV9WTSAodXNlZCBieSBwdGhyZWFkKSwgaXQgd2FzIG5vdCBkb2lu
ZyB0aGUgcmlnaHQgdGhpbmcuCk1vc3Qgb2YgdGhlIHRlc3RpbmcgaGFzIGJlZW4gd2l0aCBidXN5
Ym94IGJ1aWxkIChpbmRlcGVuZGVudCBiaW5hcmllczAgZHJpdmVuIHZpYSBidWlsZHJvb3QKc2V0
dXAuIFdvbmRlcmluZyB3aHkgaXQgd2Fzbid0IGNhdWdodC4KCkFueXdheXMsIHdpbGwgZml4IGl0
LiBUaGFua3MgZm9yIGNhdGNoaW5nIGl0LgoKPgo+PiArICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4+ICsKPj4gKyAgICAgICAvKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
