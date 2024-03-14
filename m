Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB77EC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aVnddpguOelR7+JOgaiatFmPzwqAEUwM6Ty/U2BVVU=; b=JRVEpsoxnjWAU7
	FXZFBzd/rpByJiYDFr22BIbWath7hlI25qhRioew+9tdrB/2we1SJ6dIBbay375d3jkUNfd/EKVU8
	Cg0EI9K0/HaYTmyZqbqT0V3N5ddopy3TdmFfcPYQSoPulA1LjAqPQeHQeOZQux0ahvupLZwMpfgaX
	y+rBmV7iNpjwq63Bzq/lWzdlkeuW2z/8xISy05C8M4J2/yAE8ub/GZXv/MFMHyLm6nxV8i/SHq1Dh
	TC+q6ZiwI+y+EGsaty9rdqyu3foRpvsZGnIB2KhXdZTqMoFB6QItexq8EMzK5w/JvfQ1guhHIdJfq
	WMgluG2WwxV6aRlW9qvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmOE-0000000Ei3a-0g3E;
	Thu, 14 Mar 2024 14:49:02 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmOB-0000000Ei2s-0BQD
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:49:00 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso938801276.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710427737; x=1711032537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfL43D4as6bErODgBtnY/OPyEfChPT4gl+JbqwWRys4=;
        b=m4sHZE653ijiNs5GurJuPRzxaFjCah5RhYpokP7LE2Eb7rIRaqdTB1GCCxvT0NL6NH
         opXsqdyUo4jxHHZ9dhWfXGuCJxqxAEl5+/OxeUThybJqKLCSPL3KS6A0xHPGUQv3IcPd
         vumU8eIRGwtwlcn2ErwNFq1g7e1G4eRLErei1mUpGAdHmXDFTwoIa25rIR4feA6PfNHH
         x1Wj/uxStIt+sSIbNKuHPyzemVagsopbkh0VH5kMayLxxJaRXFavro91cw+i8MkMTHHM
         8CUXJlIBnkO6Z8xSQJPNGhSKN851qhMeXX1Eg4jTo2Yc3e4ZdlzNi/tM5e7yZnyTYM66
         6K3g==
X-Forwarded-Encrypted: i=1; AJvYcCVO068Uhn7iOHQCGCpigMGpHCryFxRFrKCOm9ZK3oUfQ9hQ8csuswMBDH6hV15TPO1+LVxr1fd7+2qs0/Ufkzu2Awyadlgc2hrUTTD3/68Q
X-Gm-Message-State: AOJu0YzORshxzF/8YPPj7Gc0OmYVLznlimAUFdRvTSMAzV9U8o37NOnV
	gwwABb3371Cc+xaRYPvmCWov1se7fR9BeVXKtvVw7DZelWhKWQgrGODLBbny24k=
X-Google-Smtp-Source: AGHT+IFr3NPEZkgU/s9cX2Onm48KNSbTXFtPzPBLS9sCQ+4bX8OTB/8/y/xCKWBDSrckHIcyWC+A0g==
X-Received: by 2002:a25:ac47:0:b0:dcc:c279:d2fa with SMTP id r7-20020a25ac47000000b00dccc279d2famr1866546ybd.30.1710427737095;
        Thu, 14 Mar 2024 07:48:57 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id t10-20020a25908a000000b00dcc0cbb0aeesm271795ybl.27.2024.03.14.07.48.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:48:56 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc71031680so899536276.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnNp22lV2KqBCgt0lAtzcauVjCmZxvvZy4b3i/2EZpXmVfgJxQa22LYgQ9cQoz1HcnIfN6Nmfv6CzWplJ1Qr3e5TrYQsMpvlgyNT7NDnp8
X-Received: by 2002:a5b:912:0:b0:dc6:d093:8622 with SMTP id
 a18-20020a5b0912000000b00dc6d0938622mr1759963ybq.15.1710427736622; Thu, 14
 Mar 2024 07:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
 <695ebdde-3dc3-41b1-b20b-f02c4ba1ae5d@sifive.com>
In-Reply-To: <695ebdde-3dc3-41b1-b20b-f02c4ba1ae5d@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 15:48:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
Message-ID: <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
Subject: Re: [PATCH] clk: starfive: jh7100: Use provided clocks instead of
 hardcoded names
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_074859_115996_BA7D4FD7 
X-CRM114-Status: GOOD (  25.38  )
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

