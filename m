Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DAC606A330
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YnQdN08z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZL9lQ+Ij
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LSXNs9L+qpqvpl9V5epIJ720KOA+y8Kkc87ejO3tgms=; b=YnQdN08zqyA3mY/sfEsdYHXGit
	s45ao/LuMlXMD0dU4Zo0ic+GXrKWSu29tkBALV5224EoRMDdYsWdNNj87GXczrzBscTK+XBBzu/t8
	sna/Gn8AXa8+tqDLf23XwSRdWX8bhubIKfhXzavMERE3q4zS14C6ZbOC/EN9Hl2JB98rljAP6nspO
	unTkmXcjMe4d6vsCYF/2tdq13iTb3MDQxLWbqQDBYxIR323gYEcg2UkjxtA2I3IVJmU8Rl+MpjL8r
	jRqozu+66ezKVGXKiZCCTuVFE/MfyYsFtR0nimQD5+4/61hfYrF02FMM+/FvC2iY+fRBr+CH2bPYk
	P+aHukzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSres-00000001VqC-2l1n;
	Mon, 16 Nov 2026 08:01:46 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSreo-00000001VnO-3ngJ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:01:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c50e26763a4so55822366b.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 00:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794816100; x=1795420900; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YsacxGE14wOKz6Pg8TZXlOHyLRTqOTqtvBl+xKa/O2U=;
        b=ZL9lQ+Ij/OHBOtOQ/43LNApMmnlCsRCqo1I9FM9QB7yoe9Y0Jc2twTqTJlSTAhGuVl
         S2uSvCnydGkcqC1T64WuEI8t1zrzHEO8T7pa76UM1ezXZszIUU5yqsOj6AV9mLvZOEMV
         lThdg+xxom4pfNA5pyONynvNSyW/4WTBi0vTV/X4W+J3LheAoQk6+Gt1eYB0VXB+mzsT
         pFkCDXsh+DqSluCX3Sd7c+b/pCRIyc4DTdu4B3H3Hfy7iEkAnbJm30SyYuuKtUweXsLr
         hKBsTcChRaAidYZ8gLc8Y186xazoi6UwZMo8+SWe7CVFOOHu4FPmQJTPydT9Ce4N9P0R
         qBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816100; x=1795420900;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsacxGE14wOKz6Pg8TZXlOHyLRTqOTqtvBl+xKa/O2U=;
        b=yf0BtfxVZu+kiydLd3nxmZLVIxRTwGklq1fUKNXPDX/k6KpnZ7tqlsecV086Oosf1a
         /8hBNZ+qbIxIJfyXcOyqhZd/iNxPmbIQ0UhoTElOGAYSdHhhF79ajK++7iuW8JAwUItu
         uF0MTYP3FNlwmMMPWGER8SpcIpOS2GXetFY7RudQyc5xuXh5Xw20E+1Wb1pOKqNotqpb
         xfEibGZvrnttzeqKt5+MmWtrYAnyNAYSKzGuqnq95H7fiEEmewRtCKADRcaPyfTQM+11
         wMx4pEde/PGmzms5+nOHh8qPvlH+HNk8bmRYj/8AeCyEqGc1JEZgvrkBq1qDfbVA6lzT
         8QSQ==
X-Forwarded-Encrypted: i=1; AL+hErFS0SCouLhkQdlYRpvmxDufI98+3P6NrT7RUi55MukMnUxjFuQJdGysz2ez+lLwb01irxFYbzsPgYtMAg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/q8WcfPC+fS9XL7RaotvwXrp2jEA5RhPlngvPlAh4DsXRqjug4
	FR0tUFRcZfKElWlK3x8Sazg8dkdWcfIB2Vx94Iz4wGfBofTp0pzgfEcy6VtE6EVUUdV7
X-Gm-Gg: AYBFou066PfcnpyguQ2kX+LYdnZFrf/I0wmtqX87MCa6uRUCJyOfTu0qrNW231sQxPE
	RlLFEyGjT+zOgEB+C9RzxIIDZPB0Z2nrgZdJ3W31YXjuuRUMM+s1ebV0SskIZgxjydeKlKBjycS
	kaLnEQtlhwZTz1HPxfjTaF9H+uLH+xgJeHum0z27u5A5T7z+uBjOTP2ZHAWjZy9FJIg5adf/xHh
	jbDvhEWd9t56nuqiead1d57u1ZKcKEkqgT+K7SYn+k/IVPz0OIOTScsZ17fazqkpWHmx2QnZT7W
	na2x2OqwJ3EUnjv4kSWnOuR5csDNWJFRvlZwRUxeKfg9pg1tyvDxn4R/w9davW8zHS4DbcLgLkf
	t9nzckxtgBk3HTXI3Q3q3YcTlY66LBahHscnv0kAkb5naXjrP9PKOXovUnyBImthlhfxLfiAbXt
	mSzHhA4vyUYppNpGv4qpayQkKZzAq9GO6pDRbiHU2AQD/AVkNzij2x7pYXZXOSMgVQLOjr8/PDy
	GTf/N7HPe1ILEcoD2N2sSeWkmKvcMBmmq4veLOCa6588zBAD8eWhP8KfNPppWY6sastn6cPFY3k
	NpBYezCJhfByZ7ObCpjUJz5bf1YTcntzfDl2WWg0cMTUg2zJBdrYaOu88pvOQVg=
