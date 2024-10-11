Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A3CFD358
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIdmTn/p6lM9zTNFtMP25lcz/RpQNWUNr+YXHfkbg2o=; b=pGZo2Zx+EHz7Ft
	lrzF8Oai8Jr7bFPjHQJVwAgaHwk6B3JafjCfSZt1aS+0v7IfSZcL/iysOJaliGha9IjFy8/zU4HgY
	11ljWdY2A4iMCAUVFTLwF3+lGYjikt8iQeU7yQjR3lkBnOzsaqvzxF4i8TJh6zpMThpOv6BDXtHcG
	mqJy7LvCEGq0MgmfFm3+tm1SO3jeRo/XLjP4JvBJL1N1li1zsEbGGpcEWQDo8XGpRtnIHvrh0em3G
	o5v9mTxu/RqlLtWtdxznpuFsDFaJE9dPJVC1YGWVMN8WBL5IdtGd2Nn+z8683oVCPfTU5TcitejnY
	czTnQ7ZAQMj56Wntx1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szE4o-0000000GB9p-0moK;
	Fri, 11 Oct 2024 11:44:58 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szE3a-0000000GAcD-2aCp
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 11:43:44 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a367da1f8cso6916145ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1728647021; x=1729251821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ovf+VMWvRmikxbDrCpt5EY3ct9SPxEo1lO8nMoHDCU=;
        b=nqXwI2lmy3Afbe1OMOhsmRjG+KsY/yaVHKlYBmAahL/fn41RaXaQsjM0eZQoU8qk00
         GvwOZRTlINeRvE86YWuafG+gJgcf00KuXMcXW/b1JTbG0K/kVmKKkhyhpQJE9Ax/e6M7
         0Zxv9JvK5v376aiD86cBIz1dKOfkKm+xHgwiiBwprHcnqnd8zQW6TbmW85vT2A+SjPXl
         1fC7vyu2dnYHb68ht+HcdTZlanvYdqjZtkChX3L4hwX2jLGFhZzfF6ZQF6x8tghzIw31
         sTqxoC9xfpiXwPiGhrGwXsgSnOry6fQeSQZ/Oo3hzvvUcXTfN8t+q+znFbPNehRAW2Ll
         8ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647021; x=1729251821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ovf+VMWvRmikxbDrCpt5EY3ct9SPxEo1lO8nMoHDCU=;
        b=M6cA6Pmi7i3ToiYiNteuZN5QfR7iS4SDm3nTRCBd+YnuZ3P9OYogcpogYD2i560hTD
         cBZnpYkYa0kVY+mvrUeQuDE3VdWOiTCIz24DClyZ/bbWOV93ILVSOtWxzDwTqq/BeNsS
         lAkJh+OeCHb92+46Kj46m3K0eNPAtdWuNo6R/14zinbyYyppiMsQ23JISNYTEhwSACW9
         2VQoRW68ST0EqDB4V0X7ZLIjcbKqHFfO4lrvtHB1YOGvJSa4Zh2HPNcdOls0YRgywzhK
         19WGzeYQT+PktcPf/0n1lvHXaVuD1mnEcxZOSMm4fnwPa04Nh+PQ199qOHVKpOQz+mQi
         4whw==
X-Forwarded-Encrypted: i=1; AJvYcCWVrc+XGKr7knEqrpSNFOKqYECm+ecvI81Y0mzfFt99OaKAoNoRY2MT1Ikai9Y3hMkYfR4f/opAa5ZZwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgP5UbTo2ny4fu5TP1oSOpEVlUaLqscINGuakUVBixVw8ZcgU4
	puBVWNfKD0TC9Wlf7PnQK4N1lAWKhj6njXCCqeJXlruNxH/2gduS4K3oWIg5GB99E+V+h5vU6kl
	H1rpszagF8Zgk+GPqfMKZIxR+H42P2x+tAKWtPg==
