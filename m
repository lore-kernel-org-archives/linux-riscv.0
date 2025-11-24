Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C207CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 04:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FT+7LeHhm+gMQgF82wZ2WQb6wdTyQtPB8zxTGOPENk=; b=idsqpNgRTWGlQH
	xEd0STnslm4B8CCgK1RsuD7qIGCJ9IpRdiQ+AbULeZGOXDfq+aANVQrHu4Nw3ZrkvgQJ+XpdTuHp7
	xmyomsUc6+5SWvflN8iuz1xZ+wZuA8Wr6PBAWSXKk0aR+U0pKA8GJ+aPn+9I0FNPjbBp/O+YgPPDs
	G1dYJHViRXw433QjikSAfpqefb3Lzjz2miTU/AMTtL2CgKG76DMrCc4MkNYx8/IrlXn67My3dsr7n
	6/lXwh6sYSiWNAe5sGqP41+uaMtaZKseXghjdxaqphz3SjE7nDGGbqs8R+ofwX3WZUkwrm4dAucIl
	VCDz6PDu7skltOvjrezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOW7-0000000B5NG-0sRf;
	Mon, 24 Nov 2025 04:49:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOW4-0000000B5Ms-39FW
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 04:49:34 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5945510fd7aso3285678e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 20:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763959770; x=1764564570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOtbFMGWRLmZjtUaI1vJyqoGigotKbiW0HzZimuo/yE=;
        b=eGEpi+UTOCUyMENvp6SzDnSzBMLIpsYOSVkULNZIWFejQix8m6UTuWoLLCuLs5udeR
         HapgKqif/VIxxSWLjdd2usqNVcCgTBNkM8ZST5wmcWX8KMWWsPLOl+kI2f36K+QZPZ8L
         B5ymddLPo0Fvc4HsWnNs4Bl0iI/m/au6fJGYCnYiCCNUOGneX2PQidvR4MRZBbw3IkSg
         L/hBijaRlAF4Fm75tiRE1SW7SzJx+63uu+AtZAhovwrhRvetYdBzmZCcuDKG6LirO1Qb
         +m0G/lroJsAGdiHEk0Rb8AkCVTT0JUabgTNP+J1dTcD+8dBbr2TZSZTO4J9cr+NDttnE
         udIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763959770; x=1764564570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOtbFMGWRLmZjtUaI1vJyqoGigotKbiW0HzZimuo/yE=;
        b=lLun1QPwsB+2VcqwOxASY2chrwzMkZpku+u0EjI0W0La/KyXDcktV0/c+6huK3Sj8+
         vAWwGLcAyN1SnYUG5sdRNPRq5qgQ17MMPOQHE6iURwJKlGm3edzt6PlCZB0uieSKetUt
         c1LOm8+lT+1IlXzYE0smAYUQijlL0f6K3iWhYDmCXUR4zcYLlTHgIldyvX7OxKjTC118
         pct6iX8jL5y45MCsAWS0VcTskEURRwtCif7iJoe5qz9W49ip9pDB7VOGW7UgrNRu50Pv
         9TGZ4sAfzoC5hf4qVCSVgoljIShkCxFIkcjQy6JdsY/fvvjUTGFQdHN1EAGfTtgN8mXx
         WjTg==
X-Forwarded-Encrypted: i=1; AJvYcCUB0oGHPy8VcSyweTeUc7yFHPwNc5cBqEDAnQ9GY8/VF6iE67Z/5MPdwXTkjCJT2WbspUzQkMYeR5pVxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRjUTda+jbovSWyka2VX14h1qqIX78I/z819AtSpYXVE7dIyhj
	tn5Q3msR7eHpB5zQPgwns77nvP8DKdO+qppuvOK9FkzRJWAFw60J9PzKIy9eVPODXgYn5L+VUEY
	rC+B9JaUMfWXtYr/Mjaj/gjZhUESUK2/XM7POqoQiNA==
