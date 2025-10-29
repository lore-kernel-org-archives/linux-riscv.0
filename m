Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A860CCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G15ofyiWculgO0f0JWllvR4abeG5Jz4xv39aQwn1/tc=; b=KfR+PKPBLHg/zr
	QoNj3T3HPdNB0v90K5Xv8N+Z2oMRxPwqwtvgP9wE4Hr8kIfspltnZwL3r+grmWYqwKnGDslaaUxaG
	GWTuPUOxYScs/dpVR8A+S2W15WKYiQFVmrYnX6Fl0A6kWSxqGVmJm4ox2MzYL5IP0EZLPc8epaXcH
	9UbEra98zTjIVTuPwzgYD5nc3amtVpD47MYPZpF0KgJWAil777qb4ku1F8ZjRLxdG1g1V+a7VMq0i
	BRUhXtLe3F95kkTe8PsKX09JAjrtRPRUIg7ELB8r8NSc5nJRwt0kiYoJNuHmfcZxaixwp2P1oE2iq
	gihsAee5rfGx2pHZCicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE383-00000000dq8-2PWv;
	Wed, 29 Oct 2025 10:10:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE37y-00000000dkJ-0BnY
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 10:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761732599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8VL8F1BbEiYOKI5l4LcZTZfjaaIUn5rioPCVGdYu3M=;
	b=iAsyiOz8WJbKJ1pUlEb3Lt3RnbmTs+pEVwwmsG12ple4osYSimbGcqZpqCyqZr8GV7kGEm
	o4rGqealshc15P7grtOobHS9WYWjo4c7YHw+kd/6kREGLB7JZM1xjowb3bEa1U+Mr5BXzg
	qBZmq+4t8+pQt571x4onhnpHSUsWF5o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-8eQGzHhFOFOIlPF0-1rQ2w-1; Wed, 29 Oct 2025 06:09:55 -0400
X-MC-Unique: 8eQGzHhFOFOIlPF0-1rQ2w-1
X-Mimecast-MFC-AGG-ID: 8eQGzHhFOFOIlPF0-1rQ2w_1761732594
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4270a273b6eso5370453f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 03:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732594; x=1762337394;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7va99Zg9nu4+XxtsT3y+i0Qg89ua4ByIHfysL3F+F4=;
        b=ORqECdFeYv6ztplENmqARHjibkBOGVf3HFM8/C3jAhXgIp3yFDFRMO/iSLu9JkfiEx
         MAv16FpmAPQZapg8ZYIcu1/39lVKeeOfUUTbdlWh5UW8H8fLkoJ/HYjuWHbaVySLfRfR
         I3OtEC5UQmvx10N+kt6VOhFhAPfM/K78iSIGA0OhT9jJcOKUEcVzispewvMNRYxWFqnn
         Cak4KKzaxNmp5sPHn2WUy9u6k2sdHj7HI5ok0twZLQrguffejD6TPDTUVs2dWPZK5pkH
         2dw1wfyZqHdF+LhWmeRGb7TSbTymyuYC8VoW3+K9OPEc7k+QbyLQGgJr+UsiIzaqmWMl
         jn4A==
X-Forwarded-Encrypted: i=1; AJvYcCUzcLyGpxC2tnRST6P/PpyMRnZTZ9SqsrENxqFF3NfdN+nR1T1GOSAgNIfPzjLJV4iTBQPIY5oXuwWHlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+habICMQI79uwjVMBNodJpRFPHYgmg7Hcz0jGWX/MI5Q1n1RP
	5b5AgZdKDk9TowSJmdzNAvzMnEajm6+Cw33+mAmXyDrxXXRnuUhtdUpl6SN0Z9Z3sTo7NNGSoeO
	UYCYuqLFtrdLc2fOmwCdAvbMZXDHvN+ljAOoCb7nF5xo3l0kz4wFAxlJCErLYXcSIAPLbrA==
X-Gm-Gg: ASbGncuLbpHaG06cHcqq6/DAw0fk3PRtmDuvt47mlI9BnT+iH2UCc8UydCn8v0e3j+q
	GqG5BaT0ujU+1O/7KeAxpFwHfz85eSZ4US8uzc/6rMgDfvqlYBzhLpMkeWdx4hg8fsyJxJENn9u
	KmXYjKNupgHaMX1SrjREfQtiaTYmcr5+3ZiqIHLnBVH1p4fxyCfSj6JbHPBM0ydu11atqj5I9VY
	2fsylFP4dODqfSoV85kkhubkWacDy52oWDsstvRk7S2nLpS/yx579xeXYnOyKnPIB3I1/wiK+D/
	jJ4APTIcgcmN5BnpgJ5W5u9NSAWrakaozTYsXYxS2/NWziNMiLW/v67W3Wb/gQ+ZMpWXYIPcwP1
	9aSwo/E90C17JxguImuebR8D58y7NLVkPDHicxC4+pqbgwPJq5v0jJJTt83sJ
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1733939f8f.18.1761732594352;
        Wed, 29 Oct 2025 03:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMwZOd1Sm4LKIO70Dn8iCGAQm9z32hncQVtTx+dFITCY/jcrLahS/V2gOWr58H4oqqEmvh5w==
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1733872f8f.18.1761732593822;
        Wed, 29 Oct 2025 03:09:53 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm25467518f8f.47.2025.10.29.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:09:52 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Nicolas
 Saenz Julienne <nsaenzju@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 23/29] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <aQDMfu0tzecFzoGr@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-24-vschneid@redhat.com>
 <aQDMfu0tzecFzoGr@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:09:50 +0100
