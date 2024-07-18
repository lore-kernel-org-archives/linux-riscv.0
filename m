Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D548C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42wP1sXEff3XmAernuMfdWTILea4N9e8hZACO+234gw=; b=QdWYdLhazJR0o/
	JJ9lfJ6pw9reHtanKlREXWC4x/kMLIqnVji8jioQOBqtcxA4C0FhZ0FiRRBQEWYeDu7oz0EB4FCFh
	foVcCmA776zfKHzNJirLiMXHAVRISzKMtQ+JK5XDP49MpTpP/xaDpdWD1q1X7iPbWErMOV6/NeeG/
	bMZj+CqBW+HYOmlsOly/Z0KvNZ4n8ngn28VSIFuKfpaeHPSbe13LqEgr34US8IGLz0XTCWhbc8AOJ
	m7dVTTiMm+i3UOt8djp+aaTAGGbS6BzafazWQOFCf8nWsWv/Obn/yXQfNoBulEUYAQEtR9sYdGQbT
	AjXFkPPWIWQFCNYcDeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULsp-0000000GHfT-3gXr;
	Thu, 18 Jul 2024 07:48:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULsm-0000000GHdw-0cfv
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 07:48:58 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so7650e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721288934; x=1721893734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qD+nX/SK0sYHyfzpnXWu07tByOYZBtjRYGWr13b6ybo=;
        b=wkjGd0jmAnLYKy9WGP+FqZVJaYy2wWEKWzQQ1qwelyHWaKFS7cj+NiRZ6WQntzG2MP
         wIqbk/jyiBCr+97yeHFubPQ+qgXxnXA+KWj30zmVYUzQqTGosJm/oQ1lJjV/WK4LNlkk
         ypIIJrusNZ6TQvSoiH60RmhC+vKd6tfxboapPjMOzN6ufiLK1qCORKvpbfJRtdQyhP4N
         wk/XBVyqMZYQGgmCOqi/UPY/X6Do5L1RCbFwxVI8synGqaG+WUt+oDiyBP2VOTYDlGW1
         gsqO7OHpf7es46c4K87migfHIUkxGrnAfaEKJZchXL8cXlmcAt/aerKTxz0oiQOa02UN
         b2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721288934; x=1721893734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qD+nX/SK0sYHyfzpnXWu07tByOYZBtjRYGWr13b6ybo=;
        b=LSDQ7knD8auAH6F6AaB44ggNtHlV2oTlDKjT1siYF6reLbXpE0NR0XMo8v6wy3SMQH
         7OtIoYDpoq41B0y/Yny7NX/xKBC4uZsb2GcyJhON75r7nB9xYNNdDIcvvSgO6HRPn9kP
         qEnHWmCDgxNVx3TF7x4jzPVgopPY6T8I62VdgTY1vYnpySXHgwa/NMCqI12AjcCY1ZsH
         VaGZmxC53NfgVBEEnUgVcZGs1a1Y66Qd2uyq80+fSRQE1TK+NAOe9vP0RxfPm6yJliad
         Jrn+4z2mF1kqRfXHsNl0bG6DCnFpvliMCikib5m4UbwdytP4gomhMRZiH6+AEBYrqkmv
         okEw==
X-Forwarded-Encrypted: i=1; AJvYcCXnQucZzNd/Nf8c4RlZV/oZL00yxuvsO3pE/Go8KsTeHFP5qcdCBlx/qddfI1QYAwNZAHoPuh/qpM46JupFvwAjs5xyBrJWrFEM1oJutsIf
X-Gm-Message-State: AOJu0YwBTiR/lPhqqmOVZa+6Zqe/PaJK3L93bBQjUmyrL0DLTP1NNNq2
	3OAinbtnBUXSTQiF5vUCUSpsjj/NH3/KHFY0XAdeU9tfCJZ/lzKMDIZAqd6OY3K+awESKqlSyDv
	IUl83y2Xqv1Rlfp0z4joDUeQjBGqMgvlDXvF4vA==
X-Google-Smtp-Source: AGHT+IGHBgLtHfAhy/c4ubrhUk0ff0vQyOPXy+FGOXQxd0riXqum8s1MSYaqMyOjVLvFxDxlkfCgtZdggwCRrMfqEhI=
X-Received: by 2002:a05:6512:b22:b0:52e:9f7a:6e6 with SMTP id
 2adb3069b0e04-52ee5433efemr3817500e87.41.1721288933743; Thu, 18 Jul 2024
 00:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-6-alexghiti@rivosinc.com> <20240717-94b49fbac3c6bf97a0f96281@orel>
