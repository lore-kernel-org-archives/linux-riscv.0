Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A512C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46e1JMFqM2Vo3FTkP2JfXZ6gCjglmUqhyutiNrQ1g+g=; b=l6CmULsaOW3dVl
	iwP1Iio+S/0A3iR9cotSzKTo4cIzLAmPrXa/7nF8k8njY/5FbuzZQhNf59w7v+UI9dhEtqh49skPa
	+CPvb5w3WEecmKRzDetBVxP0KcPKKmXYpV5U/x6E4ls/1uIS94tKTuSkUnhh9RjC7qzijzSw8228c
	WDVNCr73PBg0hc//jUhPfwMBGkdBknqFUr4UUfZ6YCbdRwWaIJ/fr6QiqkFasj1fCNDr7xgKttp42
	ytHo+TnCgUWxv2paX06EzSSwJc7S0M2mPclsTDLsRgqh4C2nz7bcnpUQYko92BEYGe64c9uwI7gHX
	/1MIHjpT9AcrFVuYiw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fjC-00000005oYD-4Ajo;
	Tue, 15 Apr 2025 12:49:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fhN-00000005oGl-0Tzk
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 12:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744721252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h5hzw3UWlyBWtKaqUctLttnh3UnjKuRPZkqWKkRDgxc=;
	b=fZ1gvCJYBFaSwdk6qbr1Z3tOpJnZuhmdJJ7PmgvtmghbjoGHtRfJjcEP0EsWWWzI+BGfqi
	5Avt9zLX526QOpmSN27qf2rhulO8GWm0pBWA+lvvkoPUfoKq8ZtLF78pPcAlo8iY66VF1v
	B8AW+MQsn5udpAq9vra3MDQ+LY8+rHQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-3BhMSOQVMeuOwwgLHMjjCA-1; Tue, 15 Apr 2025 08:47:25 -0400
X-MC-Unique: 3BhMSOQVMeuOwwgLHMjjCA-1
X-Mimecast-MFC-AGG-ID: 3BhMSOQVMeuOwwgLHMjjCA_1744721245
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so44906015e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721244; x=1745326044;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnvL/RzrZbvMsU8LLxk8J6aVRTg+wYgjgOPs3GeZ1OI=;
        b=B8vsO02tDaqvuofF+xxVYS05iz3KKF3vvk4WNcJOXATTWotjgr6LMuEKXv38jLK/LA
         k8DAQzES7B8rIpstjpuCa2eGwo/2/rYJAEseHxhI2b08QHzm3Hac6mXzqvZl25/tlpxS
         j9y6Px6+EUSaY7JFJ1dpYgPrVOkIxJB18MbuQt2WSo5zTV8A05lE5jkqj5Uzzd66v8Pn
         61C12vuZ9rcZZGJd8BZbw7K2DSe7TRHa+AlhZRZPiXwpUy9/jW+k1eQmCL6h85TFdFTH
         0fYh9kZQDVx27d8MIHCIF05wqYAF4VbRKIdEroMuFJFZwznEIycFl8qyasAo1iVaR+Rw
         b/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUyEZaSX/3V3oh8a0PzmGugD6IJFZM5Ofcmd8kI687pxTR9tOyRDbowA351xhhVGh9mYPWqW1OKEnGTyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6MwQSbbKJnh9iHWYV0UeoOI4GMJRVaheB8nkFe1ogcgqlEgU2
	TkqDaaZYKZYzx3pwnG0rjfBTDJfPLu+sk7ZCvMav5bjlwFEDnl8gK6wjmXuYJpoOn5ybDaVLPI4
	LhIBDIHulgxFC5GbPiuer9vvvHHwCF7WYSjYYDmB7h/FwICzfwDMisLFwMtb1OVxLng==
X-Gm-Gg: ASbGnct/c6Dku4fYRb2RuL18PFV/OmYLVUlhNyRdQVBuLtf4Xy/CmFDT7nqk25k36IY
	anJAULlolDbZphmYI5W5t9yFOQEIsZMxOFG+DaskdnMMzlCkC1tduTdhj940F4evAJIPo8vzlwe
	NyORUxUgszXQyQCJSeXv3bk5TKE7XheWE4GFKvaOX0iReKBCxq1soLoGLP0Ww9+rUoFrk7Z2XZT
	p3Iq1Txn9Z/lITB8bu1F+r+GC2h/tZ8hcndhvHUxTjnKuiusgsNxYUk6lqBeO0haybH+x1pfBuO
	RvZhbD9NqNfXIpHH7dtj1KUA+9S7jhdr2qg0QBY=
X-Received: by 2002:a05:6000:40cb:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39edbecab22mr2873539f8f.58.1744721244537;
        Tue, 15 Apr 2025 05:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXUPk+FI5lntzdi59X0ntV/dg2Dh/FHAzlX7wLgVi/RsI8JfnVsjgzuQyhk0RPvQ5MlNQflQ==
X-Received: by 2002:a05:6000:40cb:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39edbecab22mr2873509f8f.58.1744721244204;
        Tue, 15 Apr 2025 05:47:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm14314316f8f.68.2025.04.15.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:47:23 -0700 (PDT)
Message-ID: <241fb4fa91f8e57d2bcc992b6a4fb3fffc9c87fc.camel@redhat.com>
Subject: Re: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Thomas Gleixner	 <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov	 <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"	
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra	
 <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 15 Apr 2025 14:47:21 +0200
In-Reply-To: <20250415123807.2MahJd60@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
	 <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
	 <20250415123807.2MahJd60@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ev_9nXWbo8_CBgTbSxUV_lPBogIoQGfvbX3F0uloGw_1744721245
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_054733_222609_6C46CB6B 
X-CRM114-Status: GOOD (  18.44  )
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