SGkgU2FtdWVsLAoKT24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMzozMuKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiBPbiAyMDI0LTAzLTE0IDY6
MDUgQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IFRoZSBTdGFyZml2ZSBKSDcxMDAg
Y2xvY2sgZHJpdmVyIGRvZXMgbm90IHVzZSB0aGUgRFQgImNsb2NrcyIgcHJvcGVydHkKPiA+IHRv
IGZpbmQgaXRzIGV4dGVybmFsIGlucHV0IGNsb2NrcywgYnV0IGluc3RlYWQgcmVsaWVzIG9uIHRo
ZSBuYW1lcyBvZgo+ID4gdGhlIGFjdHVhbCBleHRlcm5hbCBjbG9jayBwcm92aWRlcnMuICBUaGlz
IGlzIGZyYWdpbGUsIGFuZCBjYXVzZWQKPiA+IGJyZWFrYWdlIHdoZW4gc2FuaXRpemluZyBjbG9j
ayBuYW1lcyBpbiBEVC4KPiA+Cj4gPiBGaXggdGhpcyBieSBvYnRhaW5pbmcgdGhlIGV4dGVybmFs
IGlucHV0IGNsb2NrcyB0aHJvdWdoIHRoZSBEVCAiY2xvY2tzIgo+ID4gcHJvcGVydHksIGFuZCB1
c2luZyB0aGVpciBjbGtfaHcgb2JqZWN0cyBvciBjb3JyZXNwb25kaW5nIG5hbWUuCj4gPgo+ID4g
Rml4ZXM6IGYwMzYwNjQ3MDg4NiAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiByZXBsYWNlIHVuZGVy
c2NvcmVzIGluIG5vZGUgbmFtZXMiKQo+ID4gRml4ZXM6IDQyMTBiZTY2OGEwOWVlMjAgKCJjbGs6
IHN0YXJmaXZlOiBBZGQgSkg3MTAwIGNsb2NrIGdlbmVyYXRvciBkcml2ZXIiKQo+ID4gU2lnbmVk
LW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCj4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAwLmMKPiA+ICsrKyBi
L2RyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMDAuYwoKPiA+IEBAIC0yOTgs
MTMgKzMxMSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBjbGtfc3RhcmZpdmVfamg3MTAwX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBpZiAoSVNfRVJSKHByaXYt
PmJhc2UpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwcml2LT5iYXNlKTsKPiA+
Cj4gPiArICAgICBmb3IgKGlkeCA9IDA7IGlkeCA8IEVYVF9OVU1fQ0xLUzsgaWR4KyspIHsKPiA+
ICsgICAgICAgICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIGpoNzEwMF9leHRf
Y2xrW2lkeF0pOwo+ID4gKyAgICAgICAgICAgICBpZiAoSVNfRVJSKGNsaykpCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiA+ICsKPiA+ICsgICAgICAgICAg
ICAgcHJpdi0+ZXh0W2lkeF0gPSBfX2Nsa19nZXRfaHcoY2xrKTsKPiA+ICsgICAgIH0KPiA+ICsK
PiA+ICsgICAgIG9zY19zeXMgPSBjbGtfaHdfZ2V0X25hbWUocHJpdi0+ZXh0W0VYVF9DTEtfT1ND
X1NZU10pOwo+ID4gKwo+ID4gICAgICAgcHJpdi0+cGxsWzBdID0gZGV2bV9jbGtfaHdfcmVnaXN0
ZXJfZml4ZWRfZmFjdG9yKHByaXYtPmRldiwgInBsbDBfb3V0IiwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAib3NjX3N5cyIsIDAsIDQw
LCAxKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBvc2Nfc3lzLCAwLCA0MCwgMSk7Cj4gPiAgICAgICBpZiAoSVNfRVJSKHByaXYtPnBs
bFswXSkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHByaXYtPnBsbFswXSk7Cj4g
Pgo+ID4gICAgICAgcHJpdi0+cGxsWzFdID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFj
dG9yKHByaXYtPmRldiwgInBsbDFfb3V0IiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAib3NjX3N5cyIsIDAsIDY0LCAxKTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvc2Nf
c3lzLCAwLCA2NCwgMSk7Cj4KPiBUaGVzZSBzaG91bGQgdXNlIGRldm1fY2xrX2h3X3JlZ2lzdGVy
X2ZpeGVkX2ZhY3Rvcl9wYXJlbnRfaHcoKS4gKE9yIHlvdSBjb3VsZAoKVGhhbmtzLCBJIGRpZG4n
dCBrbm93IGFib3V0IHRoYXQgZnVuY3Rpb24hCgo+IGRlZmluZSBhIGRldm1fY2xrX2h3X3JlZ2lz
dGVyX2ZpeGVkX2ZhY3Rvcl9md19uYW1lKCkgYW5kIGRyb3AgdGhlIG90aGVyIGNoYW5nZXMuKQoK
U29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGhlcmU/CgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
