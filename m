Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E31AFD88D6
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQyandrEw8GLAir/BBQInaEp3VzY0Faxx3N28qFF3ZQ=; b=2PDtY1ZFuwbH3G
	Y+3jtgWq1O3QcOW5SgHInyCBubVkQXJh7g1g99iVHk1FXC3gtwH48N1m7xpTDeLQ5bWY7/j9bJyAv
	AFYoX6aJr1lHzMRJd7AdwrhirjDLHhiGP+tcYNpL6nk6iro7jKbHs5ZnnpzzNqkBJToVwJaPkvJZd
	CXpItOeuktjlog2otPnzBknhq6K8A1ZfOU/L54xmNUY0fDN4KvIk2frWg4Es/D5Lxi7GCpv0EU0+d
	OZFX/I6ihCEQwkRWsAgBq8xUZiX7Z9YKd1SXMdNEDPl2lpFoSZxqBwEXhTBak+BlSaOY4ayXiLMBR
	R1N35177khjWF2xkxhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08z6-0000000AWyo-2xX0;
	Wed, 11 Mar 2026 02:07:40 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08z4-0000000AWwL-0TZA
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 02:07:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-662c6aca253so2397213a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 19:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773194855; cv=none;
        d=google.com; s=arc-20240605;
        b=eo7Don3p4vXYOLPAJhZ2wgH8gsNWgqQfi23YcUrbMYYuJPHxcXEgpOpIPt7rWOMCS1
         hvRkxRXASfnSwh5+4B3inGM+fln1mnqHB6F1dlqMOfxWRdNiYpaBLNTj8Bc+BO8npHjH
         atmHAj+cKKGoDXI1uOcrpuXNPwXYw8r6TOOlOSh4OO7yoIMt1IBXbvwB89Y6iVTHM4u5
         JB9U7+0rALVB6HBRBHIlu+dnBy54bgaWwQ5muxSXf2BTgsmJAjxqAfHkBFu8NsTuRaSJ
         wef+U7+G4V86uqBCXfVcMueX66Fna76BYJw7jSUF4JnrYx1Gh8Qsw5KxZX1LtxhAAO6P
         TgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=osL7BfoGljEtoOv4wJUCaGWHR5To+g3stySY9kuzjOQ=;
        fh=T56LqHCL02M6xpWyjYSwGx206+xy37rSFQTnEuij6CY=;
        b=A9AW96VjQyTqJcidXA3+NnwEqWMtNQMuL2KEN8w7QL6UvOPUciye8sariQ2SS0u7Qt
         ro3iuQjemWJN1dK+pQrA9juvabUxaefPMr+gCZvYA9bsr8twegMfVLIcoubLCTqKfSJg
         GKw9NlO+QvWEhc/GI7aYeNdutxj7PTGcKf4oppCYPkv8iwsINsDn/OFx68q5EMhYpu/Q
         pfSUmrbd0nIAqOZFPKCi5k07CUuNRT1COlsGpj94CvHiCtgAL1tImVgXU5iRYS9QSruX
         qBEG8R5sY0Eiv4UIqbr0QFq0BRe7GcK/WFiXYQwwVTe4jSX4EL0XIPECitiuIpkW/SNg
         3J2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773194855; x=1773799655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osL7BfoGljEtoOv4wJUCaGWHR5To+g3stySY9kuzjOQ=;
        b=NzQa9UvogYwKL1nEucTvSmW2gyKtifPLSrnyN5iaSoQzUBsMYTPYqmoj3RG0PBPST2
         SsqqXe2CgvpJCZShbovF6KYrV+nCCGBm2eXP9AP/YGoxkjDTtuEQ0Gq5BGRbO5Ts07k3
         dfD3xgVAE6ZHH6iYmjmcfnFaWyuDsAxrIleN3N0bGvl1+0pWuIfxx2j1Z44KnCf1UlYL
         s6Rj4IHS18r0A8jf5CmuBAHUCGJXYcuz8vUeWbntSKyoXOEbb1mYsahEudNEppHc/jC7
         +iFCJ4aX15RSuME8Dv5Omzwd2yTbnRkI3pTWx4HuHv5jSG834PwtdML4/hUlvS3aDMeg
         NYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194855; x=1773799655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osL7BfoGljEtoOv4wJUCaGWHR5To+g3stySY9kuzjOQ=;
        b=O06FzyH9AQzZ9Z9Ji2o17/2wzQMiKPu9+67jWOPesDd0KP9oOGfnP6Tij3VyvnlatA
         6BcLUVX1Qr++Tc3P/riCS6LxzPVGXE4aaJvda8yIeU/kNjDLe2wPrq+vs5X+Ag5wE32u
         tgIRQlAHreDdHyZJb3/LBK79j7Bq6rtRaY80tsngRFawG1qPoRS4RtmkdCfd2kFaGbGA
         yQD25VShG+s9+N7P2PCKVw12a9qFzN4VAtOVWuSXEZr0DL2dFOpg+a9biIw39XynmuNU
         9HQzLCEVOGADmxqHnSD99165qfQKUVOu/iImiDZXu2obpV/wpQWtTPPKppJM5pw+TUpI
         xIag==