X-Gm-Gg: ASbGncsMf+wDZP9eTsogHn509SvXBdFYicM+7nmdoNcagDvqBSau5rm6yndxTR2K9QP
	y4DUQvUyfvIOavdNrq0Z+nMdfJsefNywx3o341tKHCQ/rEQWLu9NNXhD2GcZJcsG0eSeDOevTRt
	FohYnsGuivymafVU0wAHF+lgaZ7KpU7W2i7l8OBanUWNeLwjGS3Egyl2NywVMz6CFWDzUbs3uGE
	PqVvJzDJWUqOHp6VchEL70NXp4IpgEwaka3oy9rCm0N7W4XRbdEVsGom1tF4lE2VIEl+H8=
X-Google-Smtp-Source: AGHT+IFjMCCjWgwiJ3CiTwA1NuSg8WtEQQ11Y0ybYypqt/+1bq3xs1SpkJFgmfLa1MTYIdUs2LTrr6ojFUZwZNR2Q/I=
X-Received: by 2002:a05:6512:1320:b0:594:292f:bbe9 with SMTP id
 2adb3069b0e04-596a3ee4fe0mr3485616e87.36.1763959770101; Sun, 23 Nov 2025
 20:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20251014132106.181155-1-apatel@ventanamicro.com>
 <20251014132106.181155-2-apatel@ventanamicro.com> <012aaa39-a37b-e682-0e34-9b7d7cd87f75@kernel.org>
 <CAAhSdy0iwq_ZPzFY5_x_wsbM_H+npSDVv1F=wP=O-_25VChh6Q@mail.gmail.com> <60f4c500-6e22-ed4b-912b-c9368bad7c9a@kernel.org>
In-Reply-To: <60f4c500-6e22-ed4b-912b-c9368bad7c9a@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 24 Nov 2025 10:19:18 +0530
X-Gm-Features: AWmQ_bmARPpFF_aZDw6BtyE8Zp2IhQfzQ9cWetAY3IX9XiLo5Htf0qi2dL8rOc0
Message-ID: <CAK9=C2VdvPU6b+vbL2KwnvaVo47ayNOLb-bH0UwjRj=MHe0V9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Paul Walmsley <pjw@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, 
	Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_204932_823950_F331A96E 
X-CRM114-Status: GOOD (  32.14  )
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

