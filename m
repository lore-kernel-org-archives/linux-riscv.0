Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E29C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 23:24:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639AA60F9D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 23:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 639AA60F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LsIB3ek5r0rrzJC9wpiA+VGV1KTX3LmJMRf0Iw3FPc=; b=Ivl/XeDei9fjMN
	oMd+dcVs1be+7mcRGR1SyrOAq4X8heJBQMRO1a3t6DKzUyiNhS7LPA+GcURoJXJqiLe9po0t164yr
	/d5Y+juvojbX3f8rfTjKiCQ1OThGva6O+wVKmZb2GUszmGHdYynAl1J6DnQgHu4cFBghyKpagJXi/
	rPhUxQyPnvnCOYC1t/NPHLCGbxLoiRyV3JlGMKMNrZLNxJHIF7mepPLUZ2dm+U7x2ErnGcao5iAqm
	kjw+2R60AK+G7UvHRlyXspMR0E+VJRwvGO9p/n92cKnqu+vmgbyNdo8GpKLq4J4NoOzAAN9R5K7i4
	eZp9wvAEmp3dIRXKZK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVMSk-009HVV-EE; Tue, 28 Sep 2021 23:24:38 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVMSM-009HCh-Kj
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 23:24:16 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id u32so1194002ybd.9
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 16:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FuSk8EhDb6a6kClO+9Ekc1hjUorSPfUEuZVlSSIAFWA=;
 b=cp/CuGohS7cNfHkdcf5ITq4iEifT0rK0904U/yJEijbE6vCStuY5OtIu5Hmy2tck78
 8sJXV8Vwrbrmikil7YZdZY9FAd2fmZRt2ZWQ2eMeSuXF8oTlj+4OU1uB21lsbmZSu/AH
 k80dygNW3ACDJ7gqZIqajqzaWlJyQSEv5Hgro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FuSk8EhDb6a6kClO+9Ekc1hjUorSPfUEuZVlSSIAFWA=;
 b=6Zpqns6ZwgwsxOsACHXC0y6KqfKexBZd5dOxh2YRPGnxgqscQLBu4gefU3tmBJqxNz
 twhn/Ij89whiXMmF8+WwrbLj6iNQF7Wquqtwwsd/4jWn5Z/w2w4RM5d8yULLzlFnQBpt
 8LYnQiCWF5tv1ebntp2OKchQ7hyXYLr9fRYiiqagQX816IhVY5VzusMVgZQmippxkpad
 bAnfibvA4Yn9N7xKo57TQyJlV09fjzfGkLj+KXAPFaOPNN1YTLMx0h0ZSVh7hDFhXg4i
 lyWekQ8Q8bxkaxcVeWm21rAmoLdMyfaVlIHpDLsk1yPkeEVoGzzSsJsfEy4Woiw2emB9
 YnnA==
X-Gm-Message-State: AOAM533TmGahstPFE4NASvJqazjUhUfAsw+FyB4X8H0/UDLm+HqEVifX
 bN2OrLh2U/68iTkMQV1kxRmbChCj+93vsXqD8FQP
X-Google-Smtp-Source: ABdhPJyVKeySXjXDl4rgsHn4ejDAVj9/sXA5jlpPFvS0uvpAf5WifB+WztLq6Yy8DUnq4RRfn78IBcBeaMc4FTLXMLg=
X-Received: by 2002:a25:50ce:: with SMTP id e197mr9691942ybb.258.1632871447243; 
 Tue, 28 Sep 2021 16:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCUJp7-7UmekMsjjiEz3T1fa8-oA6-e-UgM2y5OrvkHV13g@mail.gmail.com>
 <mhng-23f0afb2-f714-42ad-bce1-0cfc928c2612@palmerdabbelt-glaptop>
In-Reply-To: <mhng-23f0afb2-f714-42ad-bce1-0cfc928c2612@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 28 Sep 2021 16:23:56 -0700
Message-ID: <CAOnJCUKZeX_rZYy8z+=n6k2SXmhA=edW0nTQ-jvHt4X9ajP+Lw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210928_162414_808335_61EFEBD4 
X-CRM114-Status: GOOD (  38.03  )
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

