Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574A7CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aO9CV0rkk05iP67muwQlaQxiyAMbYtvYbf48fjsj8bc=; b=twuzcc2R8xFBdE
	G5qT7hLp78CCKe0aDMnD3/nQHq1lEgw7vid1R5HdPU/TpcXfZmGD9mGkVPH32K5ENMJ3DJ7r5e8oA
	GuV3tegXQrSKxxaPols3i8nYqZRPQhcxPRvnwT+nDM7pbzlVH2w3WHQ73oulVQasaFDfcinLua3EA
	1J6GJWUXSatkwER/S1+UFPMVVAeSFtrGjhdhzh+XTTJ5NxXXI05dXyRB6YOxlHngXfrsn0+kYGTQj
	j4Xj2QWod5IaXE3ZTy624jAnst3bQYwRWhxkkddamOI0adOrRLcjOLu5KTdIrydLJ/VBtaS6WI7FK
	MFi5OQjqqC8Q3CDZTfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3EH-00000000gKj-0Fgx;
	Wed, 29 Oct 2025 10:16:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3EE-00000000gJb-30PT
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 10:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761732989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSbP/XItnE8Eu8etTuS9l9QrebV4lnCgmZKR5M55TVw=;
	b=NWObTVPoaAqQOhJI7LfndOSoB37d1fjfd8sQUsqBg3MCv6LCcrdNYScKktmR1YwfUjS6GF
	IkbeCl800DJ2tdnKM8kVlPcs8sHLj6jeCXlV4kp/Ut2d+r1rqC5qXH4mgU5ilpZZiohSO9
	KWjk8sXfIRByoIjrS2VDs5LuVOOnO6w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-PSyqJMeGOJiXS0gAJ1j4Mg-1; Wed, 29 Oct 2025 06:16:27 -0400
X-MC-Unique: PSyqJMeGOJiXS0gAJ1j4Mg-1
X-Mimecast-MFC-AGG-ID: PSyqJMeGOJiXS0gAJ1j4Mg_1761732986
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477113a50fcso28835295e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 03:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732986; x=1762337786;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/btFKEFxhLEeC8J1xdXSDjZgEcY68zMIb5ZfPzXsUAI=;
        b=t2Iknm86fntQvRm+JE3mc7YP16l7hSInWbUVfjR+YQjadV/ASq/YrQsP+DnYh6xXon
         B3IojE59h7bJTfWonZOJMzfkfXn910/C0qPK0rr8p02yUYKWWmSKiOqjE9sS7HHjH95V
         K11+g1kk3wb5fxCKa/4dvPC7ANwh+C1rW/rQunkTbPZ89erWp+KeReQ4wtvPvxPLBU9r
         m3woZSV9KcktXsV4xo6D25/KylnNezq8ijCHpoVHZVLVLeoCgqOvGz61NXYLXwMDcdZI
         NFmu243oFzmJ7QCJy58fb1DmNP2qEhQbHb6jWv3Oz1reSWJ+GO92ZuwZ4S9qkv79uDUR
         FDsg==
X-Forwarded-Encrypted: i=1; AJvYcCUUMhqnxwHvhgxO9pSHiOHSKQbamhCSIyCG8ulA5yM0rU02+duuGPKuZn9bu/GhubjXzaF00UTOxdW0FA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuLo67aYwtbI2kMjzBkcNJbkwH1NzGHrEZyqCVnvW4JcTXTBha
	2fzoUdqpvOGozHr1VEnU0OVZ/ggstQFZQdJB1ipbmEglw+92M+HEr+wY+Iq8/LBVdx1MM2oDkbu
	opblfTyTZq0JmRFrnuWqrf8HbSBGsZ0wTbYPPLr4qoEWv6nwChd4wt+5gA9EvHKV0yWg8Kw==
X-Gm-Gg: ASbGncs3SnHLHv+isHeH+8dCIC5Baly5DUyJ2fLdWhyHjxAGS0DJZ7b15JL5DkTsY4S
	Bah1dvbyABbVwv608fCrrUatpLbKYa+6+aHW5kAXgludab6Cj12kLwksSo/AZM9dnpedeaR8QeE
	AULqSgoggfl4IPEIPQYOwgxEzzOeioba87EFl5SIF4i2bWeiooBocMmobNPfMBv/SotPvgJythb
	y2ajW5vXO7vZzORcqXo7jEKteca+5abzHD+t5WLdNrpVRA5K93s1lu42NftLJhP51VLNhcbME0c
	+/Vh3LkvGImovyCMFQygtOb8KLf5dfzCp0QF8VDiaN6dsILVXfqPR7sVsMDi7DecDr1Orb30nHU
	ugNfYSFffxubv0/y0wowLjaxeNioVhJcmMGn/5OTMuAwusLtd/yBhKddXjDV7
