Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379F8CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqicMGZ7eOrXf/D3Q6yxsB7dLUWHADCISUp3UQ+7lGo=; b=sov9MDb4Stb/CJ
	aMaCsk7DK2M0N2/W6wGutLPoJhtxc1HPChaoO3Ss+kaHeKz4XR0LRFqHy2OW7p/SA3YWUJfRnFuLY
	Zfta6QR2RxJisplAn2PPETELm7rSECuq8C6In6kHg+igZ+j0E7dHo8aWjz8kTRMuVqqfFSk6JNFWK
	413z6laSGID9y8vTakV8D1c/expbNb5m237anhGBoSTt9lWwqB1Z9YnSiD8DD1MvE43b7Dg9g3pgW
	hkCXPZpkpIRa0Ol/ghgp9x1DIpfem5tb3ZYxeLPXdzFZb0/6tUmO2iNR4oYt+VWvptFwUqAw9z2Hd
	JynCVtXSYvPwU9BjvELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLoS-0000000AUZy-3PPs;
	Tue, 19 Aug 2025 12:51:40 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5e-0000000ACvz-0M0S
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:19 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-333f92a69d4so39164721fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755601276; x=1756206076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C80fm0GDc3jc75LWz0UrKrGBSlO4fahAHmLCSkDw+Sw=;
        b=gdO9AJjOKgF800GRBy6l50takqkzW5aUXc6wNuBY81cuHDJIQ/LvnCTAFcTuaissux
         bvU4ZQyMczxxOGXPwkxhdURXAg4RnLKK+j9E6QT9gdTpFkgJjXFjWCLxYognyJ4tdxcp
         M8UNidqbWTMg4+8I9BhMuD7kY6W6BRaLhuEeN11ycSshyAwWEvPBdb+xZSQwQi8sRKC/
         hsBW5r58jJzGhvlTLug7uQqroFiV3rbn+pnamLdnro52IajwXWejfJC0is5DC24zbfkg
         Z+lmoNiW4BBbutlYlrHuJKHBkby2e/5DUe8laYa8HNFk6clWEfW4Z6Inh3ZD8suhRg7o
         3ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601276; x=1756206076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C80fm0GDc3jc75LWz0UrKrGBSlO4fahAHmLCSkDw+Sw=;
        b=XFoyBh1Lr9w/H2toH6FkLFHvBZI5N1QSyo35H4E1EWsYSN5ZTFzki2anJUCebAU55I
         sAGj8EQ7KVf/ZLWju3qYlfSq4o1MdTXRzJMPJYopLDvHz7SKbupSTtDo6gOahMhCwEvF
         iNcF2zQe8oETJreMoVVYmPkY1zw5DBsPiMiGjWj5M/80+NY0AV+tZgZV0qfyXjPMlF7c
         2l9XOdSOXbEWANLM9uHaPnGDoy+je2jjXwt0etImJHvaR7FD5fiZfZE85Ft8DGNDX/gD
         sqSxCumhQNGDUwYLee7EmTSp7RlQwCZKSZPAI5A/T46X88kgQMHxUr9aU36DtUAqZ9ic
         tCcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBI5FnkXwus701TqIbn2AKzeEwsnD5zolc1gvatt+xhV1yespvuMieEMIh1SKE0fbmDRyLF4aMI2Wb/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUNGjFDGZ5yUwzxrKoKCfqbeSOoNsMWetN+3yfsm4bHuWT6kUf
	1fnI6iQJjua4EDaIkYN8hrlDIEfRuriGl3FUPYkZF1Fbhe3ugsof3H1Rur1dSy38A+nC0Tw2NUt
	5GKLq6Ew1/TQDOxKW+gMw7w0iZFBGLXAGdfbhWIyhtw==
X-Gm-Gg: ASbGncv27fubL/AhmbMqiAxpvEuAQqlRwmvEMZJxaQecK/KdkQgZnaSNcpi+Be57RSA
	7qpKgciz0VdDvwFM1Sc3kH7BvKP2puA028YIqjDem/I4lEuN+t4tMRBcXgdu2ZxYlAEM/K5eu0s
	zYg1gzdyLf2zhhSh0dlF2V0HzXFvE5ex/PmplQ+4n+1GxDU7qZhG//15t6qXwrf6cWZzvz526sD
	CTGqVhY
