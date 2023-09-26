Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE353CE7A8E
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 04:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd7D+fgEEPfCdr3uI316pVDv6wAZ30kqpnuj2/pedmE=; b=N8Rv90VvHTgwvV
	/mSPJBNhp7mqKk6JQZvsIHTPHmaGynnjP8XCLLV+DgnefLYipQkd+Mqs4QPtlBKebE0QFslD5aFzy
	0Ccb2FPIIeCFgh/E0fC4q2GBJpG5TRLleQ80UJ7BJUArSpcciIfEeWu9tooSFUQldV6qiH2WaQEuI
	RC0EdOcoGuHSU1k3rTVbZOuHCpwvgbYQCWJlBulQdgofjF89KoGNKBK5QgYpT/5Y/cVDlh8Y6irWH
	nacZ8KLs3UHVu8XX6+y0ryR5i1sSwJOqIbh1yOOJay8TUKEFiBfWPZ6wJ4hjsiNrOj7SKpayWvv+n
	xkUeoMFZsfzn+nPPc+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzNw-00FWvI-0s;
	Tue, 26 Sep 2023 04:09:20 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzNs-00FWr0-1T
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 04:09:18 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bd04558784so4997699a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 21:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695701348; x=1696306148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqOFR+aV2U747dOvG4VR290UntHO+h5U56cTzrU/C40=;
        b=EqKGqRWoSoGCz6+RhoISGxUEMmPHMlOKP0QD0go/Luxa62vQq5IdD9L18Pbq1jAGfS
         JYm6V6NhHgMmUzTgpqxODLbyRq9k9fqH+fJUrrb/n9L+J6YnmYfqDy+fW1YwBuaeZbGC
         0bCozg93pFEvhpgMYl/7pbGblCE05g2p8Nw+TgOZXZ8R8J331OlzMvcCwSdSJaAojoel
         GuFajEajw8hMlkAwj+3WpKDbGuzWN7nPSuelpk65N5EpLHqwf12ljjfmpUIYaitbyWO6
         vlF3sr+PIAR+n5bNxrj6HiiMaB8xLYcatZFQN4S9CKhN05Y3GCnM8o7kORBACa2b/N7S
         inAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695701348; x=1696306148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqOFR+aV2U747dOvG4VR290UntHO+h5U56cTzrU/C40=;
        b=gZ5BxidgH69d5svoVEg8xdpAm4kxuclk/QDiapG/n6G9aDuOqf6LlTAHBTScb0ofuD
         sBCe9Dhx+tJ+voqk/e6Th3j2YTsPsNFsncvXC6PYnu+lNBMku/sGnLitBTX8nKK2IwhG
         bwR2ntcC7+3nWttRoBINq6saE84UnKhZtgsiCwkzM9vKFW/IT4prZfEQ+Behevv8+Coq
         dyYWV2iQmJ9S49Pa/tXuvu/PEDNbyt6rqHf59T7uZhm9zbUQU6JhFihxhvH+cZkvcHGe
         qCr+NvGvh5niDGtIO4/KRA80bQUNghaxuS6s94tJAQY8TLUB1GokP1A8VvVDBzr4N6pI
         2ctQ==
X-Gm-Message-State: AOJu0Yx8Kq5QfJldcfREDzDBfW6odEn5VAwdJVAolh/hmK5eS5yXU7P7
	gINvn5CBvBYPtvjJzaOxlxqiKW00q1tSO4yqczyn0A==
X-Google-Smtp-Source: AGHT+IGmAxRog0hnxnVuuXVJuHjUbHq/ZKXhq770X+Pd2SPALmcAYb8MwVNhUMNSdmD8plbQLTGKkz2OCmPClWmIJ90=
X-Received: by 2002:a05:6808:1a21:b0:3a7:2690:94e0 with SMTP id
 bk33-20020a0568081a2100b003a7269094e0mr13581224oib.4.1695701347858; Mon, 25
 Sep 2023 21:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-3-apatel@ventanamicro.com> <ZRHH25IyJJLWSolC@ghost>
In-Reply-To: <ZRHH25IyJJLWSolC@ghost>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 26 Sep 2023 09:38:56 +0530
Message-ID: <CAK9=C2UoKxM+wknB4n8=okyXCCE6t0Vvz4jU_tBW6DMm6Vb3DA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] RISC-V: Detect XVentanaCondOps from ISA string
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_210916_501251_13D665E8 
X-CRM114-Status: GOOD (  28.05  )
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