X-Forwarded-Encrypted: i=1; AJvYcCV40S128wB3wMjq4XBxiASIq5tGHAepV4sXK0UX0UE/zTgAhb8rsGfzCuZ6ZA9Tj1xdf6Gv0F0q2fjqAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9tAh1L+AK7KtqhMjefrXfL5ODaMMAI9AINVyipNeBrMM/8wYx
	u0nNMw43Yftd3eIxTKTEMZ2y8N8SO+fupq0DYuIEsY0FihDZ3TBO7bBepElTxJPCxCHZD8w0+Is
	QNjLW0oXKy98BCRsG/j6bnE4uCgpD0HM/Z9xy3rsaTg==
X-Gm-Gg: ATEYQzwaj9LvNMDAeVTNb+6QDMv5g06LsqnJppkLqwsdJOMz0JsXPhibSQ6jckGd/Nx
	vKBwNMGHvEZqX6Bid1Mq3XbQ7BEqjaNVtSem82JM9E0A25KDgySvM6Q2AXhbXaBUZ5ERcb85ij6
	gQBQPFturjFsro3xcK0Psv3bUYHWAwV0/nukEcG4CdWFlX1MzjhDrXz2//m9nBvZMxv/DczUhpX
	JKC399VCrXqsq6a73Em47mal+Y76VMXC8FSFvNW1pdl8t/dcph9DtbU2KmFsWGOYU04QFh5xqqm
	w3yiHCBkBQ==
X-Received: by 2002:a05:6402:234d:b0:65b:f20d:763d with SMTP id
 4fb4d7f45d1cf-663194d08a4mr351957a12.9.1773194855256; Tue, 10 Mar 2026
 19:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260306080622.3864367-1-zong.li@sifive.com> <aa9gG-gh7eZdx-pW@debug.ba.rivosinc.com>
In-Reply-To: <aa9gG-gh7eZdx-pW@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 11 Mar 2026 10:07:23 +0800
X-Gm-Features: AaiRm50fZZdc0AUoM2pNjEwqdfvjW0SRMdip4tjTj6jYHbHY2pfMEDd3bPRvzXk
Message-ID: <CANXhq0pGuDkeGRQ3P3aTp1O6gF3fEFNZzoZOZoPn060gE0XRRg@mail.gmail.com>
Subject: Re: [PATCH] riscv: cif: clear CFI lock status in start_thread
To: Deepak Gupta <debug@rivosinc.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_190738_218236_A01A8400 
X-CRM114-Status: GOOD (  19.23  )
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

