Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA247C021A1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Vf6QJc5yc1clmi00mckUuTvKGhufUKnWI6pf75KLx4=; b=SCoQwNM2PDay39
	k4Rf2z4IZHbB4lhW+eQduUMrQSUGcZqCaxo5OhY7x9oyvIFqNtRmNE+aQf9/4wrUUF8i1/Hogop3Z
	V9hsBf0GmOVzo4o5iVKFuSFNv6a4BdsSo/Eb1pbXoe0O9iI1J6HQSJbA96pJ+eS4AA7oFsykkC0TI
	Ai2Awo0G3sYO+xR0UQq+pU41M5tkqn81dC+ehObjf5C+ssRJinwIwtT01/PugCQ2+YVCKEwCkAUp7
	tBm8tQYvmvITaV5Q7eia/3baeRNq3Pw826UuqoZOmhpWmK7VqkJgl1dowiz7WZHC2paJXlm5voJzN
	lOhyV5k59PTW2soV2J8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmDc-000000037Dc-37LQ;
	Tue, 11 Feb 2025 09:06:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmCC-000000036t4-1rjP
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 09:04:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso16176165e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739264683; x=1739869483; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ayvVDmrwmcN9il9K7YbVSe6dt66ENiQTnWfgs8AYN4=;
        b=IwDW5oKqaHp9m0xuwwNmxGxOW2FL5Pf1ronmCZsNlCRCVTTJWWeJzSAiG9XgLL/Eif
         XpJuyVTZkf136rg9eYhcOxAHuc2pZtad19rcwT9064mAlWJbTbJ6JxkaaqQ/EM3DkjC7
         SAss3syVXad1Qw7krL6kl+xMUE1/+eijAMAmp8aP9NkqBPYiwe2Sq/t+v8wbdOBvuXjA
         0KW/9B94GCZPdAqvweJlyozkstfus62TGOTAuI9zQrLFPaUhVJwhABgHFe/ooUyQ+10a
         2vwgUYqXEgFEml2ux0AnMcFvGZ07vxGFZ7Pp3NCNUEqSWLQ93y4MnJoDwckjjHaNruG0
         rG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264683; x=1739869483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ayvVDmrwmcN9il9K7YbVSe6dt66ENiQTnWfgs8AYN4=;
        b=QPsK9ybiCCn5fZxZ6kQvITkMHjvVg9e18d18x8MxYMuwICOTEH+NYrcDLgTWDKWoeB
         zBR5B/qrmPJ98Apc86qv7bhluN2hU3Lmuk12EmLDC3Ip0nDz3TxH+U7dmVFmTDqXXjaZ
         I5g4PisSS/O+BqcyegMGs8gSwFhzEvbc2dJwXmQ1c+RSHlwf0kUI9Vp+ILPu086ZxZ4w
         jlz02aa5CnA4kdnDJaAipXMirnRNkE47dcBaSh+zp+0cZrgi0v8o/+B9NywfAz8mtx27
         2t1w71KYeRM/17LCju9tyCdJQW1ySuMwB2go7DZI6K3yUc1ciLaJM8Ztrye6VxIl3eb8
         a/aA==
X-Forwarded-Encrypted: i=1; AJvYcCXAEUj6EAUhWXE5XastTFPfLLPwwyJqsqkiNy74F+a56ADCtCjBSB7q46YC8LotmqAWktiiWMd/+SqarA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOpzEBDVy+6Lldd5ZlFg5W7KwGbeORcxnHdivppSWzoaHYltq8
	bvExfZwuTQEmuabdO9hO+N0q2pDf/+HBDkLJD0/oicW0hLjQgKcZrE93417cMVY=
X-Gm-Gg: ASbGncv0ikQSlhRT13IrpLX79WT2Qfp8mX+gAbmlkOzUEWOgB6Gta1sYBqo9JY0tYKl
	WVAABHI06/uJCi9Cy0I+tLYfxHXa/z/xKrP8TINnSFbv242q1a2XKutjifQBSIPUz4gbW6XuwP+
	SO5uqYgA1rpmDHbmWN6UqupTFVH/2BkzKzg1eohBgqnevfvN8ro45+RlJe/fXzlD14k9yRJW3t9
	drldUJAoGmBUZXAdjgpke7EKxKoBnYyKa0JfFf1wqj80NCEqQ8ctubMDuk1guK2vXs+QxRDmF/5
	HM4=