T24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgNjo0NOKAr0FNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMzAgT2N0IDIwMjUsIEFudXAgUGF0ZWwgd3JvdGU6
Cj4KPiA+IE9uIFRodSwgT2N0IDMwLCAyMDI1IGF0IDEyOjM14oCvQU0gUGF1bCBXYWxtc2xleSA8
cGp3QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIDE0IE9jdCAyMDI1LCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gPgo+ID4gPiA+IEluIFJJU0MtViwgdGhlcmUgaXMgbm8gQ1NSIHJlYWQv
d3JpdGUgaW5zdHJ1Y3Rpb24gd2hpY2ggdGFrZXMgQ1NSCj4gPiA+ID4gbnVtYmVyIHZpYSByZWdp
c3RlciBzbyBhZGQgY29tbW9uIGNzcl9yZWFkX251bSgpIGFuZCBjc3Jfd3JpdGVfbnVtKCkKPiA+
ID4gPiBmdW5jdGlvbnMgd2hpY2ggYWxsb3cgYWNjZXNzaW5nIGNlcnRhaW4gQ1NScyBieSBwYXNz
aW5nIENTUiBudW1iZXIKPiA+ID4gPiBhcyBwYXJhbWV0ZXIuIFRoZXNlIGNvbW1vbiBmdW5jdGlv
bnMgd2lsbCBiZSBmaXJzdCB1c2VkIGJ5IHRoZQo+ID4gPiA+IEFDUEkgQ1BQQyBkcml2ZXIgYW5k
IFJJU0MtViBQTVUgZHJpdmVyLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGFsc28gKHNpbGVudGx5
KSByZW1vdmVzIHRoZSBDU1IgbnVtYmVyIGZpbHRlcmluZywgZS5nLgo+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2
L2NwcGMuYwo+ID4gPiA+IGluZGV4IDQyYzFhOTA1MjQ3MC4uZmU0OTE5MzdlZDI1IDEwMDY0NAo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiA+ID4gPiArKysgYi9kcml2
ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCj4gPiA+ID4gQEAgLTY1LDI0ICs2NSwxOSBAQCBzdGF0aWMg
dm9pZCBzYmlfY3BwY193cml0ZSh2b2lkICp3cml0ZV9kYXRhKQo+ID4gPiA+ICBzdGF0aWMgdm9p
ZCBjcHBjX2ZmaF9jc3JfcmVhZCh2b2lkICpyZWFkX2RhdGEpCj4gPiA+ID4gIHsKPiA+ID4gPiAg
ICAgICBzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSAqZGF0YSA9IChzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSAq
KXJlYWRfZGF0YTsKPiA+ID4gPiArICAgICBpbnQgZXJyOwo+ID4gPiA+Cj4gPiA+ID4gLSAgICAg
c3dpdGNoIChkYXRhLT5yZWcpIHsKPiA+ID4gPiAtICAgICAvKiBTdXBwb3J0IG9ubHkgVElNRSBD
U1IgZm9yIG5vdyAqLwo+ID4gPiA+IC0gICAgIGNhc2UgQ1NSX1RJTUU6Cj4gPiA+ID4gLSAgICAg
ICAgICAgICBkYXRhLT5yZXQudmFsdWUgPSBjc3JfcmVhZChDU1JfVElNRSk7Cj4gPiA+ID4gLSAg
ICAgICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+ID4gPiA+IC0gICAgICAgICAgICAgYnJl
YWs7Cj4gPiA+ID4gLSAgICAgZGVmYXVsdDoKPiA+ID4gPiAtICAgICAgICAgICAgIGRhdGEtPnJl
dC5lcnJvciA9IC1FSU5WQUw7Cj4gPiA+ID4gLSAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiAt
ICAgICB9Cj4gPiA+Cj4gPiA+IC4uLiB0aGUgYWJvdmUgY29kZSwgYW5kOgo+ID4KPiA+IFRoZSBz
d2l0Y2ggY2FzZSBpcyBpbmNvbXBsZXRlIGZvciBjcHBjX2ZmaF9jc3JfcmVhZCgpLgo+ID4gQWxz
bywgY3NyX3JlYWRfbnVtKCkgYWxyZWFkeSBkb2VzIGFwcHJvcHJpYXRlIGZpbHRlcmluZwo+ID4g
c28gdGhlIHN3aXRjaCBjYXNlIG92ZXIgaGVyZSBpcyBub3cgcmVkdW5kYW50Lgo+ID4KPiA+ID4K
PiA+ID4gPiAgLyoKPiA+ID4gPiAgICogUmVhZCB0aGUgQ1NSIG9mIGEgY29ycmVzcG9uZGluZyBj
b3VudGVyLgo+ID4gPiA+ICAgKi8KPiA+ID4gPiAgdW5zaWduZWQgbG9uZyByaXNjdl9wbXVfY3Ry
X3JlYWRfY3NyKHVuc2lnbmVkIGxvbmcgY3NyKQo+ID4gPiA+ICB7Cj4gPiA+ID4gLSAgICAgaWYg
KGNzciA8IENTUl9DWUNMRSB8fCBjc3IgPiBDU1JfSFBNQ09VTlRFUjMxSCB8fAo+ID4gPiA+IC0g
ICAgICAgIChjc3IgPiBDU1JfSFBNQ09VTlRFUjMxICYmIGNzciA8IENTUl9DWUNMRUgpKSB7Cj4g
PiA+ID4gLSAgICAgICAgICAgICBwcl9lcnIoIkludmFsaWQgcGVyZm9ybWFuY2UgY291bnRlciBj
c3IgJWx4XG4iLCBjc3IpOwo+ID4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
PiA+Cj4gPiA+IC4uLiB0aGUgYWJvdmUgY29kZS4KPiA+ID4KPiA+ID4gSSdtIHRoaW5raW5nIHRo
YXQgd2UgcHJvYmFibHkgd2FudCB0byBrZWVwIHRoZSBDU1IgbnVtYmVyIGZpbHRlcmluZyBjb2Rl
Cj4gPiA+IGluOyBhdCBsZWFzdCwgSSBjYW4ndCB0aGluayBvZiBhIGdvb2QgcmVhc29uIHRvIHJl
bW92ZSBpdC4gIENhcmUgdG8gYWRkIGl0Cj4gPiA+IGJhY2sgaW4/Cj4gPgo+ID4gV2UgY2FuIHBv
dGVudGlhbGx5IGhhdmUgY3VzdG9tIENTUnMgYXMgaGFyZHdhcmUgY291bnRlcnMKPiA+IGhlbmNl
IHRoZSBDU1IgZmlsdGVyaW5nIG92ZXIgaGVyZSBpcyBhbHJlYWR5IGluY29tcGxldGUuIFBsdXMs
Cj4gPiBjc3JfcmVhZF9udW0oKSBhbHJlYWR5IGRvZXMgdGhlIENTUiBmaWx0ZXJpbmcgYW5kIHJl
dHVybnMKPiA+IGZhaWx1cmUgZm9yIGluYXBwcm9wcmlhdGUgQ1NSIG51bWJlci4KPgo+IE9LLiAg
VG8gbWUsIHRoZSBtb3N0IG5vdGFibGUgY2hhbmdlcyBpbiB0aGlzIHBhdGNoIGFyZSB0aGUgY2hh
bmdlcyBpbiB0aGUKPiBmaWx0ZXJzIGZvciBib3RoIHJlYWRzIGFuZCB3cml0ZXMgZm9yIHRoZSB0
d28gZGlmZmVyZW50IGNhbGwgc2l0ZXMsIEFDUEkKPiBGRkggYW5kIFBNVS4gIEl0IHdvdWxkIGJl
IGdvb2QgdG8gZG9jdW1lbnQgdGhlc2UgZmlsdGVyIGNoYW5nZXMgZGlyZWN0bHkKPiBpbiB0aGUg
cGF0Y2ggZGVzY3JpcHRpb24sIGFsb25nIHdpdGggdGhlIHJhdGlvbmFsZS4KPgo+IEknbSBhbHNv
IG5vdCB5ZXQgY29tcGxldGVseSBjb252aW5jZWQgdGhhdCB3ZSBzaG91bGQgYWxsb3cgYm90aCBv
ZiB0aGVzZQo+IGNhbGwgc2l0ZXMgdG8gcmVhZCBhbmQgd3JpdGUgYW55IGN1c3RvbSBDU1IuICBC
dXQgbWF5YmUgdGhlIHVwZGF0ZWQgcGF0Y2gKPiBkZXNjcmlwdGlvbiBtaWdodCBiZSBjb252aW5j
aW5nLi4uCgpUaGUgUklTQy1WIEFDUEkgRkZIIHNwZWNpZmljYXRpb24gYWxsb3dzIGEgMTItYml0
IENTUiBudW1iZXIgaW4KX0NQQyBvYmplY3QgZW5jb2Rpbmcgc28gYW55IENTUiBjYW4gYmUgbWFw
cGVkIGFzIGEgQ1BQQyByZWdpc3RlcgooaW5jbHVkaW5nIGN1c3RvbSBDU1JzKS4KClNpbWlsYXJs
eSwgdGhlIFJJU0MtViBTQkkgUE1VIHNwZWNpZmljYXRpb24gcmV0dXJuIDEyLWJpdCBDU1IgbnVt
YmVyCmluIHNiaV9wbXVfY291bnRlcl9nZXRfaW5mbygpIHNvIGEgcGxhdGZvcm0gY2FuIHVzZSBj
dXN0b20gQ1NScyBmb3IKYWRkaXRpb25hbCBIVyBjb3VudGVycy4KCkkgd2lsbCB1cGRhdGUgdGhl
IGNvbW1pdCBkZXNjcmlwdGlvbiBhY2NvcmRpbmdseS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
