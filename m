Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF56FCA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djKd6ghDWLIepHndp71AVI4zmRFRJEXaJCz6ZBu4ORk=; b=rYx0xzDHoGOfTI
	F0y4TlCVy3JQKa8n4IOTKfiI+xp2VeP9dbsa5imKo7DZQpBxpRI05uKpEtv4Zy4hBFcFrCA1wIUqx
	I3Tn2g9yhNFtAD3jOKVbex0DZ0Y7RUQd+/nk1OvKvNjtMo9f3hurrdzGfc8GNC6KKWzNQFR+i34ln
	evhCAZ2pMsTKrMyCX4kLnGQcaMAVWUCEWiQvoGjy2ZVI6Pyoh46rjTYJcdgYT6BEYuq0u+cNTATTc
	jz00WPjCvRX8SF0xkT/HcBspJCnJp2LV9ficwG3ZQHRw4aaAtciT9qY23NoiauBcGJu+RXmpXsatC
	FU0CITpyuh2QuhQsctzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAJG-0000000Dbf9-07ho;
	Wed, 13 Aug 2025 12:10:26 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Op-0000000DUOf-3HSl
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 11:12:08 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-33211f7f06eso70673131fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755083525; x=1755688325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmXBa8hN6ZqYSD6brjbzokdUq7mqfbKeLxh7E9vySvQ=;
        b=dck+micZforribU6W3W4hrVp9E9j0MkANz1KvxOI/nyO2a4Ph5jniXEhbKlwpSt7P7
         hOH8VP0VvuzYz7Sx0U28blduJEIwHlD9xehWW3s30k+re7TeeWO7zMh76fDkwDFlVvV/
         lPlP3cvbQ1fdhh3b46XZt1Pm/jifMMpci/BQDW2XJureL51ipEbs7YU0+5uJTE2/2xVc
         qosWfxygJfr8BOJv6+P1rIe12XZYUSeL6W3wXtR+IxKuECaiOa2n+N0CRMCUnbz8ngPM
         x75YoFGKMlAmPBM+plCiaWv2jx8ejNlBH0aulEub2tKBvOhgNNl0gpIRWqlRec+medL1
         bKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755083525; x=1755688325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmXBa8hN6ZqYSD6brjbzokdUq7mqfbKeLxh7E9vySvQ=;
        b=gjsegBrgANRrAzU4VLkoMzQrlM0K/YrNRH11aPtSrM9wXaNwK7sFL7moiqTp9A2Udg
         8DG6wV+ajkeCqeERWgdsavUKDgdZEdnAZSc+lXoBmEdDvXMjIJwbhrvUuhVnd45B5xFh
         6BvPc90KZRhSo8aSgNP6TXodOuyRrRIQwrsupWtTsZ32m7FFaYQK6fWMVXP0q3vC8fSL
         HjhxFATyZe5aBxILius7o2kjfWp6Mu4rqW3UTlWV5H2cCHI3iVe2LkXjFGP6iucMKIfx
         6ZVVTM4khKIFoxlkjEU0T1KaJmbAlq6AU3ZLFomahPlt3QqAQWr2jBTsoc+CUv22kOjX
         aBEA==
X-Forwarded-Encrypted: i=1; AJvYcCX1YZspP2TEsdjXyXRNLxImdeg/4cO0+ebh055Mm742FpiOP42p0osApHegh5l119TCAR7ApbC3juwFug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqsdicy2M0jWVMh2nOTxFRnMfSboQoLgo6FiQXH17WL14Ywd4K
	y/nDZ3vqmJKquLKnpRr8FgP5SuFQTcsJ7l6aqHSFXh2uZokEaoe+/1S1Cr6KI7gXvgKIquBHxTL
	FUoXjiCeknQ0ssnZHeqaAGOdHGvrPgOl48dPL81S61g==
X-Gm-Gg: ASbGncuvY1YUD/ebK4cDk6dRfo15jEdx/6+IMLkRmA7UGjEbuIRoT9nWPcaxAUjnRDk
	TQaq8nVrhjxUjPSsh9El7iCwGtfTZmBsn2iKA3DpbscjL2AMvK45tFtDJBKSKe91PbW7/TYGvah
	hnpt0XI1wBmA8yY4tlXwPXy9SBGl+hDajuK1IwxjmNvONBLV+uV6V53iPIh6HEppx1ilHfc3mxy
	pNto7SOo6J10+Zo1b4=
