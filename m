Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5328FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 14:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFFC20857
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 14:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2qiwgZR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vGeiYyvm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFFC20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vbzNY5o6hTXv6RUetXZvTw60rnyFDL8soJ1vUm6HHc=; b=I2qiwgZRYPINAc
	q9VFb2x6v2PAxnxT7/QnsVhsfFnx7L6V154IOTvyz/cwYNTQ7183VRPRyQMl3m12arpPNfXacmVtz
	KG5PVg4qVLUbwutt4ijps705dRNUvDikUUfsZyPJrQrHAXYCgU7xGHmni4PycHphYke9+Jh5wna+w
	pYKc7Rz729NGMqrqCKz6CxuGdyW+WiKYFbelrqM82xcocw9QZQHuE+RqMuDKe614VFm0rZ/RWKk00
	rTMU4vXTsdKke+v8vIy1BpFLbhyACtronE3YSsg7mm/S54uz2gyXfEBYzimOQ5E3Yt9yIwJ93uJmr
	lTLPtZpShOBRLnXjLZhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3MEY-0003eY-75; Mon, 11 Mar 2019 14:48:54 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3MEV-0003eB-8e
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 14:48:53 +0000
Received: by mail-qt1-x833.google.com with SMTP id t28so1664107qte.6
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jbWBTDRCZw1MWpirJTZ5g3GUqlv8ugV/VjcqJOeTdvw=;
 b=vGeiYyvmj9BOc+gGjYbx6DRl1cf9DiepM6JHDrK/lOktYmMREYu9vYTMuMlJoNSYSO
 As28hIx+v1Cx2soEKBW41mqlLPCtnEbIvnQvAnKBd0oMAUlUAtLT5qu2rpPAdPIl3Od3
 7JCco6/WRmx/IEMXIJEAFDkh5ZxxNoSbcSOOw72PjyIHNxQ7mh1lPeTL3aZXKDwt2Ndj
 PJ7lNa3D0kUkTlgnz8z75z39f3dNhnXiPRUMLmLsmNcX7nVCWeSHaiYD6nxhu4nTgdOf
 nQgTO+XtDF52HxzaQfCtM9HlCcf9YDW1CeGoTIHLz98WvRgYmfq0gelSG+53E/SmAyrQ
 eX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jbWBTDRCZw1MWpirJTZ5g3GUqlv8ugV/VjcqJOeTdvw=;
 b=IZ8oOYuUVlHUdvTM4pUkjNRQCwXsmA25QqDVaVdk74J/eK6v+EUY02eK5ItzXRtKDC
 kkzDOAPJJBkn9dBp3l2GiG9VRCNxUCDFJoH347Ik8len3JFOlOpjhG5e14Kd7JMjniMI
 yE1wpfFaTEbxhqrKoeGyqUjjFuh72swpJ5PYsKHCGjHSkX9c+7WwTrbbhM3TUWt+63w5
 LrS3gIbcnOWFjDuItWzEv+hf92Av+6MWx+H53eRXLcsWYeJB+xjGYOBkSyy2idp8KeAD
 eJ74zbIf4P93YMvbEAkoUf0wp73K9MZ/Ck3PuoS/Q7C47AvSlNCABbNiUEISUKIM/Zfy
 o24Q==
X-Gm-Message-State: APjAAAVpP4fC0EWT+kircO4HVNxkLpGo1m75DKSfqVNoPoOSba7OBIhu
 6veL8eicV0B41mJsqfWV8HCvwZvJdD5lISg9GqE=
X-Google-Smtp-Source: APXvYqwatM5P3TVYRKqTl7Vytl/4MHeJnEYG0fKrTJBUxlAjiiSDVo25MtTCWHjAy+Mdp05u1YxfSo+ielRSBgkUY8k=
X-Received: by 2002:ac8:2dca:: with SMTP id q10mr25687441qta.187.1552315729292; 
 Mon, 11 Mar 2019 07:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
