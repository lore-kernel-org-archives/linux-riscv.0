Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F2FC07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkmpLtvCBv6bSB2sJm7jY0LzGEyhy1AUzA90uZnHVfY=; b=T8b5nZp93jGE7n
	sY8qJIo5C42UbNV/rLc+ckkhlgpSwc8efkhZmnOzJNr6cyy6X9vZvfm/CnpR2RC7GlutSyxzaI6PS
	RJcBa+Itn47Ls1BOvqaOo4Dh8YYOKBIVSeMOHFLgB+5ASZ5rJylfXM8HIDP2O/7wcM2ZXkTZMctuE
	9Z5RzswcaPm6hR8TR4ltacVsIBOsNqAlPUJq2Tzn0tdAJASVRGa8NBsMf8bkp68wayzI3q2YyV5kc
	vizKESa5iPvkOQxXcbrTFey0Q8wy+43VpeDxWWKpV3c2U2AcyQ/eBHaUK6Mf/NRGKKaQe7rLIWbgt
	9tzskXQRVQ2EMQv5X99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcj6-00000004GLt-0Nn5;
	Wed, 24 Apr 2024 13:31:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcj0-00000004GHx-3lhf
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 13:31:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a5224dfa9adso175254266b.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713965508; x=1714570308; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4Hl4NLqdGzUXg705Rji8mLCpex1Aip+oeFMwQ83Pz0=;
        b=CJ3grC9PIRWTfYGaR+gQVv6pw2ZjCffqqSb4uksPfLnNU7KxtAkq7t1WoTmdokqsEF
         00GGgzE5SMXGoIPQhJnIMho14L59fQlhF2M8fzVLigalFyg8PZV80wtVVWzrU/6+7MzZ
         ldGhKZmBWPhPWMqBKJBG4S+RmgwQkK7N8/Q+Yjri9eTL+nt1zO5ArQWg1Zkiw0PgmQly
         DFLZaG0uDA273MLtTpuaZTQjedIPvsnpoofyTE0/J7pxjZZ+Ignz7iWHmCtZnNDmNpDS
         J/1+RxDo6K9C7j/1+xTYi7AbawjDA0Xw0cwg89QH2Kl6j49cuzOH2g3kAO2wT/fjK+nF
         LDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713965508; x=1714570308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4Hl4NLqdGzUXg705Rji8mLCpex1Aip+oeFMwQ83Pz0=;
        b=ZhbvQ2WDs4yWE0o1lq21KsXU5xWAZjupKiuwAXNa1G6pOZNWOPkIE4w0p1ul9n/w7E
         Lo8w7GcR/2l4UKMzBNU7MBmVl1ROOsf/j3ws9FzR08FVDgsmzCry3/wkwtadslbDRLmG
         2juP6K3Q+Mvge/J7Ie2TwGgQCNu2W6OXwzJJwxcXc793bX5UfGZzhfKvmRquPEgKt5x5
         iMdYWvjohGkpTPg8IEfZWa5VWKU1VztipCGWuDoFVKw1dL9GjJ6jikLADokoyoqW3IdK
         S8EY4zyEXsr2xGYGiux7aDq7/Uda6ecio3rnI2tFFbnQ/0BZelb3fqEgTRQbdFW8ZkDB
         A6jA==
X-Forwarded-Encrypted: i=1; AJvYcCVi4owtgQ7CM2J23xJx4Xnd78dKkC4DvM0qACmbrC3bZWUpL7X+zOpeWdRmokffmzp9z3qMy6jeaIijdCdlmYPSAh0F81iathJTPODe56v2
X-Gm-Message-State: AOJu0YxthTey6puOFXjl3SckgJVr7OAe622TZerWGuggSnFvjDHjb5d3
	sWK82EqdSAKXaj9/j923uA0PuUy4Sf+agKi9IgXWvr9/WYYaHYF6QDyCfO5ICZU=