X-Google-Smtp-Source: AGHT+IHlIIdtCFdyCt7BneXnJGieYkzZry9p86M1MLWKm3IaZVgcEXSSysCiKPyBhgKLxKZbQYCB+SGi8IsuSWQ4UsE=
X-Received: by 2002:a2e:b8d3:0:b0:332:42a6:5ca2 with SMTP id
 38308e7fff4ca-335304fbb66mr5924491fa.10.1755601276145; Tue, 19 Aug 2025
 04:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-3-apatel@ventanamicro.com> <aKPu2g1MOZBBzQbV@pie>
 <CAK9=C2XmDGOz9_euC4vtchOxr+8f+m+9zZYVewCc2s7GZhd4Pw@mail.gmail.com> <aKP553e1S5RCYNhU@pie>
In-Reply-To: <aKP553e1S5RCYNhU@pie>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Aug 2025 16:31:03 +0530
X-Gm-Features: Ac12FXyzoEVZIICp9ybAr45jkWILs6mVWIyXA9urG_cQME-dgkISLwPNd_y4zjA
Message-ID: <CAK9=C2Xt2RYm90wFBiYg+8Wpui1e3h8U72OkG5J5u2UFS=AfWg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Yao Zi <ziyao@disroot.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040118_147866_4467AA4D 
X-CRM114-Status: GOOD (  40.01  )
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