LgoKT24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgODowNOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWFyIDA2LCAyMDI2IGF0IDEyOjA2OjIy
QU0gLTA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPldoZW4gbGliYyBsb2NrcyB0aGUgQ0ZJIHN0YXR1
cyB0aHJvdWdoIHRoZSBmb2xsb3dpbmcgcHJjdGw6Cj4gPiAtIFBSX0xPQ0tfU0hBRE9XX1NUQUNL
X1NUQVRVUwo+ID4gLSBQUl9MT0NLX0lORElSX0JSX0xQX1NUQVRVUwo+ID4KPiA+QSBuZXdseSBm
b3JrZWQgcHJvY2VzcyB3aWxsIGluaGVyaXQgdGhlIGxvY2sgc3RhdHVzIGlmIGl0Cj4KPiBNaWdo
dCB3YW50IHVzZSB0ZXJtICJuZXdseSBleGVjZCBhZGRyZXNzIHNwYWNlIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lgo+Cj4gbGliYyBzaG91bGRuJ3QgYmUgZW5hYmxpbmcgY2ZpIGFmdGVyIGBmb3Jr
YCBvciBgY2xvbmVgLgo+IGBleGVjKmAgYXJlIHRoZSBvbmVzIHdoaWNoIHNob3VsZCBoYXZlIHRo
ZWlyIHNsYXRlIGNsZWFuIGFuZCBpdCBzZWVtcwo+IGxpa2UgYGxvY2tgIHN0YXR1cyB3YXMgbm90
IHNldCB0byBjbGVhciB3aGljaCB0aGlzIHBhdGNoIGZpeGVzLiBUaGFua3MKPiBmb3IgdGhhdC4K
ClRoYW5rcyBmb3IgY2xhcmlmeWluZyBpdC4gSSB3aWxsIHJlLXdyaXRlIHRoZSBtZXNzYWdlIGlu
IHRoZSBuZXh0IHZlcnNpb24uCgo+Cj4gPmRvZXMgbm90IGNsZWFyIHRoZSBsb2NrIGJpdHMuIFNp
bmNlIHRoZSBsb2NrIGJpdHMgcmVtYWluCj4gPnNldCwgbGliYyB3aWxsIGxhdGVyIGZhaWwgdG8g
ZW5hYmxlIHRoZSBsYW5kaW5nIHBhZCBhbmQKPiA+c2hhZG93IHN0YWNrLgo+ID4KPiA+U2lnbmVk
LW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4tLS0KPiA+IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oIHwgIDggKysrKy0tLS0KPiA+IGFyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Nlc3MuYyAgICAgIHwgIDIgKysKPiA+IGFyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmku
YyAgICAgIHwgMTIgKysrKysrLS0tLS0tCj4gPiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4KPiA+ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdXNlcmNmaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmgKPiA+
aW5kZXggZjdmYTlkNjAyYWFlLi5jNGFiMTEzNzgzMDggMTAwNjQ0Cj4gPi0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oCj4gPisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dXNlcmNmaS5oCj4gPkBAIC0zOSw3ICszOSw3IEBAIHZvaWQgc2V0X2FjdGl2ZV9zaHN0ayhzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgc2hzdGtfYWRkcik7Cj4gPiBib29s
IGlzX3Noc3RrX2VuYWJsZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiA+IGJvb2wgaXNf
c2hzdGtfbG9ja2VkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayk7Cj4gPiBib29sIGlzX3Noc3Rr
X2FsbG9jYXRlZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spOwo+ID4tdm9pZCBzZXRfc2hzdGtf
bG9jayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spOwo+ID4rdm9pZCBzZXRfc2hzdGtfbG9jayhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgbG9jayk7Cj4gPiB2b2lkIHNldF9zaHN0a19z
dGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGVuYWJsZSk7Cj4gPiB1bnNpZ25l
ZCBsb25nIGdldF9hY3RpdmVfc2hzdGsoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiA+IGlu
dCByZXN0b3JlX3VzZXJfc2hzdGsoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHVuc2lnbmVkIGxv
bmcgc2hzdGtfcHRyKTsKPiA+QEAgLTQ3LDcgKzQ3LDcgQEAgaW50IHNhdmVfdXNlcl9zaHN0ayhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgdW5zaWduZWQgbG9uZyAqc2F2ZWRfc2hzdGtfcHRyKTsK
PiA+IGJvb2wgaXNfaW5kaXJfbHBfZW5hYmxlZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spOwo+
ID4gYm9vbCBpc19pbmRpcl9scF9sb2NrZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiA+
IHZvaWQgc2V0X2luZGlyX2xwX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wg
ZW5hYmxlKTsKPiA+LXZvaWQgc2V0X2luZGlyX2xwX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrKTsKPiA+K3ZvaWQgc2V0X2luZGlyX2xwX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNr
LCBib29sIGxvY2spOwo+ID4KPiA+ICNkZWZpbmUgUFJfU0hBRE9XX1NUQUNLX1NVUFBPUlRFRF9T
VEFUVVNfTUFTSyAoUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSkKPiA+Cj4gPkBAIC02OSw3ICs2OSw3
IEBAIHZvaWQgc2V0X2luZGlyX2xwX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiA+
Cj4gPiAjZGVmaW5lIGlzX3Noc3RrX2FsbG9jYXRlZCh0YXNrKSBmYWxzZQo+ID4KPiA+LSNkZWZp
bmUgc2V0X3Noc3RrX2xvY2sodGFzaykgZG8ge30gd2hpbGUgKDApCj4gPisjZGVmaW5lIHNldF9z
aHN0a19sb2NrKHRhc2ssIGxvY2spIGRvIHt9IHdoaWxlICgwKQo+ID4KPiA+ICNkZWZpbmUgc2V0
X3Noc3RrX3N0YXR1cyh0YXNrLCBlbmFibGUpIGRvIHt9IHdoaWxlICgwKQo+ID4KPiA+QEAgLTc5
LDcgKzc5LDcgQEAgdm9pZCBzZXRfaW5kaXJfbHBfbG9jayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRh
c2spOwo+ID4KPiA+ICNkZWZpbmUgc2V0X2luZGlyX2xwX3N0YXR1cyh0YXNrLCBlbmFibGUpIGRv
IHt9IHdoaWxlICgwKQo+ID4KPiA+LSNkZWZpbmUgc2V0X2luZGlyX2xwX2xvY2sodGFzaykgZG8g
e30gd2hpbGUgKDApCj4gPisjZGVmaW5lIHNldF9pbmRpcl9scF9sb2NrKHRhc2ssIGxvY2spIGRv
IHt9IHdoaWxlICgwKQo+ID4KPiA+ICNkZWZpbmUgcmVzdG9yZV91c2VyX3Noc3RrKHRzaywgc2hz
dGtfcHRyKSAtRUlOVkFMCj4gPgo+ID5kaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
Y2Vzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPmluZGV4IDZiMzY0ODI1NmEw
Zi4uMzZiYWM0NzhmMWUxIDEwMDY0NAo+ID4tLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNz
LmMKPiA+KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPkBAIC0xNjQsMTEgKzE2
NCwxMyBAQCB2b2lkIHN0YXJ0X3RocmVhZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQg
bG9uZyBwYywKPiA+ICAgICAgIHNldF9zaHN0a19zdGF0dXMoY3VycmVudCwgZmFsc2UpOwo+ID4g
ICAgICAgc2V0X3Noc3RrX2Jhc2UoY3VycmVudCwgMCwgMCk7Cj4gPiAgICAgICBzZXRfYWN0aXZl
X3Noc3RrKGN1cnJlbnQsIDApOwo+ID4rICAgICAgc2V0X3Noc3RrX2xvY2soY3VycmVudCwgZmFs
c2UpOwo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIGRpc2FibGUgaW5kaXJlY3QgYnJhbmNoIHRy
YWNraW5nIG9uIGV4ZWMuCj4gPiAgICAgICAgKiBsaWJjIHdpbGwgZW5hYmxlIGl0IGxhdGVyIHZp
YSBwcmN0bC4KPiA+ICAgICAgICAqLwo+ID4gICAgICAgc2V0X2luZGlyX2xwX3N0YXR1cyhjdXJy
ZW50LCBmYWxzZSk7Cj4gPisgICAgICBzZXRfaW5kaXJfbHBfbG9jayhjdXJyZW50LCBmYWxzZSk7
Cj4KPiBQZXJoYXBzIHNldCBzdGF0dXMgZmllbGQgdG8gemVybyB0byBwcmV2ZW50IGFueSBmdXR1
cmUgcmVncmVzc2lvbiB0b28uCgpJIGRvbuKAmXQgY29tcGxldGVseSB1bmRlcnN0YW5kIHRoaXMu
IEkgdGhpbmsgeW914oCZcmUgbm90IHJlZmVycmluZyB0bwpzZXRfc2hzdGtfc3RhdHVzIG9yIHNl
dF9pbmRpcl9scF9zdGF0dXMsIGJlY2F1c2UgeW91IGhhdmUgY2xlYW5lZAp0aGVtLiBDb3VsZCB5
b3UgY2xhcmlmeSB3aGF0IHRoZSBzdGF0dXMgcmVmZXJzIHRvPyBUaGFua3MKCj4KPiA+Cj4gPiAj
aWZkZWYgQ09ORklHXzY0QklUCj4gPiAgICAgICByZWdzLT5zdGF0dXMgJj0gflNSX1VYTDsKPiA+
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3VzZXJjZmkuYwo+ID5pbmRleCBhODUzMGU2YWZiMWUuLmExMDFlMzE3ZmU1ZSAxMDA2NDQK
PiA+LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gPisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3VzZXJjZmkuYwo+ID5AQCAtNzQsOSArNzQsOSBAQCB2b2lkIHNldF9zaHN0a19zdGF0
dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGVuYWJsZSkKPiA+ICAgICAgIGNzcl93
cml0ZShDU1JfRU5WQ0ZHLCB0YXNrLT50aHJlYWQuZW52Y2ZnKTsKPiA+IH0KPiA+Cj4gPi12b2lk
IHNldF9zaHN0a19sb2NrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKPiA+K3ZvaWQgc2V0X3No
c3RrX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGxvY2spCj4gPiB7Cj4gPi0g
ICAgICB0YXNrLT50aHJlYWRfaW5mby51c2VyX2NmaV9zdGF0ZS51YmNmaV9sb2NrZWQgPSAxOwo+
ID4rICAgICAgdGFzay0+dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUudWJjZmlfbG9ja2VkID0g
bG9jazsKPiA+IH0KPiA+Cj4gPiBib29sIGlzX2luZGlyX2xwX2VuYWJsZWQoc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrKQo+ID5AQCAtMTA0LDkgKzEwNCw5IEBAIHZvaWQgc2V0X2luZGlyX2xwX3N0
YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgZW5hYmxlKQo+ID4gICAgICAgY3Ny
X3dyaXRlKENTUl9FTlZDRkcsIHRhc2stPnRocmVhZC5lbnZjZmcpOwo+ID4gfQo+ID4KPiA+LXZv
aWQgc2V0X2luZGlyX2xwX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ID4rdm9pZCBz
ZXRfaW5kaXJfbHBfbG9jayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgbG9jaykKPiA+
IHsKPiA+LSAgICAgIHRhc2stPnRocmVhZF9pbmZvLnVzZXJfY2ZpX3N0YXRlLnVmY2ZpX2xvY2tl
ZCA9IDE7Cj4gPisgICAgICB0YXNrLT50aHJlYWRfaW5mby51c2VyX2NmaV9zdGF0ZS51ZmNmaV9s
b2NrZWQgPSBsb2NrOwo+ID4gfQo+ID4gLyoKPiA+ICAqIElmIHNpemUgaXMgMCwgdGhlbiB0byBi
ZSBjb21wYXRpYmxlIHdpdGggcmVndWxhciBzdGFjayB3ZSB3YW50IGl0IHRvIGJlIGFzIGJpZyBh
cwo+ID5AQCAtNDUyLDcgKzQ1Miw3IEBAIGludCBhcmNoX2xvY2tfc2hhZG93X3N0YWNrX3N0YXR1
cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssCj4gPiAgICAgICAgICAgIWlzX3Noc3RrX2VuYWJs
ZWQodGFzaykgfHwgYXJnICE9IDApCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4KPiA+LSAgICAgIHNldF9zaHN0a19sb2NrKHRhc2spOwo+ID4rICAgICAgc2V0X3Noc3RrX2xv
Y2sodGFzaywgdHJ1ZSk7Cj4gPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiB9Cj4gPkBAIC01MDIs
NyArNTAyLDcgQEAgaW50IGFyY2hfbG9ja19pbmRpcl9icl9scF9zdGF0dXMoc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrLAo+ID4gICAgICAgICAgICFpc19pbmRpcl9scF9lbmFibGVkKHRhc2spIHx8
IGFyZyAhPSAwKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPi0gICAg
ICBzZXRfaW5kaXJfbHBfbG9jayh0YXNrKTsKPiA+KyAgICAgIHNldF9pbmRpcl9scF9sb2NrKHRh
c2ssIHRydWUpOwo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4gfQo+ID4tLQo+ID4yLjQzLjcK
PiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