T24gTW9uLCBTZXAgMjUsIDIwMjMgYXQgMTE6MTjigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0IDA3OjA4
OjUyUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgVmV5cm9uLVYxIENQVSBzdXBw
b3J0cyBjdXN0b20gY29uZGl0aW9uYWwgYXJpdGhtZXRpYyBhbmQKPiA+IGNvbmRpdGlvbmFsLXNl
bGVjdC9tb3ZlIG9wZXJhdGlvbnMgcmVmZXJyZWQgdG8gYXMgWFZlbnRhbmFDb25kT3BzCj4gPiBl
eHRlbnNpb24uIEluIGZhY3QsIFFFTVUgUklTQy1WIGFsc28gaGFzIHN1cHBvcnQgZm9yIGVtdWxh
dGluZwo+ID4gWFZlbnRhbmFDb25kT3BzIGV4dGVuc2lvbi4KPiA+Cj4gPiBMZXQgdXMgZGV0ZWN0
IFhWZW50YW5hQ29uZE9wcyBleHRlbnNpb24gZnJvbSBJU0Egc3RyaW5nIGF2YWlsYWJsZQo+ID4g
dGhyb3VnaCBEVCBvciBBQ1BJLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmggfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsK
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKPiA+IGluZGV4IDBmNTIwZjdkMDU4YS4uYjdlZmU5ZTJmYTg5IDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBAIC01OSw2ICs1OSw3IEBACj4gPiAgI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pJRkVOQ0VJICAgICAgICAgICAgICAgNDEKPiA+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWklIUE0gICAgICAgICAgNDIKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01T
VEFURUVOICAgICAgICAgICAgICA0Mwo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YVkVOVEFO
QUNPTkRPUFMgICAgICAgIDQ0Cj4gPgo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9NQVggICAg
ICAgICAgICA2NAo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGluZGV4IDM3NTVhOGMy
YTlkZS4uM2EzMWQzNGZlNzA5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IEBA
IC0xODIsNiArMTgyLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9p
c2FfZXh0W10gPSB7Cj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBSSVND
Vl9JU0FfRVhUX1NWSU5WQUwpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZuYXBv
dCwgUklTQ1ZfSVNBX0VYVF9TVk5BUE9UKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHN2cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhU
X0RBVEEoeHZlbnRhbmFjb25kb3BzLCBSSVNDVl9JU0FfRVhUX1hWRU5UQU5BQ09ORE9QUyksCj4g
PiAgfTsKPiA+Cj4gPiAgY29uc3Qgc2l6ZV90IHJpc2N2X2lzYV9leHRfY291bnQgPSBBUlJBWV9T
SVpFKHJpc2N2X2lzYV9leHQpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPiBJ
IHdvcnJ5IGFib3V0IHN0b3JpbmcgdmVuZG9yIGV4dGVuc2lvbnMgaW4gdGhpcyBmaWxlLiBCZWNh
dXNlIHZlbmRvcgo+IGV4dGVuc2lvbnMgYXJlIG5vdCBzdGFuZGFyZGl6ZWQsIHRoZXkgY2FuIG9u
bHkgYmUgZXhwZWN0ZWQgdG8gaGF2ZSB0aGUKPiBkZXNpcmVkIGJlaGF2aW9yIG9uIGhhcmR3YXJl
IHdpdGggdGhlIGFwcHJvcHJpYXRlIHZlbmRvciBpZC4gQSBjb3VwbGUKCkFzc3VtaW5nIHRoYXQg
YSB2ZW5kb3IgZXh0ZW5zaW9uIGlzIG9ubHkgYXZhaWxhYmxlIG9uIGhhcmR3YXJlIHdpdGgKYXBw
cm9wcmlhdGUgdmVuZG9yIGlkIGlzIG5vdCBjb3JyZWN0IGJlY2F1c2U6CjEpIHZlbmRvciBBIGNh
biBhbGxvdyB2ZW5kb3IgQiB0byBpbXBsZW1lbnQgYSBjdXN0b20gZXh0ZW5zaW9uCiAgICBkZWZp
bmVkIGJ5IHZlbmRvciBCCjIpIHZlbmRvciBBIGFuZCB2ZW5kb3IgQiBjYW4gam9pbnRseSBkZXZl
bG9wIGEgUklTQy1WIENQVSB3aGVyZQogICAgYm90aCB2ZW5kb3JzIGludGVncmF0ZSB0aGVpciBj
dXN0b20gZXh0ZW5zaW9ucy4KCkl0IGlzIGJlc3QgdG8gaWRlbnRpZnkgYSB2ZW5kb3IgZXh0ZW5z
aW9uIGluZGVwZW5kZW50bHkgd2l0aCBhCiJYPHZlbmRvcl9uYW1lPjxleHRlbnNpb25fbmFtZT4i
IHN0cmluZyB0byBrZWVwIGl0IHNpbXBsZQphbmQgc2NhbGFibGUuCgpBbG9uZyB0aGVzZSBsaW5l
cywgZWFjaCBULUhlYWQgY3VzdG9tIGV4dGVuc2lvbiBzaG91bGQgaGF2ZSBhCiJYVGhlYWQ8eHl6
PiIgbmFtZSBhc3NvY2lhdGVkIHdpdGggaXQuCgo+IG1vbnRocyBhZ28gSSBzZW50IGEgcGF0Y2gg
dG8gYWRkcmVzcyB0aGlzIGJ5IGhhbmRsaW5nIHZlY3RvciBleHRlbnNpb25zCj4gaW5kZXBlbmRl
bnRseSBmb3IgZWFjaCB2ZW5kb3IgWzFdLiBJIGRyb3BwZWQgdGhlIHBhdGNoIGJlY2F1c2UgaXQK
PiByZWxpZWQgdXBvbiBIZWlrbydzIFQtSGVhZCB2ZWN0b3IgZXh0ZW5zaW9uIHN1cHBvcnQgdGhh
dCBoZSBzdG9wcGVkCj4gd29ya2luZyBvbi4gSG93ZXZlciwgSSBjYW4gcmV2aXZlIHRoaXMgcGF0
Y2ggc28geW91IGNhbiBidWlsZCBvZmYgb2YgaXQuCgpBdCBsZWFzdCwgdGhlIGNvbmRpdGlvbmFs
IG9wZXJhdGlvbnMgZG9uJ3QgbmVlZCBhIGh3cHJvYmUgaW50ZXJmYWNlCmJlY2F1c2UgYW4gYXBw
bGljYXRpb24gaXMgZWl0aGVyIGNvbXBpbGVkIHdpdGggb3Igd2l0aG91dCBjb25kaXRpb25hbApv
cGVyYXRpb25zLiBJbiBvdGhlciB3b3JkcywgZWZmZWN0aXZlIHVzZSBvZiBjb25kaXRpb25hbCBv
cGVyYXRpb24gaXMKb25seSBwb3NzaWJsZSBpZiBjb21waWxlciBnZW5lcmF0ZXMgdGhlc2UgaW5z
dHJ1Y3Rpb25zIGJhc2VkIG9uCmNvZGUgcGF0dGVybnMuCgo+Cj4gVGhpcyBzY2hlbWUgaGFzIHRo
ZSBhZGRlZCBiZW5lZml0IHRoYXQgdmVuZG9ycyBkbyBub3QgaGF2ZSB0byB3b3JyeQo+IGFib3V0
IGNvbmZpY3RpbmcgZXh0ZW5zaW9ucywgYW5kIHRoZSBrZXJuZWwgZG9lcyBub3QgaGF2ZSB0byBh
Y3QgYXMgYQo+IGtleSByZWdpc3RyeSBmb3IgdmVuZG9ycy4KCkhvdyBjYW4gdmVuZG9yIGV4dGVu
c2lvbnMgY29uZmxpY3QgaWYgdGhleSBhbGwgZm9sbG93IHRoZQoiWDx2ZW5kb3JfbmFtZT48ZXh0
ZW5zaW9uX25hbWU+IiBuYW1pbmcgc2NoZW1lID8KCj4KPiBXaGF0IGFyZSB5b3VyIHRob3VnaHRz
Pwo+Cj4gLSBDaGFybGllCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIz
MDcwNS10aGVhZF92ZW5kb3JfZXh0ZW5zaW9ucy12MS0yLWFkNjkxNTM0OWM0ZEByaXZvc2luYy5j
b20vCj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