T24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMzo0MyBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjggU2VwIDIwMjEgMTM6MDU6NTMgUERUICgt
MDcwMCksIGF0aXNocEBhdGlzaHBhdHJhLm9yZyB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDI4LCAy
MDIxIGF0IDExOjM0IEFNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3Rl
Ogo+ID4+Cj4gPj4gT24gTW9uLCAyNyBTZXAgMjAyMSAwODo1NzoxNSBQRFQgKC0wNzAwKSwgbWFy
a2hpbWVsc3RlaW5AcmlzY3Yub3JnIHdyb3RlOgo+ID4+ID4gdGhlIHdvcmRzIGluIHRoaXMgZG9j
dW1lbnQgOgo+ID4+ID4KPiA+PiA+IGh0dHBzOi8vd2lraS5yaXNjdi5vcmcvcGx1Z2lucy9zZXJ2
bGV0L21vYmlsZT9jb250ZW50SWQ9MTMwOTgyMzAjY29udGVudC92aWV3LzEzMDk4MjMwCj4gPj4g
Pgo+ID4+ID4gbWFrZSBpdCB2ZXJ5IGNsZWFyIHdoZW4gY2hhbmdlcyBhcmUgYWxsb3dlZCBvciBu
b3QgYW5kIGxpa2VseSBvciBub3QuCj4gPj4gPgo+ID4+ID4gaWYgeW91IHRoaW5rIHRoZSB2ZXJi
aWFnZSBpcyBzb21laG93IGFtYmlndW91cyBwbGVhc2UgaGVscCB1cyBtYWtlIGl0IGJldHRlci4K
PiA+Pgo+ID4+IEknbSBub3QgcmVhbGx5IHdvcnJpZWQgYWJvdXQgY2hhbmdlcywgSSdtIHdvcnJp
ZWQgYWJvdXQgYSBjb21taXR0bWVudCB0bwo+ID4+IGZ1dHVyZSBjb21wYXRpYmlsaXR5LiAgV2hl
biB3ZSB0YWtlIGNvZGUgaW50byB0aGUga2VybmVsIChhbmQgbW9zdCBvdGhlcgo+ID4+IGNvcmUg
c3lzdGVtcyBwcm9qZWN0cykgd2UncmUgdGFraW5nIG9uIHRoZSBidXJkZW4gb2Ygc3VwcG9ydGlu
ZyAodW50aWwKPiA+PiBzb21lb25lIGNhbiBwcm92ZSB0aGVyZSBhcmUgbm8gbW9yZSB1c2Vycyks
IHdoaWNoIGlzIHZlcnkgZGlmZmljdWx0IHRvCj4gPj4gZG8gd2hlbiB0aGUgSVNBIGNoYW5nZXMg
aW4gYW4gaW5jb21wYXRpYmxlIGZhc2hpb24uICBUaGUgd2hvbGUgcG9pbnQgb2YKPiA+PiBhZ3Jl
ZWluZyBvbiB0aGUgZnJvemVuIHRoaW5nIHdhcyB0aGF0IGl0IGdhdmUgdXMgYSBjb21taXR0bWVu
dCBmcm9tIHRoZQo+ID4+IHNwZWNpZmNhdGlvbiBhdXRob3JzIHRoYXQgdGhlIGZ1dHVyZSBJU0Eg
d291bGQgYmUgY29tcGF0aWJsZSB3aXRoIHRoCj4gPj4gZnJvemVuIGV4dGVuc2lvbnMuCj4gPj4K
PiA+PiBXZSdyZSBhbHJlYWR5IGluIHRoaXMgc3BvdCB3aXRoIHRoZSBWIGV4dGVuc2lvbiBhbmQg
dGhlIHdob2xlIHN0YWJsZQo+ID4+IHRoaW5nLCB0aGlzIGRlZmluaXRhaW9uIG9mIGZyb3plbiBs
b29rcyB2ZXJ5IG11Y2ggbGlrZSB3aGF0IHdhcyBoYXMgbGVkCj4gPj4gdG8gdGhlIGlzc3VlcyB0
aGVyZS4gIFNheWluZyB0aGUgc3BlYyB3b24ndCBjaGFuZ2UgcmVhbGx5IGlzbid0Cj4gPj4gbWVh
bmluZ2Z1bCwgaXQncyBzYXlpbmcgZnV0dXJlIHNwZWNzIHdpbGwgYmUgY29tcGF0aWJsZSB0aGF0
J3MKPiA+PiBpbXBvcnRhbnQuICBOb3RoaW5nIGluIHRoaXMgd2hvbGUgcnVsZSB0b3VjaGVzIG9u
IGNvbXBhdGliaWxpdHksIGFuZCBJCj4gPj4gcmVhbGx5IGRvbid0IHdhbnQgdG8gZW5kIHVwIGlu
IGEgYmlnZ2VyIG1lc3MgdGhhbiB3ZSdyZSBhbHJlYWR5IGluLgo+ID4+Cj4gPj4gKEFsc286IHNv
bWUgUEdFIHN1YmNvbnRyYWN0b3IgZHJvdmUgYSBjcmFuZSBpbnRvIG15IGhvdXNlLCBzbyB0aGlu
Z3MgYXJlCj4gPj4gYSBiaXQgY2hhb3RpYyBvbiBteSBlbmQuICBJZiB5b3UgaGF2ZSB0aGF0IGxp
c3Qgb2Ygd2hhdCdzIG9mZmljaWFsbHkKPiA+PiBmcm96ZW4sIGNhbiB5b3Ugc2VuZCBpdCBvdXQ/
ICBJJ2xsIHRyeSB0byB0YWtlIGEgbG9vayBBU0FQLCBhcyB0aGVuIEkKPiA+PiBjYW4gYXQgbGVh
c3QgZm9jdXMgdGhlIGRpc2N1c3Npb24gb24gd2hhdCdzIHJlbGV2YW50IHJpZ2h0IG5vdy4pCj4g
Pgo+ID4gSGVyZSBpcyB0aGUgbGlzdCBvZiB0aGUgc3BlY3MgdGhhdCBhcmUgZnJvemVuLgo+ID4g
aHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNwbGF5L1RFQ0gvSVNBK0V4dGVuc2lvbnMrT24rRGVj
aytmb3IrRnJlZXplK01pbGVzdG9uZQo+Cj4gSG93IGRvZXMgdGhhdCBpbmRpY2F0ZSB3aGF0IGlz
IGZyb3plbj8gIEkgc2VlICJJU0EgRXh0ZW5zaW9ucyBPbiBEZWNrCj4gZm9yIEZyZWV6ZSBNaWxl
c3RvbmUiIGFzIHRoZSB0aXRsZSwgd2hpY2ggbWFrZXMgaXQgc291bmQgbGlrZSB0aGVzZSBhcmUK
PiBleHRlbnNpb24gdGhhdCBhcmUgbm90IHlldCBmcm96ZW4gYnV0IHdpbGwgYmUgZXZlbnR1YWxs
eS4KCkFueSByb3cgd2l0aCAidG9wIHNoZWV0IiBjb21wbGV0ZSBhbmQgIm91dCBmb3IgcHVibGlj
IHJldmlldyIgaXMgZnJvemVuLgpUaGUgbGlmZSBjeWNsZSBkb2N1bWVudFsxXSB0aGF0IEkgc2hh
cmVkIGVhcmxpZXIgaW4gdGhpcyB0aHJlYWQgYWxzbwpzYXlzIHRoZSBzYW1lIGkuZS4gYW55IHNw
ZWNpZmljYXRpb24gdGhhdCBpcyBvdXQgZm9yIHB1YmxpYyByZXZpZXcgaXMKZnJvemVuLgpTdGVw
aGFubyBhbHNvIHNlbnQgb3V0IGEgcHVibGljIGVtYWlsIGFib3V0IGFsbCB0aGUgc3BlY2lmaWNh
dGlvbnMKdGhhdCBhcmUgZnJvemVuLgoKSG93ZXZlciwgSSB1bmRlcnN0YW5kIHRoYXQgeW91IG5l
ZWQgdG8gZG8gYSBsaXR0bGUgYml0IG9mIGRlZHVjdGlvbiB0bwp1bmRlcnN0YW5kIHdoYXQgaXMg
ZnJvemVuLgpAU3RlcGhhbm8oYWxyZWFkeSBjYydkIGhlcmUpCgpDYW4geW91IGFkZCBhIHNlcGFy
YXRlIGNvbHVtbiBjbGVhcmx5IGluZGljYXRpbmcgdGhhdCAiRnJlZXplIiBzdGF0dXMKZm9yIGVh
Y2ggb2YgdGhvc2Ugc3BlY2lmaWNhdGlvbnMgaW4gdGhlIHdpa2kgbGluay4KClsxXSBodHRwczov
L2RvY3MuZ29vZ2xlLmNvbS9wcmVzZW50YXRpb24vZC8xblE1dUZiMzlLQTZndlVpNVNSZVdmSVFT
aVJON2hwNno3WlBmY3RFNG1Lay9lZGl0I3NsaWRlPWlkLnAxCj4KPiBTY3JvbGxpbmcgZG93biB0
byB0aGUgZW5kIG9mIHRoYXQgbGlzdCwgaXQgbGlzdHMgcG9pbnRlciBtYXNraW5nLiAgVGhlCj4g
YmVzdCBJIGNhbiBmaW5kIGlzCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWotZXh0
ZW5zaW9uL2Jsb2IvbWFzdGVyL3BvaW50ZXItbWFza2luZy1wcm9wb3NhbC5hZG9jCj4gLCB3aGlj
aCBzYXlzICJWZXJzaW9uOiB2MC4xLWRyYWZ0Iiwgd2hpY2ggZGVmaW5hdGVseSBkb2Vzbid0IHNv
dW5kCj4gZnJvemVuLiAgVGhlIFJFQURNRSBzYXlzICJXb3JraW5nIERyYWZ0IG9mIHRoZSBSSVND
LVYgSiBFeHRlbnNpb24KPiBTcGVjaWZpY2F0aW9uIiwgd2hpY2ggYWxzbyBkb2Vzbid0IHNvdW5k
IGZyb3plbi4KPgo+ID4gSSB3aWxsIGxldCBNYXJrIGNvbW1lbnQgb24gdGhlIGNvbXBhdGliaWxp
dHkgdGhpbmcuCj4gPgo+ID4+Cj4gPj4gPgo+ID4+ID4gTWFyawo+ID4+ID4gLS0tLS0tLS0KPiA+
PiA+IHNlbnQgZnJvbSBhIG1vYmlsZSBkZXZpY2UuIHBsZWFzZSBmb3JnaXZlIGFueSB0eXBvcy4K
PiA+PiA+Cj4gPj4gPj4gT24gU2VwIDI3LCAyMDIxLCBhdCA4OjUwIEFNLCBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPiA+PiA+Pgo+ID4+ID4+IO+7v09uIFR1ZSwg
MjEgU2VwIDIwMjEgMTc6MjA6MTcgUERUICgtMDcwMCksIGF0aXNocEBhdGlzaHBhdHJhLm9yZyB3
cm90ZToKPiA+PiA+Pj4gSGkgQWxsLAo+ID4+ID4+PiBQbGVhc2UgZmluZCB0aGUgYmVsb3cgZW1h
aWwgZnJvbSBTdGVwaGFubyBhYm91dCB0aGUgZnJlZXplIGFubm91bmNlbWVudCBmb3IKPiA+PiA+
Pj4gdmFyaW91cyBSSVNDLVYgc3BlY2lmaWNhdGlvbnMgdGhhdCB3aWxsIGJlIHBhcnQgb2YgcHJp
dmlsZWdlIHNwZWNpZmljYXRpb24KPiA+PiA+Pj4gdjEuMTIuCj4gPj4gPj4+IEFsbCB0aGUgcmV2
aWV3IGRpc2N1c3Npb25zIGFyZSBoYXBwZW5pbmcgaW4gdGhlIGlzYS1kZXYgbWFpbGluZyBsaXN0
LiBUaGUKPiA+PiA+Pj4gcmV2aWV3IHBlcmlvZCB3aWxsIGJlIG9wZW4gZm9yIDQ1IGRheXMgZW5k
aW5nIFN1bmRheSBPY3RvYmVyIDMxLCAyMDIxLgo+ID4+ID4+Pgo+ID4+ID4+PiBJIGp1c3Qgd2Fu
dCB0byBoaWdobGlnaHQgdGhlIGZhY3QgdGhhdCB0aGUgKkgqLCAqViwgU3ZQQk1ULCBDTU8gZXh0
ZW5zaW9ucwo+ID4+ID4+PiBhcmUgZnJvemVuIG5vdy4gKlRoaXMgd2lsbCBoZWxwIHVzIG1lcmdl
IHNvbWUgcGF0Y2hlcyB0aGF0IGhhdmUgYmVlbgo+ID4+ID4+PiBwcmVzZW50IGluIHRoZSBtYWls
aW5nIGxpc3QgZm9yIGEgd2hpbGUuCj4gPj4gPj4+Cj4gPj4gPj4+IEhlcmUgYXJlIHRoZSByYXRp
ZmljYXRpb24gcG9saWN5IGFuZCBleHRlbnNpb24gbGlmZSBjeWNsZSBkb2N1bWVudHMgcHJlc2Vu
dAo+ID4+ID4+PiBpbiB0aGUgcHVibGljLiBJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIHJlZ2Fy
ZGluZyB0aGlzLCBwbGVhc2UgY2hlY2sgd2l0aAo+ID4+ID4+PiBNYXJrL1N0ZXBoYW5vIChjYydk
KS4KPiA+PiA+Pj4KPiA+PiA+Pj4gUmF0aWZpY2F0aW9uIHBvbGljeToKPiA+PiA+Pj4gaHR0cHM6
Ly9kb2NzLmdvb2dsZS5jb20vZG9jdW1lbnQvZC8xLVVsYVNHcWs1OV9teWV1UE1yVjlneXVhSWdu
bUZ6R2g1R2Z5X3RwVml3TS9lZGl0Cj4gPj4gPj4+Cj4gPj4gPj4+IEV4dGVuc2lvbiBsaWZlIGN5
Y2xlOgo+ID4+ID4+PiBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9wcmVzZW50YXRpb24vZC8xblE1
dUZiMzlLQTZndlVpNVNSZVdmSVFTaVJON2hwNno3WlBmY3RFNG1Lay9lZGl0I3NsaWRlPWlkLnAx
Cj4gPj4gPj4KPiA+PiA+PiBJJ20gc3RpbGwgYnVyaWVkIGFmdGVyIFBsdW1iZXJzLCBidXQgb25l
IG9mIHRoZSBiaXRzIG9uIG15IFRPRE8gbGlzdCB3YXMgdG8gbG9vayB0aHJvdWdodCB0aGUgbmV3
IGRlZmluaXRpb25zIGZvciBmcm96ZW4gYW5kIHN0YWJsZS4gIE5vdGhpbmcgaW4gdGhpcyBleHRl
bnNpb24gbGlmZSBjeWNsZSB0YWxrcyBhYm91dCB0aGUgcG9pbnQgYXQgd2hpY2ggY29tcGF0aWJp
bGl0eSB3aWxsIGJlIG1haW50YWluZWQsIHdoaWNoIHdhcyByZWFsbHkgdGhlIGNlbnRyYWwgcG9p
bnQgYmVoaW5kIGZyb3plbiBiZWZvcmUuCj4gPj4gPj4KPiA+PiA+PiBBcmUgdGhlcmUgbW9yZSBj
b25jcmV0ZSBkZWZpbml0aW9ucyBzb21ld2hlcmU/Cj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gUmVn
YXJkcywKPiA+IEF0aXNoCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