CgpPbiBUdWUsIDIwMjUtMDQtMTUgYXQgMTQ6MzggKzAyMDAsIE5hbSBDYW8gd3JvdGU6Cj4gT24g
VHVlLCBBcHIgMTUsIDIwMjUgYXQgMDI6MzE6NDNQTSArMDIwMCwgR2FicmllbGUgTW9uYWNvIHdy
b3RlOgo+ID4gT24gRnJpLCAyMDI1LTA0LTExIGF0IDA5OjM3ICswMjAwLCBOYW0gQ2FvIHdyb3Rl
Ogo+ID4gPiArc3RhdGljIGludCBfX2luaXQgcmVnaXN0ZXJfcGFnZWZhdWx0KHZvaWQpCj4gPiA+
ICt7Cj4gPiA+ICsJcnZfcmVnaXN0ZXJfbW9uaXRvcigmcnZfcGFnZWZhdWx0LCAmcnZfcnRhcHAp
Owo+ID4gPiArCXJldHVybiAwOwo+ID4gCj4gPiBBbnkgcmVhc29uIHdoeSB5b3UgYXJlbid0IHJl
dHVybmluZyB0aGUgZXJyb3IgdmFsdWUgZnJvbSB0aGUKPiA+IG1vbml0b3IKPiA+IHJlZ2lzdHJh
dGlvbj8KPiAKPiBDb3B5LXBhc3RlIGZyb20gZG90MmsgOlAKCk1taCwgeW91J3JlIHJpZ2h0ISBB
bGwgb3RoZXIgbW9uaXRvcnMgYXJlIGJyb2tlbiBpbiB0aGlzIHNlbnNlLi4KCj4gCj4gPiBPdGhl
ciB0aGFuIHRoYXQsIHRoZSBtb25pdG9yIHNlZW1zIG5lYXQgYW5kIHJlYXNvbmFibHkgZWFzeSB0
bwo+ID4gZ2VuZXJhdGUuCj4gPiAKPiA+IE1heSBub3QgYmUgbmVjZXNzYXJ5IGluIHRoaXMgc2Vy
aWVzLCBidXQgdHJ5IHRvIGtlZXAgY29tcGF0aWJpbGl0eQo+ID4gd2l0aAo+ID4gdGhlIHVzZXJz
cGFjZSBSViB0b29sIGFzIHdlbGwsIHlvdSBuZWVkIHRvIGhhdmUgc29tZSBzcGVjaWFsIGNhc2UK
PiA+IGluCj4gPiBpdHMgdHJhY2luZyBjb21wb25lbnRzIGJlY2F1c2UgZmllbGRzIGFyZSBub3Qg
bWF0Y2hpbmc6Cj4gPiDCoCMgcnYgbW9uIHNsZWVwIC10Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIHJj
dWMvMTEtMTA4wqDCoMKgwqDCoCBbMDExXSBldmVudCA8Q0FOVCBGSU5EIEZJRUxECj4gPiBmaW5h
bF9zdGF0ZT7CoMKgIAo+ID4gKG51bGwpIHggKG51bGwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0+IChudWxsKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBZCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHJjdWMvMTEtMTA4wqDCoMKgwqDCoCBbMDExXSBldmVu
dCA8Q0FOVCBGSU5EIEZJRUxECj4gPiBmaW5hbF9zdGF0ZT7CoMKgIAo+ID4gKG51bGwpIHggKG51
bGwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0+IChudWxsKcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBZCj4gPiDCoMKgwqDCoMKgIGt0aW1lcnMvMTEt
MTA5wqDCoMKgwqDCoCBbMDExXSBldmVudCA8Q0FOVCBGSU5EIEZJRUxECj4gPiBmaW5hbF9zdGF0
ZT7CoMKgIAo+ID4gKG51bGwpIHggKG51bGwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0+IChudWxsKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBZCj4g
Cj4gSSBoYXZlIHRoaXMgdXNlcnNwYWNlIFJWIHRvb2wgaW4gbXkgImxhdGVyIiBUT0RPIGxpc3Qs
IGlmIHRoYXQncwo+IG9rYXkuCj4gCj4gSG9uZXN0bHksIEkgaGF2ZW4ndCBsb29rZWQgYXQgd2hh
dCBpdCBkb2VzIHlldC4gcGVyZiBhbHJlYWR5IGRvZXMKPiB3aGF0IEkKPiBuZWVkLgoKWWVhaCwg
bm8gcnVzaCwgdGhlIHRvb2wgaXMgbW9zdGx5IGZvciBlbmFibGluZyB0aGUgbW9uaXRvciBhbmQg
cmVhY3RvcnMKaW4gYSBzaW5nbGUgY29tbWFuZCwgdGhlIHJlc3QgKHRyYWNpbmcpIHlvdSBjYW4g
YWxyZWFkeSBkbyB3aXRoIHBlcmYsCnRyYWNlLWNtZCBhbmQgZnJpZW5kcywgYWZ0ZXIgZW5hYmxp
bmcgdGhlIG1vbml0b3IgbWFudWFsbHksIG9mIGNvdXJzZS4KCldlIG1heSBldmVuIGNvbnNpZGVy
IGludGVncmF0aW5nIFJWIGluIG90aGVyIHRvb2xzIGluc3RlYWQgb2YKbWFpbnRhaW5pbmcgYSBz
ZXBhcmF0ZSBvbmUsIGJ1dCB0aGF0J3MgZm9yIGFub3RoZXIgZGF5LgoKVGhhbmtzLApHYWJyaWVs
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