In-Reply-To: <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 11 Mar 2019 15:48:37 +0100
Message-ID: <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_074851_330344_4363ABB7 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Christoph Lameter <cl@linux.com>,
 Paul Walmsley <paul@pwsan.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBNYXIgMjAxOSBhdCAxNDoyMiwgUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZp
dmUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMDcgTWFyIDIwMTkgMjM6MTc6NTIgUFNUICgtMDgw
MCksIGJqb3JuLnRvcGVsQGdtYWlsLmNvbSB3cm90ZToKPiA+IE9uIEZyaSwgMjIgRmViIDIwMTkg
YXQgMjA6NTYsIENocmlzdG9waGVyIExhbWV0ZXIgPGNsQGxpbnV4LmNvbT4gd3JvdGU6Cj4gPj4K
PiA+PiBPbiBGcmksIDIyIEZlYiAyMDE5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4+Cj4gPj4g
PiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIHJlZ2lzdGVyIG5lZWRzIHRvIGJlIHJlZmVyZW5j
ZWQgYnkgdGhlIGFtbwo+ID4+ID4gPiBpbnN0cnVjdGlvbi4gQ2FuIGFtb2FkZCBpbmNyZW1lbnQg
YW4gYWRkcmVzcyByZWxhdGl2ZSB0byBhIHNjcmF0Y2gKPiA+PiA+ID4gcmVnaXN0ZXI/Cj4gPj4g
PiA+Cj4gPj4gPgo+ID4+ID4gSXQgY2Fubm90LiBTbywgd2UnbGwgZW5kIHVwIHdpdGggKGF0IGxl
YXN0KSBhIHByZWVtcHQgZGlzYWJsZWQgcmVnaW9uLi4uCj4gPj4KPiA+PiBJZiB3ZSBuZWVkIHRv
IGRvIHRoYXQgdGhlbiB3ZSBhbHJlYWR5IGhhdmUgc28gbXVjaCBvdmVyaGVhZCBkdWUgdG8gdGhh
dAo+ID4+IHByb2Nlc3NpbmcgdGhhdCBpdCBtYXkgbm90IGJlIHdvcnRod2hpbGUuIGxjL3NjIG92
ZXJoZWFkIGlzIG1pbm9yIGNvbXBhcmVkCj4gPj4gdG8gc3dpdGNoaW5nIHByZWVtcHQgb24gYW5k
IG9mZiBJIHRoaW5rLgo+ID4+Cj4gPgo+ID4gSSdsbCBkbyBzb21lIG1lYXN1cmVtZW50cy4gVGhl
IGdlbmVyaWMgb25lIGRpc2FibGVzIGludGVycnVwdHMsIHNvIGEKPiA+IHByZWVtcHRfe2Rpcyxl
bn1hYmxlIGFuZCBBTU8gZGFuY2UgbWlnaHQgKHdlbGwsIHdlJ2xsIHNlZSA6LSkpIGJlCj4gPiBi
ZXR0ZXIgc3RpbGwuIEkgZGVmaW5pdGVseSBzZWUgeW91ciBwb2ludHMgZnJvbSB0aGUgcHJlc2Vu
dGF0aW9uIG5vdy4KPgo+IFRoYW5rcyBhIGJ1bmNoISAgSSBmZWVsIGxpa2UgdGhlIGJlc3Qgb3B0
aW9uIGhlcmUgaXMgdG8ganVzdCB1c2UgdGhlIEFNT3MKPiB3aXRob3V0IGRpc2FibGluZyBwcmVl
bXB0aW9uIGFuZCBlbnN1cmluZyB0aGF0IGFsbCBvdGhlciBhY2Nlc3NlcyBhcmUgYXRvbWljCj4g
KHZpYSBBTU9zIG9yIExSL1NDKS4gIFRoZSBvbmx5IHJlYXNvbiBJIGNhbiBzZWUgdGhhdCB3b3Vs
ZG4ndCBiZSB0aGUgd2F5IHRvIGdvCj4gd291bGQgYmUgaWYgaXQgcmVxdWlyZXMgbm9uLWFyY2gg
bW9kaWZpY2F0aW9ucywgYXMgaWYgd2UgZ28gZG93biB0aGF0IHBhdGgKPiB3ZSdsbCBiZSBhYmxl
IHRvIGhhbmRsZSB0aGUgcGVyZm9ybWFuY2UgZWRnZSBjYXNlcyBpbiB0aGUgaW1wbGVtZW50YXRp
b24uCj4KCkhtbSwgeW91IG1lYW4gQU1PICp3aXRoKiBwcmVlbXB0X3tkaXMsZW59YWJsZSwgcmln
aHQ/IChObywgaW50ZXJydXB0CmRpc2FibGUsIG9ubHkgcHJlZW1wdGlvbi4pCgo+ID4gU2ltaWxh
ciB0byBBUk0sIFJJU0MtViBjYW5ub3QgdXNlIHByZWVtcHRfZW5hYmxlX25vX3Jlc2NoZWQgOi0o
LCBzbwo+ID4gd2UnbGwgaGF2ZSB0byBzZWUgd2hlcmUgd2UgZW5kIHVwIHBlcmZvcm1hbmNlLXdp
c2UuLi4KPgo+IEknbSBoYXZpbmcgbm8gbHVjayBmaWd1cmluZyBvdXQgd2h5IHdlIGNhbid0IHVz
ZSB0aGF0IChvciBldmVuIHdoZXJlIHdlJ2QgdXNlCj4gaXQpLiAgSSd2ZSBsb3N0IG11Y2ggb2Yg
dGhlIGNvbnRleHQgb2YgdGhlIHRocmVhZCwgc28gc29ycnkgaWYgdGhpcyBpcyBtZWFudCB0bwo+
IGJlIG9idmlvdXMsIGJ1dCBkbyB5b3UgbWluZCBleHBsYWluaW5nPyAgSWYgdGhlcmUncyBhIHRy
aWNrIHRoZW4gSSdkIGF0IGxlYXN0Cj4gbGlrZSB0byBrbm93IGFib3V0IGl0LCBldmVuIGlmIHdl
IGNhbid0IHRha2UgYWR2YW50YWdlIG9mIGl0IDopCgpJdCdzIG5vdCBhbGxvd2VkIGZvciBtb2R1
bGUgY29kZSB0byBjYWxsIHByZWVtcHRfZW5hYmxlX25vX3Jlc2NoZWQsCmFuZCB0aGlzX2NwdV8q
IGNhbiBiZSBmcm9tIGEgbW9kdWxlIGNvbnRleHQuIFRoYXQgbWVhbnMgdGhhdCB3ZSBuZWVkCihz
aW1pbGFyIHRvIEFSTSkgdG8gdXNlIHRoZSB2YW5pbGxhIHByZWVtcHRfZW5hYmxlLCB3aGljaCBt
aWdodAp0cmlnZ2VyIGEgcmVzY2hlZHVsZSBhbmQgaXMgbW9yZSBleHBlbnNpdmUuCgpTbywgSSds
bCB0YWtlIGEgc3RhYiBhdCBhIHBlcmNwdSBpbXBsIHRoYXQgdXNlcyBBTU8gYW5kCnByZWVtcHRf
ZGlzYWJsZS9lbmFibGUgcmVnaW9ucywgYW5kIGNvbXBhcmVzIHRoYXQgdG8gdGhlIGdlbmVyaWMg
b25lLgpNeSBndXQgZmVlbGluZyBzYXlzIHRoYXQgaXQgKnNob3VsZCogcGVyZm9ybSBiZXR0ZXIu
CgouLi5hbmQgbm93IEkgaGF2ZSBuZXcgc2hpbnkgSFcgdG8gdHJ5IGl0IG9uIGFzIHdlbGwuIDot
KQoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
