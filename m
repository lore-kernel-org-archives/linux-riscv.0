Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D498FE7D0B4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 22:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/mDkaTqCXhT7UlMKUzipSUMcfAPJ5c8y3LJ8fX/eOw=; b=boRLtlz95riAcB
	XzemgcieHngNFFMq1Da1TWvZ/RjM4gBc0Hu0OsqFabZuBs7FcLVnhoNoLSMAQWAgnT9CnH9UUEIQ1
	SwC377AUAZHr12ZQFwki/BCjiou11cQr71YmZQpt8CJzvJpw3MMdNI4mo9/ZehIxI4ZKdqTNt3HOv
	gPU+H4Qd7fJR8gjPrbSgzSq7YhS0s8+TpBUYJUaRplPMGnwtqewLX6p8wlqyPn7QoXrpff9XwEF2O
	0qnqA4Uw/iBxX0+FAFQD4MRbbmymCxpuhi3lE0gJaSvPK7nPe+G//SjYpSK5+sGvVwarY4D9SRZc5
	nvysUvkVDvSlOUcyX49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjSXL-007KUj-0T;
	Thu, 21 Sep 2023 22:52:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjSXH-007KSv-20;
	Thu, 21 Sep 2023 22:52:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 03DE5CE2413;
	Thu, 21 Sep 2023 22:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3BBC433D9;
	Thu, 21 Sep 2023 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695336755;
	bh=N+rCKzD4RnGgPH16U+ccWdzVA4uu9GwvbHIaEOV8lLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bjJNwevJA42TvkguuRjTs76ETN2R6q990VwsQaX+fVZHYFTVg3twcHMCXBi+EwswY
	 KDvM3rQnSpp34FNwfM0U/WFpPi5sxiWBihMbkmLQVD3dMwe0w1TV/6pnGa5fK7MnRq
	 f/RnmF4zvwavGrTVGR9fsTL6T+hC8QShKMLdwjOkeOLZk0rpJgxA2dFhnnTnVB9Xwk
	 TCSjg9WYJ/gz4jSOZ5+6CD4cbsh3pPk93gUBjEKQnbqdin3Ors6QaTCSNo54GO47rs
	 GROCJ3RhQnOtTsYPDlxmiEmDKgihH28meWIoUHV/vobKuLSBg7uQPTbsXHKf9QQFkj
	 fMbBtTpx4QTiw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-502e6d632b6so2476997e87.0;
        Thu, 21 Sep 2023 15:52:35 -0700 (PDT)
X-Gm-Message-State: AOJu0YytkbX2vo4DuKNzrDfBW3h6BW4a5ta3IgwpqdAYQmeHRQzo9lqn
	Dfx38/1q05/VpxQJTqalcMJTZVyF0yOVjnbc0uQ=
X-Google-Smtp-Source: AGHT+IHrJYRcXcnBl5OYoAS68DJ303ssKI8aEm5234o+h+Cle34G5bJm6ZjjrxLZlbKjfe5M7kikSCFf7m0lncLYrfA=
X-Received: by 2002:a05:6512:ac7:b0:500:b3e3:6fa6 with SMTP id
 n7-20020a0565120ac700b00500b3e36fa6mr7384141lfu.68.1695336753899; Thu, 21 Sep
 2023 15:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-7-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:52:21 -0700
