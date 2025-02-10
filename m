Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADBFC0219B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZx+oK8wp2t/p1qCLKMLHgp04uJD1FtO9xkNTvWx79E=; b=yJmCamP82kbKxJ
	3k2SLMjIEtaDXcBYPYOsi+0f71/eqUVISXRnbg6oXBh8iYZA+pLWF69IRKu+F9TnDCqSyAmPo3Oks
	lckDbdo6Z35Foln+SJ20MgWNb9xNKJVKhczAeO4XJxcJFVCs9vRm+iHBbhfXmlkbRzj8L/AVsxQbQ
	aXJkid8unIf5arb/Zmi3Wtu46vyI6FEIcw/QnD1Lfp4F7wfewnLVpMu8KXMO4KRtVCI+RuApt2aU7
	tXjMX1iUZNt69r2WRnmpTB8+VeZAjybTSK2zRCsHwzqyvFT9PtSkUViS9LX1vwgI2gDgmXGQOa5vK
	8v3EfB1G1bIMKH5zsNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXfo-00000000kB4-3sgK;
	Mon, 10 Feb 2025 17:34:20 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXSi-00000000hJY-3WJS
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 17:20:50 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6f4bc408e49so36581707b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 09:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739208048; x=1739812848; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbtMLH5OLMKwvn1q9NuTvtcLAqw/hlAV54xRMPXY6fA=;
        b=n2He87i4M1dYvodWYdUYkml3f5f2sz+EieU+P4jvcbqm4xx3YhoeMHhr5fY3cyFJnr
         uD90P8//UHkJZ05kpQHtHsEgFhBouXCC0+YRYHxn3TKH6zbRzK4i8iB04CQbwiLKTUm8
         512wW0G4AZXROuFFMUpIS32mgyRjHDkDR0MR5eNX/0R5q4JnjrozRFE0Cy2HZpI05Yln
         EbnuIE3qHQobK3bKE21thnRCHVEH6Qhq218oM45OB9dP24vIlYrqASSusatc0kz9qtpP
         Y3BET29M54cEY/k65d2fofdkZEohr9ZVUEbLK7TzQCFu9h0PsrxKovn1997+sGmNwKTc
         qO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208048; x=1739812848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbtMLH5OLMKwvn1q9NuTvtcLAqw/hlAV54xRMPXY6fA=;
        b=AMVQ7I7gDrvMPLUPO9P5UjyrqTXObG2Nk7cbKx9O95VCjyzb3YUv6xvi8PREw46YcU
         81ZbqXobz8djtiM4EqYAJIVK1SrC7ncbISlb0+UFmGAMVBEAYwvCNYmr9LkMdDqSd/si
         PAbQ6qU0/spOmGYWyG5xDLZoZSLlsVdfWenuPxDGIs3euAm44yp7y+VQOuONhAsjg1c+
         Q+9SClOwX+NBdOG2vlwl165Ph+C3LzsQ57vsbu+AnFwxdH4wsZ9NXr9dObPNNp69NuxE
         KdELAVMF65wW2QtpvFW/I3dGiGUAfFzvfr2hNC3TO8F91CyRAQqAmEuYPJmeO0NFevgR
         xFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI6ZovsqJnhX2FtGKufQFmp6FOMZiSfKYNZmWzq6x15hSli3ngklzAMrpuRaiATSC9y5ctowPiH//pkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTSVwoOrW9JX7Cl+la2jvME1QVromWkAge2bfd5ADLJckw9kJY
	yGf65UtRcTL8T4r7kj80VhHa513t5VGs5+jVhXhamUWaGQ9o5wH9ceBk+WGnzlk=
X-Gm-Gg: ASbGnctr7b3Arbv7lroaooUG0KFlALHP97WIHAFgH/dU+AU5ERR7RnWvQmHocdlp/j+
	JV+ypLWOmVSMMaDzSgxmW4noSP4+2H/YfQGbfbeWBrv0wlJ8eY+mO9Rf46KLUfn0jRcQKQlvavc
	2uZEeHNjF/XLgf8G3RF7xqoShzqyJjr9q1GWjPyzmFv5Rgse7CDXNO2htKVWvfCbVWLruKcg6oi
	7blSOLuh4/D0mEVqg+KJLwaP8DIOp9s4h2e1YsiIwjGT+ycJt0G3sNYscyclOru/dNgPx/tJ4os
	+aA=
