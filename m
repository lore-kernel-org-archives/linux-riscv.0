Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD1CD6E49
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8/scFFxjKqMmmKpfxjo9Nmt3qg8QWETpEI3oG4p9Hs=; b=slZ67Ae049VWtx
	ZdgBAH6kD9A3SdyzHPYnnm5jh6AQLdEaXi5T+HjmRjRKHyq11wds/FFrkR3fjAR0NQdEQ6wGkzX/+
	BVWfJOFZjGoDfW1o6T+2GrlsuOKU60EZeCQ3IxvtmIdSA0czjiCxqzu/xe/pVmY5opCLf/VrNl2SZ
	yBmQ9/8IAuxYdM1giVkUOycQg+CkDoNTjm3oIQBaWmLH4WfLNaJ1wCMfHKjgj+pwZSUx2a4QHKr70
	sSToDSqEZot5YlUVXipUPQ/TPp2azsdzBsvBHsOeYpXBgwT0O4my+R7xQy3Um7nAkhbHhhPn8uwzg
	0kvAp82d2zVfKHHrZCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSarw-00000005mtR-0JqC;
	Thu, 28 May 2026 13:33:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSart-00000005msy-0UE2
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 13:33:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so51571495e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779975227; x=1780580027; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e6IS64LlvzH31ZmTnvUmp+zTDi1i4OKg3KMzKx5frzQ=;
        b=G07OhzROqddgwSGUOlyCUCu6Gfm7IEZoJWt/Dh3tuzZ4Nbl8lx4B8+dA+P07d+ITnY
         RV3Af0LNdAZ0IvCuZHuo7I01iXcCr6wrHZzxjWi5X2Wx53BWXT7qiuFoe5D3Bv42oI3g
         AIf7+igrWxCNJM+k6am41ZVGhrVBslQx12U3wUwLx9zyDUS0CD3AKZqlM165XIzUnkjA
         86bDCyvPA0drrkrSGdpAagJoph07m1Bt7Of8iGMT5uQezifNk4Pv0KdCyN+Mhqlye6BA
         z1e12uGQ75AYIJxdpUrwTsccsSbqR0KCCZwTaF5oWnEu9lAjw4lANwwSlDbMaUgH5Qk4
         Hj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975227; x=1780580027;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6IS64LlvzH31ZmTnvUmp+zTDi1i4OKg3KMzKx5frzQ=;
        b=YyzyYsQfHA5Mn2wabLzZU83TreJ/LCaV5O1qLP/9fT5mVD/pB0siG875TtcA1ovcoo
         Yhyd2ef8aAhb06NPP/6Nc4tvn+7KzZQgjGgmTB+6WpGRPryKl6nOkgxhMvvnO3EetAYO
         Z1cCOTbRhzKZFefAYfJO+NeVeG1xeyVmap+zaA1b1+TGlpl9Ri6+ONw/Qgco8KxG1Gwi
         0mnDZVas0rTnjv8KRKY5CnZwDaNjMCAM59ZftCi6p4PP/6KvElMIAUw0ytOBVqn3Kxih
         aEtRI6zA2WsAQFxhzVs9GXGXesaZDdbUOJ2mcpEQqwPyqBE5khWvXgmipPKAUpiBI4jI
         5a5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ZPWkUN3a0Wg1H7tHYZgJVJHi5X4zLmz0+cu9gxgreb0KjSpt6ew0TBitVycGnKbhU3c0I3kYPT4jb4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcfrkRrrEVB58psebIhpJSVKfGujiqpMkDzQOS110j3/Zk9Fxl
	b1Ik6LjKF6Ft7WPsYymGyQZbIBPlBRJMx4gitEkDSzRSzTEPsRODZjIN+lsJgyCOjyA=
X-Gm-Gg: Acq92OE5oohQ95yUsOlJbSokDPNsCYro5xcr4kxLMfKWX/UoqStw1BQIhUbIgawn6iA
	ez+VjtcvmJs+9ucgPHBbZZ2GdX26s1jVXHmIgyfOBrVeInJ7YQexuYstEE40vDJKegDLOF1xH7e
	C1aubJ4oy6XxAeHbEUXhI0eCiSkN69I8D4vl+OjYwAjw2qVxzPjUAoEON4yqz/x7IbgWJRfJrmo
	GEO62DUXmF92rokP9h/T4QRPyV0Je7Gy9CGHDJxkqrG1uZAJZ8buKNgVpwYX2CcbyuGVccDV13h
	mYbQk7keyjEsSC+dzmr9v4t7+I8Gq0Pjmc0YDw8533dZzsKgBsqeND/F8QZix33nM21LumIglDI
	hstrItXlDpdaIWoahLdEqXr8mVpe7aD/4EmYXPh3UKY+m0fPApjWbiwcU0wG8n04MulinMf0/kR
	vrbl+M63WLWHdUFuqU0yeYmbKmyysOrKSZV8TzRUe2CckeAQ//XmJQgM/o3fdDOJuiZVSVOSVe+
	EHH0g==
