Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D36CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zs90x1lV7lu9quirgNPOS3Ss/WRbTP7X/0vmAZi2ags=; b=DInDzkbnKB0Hnx
	9M0zzUg3pXpUQPV6+Vn/oho3DiK6Q9QtMVacj9NY8TBplyABpzCuxAzgpFyI22KTnm586R2xl+KaP
	kiwtV4ODhD2Gbxci/5Dq67btFnE0csAAGNSBIVQS+BkpXnXv8NGw+R2BubMXl42u1gDyTTfUEpRmk
	YmcPfmIlbINcrQVhCabQVuSrfzqPoOq3BuQD6N5BRXzUXdqaLI6JNrzhmRFA+7EXxidvtZB7bfMtl
	SXVa9SZc3NXqNtGWyqW4bm4o/9VlHQ7IdxmkyR6GcLxxWpB+iA14Vs0xZcD8RWJFBx3BsxRVUrkal
	p1xNV73Jx66yTbyp/HTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHR-0000000AlLM-3y4U;
	Tue, 12 Aug 2025 12:39:05 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkcc-0000000AHUB-0roK
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 08:44:43 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-741ae696663so2052589a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754988281; x=1755593081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vom1TvKMaPn0GuGpzbSTOU583xJ+0tchWNL2oAT4vrc=;
        b=McMKXPqBCphrvhNxvi0kODSzoS6f0o2fP9vaSLm9qxCa07MVaaw2pVLdtoY1ncK4/E
         3cZdhQSWgsTBpGOgue5cAVny3pA+hNh5wU+UvRwy+wxAMIrvlphtBHV/zXwvxlCJJ8yQ
         5vq8dVxAjf6I2HiZsHlHk6JGc9ligXvygWgxLitw6wm4Eb62Gx5AyXrAGAlcEnMU/ZcA
         EWAAOZkyM7zIo013rvGdjIvXAqH4EHyg9Vbqov4jWxqh+dRBUbJgv//MRok8qUhhVgCi
         VXNG+GcCIYEjTN+k7p4+T5l2oIPfheW3utN3sG6ifcQIaaypcngQI7HSfmZK8ajh3UhL
         42eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988281; x=1755593081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vom1TvKMaPn0GuGpzbSTOU583xJ+0tchWNL2oAT4vrc=;
        b=MqdQ3l+GwVMm+rAAtbEtf7/Ys3VxqN9vl+D1T9lYcWdTTVik4nWGXqmav2iVW0nVB4
         iKLB69I65IMh7/JmlDQKqGvC7h9R7nggQ/14eZIvVWmcDaeFbTnBq7s8hYwYG+uywB4s
         9ndWmlx3QiVoCYWQl8vwj72Smvc3DkzSlh4sSz5RUQucxYSKujFE7PHMSjPUBgBIhO6J
         vXPAWyus75dqiWN+Wo9QU2yoiJUvKP+peL+ZSXFVbPZEDidERSkD75cpCOUc0P6uaqOB
         xZf8YcT7BgH+UZVhGezsTdLb9RRoRZpbLWs+ygXmphpMWsA2grxY9el5XMN4blPHAZbg
         Cp/w==
X-Gm-Message-State: AOJu0YweBOFmFQzDuXFoFqgIax3zaEspFlm7V6JsPQX7v6DeWJl7sKz9
	UqF89LDUorY3/O0U4/QtvQhcBEX1N90EMIa6b/zaD9irRnVl8eat92+Mq45jWgg8SB2AlqFKSjQ
	Yhs6uoOEdJjb2OdlWTEz166mDkKrxODqMAn1JIBbsYQ==