T24gVHVlLCBBdWcgMTksIDIwMjUgYXQgOTo0M+KAr0FNIFlhbyBaaSA8eml5YW9AZGlzcm9vdC5v
cmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMTksIDIwMjUgYXQgMDk6MDA6MDNBTSArMDUzMCwg
QW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDE5LCAyMDI1IGF0IDg6NTbigK9BTSBZ
YW8gWmkgPHppeWFvQGRpc3Jvb3Qub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBBdWcg
MTgsIDIwMjUgYXQgMDg6MDY6MDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiBJ
biBSSVNDLVYsIHRoZXJlIGlzIG5vIENTUiByZWFkL3dyaXRlIGluc3RydWN0aW9uIHdoaWNoIHRh
a2VzIENTUgo+ID4gPiA+IG51bWJlciB2aWEgcmVnaXN0ZXIgc28gYWRkIGNvbW1vbiBjc3JfcmVh
ZF9udW0oKSBhbmQgY3NyX3dyaXRlX251bSgpCj4gPiA+ID4gZnVuY3Rpb25zIHdoaWNoIGFsbG93
IGFjY2Vzc2luZyBjZXJ0YWluIENTUnMgYnkgcGFzc2luZyBDU1IgbnVtYmVyCj4gPiA+ID4gYXMg
cGFyYW1ldGVyLiBUaGVzZSBjb21tb24gZnVuY3Rpb25zIHdpbGwgYmUgZmlyc3QgdXNlZCBieSB0
aGUKPiA+ID4gPiBBQ1BJIENQUEMgZHJpdmVyIGFuZCBSSVNDLVYgUE1VIGRyaXZlci4KPiA+ID4g
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8u
Y29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8
ICAgMyArCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgfCAgIDEgKwo+ID4g
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jc3IuYyAgICAgIHwgMTY1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgICAg
fCAgMTcgKystLQo+ID4gPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgICAgIHwgIDU0ICsr
LS0tLS0tLS0tLQo+ID4gPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25zKCspLCA1
NiBkZWxldGlvbnMoLSkKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2Vy
bmVsL2Nzci5jCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+ID4gPiBpbmRleCA2
ZmVkNDJlMzc3MDUuLjE1NDA2MjZiMzU0MCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2Nzci5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
c3IuaAo+ID4gPiA+IEBAIC01NzUsNiArNTc1LDkgQEAKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiAg
fSkKPiA+ID4gPgo+ID4gPiA+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBjc3JfcmVhZF9udW0odW5z
aWduZWQgbG9uZyBjc3JfbnVtLCBpbnQgKm91dF9lcnIpOwo+ID4gPiA+ICtleHRlcm4gdm9pZCBj
c3Jfd3JpdGVfbnVtKHVuc2lnbmVkIGxvbmcgY3NyX251bSwgdW5zaWduZWQgbG9uZyB2YWwsIGlu
dCAqb3V0X2Vycik7Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgaXQncyBtb3JlIGNvbnNpc3RlbnQgdG8g
ZGlyZWN0bHkgcmV0dXJuIHRoZSBlcnJvciBjb2RlLCBhbmQgZm9yCj4gPiA+IGNzcl9yZWFkX251
bSwgd2UgY291bGQgcGFzcyBvdXQgdGhlIHJlYWQgdmFsdWUgYnkgYSBwb2ludGVyLiBlLmcuCj4g
PiA+Cj4gPiA+ICAgICAgICAgaW50IGNzcl9yZWFkX251bSh1bnNpZ25lZCBsb25nIGNzcl9udW0s
IHVuc2lnbmVkIGxvbmcgKnZhbCk7Cj4gPiA+ICAgICAgICAgaW50IGNzcl93cml0ZV9udW0odW5z
aWduZWQgbG9uZyBjc3JfbnVtLCB1bnNpZ25lZCBsb25nIHZhbCk7Cj4gPiA+Cj4gPiA+IFRoaXMg
YWxsb3dzIHRoZSBjYWxsZXIgdG8gZWxpbWluYXRlIGEgdmFyaWFibGUgZm9yIHRlbXBvcmFyaWx5
IHN0b3JpbmcKPiA+ID4gdGhlIGVycm9yIGNvZGUgaWYgdGhleSB1c2UgaXQganVzdCBhZnRlciB0
aGUgaW52b2thdGlvbiwgYW5kIGZpdHMgdGhlCj4gPiA+IGNvbW1vbiBjb252ZW50aW9uIG9mIExp
bnV4IGJldHRlci4KPiA+Cj4gPiBEcmV3IGhhZCBzaW1pbGFyIGNvbW1lbnRzIHNvIHNlZSBteSBy
ZXNwb25zZSBpbiB0aGUgcHJldmlvdXMKPiA+IHBhdGNoIHJldmlzaW9uLiAoUmVmZXIsIGh0dHBz
Oi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2tlcm5lbC9tc2c1ODA4MTEzLmh0bWwpCj4KPiBUaGFu
a3MgZm9yIHRoZSByZWZlcmVuY2UuCj4KPiA+IEkgaGFkIGNvbnNpZGVyZWQgdGhpcyBidXQgdGhl
IHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQKPiA+IGluZGl2aWR1YWwgc3dpdGNo
IGNhc2VzIGluIGNzcl9yZWFkX251bSgpIGJlY29tZSByb3VnaGx5IDQKPiA+IGluc3RydWN0aW9u
cyBiZWNhdXNlIHZhbHVlIHJlYWQgZnJvbSBDU1IgaGFzIHRvIHdyaXR0ZW4gdG8gYSBtZW1vcnkK
PiA+IGxvY2F0aW9uLgo+Cj4gWW91IGNvdWxkIHJldHVybiBhIHN0cnVjdHVyZSBzbWFsbGVyIHRo
YW4gb3IgZXF1YWwgdG8gMiAqIFhMRU4gZnJvbQo+IGNzcl9yZWFkX251bSgpLCBhY2NvcmRpbmcg
dG8gdGhlIEFCSSBpdCBjb3VsZCBiZSBwYXNzZWQgaW4gYTAgYW5kIGExIGFuZAo+IHRodXMgc2hv
dWxkIHJlcXVpcmUgbm8gbWVtb3J5IG9wZXJhdGlvbi4KPgo+IExldCdzIGFzc3VtZSB3ZSBoYXZl
Cj4KPiAgICAgICAgIHN0cnVjdCBfX2Nzcl9yZWFkX3JldCB7Cj4gICAgICAgICAgICAgICAgIGxv
bmcgZXJyb3I7Cj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWU7Cj4gICAgICAg
ICB9Owo+Cj4gICAgICAgICBzdHJ1Y3QgX19jc3JfcmVhZF9yZXQgX19jc3JfcmVhZF9udW0odW5z
aWduZWQgbG9uZyBjc3JfbnVtKTsKPgo+IFRoZW4gYSB3cmFwcGVyIGxpa2UKPgo+ICAgICAgICAg
LyogcGllY2Ugb2YgdW50ZXN0ZWQgY29kZSAqLwo+ICAgICAgICAgc3RhdGljIGlubGluZSBpbnQg
Y3NyX3JlYWRfbnVtKHVuc2lnbmVkIGxvbmcgY3NyX251bSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICp2YWwpCj4gICAgICAgICB7Cj4gICAg
ICAgICAgICAgICAgIHN0cnVjdCBfX2Nzcl9yZWFkX3JldCByZXQgPSBfX2Nzcl9yZWFkX251bShj
c3JfbnVtKTsKPiAgICAgICAgICAgICAgICAgKnZhbCA9IHJldC52YWx1ZTsKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldC5lcnJvcjsKPiAgICAgICAgIH0KPgo+IGNvdWxkIHByb3ZpZGUgYW4g
aW50ZXJmYWNlIHRoYXQgSSd2ZSB0YWxrZWQgYWJvdXQgZWFybGllciwgYW5kIGl0Cj4gZm9sbG93
cyB0aGUga2VybmVsJ3MgY29udmVudGlvbi4KCkxpa2UgSSBtZW50aW9uZWQgcHJldmlvdXNseSwg
dGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdHJpZXMgdG8KbWluaW1pemUgaW5zdHJ1Y3Rpb25z
IGZvciBlYWNoIHN3aXRjaCBjYXNlIGFuZCBhdm9pZCB1bm5lY2Vzc2FyeQptZW1vcnkgbG9hZC9z
dG9yZS4gWW91ciBhbHRlcm5hdGUgc3VnZ2VzdGlvbiBpcyBubyBiZXR0ZXIgaW4gdGhpcwpyZXNw
ZWN0LgoKPgo+ID4gVGhlIGN1cnJlbnQgYXBwcm9hY2ggcmVzdWx0cyBpbiBqdXN0IDIgaW5zdHJ1
Y3Rpb25zIGZvciBlYWNoCj4gPiBzd2l0Y2gtY2FzZS4gQWRkaXRpb25hbGx5LCB0aGUgY3VycmVu
dCBwcm90b3R5cGVzIG9mIGNzcl9yZWFkX251bSgpCj4gPiBhbmQgY3NyX3dyaXRlX251bSgpIGFy
ZSBjbG9zZXIgdG8gY3NyX3JlYWQoKSBhbmQgY3NyX3dyaXRlKCkKPiA+IHJlc3BlY3RpdmVseS4K
Pgo+IEJ1dCBjc3JfcmVhZCgpIGFuZCBjc3Jfd3JpdGUoKSBuZXZlciBkaXJlY3RseSByYWlzZSBl
cnJvcnMgdGhhdCBpcwo+IGV4cGVjdGVkIHRvIGJlIGhhbmRsZWQgYnkgdGhlIGNhbGxlci4gSSBk
b24ndCB0aGluayBpdCdzIGEgZmFpcgo+IGNvbXBhcmlzb24uCgpjc3JfcmVhZF9udW0oKSBhbmQg
Y3NyX3dyaXRlX251bSgpIGFyZSBkaWZmZXJlbnQgYmVjYXVzZQp0aGVzZSBmdW5jdGlvbnMgdGFr
ZSBDU1IgbnVtYmVyIGFzIHBhcmFtZXRlciBzbyBjYWxsZXIgY2FuCnBhc3MgYW4gdW5zdXBwb3J0
ZWQgdmFsdWUgdG8gdGhlc2UgZnVuY3Rpb25zIHdoaWNoIG5lZWRzIHRvCmJlIHJlcG9ydGVkIGJh
Y2sgYXMgYW4gZXJyb3IuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