X-Received: by 2002:a05:600c:c3cd:20b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-490428c97a1mr317936895e9.16.1779975226585;
        Thu, 28 May 2026 06:33:46 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a817d3sm48318915e9.10.2026.05.28.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:33:46 -0700 (PDT)
Message-ID: <5df8ff7bcf1f85a21eea3d4f74451fe6b57c118d.camel@suse.com>
Subject: Re: [PATCH v2 8/8] selftests/livepatch: Add RISC-V syscall wrapper
 prefix
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,  Chen
 Pei <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=	 <bjorn@rivosinc.com>, Deepak Gupta
 <debug@rivosinc.com>, Puranjay Mohan	 <puranjay@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,  Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan
 <shuah@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,  Namhyung
 Kim <namhyung@kernel.org>, oliver.yang@linux.alibaba.com,
 xueshuai@linux.alibaba.com, 	zhuo.song@linux.alibaba.com,
 jkchen@linux.alibaba.com, 	linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Date: Thu, 28 May 2026 10:33:34 -0300
In-Reply-To: <20260528082310.1994388-9-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
	 <20260528082310.1994388-9-wanghan@linux.alibaba.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
User-Agent: Evolution 3.60.1 (by Flathub.org) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_063349_167661_E7356269 
X-CRM114-Status: GOOD (  12.17  )
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

T24gVGh1LCAyMDI2LTA1LTI4IGF0IDE2OjIzICswODAwLCBXYW5nIEhhbiB3cm90ZToKPiBUaGUg
c3lzY2FsbCBsaXZlcGF0Y2ggc2VsZnRlc3QgcmVzb2x2ZXMgYW5kIHBhdGNoZXMgYSBzeXNjYWxs
IHdyYXBwZXIKPiBzeW1ib2wuIFRvIHVzZSB0aGF0IHRlc3QgZm9yIFJJU0MtViBsaXZlcGF0Y2gg
dmFsaWRhdGlvbiwgYWRkIHRoZQo+IFJJU0MtViBGTl9QUkVGSVggZGVmaW5pdGlvbiBmb3IgQVJD
SF9IQVNfU1lTQ0FMTF9XUkFQUEVSLgo+IAo+IFdpdGhvdXQgdGhpcyBtYWNybywgdGhlIHN5c2Nh
bGwgbGl2ZXBhdGNoIHNlbGZ0ZXN0IGNhbm5vdCByZXNvbHZlIHRoZQo+IFJJU0MtViB0YXJnZXQg
c3ltYm9sLCBhbmQgdGhlIHN5c2NhbGwtcmVsYXRlZCBsaXZlcGF0Y2ggdGVzdCBmYWlscyBvbgo+
IFJJU0MtVi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIEhhbiA8d2FuZ2hhbkBsaW51eC5hbGli
YWJhLmNvbT4KClJldmlld2VkLWJ5OiBNYXJjb3MgUGF1bG8gZGUgU291emEgPG1wZGVzb3V6YUBz
dXNlLmNvbT4KCj4gLS0tCj4gwqAuLi4vdGVzdGluZy9zZWxmdGVzdHMvbGl2ZXBhdGNoL3Rlc3Rf
bW9kdWxlcy90ZXN0X2tscF9zeXNjYWxsLmMgfCAyCj4gKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0Cj4gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9saXZlcGF0Y2gvdGVzdF9tb2R1bGVzL3Rlc3Rfa2xwX3N5c2NhbGwuYwo+IGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvbGl2ZXBhdGNoL3Rlc3RfbW9kdWxlcy90ZXN0X2tscF9zeXNjYWxsLmMK
PiBpbmRleCBkZDgwMjc4M2VhODQuLjI3NWU0YjEwY2Y1OSAxMDA2NDQKPiAtLS0KPiBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2xpdmVwYXRjaC90ZXN0X21vZHVsZXMvdGVzdF9rbHBfc3lzY2Fs
bC5jCj4gKysrCj4gYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9saXZlcGF0Y2gvdGVzdF9tb2R1
bGVzL3Rlc3Rfa2xwX3N5c2NhbGwuYwo+IEBAIC0xOCw2ICsxOCw4IEBACj4gwqAjZGVmaW5lIEZO
X1BSRUZJWCBfX3MzOTB4Xwo+IMKgI2VsaWYgZGVmaW5lZChfX2FhcmNoNjRfXykKPiDCoCNkZWZp
bmUgRk5fUFJFRklYIF9fYXJtNjRfCj4gKyNlbGlmIGRlZmluZWQoX19yaXNjdikKPiArI2RlZmlu
ZSBGTl9QUkVGSVggX19yaXNjdl8KPiDCoCNlbHNlCj4gwqAvKiBwb3dlcnBjIGRvZXMgbm90IHNl
bGVjdCBBUkNIX0hBU19TWVNDQUxMX1dSQVBQRVIgKi8KPiDCoCNkZWZpbmUgRk5fUFJFRklYCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