X-Gm-Gg: ASbGncst8AXAoRvOb9inGxjcyP20FkS94rU3VGxM+dn16uDCN4T0oChtXgLubiGOvgC
	S0NvUcgWB27xfGqxEi57qNq/V2kVRi1kDjZQ3n9/1ZuB1z+sREggz1QBtqPMkQP4CoxCs35tD+F
	Z8OTeh8gn8I8as3W5KzN4gSD2mnYoMxHtrszE5T8eDcqLa2SofcV3cgpvxOyA7efr/VqvYrwwHT
	Kzn0ojx9iZ+NPYD/GCn
X-Google-Smtp-Source: AGHT+IEoCSFNrMJV8a7QpSpJAM26pWCKWJyAZQ1HjQVrjICdoi8Y2FXdB0gDsnBpZ2PTasldb9tSfQS4DDsGU7SWwvg=
X-Received: by 2002:a05:6830:90b:b0:73e:9293:556e with SMTP id
 46e09a7af769-7432c734817mr9547375a34.6.1754988280863; Tue, 12 Aug 2025
 01:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABvJ_xjsawGX33f1LLPeLR=OgT635GcqOSrMQpyzn6LQFqx00w@mail.gmail.com>
 <92e9a9a0-2654-4a0a-9e26-ee4de998aab1@ghiti.fr> <CABvJ_xh0dg1s_9c+6EJmL9-jZdmskTSvWyDSUc-ccUwWx4F=jw@mail.gmail.com>
 <3d76c6f4-04d6-402e-a07e-8241a563af04@ghiti.fr>
In-Reply-To: <3d76c6f4-04d6-402e-a07e-8241a563af04@ghiti.fr>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 12 Aug 2025 16:44:30 +0800
X-Gm-Features: Ac12FXy9w63P0hUH7cNeM-HRUsPXYxHecC7MpPQNwnwtjisUUdcJXJS-PnT9FLw
Message-ID: <CABvJ_xjacANbKcC-1viju6GoSF+1MM4iHx9UtoE2VpD3oqA2Zg@mail.gmail.com>
Subject: Re: Question About Access Fault Handling in the Kernel
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_014442_316341_B203C4F1 
X-CRM114-Status: GOOD (  45.34  )
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