X-Google-Smtp-Source: AGHT+IGEd6r2waO01iAvkk51fhRlxRdDrqcSDTW7/vuRbJY8YjAVRsk+nLOcZIVIYul5gLr7NlHXTJZ+irwpMk0V3Qs=
X-Received: by 2002:a2e:a987:0:b0:32b:3cf5:7358 with SMTP id
 38308e7fff4ca-333e9b56166mr8243791fa.28.1755083525285; Wed, 13 Aug 2025
 04:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop> <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop> <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
 <aJwiXKWXik8BmpL8@sunil-laptop> <CAEEQ3wky3LXK=ge1wBkHD0ZWtwUF-aBn44EK0Uxa+_2DB1Giqw@mail.gmail.com>
In-Reply-To: <CAEEQ3wky3LXK=ge1wBkHD0ZWtwUF-aBn44EK0Uxa+_2DB1Giqw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Aug 2025 16:41:51 +0530
X-Gm-Features: Ac12FXwij-HOOV9nmq9qu8pUNs3gWFC5Oqu4FRciyKhMhr0sOhIZGTI0U05OUcI
Message-ID: <CAK9=C2VOaAJZxCeM-5QPj5B-ie68LivJyQcM8KwKjdL9u00RJg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: yunhui cui <cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_041207_829143_31D5C35A 
X-CRM114-Status: GOOD (  43.16  )
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
Cc: aou@eecs.berkeley.edu, juwenlong@bytedance.com, alex@ghiti.fr, rafael@kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, Rahul Pathak <rpathak@ventanamicro.com>, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgMTI6MTTigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBTdW5pbCwKPgo+IE9uIFdlZCwgQXVnIDEzLCAy
MDI1IGF0IDE6MjjigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gSGkgWXVuaHVpLAo+ID4KPiA+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDEx
OjIzOjM5QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+IEhpIFN1bmlsLAo+ID4gPgo+
ID4gPiBPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCAxMDowNuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gWy4uLl0KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IFRoZSBwdXJwb3NlIG9mIGNwcGNfZmZoX2Nzcl9yZWFkKCkgaXMgdG8g
Y2FsY3VsYXRlIHRoZSBhY3R1YWwKPiA+ID4gPiA+ID4gPiBmcmVxdWVuY3kgb2YgdGhlIENQVSwg
d2hpY2ggaXMgZGVsdGFfQ1NSX0NZQ0xFL2RlbHRhX0NTUl9YWFguCj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiBDU1JfWFhYIHNob3VsZCBiZSBhIHJlZmVyZW5jZSBjbG9jayBhbmQgZG9lcyBu
b3QgY291bnQgZHVyaW5nIFdGSQo+ID4gPiA+ID4gPiA+IChXYWl0IEZvciBJbnRlcnJ1cHQpLgo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU2ltaWxhciBzb2x1dGlvbnMgaW5jbHVkZTogeDg2
J3MgYXBlcmYvbXBlcmYsIGFuZCBBUk02NCdzIEFNVSB3aXRoCj4gPiA+ID4gPiA+ID4gcmVnaXN0
ZXJzIFNZU19BTUVWQ05UUjBfQ09SRV9FTDAvU1lTX0FNRVZDTlRSMF9DT05TVF9FTDAuCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBIb3dldmVyLCB3ZSBrbm93IHRoYXQgQ1NSX1RJTUUgaW4g
dGhlIGN1cnJlbnQgY29kZSBkb2VzIGNvdW50IGR1cmluZwo+ID4gPiA+ID4gPiA+IFdGSS4gU28s
IGlzIHRoaXMgZGVzaWduIHVucmVhc29uYWJsZT8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IFNob3VsZCB3ZSBjb25zaWRlciBwcm9wb3NpbmcgYW4gZXh0ZW5zaW9uIHRvIHN1cHBvcnQgc3Vj
aCBhIGRlZGljYXRlZAo+ID4gPiA+ID4gPiA+IGNvdW50ZXIgKGEgcmVmZXJlbmNlIGNsb2NrIHRo
YXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSk/IFRoaXMgd2F5LAo+ID4gPiA+ID4gPiA+IHRo
ZSB2YWx1ZSBjYW4gYmUgb2J0YWluZWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdpdGhvdXQgdHJhcHBp
bmcgdG8KPiA+ID4gPiA+ID4gPiBNLW1vZGUsIGVzcGVjaWFsbHkgc2luY2UgcmVhZGluZyB0aGlz
IGNvdW50ZXIgaXMgdmVyeSBmcmVxdWVudC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIaSBZ
dW5odWksCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgYnV0IHdlIGFudGljaXBhdGVkIHRo
YXQgdmVuZG9ycyBtaWdodCBkZWZpbmUgdGhlaXIgb3duIGN1c3RvbSBDU1JzLgo+ID4gPiA+ID4g
PiBTbywgd2UgaW50cm9kdWNlZCBGRkggZW5jb2RpbmcgdG8gYWNjb21tb2RhdGUgc3VjaCBjYXNl
cy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+ID4gPiBTdW5pbAo+ID4g
PiA+ID4KPiA+ID4gPiA+IEFzIG1lbnRpb25lZCBlYXJsaWVyLCBpdCBpcyBiZXN0IHRvIGRpcmVj
dGx5IHJlYWQgQ1NSX1hYWCAoYSByZWZlcmVuY2UKPiA+ID4gPiA+IGNsb2NrIHRoYXQgZG9lcyBu
b3QgY291bnQgZHVyaW5nIFdGSSkgYW5kIENTUl9DWUNMRSBpbiBTLW1vZGUsIHJhdGhlcgo+ID4g
PiA+ID4gdGhhbiB0cmFwcGluZyB0byBTQkkuCj4gPiA+ID4gPgo+ID4gPiA+IE5vLiBJIG1lYW50
IGRpcmVjdCBDU1IgYWNjZXNzIGl0c2VsZiBub3QgU0JJLiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQK
PiA+ID4gPiBUYWJsZSA2IG9mIFJJU0MtViBGRkggc3BlYy4KPiA+ID4gPgo+ID4gPiA+ID4gZHJp
dmVycy9hY3BpL3Jpc2N2L2NwcGMuYyBpcyBhIGdlbmVyaWMgZHJpdmVyIHRoYXQgaXMgbm90IHNw
ZWNpZmljIHRvCj4gPiA+ID4gPiBhbnkgdmVuZG9yLiBDdXJyZW50bHksIHRoZSB1cHN0cmVhbSBj
b2RlIGFscmVhZHkgdXNlcyBDU1JfVElNRSwgYW5kCj4gPiA+ID4gPiB0aGUgbG9naWMgb2YgQ1NS
X1RJTUUgaXMgaW5jb3JyZWN0Lgo+ID4gPiA+ID4KPiA+IEFDUEkgc3BlYyBmb3IgIlJlZmVyZW5j
ZSBQZXJmb3JtYW5jZSBSZWdpc3RlciIgc2F5cywKPiA+Cj4gPiAiVGhlIFJlZmVyZW5jZSBQZXJm
b3JtYW5jZSBDb3VudGVyIFJlZ2lzdGVyIGNvdW50cyBhdCBhIGZpeGVkIHJhdGUgYW55Cj4gPiB0
aW1lIHRoZSBwcm9jZXNzb3IgaXMgYWN0aXZlLiBJdCBpcyBub3QgYWZmZWN0ZWQgYnkgY2hhbmdl
cyB0byBEZXNpcmVkCj4gPiBQZXJmb3JtYW5jZSwgcHJvY2Vzc29yIHRocm90dGxpbmcsIGV0Yy4i
Cj4gPgo+ID4gPiA+IENTUl9USU1FIGlzIGp1c3QgYW4gZXhhbXBsZS4gSXQgaXMgdXB0byB0aGUg
dmVuZG9yIGhvdyBfQ1BDIG9iamVjdHMgYXJlCj4gPiA+ID4gZW5jb2RlZCB1c2luZyBGRkguIFRo
ZSBsaW51eCBjb2RlIGRvZXNuJ3QgbWVhbiBvbmUgc2hvdWxkIHVzZSBDU1JfVElNRQo+ID4gPiA+
IGFsd2F5cy4KPiA+ID4KPiA+ID4gRmlyc3QsIHRoZSBleGFtcGxlIG9mIENTUl9USU1FIGlzIGlu
Y29ycmVjdC4gV2hhdCBpcyBuZWVkZWQgaXMgYQo+ID4gPiBDU1JfWFhYIChhIHJlZmVyZW5jZSBj
bG9jayB0aGF0IGRvZXMgbm90IGNvdW50IGR1cmluZyBXRkkpLgo+ID4gPgo+ID4gPiBTZWNvbmQs
IHlvdSBtZW50aW9uZWQgdGhhdCBlYWNoIHZlbmRvciBjYW4gY3VzdG9taXplIHRoZWlyIG93bgo+
ID4gPiBpbXBsZW1lbnRhdGlvbnMuIEJ1dCBzaG91bGQgYWxsIHZlbmRvcnMnIENTUl9YWFgvWVlZ
Ly4uLiBiZSBhZGRlZCB0bwo+ID4gPiBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jPyBTaG91bGRu
4oCZdCBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGZhbGwKPiA+ID4gdW5kZXIgdGhlIHNjb3Bl
IGRlZmluZWQgYnkgdGhlIFJJU0MtViBhcmNoaXRlY3R1cmU/Cj4gPiA+Cj4gPiBOby4gT25lIGNh
biBpbXBsZW1lbnQgc2ltaWxhciB0byBjc3JfcmVhZF9udW0oKSBpbiBvcGVuc2JpLiBXZSBkaWRu
J3QKPiA+IGFkZCBpdCBzaW5jZSB0aGVyZSB3YXMgbm8gSFcgaW1wbGVtZW50aW5nIHN1Y2ggdGhp
bmcuIFdoYXQgSSBhbQo+ID4gc2F5aW5nIGlzIHdlIGhhdmUgRkZIIGVuY29kaW5nIHRvIHN1cHBv
cnQgc3VjaCBjYXNlLgo+ID4KPiA+ID4gPgo+ID4gPiA+ID4gSXQgd291bGQgYmUgYmVzdCB0byBw
cm9tb3RlIGEgc3BlY2lmaWNhdGlvbiB0byBzdXBwb3J0IENTUl9YWFgsIGp1c3QKPiA+ID4gPiA+
IGxpa2Ugd2hhdCBoYXMgYmVlbiBkb25lIGZvciB4ODYgYW5kIGFybTY0LiBXaGF0IGRvIHlvdSB0
aGluaz8KPiA+ID4gPiA+Cj4gPiA+ID4gV291bGRuJ3QgYWJvdmUgd29yaz8gRm9yIGEgc3RhbmRh
cmQgZXh0ZW5zaW9uLCB5b3UgbWF5IGhhdmUgdG8gcHJvdmlkZQo+ID4gPiA+IG1vcmUgZGF0YSB3
aXRoIGFjdHVhbCBIVy4KPiA+ID4KPiA+ID4gVGhpcyB3b27igJl0IHdvcmsuIE1heSBJIGFzayBo
b3cgdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSBjYW4gY2FsY3VsYXRlCj4gPiA+IHRoZSBhY3R1
YWwgQ1BVIGZyZXF1ZW5jeSB1c2luZyBDU1JfVElNRSB3aXRob3V0IHRyYXBwaW5nIHRvIFNCST8K
PiA+ID4gVGhpcyBpcyBhIHRoZW9yZXRpY2FsIGxvZ2ljYWwgaXNzdWUuIFdoeSBpcyBkYXRhIG5l
ZWRlZCBoZXJlPwo+ID4gPgo+ID4gQXMgSSBtZW50aW9uZWQgYWJvdmUsIG9uZSBjYW4gaW1wbGVt
ZW50IGEgZ2VuZXJpYyBDU1IgcmVhZCB3aXRob3V0Cj4gPiB0cmFwcGluZyB0byBTQkkuCj4gPgo+
ID4gPiBDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhlICJBTVUgZXZlbnRzIGFuZCBldmVudCBu
dW1iZXJzIiBjaGFwdGVyIGluCj4gPiA+IHRoZSBBUk02NCBtYW51YWw/Cj4gPiA+Cj4gPiBBcy1w
ZXIgQUNQSSBzcGVjIHJlZmVyZW5jZSBwZXJmb3JtYW5jZSBjb3VudGVyIGlzIG5vdCBhZmZlY3Rl
ZCBieSBDUFUKPiA+IHN0YXRlLiBUaGUgUklTQy1WIEZGSCBlbmNvZGluZyBpcyBzdWZmaWNpZW50
bHkgZ2VuZXJpYyB0byBzdXBwb3J0IHRoaXMKPiA+IHJlcXVpcmVtZW50LCBldmVuIGlmIHRoZSBz
dGFuZGFyZCBDU1JfVElNRSBjYW5ub3QgYmUgdXNlZC4gSW4gc3VjaAo+ID4gY2FzZXMsIGFuIGFs
dGVybmF0aXZlIENTUiBjYW4gYmUgZW5jb2RlZGVkLCBhY2Nlc3NlZCB2aWEgYW4gT1MtbGV2ZWwK
PiA+IGFic3RyYWN0aW9uIHN1Y2ggYXMgY3NyX3JlYWRfbnVtKCkuCj4KPiBTbyB3aGF0IHlvdSdy
ZSBzYXlpbmcgaXMgdGhhdCB3ZSBzaG91bGQgc3VibWl0IGEgcGF0Y2ggbGlrZSB0aGlzLCByaWdo
dD8KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGIvZHJpdmVycy9h
Y3BpL3Jpc2N2L2NwcGMuYwo+IGluZGV4IDQ0MGNmOWZiOTFhYWIuLjk1M2MyNTlkNDZjNjkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+ICsrKyBiL2RyaXZlcnMvYWNw
aS9yaXNjdi9jcHBjLmMKPiBAQCAtNjYsMTYgKzY2LDggQEAgc3RhdGljIHZvaWQgY3BwY19mZmhf
Y3NyX3JlYWQodm9pZCAqcmVhZF9kYXRhKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX2NwcGNf
ZGF0YSAqZGF0YSA9IChzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSAqKXJlYWRfZGF0YTsKPgo+IC0gICAg
ICAgc3dpdGNoIChkYXRhLT5yZWcpIHsKPiAtICAgICAgIC8qIFN1cHBvcnQgb25seSBUSU1FIENT
UiBmb3Igbm93ICovCj4gLSAgICAgICBjYXNlIENTUl9USU1FOgo+IC0gICAgICAgICAgICAgICBk
YXRhLT5yZXQudmFsdWUgPSBjc3JfcmVhZChDU1JfVElNRSk7Cj4gLSAgICAgICAgICAgICAgIGRh
dGEtPnJldC5lcnJvciA9IDA7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgZGVm
YXVsdDoKPiAtICAgICAgICAgICAgICAgZGF0YS0+cmV0LmVycm9yID0gLUVJTlZBTDsKPiAtICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBkYXRhLT5yZXQudmFsdWUg
PSBjc3JfcmVhZF9udW0oZGF0YS0+cmVnKTsKPiArICAgICAgIGRhdGEtPnJldC5lcnJvciA9IDA7
Cj4gIH0KPgo+IElmIHRoYXQncyB0aGUgY2FzZSwgdGhlIHJvYnVzdG5lc3Mgb2YgdGhlIGNvZGUg
Y2Fubm90IGJlIGd1YXJhbnRlZWQsCj4gYmVjYXVzZSB0aGUgcmFuZ2Ugb2YgQ1NScyBmcm9tIGRp
ZmZlcmVudCB2ZW5kb3JzIGlzIHVua25vd24uCgpBQ1BJIEZGSCBpcyBhbGxvd3MgbWFwcGluZyB0
byBhbnkgQ1NSLgoKPgo+IFNpbmNlIGVhY2ggdmVuZG9yIHdpbGwgZGVmaW5lIHRoZWlyIG93biBD
U1JzLCB3aHkgbm90IGZvcm1hbGl6ZSB0aGVtCj4gaW50byBhIHNwZWNpZmljYXRpb24/CgpUaGUg
X0NQQyBvYmplY3RzIGluIHRoZSBBQ1BJIHRhYmxlIHBvaW50IHRvIHBsYXRmb3JtIHNwZWNpZmlj
IG1lY2hhbmlzbXMKb2YgYWNjZXNzaW5nIENQUEMgQ1NSIHNvIGl0IGNhbiBwb2ludCB0byBhIHZl
bmRvciBzcGVjaWZpYyBDU1IuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
