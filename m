Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C4C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTGnVRJMOMCNleQo8oJYp8cZRlPOxffqJZv/sbGmh88=; b=FMkTn4KY98xmLA
	6sC5wwdtN9EnyB7dVgSI5Z4VUwn5u0TdJ2ePQ7e39JSvwmxZxJZbw1vBtjnXFPz5JCUn2+QPBOMYe
	iCGeTx7cB/rUb7cI0c4eCAYrzJLdThCV24vLPGcQnmoZiMTwQVL0z6Zopbmkh4rf7lf5LIQUgy7fF
	CjKicx6dMYrHtFeiv56uMu1XBIGF1KQ8w34T++mEYMmYBVm64pWWoQOlSURRLh47imP134X9YKVmI
	BuKgTsjDTgiIH2mZ2aW5VLGZSEDfWZWSV7HS27nuRVf1ht4zjdEEyeQah0V7CG3VSoAUcc1o3HxIB
	cLlsE3M81gLQm2nkmwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGqg-0000000CmvB-2Uxq;
	Tue, 23 Jul 2024 14:50:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGqF-0000000CmnE-2zvY
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 14:50:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2eeb1051360so56650191fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jul 2024 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721746213; x=1722351013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAQKVtTByoBRS6j1licywyxM1Ykos6KOI6h9i1fVoF0=;
        b=EdjxuDhJJKhE7hti7eyIbmUehR8/C59CG+d6jNAs5fLnUIoCdExz8CGRcZMaEgFyjD
         A7TvA7B3lLQRWZmm6fdjlpbvOiJTiNZ7eXxsT2yIMphTwJfNp+ZPqY+DkaNi5FMH4Jbt
         IpcLp7Ltdc1HFb5mURd+ve2dUFVok78SJ8X0O7QRr8R9V9FhiiW54VXfHyrxAg50YhJX
         E4lB2yQzNcs3djbPDcGG37EoZK7hCJcbMt3IaZw8w9C8jElFwpzuxZ5qmyf5KGV6KADo
         G5iRIgK/jzybcThaTA0CpPa9277NuAoLG8o/Jjamwr+1pU92p6WkDsOWD1YgROzq1GeX
         OpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721746213; x=1722351013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAQKVtTByoBRS6j1licywyxM1Ykos6KOI6h9i1fVoF0=;
        b=s0BT/UAmULxi4SSM7U0r4msB8eQua6oJIv85w6u2SbgNGUgkq/WR+Fg1TH44VDLTSn
         HOEBU0AGNW0QX1hMYigU5fpw/9D2LfFtsbuLJ7mZa2WAksHZaRqgY9f3sL66fSvRJYch
         mVmYx30hdZil4R7MmU9z1SKWM+9xtcHBI+IUIbLrXZkMISqOEA4vwLED+Vz+eQYSOK5Z
         6mCX6ZsW6dsSvnYSNk3b/487fOJjxCpFJs8rZvLX4GiaTUT8suZj3JGHmv0nz2A2qgnT
         495+/x2iDKT2HEQFwFkEa+oEz2z8o1yFeDadJWj2avJw0eVn84VpxKyzjXUvBDax6Uot
         A2tg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ81zkWk17h/nIQ4rRXNsVTmUGyyTpmjzz2XaOiMxk6ae8hrJnpZ6TzJD9zZdbLANYEUmh22HCx8eguLedfd4dTRpacN0Nj/NNcAfaPyH/
X-Gm-Message-State: AOJu0YwZh6c5zg6iCdgqsLwewTiyWC9DelM3EQI69eBJ1jCrVC0/6Y1E
	u+oLE+UceZR8M+DAJhhL1g7HlXur4WkCBv23Esw7nJMDMBc24JlnsKE/5ftvSiiJuPDZ8RwcQLY
	pyqiv1hKoyEzpb0pWQYvkznhSP1FLDsaNyDCACQ==
X-Google-Smtp-Source: AGHT+IHwxfnXNf2MLZFxPOzbNUSu5l5yaSYC7+etjPBXXrmtOcuEMbNGrhBWBQKQBDYxi4BsfO4P1BJ6YXZ/YQSLVIk=
X-Received: by 2002:a2e:97c4:0:b0:2ef:2c27:6680 with SMTP id
 38308e7fff4ca-2ef2c27675bmr52001191fa.12.1721746212143; Tue, 23 Jul 2024
 07:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
 <20240723-23811cc47f7863d12b6a78e8@orel> <CAJve8omO0DwQEO+KEjhJFn=uYNAyZNYsnQieETocRzwb0RTGiA@mail.gmail.com>
