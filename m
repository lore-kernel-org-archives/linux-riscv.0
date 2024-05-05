Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F8CC04FFE
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXM8cqldLSPhG+xS8opGbjpDP1jJqlMgbzjb/wvTqMU=; b=rvRWL2qbdi1vZf
	6ACrUveaJIyX3TKumldT2qAii1visrF35oCwoe2ZtuYi3EMKt96xib4g/sEtGiTpQeZgmXmKdlPdM
	QqgnlpcOFty/jRrLrkduUqJzfwG/QBFWyJiQWNWqmYI7saEDJ5HhyvyBHXP5c75tChpwSBEdrKDLs
	p/dxwjMy9/nEfjvP6rdIO2hEaHWYz1UF1xEYViOZ2LKulon5tiVmgMhFtgvoHpulchIxUsN2YMGNK
	5R1opoHFkBCuPb011Nc5nZTiOrG4vWPXLO0VTL/6CW9tCWAX/dDhczjSE2BiSgQ+ZQWnqKN0E3QrR
	sckbORiWq4WalxN45lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cpx-00000004SaN-0b1Q;
	Sun, 05 May 2024 14:27:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cpn-00000004SQD-0OIt;
	Sun, 05 May 2024 14:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4683A60C8B;
	Sun,  5 May 2024 14:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D95EC4AF67;
	Sun,  5 May 2024 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919241;
	bh=vbQmVIViLlnHnV/HmsoDNHPWB+6N7x9rENWps4lsXos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xl5iD4lueG8tIPXrO/gEXU39XDfM3YC/JMMh3852CFxF2oYh+paX9vBtiDNHobolr
	 fT4G8IF9fkbLUdGv2ikdeuc6+J2xDFH0KR/VTbUG+Hv/QdKrBr+pSDv9DFzfUPP2I3
	 bP2It0ZiWqKrpaFsBerSAvvYt92y2em8jZ93u0QN8uW5A3MxYvy1JsUox9JZRQ11j8
	 hWmui1dlwkA0uUH0DLGz65sT+kLHQX0p9W2t3k9zMl14nQC7TMegAfhWBFTdDhkJMw
	 rp4g/OdSjIa699sH+T7Z+caC4c3erFuVC8VvAkXFGQHM++7hzBOqRdtcFRKejSaFcx
	 8h5mYj3Qiu98Q==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 05/17] module: make module_memory_{alloc,free} more self-contained
Date: Sun,  5 May 2024 17:25:48 +0300
Message-ID: <20240505142600.2322517-6-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505142600.2322517-1-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_072723_860811_17AB4616 
X-CRM114-Status: GOOD (  18.74  )
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

RnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSkiIDxycHB0QGtlcm5lbC5vcmc+CgpNb3ZlIHRoZSBs
b2dpYyByZWxhdGVkIHRvIHRoZSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgZnJlZWluZyBpbnRvCm1v
ZHVsZV9tZW1vcnlfYWxsb2MoKSBhbmQgbW9kdWxlX21lbW9yeV9mcmVlKCkuCgpTaWduZWQtb2Zm
LWJ5OiBNaWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Ci0tLQoga2VybmVsL21v
ZHVsZS9tYWluLmMgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUvbWFpbi5jIGIva2VybmVsL21vZHVsZS9tYWluLmMK
aW5kZXggZTFlOGE3YTlkNmMxLi41YjgyYjA2OWUwZDMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9tb2R1
bGUvbWFpbi5jCisrKyBiL2tlcm5lbC9tb2R1bGUvbWFpbi5jCkBAIC0xMjAzLDE1ICsxMjAzLDQ0
IEBAIHN0YXRpYyBib29sIG1vZF9tZW1fdXNlX3ZtYWxsb2MoZW51bSBtb2RfbWVtX3R5cGUgdHlw
ZSkKIAkJbW9kX21lbV90eXBlX2lzX2NvcmVfZGF0YSh0eXBlKTsKIH0KIAotc3RhdGljIHZvaWQg
Km1vZHVsZV9tZW1vcnlfYWxsb2ModW5zaWduZWQgaW50IHNpemUsIGVudW0gbW9kX21lbV90eXBl
IHR5cGUpCitzdGF0aWMgaW50IG1vZHVsZV9tZW1vcnlfYWxsb2Moc3RydWN0IG1vZHVsZSAqbW9k
LCBlbnVtIG1vZF9tZW1fdHlwZSB0eXBlKQogeworCXVuc2lnbmVkIGludCBzaXplID0gUEFHRV9B
TElHTihtb2QtPm1lbVt0eXBlXS5zaXplKTsKKwl2b2lkICpwdHI7CisKKwltb2QtPm1lbVt0eXBl
XS5zaXplID0gc2l6ZTsKKwogCWlmIChtb2RfbWVtX3VzZV92bWFsbG9jKHR5cGUpKQotCQlyZXR1
cm4gdnphbGxvYyhzaXplKTsKLQlyZXR1cm4gbW9kdWxlX2FsbG9jKHNpemUpOworCQlwdHIgPSB2
bWFsbG9jKHNpemUpOworCWVsc2UKKwkJcHRyID0gbW9kdWxlX2FsbG9jKHNpemUpOworCisJaWYg
KCFwdHIpCisJCXJldHVybiAtRU5PTUVNOworCisJLyoKKwkgKiBUaGUgcG9pbnRlciB0byB0aGVz
ZSBibG9ja3Mgb2YgbWVtb3J5IGFyZSBzdG9yZWQgb24gdGhlIG1vZHVsZQorCSAqIHN0cnVjdHVy
ZSBhbmQgd2Uga2VlcCB0aGF0IGFyb3VuZCBzbyBsb25nIGFzIHRoZSBtb2R1bGUgaXMKKwkgKiBh
cm91bmQuIFdlIG9ubHkgZnJlZSB0aGF0IG1lbW9yeSB3aGVuIHdlIHVubG9hZCB0aGUgbW9kdWxl
LgorCSAqIEp1c3QgbWFyayB0aGVtIGFzIG5vdCBiZWluZyBhIGxlYWsgdGhlbi4gVGhlIC5pbml0
KiBFTEYKKwkgKiBzZWN0aW9ucyAqZG8qIGdldCBmcmVlZCBhZnRlciBib290IHNvIHdlICpjb3Vs
ZCogdHJlYXQgdGhlbQorCSAqIHNsaWdodGx5IGRpZmZlcmVudGx5IHdpdGgga21lbWxlYWtfaWdu
b3JlKCkgYW5kIG9ubHkgZ3JleQorCSAqIHRoZW0gb3V0IGFzIHRoZXkgd29yayBhcyB0eXBpY2Fs
IG1lbW9yeSBhbGxvY2F0aW9ucyB3aGljaAorCSAqICpkbyogZXZlbnR1YWxseSBnZXQgZnJlZWQs
IGJ1dCBsZXQncyBqdXN0IGtlZXAgdGhpbmdzIHNpbXBsZQorCSAqIGFuZCBhdm9pZCAqYW55KiBm
YWxzZSBwb3NpdGl2ZXMuCisJICovCisJa21lbWxlYWtfbm90X2xlYWsocHRyKTsKKworCW1lbXNl
dChwdHIsIDAsIHNpemUpOworCW1vZC0+bWVtW3R5cGVdLmJhc2UgPSBwdHI7CisKKwlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIHZvaWQgbW9kdWxlX21lbW9yeV9mcmVlKHZvaWQgKnB0ciwgZW51bSBt
b2RfbWVtX3R5cGUgdHlwZSkKK3N0YXRpYyB2b2lkIG1vZHVsZV9tZW1vcnlfZnJlZShzdHJ1Y3Qg
bW9kdWxlICptb2QsIGVudW0gbW9kX21lbV90eXBlIHR5cGUpCiB7CisJdm9pZCAqcHRyID0gbW9k
LT5tZW1bdHlwZV0uYmFzZTsKKwogCWlmIChtb2RfbWVtX3VzZV92bWFsbG9jKHR5cGUpKQogCQl2
ZnJlZShwdHIpOwogCWVsc2UKQEAgLTEyMjksMTIgKzEyNTgsMTIgQEAgc3RhdGljIHZvaWQgZnJl
ZV9tb2RfbWVtKHN0cnVjdCBtb2R1bGUgKm1vZCkKIAkJLyogRnJlZSBsb2NrLWNsYXNzZXM7IHJl
bGllcyBvbiB0aGUgcHJlY2VkaW5nIHN5bmNfcmN1KCkuICovCiAJCWxvY2tkZXBfZnJlZV9rZXlf
cmFuZ2UobW9kX21lbS0+YmFzZSwgbW9kX21lbS0+c2l6ZSk7CiAJCWlmIChtb2RfbWVtLT5zaXpl
KQotCQkJbW9kdWxlX21lbW9yeV9mcmVlKG1vZF9tZW0tPmJhc2UsIHR5cGUpOworCQkJbW9kdWxl
X21lbW9yeV9mcmVlKG1vZCwgdHlwZSk7CiAJfQogCiAJLyogTU9EX0RBVEEgaG9zdHMgbW9kLCBz
byBmcmVlIGl0IGF0IGxhc3QgKi8KIAlsb2NrZGVwX2ZyZWVfa2V5X3JhbmdlKG1vZC0+bWVtW01P
RF9EQVRBXS5iYXNlLCBtb2QtPm1lbVtNT0RfREFUQV0uc2l6ZSk7Ci0JbW9kdWxlX21lbW9yeV9m
cmVlKG1vZC0+bWVtW01PRF9EQVRBXS5iYXNlLCBNT0RfREFUQSk7CisJbW9kdWxlX21lbW9yeV9m
cmVlKG1vZCwgTU9EX0RBVEEpOwogfQogCiAvKiBGcmVlIGEgbW9kdWxlLCByZW1vdmUgZnJvbSBs
aXN0cywgZXRjLiAqLwpAQCAtMjIyNSw3ICsyMjU0LDYgQEAgc3RhdGljIGludCBmaW5kX21vZHVs
ZV9zZWN0aW9ucyhzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBsb2FkX2luZm8gKmluZm8pCiBz
dGF0aWMgaW50IG1vdmVfbW9kdWxlKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IGxvYWRfaW5m
byAqaW5mbykKIHsKIAlpbnQgaTsKLQl2b2lkICpwdHI7CiAJZW51bSBtb2RfbWVtX3R5cGUgdCA9
IDA7CiAJaW50IHJldCA9IC1FTk9NRU07CiAKQEAgLTIyMzQsMjYgKzIyNjIsMTIgQEAgc3RhdGlj
IGludCBtb3ZlX21vZHVsZShzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBsb2FkX2luZm8gKmlu
Zm8pCiAJCQltb2QtPm1lbVt0eXBlXS5iYXNlID0gTlVMTDsKIAkJCWNvbnRpbnVlOwogCQl9Ci0J
CW1vZC0+bWVtW3R5cGVdLnNpemUgPSBQQUdFX0FMSUdOKG1vZC0+bWVtW3R5cGVdLnNpemUpOwot
CQlwdHIgPSBtb2R1bGVfbWVtb3J5X2FsbG9jKG1vZC0+bWVtW3R5cGVdLnNpemUsIHR5cGUpOwot
CQkvKgotICAgICAgICAgICAgICAgICAqIFRoZSBwb2ludGVyIHRvIHRoZXNlIGJsb2NrcyBvZiBt
ZW1vcnkgYXJlIHN0b3JlZCBvbiB0aGUgbW9kdWxlCi0gICAgICAgICAgICAgICAgICogc3RydWN0
dXJlIGFuZCB3ZSBrZWVwIHRoYXQgYXJvdW5kIHNvIGxvbmcgYXMgdGhlIG1vZHVsZSBpcwotICAg
ICAgICAgICAgICAgICAqIGFyb3VuZC4gV2Ugb25seSBmcmVlIHRoYXQgbWVtb3J5IHdoZW4gd2Ug
dW5sb2FkIHRoZSBtb2R1bGUuCi0gICAgICAgICAgICAgICAgICogSnVzdCBtYXJrIHRoZW0gYXMg
bm90IGJlaW5nIGEgbGVhayB0aGVuLiBUaGUgLmluaXQqIEVMRgotICAgICAgICAgICAgICAgICAq
IHNlY3Rpb25zICpkbyogZ2V0IGZyZWVkIGFmdGVyIGJvb3Qgc28gd2UgKmNvdWxkKiB0cmVhdCB0
aGVtCi0gICAgICAgICAgICAgICAgICogc2xpZ2h0bHkgZGlmZmVyZW50bHkgd2l0aCBrbWVtbGVh
a19pZ25vcmUoKSBhbmQgb25seSBncmV5Ci0gICAgICAgICAgICAgICAgICogdGhlbSBvdXQgYXMg
dGhleSB3b3JrIGFzIHR5cGljYWwgbWVtb3J5IGFsbG9jYXRpb25zIHdoaWNoCi0gICAgICAgICAg
ICAgICAgICogKmRvKiBldmVudHVhbGx5IGdldCBmcmVlZCwgYnV0IGxldCdzIGp1c3Qga2VlcCB0
aGluZ3Mgc2ltcGxlCi0gICAgICAgICAgICAgICAgICogYW5kIGF2b2lkICphbnkqIGZhbHNlIHBv
c2l0aXZlcy4KLQkJICovCi0JCWttZW1sZWFrX25vdF9sZWFrKHB0cik7Ci0JCWlmICghcHRyKSB7
CisKKwkJcmV0ID0gbW9kdWxlX21lbW9yeV9hbGxvYyhtb2QsIHR5cGUpOworCQlpZiAocmV0KSB7
CiAJCQl0ID0gdHlwZTsKIAkJCWdvdG8gb3V0X2Vub21lbTsKIAkJfQotCQltZW1zZXQocHRyLCAw
LCBtb2QtPm1lbVt0eXBlXS5zaXplKTsKLQkJbW9kLT5tZW1bdHlwZV0uYmFzZSA9IHB0cjsKIAl9
CiAKIAkvKiBUcmFuc2ZlciBlYWNoIHNlY3Rpb24gd2hpY2ggc3BlY2lmaWVzIFNIRl9BTExPQyAq
LwpAQCAtMjI5Niw3ICsyMzEwLDcgQEAgc3RhdGljIGludCBtb3ZlX21vZHVsZShzdHJ1Y3QgbW9k
dWxlICptb2QsIHN0cnVjdCBsb2FkX2luZm8gKmluZm8pCiAJcmV0dXJuIDA7CiBvdXRfZW5vbWVt
OgogCWZvciAodC0tOyB0ID49IDA7IHQtLSkKLQkJbW9kdWxlX21lbW9yeV9mcmVlKG1vZC0+bWVt
W3RdLmJhc2UsIHQpOworCQltb2R1bGVfbWVtb3J5X2ZyZWUobW9kLCB0KTsKIAlyZXR1cm4gcmV0
OwogfQogCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
