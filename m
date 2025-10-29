Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E3CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5Tahch3+EnLz8tqGQKgvfKKxjlk+ZAcg7y5N4s5NCI=; b=pVoF8PzI7eqY8s
	S278UvHnJ3OMN/LFVw0THxybeGMa21Hq53Rh3ntGplhQv6kXLpFmTVQoRpLQQ/7DG9e4s3YUGJ+ra
	9U9+sN12r6vvtyr2xmKrrbS+JM4LDSQ7v3IV9ynqQAY+omUyCWPAYOa2e7atzye7MctV8XOiFOi6o
	iFwBmyjKDBT7RGOUB6FSjMVQCTrXppuSmsF+SXos3CftZ6G/DMTlaclS6EjJoBQRXcdFtpkFKDjln
	v+aiGjUsIjJVFK1Ow0y68TtFvixkn1YrL67OULwrG8jCQ+0AYg2UM1SNqPeOFVafluZA3F7sRN48k
	oHzI1Af5j/VJk8G7V4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6wD-00000001Wbv-26H4;
	Wed, 29 Oct 2025 14:14:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6wA-00000001WaZ-2NkF
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 14:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761747245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oz02NyUjFvvwgxoacij+FT8GFgL/ftCgtOYuG6E4VVc=;
	b=YddHdoZg7ox0ohcNCfZvnEneSyOoAHbZodJXNlZQmUQ4JfDaNsk1XwwHL0EidO6WXoXf6T
	jqw3h3nu3YnSfFFcaIdTpqcn+WqhP11UBWqPSZfPSXRevCK8X3QLp2d/9AV6v89Dc/j4ZB
	w4cAjoWy5tpl/FnqnOaD8ymnd8W8l+g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-yBjurwtkMwWdTHxDFe1Tog-1; Wed, 29 Oct 2025 10:14:03 -0400
X-MC-Unique: yBjurwtkMwWdTHxDFe1Tog-1
X-Mimecast-MFC-AGG-ID: yBjurwtkMwWdTHxDFe1Tog_1761747242
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429af6b48a8so837198f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 07:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747242; x=1762352042;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYXy/T5OYgT19DHuKKWwDf9vfL9WSRPLsc+nPGT92ds=;
        b=rOnTxLBirF+to3LKulwCyyI1VaUsDdSvXKTFVumLOUKVL6coch2sZaB8NKo+wn7cvr
         f+cR1LNdTOok8NlEmIwMs+Zo4HnwMFZuNi/1J+QCxqG+2LIzNWeVVuAqkXzmqzOMDDKw
         E51PY2eBEDwrmU/26KaVbbATB6DVJV98Xcbje7fkqI3D6IphM50LHYkvBIK6dXgCSyC+
         IEkluujQ5XIcGFKq04ifK3QV6I7qEyJ25jUikeRKWCin7YlYlTSkqlbVmDMKJ14SU2Rz
         RLRBb5lBhHHwHhh5EPsa0weKqlzz6uMiOf1ZhxbrTdCydPRSfYnju7lekVOYbHbG+YhZ
         tpOw==
X-Forwarded-Encrypted: i=1; AJvYcCWkjwiTzZ4agqEEq+vgmgOwtyO5MVHczsU02X86grNxgEmkBRTnTFA858izlJc7Zjaa0yWMKrbyEW8gzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8atk+RCbap5dnq6vfejfUvGDXWDKaKqUAt+jquVLcbMUszdXB
	WRzSgvfSScmydkkayukBuxa/Xd1rJqqzODYvTI2VbK8oxVaZCkwoP4mYipWpQ6mNLwnVM52fb/I
	e3Pmjc1wK1DSabZ8KXuG0A1+tZI1coSt2CjvtDxgKNF6miuRxB+V1AEyRI4+16KA9gF2w/w==