In-Reply-To: <CAJve8omO0DwQEO+KEjhJFn=uYNAyZNYsnQieETocRzwb0RTGiA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 23 Jul 2024 20:20:00 +0530
Message-ID: <CAK9=C2Xt2JPaUOTfN9CyyeVQiS9KKYWaH4RUTwYQ6UGjq3VnHQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
To: Haibo Xu <xiaobo55x@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_075015_783328_7DB5C103 
X-CRM114-Status: GOOD (  33.16  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Robert Richter <rrichter@amd.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgNzo1MeKAr1BNIEhhaWJvIFh1IDx4aWFvYm81NXhAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDI0IGF0IDk6MzDigK9QTSBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IEp1biAxMywgMjAyNCBhdCAwNDo1NDozM1BNIEdNVCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IEFk
ZCBhY3BpX251bWEuYyBmaWxlIHRvIGVuYWJsZSBwYXJzZSBOVU1BIGluZm9ybWF0aW9uIGZyb20K
PiA+ID4gQUNQSSBTUkFUIGFuZCBTTElUIHRhYmxlcy4gU1JBVCB0YWJsZSBwcm92aWRlIENQVXMo
SGFydCkgYW5kCj4gPiA+IG1lbW9yeSBub2RlcyB0byBwcm94aW1pdHkgZG9tYWluIG1hcHBpbmcs
IHdoaWxlIFNMSVQgdGFibGUKPiA+ID4gcHJvdmlkZSB0aGUgZGlzdGFuY2UgbWV0cmljcyBiZXR3
ZWVuIHByb3hpbWl0eSBkb21haW5zLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBY
dSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3Vu
aWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYWNwaS5oIHwgIDE1ICsrKy0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
ICAgIHwgICAxICsKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyAgICAgIHwgICA1IC0t
Cj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYyB8IDEzMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAg
ICB8ICAgNCArLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jICAgfCAgIDIgLQo+
ID4gPiAgaW5jbHVkZS9saW51eC9hY3BpLmggICAgICAgICAgfCAgIDYgKysKPiA+ID4gIDcgZmls
ZXMgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYWNwaS5oCj4gPiA+IGluZGV4IDdkYWQwY2Y5ZDcwMS4uZTBhMWY4NDQwNGYz
IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaAo+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaAo+ID4gPiBAQCAtNjEsMTEgKzYxLDE0
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2ZpeF9waHlzX3BhY2thZ2VfaWQoaW50IG51bSwg
dTMyIHNsb3QpIHsgfQo+ID4gPgo+ID4gPiAgdm9pZCBhY3BpX2luaXRfcmludGNfbWFwKHZvaWQp
Owo+ID4gPiAgc3RydWN0IGFjcGlfbWFkdF9yaW50YyAqYWNwaV9jcHVfZ2V0X21hZHRfcmludGMo
aW50IGNwdSk7Cj4gPiA+IC11MzIgZ2V0X2FjcGlfaWRfZm9yX2NwdShpbnQgY3B1KTsKPiA+ID4g
K3N0YXRpYyBpbmxpbmUgdTMyIGdldF9hY3BpX2lkX2Zvcl9jcHUoaW50IGNwdSkKPiA+ID4gK3sK
PiA+ID4gKyAgICAgcmV0dXJuIGFjcGlfY3B1X2dldF9tYWR0X3JpbnRjKGNwdSktPnVpZDsKPiA+
ID4gK30KPiA+ID4gKwo+ID4gPiAgaW50IGFjcGlfZ2V0X3Jpc2N2X2lzYShzdHJ1Y3QgYWNwaV90
YWJsZV9oZWFkZXIgKnRhYmxlLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgY3B1LCBjb25zdCBjaGFyICoqaXNhKTsKPiA+ID4KPiA+ID4gLXN0YXRpYyBpbmxpbmUgaW50
IGFjcGlfbnVtYV9nZXRfbmlkKHVuc2lnbmVkIGludCBjcHUpIHsgcmV0dXJuIE5VTUFfTk9fTk9E
RTsgfQo+ID4gPiAgdm9pZCBhY3BpX2dldF9jYm9fYmxvY2tfc2l6ZShzdHJ1Y3QgYWNwaV90YWJs
ZV9oZWFkZXIgKnRhYmxlLCB1MzIgKmNib21fc2l6ZSwKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdTMyICpjYm96X3NpemUsIHUzMiAqY2JvcF9zaXplKTsKPiA+ID4gICNlbHNlCj4g
PiA+IEBAIC04Nyw0ICs5MCwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYWNwaV9nZXRfY2JvX2Js
b2NrX3NpemUoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZSwKPiA+ID4KPiA+ID4gICNl
bmRpZiAvKiBDT05GSUdfQUNQSSAqLwo+ID4gPgo+ID4gPiArI2lmZGVmIENPTkZJR19BQ1BJX05V
TUEKPiA+ID4gK2ludCBhY3BpX251bWFfZ2V0X25pZCh1bnNpZ25lZCBpbnQgY3B1KTsKPiA+ID4g
K3ZvaWQgYWNwaV9tYXBfY3B1c190b19ub2Rlcyh2b2lkKTsKPiA+ID4gKyNlbHNlCj4gPiA+ICtz
dGF0aWMgaW5saW5lIGludCBhY3BpX251bWFfZ2V0X25pZCh1bnNpZ25lZCBpbnQgY3B1KSB7IHJl
dHVybiBOVU1BX05PX05PREU7IH0KPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhY3BpX21hcF9j
cHVzX3RvX25vZGVzKHZvaWQpIHsgfQo+ID4gPiArI2VuZGlmIC8qIENPTkZJR19BQ1BJX05VTUEg
Ki8KPiA+ID4gKwo+ID4gPiAgI2VuZGlmIC8qX0FTTV9BQ1BJX0gqLwo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmls
ZQo+ID4gPiBpbmRleCA1YjI0M2Q0NmY0YjEuLjFlMmFmZWMxNDFiNSAxMDA2NDQKPiA+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvTWFrZWZpbGUKPiA+ID4gQEAgLTExMCwzICsxMTAsNCBAQCBvYmotJChDT05GSUdfQ09NUEFU
KSAgICAgICAgICAgICAgKz0gY29tcGF0X3Zkc28vCj4gPiA+Cj4gPiA+ICBvYmotJChDT05GSUdf
NjRCSVQpICAgICAgICAgICs9IHBpLwo+ID4gPiAgb2JqLSQoQ09ORklHX0FDUEkpICAgICAgICAg
ICArPSBhY3BpLm8KPiA+ID4gK29iai0kKENPTkZJR19BQ1BJX05VTUEpICAgICAgKz0gYWNwaV9u
dW1hLm8KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gPiBpbmRleCBlNjE5ZWRjOGIwY2MuLjA0MGJkYmZlYTJi
NCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gPiBAQCAtMTkxLDExICsxOTEsNiBAQCBzdHJ1
Y3QgYWNwaV9tYWR0X3JpbnRjICphY3BpX2NwdV9nZXRfbWFkdF9yaW50YyhpbnQgY3B1KQo+ID4g
PiAgICAgICByZXR1cm4gJmNwdV9tYWR0X3JpbnRjW2NwdV07Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+
IC11MzIgZ2V0X2FjcGlfaWRfZm9yX2NwdShpbnQgY3B1KQo+ID4gPiAtewo+ID4gPiAtICAgICBy
ZXR1cm4gYWNwaV9jcHVfZ2V0X21hZHRfcmludGMoY3B1KS0+dWlkOwo+ID4gPiAtfQo+ID4gPiAt
Cj4gPiA+ICAvKgo+ID4gPiAgICogX19hY3BpX21hcF90YWJsZSgpIHdpbGwgYmUgY2FsbGVkIGJl
Zm9yZSBwYWdpbmdfaW5pdCgpLCBzbyBlYXJseV9pb3JlbWFwKCkKPiA+ID4gICAqIG9yIGVhcmx5
X21lbXJlbWFwKCkgc2hvdWxkIGJlIGNhbGxlZCBoZXJlIHRvIGZvciBBQ1BJIHRhYmxlIG1hcHBp
bmcuCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDIzMTQ4MmQ2OTQ2Cj4gPiA+IC0tLSAvZGV2L251bGwK
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaV9udW1hLmMKPiA+ID4gQEAgLTAsMCAr
MSwxMzEgQEAKPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+
ICsvKgo+ID4gPiArICogQUNQSSA2LjYgYmFzZWQgTlVNQSBzZXR1cCBmb3IgUklTQ1YKPiA+ID4g
KyAqIExvdHMgb2YgY29kZSB3YXMgYm9ycm93ZWQgZnJvbSBhcmNoL2FybTY0L2tlcm5lbC9hY3Bp
X251bWEuYwo+ID4gPiArICoKPiA+ID4gKyAqIENvcHlyaWdodCAyMDA0IEFuZGkgS2xlZW4sIFN1
U0UgTGFicy4KPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxMy0yMDE2LCBMaW5hcm8gTHRkLgo+
ID4gPiArICogICAgICAgICAgIEF1dGhvcjogSGFuanVuIEd1byA8aGFuanVuLmd1b0BsaW5hcm8u
b3JnPgo+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDI0IEludGVsIENvcnBvcmF0aW9uLgo+ID4g
PiArICoKPiA+ID4gKyAqIFJlYWRzIHRoZSBBQ1BJIFNSQVQgdGFibGUgdG8gZmlndXJlIG91dCB3
aGF0IG1lbW9yeSBiZWxvbmdzIHRvIHdoaWNoIENQVXMuCj4gPiA+ICsgKgo+ID4gPiArICogQ2Fs
bGVkIGZyb20gYWNwaV9udW1hX2luaXQgd2hpbGUgcmVhZGluZyB0aGUgU1JBVCBhbmQgU0xJVCB0
YWJsZXMuCj4gPiA+ICsgKiBBc3N1bWVzIGFsbCBtZW1vcnkgcmVnaW9ucyBiZWxvbmdpbmcgdG8g
YSBzaW5nbGUgcHJveGltaXR5IGRvbWFpbgo+ID4gPiArICogYXJlIGluIG9uZSBjaHVuay4gSG9s
ZXMgYmV0d2VlbiB0aGVtIHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlIG5vZGUuCj4gPiA+ICsgKi8K
PiA+ID4gKwo+ID4gPiArI2RlZmluZSBwcl9mbXQoZm10KSAiQUNQSTogTlVNQTogIiBmbXQKPiA+
ID4gKwo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9iaXRtYXAuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC9tbS5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4gPiA+
ICsjaW5jbHVkZSA8bGludXgvbW16b25lLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvdG9wb2xvZ3kuaD4KPiA+ID4gKwo+ID4gPiArI2lu
Y2x1ZGUgPGFzbS9udW1hLmg+Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgYWNwaV9lYXJseV9u
b2RlX21hcFtOUl9DUFVTXSBfX2luaXRkYXRhID0geyBOVU1BX05PX05PREUgfTsKPiA+Cj4gPiBU
aGlzIG9ubHkgc2V0cyBhY3BpX2Vhcmx5X25vZGVfbWFwWzBdIHRvIE5VTUFfTk9fTk9ERS4gQXNz
dW1pbmcgd2Ugd2FudAo+ID4gdG8gZW5zdXJlIGFsbCBvZiB0aGVtIGFyZSBpbml0aWFsaXplZCB0
byBOVU1BX05PX05PREUsIHRoZW4gd2UgbmVlZAo+ID4KPiA+IHN0YXRpYyBpbnQgYWNwaV9lYXJs
eV9ub2RlX21hcFtOUl9DUFVTXSBfX2luaXRkYXRhID0geyBbMCAuLi4gTlJfQ1BVUyAtIDFdID0g
TlVNQV9OT19OT0RFIH07Cj4gPgo+Cj4gR29vZCBjYXRjaCEgVGhhbmtzIQo+Cj4gQFBhbG1lciBE
YWJiZWx0Cj4gSSBub3RpY2VkIHRoaXMgc2VyaWVzIGhhZCBiZWVuIG1lcmdlZCB0byByaXNjdi9s
aW51eC5naXQgKGZvci1uZXh0KSwKPiBjb3VsZCB5b3UgaGVscCBpbmNsdWRlIHRoZSBhYm92ZSBj
aGFuZ2UgZnJvbSBEcmV3Pwo+IE9yIHNoYWxsIEkgc2VuZCBvdXQgYSBuZXcgc2VyaWVzPwoKU2lu
Y2UgaXQncyBhbHJlYWR5IGluIGZvci1uZXh0LCBJIHN1Z2dlc3QgaGF2aW5nIGEgRml4ZXMKcGF0
Y2ggYW5kIGFkZCB0aGF0IHRvIGZvci1uZXh0IGJlY2F1c2UgZm9yLW5leHQgaXMgc3VwcG9zZWQK
dG8gaGF2ZSBhIHN0YWJsZSBjb21taXQgaGlzdG9yeS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
