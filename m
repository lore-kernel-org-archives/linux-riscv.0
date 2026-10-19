Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D777606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p8y65OXz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NTs2caYy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R06t1Ah26GJM+jsLjfO+AOG4EwJL0e/cAp5XaKFLKrU=; b=p8y65OXzc+RTL1
	OMAlwAkChGAhYf+qg6Nbog2FZranG4kRPIRmumTQQYVqOdTSoracjhfMy5gLjWUXRMWPtNLjgUeAD
	oSPKza6rTTMtgejsOJp1HhiOJ6gJa2IvKO6NpPZADwuH/MxoIxU2zBW+VD+u8dnawnYWl852ih4sL
	caFg9wS3RcpLm36cI7N10hefghgLkjD5VY7NeTDnmuG+MYg4L//VtPHvdgDxWnOk1IisCHkQEM1+/
	p+jLcVUC/MAwbHWJu2PIwkANd82B0qgkuRgLfF35SBen6ibobF4Ul1j36jvtB2kjSyU1nU6Kz8kb7
	hXbKMMeOMg/U7n4UFcZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIr6A-000000084xd-0AGV;
	Mon, 19 Oct 2026 17:24:34 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIr67-000000084x3-0nAw
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 17:24:32 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67990a45e02so2100956d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 10:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792430670; cv=none;
        d=google.com; s=arc-20260327;
        b=LKVTF9hKhVhMbdQBW3f8KJbaWYLnDin48JkyDq3Pq8QI22tgkR8pP/CiNizwhI7l2o
         3lWWUVu/aPelJIe02l4ClL8b6QpAq84ekUPaMdiVqLquLTPWQR6HLaRf22SmM69xdw/w
         IPqj3OVneh/VgGDvlpNEaDFk/H/IqOXkCeRCQ5gP5nYkWRcG4Z8ffJbt3yoOBLtM7ZMA
         HcqRfmHasennuRfzpMNZoNj9kcmgwhDIwQtZfzK2vTy+GJTMyNwFBTJiKbhMexd6Rcl8
         Nhj0QSEdFXzd4IbVASltCyLzb5YZ9RnH5NwtQWqVa/jAcHc4M8aV59atsIPgHhSU3DIJ
         EGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
        fh=Gg33yRY3YgCTY4OG8JJBXNznsgdFkoR3SpLwIL9H/Hw=;
        b=D9koqozT72EPxjZHTfYVDKZBVLmWXCvlyTZFBydU0/c4jL6OASBGY6gGTIBKRJRvyU
         TWdF5Yxs0gNy50uetQv9uwjE3tRjfRjBO+WYYTZoW1tyg/EuIj7gat9yf5G6InSAZz4w
         4VbBMCuOuuyqWOy5OeBRXL3lZi6Hw1VJ4jRiVKlBJGCEIYDfmi98154RRLmqxvSJI2oD
         EbJA72vg/Hq6RDNriiBh/x5uQUwumLdcPjQ+0Ah+qB4GUj3wIz2OsRGh83fVDC/1/PBn
         T+4SSEGnI4ZYvfvYzDRnqrZlIFzID5wUjrwnqvRhXBANnryF0nFciF9eQVjiikkAIQq3
         UPKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430670; x=1793035470; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
        b=NTs2caYyqo7gs29jA21f9r15AWfuTpzF9jKGdqE4fhP4TI81JXGvL/j7aLcSt6pHma
         XDJAS0hrccgu+MiarwtcVstqhhAi9gzIkoDORMlJ71v7bXwzuDldxyH/4etnHMwYopI9
         BcM/jCgiq/o2ohZ+jI0bce9KprLPrKQckO72oLuUefr07HslPVDodElx5Ruao3hopBXb
         QQ6vZvP36Q8i5ktxdDTrGNtxlf85ehire58zUdEWgIj61BId6rcyVFjD9mPneLL6xq8Y
         nMX6lmbJKrns+urrD0agl1RBEmYdbaQMm3+XgeSbbu8wOIDebHX8+0SGQMNVgqbFoKaW
         M62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430670; x=1793035470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
        b=UlOyt/IsK+4NLGPYv8uR/M+fUb//Qo/QAdPpAYCPNhT8XeCgGwwjMo33cxkakzjula
         6iqlL7MdSY5V/II6Hke1DmWf7HD2ojCmVAVpgq5+VxGQqS2+acmMJmU35KydAFPD3TxE
         /ocyChN0tut7PSSoyIFOFQbN6JtTkAZiBqyYdKLaejiF1VcHrTry2uyDM0Z+NMrKUntc
         hIJpkcG7XPXmP3TtGpNbXSY9IFQg/Vwohfemdzfx+RbdK867p5eBdAfdOk3LfviaJaW+
         z2FDzHdMypm+jiG+AIFSUIq45S1MSiqUc/v1SCIKVyT8lw16nCOy8v28NRR4bn0cQygB
         3aEQ==
