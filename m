Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578CECF043A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/OCTelqj2o7Izc30AeM2nZOnit8B3nJNBYIcu+RtMc=; b=dQPzCD8oaR7miMuE1UFTEher2o
	GcWVVaPrCB+8MLqbZOy5XjCEps6gTPq2NSt0moK9FD2Dp/gIjVjrwUTrdYFuT4Pj/1dg6tdEjbgwT
	uV0wNTN+aatjPUIqxPDChVMvCMM+kA6bfOsNxkmHX9HPyY8Uo9M4XxCt47rdq4At0tdCjwDALuPhf
	MtrEBsQY+9CuWGgYe4EJULoQrBsukXtKwqG1XkVgJa7okvMrry/ES2UMd3CysRe7algYQbkPAftyv
	+QD8u7Yki9XFLc+vxMiZ0RUFODxgaRzB88mOK5NrTwhAvF7/tQSifUjUAqZDtxoxNdRNDtE7Hcj8R
	hznsaTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLaR-0000000HSsz-2zhK;
	Fri, 11 Oct 2024 19:46:07 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLaN-0000000HSps-05gp
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 19:46:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e9fd82f1a5so1606793a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 12:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728675961; x=1729280761; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exLsQV8+AgRTzSgIuh9REhlgyhIFFL6ykktOdGZoGFg=;
        b=pRvGVjhScsufHvXfwc3fXIcf87GVvaY4TfChiktiNOAs65QU3edNRLP3sE+sT4jMeR
         jo8cujGm99Zim8NXrXagCQzuYAAAzLlDSf++GG4WxSJMokxqKDO0V+uX+qD/axU60cFn
         p/ICgpjxjZlr5SnMaBvhBL7wGr1vTdbutDhOTnpaK7g3T+vJ+n058U08DayS6ZNaCLx5
         nsFkVl6s6k6UkhW5lxckNQ3I8ewjSLhlRUCzRiWKV6FmmdXfKMMJprhpbpXY6UOnzNp4
         CQItQvx8vYrATXbskWVO3g3YJ6tZxXnXEzmY/K+/nYieffU+LhsOkCOKRfU56zYs+MHw
         65CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675961; x=1729280761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exLsQV8+AgRTzSgIuh9REhlgyhIFFL6ykktOdGZoGFg=;
        b=PlJk3EpT22qq7ZylEhoZYfqagfDQbmt32eFcJdzkq9qCdQnQp1DUAEEwZ2H1b02fRd
         ftR+Ko1Oj5yuz3eJL4ysPXLquw8JmIXWG9EatMGkiHhPI6GyScyXuZ0wkHUjVMzeVuim
         l2kRa4++Jy5Bo98cQf7iyqrn/lX+GPz7pVbQ2WJayZP9SnEsJD8vPwu6RNOEfFGEUnM0
         gWGUYlK5RXZB31Ea5tN3JOjnwyT6XuWcbITBJxNcNwFNzyJmJjy+sHFpbz1XFZ7Z9IJW
         5NVJhoRHGKQzSdYbjfhWJelAkTtyPHPUBFcCBRwjIViXt7VXWSc6nEdDpV3L7WWlVwzM
         Ap4g==
X-Forwarded-Encrypted: i=1; AJvYcCVNK+kiXSmV+RScce/OfI2RZncFsZ+7kEMkgqQ+rTJG1zn0PJJBMykPODEEybrTKbbP78GsAd6EtqDRvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP+6NgYihPIHBnISSSK/TyoujD12OtC95duaIvwUcKGGD0oXuT
	lt5SzRHpsRRDcnyMDcW7TVNgi5tdeMqLdqX+Y6lxqhFGdrvn6xLdfcBZilU5jWE=
X-Google-Smtp-Source: AGHT+IHj8rWFWjfeD1jnOseU69L54Nubw7fuAuLENErbM2G1CFqjE5ekNxV2rf8nSVkMr8qy+VgzZQ==
X-Received: by 2002:a05:6a21:1519:b0:1cf:4d4e:532b with SMTP id adf61e73a8af0-1d8c96b986bmr675268637.43.1728675961468;
        Fri, 11 Oct 2024 12:46:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab0f1dcsm2951118b3a.209.2024.10.11.12.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:46:01 -0700 (PDT)
Date: Fri, 11 Oct 2024 12:45:57 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v6 33/33] kselftest/riscv: kselftest for user mode cfi
Message-ID: <ZwmAdRb5BRkPLbWg@debug.ba.rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-33-60d9fe073f37@rivosinc.com>
 <CANXhq0pXVS2s-hZNusPLoQ4qPkyi1S2BTQ-FyAvcz=cDctKQng@mail.gmail.com>
 <Zwj7aZj36TBGzpZa@finisterre.sirena.org.uk>
 <CANXhq0q49k6q3ZGYqzczMeFr+_rrfa9mL7FMu62xPHeUKfvhMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0q49k6q3ZGYqzczMeFr+_rrfa9mL7FMu62xPHeUKfvhMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_124603_085619_47355D4A 
