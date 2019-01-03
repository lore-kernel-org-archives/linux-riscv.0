Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B56C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 05:22:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619CD2073D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 05:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLylHg7l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1KZBnI5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619CD2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yn19rmgeU+K0i5FN8ACcA+O5rctOivjQ6iaEEWDkNRo=; b=dLylHg7lqmmrKk
	NyHbmEPF+AwwXuGi//Bbj0IFcHo2NsjJwzTh9LfmUDHALCAziMguMddCsIuky/CyUnuVVf5L0Kdrh
	hS7/+VpA90Mk7l5pf8SCdQcoqevnDcINSL0pWBW4sQg1rG1ekMbGAXUXnoCrEc7q71Ybal0CwCgbz
	3z+b9uK8E6OcnRjbbdVqVFEck7iPxMvV0AOnAM/FFhRXgEj3aWTUfOKIzJfr93NI7+9twumnvwhlB
	BSstDCXnCbX9jDjw5HLPUVtyS8YkuD7oEcAF2ioOMovGir1XMR1DLVhUCPEtQCDsKQKEE3YGEQiji
	Av5P4m2tb8c6khdTXsvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gevSK-0006bP-6n; Thu, 03 Jan 2019 05:22:08 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gevSG-0006ao-13
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 05:22:06 +0000
Received: by mail-it1-x141.google.com with SMTP id h65so41377878ith.3
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jan 2019 21:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5nFVVT8FsN2NTJwORtLSM0uuQ5s0I/o5xR4qWRu/6ZQ=;
 b=D1KZBnI5ElP3+xRvGKLGRwChHfvF7akARseCI//DIQ0VFNXJhgbTJkVKabS5adoRbU
 RG/pLYPzQ/UyKmnwwcB5XrT/GalTX3/QfbeQDyoPR8aCetYObf46bxzN8R6801OyjFeW
 MbxVzwobRVR7xx5p9i3woLs4tgKF/p//Q7Hq9LcRKd7/UybhzRsuYUTPp2vW4MrXTZDc
 AujaecKk32MKN1ECymukyd/yywwQvZc7w5HVcxsQtWReoppK0f+nSEZ9Fl1xy51NGFk4
 HrOvWfJT+K72Z5smyQwvdImZgeiWYC/eY8xlxaCc9hLtFbT+brKTBElDCMfSz4z5nktX
 BqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5nFVVT8FsN2NTJwORtLSM0uuQ5s0I/o5xR4qWRu/6ZQ=;
 b=H8Yfhdmub3kUBkLv7LrF2/PGjkpuHgfHTptGYOhO+c+D5G/Er1FR6lIlppn/4giNCS
 sEYDyAOe/OhtSOTuJ2QjmhtdmPHgUorL1ih/KnUO9jV79WPnPgtRjQCfSvY2Ei96NNdv
 10no/bzo991iFwD3y5oGnDmP0oB6ADnZaQ0ry/70/c6Fmq4khnZuhgyOLkMOQGBAD5Qm
 nrYkU0grC30mxZ4bNDUuRVRpa0PC5I/8RLVeOhX5UNDHc+lpVNHm7mP8r2egQ9XCyESW
 gu84si3Etf53SrtrhhJqS8/WIPoosiufTNJtPC69T+CEO21eU75+Y0Ci5xpH8YgRcuSx
 1H9Q==
X-Gm-Message-State: AA+aEWZFzofS7OQ2RIGYEUAibHIbq5+A9DYEt/Ybr+ofsmno/mXwZWAE
 HjkWZDbbpPV/eKcD4sv9ri+9lvoHPBxyizkK7rY=
X-Google-Smtp-Source: AFSGD/WmiLLPtSYC5jvbQRq3YmCZqXHHnYAh6gOxymHfmn5qCI3I5cA+tOvTMQIByIj5cX5K/owTI/rM2gF9h/j/b84=
X-Received: by 2002:a02:818c:: with SMTP id n12mr29986714jag.108.1546492922616; 
 Wed, 02 Jan 2019 21:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20181226032350.GA27044@roeck-us.net>
 <mhng-856d9dbc-a4f1-47c3-a71c-d1f7ae82184b@palmer-si-x1c4>
 <CAJsyPhyA_u2Syoq1tN73qx=sgddb1KS9DY7Tn98jetoCU+R8ug@mail.gmail.com>
 <122457cb-bf56-0d47-3f30-2e2beecccd7f@roeck-us.net>
