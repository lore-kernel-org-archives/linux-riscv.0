Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BDFCD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hom+weDEtm/sntJYsE4ngwT61YP1/D7bCqAGUw+1Stk=; b=EpQs4GNO3zJDVt
	z8Vz+pmpeB11l/gJQ3+jvbyx43Bbi0FvJeF7yROzOQACOjFt+rqAo423Hla/n7OJjj6Y3h8E+HCHi
	l3McRAa7iwfAVdgEHu5N8DvCRnxh5Fw3cNAqHX729kfcr1bnuLz4u5FfnlrAPOa4euNvdq5iWC4ce
	/iL0hZkfg4p3TNB8FACfheu2H35wMAyI0kWrvEckE55Um5RdQ9u3aTWgoJE0ky5nICSmq+MYmBsft
	io/DnZHMVKVJYDAhdSSr0FL1ggqv4zpw//XQUBepZ9PuVyGL4cDe1nmm8+qfJ1yXSzpreebCqZSJ9
	m8LQcQ0vf2QMAGTsW0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup1F-0000000AtPR-0TVc;
	Thu, 11 Apr 2024 07:38:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup1B-0000000AtMF-30cU
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:38:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so96473966b.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712821122; x=1713425922; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qi1RHVmEtAvgNYlK/Z30HZoUwL3LvYqcc/16dHeni2I=;
        b=P6Rzfk5igtBuVHz/YtQVOj+DKzC76UGr/7+xhUdBIHpBHDgLq9rF3b8UFBRi+iZdHU
         A54Db26JPqQfx9iU9PfMN6lnrcKygi20R5RW5IL0eHBOvv3PwNMGeZzhqkOggwSrefkW
         jRumDnwt6jqAgReW4r9syN6K7/hI6epJLPF9qdRKxTJvscS895BdUAKkNcvuB4ok3g9V
         NmVV7HCRj75iARaRSGEzIjaxqo9ghb3hy3AR3Et+a75hh5kcF17G7jw1VqA44g+3xaM2
         r2iJvGajfy/B+MnLaXR5IwFe6Lfrn05LFRicArPFemaR4iUNxT08dI/HUvjYljcn6yZm
         2krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712821122; x=1713425922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi1RHVmEtAvgNYlK/Z30HZoUwL3LvYqcc/16dHeni2I=;
        b=LMuK2CbAyWwMIAPNIit6skSC/tx1ojrLpaKJ9QUHhIfxp1EAV9N9AcKwp/fOwp1XL3
         fPDOcPefqN28fIA4Y6fZ/g9QrIF+7QoS1+A+Rp3JvJ6RTlQ9aDNt4zsT2TTIFwPBru8z
         2tfz7qjYXM3pHkRGtlEsxOoSqaaMUo0mFkc0OXXiJvl0BRvTNrXUpKj7pXk04u50SnLw
         wsyn/MVLkGYdicUa9YGB+tIbloX8xgeYG4UIWFMJ9JHbFD5hVjDMJA3Dcztki8gSSxRJ
         SO3bg1wgkGqZGE/4tfWcakpI8v+JMhzdfOaE8jAqxy+WohwlYHilDK6V8iWLeP7zU8o+
         E3bw==
X-Forwarded-Encrypted: i=1; AJvYcCUs2BF8OHKKzlwcA1A4NjLgr4CRLwwEwRo3jGXn8hPY8B5KS4iyQ5OFsdcekkwzM5L7Oi8gEYg70nMYEtn3LkRWhrFDpnoxFqEbWzo0/IoQ
X-Gm-Message-State: AOJu0YwdDH/5KNG6j/O8mK8nWPtI6SdoU8P9L8iqQCW+spBjEHN7hIJ1
	6XJtSZBSBaRmeWduhmAzno3JZU2SMQ+/x8Ckz5uqHxN8hsEBhmqOvffQSE6dRa4=
X-Google-Smtp-Source: AGHT+IHndxelT9zzrPtEEf61xurR5ZhY/uXW2mp7zI7XhBJBneHaSOP3oqNpAKZ/ndwpR0RWwH9wFg==
X-Received: by 2002:a17:907:1c2a:b0:a4e:410e:9525 with SMTP id nc42-20020a1709071c2a00b00a4e410e9525mr1764454ejc.30.1712821122486;
        Thu, 11 Apr 2024 00:38:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gv7-20020a170906f10700b00a4e0df9e793sm478233ejb.136.2024.04.11.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:38:42 -0700 (PDT)