X-Forwarded-Encrypted: i=1; AKwUvByJE/8pq3TtOMoP1HvwLmb7EjoQIcqe2asYNhGFYb3/K6lluSyn8tciGH7ARBZw+TG2WcF3uMe1i7nPAw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLnghndMrY2/COt2IpvbAtl6X8Yy7WxI+xU7eNf6sWrkHAcMqjh
	vwV7vSCM5+HMwfVZn7JnXtHGT8N/ebiL1a1In1gT0FN7+yDbUMkBA9wXLTaB5nbhtxUu+Ng4cIf
	KOQRG1FZOtpzCtx6WY+k7oYs4/FomPfLu4ePUtiU=
X-Gm-Gg: AYBFou34YCXzY/+o84FxUJa4navwYMtUWqQh/ol9YFJtiF2PHIFOF2DgvjGyjjBZRCK
	eZarLjd2V1QAPUkuvmwqetqtdGD3YUJl6RobYM0M9PC6+jB/bRWw2cDdlGKcgqrnyGxqscwwQ9c
	Kg6Nmf/O5nqTIDv4ruy5Z4FvONhpLDtTypBsnkFcRfypwWGmnzjM6VIQRE7mTgvT/UbkEayaR+T
	woUK5nzO45b+v9q+STQzUORilohKsdLcIabTooMrVuDJceJEhVuQQ7u+XRL8gNaZIQYwOkhYvM/
	aOesk+SoEiaxvTBL1awXsWojNDlPAcOxRTEKN4wQQAVOyURoD3IcTvu2twA6SOrQMw==
X-Received: by 2002:a05:690e:d58:b0:676:863f:8ed2 with SMTP id
 956f58d0204a3-679ca83508fmr2653476d50.58.1792430669722; Mon, 19 Oct 2026
 10:24:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com> <20261019100029.32a09f71@gandalf.local.home>