X-Received: by 2002:a17:907:1c90:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c50963bc4f0mr777600066b.48.1794816099924;
        Mon, 16 Nov 2026 00:01:39 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm385795866b.73.2026.11.16.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:01:39 -0800 (PST)
Message-ID: <dfdd6f4437cbf8f55458b908ec5347f3189bce80.camel@amutable.com>
Subject: Re: [PATCH RFC 4/4] crash_dump: use copy_oldmem_to_iter() everywhere
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>
Date: Mon, 16 Nov 2026 09:01:37 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-4-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-4-ecdcafd99265@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_000142_983185_0594AC1F 
X-CRM114-Status: GOOD (  17.39  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTExLTEyIGF0IDE3OjM3ICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiBNYWtlIHRoZSByZW1haW5pbmcgY29weV9vbGRtZW1fcGFnZSgpIGltcGxlbWVudGF0aW9u
cyBjb3B5IHRoZSBwYWdlCj4gb2YKPiB0aGUgY3Jhc2hlZCBrZXJuZWwgd2l0aCBjb3B5X29sZG1l
bV90b19pdGVyKCkgbGlrZSB4ODZfNjQgYW5kIHBvd2VycGMKPiBkby4gTm9uZSBvZiB0aGVzZSBh
cmNoaXRlY3R1cmVzIGhhcyBhIG1hY2hpbmUgY2hlY2sgc2FmZSBjb3B5IHRvZGF5LAo+IHNvCj4g
Zm9yIHRoZW0gdGhpcyBpcyBjb3B5X3RvX2l0ZXIoKSB1bmRlciBhbm90aGVyIG5hbWUuIEJ1dCB0
aGUgY29weSBvZiBhCj4gcGFnZSBvZiB0aGUgb2xkIGtlcm5lbCBpcyBpbiBvbmUgcGxhY2Ugbm93
LCBhbmQgYW4gYXJjaGl0ZWN0dXJlIHRoYXQKPiBnYWlucyBBUkNIX0hBU19DT1BZX01DIGxhdGVy
IGdldHMgdGhlIHJlY292ZXJ5IHdpdGhvdXQgdG91Y2hpbmcgaXRzCj4gY3Jhc2ggZHVtcCBjb2Rl
Lgo+IAo+IHMzOTAgc3RheXMgYXMgaXQgaXMuIEl0IGNvcGllcyB0aGUgb2xkIGtlcm5lbCdzIG1l
bW9yeSB0aHJvdWdoIGl0cwo+IHJlYWwKPiBhZGRyZXNzIG1vZGUgd2luZG93IGluIG1lbWNweV9y
ZWFsX2l0ZXIoKSwgYW5kIGFuIHVuY29ycmVjdGVkIHN0b3JhZ2UKPiBlcnJvciBpcyBmYXRhbCBv
biBzMzkwIGFueXdheSAoY2YuIHMzOTBfaGFuZGxlX2RhbWFnZSgpKS4KPiAKPiBObyBmdW5jdGlv
bmFsIGNoYW5nZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRh
YmxlKSA8YnJhdW5lckBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBNaWtoYWxp
dHN5biA8YWxleEBhbXV0YWJsZS5jb20+Cgo+IC0tLQo+IMKgYXJjaC9hcm0va2VybmVsL2NyYXNo
X2R1bXAuY8KgwqDCoMKgwqDCoCB8IDIgKy0KPiDCoGFyY2gvYXJtNjQva2VybmVsL2NyYXNoX2R1
bXAuY8KgwqDCoMKgIHwgMiArLQo+IMKgYXJjaC9sb29uZ2FyY2gva2VybmVsL2NyYXNoX2R1bXAu
YyB8IDIgKy0KPiDCoGFyY2gvbWlwcy9rZXJuZWwvY3Jhc2hfZHVtcC5jwqDCoMKgwqDCoCB8IDIg
Ky0KPiDCoGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2R1bXAuY8KgwqDCoMKgIHwgMiArLQo+IMKg
YXJjaC9zaC9rZXJuZWwvY3Jhc2hfZHVtcC5jwqDCoMKgwqDCoMKgwqAgfCAyICstCj4gwqBhcmNo
L3g4Ni9rZXJuZWwvY3Jhc2hfZHVtcF8zMi5jwqDCoMKgIHwgMiArLQo+IMKgNyBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiBiL2FyY2gvYXJtL2tlcm5lbC9jcmFzaF9kdW1w
LmMKPiBpbmRleCA5MzhiZDkzMmRmOWEwLi4wZjI2Mjg4NzJiMDBjIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiArKysgYi9hcmNoL2FybS9rZXJuZWwvY3Jhc2hf
ZHVtcC5jCj4gQEAgLTI4LDcgKzI4LDcgQEAgc3NpemVfdCBjb3B5X29sZG1lbV9wYWdlKHN0cnVj
dCBpb3ZfaXRlciAqaXRlciwKPiB1bnNpZ25lZCBsb25nIHBmbiwKPiDCoAlpZiAoIXZhZGRyKQo+
IMKgCQlyZXR1cm4gLUVOT01FTTsKPiDCoAo+IC0JY3NpemUgPSBjb3B5X3RvX2l0ZXIodmFkZHIg
KyBvZmZzZXQsIGNzaXplLCBpdGVyKTsKPiArCWNzaXplID0gY29weV9vbGRtZW1fdG9faXRlcih2
YWRkciArIG9mZnNldCwgY3NpemUsIGl0ZXIpOwo+IMKgCj4gwqAJaW91bm1hcCh2YWRkcik7Cj4g
wqAJcmV0dXJuIGNzaXplOwo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9jcmFzaF9k
dW1wLmMKPiBiL2FyY2gvYXJtNjQva2VybmVsL2NyYXNoX2R1bXAuYwo+IGluZGV4IDY3MGU0Y2U4
MTgyMjMuLmM3NzRiM2FiYTEwN2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvY3Jh
c2hfZHVtcC5jCj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gQEAgLTI0
LDcgKzI0LDcgQEAgc3NpemVfdCBjb3B5X29sZG1lbV9wYWdlKHN0cnVjdCBpb3ZfaXRlciAqaXRl
ciwKPiB1bnNpZ25lZCBsb25nIHBmbiwKPiDCoAlpZiAoIXZhZGRyKQo+IMKgCQlyZXR1cm4gLUVO
T01FTTsKPiDCoAo+IC0JY3NpemUgPSBjb3B5X3RvX2l0ZXIodmFkZHIgKyBvZmZzZXQsIGNzaXpl
LCBpdGVyKTsKPiArCWNzaXplID0gY29weV9vbGRtZW1fdG9faXRlcih2YWRkciArIG9mZnNldCwg
Y3NpemUsIGl0ZXIpOwo+IMKgCj4gwqAJbWVtdW5tYXAodmFkZHIpOwo+IMKgCj4gZGlmZiAtLWdp
dCBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiBiL2FyY2gvbG9vbmdhcmNo
L2tlcm5lbC9jcmFzaF9kdW1wLmMKPiBpbmRleCBlNTU5MzA3YzEwOTI5Li4wM2ExMzZiOGJlOGRh
IDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiArKysg
Yi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gQEAgLTE1LDcgKzE1LDcgQEAg
c3NpemVfdCBjb3B5X29sZG1lbV9wYWdlKHN0cnVjdCBpb3ZfaXRlciAqaXRlciwKPiB1bnNpZ25l
ZCBsb25nIHBmbiwKPiDCoAlpZiAoIXZhZGRyKQo+IMKgCQlyZXR1cm4gLUVOT01FTTsKPiDCoAo+
IC0JY3NpemUgPSBjb3B5X3RvX2l0ZXIodmFkZHIgKyBvZmZzZXQsIGNzaXplLCBpdGVyKTsKPiAr
CWNzaXplID0gY29weV9vbGRtZW1fdG9faXRlcih2YWRkciArIG9mZnNldCwgY3NpemUsIGl0ZXIp
Owo+IMKgCj4gwqAJbWVtdW5tYXAodmFkZHIpOwo+IMKgCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlw
cy9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gYi9hcmNoL21pcHMva2VybmVsL2NyYXNoX2R1bXAuYwo+
IGluZGV4IDZlNTBmNDkwMjQwOTQuLjA3OGMwZDFlOGRmNDYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9t
aXBzL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiArKysgYi9hcmNoL21pcHMva2VybmVsL2NyYXNoX2R1
bXAuYwo+IEBAIC0xMiw3ICsxMiw3IEBAIHNzaXplX3QgY29weV9vbGRtZW1fcGFnZShzdHJ1Y3Qg
aW92X2l0ZXIgKml0ZXIsCj4gdW5zaWduZWQgbG9uZyBwZm4sCj4gwqAJCXJldHVybiAwOwo+IMKg
Cj4gwqAJdmFkZHIgPSBrbWFwX2xvY2FsX3BmbihwZm4pOwo+IC0JY3NpemUgPSBjb3B5X3RvX2l0
ZXIodmFkZHIgKyBvZmZzZXQsIGNzaXplLCBpdGVyKTsKPiArCWNzaXplID0gY29weV9vbGRtZW1f
dG9faXRlcih2YWRkciArIG9mZnNldCwgY3NpemUsIGl0ZXIpOwo+IMKgCWt1bm1hcF9sb2NhbCh2
YWRkcik7Cj4gwqAKPiDCoAlyZXR1cm4gY3NpemU7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NyYXNoX2R1bXAuYwo+IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4g
aW5kZXggZWEyMTU4Y2VlOTdiMy4uMDgyMGUzZGIxMjYwMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcmFzaF9kdW1wLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9k
dW1wLmMKPiBAQCAtMjEsNyArMjEsNyBAQCBzc2l6ZV90IGNvcHlfb2xkbWVtX3BhZ2Uoc3RydWN0
IGlvdl9pdGVyICppdGVyLAo+IHVuc2lnbmVkIGxvbmcgcGZuLAo+IMKgCWlmICghdmFkZHIpCj4g
wqAJCXJldHVybiAtRU5PTUVNOwo+IMKgCj4gLQljc2l6ZSA9IGNvcHlfdG9faXRlcih2YWRkciAr
IG9mZnNldCwgY3NpemUsIGl0ZXIpOwo+ICsJY3NpemUgPSBjb3B5X29sZG1lbV90b19pdGVyKHZh
ZGRyICsgb2Zmc2V0LCBjc2l6ZSwgaXRlcik7Cj4gwqAKPiDCoAltZW11bm1hcCh2YWRkcik7Cj4g
wqAJcmV0dXJuIGNzaXplOwo+IGRpZmYgLS1naXQgYS9hcmNoL3NoL2tlcm5lbC9jcmFzaF9kdW1w
LmMKPiBiL2FyY2gvc2gva2VybmVsL2NyYXNoX2R1bXAuYwo+IGluZGV4IDg1YzBlNThmMWE1OWYu
LjJhNTk4OGI2ZTlkN2EgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zaC9rZXJuZWwvY3Jhc2hfZHVtcC5j
Cj4gKysrIGIvYXJjaC9zaC9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gQEAgLTIzLDcgKzIzLDcgQEAg
c3NpemVfdCBjb3B5X29sZG1lbV9wYWdlKHN0cnVjdCBpb3ZfaXRlciAqaXRlciwKPiB1bnNpZ25l
ZCBsb25nIHBmbiwKPiDCoAlpZiAoIXZhZGRyKQo+IMKgCQlyZXR1cm4gLUVOT01FTTsKPiDCoAo+
IC0JY3NpemUgPSBjb3B5X3RvX2l0ZXIodmFkZHIgKyBvZmZzZXQsIGNzaXplLCBpdGVyKTsKPiAr
CWNzaXplID0gY29weV9vbGRtZW1fdG9faXRlcih2YWRkciArIG9mZnNldCwgY3NpemUsIGl0ZXIp
Owo+IMKgCWlvdW5tYXAodmFkZHIpOwo+IMKgCj4gwqAJcmV0dXJuIGNzaXplOwo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3Jhc2hfZHVtcF8zMi5jCj4gYi9hcmNoL3g4Ni9rZXJuZWwv
Y3Jhc2hfZHVtcF8zMi5jCj4gaW5kZXggNWY0YWU1NDc2ZTE5My4uY2IyMDJkNGUxZjcwMyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3Jhc2hfZHVtcF8zMi5jCj4gKysrIGIvYXJjaC94
ODYva2VybmVsL2NyYXNoX2R1bXBfMzIuYwo+IEBAIC00MCw3ICs0MCw3IEBAIHNzaXplX3QgY29w
eV9vbGRtZW1fcGFnZShzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIsCj4gdW5zaWduZWQgbG9uZyBwZm4s
IHNpemVfdCBjc2l6ZSwKPiDCoAkJcmV0dXJuIC1FRkFVTFQ7Cj4gwqAKPiDCoAl2YWRkciA9IGtt
YXBfbG9jYWxfcGZuKHBmbik7Cj4gLQljc2l6ZSA9IGNvcHlfdG9faXRlcih2YWRkciArIG9mZnNl
dCwgY3NpemUsIGl0ZXIpOwo+ICsJY3NpemUgPSBjb3B5X29sZG1lbV90b19pdGVyKHZhZGRyICsg
b2Zmc2V0LCBjc2l6ZSwgaXRlcik7Cj4gwqAJa3VubWFwX2xvY2FsKHZhZGRyKTsKPiDCoAo+IMKg
CXJldHVybiBjc2l6ZTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