Date: Thu, 11 Apr 2024 09:38:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
Message-ID: <20240411-6fe47ccc32d9cb7baa121b4d@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-8-atishp@rivosinc.com>
 <20240302-1a3c0df25f2422e1e6abecf3@orel>
 <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
 <20240404-ea40bc0237635d671e64fef6@orel>
 <7d02c86e-8c36-4e78-9fa8-5e30f3431eb3@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d02c86e-8c36-4e78-9fa8-5e30f3431eb3@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_003845_864448_A1C221BE 
X-CRM114-Status: GOOD (  34.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDM6NDQ6MzJQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gNC80LzI0IDA1OjE2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiBPbiBNb24sIEFw
ciAwMSwgMjAyNCBhdCAwMzozNzowMVBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+ID4g
T24gU2F0LCBNYXIgMiwgMjAyNCBhdCAxMjoxNuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IE9uIFdlZCwgRmViIDI4LCAy
MDI0IGF0IDA1OjAxOjIyUE0gLTA4MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+ID4gQ3Vy
cmVudGx5LCB3ZSByZXR1cm4gYSBsaW51eCBlcnJvciBjb2RlIGlmIGNyZWF0aW5nIGEgcGVyZiBl
dmVudCBmYWlsZWQKPiA+ID4gPiA+IGluIGt2bS4gVGhhdCBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5
IGFzIGd1ZXN0IGNhbiBjb250aW51ZSB0byBvcGVyYXRlCj4gPiA+ID4gPiB3aXRob3V0IHBlcmYg
cHJvZmlsaW5nIG9yIHByb2ZpbGluZyB3aXRoIGZpcm13YXJlIGNvdW50ZXJzLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBSZXR1cm4gYXBwcm9wcmlhdGUgU0JJIGVycm9yIGNvZGUgdG8gaW5kaWNhdGUg
dGhhdCBQTVUgY29uZmlndXJhdGlvbgo+ID4gPiA+ID4gZmFpbGVkLiBBbiBlcnJvciBtZXNzYWdl
IGluIGt2bSBhbHJlYWR5IGRlc2NyaWJlcyB0aGUgcmVhc29uIGZvciBmYWlsdXJlLgo+ID4gPiA+
IAo+ID4gPiA+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIHBlcmYgc3Vic3lzdGVtIHRv
IGtub3cgaWYgdGhlcmUgbWF5IGJlCj4gPiA+ID4gYSBjb25jZXJuIHRoYXQgcmVzb3VyY2VzIGFy
ZSB0ZW1wb3JhcmlseSB1bmF2YWlsYWJsZS4gSWYgc28sIHRoZW4gdGhpcwo+ID4gPiAKPiA+ID4g
RG8geW91IG1lYW4gdGhlIGhhcmR3YXJlIHJlc291cmNlcyB1bmF2YWlsYWJsZSBiZWNhdXNlIHRo
ZSBob3N0IGlzIHVzaW5nIGl0ID8KPiA+IAo+ID4gWWVzIChJIHRoaW5rKS4gVGhlIGlzc3VlIEkn
bSB0aGlua2luZyBvZiBpcyBpZiBrdm1fcG11X2NyZWF0ZV9wZXJmX2V2ZW50Cj4gPiAocGVyZl9l
dmVudF9jcmVhdGVfa2VybmVsX2NvdW50ZXIpIHJldHVybnMgc29tZXRoaW5nIGxpa2UgRUJVU1kg
YW5kIHRoZW4KPiA+IHdlIHRyYW5zbGF0ZSB0aGF0IHRvIFNCSV9FUlJfTk9UX1NVUFBPUlRFRC4g
SSdtIG5vdCBzdXJlIGd1ZXN0cyB3b3VsZAo+ID4gaW50ZXJwcmV0IG5vdC1zdXBwb3J0ZWQgYXMg
YW4gZXJyb3Igd2hpY2ggbWVhbnMgdGhleSBjYW4gcmV0cnkuIE9yIGlmCj4gPiB0aGV5IHJldHJ5
IGFuZCBnZXQgc29tZXRoaW5nIG90aGVyIHRoYW4gbm90LXN1cHBvcnRlZCBpZiB0aGV5J2QgYmUK
PiA+IGNvbmZ1c2VkLgo+ID4gCj4gCj4gQXQgbGVhc3QgaW4gTGludXggZHJpdmVyLCB0cmVhdHMg
LUVOT1RTVVBQIGFuZCBpdCBqdXN0IGZhaWxzLiBPdGhlciBndWVzdCBPUwo+IGltcGxlbWVudGF0
aW9uIG1heSBpbnRlcnByZXQgaXQgZGlmZmVyZW50bHkuIEJ1dCB0aGV5IHNob3VsZCBmYWlsIGF0
IHRoYXQKPiBwb2ludCBhcyB3ZWxsLiBJIGRvbid0IHNlZSBob3cgY2FuIHRoZXkgaW50ZXJwcmV0
IHRvIGJlIHJldHJ5Lgo+IAo+IFRoZSBwZXJmIHVzZXIgY2FuIHJldHJ5IGFnYWluIHdpdGggYXNz
dW1wdGlvbiB0aGF0IG1heSBiZSBlbm91Z2ggY291bnRlcnMKPiBhcmUgbm90IGF2YWlsYWJsZSBh
dCB0aGlzIG1vbWVudC4gQnV0IHRoYXQncyBkaWZmZXJlbnQgZnJvbSByZXR1cm4gYSByZXRyeQo+
IGZyb20gZHJpdmVyIGNvZGUuCj4gCj4gRXZlbiBpZiB3ZSBzdXBwb3J0IGEgcmV0cnkgZXJyb3Ig
Y29kZSwgd2hlbiBkb2VzIHRoZSBjYWxsZXIgcmV0cnkgaXQgPwo+IFRoZSBkcml2ZXIgZG9lc24n
dCBrbm93IGhvdyBsb25nIHRoZSB1c2VyIGlzIGdvaW5nIHRvIHJ1biB0aGUgcGVyZiBjb21tYW5k
Cj4gdG8ga2VlcCB0aGUgaGFyZHdhcmUgcmVzb3VyY2VzIG9jY3VwaWVkLgo+IAo+IEkgZmVlbCB0
aGUgcGVyZiB1c2VyIGlzIHRoZSBiZXN0IGVudGl0eSB0byBrbm93IHRoYXQgYW5kIHNob3VsZCBy
ZXRyeSBpZiBpdAo+IGtub3dzIHRoZSBwcmV2aW91cyBydW4gaXMgb3ZlciB3aGljaCBtaWdodCBo
YXZlIHJlbGVhc2VkIHRoZSBoYXJkd2FyZQo+IHJlc291cmNlcy4KCkkgYWdyZWUsIGJ1dCBob3cg
ZG9lcyB0aGUgdXNlciBrbm93IHRoYXQgcmV0cnlpbmcgbWFrZXMgc2Vuc2U/IEkgcHJlc3VtZQot
RU5PVFNVUFAgd2lsbCBnZXQgcHJvcGFnYXRlZCBhbGwgdGhlIHdheSB0byB0aGUgdXNlciBpbiBh
IGZvcm0gdGhhdAptZWFucyAibm90IHN1cHBvcnRlZCIuIE9yLCBjYW4gdGhlIHVzZXIgbGlzdCBh
bGwgcmVzb3VyY2VzIGFuZCB0aGVuCndoZW4gdGhleSBzZWUgIm5vdCBzdXBwb3J0ZWQiIGtub3cg
dGhhdCBtZWFucyAibm90IHN1cHBvcnRlZCBhdCB0aGUKbW9tZW50IiwgYXMgdGhleSd2ZSBhbHJl
YWR5IHNlZW4gdGhhdCB0aGUgcmVzb3VyY2VzIGV4aXN0PwoKQW55d2F5LCBhcyBJIHNhaWQsIEkg
ZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIHBlcmYgc3Vic3lzdGVtIHRvIGtub3cKaWYgdGhp
cyBpcyBhIHJlYWwgY29uY2VybiBvciBub3QsIGJ1dCBpdCBzb3J0IG9mIGxvb2tzIGxpa2Ugd2Ug
aGF2ZQpwb3RlbnRpYWwgdG8gdGVsbCB1c2VycyB0aGF0IHNvbWV0aGluZyBpc24ndCBzdXBwb3J0
ZWQgd2hlbiBpbiBmYWN0IGl0CmlzIHN1cHBvcnRlZCwgYnV0IG9ubHkgdGVtcG9yYXJpbHkgdW5h
dmFpbGFibGUuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