In-Reply-To: <20240717-94b49fbac3c6bf97a0f96281@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 18 Jul 2024 09:48:42 +0200
Message-ID: <CAHVXubi33T-5y9g1cqa+meM7q7b=0M54o+wrBeYmwfYpWAgAmQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_004856_476900_58ECEA4C 
X-CRM114-Status: GOOD (  25.07  )
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

SGkgRHJldywKCk9uIFdlZCwgSnVsIDE3LCAyMDI0IGF0IDEwOjM04oCvUE0gQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxNywgMjAy
NCBhdCAwODoxOTo1MUFNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gTm93IHRoYXQg
WmFjYXMgaXMgc3VwcG9ydGVkIGluIHRoZSBrZXJuZWwsIGxldCdzIHVzZSB0aGUgZG91YmxlIHdv
cmQKPiA+IGF0b21pYyB2ZXJzaW9uIG9mIGFtb2NhcyB0byBpbXByb3ZlIHRoZSBTTFVCIGFsbG9j
YXRvci4KPiA+Cj4gPiBOb3RlIHRoYXQgd2UgaGF2ZSB0byBzZWxlY3QgZml4ZWQgcmVnaXN0ZXJz
LCBvdGhlcndpc2UgZ2NjIGZhaWxzIHRvIHBpY2sKPiA+IGV2ZW4gcmVnaXN0ZXJzIGFuZCB0aGVu
IHByb2R1Y2VzIGEgcmVzZXJ2ZWQgZW5jb2Rpbmcgd2hpY2ggZmFpbHMgdG8KPiA+IGFzc2VtYmxl
Lgo+Cj4gT2gsIHRoYXQncyBxdWl0ZSB1bmZvcnR1bmF0ZS4uLiBJIGd1ZXNzIHdlIHNob3VsZCB0
cnkgdG8gZ2V0IHNvbWUgbmV3Cj4gUklTQy1WIGlubGluZSBhc3NlbWJseSByZWdpc3RlciBjb25z
dHJhaW50cyBhZGRlZCB0byBzdXBwb3J0IHJlZ2lzdGVyCj4gcGFpcnMuCgpJIGludGVybmFsbHkg
aW5mb3JtZWQgdGhlIGNvbXBpbGVycyBwZW9wbGUsIEknbGwgY2hlY2sgdGhlaXIgcHJvZ3Jlc3Mu
Cgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
fCAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggfCAzOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiA+IGluZGV4IGQzYjBmOTJmOTJkYS4uMGJiYWVjMDQ0NGQwIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IEBAIC0xMDQsNiArMTA0LDcgQEAgY29uZmlnIFJJU0NWCj4gPiAgICAgICBzZWxlY3QgR0VO
RVJJQ19WRFNPX1RJTUVfTlMgaWYgSEFWRV9HRU5FUklDX1ZEU08KPiA+ICAgICAgIHNlbGVjdCBI
QVJESVJRU19TV19SRVNFTkQKPiA+ICAgICAgIHNlbGVjdCBIQVNfSU9QT1JUIGlmIE1NVQo+ID4g
KyAgICAgc2VsZWN0IEhBVkVfQUxJR05FRF9TVFJVQ1RfUEFHRQo+ID4gICAgICAgc2VsZWN0IEhB
VkVfQVJDSF9BVURJVFNZU0NBTEwKPiA+ICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfSFVHRV9WTUFM
TE9DIGlmIEhBVkVfQVJDSF9IVUdFX1ZNQVAKPiA+ICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfSFVH
RV9WTUFQIGlmIE1NVSAmJiA2NEJJVAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY21weGNoZy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+IGlu
ZGV4IDk3YjI0ZGEzODg5Ny4uNjA4ZDk4NTIyNTU3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y21weGNoZy5oCj4gPiBAQCAtMjg5LDQgKzI4OSw0MyBAQCBlbmQ6OyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
ICAgICAgYXJjaF9jbXB4Y2hnX3JlbGVhc2UoKHB0ciksIChvKSwgKG4pKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ICB9KQo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9a
QUNBUwo+Cj4gVGhpcyBpcyBhbHNvIDY0LWJpdCBvbmx5LCBzbyBuZWVkcyBhIENPTkZJR182NEJJ
VCBjaGVjayB0b28uCgpZZXAsIHRoYW5rcwoKPgo+ID4gKwo+ID4gKyNkZWZpbmUgc3lzdGVtX2hh
c19jbXB4Y2hnMTI4KCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoUklTQ1ZfSVNBX0VYVF9aQUNBUykKPgo+IG5pdDogbGV0J3MgbGV0IHRoaXMgc3RpY2sgb3V0
IHNpbmNlIHdlIGhhdmUgMTAwIGNoYXJzCgpPawoKPgo+ID4gKwo+ID4gK3VuaW9uIF9fdTEyOF9o
YWx2ZXMgewo+ID4gKyAgICAgdTEyOCBmdWxsOwo+ID4gKyAgICAgc3RydWN0IHsKPiA+ICsgICAg
ICAgICAgICAgdTY0IGxvdywgaGlnaDsKPgo+IFNob3VsZCB3ZSBjb25zaWRlciBiaWcgZW5kaWFu
IHRvbz8KClNob3VsZCB3ZSBjYXJlIGFib3V0IGJpZyBlbmRpYW4/IFdlIGRvbid0IGRlYWwgd2l0
aCBiaWcgZW5kaWFuCmFueXdoZXJlIGluIG91ciBrZXJuZWwgcmlnaHQgbm93LgoKPgo+ID4gKyAg
ICAgfTsKPiA+ICt9Owo+ID4gKwo+ID4gKyNkZWZpbmUgX19hcmNoX2NtcHhjaGcxMjgocCwgbywg
biwgY2FzX3NmeCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyh7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgX190eXBlb2ZfXygqKHApKSBfX28gPSAobyk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgdW5p
b24gX191MTI4X2hhbHZlcyBfX2huID0geyAuZnVsbCA9IChuKSB9OyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gKyAgICAgdW5pb24gX191MTI4X2hhbHZlcyBfX2hvID0geyAuZnVs
bCA9IChfX28pIH07ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgcmVnaXN0
ZXIgdW5zaWduZWQgbG9uZyB4NiBhc20gKCJ4NiIpID0gX19obi5sb3c7ICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gKyAgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyB4NyBhc20gKCJ4NyIp
ID0gX19obi5oaWdoOyAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgcmVnaXN0ZXIg
dW5zaWduZWQgbG9uZyB4MjggYXNtICgieDI4IikgPSBfX2hvLmxvdzsgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyB4MjkgYXNtICgieDI5Iikg
PSBfX2hvLmhpZ2g7ICAgICAgICAgICAgICAgICAgICAgXAo+Cj4gQ2FuIHdlIHVzZSB0MSx0Mix0
Myx0NCByYXRoZXIgdGhhbiB0aGUgeCBuYW1lcz8KCldlIGNhbiwgSSBkaWQgbm90IGJlY2F1c2Ug
aXQgd2FzIGEgYml0IG1pc2xlYWRpbmcgaW4gdGhlIHNlbnNlIHRoYXQKYW1vY2FzIGV4cGVjdHMg
YW4gKmV2ZW4qIHJlZ2lzdGVyIGFuZCB1c2luZyB0aGUgdFggcmVnaXN0ZXJzLCB3ZSdsbApwYXNz
IGFuICpvZGQqIHJlZ2lzdGVyICh3aGljaCBhY3R1YWxseSBpcyBldmVuIGJ1dCBzdGlsbCkuCgpB
bnl3YXksIEknbGwgY2hhbmdlIHRoYXQsIEkgZG9uJ3QgbGlrZSB0aGUgeFggbm90YXRpb24uCgpU
aGFua3MgZm9yIHRoZSByZXZpZXcsCgpBbGV4Cgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICIgICAgICAgYW1v
Y2FzLnEiIGNhc19zZnggIiAlMCwgJXozLCAlMiIgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiArICAgICAgICAgICAgIDogIismciIgKHgyOCksICIrJnIiICh4MjkpLCAiK0EiICgqKHApKSAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgIDogInJKIiAoeDYpLCAi
ckoiICh4NykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICAgICAgICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAg
ICAoKHUxMjgpeDI5IDw8IDY0KSB8IHgyODsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiArfSkKPiA+ICsKPiA+ICsjZGVmaW5lIGFyY2hfY21weGNo
ZzEyOChwdHIsIG8sIG4pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ICsgICAgIF9fYXJjaF9jbXB4Y2hnMTI4KChwdHIpLCAobyksIChuKSwgIi5hcXJsIikK
PiA+ICsKPiA+ICsjZGVmaW5lIGFyY2hfY21weGNoZzEyOF9sb2NhbChwdHIsIG8sIG4pICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIF9fYXJjaF9jbXB4Y2hn
MTI4KChwdHIpLCAobyksIChuKSwgIiIpCj4gPiArCj4gPiArI2VuZGlmIC8qIENPTkZJR19SSVND
Vl9JU0FfWkFDQVMgKi8KPiA+ICsKPiA+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9DTVBYQ0hHX0gg
Ki8KPiA+IC0tCj4gPiAyLjM5LjIKPgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
