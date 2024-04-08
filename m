Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7F5C67861
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HI6xl0cVCCAFXzxFrZ1Lx+Wgsz92SPMNhlToz7+v7Ds=; b=ue/Wpy0LzXkxZI
	swfYCrNouSfc80emKbetjADmPwBIln0qbghFkit5389oE/oJoAbYTXcY8/OhSypwSC7Lbm6RrCJPX
	Zpjul4VVoMPRp02zUQb3B5Uo650kzKXnerDqwXvv5YAMj0dprqPUvfIfw/1OvmQ5GHgD8V+//hfjB
	9zsmjiS17HtnUiwx7Cpykh1nUtuExGE81K67jI3mImbXygs+gSY53LiJBfNW8puTZSQvoI7Z40bl9
	nCKm309NaFzs7F3gsEqk15fVOyi2S5MWCYb4wZTR/hfnVAv4AB3PNZEIkgV/XmUNG/GkhXy8vIYdD
	Fj8e9bQDvx0hIkolrsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtmnD-0000000FKRD-3Vcc;
	Mon, 08 Apr 2024 11:04:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtmn9-0000000FKQ8-0k4B
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 11:04:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a51e368c6dcso4740966b.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712574236; x=1713179036; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4g1Fe38jasdHywEL2euSnsmLnhOpgJ82XZytSUr/W9Q=;
        b=l424SJLWEKDlzPGDu2ipwmvcNfnWchG3qxZ+ySSfFNTZyMz6FzInASfXgpUiQJmvn8
         Ma/ekp/myS4XThESD47qWBXh1EcwpFVtCngXs+9TznP2U0OofQGTfkLQ8gaJOKk+/YOP
         VYHZLjoUnH/bicZ0vHOCCu4Ph9wVO5WcFNCoKGo9NzUSorBb90ngbE3CGF6DsU+PHYoc
         XTQuoBc4MRzMtFPqRMl0PIvdVhZeIN03e40rdlCa03o4pvsZcojOJF+Juns2alHPr8wI
         AXqiWZV5+Bw9Mcby6mjgIEvaxucw/l/NnerTIEaHGLQeOsKnWN74pT2s1YSpQaCmo7ju
         8YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712574236; x=1713179036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4g1Fe38jasdHywEL2euSnsmLnhOpgJ82XZytSUr/W9Q=;
        b=UvCYSFgnmFKDFjLsmSQOx+RI90S8HuUtnrFQt+Q65esC22MAcAYLX4rvsMlx7xM1zq
         U/VqHDacfm7ulAGGnv9YYY+EakvmTiVhMw/hPx7D8ivAZ9c+o4zL91p6VEEuCTUZttSb
         5dYQhHK74m16a4N+4lzU35EsCoAVRtRT2YjNagYIJCB4kVM3kXQ5szOf/ACbyiJkKY1s
         UKeqGjC59OXEXiADcTtcuYle4Tk1EMEvPlZPyaF96xG+CgYr7CV3yKCKKzy8vhrm8N58
         mn/2L1TRklk6Cjoc0dpFCAgH7WhsRhTsi198Vagqpn7JrlfQsNaT7jS6g93abCqClnrO
         uQQw==
X-Forwarded-Encrypted: i=1; AJvYcCUFATtGQazZTLtMfcRvHrZWOW/RC9xzM0XKhDoZ0fIJP6Y6ywYXbTo0iMIwyR8ZHatttkWYUEvrZh7zOLAjfZMBJdF5opoRpdaf05exsVjx
X-Gm-Message-State: AOJu0YyKzCNU0a0IitgCVkOojooqakIKqnN9B3YqPhU+/2l563+c1BE5
	Y+RoWYZR3isCvhfG5K+5rgsJZxTlzo+wnGzblVbebhV13tmwfsXWoDCmC+cjK1o=
X-Google-Smtp-Source: AGHT+IGnIHRj0+4dG4NgzsNXCqgJTww4f9iaHdQi6M7w7Zma3E/8aHUoufLLnKT3jNOOK2m1ikAHoA==
X-Received: by 2002:a17:906:31d4:b0:a46:da28:992e with SMTP id f20-20020a17090631d400b00a46da28992emr5801257ejf.71.1712574236283;
        Mon, 08 Apr 2024 04:03:56 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b15-20020a170906d10f00b00a4df4243473sm4279042ejz.4.2024.04.08.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:03:55 -0700 (PDT)
