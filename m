Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FC8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 20:06:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB0860F39
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 20:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FB0860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b79pOGKT00nUAN6K2Fs3HjRD27/BOzOgmJMSdBM8hvg=; b=x8SPVnUoHBx8TV
	6REBAo/apMDeFdgLNH+GQIh9L9PmbTPdUNe+g/pQbZFlQGX8fGWXF8cSpWOKRGlrJ9Sw9MS89NO/F
	QXjrkV7daGXCb01f3CO6fRPZNI8fz33xHTSLb2s0I15JeQBDr48UmoQ/pxSB8/7P36734ibmAZTyD
	s7ZkkAPBYKJqjhdKNpjHn6OgPkFGCcF/iQgOMubzzE3QqHbq5yoRpSakDUVD7S7iHh0sZIFd6TGb/
	UcRVcR0sfvR9W7xFXv9kH0hqoSJAbIbfkkAWlXcEQe+UX0MFoDNJ7O4Y97O0niDXOPTXKYFDbOx5m
	TmZrYcnT69hVppDMw5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVJMg-008jfz-T8; Tue, 28 Sep 2021 20:06:10 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVJMc-008jf3-78
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 20:06:09 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 71so246908ybe.6
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JYHAqIrp/niyeZyM4gfUPHGOBGXEnXF8wVEXu1CnAg4=;
 b=Rmw8GPV4HknIFiDqVMYfBo8lmwDSTfHjlEDkZZCAVULWEQil/ZyhxwvRAMHdbYLUzl
 myWWOHxeQKPUHIyr+FCDMAoqFZZ0lYa1eOMdIGXlFt3egGqaB4CIOgHhg4VGoTGtvqVh
 s0et1FrfUh/hxs5t877HBHp+mQD5aqRUsHMDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JYHAqIrp/niyeZyM4gfUPHGOBGXEnXF8wVEXu1CnAg4=;
 b=MrFBKhZY8wtCVp7mCLohkplk4OMLghs971CcUvJX/fIWhe2dFD9mk6hHiPqptPk+UC
 mwzM2RgYFWSDCvygvx/f/kiZznbstRBnlSU2YgQzkwvsYdHjQcx8tl1aVk7u5mM5vx57
 p04wv3HsJBup/kg4rHkIbUitqsH23CZ17vuQP0jGbN5QyaNywZB1/uQjXU6WrKTMNLxt
 4I7/f9/4g18gdU4xVo8sMYW3fEqSgjTj+LyNV9aovYrtirNHGCmaFdOj8zjgGhY4qRQt
 dm7zCc5Gww3anNGAMaoA2MGyh1mp194NaXHLgQ+YU1FMA0qcVTjkTVa0i9xJF9nm2ACx
 PVag==
X-Gm-Message-State: AOAM530LhhQzA5t+pBwEfyAtHypyOlLE6bXbXkhhCp5nvB+wp4kDxvxg
 jqW/f573KxbRTtd/6vItMDsfiMotYKqmOuRz2FQtPGvS1VlUWNY=
X-Google-Smtp-Source: ABdhPJzTpTqPZOh4wF5xQVQD/2mpO3lwg1BdcYiNCwAn45scVC/cjP6NOYyx37B6Wjq/FCVHt9krGj14V+vrStCG2hc=
X-Received: by 2002:a5b:2d2:: with SMTP id h18mr9550761ybp.526.1632859564018; 
 Tue, 28 Sep 2021 13:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <63E6E860-22F0-457D-B17B-3B6625BA4A99@riscv.org>
 <mhng-ab0efec8-8329-4521-9094-05cad25c6c09@palmerdabbelt-glaptop>