X-Received: by 2002:a05:600d:4398:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4771e85156emr13218795e9.23.1761732986089;
        Wed, 29 Oct 2025 03:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENaoAuowDmNKRs2e7mInj3dgyeHZe08An/EQmhaeEKImjMyXA9vgcPYVOhC1MZ8t+wInccTA==
X-Received: by 2002:a05:600d:4398:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4771e85156emr13218175e9.23.1761732985564;
        Wed, 29 Oct 2025 03:16:25 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm25828786f8f.6.2025.10.29.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:16:25 -0700 (PDT)
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
In-Reply-To: <aQDoVAs5UZwQo-ds@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:16:23 +0100
Message-ID: <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G38WnbI3-lVjTBAUJ6iySRWa5GR_09RoAEJR3HhThCQ_1761732986
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_031630_827497_7C3A6E51 
X-CRM114-Status: GOOD (  13.04  )
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

T24gMjgvMTAvMjUgMTY6NTksIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgRnJpLCBP
Y3QgMTAsIDIwMjUgYXQgMDU6Mzg6MzdQTSArMDIwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gQEAgLTE3MSw4ICsxNzIsMjcgQEAgRm9yIDMyLWJpdCB3ZSBoYXZlIHRoZSBmb2xs
b3dpbmcgY29udmVudGlvbnMgLSBrZXJuZWwgaXMgYnVpbHQgd2l0aAo+PiAgICAgIGFuZHEgICAg
JCh+UFRJX1VTRVJfUEdUQUJMRV9BTkRfUENJRF9NQVNLKSwgXHJlZwo+PiAgLmVuZG0KPj4KPj4g
LS5tYWNybyBDT0FMRVNDRV9UTEJJCj4+ICsubWFjcm8gQ09BTEVTQ0VfVExCSSBzY3JhdGNoX3Jl
ZzpyZXEKPj4gICNpZmRlZiBDT05GSUdfQ09BTEVTQ0VfVExCSQo+PiArCS8qIE5vIHBvaW50IGlu
IGRvaW5nIHRoaXMgZm9yIGhvdXNla2VlcGluZyBDUFVzICovCj4+ICsJbW92c2xxICBQRVJfQ1BV
X1ZBUihjcHVfbnVtYmVyKSwgXHNjcmF0Y2hfcmVnCj4+ICsJYnQJXHNjcmF0Y2hfcmVnLCB0aWNr
X25vaHpfZnVsbF9tYXNrKCVyaXApCj4+ICsJam5jCS5MZW5kX3RsYmlfXEAKPgo+IEkgYXNzdW1l
IGl0J3Mgbm90IHBvc3NpYmxlIHRvIGhhdmUgYSBzdGF0aWMgY2FsbC9icmFuY2ggdG8KPiB0YWtl
IGNhcmUgb2YgYWxsIHRoaXMgPwo+CgpJIHRoaW5rIHRlY2huaWNhbGx5IHllcywgYnV0IHRoYXQg
d291bGQgaGF2ZSB0byBiZSBhIHBlci1jcHUgcGF0Y2hhYmxlCmxvY2F0aW9uLCB3aGljaCB3b3Vs
ZCBtZWFuIHNvbWV0aGluZyBsaWtlIGVhY2ggQ1BVIGhhdmluZyBpdHMgb3duIGNvcHkgb2YKdGhh
dCB0ZXh0IHBhZ2UuLi4gVW5sZXNzIHRoZXJlJ3Mgc29tZSBleGlzdGluZyB3YXkgdG8gc3RhdGlj
YWxseSBvcHRpbWl6ZQoKICBpZiAoY3B1bWFza190ZXN0X2NwdShzbXBfcHJvY2Vzc29yX2lkKCks
IG1hc2spKQoKd2hlcmUgQG1hc2sgaXMgYSBib290LXRpbWUgY29uc3RhbnQgKGkuZS4gdGhlIG5v
aHpfZnVsbCBtYXNrKS4KCj4gVGhhbmtzLgo+Cj4gLS0KPiBGcmVkZXJpYyBXZWlzYmVja2VyCj4g
U1VTRSBMYWJzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