X-CRM114-Status: GOOD (  20.13  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgMDc6NDM6MzBQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIEZyaSwgT2N0IDExLCAyMDI0IGF0IDY6MTjigK9QTSBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCAwMTo0NDo1NVBN
ICswODAwLCBab25nIExpIHdyb3RlOgo+PiA+IE9uIFdlZCwgT2N0IDksIDIwMjQgYXQgNzo0NuKA
r0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gPiA+ICsg
ICAgICAgaWYgKHNpLT5zaV9jb2RlID09IFNFR1ZfQ1BFUlIpIHsKPj4KPj4gPiBIaSBEZWVwYWss
Cj4+ID4gSSBnb3Qgc29tZSBlcnJvcnMgd2hlbiBidWlsZGluZyB0aGlzIHRlc3QsIEkgc3VwcG9z
ZSB0aGV5IHNob3VsZCBiZQo+PiA+IGZpeGVkIGluIHRoZSBuZXh0IHZlcnNpb24uCj4+Cj4+ID4g
cmlzY3ZfY2ZpX3Rlc3QuYzogSW4gZnVuY3Rpb24gJ3NpZ3NlZ3ZfaGFuZGxlcic6Cj4+ID4gcmlz
Y3ZfY2ZpX3Rlc3QuYzoxNzoyODogZXJyb3I6ICdTRUdWX0NQRVJSJyB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4KPj4gPiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdTRUdWX0FDQ0VSUic/
Cj4+ID4gICAgMTcgfCAgICAgICAgIGlmIChzaS0+c2lfY29kZSA9PSBTRUdWX0NQRVJSKSB7Cj4+
ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+Cj4+ID4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRUdWX0FDQ0VSUgo+PiA+Cj4+Cj4+IERp
ZCB5b3UgcnVuICJtYWtlIGhlYWRlcnNfaW5zdGFsbCIgcHJpb3IgdG8gYnVpbGRpbmcga3NlbGZ0
ZXN0IHRvIGdldAo+PiB0aGUgY3VycmVudCBrZXJuZWwncyBoZWFkZXJzIGF2YWlsYWJsZSBmb3Ig
dXNlcnNwYWNlIGJ1aWxkcz8KPgo+WWVzLCBJIGhhdmUgcnVuICJtYWtlIGhlYWRlciIgYW5kICJt
YWtlIGhlYWRlcl9pbnN0YWxsIiBiZWZvcmUKPmJ1aWxkaW5nIHRoZSBrc2VsZnRlc3QuIFRoaXMg
ZXJyb3IgaGFwcGVucyB3aGVuIEkgY3Jvc3MgY29tcGlsZWQgaXQsCj5wZXJoYXBzIEkgY2FuIGhl
bHAgdG8gY2hlY2sgaWYgaXQgaXMgbWlzc2luZyBzb21lIGhlYWRlciBmaWxlcyBvcgo+aGVhZGVy
IHNlYXJjaCBwYXRoLgoKVGhhdCdzIHdpZXJkLgoKSXQgZG9lc24ndCBmYWlsIGZvciBtZSBldmVu
IGlmIEkgZG8gbm90IGRvIGBtYWtlIGhlYWRlcnNfaW5zdGFsbGAuIEJ1dCBJIGFtCmJ1aWxkaW5n
IGtlcm5lbCBhbmQgc2VsZnRlc3RzIHdpdGggdG9vbGNoYWluIHdoaWNoIHN1cHBvcnRzIHNoYWRv
dyBzdGFjayBhbmQKbGFuZGluZyBwYWQuIEl0J3MgZGVmaW5lZCBpbiBgc2lnaW5mby5oYC4gV2hl
biBJIGJ1aWx0IHRvb2xjaGFpbiwgSSBkaWQgcG9pbnQKaXQgYXQgdGhlIGxhdGVzdCBrZXJuZWwg
aGVhZGVycy4gTWF5IGJlIHRoYXQncyB0aGUgdHJpY2suCgoiIiIKCiQgZ3JlcCAtbmlyIFNFR1Zf
Q1BFUlIgL3NjcmF0Y2gvZGVidWcvbGludXgva2J1aWxkL3Vzci9pbmNsdWRlLyoKL3NjcmF0Y2gv
ZGVidWcvbGludXgva2J1aWxkL3Vzci9pbmNsdWRlL2FzbS1nZW5lcmljL3NpZ2luZm8uaDoyNDA6
I2RlZmluZSBTRUdWX0NQRVJSICAgIDEwICAgICAgLyogQ29udHJvbCBwcm90ZWN0aW9uIGZhdWx0
ICovCgokIGdyZXAgLW5pciBTRUdWX0NQRVJSIC9zY3JhdGNoL2RlYnVnL29wZW5fc3JjL3NpZml2
ZV9jZmlfdG9vbGNoYWluL0lOU1RBTExfU2VwdDE4L3N5c3Jvb3QvdXNyLyoKL3NjcmF0Y2gvZGVi
dWcvb3Blbl9zcmMvc2lmaXZlX2NmaV90b29sY2hhaW4vSU5TVEFMTF9TZXB0MTgvc3lzcm9vdC91
c3IvaW5jbHVkZS9hc20tZ2VuZXJpYy9zaWdpbmZvLmg6MjQwOiNkZWZpbmUgU0VHVl9DUEVSUiAg
ICAxMCAgICAgIC8qIENvbnRyb2wgcHJvdGVjdGlvbiBmYXVsdCAqLwovc2NyYXRjaC9kZWJ1Zy9v
cGVuX3NyYy9zaWZpdmVfY2ZpX3Rvb2xjaGFpbi9JTlNUQUxMX1NlcHQxOC9zeXNyb290L3Vzci9p
bmNsdWRlL2JpdHMvc2lnaW5mby1jb25zdHMuaDoxMzk6ICBTRUdWX0NQRVJSICAgICAgICAgICAg
ICAgICAgLyogQ29udHJvbCBwcm90ZWN0aW9uIGZhdWx0LiAgKi8KL3NjcmF0Y2gvZGVidWcvb3Bl
bl9zcmMvc2lmaXZlX2NmaV90b29sY2hhaW4vSU5TVEFMTF9TZXB0MTgvc3lzcm9vdC91c3IvaW5j
bHVkZS9iaXRzL3NpZ2luZm8tY29uc3RzLmg6MTQwOiMgIGRlZmluZSBTRUdWX0NQRVJSICBTRUdW
X0NQRVJSCgoiIiIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