T24gVGh1LCBBdWcgNywgMjAyNSBhdCA1OjEz4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+Cj4gT24gNy8yMy8yNSAwNDowOCwgVmluY2VudCBDaGVuIHdyb3Rl
Ogo+ID4gT24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgOTo1OeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8
YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPj4gSGkgVmluY2VudCwKPiA+Pgo+ID4+IEZpcnN0IHNv
cnJ5IGZvciB0aGUgdmVyeSBsYXRlIHJlcGx5Lgo+ID4+Cj4gPiBIaSBBbGV4YW5kcmUsCj4gPgo+
ID4gTm8gcHJvYmxlbSwgSSdtIGdsYWQgdG8gaGVhciB0aGF0IHNvbWVvbmUgZWxzZSBpcyBhbHNv
IGludGVyZXN0ZWQgaW4gdGhpcyBpc3N1ZS4KPiA+Cj4gPj4gT24gNi8zLzI1IDA2OjI1LCBWaW5j
ZW50IENoZW4gd3JvdGU6Cj4gPj4+IEhpIGFsbCwKPiA+Pj4gSSBoYXZlIGEgcXVlc3Rpb24gcmVn
YXJkaW5nIHRoZSBjdXJyZW50IGhhbmRsaW5nIGZsb3cgZm9yIGFjY2Vzcwo+ID4+PiBmYXVsdHMg
aW4gdGhlIGtlcm5lbC4KPiA+Pj4KPiA+Pj4gSW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24s
IHRoZSBrZXJuZWwgY29uc2lzdGVudGx5IHJlcG9ydHMgdGFsbAo+ID4+PiBhY2Nlc3MgZmF1bHRz
IHVzaW5nIGEgU0lHU0VHViB3aXRoIGVycm9yIGNvZGUgU0VHVl9BQ0NFUlIsIHdoZXJlCj4gPj4+
IFNFR1ZfQUNDRVJSIHNpZ25pZmllcyAiSW52YWxpZCBwZXJtaXNzaW9ucyBmb3IgbWFwcGVkIG9i
amVjdCIKPiA+Pj4gYWNjb3JkaW5nIHRvIHRoZSBQT1NJWCBzcGVjaWZpY2F0aW9uLgo+ID4+Pgo+
ID4+PiBIb3dldmVyLCBpbiB0aGUgUklTQy1WIHByaXZpbGVnZSBzcGVjaWZpY2F0aW9uLCBpdCBz
dGF0ZXMgdGhhdAo+ID4+PiAiSW1wbGVtZW50YXRpb25zIG1heSByYWlzZSBhY2Nlc3MtZmF1bHQg
ZXhjZXB0aW9ucyBpbnN0ZWFkIG9mCj4gPj4+IGFkZHJlc3MtbWlzYWxpZ25lZCBleGNlcHRpb25z
IGZvciBzb21lIG1pc2FsaWduZWQgYWNjZXNzZXMsIGluZGljYXRpbmcKPiA+Pj4gdGhlIGluc3Ry
dWN0aW9uIHNob3VsZCBub3QgYmUgZW11bGF0ZWQgYnkgYSB0cmFwIGhhbmRsZXIiLiBJbiBvdGhl
cgo+ID4+PiB3b3JkcywgYSBsb2FkL3N0b3JlIGFjY2VzcyBmYXVsdCBtYXkgYmUgY2F1c2VkIGJ5
IGEgbWlzYWxpZ25lZCBBTU8KPiA+Pj4gaW5zdHJ1Y3Rpb24uIEluIHN1Y2ggY2FzZXMsIGl0IHNl
ZW1zIG1vcmUgYXBwcm9wcmlhdGUgdG8gcmVwb3J0IHRoZQo+ID4+PiBlcnJvciB1c2luZyBTSUdC
VVMgd2l0aCB0aGUgZXJyb3IgY29kZSBCVVNfQURSQUxOLCB3aGljaCBpbmRpY2F0ZXMKPiA+Pj4g
IkludmFsaWQgYWRkcmVzcyBhbGlnbm1lbnQuIgo+ID4+Cj4gPj4gSSB0aGluayB5b3UncmUgcmln
aHQsIGl0IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUuIEJ1dCB0aGVuIGhvdyBkbyB3ZQo+ID4+IHJl
Y29nbml6ZSBhbiBhY2Nlc3MgZmF1bHQgZXhjZXB0aW9uIHRoYXQgaXMgY2F1c2VkIGJ5IGEgbWlz
YWxpZ25lZAo+ID4+IGFjY2Vzcz8gRG8geW91IGhhdmUgYSBzb2x1dGlvbj8gSWYgdGhhdCBkb2Vz
IG5vdCBzbG93IGRvd24gdGhlICJub3JtYWwiCj4gPj4gYWNjZXNzIGZhdWx0LCBJIGd1ZXNzIHdl
IGNhbiBnaXZlIGl0IGEgdHJ5LCB3aGF0IGRvIHlvdSB0aGluaz8KPiA+Pgo+ID4gSW5kZWVkLCBJ
IGRvIG5vdCB5ZXQgaGF2ZSBhIGNvbmNyZXRlIHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbS4gTXkK
PiA+IGN1cnJlbnQgdGhvdWdodCBpcyB0aGF0IHdlIG1heSBuZWVkIGFjY2VzcyB0byB0aGUgZnVs
bCBQTUEKPiA+IGNvbmZpZ3VyYXRpb24gYW5kIFBNUCBzZXR0aW5ncyBpbiBvcmRlciB0byBhY2N1
cmF0ZWx5IGRpYWdub3NlIHRoZQo+ID4gcm9vdCBjYXVzZSBvZiBhbiBhY2Nlc3MgZmF1bHQuCj4g
Pgo+ID4gRm9yIGV4YW1wbGUsIHdoZW4gdGhlIGtlcm5lbCBlbmNvdW50ZXJzIGFuIGFjY2VzcyBm
YXVsdCB3aXRoIHN0dmFsID0KPiA+IDB4MTAwMDAwMiwgd2UgY2Fubm90IGRpcmVjdGx5IGRldGVy
bWluZSB3aGV0aGVyIHRoZSBjYXVzZSBpcyBhCj4gPiBtaXNhbGlnbmVkIEFNTyBhY2Nlc3MsIGEg
UE1QIHZpb2xhdGlvbiwgb3Igc29tZSBvdGhlciBQTUEgdmlvbGF0aW9ucy4KPiA+IEFzIGEgcmVz
dWx0LCB0aGUga2VybmVsIG1heSBub3QgYmUgYWJsZSB0byByYWlzZSBhbiBhcHByb3ByaWF0ZSBz
aWduYWwKPiA+IHdpdGggdGhlIGNvcnJlY3QgZXJyb3IgY29kZS4KPiA+Cj4gPiAgRnJvbSBhIHNl
Y3VyaXR5IHBlcnNwZWN0aXZlLCBleHBvc2luZyBQTUEgY29uZmlndXJhdGlvbnMgb3V0c2lkZSBv
Zgo+ID4gTS1tb2RlIG1heSBub3QgYmUgYXBwcm9wcmlhdGUuIElmIHRoaXMgY29uY2VybiBpcyB2
YWxpZCwgd2UgbWF5IG5lZWQKPiA+IHRvIHJlbHkgb24gT3BlblNCSSB0byBhc3Npc3QgaW4gZGlh
Z25vc2luZyBzdWNoIGZhdWx0cy4gSG93ZXZlciwgdGhpcwo+ID4gd291bGQgaW50cm9kdWNlIGFk
ZGl0aW9uYWwgb3ZlcmhlYWQgdG8gc2xvdyBkb3duIHRoZSBwcm9jZXNzIG9mIHRoZQo+ID4gIm5v
cm1hbCIgYWNjZXNzIGZhdWx0Lgo+ID4KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCB0aGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBjb25zaXN0ZW50bHkgcmVwb3J0cyBhbgo+ID4gYWNjZXNzIGZhdWx0
IHZpYSB0aGUgU0lHU0VHViBzaWduYWwgd2l0aCB0aGUgU0VHVl9BQ0NFUlIgZXJyb3IgY29kZS4K
PiA+IEZvciBtZSwgdGhpcyBhcHByb2FjaCBjb3VsZCBiZSBtb3JlIHByZWNpc2UgZm9yIHNvbWUg
Y2FzZXMuIEZvcgo+ID4gZXhhbXBsZSwgd2hlbiB0aGUgQ1BVIGV4ZWN1dGVzIGFuIEFNTyBpbnN0
cnVjdGlvbiBvbiBhIHJlZ2lvbiBtYXJrZWQKPiA+IHdpdGggdGhlIEFNT05vbmUgUE1BIGF0dHJp
YnV0ZSwgcmVwb3J0aW5nIHRoZSBmYXVsdCB1c2luZyB0aGUgU0lHQlVTCj4gPiB3aXRoIHRoZSBC
VVNfT0JKRVJSIGVycm9yIGNvZGUgbWlnaHQgYmUgbW9yZSBhcHByb3ByaWF0ZS4gSG93ZXZlciwg
SQo+ID4gaGF2ZSBub3QgZGlzY292ZXJlZCBhbnkgZGlzY3Vzc2lvbnMgYWJvdXQgc2ltaWxhciBp
c3N1ZXMgb24gdGhlCj4gPiBtYWlsaW5nIGxpc3QsIHdoaWNoIG1ha2VzIG1lIHF1ZXN0aW9uIHdo
ZXRoZXIgaXQncyB3b3J0aCBkb2luZyB0aGlzCj4gPiBhcHByb2FjaC4KPgo+Cj4gSSBkb24ndCB0
aGluayB3ZSBuZWVkIFBNQS9QTVAgdG8gZGlzdGluZ3Vpc2ggYWxsIHBvc3NpYmxlIGFjY2VzcyBm
YXVsdAo+IGVycm9ycywgaXQgc2VlbXMgbW9yZSBsaWtlIGEgcGxhdGZvcm0gaXNzdWUgdG8gbWUu
IEkgbWVhbiBkbyBub3QgZXhwb3NlCj4gYW4gQU1PTm9uZSByZWdpb24gYXMgbm9ybWFsIFJBTSB3
aXRoIGEgbm9ybWFsIGRpc3RybywgeW91IG11c3QgdGhhdCB5b3VyCj4gcGxhdGZvcm0gd2lsbCBu
ZWVkIHNwZWNpZmljIHVzZXJzcGFjZSBhbmQga2VybmVsIHJpZ2h0Pwo+Cj4gRm9yIHlvdXIgaW5p
dGlhbCBwcm9ibGVtLCBJIHRoaW5rIHRoYXQgZm9yIHVzZXJzcGFjZSBhY2Nlc3MgZmF1bHRzLCB3
ZQo+IGNhbiB0cnkgdG8gZmluZCBhIFZNQSB0aGF0IGNvbnRhaW5zIHN0dmFsLCBpZiBpdCBleGlz
dHMsIHRoYXQncyBhCj4gbWlzYWxpZ25lZCBhY2Nlc3MgZmF1bHQsIG90aGVyd2lzZSB0aGF0J3Mg
YSAibm9ybWFsIiBhY2Nlc3MgZmF1bHQuIFdvdWxkCj4gdGhhdCB3b3JrPwo+CgpJIGFncmVlIHRo
YXQgbW9zdCBwcm9ibGVtcyByZXBvcnRlZCBhcyBhY2Nlc3MgZmF1bHRzIGNhbiBiZQpjYXRlZ29y
aXplZCBhcyBwbGF0Zm9ybSBpc3N1ZXMuIFdlIGNhbiBhc3N1bWUgdGhhdCB0aGUgZW50aXJlIExp
bnV4CmVudmlyb25tZW50IG9wZXJhdGVzIHdpdGhpbiBhIG1lbW9yeSByZWdpb24gY29uZmlndXJl
ZCB3aXRoIHRoZQpjb3JyZWN0IFBNUCBhbmQgUE1BIHNldHRpbmdzLCBhbmQgdGhhdCBMaW51eCBk
b2VzIG5vdCBjcmVhdGUgYW55ClZBLXRvLVBBIG1hcHBpbmcgd2hlcmUgdGhlIFBBIGlzIGluYWNj
ZXNzaWJsZS4KCkJhc2VkIG9uIHRoaXMgYXNzdW1wdGlvbiwgSSB0aGluayB5b3VyIGlkZWEgbWFr
ZXMgc2Vuc2UuIEhvd2V2ZXIsIEkKaGF2ZSBhbm90aGVyIHF1ZXN0aW9uIHJlZ2FyZGluZyBpdC4g
SWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgYW4KYWNjZXNzIGZhdWx0IGV4Y2VwdGlvbiBvY2N1
cnMgZHVlIHRvIGEgUE1BL1BNUCB2aW9sYXRpb24uIFRoaXMgYWxzbwppbXBsaWVzIHRoYXQgdGhl
IENQVSBoYXMgYWxyZWFkeSB2ZXJpZmllZCB0aGF0IHRoZSBWQSBhbmQgaXRzCnBlcm1pc3Npb25z
IGZvciB0aGlzIGFjY2VzcyBhcmUgdmFsaWQuIFRoZXJlZm9yZSwgSSBjdXJyZW50bHkgY2Fubm90
CnRoaW5rIG9mIGEgY2FzZSB3aGVyZSB0aGUgQ1BVIHJhaXNlcyBhbiBhY2Nlc3MgZmF1bHQgYnV0
IHdlIGNhbm5vdApmaW5kIGEgVk1BIHRoYXQgY29udGFpbnMgdGhpcyBzdHZhbC4gSW4gc3VjaCBh
IGNhc2UsIEkgd291bGQgZXhwZWN0CnRoZSBDUFUgdG8gcmFpc2UgYSBwYWdlIGZhdWx0IGV4Y2Vw
dGlvbiByYXRoZXIgdGhhbiBhbiBhY2Nlc3MgZmF1bHQuCkFtIEkgb3Zlcmxvb2tpbmcgYW55IHNj
ZW5hcmlvcz8KCj4KPiA+Cj4gPj4gRGlkIHlvdSBlbmNvdW50ZXIgdGhpcyBzaXR1YXRpb24gd2hl
cmUgeW91IHdlcmUgcmVwb3J0ZWQgYSBTSUdTRUdWIGJ1dAo+ID4+IGl0IHdhcyBhY3R1YWxseSBh
IFNJR0JVUz8KPiA+Pgo+ID4gWWVzLCBJIGVuY291bnRlcmVkIHRoaXMgaXNzdWUgd2hlbiBydW5u
aW5nIHRoZSBsb2NrYnVzIHRlc3QgaW4KPiA+IHN0cmVzcy1uZyB2ZXJzaW9uIHYwLjE4LjEyLiBU
aGlzIHRlc3RjYXNlIGludGVuZHMgdG8gdXNlIHRoZSBBTU8KPiA+IGluc3RydWN0aW9uIHRvIGFj
Y2VzcyBhbiB1bmFsaWduZWQgYWRkcmVzcyBhbmQgZXhwZWN0cyB0byBnZXQgYSBTSUdCVVMKPiA+
IHNpZ25hbCBkdWUgdG8gdGhpcyBhY2Nlc3MuCj4gPgo+ID4+IFNvcnJ5IGFnYWluIGZvciB0aGUg
ZGVsYXksCj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+PiBBbGV4Cj4gPj4KPiA+Pgo+ID4+PiBB
cyBJIHVuZGVyc3RhbmQgaXQsIG1vc3QgYWNjZXNzIGZhdWx0cyBhcmUgdHlwaWNhbGx5IGNhdXNl
ZCBieQo+ID4+PiB2aW9sYXRpb25zIG9mIGVpdGhlciBQTUEgb3IgUE1QIHNldHRpbmdzLiBJZiB0
aGVzZSBzZXR0aW5ncyBhcmUKPiA+Pj4gY29uc2lkZXJlZCBhIGZvcm0gb2YgcGVybWlzc2lvbiBm
b3IgYSBtYXBwZWQgb2JqZWN0LCB0aGVuIHRoZSBjdXJyZW50Cj4gPj4+IGltcGxlbWVudGF0aW9u
IHVzaW5nIFNJR1NFR1Ygd2l0aCBTRUdWX0FDQ0VSUiBtYWtlcyBzZW5zZSBhbmQgaGVscHMKPiA+
Pj4gc2ltcGxpZnkgdGhlIGZhdWx0LWhhbmRsaW5nIGxvZ2ljLgo+ID4+Pgo+ID4+PiBJ4oCZZCBs
aWtlIHRvIGNvbmZpcm0gd2hldGhlciB0aGlzIGludGVycHJldGF0aW9uIHJlZmxlY3RzIHRoZSBy
ZWFzb25pbmcKPiA+Pj4gYmVoaW5kIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBBbnkgY2xh
cmlmaWNhdGlvbiB3b3VsZCBiZQo+ID4+PiBhcHByZWNpYXRlZC4gVGhhbmtzIQo+ID4+Pgo+ID4+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBs
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
