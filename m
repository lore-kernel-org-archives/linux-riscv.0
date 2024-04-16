Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427EAC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywYXyfX+VmrWdkhP7iKSAgbW4alAMGUQ/4AcowbN+UE=; b=xZVyFx7X4j7rds
	eI/hAehUGuMlh1FaoUEfELDek9Dck1ksIj5vIkNzNGviVIUkak04tO3wZ1Ll9qifiFW1sAOp6Jywb
	yTOTCKFtl2aRTgmnUZpQ92wH9OruaAf8jFSJJ9aUnHu92c9lMkCVcNTfV+8jXXv/whZoY9Gl9w5IB
	EECEkImDhcg59QkMewJASbG9EWOCT/6E9GSFtiXPWaLXcNQ+9/nPLSo4O7AKs181QpVFvT+cf4TtB
	1V/KrEbAqtYgQEiOA8FR/RjlMbgjo9Rn9JBAFIkeYjefgtXAXJ+atrCVvAcVPCZyB7XpTsRymCqxU
	BpYhzX61NKr1Np6P5YHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfEs-0000000Bcmz-1jKO;
	Tue, 16 Apr 2024 09:36:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfEo-0000000BckH-0Wvc;
	Tue, 16 Apr 2024 09:36:27 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-518e2283bd3so3180203e87.1;
        Tue, 16 Apr 2024 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713260183; x=1713864983; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOrASS+GeLuk5Z7lZoVL6cbT4rY+jK9WGpd682BgxR8=;
        b=VUj/WP7fPSdBv+h0qWfPlyxtr1QHFIxQdX8XMQRpDgInoEfpfP3Jfk/URrsh8LY0R/
         ZRjrKThsdMCj+5YRw3JzW+7jJwBm8lXvLDCta0MVL1lzuj7qT4n5Q62C04EXkLWL/B1H
         yOqCAKf3Rlt3x+1/Hm2jJOPkCtyBOO/E/RhrN8bsPTbbAnYuLl7+8tC5m++Bxd/z1dFQ
         pq9gLBTOvi/rY9f+4d6mCQiJZRzoEAvoZufTmLheYHmCVTvZ1x3MiUu+TO8SDPWawBFj
         f/8LInptk4SYQc66+PZdXbxpnUqNA+dlO6dwjUzItYjz5//oVcFbUZBzqirvem7caYIj
         gvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713260183; x=1713864983;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOrASS+GeLuk5Z7lZoVL6cbT4rY+jK9WGpd682BgxR8=;
        b=RQEBF/eYsGWnowWooEZx5/4I1Shd32/eoJR+7AIkQcpJC4lpQXfWjDUoECuWM1m857
         nCZi2q73apphibMJTbcIzig4DT1HnJ60T173fVY1GTvoB9bmWjM11Z1z6DyR9DMGbnAd
         YlXntFiSyFms2XTpEgHQNy3tPjP5RpjlFjVWsyKfAjRh47J464VTCxs8ZCH72q2kq7ox
         nChOwKzQ8EWFiwXIOLq8xys/OgwNYPgSNIlHuQVJo7L+hBVEguL6SnQJXa1txCT3qLxf
         9W0K2WLnoL12/M0Ym4tJdQwRGHle65HNBmhZD77uTz5Jj8FuX8c4HsIIH1YHbc6xNCvy
         xwkw==
X-Forwarded-Encrypted: i=1; AJvYcCVgjX1RbbfVMrbEdvR0i0yMNoRT+5wA0G/HdY1anxAHQNO/8qGhkGEehvZ8Zubo80oEdlLb8xUhnHLbnhgzi4c04PaEAsk0FXtGSi/C/3mWwpAc19yM4NZ39Xfc/VdbqqqbkYStPiIxPP2eOYqH4VR/Y42v3ns=
X-Gm-Message-State: AOJu0YzCkVj4AOwZvXfQpalIReNO5tjjjLXwaFITo/kQNeesCSEj4+K/
	aDpjm7ivOZpaKuZb2YYkQQ94qgA0TU95aiZ5wQ0C5sk9uzsEtB9U