X-Google-Smtp-Source: AGHT+IHJr3FYf/AKBS+rmpvAdd9+nzsoRwO0qpaGPs8V42zr8lIg6pDSo29AqeA/dSfcoTYiSYnHzQ==
X-Received: by 2002:a17:906:a2cf:b0:a55:75f7:42fb with SMTP id by15-20020a170906a2cf00b00a5575f742fbmr6308275ejb.24.1713965507864;
        Wed, 24 Apr 2024 06:31:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gw5-20020a170906f14500b00a523be56940sm8351416ejb.136.2024.04.24.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:31:47 -0700 (PDT)
Date: Wed, 24 Apr 2024 15:31:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Ian Rogers <irogers@google.com>, Anup Patel <anup@brainfault.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: Check standard event availability
Message-ID: <20240424-7b4434122a8c1cf1c1173403@orel>
References: <20240103165438.633054-1-samuel.holland@sifive.com>
 <CAOnJCUJ4rC+Rrs6GV4t+=NWA=LtTZix5Nk1VzgP9CK-3+5-jAg@mail.gmail.com>
 <06e71142-e113-40ac-b2c2-b20893aa714f@sifive.com>
 <a4c4c9f2-9fe1-4c22-a99c-1667481ddd6b@rivosinc.com>
 <CAAhSdy1yoCMtR52X7tS6dB2x_ysgA8K4hSSXH044bbq2uFY7jQ@mail.gmail.com>
 <CAP-5=fX5JRYxZ26buLujSVP7roQTaWofqdiX1y1rAKQ70Yu+QQ@mail.gmail.com>
 <CAHBxVyGuxQLTnBUiK2w=9atqNXs0sWC9KcWjssgzhNnbp_Z-mg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyGuxQLTnBUiK2w=9atqNXs0sWC9KcWjssgzhNnbp_Z-mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_063151_064965_DD33C8FB 