X-Gm-Gg: ASbGncvlvzdm+KjVhl1xzslhdqDJPcjc+8S0DCE318EzCzpHhkuzkeRytP750fQoWlT
	Tdg5DiPXXLbbP5CkD20eNgKLBUOZ8g/9B2248ftPFBkpQczlsiIGro6iWg+ysUVcvj5UV95kO0+
	qsIn1MnNnVR7OqO9yqH4S2N7sqQGWaxF+0iNKuCnM9uxQ65Ojnidk5zAx7JUq162aC7WCz8QqQx
	LJ0xDcM+QeW5k6XqlIm36tQYBdQHXxR+3Ah6+bKriEYdlbQIIIOSo4Z+XiXCrbA0+aCi3gxt0Tf
	YthVMQc0+CSWiXP/TBptpSoa2eNAgCaIYinQpR6P/REo4D0imIa39RwrP6iQ7DC4c1IwLwfFYyO
	NxJX78bcSmsyJ2qx4//mgh/TZufJb+FFZCMWb9xUK0sBMNx7gXRI05C3x5SW4
X-Received: by 2002:a05:600c:b85:b0:476:57b4:72b6 with SMTP id 5b1f17b1804b1-4771e16e83emr30985885e9.8.1761747241988;
        Wed, 29 Oct 2025 07:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2ZXdnOISpERgBiJ9ZdxsqH+M706mFK4IVywCP8xRKb07Mt6iBAhayCrF0GEYoqONAFcNsMA==
X-Received: by 2002:a05:600c:b85:b0:476:57b4:72b6 with SMTP id 5b1f17b1804b1-4771e16e83emr30985385e9.8.1761747241429;
        Wed, 29 Oct 2025 07:14:01 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47719004d79sm45516125e9.5.2025.10.29.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:14:00 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, "David S. Miller" <davem@davemloft.net>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v6 27/29] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <aQHtBudA4aw4a3gT@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
 <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQHtBudA4aw4a3gT@localhost.localdomain>
Date: Wed, 29 Oct 2025 15:13:59 +0100
Message-ID: <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2BLOyYnPo7fhtSbGsjOBeZU59a3SoaUim-z3T4SRyd0_1761747242
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_071406_704650_8C0A8C9E 
X-CRM114-Status: GOOD (  21.72  )
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