X-Google-Smtp-Source: AGHT+IHJL+kGebuWf568L4j1/19JnbEd5orWvCbxsHgvPeVxrnDNkney9hr1xgtB5xtFbL8mR9qM0Q==
X-Received: by 2002:ac2:5f87:0:b0:516:cdfa:1802 with SMTP id r7-20020ac25f87000000b00516cdfa1802mr9934425lfe.63.1713260182555;
        Tue, 16 Apr 2024 02:36:22 -0700 (PDT)
Received: from smtpclient.apple ([132.68.46.107])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090615c100b00a524e3f2f9esm4249223ejd.98.2024.04.16.02.36.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2024 02:36:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [RFC PATCH 3/7] module: prepare to handle ROX allocations for
 text
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20240411160526.2093408-4-rppt@kernel.org>
Date: Tue, 16 Apr 2024 12:36:08 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Helge Deller <deller@gmx.de>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uladzislau Rezki <urezki@gmail.com>,
 Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org,
 linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 the arch/x86 maintainers <x86@kernel.org>
Message-Id: <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_023626_194917_7BE45A36 
X-CRM114-Status: GOOD (  15.75  )
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

Cgo+IE9uIDExIEFwciAyMDI0LCBhdCAxOTowNSwgTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwu
b3JnPiB3cm90ZToKPiAKPiBAQCAtMjQ0MCw3ICsyNDc5LDI0IEBAIHN0YXRpYyBpbnQgcG9zdF9y
ZWxvY2F0aW9uKHN0cnVjdCBtb2R1bGUgKm1vZCwgY29uc3Qgc3RydWN0IGxvYWRfaW5mbyAqaW5m
bykKPiAJYWRkX2thbGxzeW1zKG1vZCwgaW5mbyk7Cj4gCj4gCS8qIEFyY2gtc3BlY2lmaWMgbW9k
dWxlIGZpbmFsaXppbmcuICovCj4gLQlyZXR1cm4gbW9kdWxlX2ZpbmFsaXplKGluZm8tPmhkciwg
aW5mby0+c2VjaGRycywgbW9kKTsKPiArCXJldCA9IG1vZHVsZV9maW5hbGl6ZShpbmZvLT5oZHIs
IGluZm8tPnNlY2hkcnMsIG1vZCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+
ICsJZm9yX2VhY2hfbW9kX21lbV90eXBlKHR5cGUpIHsKPiArCQlzdHJ1Y3QgbW9kdWxlX21lbW9y
eSAqbWVtID0gJm1vZC0+bWVtW3R5cGVdOwo+ICsKPiArCQlpZiAobWVtLT5pc19yb3gpIHsKPiAr
CQkJaWYgKCFleGVjbWVtX3VwZGF0ZV9jb3B5KG1lbS0+YmFzZSwgbWVtLT5yd19jb3B5LAo+ICsJ
CQkJCQkgbWVtLT5zaXplKSkKPiArCQkJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCQkJdmZyZWUo
bWVtLT5yd19jb3B5KTsKPiArCQkJbWVtLT5yd19jb3B5ID0gTlVMTDsKPiArCQl9Cj4gKwl9Cj4g
Kwo+ICsJcmV0dXJuIDA7Cj4gfQoKSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGl0
IHNlZW1zIGEgYml0IHJhY3kuCgpJSVVDLCBtb2R1bGVfZmluYWxpemUoKSBjYWxscyBhbHRlcm5h
dGl2ZXNfc21wX21vZHVsZV9hZGQoKS4gQXQgdGhpcwpwb2ludCwgc2luY2UgeW91IGRvbuKAmXQg
aG9sZCB0aGUgdGV4dF9tdXRleCwgc29tZSBtaWdodCBkbyB0ZXh0X3Bva2UoKSwKZS5nLiwgYnkg
ZW5hYmxpbmcvZGlzYWJsaW5nIHN0YXRpYy1rZXksIGFuZCB0aGUgdXBkYXRlIHdvdWxkIGJlCm92
ZXJ3cml0dGVuLiBObz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
