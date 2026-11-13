Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09F606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o7AKFbfu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDjzVVrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2p1s3TnIuYPWI/WP3G1+SYw/eVK992M3McGymj3pG/I=; b=o7AKFbfuQtwiiSTzJr4nwbvmJM
	DTwbpugYO8iT89o+8vugnKAQ77WDt5f4cHH8LXnH/VH7urkAY9PpqtkaIQZOFt2WEsyyRRsmtGOzg
	+cPSGxy/jyHYvJtBDjzmW2yULa/1P/PZMt6BEKtvQJt8O+S4nHQkv4pv/B/yxXDE6kV1CSSS/ZzK8
	IeulBxah4r/1dW6f1ijH+WZtcqBEhGJ706faSa7l2ZdS5aUJ9BGYnp6yuTrfBMI1pdczcD+UEZuth
	LZTKxs1iT8fhNUTGAAp/0vbuJS0c3tNV7x7tI398A4Ie5CmPElLYnRAzfnWAXozGLfpmTiIMdgicT
	vuMjUoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsO2-0000000DBcd-1B8z;
	Fri, 13 Nov 2026 14:36:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsO1-0000000DBbp-2GTI;
	Fri, 13 Nov 2026 14:36:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47A0540039;
	Fri, 13 Nov 2026 14:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B8A1F000C4;
	Fri, 13 Nov 2026 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580577;
	bh=w49hyKAjJNYQc0T0xEVaI68+0oF+m2dcDRcRYzEk8rs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jDjzVVrUjcqqvOcF2zRf/R4D2SkobqauH5sB4E4FWc03X74m4jxFCQSio9YHHHuuR
	 9Ml4Tlrckfk60OSmZz+hec4p2l9kmjLvQBMrX/YWsRQQvgUFJp0NHQZIrCyw0Gwiek
	 QZbpgzhogd+cwsY3Nd25gGqUKt3Baw/aKdlCaoUNBkxmn6Z5pyPj2weF8qqKc3/A8M
	 /Hvf3OTZxfDyyZ1sLXoNdqhyld8LAWFVmEcfNS1X7e6OGeS63NUqhOrnPQq/ZF6Igj
	 DMtYYds7K9Hh4P0SFcSWYXYIJSddoBhMr/8mdEZ/t7+gx48plf7GD6vYahVdtRVM4l
	 DMbaEQTybkmNw==
Message-ID: <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org>
Date: Fri, 13 Nov 2026 15:36:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for
 kprobes allocations
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, Liviu Dudau
 <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-12-rppt@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20240505160628.2323363-12-rppt@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWlrZSwKCkxvb2tzIGxpa2UgSSBtaXNzZWQgdGhpcyBjaGFuZ2UgLi4uCgpMZSAwNS8wNS8y