In-Reply-To: <122457cb-bf56-0d47-3f30-2e2beecccd7f@roeck-us.net>
From: Vincent Chen <deanbo422@gmail.com>
Date: Thu, 3 Jan 2019 13:21:51 +0800
Message-ID: <CAJsyPhyL-RQh3Z6Snb8ARdymJsK0yM7AXGSvwZOxjfBgenjo9g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_212204_093995_AED6DCB9 
X-CRM114-Status: GOOD (  22.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 aou@eecs.berkeley.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiDmlrwgMjAxOeW5tDHmnIgz5pelIOmA
seWbmyDkuIrljYgxMTo1MeWvq+mBk++8mgo+Cj4gT24gMS8yLzE5IDY6NTkgUE0sIFZpbmNlbnQg
Q2hlbiB3cm90ZToKPiA+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNvbT4g5pa8IDIw
MTjlubQxMuaciDI35pelIOmAseWbmyDkuIrljYgxOjE55a+r6YGT77yaCj4gPj4KPiA+PiBPbiBU
dWUsIDI1IERlYyAyMDE4IDE5OjIzOjUwIFBTVCAoLTA4MDApLCBsaW51eEByb2Vjay11cy5uZXQg
d3JvdGU6Cj4gPj4+IE9uIFdlZCwgRGVjIDE5LCAyMDE4IGF0IDA5OjI1OjIxUE0gLTA4MDAsIEd1
ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gPj4+PiBPbiBXZWQsIERlYyAxOSwgMjAxOCBhdCAwNTo0NTox
MVBNIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+ID4+Pj4+IE9uIFdlZCwgTm92IDIxLCAy
MDE4IGF0IDEwOjU4OjA1QU0gLTA4MDAsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4+Pj4+PiBJ
IGRvbid0IHJlbWVtYmVyIHdobyBzdWdnZXN0ZWQgdGhpcywgYnV0IEkgd2FzIHRhbGtpbmcgdG8g
c29tZW9uZSBhdAo+ID4+Pj4+PiBQbHVtYmVycyBhYm91dCBhbGwgdGhlIGhvcnJpYmxlIGJ1Z3Mg
d2UndmUgaGFkIGx1cmtpbmcgYXJvdW5kIGluIG91cgo+ID4+Pj4+PiBwb3J0IGRlc3BpdGUgaXQg
c3RpbGwgZ2V0dGluZyB0byB1c2Vyc3BhY2UgYW5kIHRoZXkgc3VnZ2VzdGVkIHRoYXQgSQo+ID4+
Pj4+PiBlbmFibGUgQ09ORklHX1BSRUVNUFQgaW4gb3VyIGRlZmNvbmZpZyBhcyBpdCdsbCBoZWxw
IHNoYWtlIG91dCBtb3JlCj4gPj4+Pj4+IGlzc3Vlcy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhpcyBw
YXRjaCBlbmFibGVzIENPTkZJR19QUkVFTVBUIGluIHRoZSBzaW5nbGUgUklTQy1WIGRlZmNvbmZp
Zy4gIEl0Cj4gPj4+Pj4+IHN0aWxsIHBhc3NlcyBteSB0ZXN0cyAoaWUsIGJvb3RpbmcgRmVkb3Jh
IG9uIFFFTVUpLiAgTWF5YmUgSSdtIHRvbwo+ID4+Pj4+PiBwYXJhbm9pZCwgYnV0IEkgc3RpbGwg
ZG9uJ3QgdHJ1c3Qgb3VyIHBvcnQgZW5vdWdoIHRvIGp1c3QgcHVsbCB0aGUKPiA+Pj4+Pj4gdHJp
Z2dlciBvbiB0aGlzIHdpdGhvdXQgYXQgbGVhc3QgYWNjdW11bGF0aW5nIHNvbWUgIlRlc3RlZC1i
eSJzIG9uIGl0Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHNpZml2ZS5jb20+Cj4gPj4+Pj4KPiA+Pj4+PiBJIGNhbiBvbmx5IGdpdmUgeW91
IGEKPiA+Pj4+Pgo+ID4+Pj4+IEZhaWxzLW1pc2VyYWJseS1mb3I6IEd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4KPiA+Pj4+Pgo+ID4+Pj4+IE5vdCB0aGUgbmV3IGRlZmNvbmZpZyBp
dHNlbGYsIGJ1dCB0aGUgbmV3IGRlZmNvbmZpZyBwbHVzIGEgdmFyaWV0eSBvZgo+ID4+Pj4+IHNl
bGZ0ZXN0IG9wdGlvbnMuIEkgZG9uJ3Qga25vdyB3aGF0IGV4YWN0bHkgaXMgZmFpbGluZywgYnV0
IGhlcmUgaXMKPiA+Pj4+PiBteSBsaXN0IG9mIGVuYWJsZWQgc2VsZnRlc3RzIG9uIHRvcCBvZiBk
ZWZjb25maWc6Cj4gPj4+Pj4KPiA+Pj4+PiBDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJMRV9U
RVNUUz15Cj4gPj4+Pj4gQ09ORklHX0NSQzMyX1NFTEZURVNUPXkKPiA+Pj4+PiBDT05GSUdfREVC
VUdfTE9DS0lOR19BUElfU0VMRlRFU1RTPXkKPiA+Pj4+PiBDT05GSUdfREVCVUdfTk1JX1NFTEZU
RVNUPXkKPiA+Pj4+PiBDT05GSUdfREVCVUdfUk9EQVRBX1RFU1Q9eQo+ID4+Pj4+IENPTkZJR19E
RUJVR19UTEJGTFVTSD15Cj4gPj4+Pj4gQ09ORklHX0RNQVRFU1Q9eQo+ID4+Pj4+IENPTkZJR19H
TE9CX1NFTEZURVNUPXkKPiA+Pj4+PiBDT05GSUdfT0ZfVU5JVFRFU1Q9eQo+ID4+Pj4+IENPTkZJ
R19QQ0lfRVBGX1RFU1Q9eQo+ID4+Pj4+IENPTkZJR19QQ0lfRU5EUE9JTlRfVEVTVD15Cj4gPj4+
Pj4gQ09ORklHX1BST1ZFX0xPQ0tJTkc9eQo+ID4+Pj4+IENPTkZJR19QUk9WRV9SQ1U9eQo+ID4+
Pj4+IENPTkZJR19SQ1VfRVFTX0RFQlVHPXkKPiA+Pj4+PiBDT05GSUdfU1RBVElDX0tFWVNfU0VM
RlRFU1Q9eQo+ID4+Pj4+IENPTkZJR19TVFJJTkdfU0VMRlRFU1Q9eQo+ID4+Pj4+IENPTkZJR19U
RVNUX0JJVE1BUD15Cj4gPj4+Pj4gQ09ORklHX1RFU1RfRklSTVdBUkU9eQo+ID4+Pj4+IENPTkZJ
R19URVNUX1NPUlQ9eQo+ID4+Pj4+IENPTkZJR19URVNUX1NZU0NUTD15Cj4gPj4+Pj4gQ09ORklH
X1RFU1RfVVVJRD15Cj4gPj4+Pj4gQ09ORklHX1VTQl9URVNUPXkKPiA+Pj4+PiBDT05GSUdfVVNC
X0VIU0VUX1RFU1RfRklYVFVSRT15Cj4gPj4+Pj4gQ09ORklHX1VTQl9MSU5LX0xBWUVSX1RFU1Q9
eQo+ID4+Pj4+IENPTkZJR19XV19NVVRFWF9TRUxGVEVTVD15Cj4gPj4+Pj4gQ09ORklHX1RPUlRV
UkVfVEVTVD15Cj4gPj4+Pj4gQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkKPiA+Pj4+PiBDT05G
SUdfUkNVX1RPUlRVUkVfVEVTVD15Cj4gPj4+Pj4gQ09ORklHX1JCVFJFRV9URVNUPXkKPiA+Pj4+
PiBDT05GSUdfSU5URVJWQUxfVFJFRV9URVNUPXkKPiA+Pj4+Pgo+ID4+Pj4KPiA+Pj4+IFVwZGF0
ZTogZGVmY29uZmlnK0NPTkZJR19MT0NLX1RPUlRVUkVfVEVTVD15IGNhdXNlcyB0aGUgaGFuZwo+
ID4+Pj4gaWYgQ09ORklHX1BSRUVNUFQ9eS4KPiA+Pj4+Cj4gPj4+Cj4gPj4+IEFub3RoZXIgdXBk
YXRlLiBDT05GSUdfUkNVX1RPUlRVUkVfVEVTVD15IG9yIENPTkZJR19XV19NVVRFWF9TRUxGVEVT
VD15Cj4gPj4+IGFsc28gcmVzdWx0IGluIGhhbmdzLCBvbmx5IGEgYml0IGxhdGVyLiBJIGhhdmUg
bm93IGRpc2FibGVkIGFsbCB0aHJlZSB0ZXN0Cj4gPj4+IG9wdGlvbnMgaW4gbXkgcmlzY3YgYm9v
dCB0ZXN0cyBpZiBDT05GSUdfUFJFRU1QVD15LiBUaGUgbGFjayBvZiBlcnJvcgo+ID4+PiByZXBv
cnRzIGluIHRoZSBmdXR1cmUgZG9lcyBfbm90XyBtZWFuIHRoYXQgdGhlIHByb2JsZW0gaGFzIG1h
Z2ljYWxseQo+ID4+PiBkaXNhcHBlYXJlZC4gSSBqdXN0IGZpbmQgaXQgcG9pbnRsZXNzIHRvIGtl
ZXAgdGVzdGluZyBhIGtub3duIGJyb2tlbgo+ID4+PiBjb25maWd1cmF0aW9uLCBldmVuIG1vcmUg
c28gc2luY2UgZG9pbmcgc28gd291bGQgaGlkZSBvdGhlciBwb3RlbnRpYWwKPiA+Pj4gcHJvYmxl
bXMuCj4gPj4KPiA+PiBUaGFua3MuICBJIGFncmVlIGl0J3MgcG9pbnRsZXNzIHRvIHRlc3QgbW9y
ZSwgYXMgdGhlcmUgYXBwZWFyIHRvIGJlIGxvdHMgb2YKPiA+PiBidWdzIHRvIGZpeCBhbHJlYWR5
IGFuZCB0aGlzIHdpbGwganVzdCBtYXNrIG90aGVyIGJ1Z3MuCj4gPj4KPiA+Cj4gPiBMYXN0IHdl
ZWssIEkgZW5jb3VudGVyZWQgc29tZSBsb2NraW5nIGlzc3VlcyBpbiB0aGUga2VybmVsLCBzbyBJ
IHRyaWVkCj4gPiB0byB0ZXN0IHRoZQo+ID4ga2VybmVsIHdpdGggc29tZSByZWxhdGl2ZSBzZWxm
dGVzdHMuIFNpbmNlIEkgaGFkIGFscmVhZHkgc2V0IENPTkZJR19QUkVFTVBUPXksCj4gPiBJIGVu
Y291bnRlcmVkIHRoZSBzYW1lIHJlc3VsdHMgaW4gUkNVX1RPUlRVUkVfVEVTVCBhbmQKPiA+IExP
Q0tfVE9SVFVSRV9URVNULiBJIHRyaWVkIHRvIGRlYnVnIGl0IGFuZCBmb3VuZCB0aGUgaGFuZyB3
YXMgZHVlIHRvCj4gPiB0aGUgbGFjayBvZiBfVElGX05FRURfUkVTQ0hFRCBjaGVjayBmb3Iga2Vy
bmVsIHRocmVhZHMgaW4gZW50cnkuUy4gSSB3aWxsIHNlbmQgYQo+ID4gcGF0Y2ggdG8gc29sdmUg
dGhpcyBwcm9ibGVtIGFuZCBJIGhvcGUgeW91IGNhbiBnaXZlIG1lIHNvbWUgY29tbWVudHMKPiA+
IGlmIHlvdSBmaW5kIHNvbWUKPiA+IG1pc3Rha2VzLgo+ID4KPgo+IEknbGwgYmUgaGFwcHkgdG8g
cnVuIGEgc2V0IG9mIHRlc3RzIGlmIHlvdSBDYzogbWUgb24gdGhlIHBhdGNoLgo+Cj4gR3VlbnRl
cgoKU29ycnksIEkgaGF2ZSBzZW50IHRoaXMgcGF0Y2ggYnV0IEkgZm9yZ2V0IHRvIGFkZCB5b3Ug
dG8gdGhlIENjIGxpc3QuCkkgd2lsbCBzZW5kIHlvdSB0aGlzIHBhdGNoIGFnYWluIGFuZCBwbGVh
c2UgaGVscCBtZSB0byBydW4gYSBzZXQgb2YgdGVzdHMuClRoYW5rcwoKVmluY2VudCBDaGVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