Date: Mon, 8 Apr 2024 13:03:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
Message-ID: <20240408-6c93f3f50b55234f3825ca33@orel>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
 <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_040359_274714_7B7D24EE 
X-CRM114-Status: GOOD (  30.35  )
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

T24gTW9uLCBBcHIgMDgsIDIwMjQgYXQgMTA6MDE6MTJBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDA1LzA0LzIwMjQgMTk6MzMsIERlZXBhayBHdXB0YSB3cm90ZToK
PiA+IE9uIEZyaSwgQXByIDUsIDIwMjQgYXQgODoyNuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVGh1LCBBcHIgMDQsIDIwMjQg
YXQgMTI6MzI6NDZQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+ID4+PiBUaGUgWmlt
b3AgSVNBIGV4dGVuc2lvbiB3YXMgcmF0aWZpZWQgcmVjZW50bHkuIFRoaXMgc2VyaWVzIGFkZHMg
c3VwcG9ydAo+ID4+PiBmb3IgcGFyc2luZyBpdCBmcm9tIHJpc2N2LGlzYSwgaHdwcm9iZSBleHBv
cnQgYW5kIGt2bSBzdXBwb3J0IGZvcgo+ID4+PiBHdWVzdC9WTS4KPiA+Pgo+ID4+IEknbSBub3Qg
c3VyZSB3ZSBuZWVkIHRoaXMuIFppbW9wIGJ5IGl0c2VsZiBpc24ndCB1c2VmdWwsIHNvIEkgZG9u
J3Qga25vdwo+ID4+IGlmIHdlIG5lZWQgdG8gYWR2ZXJ0aXNlIGl0IGF0IGFsbC4gV2hlbiBhbiBl
eHRlbnNpb24gY29tZXMgYWxvbmcgdGhhdAo+ID4+IHJlZGVmaW5lcyBzb21lIE1PUHMsIHRoZW4g
d2UnbGwgYWR2ZXJ0aXNlIHRoYXQgZXh0ZW5zaW9uLCBidXQgdGhlIGZhY3QKPiA+PiBaaW1vcCBp
cyB1c2VkIGZvciB0aGF0IGV4dGVuc2lvbiBpcyByZWFsbHkganVzdCBhbiBpbXBsZW1lbnRhdGlv
biBkZXRhaWwuCj4gPiAKPiA+IE9ubHkgc2l0dWF0aW9uIEkgc2VlIHRoaXMgY2FuIGJlIHVzZWZ1
bCBpcyB0aGlzOi0tCj4gPiAKPiA+IEFuIGltcGxlbWVudGVyLCBpbXBsZW1lbnRlZCBaaW1vcHMg
aW4gQ1BVIHNvbGVseSBmb3IgdGhlIHB1cnBvc2UgdGhhdCB0aGV5IGNhbgo+ID4gcnVuIG1haW5s
aW5lIGRpc3RybyAmIHBhY2thZ2VzIG9uIHRoZWlyIGhhcmR3YXJlIGFuZCBkb24ndCB3YW50IHRv
IGxldmVyYWdlIGFueQo+ID4gZmVhdHVyZSB3aGljaCBhcmUgYnVpbHQgb24gdG9wIG9mIFppbW9w
Lgo+IAo+IFllcywgdGhlIHJhdGlvbmFsZSB3YXMgdGhhdCBzb21lIGJpbmFyaWVzIHVzaW5nIGV4
dGVuc2lvbnMgdGhhdCBvdmVybG9hZAo+IE1PUHMgY291bGQgc3RpbGwgYmUgcnVuLiBXaXRoIFpp
bW9wIGV4cG9zZWQsIHRoZSBsb2FkZXIgY291bGQgZGV0ZXJtaW5lCj4gaWYgdGhlIGJpbmFyeSBj
YW4gYmUgZXhlY3V0ZWQgd2l0aG91dCBwb3RlbnRpYWxseSBjcmFzaGluZy4gV2UgY291bGQKPiBh
bHNvIGxldCB0aGUgcHJvZ3JhbSBydW4gYW55d2F5IGJ1dCB0aGUgZXhlY3V0aW9uIGNvdWxkIHBv
dGVudGlhbGx5Cj4gY3Jhc2ggdW5leHBlY3RlZGx5LCB3aGljaCBJTUhPIGlzIG5vdCByZWFsbHkg
Z29vZCBmb3IgdGhlIHVzZXIKPiBleHBlcmllbmNlIG5vciBmb3IgZGVidWdnaW5nLiBJIGFscmVh
ZHkgdGhpbmsgdGhhdCB0aGUgc2VnZmF1bHRzIHdoaWNoCj4gaGFwcGVucyB3aGVuIGV4ZWN1dGlu
ZyBiaW5hcmllcyB0aGF0IG5lZWQgc29tZSBtaXNzaW5nIGV4dGVuc2lvbiBhcmUgbm90Cj4gc28g
ZWFzeSB0byBkZWJ1Zywgc28gYmV0dGVyIGFkZCBtb3JlIGd1YXJkcy4KCk9LLiBJdCdzIG9ubHkg
b25lIG1vcmUgZXh0ZW5zaW9uIG91dCBvZiBkb3plbnMsIHNvIEkgd29uJ3QgY29tcGxhaW4gbW9y
ZSwKYnV0IEkgd2FzIHRoaW5raW5nIHRoYXQgYmluYXJpZXMgdGhhdCB1c2UgcGFydGljdWxhciBl
eHRlbnNpb25zIHdvdWxkCmNoZWNrIGZvciB0aG9zZSBwYXJ0aWN1bGFyIGV4dGVuc2lvbnMgKHN0
ZXAgMiksIHJhdGhlciB0aGFuIFppbW9wLgoKVGhhbmtzLApkcmV3Cgo+IAo+ID4gCj4gPiBBcyBh
biBleGFtcGxlIHppY2ZpbHAgYW5kIHppY2Zpc3MgYXJlIGRlcGVuZGVudCBvbiB6aW1vcHMuIGds
aWJjIGNhbgo+ID4gZG8gZm9sbG93aW5nCj4gPiAKPiA+IDEpIGNoZWNrIGVsZiBoZWFkZXIgaWYg
YmluYXJ5IHdhcyBjb21waWxlZCB3aXRoIHppY2Zpc3MgYW5kIHppY2ZpbHAsCj4gPiBpZiB5ZXMg
Z290byBzdGVwIDIsIGVsc2UgZ290byBzdGVwIDYuCj4gPiAyKSBjaGVjayBpZiB6aWNmaXNzL3pp
Y2ZpbHAgaXMgYXZhaWxhYmxlIGluIGh3IHZpYSBod3Byb2JlLCBpZiB5ZXMKPiA+IGdvdG8gc3Rl
cCA1LiBlbHNlIGdvdG8gc3RlcCAzCj4gPiAzKSBjaGVjayBpZiB6aW1vcCBpcyBhdmFpbGFibGUg
dmlhIGh3cHJvYmUsIGlmIHllcyBnb3RvIHN0ZXAgNiwgZWxzZSBnb3RvIHN0ZXAgNAo+IAo+IEkg
dGhpbmsgeW91IG1lYW50IHN0ZXAgNSByYXRoZXIgdGhhbiBzdGVwIDYuCj4gCj4gQ2zDqW1lbnQK
PiAKPiA+IDQpIFRoaXMgYmluYXJ5IHdvbid0IGJlIGFibGUgdG8gcnVuIHN1Y2Nlc3NmdWxseSBv
biB0aGlzIHBsYXRmb3JtLAo+ID4gaXNzdWUgZXhpdCBzeXNjYWxsLiA8LS0gdGVybWluYXRpb24K
PiA+IDUpIGlzc3VlIHByY3RsIHRvIGVuYWJsZSBzaGFkb3cgc3RhY2sgYW5kIGxhbmRpbmcgcGFk
IGZvciBjdXJyZW50IHRhc2sKPiA+IDwtLSBlbmFibGUgZmVhdHVyZQo+ID4gNikgbGV0IHRoZSBi
aW5hcnkgcnVuIDwtLSBsZXQgdGhlIGJpbmFyeSBydW4gYmVjYXVzZSBubyBoYXJtIGNhbiBiZSBk
b25lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