X-Google-Smtp-Source: AGHT+IEDYD05GxVjmwIcftFZauU3DCUX+vNDL2TNZSmEhsr/OEQNK0fGsG0OHwHGPsxGkLD7MqJBiw==
X-Received: by 2002:a05:690c:61c8:b0:6f9:447d:d1a2 with SMTP id 00721157ae682-6f9b29e62dfmr146923517b3.29.1739208047611;
        Mon, 10 Feb 2025 09:20:47 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce1fdfsm17551877b3.11.2025.02.10.09.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:20:47 -0800 (PST)
Date: Mon, 10 Feb 2025 09:20:45 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6o1bQLJ8aUyjvrQ@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_092048_878335_D5A10F98 
X-CRM114-Status: GOOD (  42.09  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDM6MjA6MzRQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDEwLzAyLzIwMjUgMTU6MDYsIEFuZHJldyBKb25lcyB3cm90ZToK
PiA+IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDEyOjA3OjQwUE0gKzAxMDAsIENsw6ltZW50IEzD
qWdlciB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gMTAvMDIvMjAyNSAxMToxNiwgQW51cCBQYXRl
bCB3cm90ZToKPiA+Pj4gT24gU2F0LCBGZWIgOCwgMjAyNSBhdCA2OjUz4oCvQU0gQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gRnJp
LCBGZWIgMDcsIDIwMjUgYXQgMDU6MTk6NDdQTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+
ID4+Pj4+IFByb2JpbmcgdW5hbGlnbmVkIGFjY2Vzc2VzIG9uIGJvb3QgaXMgdGltZSBjb25zdW1p
bmcuIFByb3ZpZGUgYQo+ID4+Pj4+IGZ1bmN0aW9uIHdoaWNoIHdpbGwgYmUgdXNlZCB0byBsb29r
IHVwIHRoZSBhY2Nlc3MgdHlwZSBpbiBhIHRhYmxlCj4gPj4+Pj4gYnkgaWQgcmVnaXN0ZXJzLiBW
ZW5kb3JzIHdoaWNoIHByb3ZpZGUgdGFibGUgZW50cmllcyBjYW4gdGhlbiBza2lwCj4gPj4+Pj4g
dGhlIHByb2JpbmcuCj4gPj4+Pgo+ID4+Pj4gVGhlIGFjY2VzcyBjaGVja2VyIGluIG15IGV4cGVy
aWVuY2UgaXMgb25seSB0aW1lIGNvbnN1bWluZyBvbiBzbG93Cj4gPj4+PiBoYXJkd2FyZS4gSGFy
ZHdhcmUgdGhhdCBzdXBwb3J0cyBmYXN0IHVuYWxpZ25lZCBhY2Nlc3NlcyBpc24ndCByZWFsbHkK
PiA+Pj4+IGltcGFjdGVkIGJ5IHRoaXM/IEF2b2lkaW5nIGEgbGlzdCBvZiBoYXJkd2FyZSB0aGF0
IGhhcyBzbG93L2Zhc3QKPiA+Pj4+IHVuYWxpZ25lZCBhY2Nlc3NlcyBpbiB0aGUga2VybmVsIHdh
cyB0aGUgbWFpbiByZWFzb24gZm9yIGR5bmFtaWNhbGx5Cj4gPj4+PiBjaGVja2luZy4gV2UgZGlk
IGludHJvZHVjZSB0aGUgY29uZmlnIG9wdGlvbiB0byBjb21waWxlIHRoZSBrZXJuZWwgd2l0aAo+
ID4+Pj4gYXNzdW1lZCBzbG93L2Zhc3QgYWNjZXNzZXMsIHdoaWNoIG9mIGNvdXJzZSBoYXMgdGhl
IGRvd25zaWRlIG9mCj4gPj4+PiByZWNvbXBpbGluZyB0aGUga2VybmVsIGFuZCBJIGFzc3VtZSB0
aGF0IHlvdSBhbHJlYWR5IGNvbnNpZGVyZWQgdGhhdC4KPiA+Pj4KPiA+Pj4gVGhlIGtjb25maWcg
b3B0aW9uIGRvZXMgbm90IGFsaWduIHdpdGggdGhlIHZpc2lvbiBvZiBydW5uaW5nIHRoZSBzYW1l
Cj4gPj4+IGtlcm5lbCBpbWFnZSBhY3Jvc3MgcGxhdGZvcm1zLgo+ID4+Cj4gPj4gSSdkIHdvdWxk
IGJlIGFkdm9jYXRpbmcgdG8gcmVtb3ZlIGNvbXBpbGUgdGltZSBvcHRpb25zIGFzIHdlbGwgYW5k
IHVzZQo+ID4+IGFub3RoZXIgd2F5IHRvIHNraXAgdGhlIHByb2JlIChzZWUgYmVsb3cpLgo+ID4+
Cj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gSW5zdGVhZCBvZiBoYXZpbmcgYSB0YWJsZSBpbiB0aGUga2Vy
bmVsLCBzb21ldGhpbmcgdGhhdCB3b3VsZCBiZSBtb3JlCj4gPj4+PiBwbGF0Zm9ybSBhZ25vc3Rp
YyB3b3VsZCBiZSB0byBoYXZlIGFuIGV4dGVuc2lvbiB0aGF0IHNpZ25hbHMgdGhpcwo+ID4+Pj4g
aW5mb3JtYXRpb24uIFRoYXQgc2VlbXMgbGlrZSBpdCB3b3VsZCBhY2NvbXBsaXNoIHRoZSBzYW1l
IGdvYWwgYW5kCj4gPj4+PiBsZXZlcmFnZSB0aGUgZXhpc3RpbmcgaW5mcmFzdHJ1Y3R1cmUgaW4g
dGhlIGtlcm5lbCwgYWxiZWl0IHdpdGggdGhlIG5lZWQKPiA+Pj4+IHRvIG1ha2UgYSBuZXcgZXh0
ZW5zaW9uLgo+ID4+Pj4KPiA+Pj4KPiA+Pj4gSU1PLCBleHBlY3RpbmcgYW4gSVNBIGV4dGVuc2lv
biB0byBiZSBkZWZpbmVkIGZvciBhbGwgcG9zc2libGUKPiA+Pj4gbWljcm9hcmNoaXRlY3R1cmFs
IGNob2ljZXMgaXMgbm90IGdvaW5nIHRvIHNjYWxlIHNvIGl0IGlzIGJldHRlcgo+ID4+PiB0byBo
YXZlIGluZnJhc3RydWN0dXJlIGluIGtlcm5lbCBpdHNlbGYgdG8gaW5mZXIgbWljcm9hcmNoaXRl
Y3R1cmFsCj4gPj4+IGNob2ljZXMgYmFzZWQgb24gUklTQy1WIGltcGxlbWVudGF0aW9uIElELgo+
ID4+Cj4gPj4gU2luY2UgYWRkaW5nIGFuIGV4dGVuc2lvbiBzZWVtcyBxdWl0ZSB1bmxpa2VseSwg
YW5kIHRoYXQgYSBkZXZpY2UtdHJlZQo+ID4+IHByb3BlcnR5IGlzIGxpa2VseSBEVCBjZW50cmlj
IGFuZCBub3QgYXBwbGljYWJsZSB0byBBQ1BJIGFzIHdlbGwsIHdhcyBhCj4gPj4gY29tbWFuZCBs
aW5lIGFyZ3VtZW50IGNvbnNpZGVyZWQgPwo+ID4+Cj4gPiAKPiA+IEkgZGlkIGNvbnNpZGVyIGFk
ZGluZyBhIGNvbW1hbmQgbGluZSBvcHRpb24gaW4gYWRkaXRpb24gdG8gdGhlIHRhYmxlLAo+ID4g
YWxsb3dpbmcgcGxhdGZvcm1zIHdoaWNoIG5laXRoZXIgaGF2ZSBhIHRhYmxlIGVudHJ5IFt5ZXRd
IG5vciB3YW50IHRvIGRvCj4gPiB0aGUgc3BlZWQgdGVzdCwgdG8gc2V0IHdoYXRldmVyIHRoZXkg
bGlrZS4gSW4gdGhlIGVuZCwgSSBkcm9wcGVkIGl0LCBzaW5jZQo+ID4gSSBkb24ndCBoYXZlIGEg
dXNlIGNhc2UgYXQgdGhpcyB0aW1lLiBIb3dldmVyLCBpZiB3ZSByZWFsbHkgZG9uJ3Qgd2FudCBh
Cj4gPiB0YWJsZSwgdGhlbiBJIGNhbiBsb29rIGludG8gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24g
aW5zdGVhZC4KPiAKPiBTb3JyeSBpZiBJIHdhc24ndCBjbGVhciwgSSB3YXNuJ3QgY29uc2lkZXJp
bmcgdGhpcyBhcyBhIHJlcGxhY2VtZW50IGZvcgo+IHlvdXIgdGFibGUgYnV0IHJhdGhlciBhcyBh
IHJlcGxhY2VtZW50IHRvIENoYXJsaWUncyBjb21waWxlIHRpbWUgZGVmaW5lCj4gdG8gc2tpcCBt
aXNhbGlnbmVkIHNwZWVkIHByb2Jpbmcgc2luY2UgaXQgaXMgbGlrZSAibHBqPTx4PiIuIFlvdSBj
YW4KPiBzcGVjaWZ5IGl0IG9uIGNvbW1hbmQgbGluZSBpZiB5b3Ugd2FudCB0byBza2lwIHRoZSBs
b29wIHRpbWUgZGV0ZWN0aW9uCj4gb2YgbG9vcHMgcGVyIGppZmZpZXMgYW5kIGhhdmUgZmFzdGVy
IGJvb3QuCgpKZXNzZSBzZW50IG91dCBhIHBhdGNoIGZvciBhIGtlcm5lbCBwYXJhbWV0ZXIgdG8g
c2V0IHRoZSBhY2Nlc3Mgc3BlZWQgdG8Kd2hhdGV2ZXIgaXMgZGVzaXJlZCBbMV0uCgotIENoYXJs
aWUKCj4gLX0KPiAtI2Vsc2UgLyogQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1Mg
Ki8KPiAtc3RhdGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxs
X2NwdXModm9pZCkKPiAtewo+IC19Cj4gLSNlbmRpZgo+IC0KPiAgI2lmZGVmIENPTkZJR19SSVND
Vl9QUk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUwo+ICBzdGF0aWMgdm9pZCBjaGVja192ZWN0
b3JfdW5hbGlnbmVkX2FjY2VzcyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51
c2VkKQo+ICB7Cj4gQEAgLTM3MCw2ICszODAsMTEgQEAgc3RhdGljIGludCBfX2luaXQgdmVjX2No
ZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCAqdW51c2VkIF9fYWx3YXkK
PiAgfQo+ICAjZW5kaWYKPiAgCj4gK3N0YXRpYyBib29sIGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRf
YWNjZXNzX3RhYmxlKHZvaWQpCj4gK3sKPiArCXJldHVybiBmYWxzZTsKPiArfQo+ICsKPiAgc3Rh
dGljIGludCByaXNjdl9vbmxpbmVfY3B1X3ZlYyh1bnNpZ25lZCBpbnQgY3B1KQo+ICB7Cj4gIAlp
ZiAoIWhhc192ZWN0b3IoKSkgewo+IEBAIC0zNzcsNiArMzkyLDkgQEAgc3RhdGljIGludCByaXNj
dl9vbmxpbmVfY3B1X3ZlYyh1bnNpZ25lZCBpbnQgY3B1KQo+ICAJCXJldHVybiAwOwo+ICAJfQo+
ICAKPiArCWlmIChjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc190YWJsZSgpKQo+ICsJCXJl
dHVybiAwOwo+ICsKPiAgI2lmZGVmIENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1JfVU5BTElHTkVE
X0FDQ0VTUwo+ICAJaWYgKHBlcl9jcHUodmVjdG9yX21pc2FsaWduZWRfYWNjZXNzLCBjcHUpICE9
IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9WRUNUT1JfVU5LTk9XTikKPiAgCQlyZXR1cm4gMDsK
PiBAQCAtMzkyLDEzICs0MTAsMTUgQEAgc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19hbGxfY3B1cyh2b2lkKQo+ICB7Cj4gIAlpbnQgY3B1Owo+ICAKPiAtCWlmICghY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpKQo+ICsJaWYgKCFjaGVja191
bmFsaWduZWRfYWNjZXNzX3RhYmxlKCkgJiYKPiArCSAgICAhY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19lbXVsYXRlZF9hbGxfY3B1cygpKQo+ICAJCWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRf
YWxsX2NwdXMoKTsKPiAgCj4gIAlpZiAoIWhhc192ZWN0b3IoKSkgewo+ICAJCWZvcl9lYWNoX29u
bGluZV9jcHUoY3B1KQo+ICAJCQlwZXJfY3B1KHZlY3Rvcl9taXNhbGlnbmVkX2FjY2VzcywgY3B1
KSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9WRUNUT1JfVU5TVVBQT1JURUQ7Cj4gLQl9IGVs
c2UgaWYgKCFjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygp
ICYmCj4gKwl9IGVsc2UgaWYgKCFjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc190YWJsZSgp
ICYmCj4gKwkJICAgIWNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9j
cHVzKCkgJiYKPiAgCQkgICBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1JfVU5B
TElHTkVEX0FDQ0VTUykpIHsKPiAgCQlrdGhyZWFkX3J1bih2ZWNfY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZF9hbGxfY3B1cywKPiAgCQkJICAgIE5VTEwsICJ2ZWNfY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19zcGVlZF9hbGxfY3B1cyIpOwoKPiAKPiBSZWdhcmRpbmcgeW91ciB0YWJsZSwgaXQg
ZmVlbHMgbGlrZSBhIGJpdCBnb2luZyBiYWNrIHRvIG9sZCBoYXJkY29kZWQKPiBwbGF0Zm9ybSBk
ZXNjcmlwdGlvbiA7KS4gSSB0aGluayBzb21lIGtpbmQgb2YgYXV0by1kZXRlY3Rpb24gb2Ygc3Bl
ZWQKPiAobm90IGJ1aWx0aW4gdGhlIGtlcm5lbCkgZm9yIHBsYXRmb3JtcyBjb3VsZCBiZSBnb29k
IGFzIHdlbGwgdG8gc2tpcAo+IHByb2JpbmcuCj4gCj4gQSBEVCBwcm9wZXJ0eSBhbHNvIHNlZW1z
IG9rIHRvIG1lIHNpbmNlIHRoZSBnb2FsIGlzIHRvIGRlc2NyaWJlCj4gaGFyZHdhcmUuIFdvdWxk
IGEgY29tbW9uIERUL0FDUEkgcHJvcGVydHkgYmUgYXBwcm9wcmlhdGUgPyBUaGUKPiBkZXZpY2Vf
cHJvcGVydHkgQVBJIHVuaWZpZWQgYm90aCBzbyBpZiB3ZSB1c2VkIHNvbWUgY29tbW9uIHByb3Bl
cnR5IHRvCj4gZGVzY3JpYmUgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHNwZWVkIChib3RoIGluIERU
IGNwdSBub2RlLyBBQ1BJIENQVQo+IGRldmljZSBwYWNrYWdlKSwgd2UgY291bGQga2VlcCBhIHNp
bmdsZSBwYXJzaW5nIG1ldGhvZC4gQnV0IEknbSBubyBBQ1BJCj4gZXhwZXJ0IHNvIEkgZG9uJ3Qg
a25vdyBpZiB0aGF0IHJlYWxseSBtYWtlIHNlbnNlLgo+IAo+IFRoYW5rcywKPiAKPiBDbMOpbWVu
dAo+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBkcmV3Cj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