In-Reply-To: <20261019100029.32a09f71@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Mon, 19 Oct 2026 19:24:17 +0200
X-Gm-Features: AclHuK_oGHvZP8ZsUmOuB3mE6AE11B0H-Atozg5trQ0bWx9omrbaU2HKmEywW-o
Message-ID: <CALsPMBOKENath9-6pUoPrrSRbuudg0V9tc76bLcxsnkQJJkvgQ@mail.gmail.com>
Subject: Re: [PATCH v6] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_102431_245537_10ACE546 
X-CRM114-Status: GOOD (  24.16  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgNDowMOKAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgMTggT2N0IDIwMjYgMTM6MTQ6NTkgKzAy
MDAKPiBSb21hbiAnSGVkaW4nIFN0b3JvemhlbmtvIDxyb21ldXNtZWlzdGVyQGdtYWlsLmNvbT4g
d3JvdGU6Cj4KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Jpc2N2X3RsYi5oIHwgMTAzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L21tL3Rs
YmZsdXNoLmMgICAgICAgICAgIHwgIDQ1ICsrKysrKysrKysrKysrLS0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDE0NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Jpc2N2X3RsYi5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9yaXNjdl90bGIuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNGQ1ZjQ4MTEyOTQxCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Jpc2N2X3RsYi5oCj4KPiBOb3JtYWwgY29udmVudGlvbiB3b3Vs
ZCBiZSB0byBoYXZlICJ0cmFjZSIgaW4gdGhlIG5hbWUuIHJpc2N2X3RyYWNlLmggPwo+Cj4gQXMg
cmlzY3ZfdGxiLmggbG9va3MgdG8gYmUgc3BlY2lmaWMgYWJvdXQgdGxiIGFuZCBub3QgdHJhY2lu
Zy4KPgo+IC0tIFN0ZXZlCj4KCkhpIFN0ZXZlLAoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4K
CkkndmUgcmVuYW1lZCB0aGUgaGVhZGVyIHRvIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiX3Ry
YWNlLmgKaW4gdjcuIEkgcHJlZmVyIHRoaXMgb3ZlciByaXNjdl90cmFjZS5oIGJlY2F1c2UgdGhl
IGxhdHRlcgpzb3VuZHMgdG9vIGdlbmVyaWMgZm9yIGEgaGVhZGVyIGRlZGljYXRlZCB0byBUTEIg
dHJhY2luZy4KCkRpZCB5b3UgaGF2ZSBhIGJyb2FkZXIgdXNlIGluIG1pbmQsIHN1Y2ggYXMgaW5j
bHVkaW5nIG90aGVyClJJU0MtViB0cmFjZXBvaW50cyBpbiB0aGlzIGhlYWRlcj8KCklmIHlvdSBz
dGlsbCBwcmVmZXIgcmlzY3ZfdHJhY2UuaCwgSSdtIGhhcHB5IHRvIHJlY29uc2lkZXIuCgpUaGUg
dXBkYXRlZCBwYXRjaCBpcyBhdmFpbGFibGUgaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjYxMDE5LXRsYl90cmFjZXBvaW50LXY3LTEtNGNjM2U5OWQzODdhQGdt
YWlsLmNvbS8KCj4KPiA+IEBAIC0wLDAgKzEsMTAzIEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+ICsjdW5kZWYgVFJBQ0VfU1lTVEVNCj4gPiArI2RlZmlu
ZSBUUkFDRV9TWVNURU0gcmlzY3ZfdGxiCj4gPiArCj4gPiArI2lmICFkZWZpbmVkKF9UUkFDRV9S
SVNDVl9UTEJfSCkgfHwgZGVmaW5lZChUUkFDRV9IRUFERVJfTVVMVElfUkVBRCkKPiA+ICsjZGVm
aW5lIF9UUkFDRV9SSVNDVl9UTEJfSAo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9jcHVtYXNr
Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9pbnQuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvcGVyZl9ldmVudC5oPgo+ID4gKwo+ID4gKyNpZm5kZWYgX1RSQUNFX1JJU0NWX1RMQl9FTlVN
Uwo+ID4gKyNkZWZpbmUgX1RSQUNFX1JJU0NWX1RMQl9FTlVNUwo+ID4gKwo+ID4gK2VudW0gcmlz
Y3ZfdGxiX2ZsdXNoX3Njb3BlIHsKPiA+ICsgICAgIFJJU0NWX1RMQl9GTFVTSF9TQ09QRV9TSU5H
TEUsCj4gPiArICAgICBSSVNDVl9UTEJfRkxVU0hfU0NPUEVfUkFOR0UsCj4gPiArICAgICBSSVND
Vl9UTEJfRkxVU0hfU0NPUEVfQUREUkVTU19TUEFDRSwKPiA+ICsgICAgIFJJU0NWX1RMQl9GTFVT
SF9TQ09QRV9BTEwsCj4gPiArfTsKPiA+ICsKPiA+ICsjZW5kaWYgLyogX1RSQUNFX1JJU0NWX1RM
Ql9FTlVNUyAqLwo+ID4gKwo+ID4gK1RSQUNFX0RFRklORV9FTlVNKFJJU0NWX1RMQl9GTFVTSF9T
Q09QRV9TSU5HTEUpOwo+ID4gK1RSQUNFX0RFRklORV9FTlVNKFJJU0NWX1RMQl9GTFVTSF9TQ09Q
RV9SQU5HRSk7Cj4gPiArVFJBQ0VfREVGSU5FX0VOVU0oUklTQ1ZfVExCX0ZMVVNIX1NDT1BFX0FE
RFJFU1NfU1BBQ0UpOwo+ID4gK1RSQUNFX0RFRklORV9FTlVNKFJJU0NWX1RMQl9GTFVTSF9TQ09Q
RV9BTEwpOwo+ID4gKwo+ID4gKyNkZWZpbmUgc2hvd19yaXNjdl90bGJfZmx1c2hfc2NvcGUoc2Nv
cGUpIFwKPiA+ICsgICAgIF9fcHJpbnRfc3ltYm9saWMoc2NvcGUsIFwKPiA+ICsgICAgICAgICAg
ICAgeyBSSVNDVl9UTEJfRkxVU0hfU0NPUEVfU0lOR0xFLCAgICAgICAgInNpbmdsZSIgfSwgXAo+
ID4gKyAgICAgICAgICAgICB7IFJJU0NWX1RMQl9GTFVTSF9TQ09QRV9SQU5HRSwgICAgICAgICAi
cmFuZ2UiIH0sIFwKPiA+ICsgICAgICAgICAgICAgeyBSSVNDVl9UTEJfRkxVU0hfU0NPUEVfQURE
UkVTU19TUEFDRSwgImFkZHJlc3Mtc3BhY2UiIH0sIFwKPiA+ICsgICAgICAgICAgICAgeyBSSVND
Vl9UTEJfRkxVU0hfU0NPUEVfQUxMLCAgICAgICAgICAgImFsbCIgfSkKPiA+ICsKPiA+ICsvKgo+
ID4gKyAqIFJlY29yZCB0aGUgaW52YWxpZGF0aW9uIHJlcXVlc3QgcmVjZWl2ZWQgYnkgdGhlIFJJ
U0MtViBhcmNoaXRlY3R1cmUgY29kZQo+ID4gKyAqCj4gPiArICogVGhlIHRhcmdldCBDUFUgbWFz
ayByZXByZXNlbnRzIHRoZSBDUFVzIExpbnV4IGludGVuZHMgdG8gY292ZXIgZm9yIHRoZQo+ID4g
KyAqIHJlcXVlc3QuIEl0IGNhbiBiZSBjb3JyZWxhdGVkIHdpdGggcGVyLUNQVSBhY3Rpdml0eSwg
YnV0IGRvZXMgbm90IGRlc2NyaWJlCj4gPiArICogd2hpY2ggaGFydHMgdWx0aW1hdGVseSBwZXJm
b3JtZWQgYW4gaW52YWxpZGF0aW9uLgo+ID4gKyAqCj4gPiArICogVGhlIEFTSUQgaXMgaGFyZHdh
cmUtdmlzaWJsZSBhbmQgbWF5IGJlIHJldXNlZC4gSXQgbXVzdCBub3QgYmUgdHJlYXRlZCBhcyBh
Cj4gPiArICogcGVyc2lzdGVudCBpZGVudGlmaWVyIGZvciBhbiBtbS4KPiA+ICsgKgo+ID4gKyAq
IFRoZSBzdHJpZGUgZGVzY3JpYmVzIHRoZSBpbnZhbGlkYXRpb24gZ3JhbnVsYXJpdHkgc3VwcGxp
ZWQgdG8gdGhlIFJJU0MtVgo+ID4gKyAqIGltcGxlbWVudGF0aW9uLgo+ID4gKyAqCj4gPiArICog
VGhlIGV2ZW50IHJlY29yZHMgdGhlIGludmFsaWRhdGlvbiByZXF1ZXN0IGJlZm9yZSBpdCBpcyBk
aXNwYXRjaGVkLiBJdCBkb2VzCj4gPiArICogbm90IGRlc2NyaWJlIHRoZSBtZWNoYW5pc20gdXNl
ZCB0byBleGVjdXRlIHRoZSByZXF1ZXN0Lgo+ID4gKyAqCj4gPiArICovCj4gPiArVFJBQ0VfRVZF
TlQocmlzY3ZfdGxiX2ZsdXNoX3JlcXVlc3QsCj4gPiArICAgICAgICAgVFBfUFJPVE8odW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBzaXplLAo+ID4gKyAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgc3RyaWRlLCB1bnNpZ25lZCBsb25nIGFzaWQsIGJvb2wgaGFzX21tLAo+
ID4gKyAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjbWFzaywKPiA+ICsg
ICAgICAgICAgICAgICAgICBlbnVtIHJpc2N2X3RsYl9mbHVzaF9zY29wZSBzY29wZSksCj4gPiAr
Cj4gPiArICAgICBUUF9BUkdTKHN0YXJ0LCBzaXplLCBzdHJpZGUsIGFzaWQsIGhhc19tbSwgY21h
c2ssIHNjb3BlKSwKPiA+ICsKPiA+ICsgICAgIFRQX1NUUlVDVF9fZW50cnkoX19maWVsZCh1bnNp
Z25lZCBsb25nLCBzdGFydCkKPiA+ICsgICAgICAgICAgICAgX19maWVsZCh1bnNpZ25lZCBsb25n
LCBzaXplKQo+ID4gKyAgICAgICAgICAgICBfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIHN0cmlkZSkK
PiA+ICsgICAgICAgICAgICAgX19maWVsZCh1bnNpZ25lZCBsb25nLCBhc2lkKQo+ID4gKyAgICAg
ICAgICAgICBfX2ZpZWxkKGJvb2wsIGhhc19tbSkKPiA+ICsgICAgICAgICAgICAgX19maWVsZCh1
bnNpZ25lZCBpbnQsIHRhcmdldF9tYXNrX3dlaWdodCkKPiA+ICsgICAgICAgICAgICAgX19jcHVt
YXNrKHRhcmdldF9jcHVzKQo+ID4gKyAgICAgICAgICAgICBfX2ZpZWxkKHUzMiwgc2NvcGUpCj4g
PiArICAgICApLAo+ID4gKwo+ID4gKyAgICAgVFBfZmFzdF9hc3NpZ24oX19lbnRyeS0+c3RhcnQg
PSBzdGFydDsKPiA+ICsgICAgICAgICAgICAgX19lbnRyeS0+c2l6ZSA9IHNpemU7Cj4gPiArICAg
ICAgICAgICAgIF9fZW50cnktPnN0cmlkZSA9IHN0cmlkZTsKPiA+ICsgICAgICAgICAgICAgX19l
bnRyeS0+YXNpZCA9IGFzaWQ7Cj4gPiArICAgICAgICAgICAgIF9fZW50cnktPmhhc19tbSA9IGhh
c19tbTsKPiA+ICsgICAgICAgICAgICAgX19hc3NpZ25fY3B1bWFzayh0YXJnZXRfY3B1cywgY3B1
bWFza19iaXRzKGNtYXNrKSk7Cj4gPiArICAgICAgICAgICAgIF9fZW50cnktPnRhcmdldF9tYXNr
X3dlaWdodCA9IGNwdW1hc2tfd2VpZ2h0KChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqKQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19nZXRfY3B1
bWFzayh0YXJnZXRfY3B1cykpOwo+ID4gKyAgICAgICAgICAgICBfX2VudHJ5LT5zY29wZSA9IHNj
b3BlOwo+ID4gKyAgICAgKSwKPiA+ICsKPiA+ICsgICAgIFRQX3ByaW50aygic3RhcnQ9JSNseCBz
aXplPSUjbHggc3RyaWRlPSUjbHggYXNpZD0lI2x4IGhhc19tbT0lZCB0YXJnZXRfbWFza193ZWln
aHQ9JXUgdGFyZ2V0X2NwdXM9JXMgc2NvcGU9JXMiLAo+ID4gKyAgICAgICAgICAgICAgIF9fZW50
cnktPnN0YXJ0LCBfX2VudHJ5LT5zaXplLCBfX2VudHJ5LT5zdHJpZGUsCj4gPiArICAgICAgICAg
ICAgICAgX19lbnRyeS0+YXNpZCwgX19lbnRyeS0+aGFzX21tLAo+ID4gKyAgICAgICAgICAgICAg
IF9fZW50cnktPnRhcmdldF9tYXNrX3dlaWdodCwgX19nZXRfY3B1bWFzayh0YXJnZXRfY3B1cyks
Cj4gPiArICAgICAgICAgICAgICAgc2hvd19yaXNjdl90bGJfZmx1c2hfc2NvcGUoX19lbnRyeS0+
c2NvcGUpKQo+ID4gKyk7Cj4gPiArCgoKCi0tIApLaW5kIHJlZ2FyZHMsClJvbWFuICdIZWRpbicg
U3Rvcm96aGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