T24gMjkvMTAvMjUgMTE6MzEsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgV2VkLCBP
Y3QgMjksIDIwMjUgYXQgMTE6MTY6MjNBTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gT24gMjgvMTAvMjUgMTY6NTksIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4+
ID4gTGUgRnJpLCBPY3QgMTAsIDIwMjUgYXQgMDU6Mzg6MzdQTSArMDIwMCwgVmFsZW50aW4gU2No
bmVpZGVyIGEgw6ljcml0IDoKPj4gPj4gQEAgLTE3MSw4ICsxNzIsMjcgQEAgRm9yIDMyLWJpdCB3
ZSBoYXZlIHRoZSBmb2xsb3dpbmcgY29udmVudGlvbnMgLSBrZXJuZWwgaXMgYnVpbHQgd2l0aAo+
PiA+PiAgICAgIGFuZHEgICAgJCh+UFRJX1VTRVJfUEdUQUJMRV9BTkRfUENJRF9NQVNLKSwgXHJl
Zwo+PiA+PiAgLmVuZG0KPj4gPj4KPj4gPj4gLS5tYWNybyBDT0FMRVNDRV9UTEJJCj4+ID4+ICsu
bWFjcm8gQ09BTEVTQ0VfVExCSSBzY3JhdGNoX3JlZzpyZXEKPj4gPj4gICNpZmRlZiBDT05GSUdf
Q09BTEVTQ0VfVExCSQo+PiA+PiArCS8qIE5vIHBvaW50IGluIGRvaW5nIHRoaXMgZm9yIGhvdXNl
a2VlcGluZyBDUFVzICovCj4+ID4+ICsJbW92c2xxICBQRVJfQ1BVX1ZBUihjcHVfbnVtYmVyKSwg
XHNjcmF0Y2hfcmVnCj4+ID4+ICsJYnQJXHNjcmF0Y2hfcmVnLCB0aWNrX25vaHpfZnVsbF9tYXNr
KCVyaXApCj4+ID4+ICsJam5jCS5MZW5kX3RsYmlfXEAKPj4gPgo+PiA+IEkgYXNzdW1lIGl0J3Mg
bm90IHBvc3NpYmxlIHRvIGhhdmUgYSBzdGF0aWMgY2FsbC9icmFuY2ggdG8KPj4gPiB0YWtlIGNh
cmUgb2YgYWxsIHRoaXMgPwo+PiA+Cj4+Cj4+IEkgdGhpbmsgdGVjaG5pY2FsbHkgeWVzLCBidXQg
dGhhdCB3b3VsZCBoYXZlIHRvIGJlIGEgcGVyLWNwdSBwYXRjaGFibGUKPj4gbG9jYXRpb24sIHdo
aWNoIHdvdWxkIG1lYW4gc29tZXRoaW5nIGxpa2UgZWFjaCBDUFUgaGF2aW5nIGl0cyBvd24gY29w
eSBvZgo+PiB0aGF0IHRleHQgcGFnZS4uLiBVbmxlc3MgdGhlcmUncyBzb21lIGV4aXN0aW5nIHdh
eSB0byBzdGF0aWNhbGx5IG9wdGltaXplCj4+Cj4+ICAgaWYgKGNwdW1hc2tfdGVzdF9jcHUoc21w
X3Byb2Nlc3Nvcl9pZCgpLCBtYXNrKSkKPj4KPj4gd2hlcmUgQG1hc2sgaXMgYSBib290LXRpbWUg
Y29uc3RhbnQgKGkuZS4gdGhlIG5vaHpfZnVsbCBtYXNrKS4KPgo+IE9yIGp1c3QgY2hlY2sgaG91
c2VrZWVwaW5nX292ZXJyaWRlbiBzdGF0aWMga2V5IGJlZm9yZSBldmVyeXRoaW5nLiBUaGlzIG9u
ZSBpcwo+IGVuYWJsZWQgb25seSBpZiBlaXRoZXIgbm9oel9mdWxsLCBpc29sY3B1cyBvciBjcHVz
ZXQgaXNvbGF0ZWQgcGFydGl0aW9uICh3ZWxsLAo+IGl0J3Mgb24gdGhlIHdheSBmb3IgdGhlIGxh
c3Qgb25lKSBhcmUgcnVubmluZywgYnV0IHRob3NlIGFyZSBhbGwgbmljaGUsIHdoaWNoCj4gbWVh
bnMgeW91IHNwYXJlIDk5Ljk5OSUga2VybmVsIHVzZWNhc2VzLgo+CgpPaCByaWdodCwgaWYgTk9I
Wl9GVUxMIGlzIGFjdHVhbGx5IGluIHVzZS4KClllYWggdGhhdCBob3VzZWtlZXBpbmcga2V5IGNv
dWxkIGRvIHNpbmNlLCBhdCBsZWFzdCBmb3IgdGhlIGNtZGxpbmUKYXBwcm9hY2gsIGl0J3Mgc2V0
IGR1cmluZyBzdGFydF9rZXJuZWwoKS4gSSBuZWVkIHRvIGhhdmUgYSB0aGluayBhYm91dCB0aGUK
cnVudGltZSBjcHVzZXQgY2FzZS4KCkdpdmVuIHdlIGhhdmUgQUxURVJOQVRJVkUncyBpbiB0aGVy
ZSBJIGFzc3VtZSBzb21ldGhpbmcgbGlrZSBhCmJvb3QtdGltZS1kcml2ZW4gc3RhdGljIGtleSBj
b3VsZCBkbywgYnV0IEkgaGF2ZW4ndCBmb3VuZCBvdXQgeWV0IGlmIGFuZApob3cgdGhhdCBjYW4g
YmUgc2hvdmVkIGluIGFuIEFTTSBmaWxlLgoKPiBUaGFua3MuCj4KPj4KPj4gPiBUaGFua3MuCj4+
ID4KPj4gPiAtLQo+PiA+IEZyZWRlcmljIFdlaXNiZWNrZXIKPj4gPiBTVVNFIExhYnMKPj4KPj4K
Pgo+IC0tCj4gRnJlZGVyaWMgV2Vpc2JlY2tlcgo+IFNVU0UgTGFicwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