MDI0IMOgIDE4OjA2LCBNaWtlIFJhcG9wb3J0IGEgw6ljcml0wqA6Cj4gRnJvbTogIk1pa2UgUmFw
b3BvcnQgKElCTSkiIDxycHB0QGtlcm5lbC5vcmc+Cj4gCj4gcG93ZXJwYyBvdmVycmlkZXMga3By
b2Jlczo6YWxsb2NfaW5zbl9wYWdlKCkgdG8gcmVtb3ZlIHdyaXRhYmxlCj4gcGVybWlzc2lvbnMg
d2hlbiBTVFJJQ1RfTU9EVUxFX1JXWCBpcyBvbi4KPiAKPiBBZGQgZGVmaW5pdGlvbiBvZiBFWEVD
TUVNX0tSUE9CRVMgdG8gZXhlY21lbV9wYXJhbXMgdG8gYWxsb3cgdXNpbmcgdGhlCj4gZ2VuZXJp
YyBrcHJvYmVzOjphbGxvY19pbnNuX3BhZ2UoKSB3aXRoIHRoZSBkZXNpcmVkIHBlcm1pc3Npb25z
Lgo+IAo+IEFzIHBvd2VycGMgdXNlcyBicmVha3BvaW50IGluc3RydWN0aW9ucyB0byBpbmplY3Qg
a3Byb2JlcywgaXQgZG9lcyBub3QKPiBuZWVkIHRvIGNvbnN0cmFpbiBrcHJvYmUgYWxsb2NhdGlv
bnMgdG8gdGhlIG1vZHVsZXMgYXJlYSBhbmQgY2FuIHVzZSB0aGUKPiBlbnRpcmUgdm1hbGxvYyBh
ZGRyZXNzIHNwYWNlLgoKVXNpbmcgYnJlYWtwb2ludCBtZWFucyB0aGUgc2VnbWVudCBtdXN0IHN0
aWxsIGJlIGV4ZWN1dGFibGUuCk9uIGJvb2szcy8zMiBWTUFMTE9DIHNlZ21lbnQgaXMgbm90IGV4
ZWN1dGFibGUsIHdoaWxlIG1vZHVsZSBzZWdtZW50IGlzLgoKU2VlIGNvbW1pdCA2Y2EwNTUzMjJk
YTggKCJwb3dlcnBjLzMyczogVXNlIGRlZGljYXRlZCBzZWdtZW50IGZvciBtb2R1bGVzIAp3aXRo
IFNUUklDVF9LRVJORUxfUldYIikKClNlZSByZXBvcnQgYW5kIGZpeCBhdCAKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL2VkMDNkMjkwZDQ0MGQ1NzlhODFhZTBiN2RlNTI0MzcyMTI5MWQ5MDMu
MTc5NDU0MzkwOS5naXQucml0ZXNoLmxpc3RAZ21haWwuY29tLwoKQ2hyaXN0b3BoZQoKCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKElCTSkgPHJwcHRAa2VybmVsLm9yZz4KPiAt
LS0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jlcy5jIHwgMjAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMgIHwgIDcgKysrKysrKwo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMuYyBiL2FyY2gvcG93ZXJwYy9r
ZXJuZWwva3Byb2Jlcy5jCj4gaW5kZXggOWZjZDAxYmIyY2U2Li4xNGM1ZGRlYzMwNTYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9rcHJvYmVzLmMKPiArKysgYi9hcmNoL3Bvd2Vy
cGMva2VybmVsL2twcm9iZXMuYwo+IEBAIC0xMjYsMjYgKzEyNiw2IEBAIGtwcm9iZV9vcGNvZGVf
dCAqYXJjaF9hZGp1c3Rfa3Byb2JlX2FkZHIodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBs
b25nIG9mZnNlCj4gICAJcmV0dXJuIChrcHJvYmVfb3Bjb2RlX3QgKikoYWRkciArIG9mZnNldCk7
Cj4gICB9Cj4gICAKPiAtdm9pZCAqYWxsb2NfaW5zbl9wYWdlKHZvaWQpCj4gLXsKPiAtCXZvaWQg
KnBhZ2U7Cj4gLQo+IC0JcGFnZSA9IGV4ZWNtZW1fYWxsb2MoRVhFQ01FTV9LUFJPQkVTLCBQQUdF
X1NJWkUpOwo+IC0JaWYgKCFwYWdlKQo+IC0JCXJldHVybiBOVUxMOwo+IC0KPiAtCWlmIChzdHJp
Y3RfbW9kdWxlX3J3eF9lbmFibGVkKCkpIHsKPiAtCQlpbnQgZXJyID0gc2V0X21lbW9yeV9yb3go
KHVuc2lnbmVkIGxvbmcpcGFnZSwgMSk7Cj4gLQo+IC0JCWlmIChlcnIpCj4gLQkJCWdvdG8gZXJy
b3I7Cj4gLQl9Cj4gLQlyZXR1cm4gcGFnZTsKPiAtZXJyb3I6Cj4gLQlleGVjbWVtX2ZyZWUocGFn
ZSk7Cj4gLQlyZXR1cm4gTlVMTDsKPiAtfQo+IC0KPiAgIGludCBhcmNoX3ByZXBhcmVfa3Byb2Jl
KHN0cnVjdCBrcHJvYmUgKnApCj4gICB7Cj4gICAJaW50IHJldCA9IDA7Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVs
ZS5jCj4gaW5kZXggYWM4MDU1OTAxNWEzLi4yYTIzY2Y3ZTE0MWIgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9k
dWxlLmMKPiBAQCAtOTQsNiArOTQsNyBAQCBzdGF0aWMgc3RydWN0IGV4ZWNtZW1faW5mbyBleGVj
bWVtX2luZm8gX19yb19hZnRlcl9pbml0Owo+ICAgCj4gICBzdHJ1Y3QgZXhlY21lbV9pbmZvIF9f
aW5pdCAqZXhlY21lbV9hcmNoX3NldHVwKHZvaWQpCj4gICB7Cj4gKwlwZ3Byb3RfdCBrcHJvYmVz
X3Byb3QgPSBzdHJpY3RfbW9kdWxlX3J3eF9lbmFibGVkKCkgPyBQQUdFX0tFUk5FTF9ST1ggOiBQ
QUdFX0tFUk5FTF9FWEVDOwo+ICAgCXBncHJvdF90IHByb3QgPSBzdHJpY3RfbW9kdWxlX3J3eF9l
bmFibGVkKCkgPyBQQUdFX0tFUk5FTCA6IFBBR0VfS0VSTkVMX0VYRUM7Cj4gICAJdW5zaWduZWQg
bG9uZyBmYWxsYmFja19zdGFydCA9IDAsIGZhbGxiYWNrX2VuZCA9IDA7Cj4gICAJdW5zaWduZWQg
bG9uZyBzdGFydCwgZW5kOwo+IEBAIC0xMzIsNiArMTMzLDEyIEBAIHN0cnVjdCBleGVjbWVtX2lu
Zm8gX19pbml0ICpleGVjbWVtX2FyY2hfc2V0dXAodm9pZCkKPiAgIAkJCQkuZmFsbGJhY2tfc3Rh
cnQJPSBmYWxsYmFja19zdGFydCwKPiAgIAkJCQkuZmFsbGJhY2tfZW5kCT0gZmFsbGJhY2tfZW5k
LAo+ICAgCQkJfSwKPiArCQkJW0VYRUNNRU1fS1BST0JFU10gPSB7Cj4gKwkJCQkuc3RhcnQJPSBW
TUFMTE9DX1NUQVJULAo+ICsJCQkJLmVuZAk9IFZNQUxMT0NfRU5ELAo+ICsJCQkJLnBncHJvdAk9
IGtwcm9iZXNfcHJvdCwKPiArCQkJCS5hbGlnbm1lbnQgPSAxLAo+ICsJCQl9LAo+ICAgCQkJW0VY
RUNNRU1fTU9EVUxFX0RBVEFdID0gewo+ICAgCQkJCS5zdGFydAk9IFZNQUxMT0NfU1RBUlQsCj4g
ICAJCQkJLmVuZAk9IFZNQUxMT0NfRU5ELAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