X-Gmail-Original-Message-ID: <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
Message-ID: <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_155240_012745_401BD2DD 
X-CRM114-Status: GOOD (  27.35  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzHigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+ClsuLi5dCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZXhl
Y21lbS5oIGIvaW5jbHVkZS9saW51eC9leGVjbWVtLmgKPiBpbmRleCA1MTliZGZkY2E1OTUuLjA5
ZDQ1YWM3ODZlOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2V4ZWNtZW0uaAo+ICsrKyBi
L2luY2x1ZGUvbGludXgvZXhlY21lbS5oCj4gQEAgLTI5LDYgKzI5LDcgQEAKPiAgICogQEVYRUNN
RU1fS1BST0JFUzogcGFyYW1ldGVycyBmb3Iga3Byb2Jlcwo+ICAgKiBARVhFQ01FTV9GVFJBQ0U6
IHBhcmFtZXRlcnMgZm9yIGZ0cmFjZQo+ICAgKiBARVhFQ01FTV9CUEY6IHBhcmFtZXRlcnMgZm9y
IEJQRgo+ICsgKiBARVhFQ01FTV9NT0RVTEVfREFUQTogcGFyYW1ldGVycyBmb3IgbW9kdWxlIGRh
dGEgc2VjdGlvbnMKPiAgICogQEVYRUNNRU1fVFlQRV9NQVg6Cj4gICAqLwo+ICBlbnVtIGV4ZWNt
ZW1fdHlwZSB7Cj4gQEAgLTM3LDYgKzM4LDcgQEAgZW51bSBleGVjbWVtX3R5cGUgewo+ICAgICAg
ICAgRVhFQ01FTV9LUFJPQkVTLAo+ICAgICAgICAgRVhFQ01FTV9GVFJBQ0UsCgpJbiBsb25nZXIg
dGVybSwgSSB0aGluayB3ZSBjYW4gaW1wcm92ZSB0aGUgSklUZWQgY29kZSBhbmQgbWVyZ2UKa3By
b2JlL2Z0cmFjZS9icGYuIHRvIHVzZSB0aGUgc2FtZSByYW5nZXMuIEFsc28sIGRvIHdlIG5lZWQg
c3BlY2lhbApzZXR0aW5nIGZvciBGVFJBQ0U/IElmIG5vdCwgbGV0J3MganVzdCByZW1vdmUgaXQu
Cgo+ICAgICAgICAgRVhFQ01FTV9CUEYsCj4gKyAgICAgICBFWEVDTUVNX01PRFVMRV9EQVRBLAo+
ICAgICAgICAgRVhFQ01FTV9UWVBFX01BWCwKPiAgfTsKCk92ZXJhbGwsIGl0IGlzIGdyZWF0IHRo
YXQga3Byb2JlL2Z0cmFjZS9icGYgbm8gbG9uZ2VyIGRlcGVuZCBvbiBtb2R1bGVzLgoKT1RPSCwg
SSB0aGluayB3ZSBzaG91bGQgbWVyZ2UgZXhlY21lbV90eXBlIGFuZCBleGlzdGluZyBtb2RfbWVt
X3R5cGUuCk90aGVyd2lzZSwgd2Ugc3RpbGwgbmVlZCB0byBoYW5kbGUgcGFnZSBwZXJtaXNzaW9u
cyBpbiBtdWx0aXBsZSBwbGFjZXMuCldoYXQgaXMgb3VyIHBsYW4gZm9yIHRoYXQ/CgpUaGFua3Ms
ClNvbmcKCgo+Cj4gQEAgLTEwNyw2ICsxMDksMjMgQEAgc3RydWN0IGV4ZWNtZW1fcGFyYW1zICpl
eGVjbWVtX2FyY2hfcGFyYW1zKHZvaWQpOwo+ICAgKi8KPiAgdm9pZCAqZXhlY21lbV90ZXh0X2Fs
bG9jKGVudW0gZXhlY21lbV90eXBlIHR5cGUsIHNpemVfdCBzaXplKTsKPgo+ICsvKioKPiArICog
ZXhlY21lbV9kYXRhX2FsbG9jIC0gYWxsb2NhdGUgbWVtb3J5IGZvciBkYXRhIGNvdXBsZWQgdG8g
Y29kZQo+ICsgKiBAdHlwZTogdHlwZSBvZiB0aGUgYWxsb2NhdGlvbgo+ICsgKiBAc2l6ZTogaG93
IG1hbnkgYnl0ZXMgb2YgbWVtb3J5IGFyZSByZXF1aXJlZAo+ICsgKgo+ICsgKiBBbGxvY2F0ZXMg
bWVtb3J5IHRoYXQgd2lsbCBjb250YWluIGRhdGEgY291cGxlZCB3aXRoIGV4ZWN1dGFibGUgY29k
ZSwKPiArICogbGlrZSBkYXRhIHNlY3Rpb25zIGluIGtlcm5lbCBtb2R1bGVzLgo+ICsgKgo+ICsg
KiBUaGUgbWVtb3J5IHdpbGwgaGF2ZSBwcm90ZWN0aW9ucyBkZWZpbmVkIGJ5IGFyY2hpdGVjdHVy
ZS4KPiArICoKPiArICogVGhlIGFsbG9jYXRlZCBtZW1vcnkgd2lsbCByZXNpZGUgaW4gYW4gYXJl
YSB0aGF0IGRvZXMgbm90IGltcG9zZQo+ICsgKiByZXN0cmljdGlvbnMgb24gdGhlIGFkZHJlc3Np
bmcgbW9kZXMuCj4gKyAqCj4gKyAqIFJldHVybjogYSBwb2ludGVyIHRvIHRoZSBhbGxvY2F0ZWQg
bWVtb3J5IG9yICVOVUxMCj4gKyAqLwo+ICt2b2lkICpleGVjbWVtX2RhdGFfYWxsb2MoZW51bSBl
eGVjbWVtX3R5cGUgdHlwZSwgc2l6ZV90IHNpemUpOwo+ICsKPiAgLyoqCj4gICAqIGV4ZWNtZW1f
ZnJlZSAtIGZyZWUgZXhlY3V0YWJsZSBtZW1vcnkKPiAgICogQHB0cjogcG9pbnRlciB0byB0aGUg
bWVtb3J5IHRoYXQgc2hvdWxkIGJlIGZyZWVkCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUv
bWFpbi5jIGIva2VybmVsL21vZHVsZS9tYWluLmMKPiBpbmRleCBjNDE0NmJmY2QwYTcuLjJhZTgz
YTZhYmY2NiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvbW9kdWxlL21haW4uYwo+ICsrKyBiL2tlcm5l
bC9tb2R1bGUvbWFpbi5jCj4gQEAgLTExODgsMjUgKzExODgsMTYgQEAgdm9pZCBfX3dlYWsgbW9k
dWxlX2FyY2hfZnJlZWluZ19pbml0KHN0cnVjdCBtb2R1bGUgKm1vZCkKPiAgewo+ICB9Cj4KPiAt
c3RhdGljIGJvb2wgbW9kX21lbV91c2Vfdm1hbGxvYyhlbnVtIG1vZF9tZW1fdHlwZSB0eXBlKQo+
IC17Cj4gLSAgICAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfQVJDSF9XQU5UU19NT0RVTEVT
X0RBVEFfSU5fVk1BTExPQykgJiYKPiAtICAgICAgICAgICAgICAgbW9kX21lbV90eXBlX2lzX2Nv
cmVfZGF0YSh0eXBlKTsKPiAtfQo+IC0KPiAgc3RhdGljIHZvaWQgKm1vZHVsZV9tZW1vcnlfYWxs
b2ModW5zaWduZWQgaW50IHNpemUsIGVudW0gbW9kX21lbV90eXBlIHR5cGUpCj4gIHsKPiAtICAg
ICAgIGlmIChtb2RfbWVtX3VzZV92bWFsbG9jKHR5cGUpKQo+IC0gICAgICAgICAgICAgICByZXR1
cm4gdnphbGxvYyhzaXplKTsKPiArICAgICAgIGlmIChtb2RfbWVtX3R5cGVfaXNfZGF0YSh0eXBl
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGV4ZWNtZW1fZGF0YV9hbGxvYyhFWEVDTUVNX01P
RFVMRV9EQVRBLCBzaXplKTsKPiAgICAgICAgIHJldHVybiBleGVjbWVtX3RleHRfYWxsb2MoRVhF
Q01FTV9NT0RVTEVfVEVYVCwgc2l6ZSk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBtb2R1bGVfbWVt
b3J5X2ZyZWUodm9pZCAqcHRyLCBlbnVtIG1vZF9tZW1fdHlwZSB0eXBlKQo+ICB7Cj4gLSAgICAg
ICBpZiAobW9kX21lbV91c2Vfdm1hbGxvYyh0eXBlKSkKPiAtICAgICAgICAgICAgICAgdmZyZWUo
cHRyKTsKPiAtICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAgZXhlY21lbV9mcmVlKHB0cik7
Cj4gKyAgICAgICBleGVjbWVtX2ZyZWUocHRyKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGZyZWVf
bW9kX21lbShzdHJ1Y3QgbW9kdWxlICptb2QpCj4gZGlmZiAtLWdpdCBhL21tL2V4ZWNtZW0uYyBi
L21tL2V4ZWNtZW0uYwo+IGluZGV4IGFiY2JkMDdlMDVhYy4uYWVmZjg1MjYxMzYwIDEwMDY0NAo+
IC0tLSBhL21tL2V4ZWNtZW0uYwo+ICsrKyBiL21tL2V4ZWNtZW0uYwo+IEBAIC01MywxMSArNTMs
MjMgQEAgc3RhdGljIHZvaWQgKmV4ZWNtZW1fYWxsb2Moc2l6ZV90IHNpemUsIHN0cnVjdCBleGVj
bWVtX3JhbmdlICpyYW5nZSkKPiAgICAgICAgIHJldHVybiBrYXNhbl9yZXNldF90YWcocCk7Cj4g
IH0KPgo+ICtzdGF0aWMgaW5saW5lIGJvb2wgZXhlY21lbV9yYW5nZV9pc19kYXRhKGVudW0gZXhl
Y21lbV90eXBlIHR5cGUpCj4gK3sKPiArICAgICAgIHJldHVybiB0eXBlID09IEVYRUNNRU1fTU9E
VUxFX0RBVEE7Cj4gK30KPiArCj4gIHZvaWQgKmV4ZWNtZW1fdGV4dF9hbGxvYyhlbnVtIGV4ZWNt
ZW1fdHlwZSB0eXBlLCBzaXplX3Qgc2l6ZSkKPiAgewo+ICAgICAgICAgcmV0dXJuIGV4ZWNtZW1f
YWxsb2Moc2l6ZSwgJmV4ZWNtZW1fcGFyYW1zLnJhbmdlc1t0eXBlXSk7Cj4gIH0KPgo+ICt2b2lk
ICpleGVjbWVtX2RhdGFfYWxsb2MoZW51bSBleGVjbWVtX3R5cGUgdHlwZSwgc2l6ZV90IHNpemUp
Cj4gK3sKPiArICAgICAgIFdBUk5fT05fT05DRSghZXhlY21lbV9yYW5nZV9pc19kYXRhKHR5cGUp
KTsKPiArCj4gKyAgICAgICByZXR1cm4gZXhlY21lbV9hbGxvYyhzaXplLCAmZXhlY21lbV9wYXJh
bXMucmFuZ2VzW3R5cGVdKTsKPiArfQo+ICsKPiAgdm9pZCBleGVjbWVtX2ZyZWUodm9pZCAqcHRy
KQo+ICB7Cj4gICAgICAgICAvKgo+IEBAIC05Myw3ICsxMDUsMTAgQEAgc3RhdGljIHZvaWQgZXhl
Y21lbV9pbml0X21pc3Npbmcoc3RydWN0IGV4ZWNtZW1fcGFyYW1zICpwKQo+ICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZXhlY21lbV9yYW5nZSAqciA9ICZwLT5yYW5nZXNbaV07Cj4KPiAgICAgICAg
ICAgICAgICAgaWYgKCFyLT5zdGFydCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHItPnBn
cHJvdCA9IGRlZmF1bHRfcmFuZ2UtPnBncHJvdDsKPiArICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoZXhlY21lbV9yYW5nZV9pc19kYXRhKGkpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgci0+cGdwcm90ID0gUEFHRV9LRVJORUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgci0+cGdwcm90ID0gZGVmYXVs
dF9yYW5nZS0+cGdwcm90Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHItPmFsaWdubWVudCA9
IGRlZmF1bHRfcmFuZ2UtPmFsaWdubWVudDsKPiAgICAgICAgICAgICAgICAgICAgICAgICByLT5z
dGFydCA9IGRlZmF1bHRfcmFuZ2UtPnN0YXJ0Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHIt
PmVuZCA9IGRlZmF1bHRfcmFuZ2UtPmVuZDsKPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