X-Google-Smtp-Source: AGHT+IEfz4udPottet3K2ickkfVAL1NPauK4J7aoUebSrapujfts7RLgM9V3b4aTiUJhAZmdmGqebA==
X-Received: by 2002:a7b:cd17:0:b0:439:33ac:ba49 with SMTP id 5b1f17b1804b1-4394ceaf87fmr20886665e9.1.1739264682546;
        Tue, 11 Feb 2025 01:04:42 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43947bdc5c4sm42522365e9.23.2025.02.11.01.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:04:41 -0800 (PST)
Date: Tue, 11 Feb 2025 10:04:40 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <20250211-0a44854789bf8588ded25288@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <Z6o1NCo5nLPwBsUT@ghost>
 <65f48829-56d2-47fc-8f61-074ff122d964@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65f48829-56d2-47fc-8f61-074ff122d964@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_010444_491182_4C7AB881 
X-CRM114-Status: GOOD (  42.66  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDk6Mzc6MTBQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDEwLzAyLzIwMjUgMTg6MTksIENoYXJsaWUgSmVua2lucyB3cm90
ZToKPiA+IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDAzOjQ2OjQ2UE0gKzA1MzAsIEFudXAgUGF0
ZWwgd3JvdGU6Cj4gPj4gT24gU2F0LCBGZWIgOCwgMjAyNSBhdCA2OjUz4oCvQU0gQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IE9uIEZyaSwg
RmViIDA3LCAyMDI1IGF0IDA1OjE5OjQ3UE0gKzAxMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+
Pj4+IFByb2JpbmcgdW5hbGlnbmVkIGFjY2Vzc2VzIG9uIGJvb3QgaXMgdGltZSBjb25zdW1pbmcu
IFByb3ZpZGUgYQo+ID4+Pj4gZnVuY3Rpb24gd2hpY2ggd2lsbCBiZSB1c2VkIHRvIGxvb2sgdXAg
dGhlIGFjY2VzcyB0eXBlIGluIGEgdGFibGUKPiA+Pj4+IGJ5IGlkIHJlZ2lzdGVycy4gVmVuZG9y
cyB3aGljaCBwcm92aWRlIHRhYmxlIGVudHJpZXMgY2FuIHRoZW4gc2tpcAo+ID4+Pj4gdGhlIHBy
b2JpbmcuCj4gPj4+Cj4gPj4+IFRoZSBhY2Nlc3MgY2hlY2tlciBpbiBteSBleHBlcmllbmNlIGlz
IG9ubHkgdGltZSBjb25zdW1pbmcgb24gc2xvdwo+ID4+PiBoYXJkd2FyZS4gSGFyZHdhcmUgdGhh
dCBzdXBwb3J0cyBmYXN0IHVuYWxpZ25lZCBhY2Nlc3NlcyBpc24ndCByZWFsbHkKPiA+Pj4gaW1w
YWN0ZWQgYnkgdGhpcz8gQXZvaWRpbmcgYSBsaXN0IG9mIGhhcmR3YXJlIHRoYXQgaGFzIHNsb3cv
ZmFzdAo+ID4+PiB1bmFsaWduZWQgYWNjZXNzZXMgaW4gdGhlIGtlcm5lbCB3YXMgdGhlIG1haW4g
cmVhc29uIGZvciBkeW5hbWljYWxseQo+ID4+PiBjaGVja2luZy4gV2UgZGlkIGludHJvZHVjZSB0
aGUgY29uZmlnIG9wdGlvbiB0byBjb21waWxlIHRoZSBrZXJuZWwgd2l0aAo+ID4+PiBhc3N1bWVk
IHNsb3cvZmFzdCBhY2Nlc3Nlcywgd2hpY2ggb2YgY291cnNlIGhhcyB0aGUgZG93bnNpZGUgb2YK
PiA+Pj4gcmVjb21waWxpbmcgdGhlIGtlcm5lbCBhbmQgSSBhc3N1bWUgdGhhdCB5b3UgYWxyZWFk
eSBjb25zaWRlcmVkIHRoYXQuCj4gPj4KPiA+PiBUaGUga2NvbmZpZyBvcHRpb24gZG9lcyBub3Qg
YWxpZ24gd2l0aCB0aGUgdmlzaW9uIG9mIHJ1bm5pbmcgdGhlIHNhbWUKPiA+PiBrZXJuZWwgaW1h
Z2UgYWNyb3NzIHBsYXRmb3Jtcy4KPiA+IAo+ID4gSSBqdXN0IGRvbid0IHRoaW5rIHRoYXQgdmlz
aW9uIGlzIHJlYWxpc3RpYy4KPiA+IAo+ID4gSSBhbSBhIHByb3BvbmVudCBmb3IgY29tcGlsZSB0
aW1lIGRlZmluZXMgYmVjYXVzZSByaSBnaHQgbm93IHdlIGFyZQo+ID4gY2F0ZXJpbmcgdGhlIGtl
cm5lbCB0byBib3RoIG1pY3JvY29udHJvbGxlcnMgYW5kIGZvciBoaWdoIHBlcmZvcm1hbmNlCj4g
PiBwbGF0Zm9ybXMuIEkgYW0gaW4gZmF2b3Igb2YgaGF2aW5nIGEgc2V0IG9mIGNvbmZpZ3VyIGF0
aW9ucyB0aGF0IGFyZQo+ID4gaWRlYWwgZm9yIHRoZXNlIG1pY3JvY29udHJvbGxlcnMgYW5kIGEg
ZGlmZmVyZW50IHNldCBmb3IgaGlnaAo+ID4gcGVyZm9ybWFuY2UgcGxhdGZvcm1zLiBUaGlzIGlz
IHdoZXJlIHRoZSBSVkkgcHJvZmlsZSBzIHdvdWxkIGlkZWFsbHkKPiA+IGNvbWUgaW4sIGhhdmlu
ZyBkaWZmZXJlbnQgY29uZmlncyBmb3IgZGlmZmVyZW50IHByb2ZpbGVzIHRoYXQgdGFyZ2V0IGxv
dwo+ID4gcGVyZm9ybWFuY2UvaGlnaCBwZXJmb3JtYW5jZS4KPiA+IAo+ID4gQ29tcGlsZXIgb3B0
aW1pemF0aW9ucyBmb3IgZXh0ZW5zaW9ucyBhcmUgbm90IHBvc3NpYiBsZSB0byBkbyBieSBqdXN0
Cj4gPiBoYXZpbmcgdGhlc2UgZGlmZmVyZW50IG1ldGhvZHMgb2Ygc2VsZWN0aW5nIGF0IHJ1bnRp
IG1lLiBCeSBlbmFibGluZwo+ID4gZXh0cmEgZXh0ZW5zaW9ucyBsaWtlIHRoZSBiaXRtYW5pcCBl
eHRlbnNpb25zIGR1cmluZyBjb21waWxhdGlvbiB2aWEgYQo+ID4gY29uZmlnIGZsYWcgd2UgY2Fu
IG9wdGltaXplIHRoZSBlbnRpcmUga2VybmVsLiBJdCBpcyBub3QgcG9zc2libGUgdG8KPiA+IHB1
c2ggYWxsIG9wdGltaXphdGlvbnMgb2ZmIHRvIHJ1bnRpbWUgZGV0ZWN0aW9uLgo+IAo+IFdoaWxl
IHRoaXMgbWlnaHQgYmUgdHJ1ZSBmb3IgdGhlIGJpdG1hbmlwIGV4dGVuc2lvbiBhbmQgb3RoZXIg
ZXh0ZW5zaW9ucwo+IHRoYXQgdGhlIGNvbXBpbGVyIGNhbiB0YWtlIGFkdmFudGFnZSBvZiwgdGhh
dCBpc24ndCB0cnVlIGZvciB0aGUKPiBtaXNhbGlnbmVkIHNwZWVkIHByb2JpbmcgY29kZS4gVGhl
IG9ubHkgbWVhbmluZ2Z1bCBtaXNhbGlnbmVkIGFjY2Vzcwo+IGNvbmZpZ3VyYXRpb24gb3B0aW9u
IGZvciBrZXJuZWwgInNwZWVkIiBvcHRpbWl6YXRpb24gaXMKPiBSSVNDVl9FRkZJQ0lFTlRfVU5B
TElHTkVEX0FDQ0VTUyAod2hpY2ggaXMgaXJvbmljYWxseSBub3QgZWFzaWx5Cj4gc2VsZWN0YWJs
ZSBzaW5jZSBpdCBpcyB1bmRlciBOT05fUE9SVEFCTEUpLgo+IAo+IEN1cnJlbnRseSBhbGwgdGhl
IGNvbmZpZyBvcHRpb25zIHRoYXQgaGF2ZSBiZWVuIGFkZGVkIGFyb3VuZCBtaXNhbGlnbmVkCj4g
c3VwcG9ydCAianVzdCIgYWxsb3dzIHRvIGdldCByaWQgb2YgdGhlIHByb2JpbmcgY29kZSBhdCBj
b21waWxlIHRpbWUgYW5kCj4gc2V0IGEgcHJlZGVmaW5lZCBzcGVlZC4gVGhhdCBkb2VzIG5vdCBy
ZWFsbHkgaW1wcm92ZSB0aGUga2VybmVsCj4gcGVyZm9ybWFuY2UgaXRzZWxmLCBqdXN0IGFsbG93
cyBmb3IgYSBmYXN0ZXIgYm9vdC4gVGhhdCBjb3VsZCBhcyB3ZWxsIGJlCj4gc3VwcG9ydGVkIHVz
aW5nIGEgY29tbWFuZCBsaW5lIG9wdGlvbiBhcyBzdWdnZXN0ZWQuCgpJIGFncmVlLiBJJ2xsIGxv
b2sgaW50byBzdHJpcHBpbmcgY29uZmlnIG9wdGlvbnMgYW5kIHBpY2tpbmcgdXAgSmVzc2Uncwpj
b21tYW5kIGxpbmUgb3B0aW9uIGZvciB2Mi4gSSdsbCBhbHNvIGRyb3AgdGhlIHRhYmxlIGFwcHJv
YWNoIG9mIHRoaXMKc2VyaWVzIHNpbmNlIEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBlbm91Z2gganVz
dGlmaWNhdGlvbiBmb3IgaXQgb3ZlciB0aGUKY29tbWFuZCBsaW5lIGF0IHRoaXMgdGltZS4KClRo
YW5rcywKZHJldwoKPiAKPiBUaGF0IGJlaW5nIHNhaWQsIEkgYWdyZWUgdGhhdCBzb21lIGFkZGl0
aW9uYWwgY29uZmlndXJhdGlvbiBvcHRpb25zCj4gc2hvdWxkIGJlIGFkZGVkIHRvIGVuYWJsZSBh
ZGRpdGlvbmFsIGV4dGVuc2lvbiBzdXBwb3J0IGF0IGNvbXBpbGUgdGltZSwKPiBlbmFibGluZyBh
IGZhc3RlciBrZXJuZWwuIEhhdmluZyBhIHNpbmdsZSBpbWFnZSBmb3IgYWxsIGhhcmR3YXJlIGlz
IGFzCj4geW91IHNhaWQgbm90IHJlYWxpc3RpYyBidXQgcHJvZmlsZXMgY29uZmlndXJhdGlvbiBh
cyB5b3UgcHJvcG9zZWQgbWlnaHQKPiBiZSB0aGUga2V5IGZvciB0aGlzIHN1cHBvcnQuCj4gCj4g
Q2zDqW1lbnQKPiAKPiA+IAo+ID4+Cj4gPj4+Cj4gPj4+IEluc3RlYWQgb2YgaGF2aW5nIGEgdGFi
bGUgaW4gdGhlIGtlcm5lbCwgc29tZXRoaW5nIHRoYXQgd291bGQgYmUgbW9yZQo+ID4+PiBwbGF0
Zm9ybSBhZ25vc3RpYyB3b3VsZCBiZSB0byBoYXZlIGFuIGV4dGVuc2lvbiB0aGF0IHNpZ25hbHMg
dGhpcwo+ID4+PiBpbmZvcm1hdGlvbi4gVGhhdCBzZWVtcyBsaWtlIGl0IHdvdWxkIGFjY29tcGxp
c2ggdGhlIHNhbWUgZ29hbCBhbmQKPiA+Pj4gbGV2ZXJhZ2UgdGhlIGV4aXN0aW5nIGluZnJhc3Ry
dWN0dXJlIGluIHRoZSBrZXJuZWwsIGFsYmVpdCB3aXRoIHRoZSBuZWVkCj4gPj4+IHRvIG1ha2Ug
YSBuZXcgZXh0ZW5zaW9uLgo+ID4+Pgo+ID4+Cj4gPj4gSU1PLCBleHBlY3RpbmcgYW4gSVNBIGV4
dGVuc2lvbiB0byBiZSBkZWZpbmVkIGZvciBhbGwgcG9zc2libGUKPiA+PiBtaWNyb2FyY2hpdGVj
dHVyYWwgY2hvaWNlcyBpcyBub3QgZ29pbmcgdG8gc2NhbGUgc28gaXQgaXMgYmV0dGVyCj4gPj4g
dG8gaGF2ZSBpbmZyYXN0cnVjdHVyZSBpbiBrZXJuZWwgaXRzZWxmIHRvIGluZmVyIG1pY3JvYXJj
aGl0ZWN0dXJhbAo+ID4+IGNob2ljZXMgYmFzZWQgb24gUklTQy1WIGltcGxlbWVudGF0aW9uIElE
Lgo+ID4gCj4gPiBIb3cgaXMga2VlcGluZyB0YWJsZXMgaW4gdGhlIGtlcm5lbCBmb3IgYWxsIG1p
Y3JvYXJjaGl0ZWN0dXJhbCBkZXRhaWxzCj4gPiBhbnkgbW9yZSBzY2FsYWJsZSB0aGFuIGhhdmlu
ZyBleHRlbnNpb25zIHRoYXQgZG8gdGhlIHNhbWUgdGhpbmc/IEkgd291bGQKPiA+IGFyZ3VlIHRo
YXQgaGF2aW5nIGl0IGluIHRoZSBrZXJuZWwgaXMgbGVzcyBzY2FsYWJsZSBzaW5jZSBpdCBuZWVk
cyB0byBiZQo+ID4gZGVzY3JpYmVkIGZvciBhbGwgaW1wbGVtZW50YXRpb24gSURzLCBhbmQgYWxs
IGNoYW5nZXMgcmVxdWlyZSBnb2luZwo+ID4gdGhyb3VnaCB0aGUga2VybmVsIHJldmlldyBwcm9j
ZXNzLiBEeW5hbWljIHByb2JpbmcgYXZvaWRzIHRoZXNlIGlzc3Vlcy4KPiA+IEhhdmluZyBhbiBl
eHRlbnNpb24gaGFzIHRoZSBvbmUtdGltZSBwcm9jZXNzIG9mIGdldHRpbmcgdGhlIGV4dGVuc2lv
bgo+ID4gaW50byBzb21ldGhpbmcgbGlrZSBhIHByb2ZpbGUsIGJ1dCB0aGVuIGFueWJvZHkgY291
bGQgdXNlIGl0IHdpdGhvdXQKPiA+IG5lZWRpbmcgYSBrZXJuZWwgcGF0Y2guCj4gPiAKPiA+IC0g
Q2hhcmxpZQo+ID4gCj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IEFudXAKPiA+IAo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