X-CRM114-Status: GOOD (  61.30  )
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

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgMDU6MzY6NDNQTSAtMDcwMCwgQXRpc2ggS3VtYXIgUGF0
cmEgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgODo0NOKAr1BNIElhbiBSb2dlcnMg
PGlyb2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBcHIgMTUsIDIwMjQg
YXQgOTowN+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBUdWUsIEFwciAxNiwgMjAyNCBhdCA1OjMx4oCvQU0gQXRpc2ggUGF0cmEgPGF0
aXNocEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gNC8xMC8yNCAxODo0
MCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gPiA+ID4gPiBIaSBBdGlzaCwKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBPbiAyMDI0LTAzLTE4IDI6NDQgUE0sIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+
ID4+IE9uIFdlZCwgSmFuIDMsIDIwMjQgYXQgODo1NOKAr0FNIFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPiA+Pj4KPiA+ID4gPiA+Pj4gVGhl
IFJJU0MtViBTQkkgUE1VIHNwZWNpZmljYXRpb24gZGVmaW5lcyBzZXZlcmFsIHN0YW5kYXJkIGhh
cmR3YXJlIGFuZAo+ID4gPiA+ID4+PiBjYWNoZSBldmVudHMuIEN1cnJlbnRseSwgYWxsIG9mIHRo
ZXNlIGV2ZW50cyBhcHBlYXIgaW4gdGhlIGBwZXJmIGxpc3RgCj4gPiA+ID4gPj4+IG91dHB1dCwg
ZXZlbiBpZiB0aGV5IGFyZSBub3QgYWN0dWFsbHkgaW1wbGVtZW50ZWQuIEFkZCBsb2dpYyB0byBj
aGVjawo+ID4gPiA+ID4+PiB3aGljaCBldmVudHMgYXJlIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdh
cmUgKGkuZS4gY2FuIGJlIG1hcHBlZCB0byBzb21lCj4gPiA+ID4gPj4+IGNvdW50ZXIpLCBzbyBv
bmx5IHVzYWJsZSBldmVudHMgYXJlIHJlcG9ydGVkIHRvIHVzZXJzcGFjZS4KPiA+ID4gPiA+Pj4K
PiA+ID4gPiA+Pgo+ID4gPiA+ID4+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+ID4gPiA+ID4+IFRo
aXMgYWRkcyB0b25zIG9mIFNCSSBjYWxscyBhdCBldmVyeSBib290IGZvciBhIHVzZSBjYXNlIHdo
aWNoIGlzIGF0Cj4gPiA+ID4gPj4gYmVzdCBjb25mdXNpbmcgZm9yIGEgc3Vic2V0IG9mIHVzZXJz
IHdobyBhY3R1YWxseSB3YW50cyB0byBydW4gcGVyZi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHNo
b3VsZCBoYXZlIGJlZW4gY2xlYXJlciBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uIFRoaXMgaXMg
bm90IGp1c3QgYSBjb3NtZXRpYwo+ID4gPiA+ID4gY2hhbmdlOyBiZWNhdXNlIHBlcmYgc2VlcyB0
aGVzZSBhcyB2YWxpZCBldmVudHMsIGl0IHRyaWVzIHRvIHVzZSB0aGVtIGluCj4gPiA+ID4gPiBj
b21tYW5kcyBsaWtlIGBwZXJmIHN0YXRgLiBXaGVuIHRoZSBlcnJvciBmcm9tIFNCSV9FWFRfUE1V
X0NPVU5URVJfQ0ZHX01BVENICj4gPiA+ID4gPiBjYXVzZXMgdGhlIC0+YWRkKCkgY2FsbGJhY2sg
dG8gZmFpbCwgdGhpcyBwcmV2ZW50cyBhbnkgb3RoZXIgZXZlbnRzIGZyb20gYmVpbmcKPiA+ID4g
PiA+IHNjaGVkdWxlZCBvbiB0aGF0IHNhbWUgQ1BVIChzZWFyY2ggY2FuX2FkZF9odyBpbiBrZXJu
ZWwvZXZlbnRzL2NvcmUuYykuIFRoYXQgaXMKPiA+ID4gPiA+IHdoeSB0aGUgZFRMQi9pVExCIG1p
c3MgY291bnRzIGFyZSBtaXNzaW5nIGluIHRoZSAiYmVmb3JlIiBleGFtcGxlIGJlbG93Lgo+ID4g
PiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgZXhwbGFpbmluZyB0aGUgcHJvYmxlbS4g
SSBjYW4gcmVwcm9kdWNlIGl0IGluIHFlbXUgYXMgd2VsbCBpZgo+ID4gPiA+IGVub3VnaCBudW1i
ZXIgb2YgaW52YWxpZCBldmVudHMgZ2l2ZW4gb24gdGhlIGNvbW1hbmQgbGluZSBhbmQgdGhlCj4g
PiA+ID4gd29ya2xvYWQgaXMgc2hvcnQgZW5vdWdoLgo+ID4gPiA+Cj4gPiA+ID4gPj4gVGhpcyBw
cm9iaW5nIGNhbiBiZSBkb25lIGF0IHJ1bnRpbWUgYnkgaW52b2tpbmcgdGhlCj4gPiA+ID4gPj4g
cG11X3NiaV9jaGVja19ldmVudCBmcm9tIHBtdV9zYmlfZXZlbnRfbWFwLgo+ID4gPiA+ID4+IFdl
IGNhbiB1cGRhdGUgdGhlIGV2ZW50IG1hcCBhZnRlciB0aGF0IHNvIHRoYXQgaXQgZG9lc24ndCBu
ZWVkIHRvCj4gPiA+ID4gPj4gaW52b2tlIHBtdV9zYmlfY2hlY2tfZXZlbnQgbmV4dCB0aW1lLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IEkgdHJpZWQgdG8gaW1wbGVtZW50IHRoaXMgc3VnZ2VzdGlvbiwg
YnV0IGl0IGRpZCBub3Qgd29yay4gVGhlIFNCSSBpbnRlcmZhY2UKPiA+ID4gPiA+IGRvZXMgbm90
IGRpc3Rpbmd1aXNoIGJldHdlZW4gIm5vbmUgb2YgdGhlIGNvdW50ZXJzIGNhbiBtb25pdG9yIHRo
ZSBzcGVjaWZpZWQKPiA+ID4gPiA+IGV2ZW50IFtiZWNhdXNlIHRoZSBldmVudCBpcyB1bnN1cHBv
cnRlZF0iIGFuZCAibm9uZSBvZiB0aGUgY291bnRlcnMgY2FuIG1vbml0b3IKPiA+ID4gPiA+IHRo
ZSBzcGVjaWZpZWQgZXZlbnQgW2JlY2F1c2UgdGhlIGNvdW50ZXJzIGFyZSBidXN5XSIuIEl0IGlz
IG5vdCBzdWZmaWNpZW50IGZvcgo+ID4gPiA+ID4gdGhlIGtlcm5lbCB0byB2ZXJpZnkgdGhhdCBh
dCBsZWFzdCBvbmUgY291bnRlciBpcyBhdmFpbGFibGUgYmVmb3JlIHBlcmZvcm1pbmcKPiA+ID4g
PiA+IHRoZSBjaGVjaywgYmVjYXVzZSBjZXJ0YWluIGV2ZW50cyBtYXkgb25seSBiZSB1c2FibGUg
b24gYSBzdWJzZXQgb2YgY291bnRlcnMKPiA+ID4gPiA+IChwZXIgcmlzY3YsZXZlbnQtdG8tbWhw
bWNvdW50ZXJzKSwgYW5kIHRoZSBrZXJuZWwgZG9lcyBub3Qga25vdyB0aGF0IG1hcHBpbmcuCj4g
PiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gWWVhaC4gTXkgc3VnZ2VzdGlvbiB3YXMgdG8gZml4IHRo
ZSBwZXJmIGxpc3QgaXNzdWUgd2hpY2ggaXMgZGlmZmVyZW50Cj4gPiA+ID4gdGhhbiB0aGUgaXNz
dWUgcmVwb3J0ZWQgbm93Lgo+ID4gPiA+Cj4gPiA+ID4gPiBBcyBhIHJlc3VsdCwgY2hlY2tpbmcg
Zm9yIGV2ZW50IHN1cHBvcnQgaXMgb25seSByZWxpYWJsZSB3aGVuIG5vbmUgb2YgdGhlCj4gPiA+
ID4gPiBjb3VudGVycyBhcmUgaW4gdXNlLiBTbyB0aGUgY2hlY2sgY2FuIGJlIGFzeW5jaHJvbm91
cy9kZWZlcnJlZCB0byBsYXRlciBpbiB0aGUKPiA+ID4gPiA+IGJvb3QgcHJvY2VzcywgYnV0IEkg
YmVsaWV2ZSBpdCBzdGlsbCBuZWVkcyB0byBiZSBwZXJmb3JtZWQgZm9yIGFsbCBldmVudHMgYmVm
b3JlCj4gPiA+ID4gPiB1c2Vyc3BhY2Ugc3RhcnRzIHVzaW5nIHRoZSBjb3VudGVycy4KPiA+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBXZSBzaG91bGQgZGVmZXIgaXQgYSB3b3JrIHF1ZXVlIGZvciBz
dXJlLiBXZSBjYW4gYWxzbyBsb29rIGF0IGltcHJvdmluZwo+ID4gPiA+IFNCSSBQTVUgZXh0ZW5z
aW9uIHRvIHN1cHBvcnQgYnVsayBtYXRjaGluZyBiZWhhdmlvciBhcyB3ZWxsLgo+ID4gPiA+Cj4g
PiA+ID4gSG93ZXZlciwgSSB0aGluayBhIGJldHRlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBqdXN0
IHJlbHkgb24gdGhlIGpzb24KPiA+ID4gPiBmaWxlIG1hcHBpbmdzIGluc3RlYWQgb2YgbWFraW5n
IFNCSSBjYWxscy4gV2UgYXJlIGdvaW5nIHRvIGhhdmUgdGhlCj4gPiA+ID4gZXZlbnQgZW5jb2Rp
bmcgYW5kIG1hcHBpbmdzIGluIHRoZSBqc29uIGluIHRoZSBmdXR1cmUuCj4gPiA+Cj4gPiA+IFRo
ZSBwcm9ibGVtIHdpdGggSlNPTiBiYXNlZCBldmVudCBlbmNvZGluZyBpcyBob3cgdG8gZGVhbCBp
bi1jYXNlCj4gPiA+IHdlIGFyZSBydW5uaW5nIGluc2lkZSBHdWVzdC9WTSBiZWNhdXNlIEhvc3Qg
Y291bGQgYmUgYW55dGhpbmcuCj4gPiA+Cj4gPiA+IElNTywgdGhlIEpTT04gYmFzZWQgYXBwcm9h
Y2ggaXMgbm90IHN1aXRhYmxlIGZvciBTQkkgUE1VLiBGb3Igbm93LAo+ID4gPiB3ZSBlaXRoZXIg
ZGVmZXIgdGhlIHdvcmsgdXNpbmcgdGhlIHdvcmsgcXVldWUgb3Iga2VlcCB0aGUgYXBwcm9hY2gK
PiA+ID4gb2YgdGhpcyBwYXRjaCBhcy1pcy4KPiA+ID4KPiA+ID4gVGhlIGdvb2QgcGFydCBhYm91
dCBTQkkgUE1VIGV4dGVuc2lvbiBpcyB0aGF0IHdlIGRvIGhhdmUgYSBzdGFuZGFyZAo+ID4gPiBz
ZXQgb2YgZXZlbnRzIGFuZCB3ZSBvbmx5IG5lZWQgYSB3YXkgdG8gZGlzY292ZXIgc3VwcG9ydGVk
IHN0YW5kYXJkCj4gPiA+IGV2ZW50cyB3aXRoIGEgbWluaW11bSBudW1iZXIgb2YgU0JJIGNhbGxz
LiBJdCBpcyBiZXR0ZXIgdG8gYWRkIGEgbmV3Cj4gPiA+IFNCSSBQTVUgY2FsbCB0byBhc3Npc3Qg
c3VwcG9ydGVkIGV2ZW50IGRpc2NvdmVyeSB3aGljaCB3aWxsIGFsc28KPiA+ID4gaGVscCB1cyB2
aXJ0dWFsaXplIGl0Lgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBBbnVwCj4gPgo+ID4gK0lh
biBSb2dlcnMKPiA+Cj4gPiBgcGVyZiBsaXN0YCB3aWxsIGFscmVhZHkgZmlsdGVyIHNvbWUgZXZl
bnRzIGRlcGVuZGluZyBvbiB3aGV0aGVyIHRoZQo+ID4gUE1VIHN1cHBvcnRzIHRoZW0sIGZvciBl
eGFtcGxlLCBsZWdhY3kgY2FjaGUgZXZlbnRzLiBJIHRoaW5rIHdlIGNhbgo+ID4gZXh0ZW5kIHRo
aXMgdG8ganNvbiBldmVudHMuCj4gPgo+IAo+IFllcy4gVGhhdCdzIHdoYXQgSSB3YXMgdGhpbmtp
bmcgYXMgd2VsbC4gSG93ZXZlciwgdGhhdCBtYXkgYmUgYQo+IHByb2JsZW0gaW4gdmlydHVhbGl6
YXRpb24KPiBhcyBBbnVwIHBvaW50ZWQgb3V0Lgo+IAo+IEFzIHBlciBteSB1bmRlcnN0YW5kaW5n
LCBjbG91ZCBwcm92aWRlcnMgcHJvdmlkZSBqc29uIGZpbGVzIGZvciBWTXMKPiBiYXNlZCBvbiB0
aGUgaG9zdAo+IGFyY2hpdGVjdHVyZSBhbmQgYWxsb3cgbWlncmF0aW9uIG9ubHkgYmV0d2VlbiBo
b3N0cyB3aXRoIHRoZSBzYW1lCj4gZmFtaWx5IG9mIGNwdS4gSW4gUklTQy1WLCB0aGUgbWFwZmls
ZS5jc3Ygd29ya3MgYmFzZWQgb24gMyByZWdpc3RlcnMKPiBpbmRpY2F0aW5nIG1hcmNoaWQsIG1p
bXBpZCwgYW5kIG12ZW5kb3JpZC4gVGh1cywgdGhlIGpzb24gZmlsZSBoYXMgdG8KPiBiZSB0aWVk
IHdpdGggdGhlIGhvc3QgbWFjaGluZSBpdCBpcyBnb2luZyB0byBiZSBydW4uCgpUaGlzIGlzIGFs
c28gbXkgdW5kZXJzdGFuZGluZy4gVGhhdCBpcywgdGhhdCBjbG91ZCBpbnN0YW5jZXMgdHlwaWNh
bGx5CmRlZGljYXRlIENQVXMgdG8gVk1zIGFuZCBkb24ndCB0cnkgdG8gcHJlc2VudCBDUFUgbW9k
ZWxzIHRvIFZNcyB3aGljaApkb24ndCBleGFjdGx5IG1hdGNoIHRoZSBob3N0J3MgQ1BVcy4gVGhl
IHJlbWFpbmluZyBjb25jZXJuIHdvdWxkIGJlIGlmCnRoZSBoeXBlcnZpc29yIGRvZXNuJ3QgZW11
bGF0ZS9wYXNzdGhyb3VnaCBldmVyeXRoaW5nIHRoZSBqc29uIGRlc2NyaWJlcwpmb3IgdGhlIGhv
c3QgQ1BVIHR5cGUuCgpIb3dldmVyLCB0aGlzIGlzIGp1c3QgInR5cGljYWwiIGNsb3Vkcy4gQWxs
IGJldHMgYXJlIG9mZiBmb3IgZ2VuZXJhbAp2aXJ0dWFsaXphdGlvbiwgYXMgQW51cCBwb2ludHMg
b3V0LgoKPiAKPiBXZSB3aWxsIGVuZCB1cCBkb2luZyB0aGUgc2FtZSBpZiB3ZSBvbmx5IHJlbHkg
b24gdGhlIGpzb24gZmlsZSB0bwo+IGZpbHRlciBldmVudHMgaW4gdGhlIGZ1dHVyZS4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIHRoZSBhc3N1bXB0aW9uIGlzCj4gaW5jb3JyZWN0Lgo+IAo+IElmIHdl
IGFsbG93IGEgU0JJIGNhbGwgcm91dGUgdG8gZGlzY292ZXIgd2hpY2ggZXZlbnRzIGFyZSBzdXBw
b3J0ZWQsCj4gdGhlIGd1ZXN0IGNhbiBhbHdheXMgc3VwcG9ydCBsZWdhY3kgZXZlbnRzIG9uIGFu
eSBob3N0IGV2ZW4gdGhvdWdoIGl0Cj4gZG9lc24ndCBoYXZlIGEganNvbiBmaWxlLgoKWWVzLCBJ
IHRoaW5rIHdlIG5lZWQgYSBzb2x1dGlvbiB3aGljaCB3b3JrcyBldmVuIHdpdGhvdXQgYSBqc29u
IGZpbGUsCnNpbmNlIGEgVk0gbWF5IHVzZSBhIHNwZWNpYWwgbXZlbmRvcmlkLG1hcmNoaWQsbWlt
cGlkIHRyaXBsZXQgdG8KZGVzY3JpYmUgYSBtb3JlIGdlbmVyaWMgQ1BVIHR5cGUuIFVubGVzcyB3
ZSBhbHNvIGNyZWF0ZSBqc29uIGZpbGVzCmZvciB0aGVzZSBWQ1BVcywgb3IgcHJvdmlkZSBvdGhl
ciBldmVudCBkaXNjb3ZlcnkgbWVjaGFuaXNtcywgdGhlbgp0aGUgVk1zIHdpbGwgbm90IGhhdmUg
YW55dGhpbmcuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