X-Google-Smtp-Source: AGHT+IHrNQBq2saNjK73V1T6HuEouWOtzpJQWDAr8+Lmcf5QP/uhztfapf3Yw6Qr2s1M/KXX4B0xAsxQWbLFxqc5Tgg=
X-Received: by 2002:a05:6e02:2192:b0:3a0:7687:8c2d with SMTP id
 e9e14a558f8ab-3a3b6019b61mr12545025ab.26.1728647021428; Fri, 11 Oct 2024
 04:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-33-60d9fe073f37@rivosinc.com>
 <CANXhq0pXVS2s-hZNusPLoQ4qPkyi1S2BTQ-FyAvcz=cDctKQng@mail.gmail.com> <Zwj7aZj36TBGzpZa@finisterre.sirena.org.uk>
In-Reply-To: <Zwj7aZj36TBGzpZa@finisterre.sirena.org.uk>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 11 Oct 2024 19:43:30 +0800
Message-ID: <CANXhq0q49k6q3ZGYqzczMeFr+_rrfa9mL7FMu62xPHeUKfvhMw@mail.gmail.com>
Subject: Re: [PATCH v6 33/33] kselftest/riscv: kselftest for user mode cfi
To: Mark Brown <broonie@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_044342_718762_FA09A441 
X-CRM114-Status: GOOD (  17.33  )
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgNjoxOOKAr1BNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCAwMTo0NDo1NVBNICsw
ODAwLCBab25nIExpIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgOSwgMjAyNCBhdCA3OjQ24oCvQU0g
RGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gPiA+ICsgICAgICAg
aWYgKHNpLT5zaV9jb2RlID09IFNFR1ZfQ1BFUlIpIHsKPgo+ID4gSGkgRGVlcGFrLAo+ID4gSSBn
b3Qgc29tZSBlcnJvcnMgd2hlbiBidWlsZGluZyB0aGlzIHRlc3QsIEkgc3VwcG9zZSB0aGV5IHNo
b3VsZCBiZQo+ID4gZml4ZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPgo+ID4gcmlzY3ZfY2ZpX3Rl
c3QuYzogSW4gZnVuY3Rpb24gJ3NpZ3NlZ3ZfaGFuZGxlcic6Cj4gPiByaXNjdl9jZmlfdGVzdC5j
OjE3OjI4OiBlcnJvcjogJ1NFR1ZfQ1BFUlInIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbgo+ID4g
dGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnU0VHVl9BQ0NFUlInPwo+ID4gICAgMTcgfCAg
ICAgICAgIGlmIChzaS0+c2lfY29kZSA9PSBTRUdWX0NQRVJSKSB7Cj4gPiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KPiA+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgU0VHVl9BQ0NFUlIKPiA+Cj4KPiBEaWQgeW91IHJ1biAibWFrZSBoZWFk
ZXJzX2luc3RhbGwiIHByaW9yIHRvIGJ1aWxkaW5nIGtzZWxmdGVzdCB0byBnZXQKPiB0aGUgY3Vy
cmVudCBrZXJuZWwncyBoZWFkZXJzIGF2YWlsYWJsZSBmb3IgdXNlcnNwYWNlIGJ1aWxkcz8KClll
cywgSSBoYXZlIHJ1biAibWFrZSBoZWFkZXIiIGFuZCAibWFrZSBoZWFkZXJfaW5zdGFsbCIgYmVm
b3JlCmJ1aWxkaW5nIHRoZSBrc2VsZnRlc3QuIFRoaXMgZXJyb3IgaGFwcGVucyB3aGVuIEkgY3Jv
c3MgY29tcGlsZWQgaXQsCnBlcmhhcHMgSSBjYW4gaGVscCB0byBjaGVjayBpZiBpdCBpcyBtaXNz
aW5nIHNvbWUgaGVhZGVyIGZpbGVzIG9yCmhlYWRlciBzZWFyY2ggcGF0aC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