Message-ID: <xhsmh5xbyqas1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A7v3Ildu0JAXmCyHE5ZZYeRIpJu_gXJpzkUUvYtpzNE_1761732594
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_031004_055358_25FB69B6 
X-CRM114-Status: GOOD (  19.39  )
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

T24gMjgvMTAvMjUgMTU6MDAsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgRnJpLCBP
Y3QgMTAsIDIwMjUgYXQgMDU6Mzg6MzNQTSArMDIwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gKwlvbGQgPSBhdG9taWNfcmVhZCgmY3QtPnN0YXRlKTsKPj4gKwo+PiArCS8qCj4+
ICsJICogVGhlIHdvcmsgYml0IG11c3Qgb25seSBiZSBzZXQgaWYgdGhlIHRhcmdldCBDUFUgaXMg
bm90IGV4ZWN1dGluZwo+PiArCSAqIGluIGtlcm5lbHNwYWNlLgo+PiArCSAqIENUX1JDVV9XQVRD
SElORyBpcyB1c2VkIGFzIGEgcHJveHkgZm9yIHRoYXQgLSBpZiB0aGUgYml0IGlzIHNldCwgd2UK
Pj4gKwkgKiBrbm93IGZvciBzdXJlIHRoZSBDUFUgaXMgZXhlY3V0aW5nIGluIHRoZSBrZXJuZWwg
d2hldGhlciB0aGF0IGJlIGluCj4+ICsJICogTk1JLCBJUlEgb3IgcHJvY2VzcyBjb250ZXh0Lgo+
PiArCSAqIFNldCBDVF9SQ1VfV0FUQ0hJTkcgaGVyZSBhbmQgbGV0IHRoZSBjbXB4Y2hnIGRvIHRo
ZSBjaGVjayBmb3IgdXM7Cj4+ICsJICogdGhlIHN0YXRlIGNvdWxkIGNoYW5nZSBiZXR3ZWVuIHRo
ZSBhdG9taWNfcmVhZCgpIGFuZCB0aGUgY21weGNoZygpLgo+PiArCSAqLwo+PiArCW9sZCB8PSBD
VF9SQ1VfV0FUQ0hJTkc7Cj4KPiBNb3N0IG9mIHRoZSB0aW1lLCB0aGUgdGFzayBzaG91bGQgYmUg
ZWl0aGVyIGlkbGUgb3IgaW4gdXNlcnNwYWNlLiBJJ20gc3RpbGwgbm90Cj4gc3VyZSB3aHkgeW91
IHN0YXJ0IHdpdGggYSBiZXQgdGhhdCB0aGUgQ1BVIGlzIGluIHRoZSBrZXJuZWwgd2l0aCBSQ1Ug
d2F0Y2hpbmcuCj4KClJpZ2h0IEkgdGhpbmsgSSBnb3QgdGhhdCB0aGUgd3Jvbmcgd2F5IGFyb3Vu
ZCB3aGVuIEkgc3dpdGNoZWQgdG8gdXNpbmcKQ1RfUkNVX1dBVENISU5HIHZzIENUX1NUQVRFX0tF
Uk5FTC4gVGhhdCB3YW50cyB0byBiZQoKICBvbGQgJj0gfkNUX1JDVV9XQVRDSElORzsKCmkuZS4g
YmV0IHRoZSBDUFUgaXMgTk9IWi1pZGxlLCBpZiBpdCdzIG5vdCB0aGUgY21weGNoZyBmYWlscyBh
bmQgd2UgZG9uJ3QKc3RvcmUgdGhlIHdvcmsgYml0LgoKPj4gKwkvKgo+PiArCSAqIFRyeSBzZXR0
aW5nIHRoZSB3b3JrIHVudGlsIGVpdGhlcgo+PiArCSAqIC0gdGhlIHRhcmdldCBDUFUgaGFzIGVu
dGVyZWQga2VybmVsc3BhY2UKPj4gKwkgKiAtIHRoZSB3b3JrIGhhcyBiZWVuIHNldAo+PiArCSAq
Lwo+PiArCWRvIHsKPj4gKwkJcmV0ID0gYXRvbWljX3RyeV9jbXB4Y2hnKCZjdC0+c3RhdGUsICZv
bGQsIG9sZCB8ICh3b3JrIDw8IENUX1dPUktfU1RBUlQpKTsKPj4gKwl9IHdoaWxlICghcmV0ICYm
ICEob2xkICYgQ1RfUkNVX1dBVENISU5HKSk7Cj4KPiBTbyB0aGlzIGFwcGxpZXMgYmxpbmRseSB0
byBpZGxlIGFzIHdlbGwsIHJpZ2h0PyBJdCBzaG91bGQgd29yayBidXQgbm90ZSB0aGF0Cj4gaWRs
ZSBlbnRyeSBjb2RlIGJlZm9yZSBSQ1Ugd2F0Y2hlcyBpcyBhbHNvIGZyYWdpbGUuCj4KClllYWgg
SSByZW1lbWJlciBsb3Npbmcgc29tZSBoYWlyIHRyeWluZyB0byBncm9rIHRoZSBpZGxlIGVudHJ5
IHNpdHVhdGlvbjsKd2UgY291bGQga2VlcCB0aGlzIHB1cmVseSBOT0haX0ZVTEwgYW5kIGhhdmUg
dGhlIGRlZmVycmFsIGNvbmRpdGlvbiBiZToKCiAgKGN0LT5zdGF0ZSAmIENUX1NUQVRFX1VTRVIp
ICYmICEoY3QtPnN0YXRlICYgQ1RfUkNVX1dBVENISU5HKQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