In-Reply-To: <mhng-ab0efec8-8329-4521-9094-05cad25c6c09@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 28 Sep 2021 13:05:53 -0700
Message-ID: <CAOnJCUJp7-7UmekMsjjiEz3T1fa8-oA6-e-UgM2y5OrvkHV13g@mail.gmail.com>
Subject: Re: Status of the various RISC-V specification and policy
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Himelstein <markhimelstein@riscv.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>, Al Stone <ahs3@redhat.com>,
 pbonzini@redhat.com, 
 Christoph Hellwig <hch@lst.de>, Andrew Jones <drjones@redhat.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Wei Fu <tekkamanninja@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Kumar Sankaran <ksankaran@ventanamicro.com>, 
 Philipp Tomsich <ptomsich@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
 Stephano Cetola <stephano@riscv.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_130606_364532_CA5B5CE1 
X-CRM114-Status: GOOD (  31.60  )
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

T24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMTE6MzQgQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDI3IFNlcCAyMDIxIDA4OjU3OjE1IFBEVCAo
LTA3MDApLCBtYXJraGltZWxzdGVpbkByaXNjdi5vcmcgd3JvdGU6Cj4gPiB0aGUgd29yZHMgaW4g
dGhpcyBkb2N1bWVudCA6Cj4gPgo+ID4gaHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9wbHVnaW5zL3Nl
cnZsZXQvbW9iaWxlP2NvbnRlbnRJZD0xMzA5ODIzMCNjb250ZW50L3ZpZXcvMTMwOTgyMzAKPiA+
Cj4gPiBtYWtlIGl0IHZlcnkgY2xlYXIgd2hlbiBjaGFuZ2VzIGFyZSBhbGxvd2VkIG9yIG5vdCBh
bmQgbGlrZWx5IG9yIG5vdC4KPiA+Cj4gPiBpZiB5b3UgdGhpbmsgdGhlIHZlcmJpYWdlIGlzIHNv
bWVob3cgYW1iaWd1b3VzIHBsZWFzZSBoZWxwIHVzIG1ha2UgaXQgYmV0dGVyLgo+Cj4gSSdtIG5v
dCByZWFsbHkgd29ycmllZCBhYm91dCBjaGFuZ2VzLCBJJ20gd29ycmllZCBhYm91dCBhIGNvbW1p
dHRtZW50IHRvCj4gZnV0dXJlIGNvbXBhdGliaWxpdHkuICBXaGVuIHdlIHRha2UgY29kZSBpbnRv
IHRoZSBrZXJuZWwgKGFuZCBtb3N0IG90aGVyCj4gY29yZSBzeXN0ZW1zIHByb2plY3RzKSB3ZSdy
ZSB0YWtpbmcgb24gdGhlIGJ1cmRlbiBvZiBzdXBwb3J0aW5nICh1bnRpbAo+IHNvbWVvbmUgY2Fu
IHByb3ZlIHRoZXJlIGFyZSBubyBtb3JlIHVzZXJzKSwgd2hpY2ggaXMgdmVyeSBkaWZmaWN1bHQg
dG8KPiBkbyB3aGVuIHRoZSBJU0EgY2hhbmdlcyBpbiBhbiBpbmNvbXBhdGlibGUgZmFzaGlvbi4g
IFRoZSB3aG9sZSBwb2ludCBvZgo+IGFncmVlaW5nIG9uIHRoZSBmcm96ZW4gdGhpbmcgd2FzIHRo
YXQgaXQgZ2F2ZSB1cyBhIGNvbW1pdHRtZW50IGZyb20gdGhlCj4gc3BlY2lmY2F0aW9uIGF1dGhv
cnMgdGhhdCB0aGUgZnV0dXJlIElTQSB3b3VsZCBiZSBjb21wYXRpYmxlIHdpdGggdGgKPiBmcm96
ZW4gZXh0ZW5zaW9ucy4KPgo+IFdlJ3JlIGFscmVhZHkgaW4gdGhpcyBzcG90IHdpdGggdGhlIFYg
ZXh0ZW5zaW9uIGFuZCB0aGUgd2hvbGUgc3RhYmxlCj4gdGhpbmcsIHRoaXMgZGVmaW5pdGFpb24g
b2YgZnJvemVuIGxvb2tzIHZlcnkgbXVjaCBsaWtlIHdoYXQgd2FzIGhhcyBsZWQKPiB0byB0aGUg
aXNzdWVzIHRoZXJlLiAgU2F5aW5nIHRoZSBzcGVjIHdvbid0IGNoYW5nZSByZWFsbHkgaXNuJ3QK
PiBtZWFuaW5nZnVsLCBpdCdzIHNheWluZyBmdXR1cmUgc3BlY3Mgd2lsbCBiZSBjb21wYXRpYmxl
IHRoYXQncwo+IGltcG9ydGFudC4gIE5vdGhpbmcgaW4gdGhpcyB3aG9sZSBydWxlIHRvdWNoZXMg
b24gY29tcGF0aWJpbGl0eSwgYW5kIEkKPiByZWFsbHkgZG9uJ3Qgd2FudCB0byBlbmQgdXAgaW4g
YSBiaWdnZXIgbWVzcyB0aGFuIHdlJ3JlIGFscmVhZHkgaW4uCj4KPiAoQWxzbzogc29tZSBQR0Ug
c3ViY29udHJhY3RvciBkcm92ZSBhIGNyYW5lIGludG8gbXkgaG91c2UsIHNvIHRoaW5ncyBhcmUK
PiBhIGJpdCBjaGFvdGljIG9uIG15IGVuZC4gIElmIHlvdSBoYXZlIHRoYXQgbGlzdCBvZiB3aGF0
J3Mgb2ZmaWNpYWxseQo+IGZyb3plbiwgY2FuIHlvdSBzZW5kIGl0IG91dD8gIEknbGwgdHJ5IHRv
IHRha2UgYSBsb29rIEFTQVAsIGFzIHRoZW4gSQo+IGNhbiBhdCBsZWFzdCBmb2N1cyB0aGUgZGlz
Y3Vzc2lvbiBvbiB3aGF0J3MgcmVsZXZhbnQgcmlnaHQgbm93LikKCkhlcmUgaXMgdGhlIGxpc3Qg
b2YgdGhlIHNwZWNzIHRoYXQgYXJlIGZyb3plbi4KaHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNw
bGF5L1RFQ0gvSVNBK0V4dGVuc2lvbnMrT24rRGVjaytmb3IrRnJlZXplK01pbGVzdG9uZQpJIHdp
bGwgbGV0IE1hcmsgY29tbWVudCBvbiB0aGUgY29tcGF0aWJpbGl0eSB0aGluZy4KCj4KPiA+Cj4g
PiBNYXJrCj4gPiAtLS0tLS0tLQo+ID4gc2VudCBmcm9tIGEgbW9iaWxlIGRldmljZS4gcGxlYXNl
IGZvcmdpdmUgYW55IHR5cG9zLgo+ID4KPiA+PiBPbiBTZXAgMjcsIDIwMjEsIGF0IDg6NTAgQU0s
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4g77u/
T24gVHVlLCAyMSBTZXAgMjAyMSAxNzoyMDoxNyBQRFQgKC0wNzAwKSwgYXRpc2hwQGF0aXNocGF0
cmEub3JnIHdyb3RlOgo+ID4+PiBIaSBBbGwsCj4gPj4+IFBsZWFzZSBmaW5kIHRoZSBiZWxvdyBl
bWFpbCBmcm9tIFN0ZXBoYW5vIGFib3V0IHRoZSBmcmVlemUgYW5ub3VuY2VtZW50IGZvcgo+ID4+
PiB2YXJpb3VzIFJJU0MtViBzcGVjaWZpY2F0aW9ucyB0aGF0IHdpbGwgYmUgcGFydCBvZiBwcml2
aWxlZ2Ugc3BlY2lmaWNhdGlvbgo+ID4+PiB2MS4xMi4KPiA+Pj4gQWxsIHRoZSByZXZpZXcgZGlz
Y3Vzc2lvbnMgYXJlIGhhcHBlbmluZyBpbiB0aGUgaXNhLWRldiBtYWlsaW5nIGxpc3QuIFRoZQo+
ID4+PiByZXZpZXcgcGVyaW9kIHdpbGwgYmUgb3BlbiBmb3IgNDUgZGF5cyBlbmRpbmcgU3VuZGF5
IE9jdG9iZXIgMzEsIDIwMjEuCj4gPj4+Cj4gPj4+IEkganVzdCB3YW50IHRvIGhpZ2hsaWdodCB0
aGUgZmFjdCB0aGF0IHRoZSAqSCosICpWLCBTdlBCTVQsIENNTyBleHRlbnNpb25zCj4gPj4+IGFy
ZSBmcm96ZW4gbm93LiAqVGhpcyB3aWxsIGhlbHAgdXMgbWVyZ2Ugc29tZSBwYXRjaGVzIHRoYXQg
aGF2ZSBiZWVuCj4gPj4+IHByZXNlbnQgaW4gdGhlIG1haWxpbmcgbGlzdCBmb3IgYSB3aGlsZS4K
PiA+Pj4KPiA+Pj4gSGVyZSBhcmUgdGhlIHJhdGlmaWNhdGlvbiBwb2xpY3kgYW5kIGV4dGVuc2lv
biBsaWZlIGN5Y2xlIGRvY3VtZW50cyBwcmVzZW50Cj4gPj4+IGluIHRoZSBwdWJsaWMuIElmIHlv
dSBoYXZlIGFueSBxdWVzdGlvbnMgcmVnYXJkaW5nIHRoaXMsIHBsZWFzZSBjaGVjayB3aXRoCj4g
Pj4+IE1hcmsvU3RlcGhhbm8gKGNjJ2QpLgo+ID4+Pgo+ID4+PiBSYXRpZmljYXRpb24gcG9saWN5
Ogo+ID4+PiBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzEtVWxhU0dxazU5X215
ZXVQTXJWOWd5dWFJZ25tRnpHaDVHZnlfdHBWaXdNL2VkaXQKPiA+Pj4KPiA+Pj4gRXh0ZW5zaW9u
IGxpZmUgY3ljbGU6Cj4gPj4+IGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3ByZXNlbnRhdGlvbi9k
LzFuUTV1RmIzOUtBNmd2VWk1U1JlV2ZJUVNpUk43aHA2ejdaUGZjdEU0bUtrL2VkaXQjc2xpZGU9
aWQucDEKPiA+Pgo+ID4+IEknbSBzdGlsbCBidXJpZWQgYWZ0ZXIgUGx1bWJlcnMsIGJ1dCBvbmUg
b2YgdGhlIGJpdHMgb24gbXkgVE9ETyBsaXN0IHdhcyB0byBsb29rIHRocm91Z2h0IHRoZSBuZXcg
ZGVmaW5pdGlvbnMgZm9yIGZyb3plbiBhbmQgc3RhYmxlLiAgTm90aGluZyBpbiB0aGlzIGV4dGVu
c2lvbiBsaWZlIGN5Y2xlIHRhbGtzIGFib3V0IHRoZSBwb2ludCBhdCB3aGljaCBjb21wYXRpYmls
aXR5IHdpbGwgYmUgbWFpbnRhaW5lZCwgd2hpY2ggd2FzIHJlYWxseSB0aGUgY2VudHJhbCBwb2lu
dCBiZWhpbmQgZnJvemVuIGJlZm9yZS4KPiA+Pgo+ID4+IEFyZSB0aGVyZSBtb3JlIGNvbmNyZXRl
IGRlZmluaXRpb25zIHNvbWV3aGVyZT8KCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
