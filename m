Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE8CD6ACCD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0Ws1d699K97JeV6BzFlEtozKIrY1PNB/bkm1hUDeO/M=; b=pJvs0Z8U4m+vVrv4VltsSMgodj
	w9WEhRebdXrjikfiRHi/vImtAm7WZMeIyFbgsBMRtRdX238AyjPi9eZA/jffs7DaFotBXw7siDTyp
	tMM4CHPWVACMVwXYGfdO8Fk/ZFYsHJBS0JsJQfCX3grh0h6IfRQC/FwgE6H1rYvyVPrgwMoHR9ujX
	4EkFEclrjRkvvXLAcTlKqDmD2Bl51psQuZyYE9XnEtxNr+kPJc8widSdgOM7Gm8wncuKCcl8BVygT
	Req4qTZwx+h93JVoi+cYKL3CXjZkQ+WQz9UgXcGRDExK8DJjNwi6ep5bsDB3KzjkJ9kmtwRHbvGnR
	+YubRjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHue-0000000DDVi-1hRn;
	Wed, 27 Nov 2024 13:17:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHuc-0000000DDUd-0KAF
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 13:16:59 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CCC613F84F
	for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1732713415;
	bh=iwaW/TBd1DZvqORzmh0XX/eem1/Tsj5JT9Lyugc/UYw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mIPPFrLVNvQMYtwcKU+9ENc/9Wnj08UoIMRESwWgS7LIVOmQu/NrlQh4wS2uS+BWk
	 mJRurwsfRyY/3RU20i6Y0FFJUFTENhMqn/Cbo98XqJgK82LnbQyQbnTmv1nmWybmMS
	 7dArNIetSayUuQ1bHWow3tPwGJGgTlRsgfc+WNq/1x5Olo+zWtjTFsPOPZ8gQC4ZUH
	 HuGmUvbhoqKErIUdsv+2UsSDHtxYIRJViNAzXzB6bdh9HqKTUE5aOns12UzwOetQ5Y
	 UnViJ5WsNQYYsyw30sJeJN9E5HHfvNK4foWmTUIjYWLVGUABLCfKunJU8WdqVEmp54
	 NXDBxjhTQRA1Q==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5f06787ea2eso5203252eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 05:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713414; x=1733318214;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iwaW/TBd1DZvqORzmh0XX/eem1/Tsj5JT9Lyugc/UYw=;
        b=G97KkyjY1sGXGR+HMtMCJ4eKLfF12SbYvXWxH8m0fxhXmWe+mgNI96v/QGEMpJy8XO
         AZf2tuAT6vkMteUAW9HmBbVgSKQ/Qeuj75ADe6rrDEve2Us4sUBNuzv+gamRKo26dCY3
         SnmNYtcHMGvoWiq5sJOE1bHIJF9TwczyA0QiIRTcYm5VslLhDjUHfKOUx4Rudq8Jd5h/
         FSr9b+D1VVwP78SzW5Eq2sUn5vBgX7Ir1mPOUCgj28f2ZjnXdk7tt2Ucob3Q+YzEgp3N
         O3EJwNcaJLEtAsxJ5MAjlF1TXznJP3NOp5gvZ9EOZZTb/Ak4yo467hJZwPx2jMdxGgqO
         tDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW203Ko6XmKf/GUJU/n7BWt761G79JolalEp+wPqk0l4/K8SKiBwI4xz2oPTz3VX+R3ZEDj9PHPGlaSwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/VELjKbfVVbpY6EFpxkXmQZXFpDxV0PVbCQC8kDLtXP3c3cXB
	6ltNFBr+/BI+PphXMLFIvg1w0NO/yBEs4OTB2++xiY0pMOEXWsFy71dWPvxNy7yTmCRjnf3XBnR
	fXrWalXbrrMzOQwsn+MUjvrByDWRKQwsEzj6NTvAOR+TNG3JiJcUvUvxozXpI3T96J6naz2tOIv
	fMT44btN0htyf3tBRQC55/O66DCiKyNtKCy3hRqnq/fpP3pO1HfuAh5+X9
X-Gm-Gg: ASbGnctyx7NkQHGKHUVBitmf08gFGDUg3eNJeQ2kr9icgc+0d5PINsvaDenSk4l0N3S
	wN/X2MEtDDKzkKYXn/duKs7Jdy0rf/cbM1zFSLKx1p0dLH34CoBQb5UUoXHs=
X-Received: by 2002:a05:6820:990:b0:5f1:d944:a1da with SMTP id 006d021491bc7-5f20a260420mr2574572eaf.8.1732713414619;
        Wed, 27 Nov 2024 05:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgvI4G/R8CkY5gCpIzdZnZ+b6xMkQcpKRM2Isgs7llekCi3qkMcr148jobX6y9XRGTw+h7uqaqlCHpgS0GqDo=
X-Received: by 2002:a05:6820:990:b0:5f1:d944:a1da with SMTP id
 006d021491bc7-5f20a260420mr2574547eaf.8.1732713414302; Wed, 27 Nov 2024
 05:16:54 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Nov 2024 05:16:53 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <eb06c8e0-ebda-47b9-94f6-6e6eca21097d@freeshell.de>
References: <20241126075740.17419-1-e@freeshell.de> <CAJM55Z9wWCaS+FxZ=Gg_RfXXafNEJZC1zHZoPWQ2Y9QYDf9OyA@mail.gmail.com>
 <eb06c8e0-ebda-47b9-94f6-6e6eca21097d@freeshell.de>
Mime-Version: 1.0
Date: Wed, 27 Nov 2024 05:16:53 -0800
Message-ID: <CAJM55Z_Cy2aAfWY-6csKBuv3AJ44h4fCCvJ0ZSbLOYcKw6g=bA@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable
 usb0 host function
To: E Shattow <e@freeshell.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, minda.chen@starfivetech.com, 
	hal.feng@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_051658_379210_AE91D022 
X-CRM114-Status: GOOD (  42.99  )
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

RSBTaGF0dG93IHdyb3RlOgo+IEhpIEVtaWwsIHRoYW5rcyBmb3IgdGFraW5nIHRpbWUgdG8gcmV2
aWV3IQo+Cj4gQWRkZWQgQ0M6IE1pbmRhIENoZW4sIEhhbCBGZW5nCj4KPiBQbGVhc2UgTWluZGEg
YW5kIEhhbCBjYW4geW91IGZvbGxvdy11cCBvbiBFbWlsJ3MgY29tbWVudHMgYXMgd2VsbD8KPgo+
IE9uIDExLzI3LzI0IDAzOjAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+IEUgU2hh
dHRvdyB3cm90ZToKPiA+PiBFbmFibGUgaG9zdCBtb2RlIEpINzExMCBvbi1jaGlwIFVTQiBmb3Ig
TWlsay1WIE1hcnMgYnkgc2V0dGluZyBob3N0IG1vZGUKPiA+PiBhbmQgY29ubmVjdCB2YnVzIHBp
bmN0cmwuCj4gPj4KPiA+PiBUaGlzIGZ1bmN0aW9uYWxpdHkgZGVwZW5kcyBvbiBzZXR0aW5nIHRo
ZSBVU0Igb3Zlci1jdXJyZW50IHJlZ2lzdGVyIHRvCj4gPj4gZGlzYWJsZSBhdCBib290bG9hZGVy
IHBoYXNlLCBmb3IgZXhhbXBsZSBVLUJvb3Q6Cj4gPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjQxMDEyMDMxMzI4LjQyNjgtNi1taW5kYS5jaGVu
QHN0YXJmaXZldGVjaC5jb20vCj4gPiBIaSBFLAo+ID4KPiA+IElkZWFsbHkgdGhlIEpINzExMCBw
aW5jdHJsIGRyaXZlciB3b3VsZCBiZSB1cGRhdGVkLCBzbyBMaW51eCBjYW4gZG8gdGhpcyBpdHNl
bGYKPiA+IGFuZCBkb2Vzbid0IG5lZWQgdG8gcmVseSBvbiB1LWJvb3QgZG9pbmcgaXQuIEkgYWxy
ZWFkeSBhc2tlZCBmb3IgdGhpcyBoZXJlOgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9DQUpNNTVaLStDeGRlYmNuNE1MWGZRZE9WaHg0YzJTUSt6TUg4Y2puLVlxMzV4TzhnMEFA
bWFpbC5nbWFpbC5jb20vCj4KPiBZZXMsIEkgYWdyZWUsIGFuZCBMaW51eCBpcyBub3QgdGhlIG9u
bHkgY29uc3VtZXIgb2YgZGV2aWNldHJlZS4gSSB3b3VsZAo+IGxpa2UgVVNCIGZ1bmN0aW9uIHRv
IHdvcmsgZm9yIHVzZXJzIG9mIExpbnV4IGFuZCBVLUJvb3Qgb24gdGhlc2UgYm9hcmRzCj4gYnkg
Y29weWluZyB3aGF0IHRoZSB2ZW5kb3IgQm9hcmQgU3VwcG9ydCBQYWNrYWdlIGRvZXMgd2hhdCBp
cyBzaGlwcGVkCj4gd2l0aCB0aGUgcHJvZHVjdHMuIElmIGl0IGlzIG1vcmUgaW4tZGVwdGggdGhh
biB0aGlzIEkgd2lsbCBkZWZlciB0byBIYWwKPiBvciBNaW5kYS4KPgo+Cj4gRm9yIHNvbWUgd2lk
ZXIgY29udGV4dCwgdXBzdHJlYW0gVS1Cb290IGlzIGFib3V0IHRvIGFkb3B0IHRoZQo+IGR0LXJl
YmFzaW5nIHZpYSBIYWwncyBPRl9VUFNUUkVBTSBmb3IgSkg3MTEwIGJvYXJkcyBzZXJpZXMgYW5k
IHRoZW4gYWxzbwo+IHRoZXJlIGlzIGEgcGF0Y2ggc2V0IGZyb20gTWluZGEgQ2hlbiB0byBhZGQg
dGhlIG9uLWNoaXAgSkg3MTEwIFVTQgo+IHN1cHBvcnQgdG8gVS1Cb290LCBhbmQgc28gdGhlbiBh
bmQgdGhlcmUgaXQgd2lsbCBkZXBlbmQgb24gdGhlc2UgZHRzCj4gY2hhbmdlcy4gSWYgeW91IGhh
dmUgTWlsay1WIE1hcnMgdGhlbiBhbHJlYWR5IHRoZXJlIGFyZSB0aHJlZSBvZiBmb3VyCj4gVVNC
LUEgcmVjZXB0YWNsZSBwb3J0cyB3aGljaCBhcmUgZnVuY3Rpb25hbCBvbiBQQ0llLWNvbm5lY3Rl
ZCBWTDgwNSBVU0IKPiBjaGlwc2V0Lgo+Cj4gPgo+ID4+IElmIHRoZSBvdmVyLWN1cnJlbnQgcmVn
aXN0ZXIgaXMgbm90IHByZXBhcmVkIGZvciB1cyB0aGVuIHRoZSByZXN1bHQgaXMgbm8KPiA+PiBj
aGFuZ2UgaW4gZnVuY3Rpb25hbCBvdXRjb21lIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkOyB0aGVy
ZSBpcyBhbiBlcnJvcgo+ID4+IHZpc2libGUgdG8gdGhlIHVzZXIgYW5kIHRoaXMgYWRkaXRpb25h
bCB1c2IgY29uZmlndXJhdGlvbiBmYWlscyAoc2FtZSBhcwo+ID4+IGl0IGlzIG5vdykuIE9uIE1p
bGstViBNYXJzIHdpdGggZm91ciBVU0ItQSBwb3J0cyB0aGlzIGFwcGxpZXMgdG8gb25lIG9mIHRo
ZQo+ID4+IHBvcnRzIGFuZCB0aGUgcmVtYWluaW5nIHRocmVlIFZMODA1LWNvbm5lY3RlZCBwb3J0
cyB2aWEgUENJZSBhcmUgbm90IGNoYW5nZWQuCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaGVzLiBJ
IGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgd2hlbiB5b3Ugd3JpdGUgIm5vIGNoYW5nZSBpbgo+ID4g
ZnVuY3Rpb25hbCBvdXRjb21lIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkIi4gVGhlIFVTQi1DIHBv
cnQgaXMgYWxyZWFkeQo+ID4gY29uZmlndXJlZCBhcyBhIHBlcmlwaGVyYWwsIGFuZCBJIGp1c3Qg
dHJpZWQgc2V0dGluZyB1cCBhbiBldGhlcm5ldCBnYWRnZXQgb24KPiA+IG15IFZGMiBydW5uaW5n
IDYuMTIgYW5kIHRoYXQgd29ya3MgcXVpdGUgd2VsbC4gRG9lcyBpdCBub3Qgd29yayBvbiB0aGUg
TWlsay1WCj4gPiBNYXJzIGJvYXJkPyBJZiBpdCBkb2VzIHRoZW4gdGhlc2UgcGF0Y2hlcyB3b3Vs
ZCBicmVhayB0aGF0IGZ1bmN0aW9uYWxpdHkuCj4gPgo+ID4gSGVyZSBpcyB0aGUgc2NyaXB0IEkg
dXNlZCBmb3IgdGhhdDoKPiA+IGh0dHBzOi8vcGFzdGUuYy1uZXQub3JnL0JyYXZvTG9uZWx5Cj4g
Pgo+ID4gQXQgdGhlIHZlcnkgbGVhc3QgeW91J2xsIG5lZWQgdG8gZXhwbGFpbiBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UgaXRzZWxmIHdoeQo+ID4gY2hhbmdpbmcgdGhlIFVTQi1DIHBvcnQgZnJvbSBw
ZXJpcGhlcmFsIG1vZGUgdG8gaG9zdCBtb2RlIGlzIE9LLiBCdXQgaWRlYWxseQo+ID4gbWF5YmUg
eW91IGNvdWxkIG1ha2UgaXQgd29yayBpbiBPVEcgbW9kZSwgc28gdXNlcnNwYWNlIGNhbiBjaG9v
c2UgaG93IHRoZXkgd2FudAo+ID4gdG8gdXNlIHRoZSBwb3J0LiBUaGUgc2FtZSBnb2VzIGZvciB0
aGUgUElORTY0IGJvYXJkIHRvby4KPiA+Cj4gPiAvRW1pbAo+Cj4gVVNCLUMgcG9ydCBvbiBNYXJz
IGlzIG5vdCB3aXJlZCBmb3IgZGF0YSBoZXJlLCB0aGF0IGlzIG9ubHkgdHJ1ZSBmb3IKPiBWaXNp
b25GaXZlMi4gSWYgdGhlIHVzZXIgd2FudHMgdG8gdXNlIHRoZWlyIFVTQi1BIHJlY2VwdGFjbGUg
YXMgT1RHIHBvcnQKPiBJIHdpbGwgbm90IG9iamVjdCB0byBhIGZ1dHVyZSBpbXByb3ZlbWVudCwg
YnV0IGhlcmUgd2Ugd2FudCB0aGUgYmFzaWMKPiBleHBlY3RhdGlvbnMgb2YgdXNlcnMgY292ZXJl
ZCB0aGF0IHRoZXkgc2hvdWxkIGhhdmUgZm91ciB3b3JraW5nIFVTQi1BCj4gcmVjZXB0YWNsZSBw
b3J0cyBpbiBVLUJvb3QgKGFuZCBwb3NzaWJseSBpbiBMaW51eCwgZGVwZW5kaW5nIG9uIHRoZQo+
IG92ZXJjdXJyZW50IHJlZ2lzdGVyIHdoZXJldmVyIGl0IGlzIHNldCkuIFRoaXMgaXMgd2hhdCBJ
IGFtIG1lYW5pbmcsCj4gdGhlcmUgbWF5IGJlIHNvbWVib2R5IHVzaW5nIGEgbWFsZS1tYWxlIFVT
Qi1BIFVTQi1BIGNhYmxlIGZvciBPVEcgYnV0Cj4gbW9yZSBsaWtlbHkgaXMgdGhhdCBwZW9wbGUg
anVzdCB3YW50IHRvIHBsdWcgaW4gVVNCIHBlcmlwaGVyYWxzIHRvIGhvc3QKPiBwb3J0cyBhbmQg
dXNlIHRoZWlyIG1vdXNlIC8ga2V5Ym9hcmQgLyBmbGFzaCBtZW1vcnksIEkgdGhpbmsuCgpZb3Un
cmUgcmlnaHQsIHNvcnJ5LiBJJ20gc28gdXNlZCB0byB0aGUgSkg3MTEwIGJvYXJkcyBiZWluZyBz
aW1pbGFyLCBidXQgdGhpcwppcyBhY3R1YWxseSBvbmUgb2YgdGhlIGZldyBkaWZmZXJlbmNlcyBi
ZXR3ZWVuIHRoZSBNYXJzIGFuZCBWRjIgdGhhdCB3YXMgbm90CmNhdWdodCB3aGVuIHRoZSBNYXJz
IGR0cyB3YXMgZmlyc3QgdXBzdHJlYW1lZC4KClllcywgd2l0aCA0IHNpbWlsYXIgVVNCLUEgcG9y
dHMgeW91J2QgZGVmaW5pdGVseSBleHBlY3QgYWxsIG9mIHRoZW0gdG8gd29yayBpbgpob3N0IG1v
ZGUuIFdpdGggYW4gZXhwbGFuYXRpb24gbGlrZSB0aGUgYWJvdmUgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIEkgKG5vdykKdGhpbmsgeW91ciBjaGFuZ2VzIG1ha2VzIHNlbnNlLgoKVGhhbmtzIQovRW1p
bAoKPgo+Cj4gVGhlcmUgaXMgbm8gVVNCLUMgcG9ydCBvbiBTdGFyNjQuCj4KPiA+Cj4gPj4gQ2hh
bmdlcyBzaW5jZSB2NDoKPiA+PiAgIC0gUmViYXNlIG9uIGxhdGVzdCBtYXN0ZXIKPiA+Pgo+ID4+
IENoYW5nZXMgc2luY2UgdjM6Cj4gPj4gICAtIFJlYmFzZSBvbiBsaW51eC1uZXh0L21hc3Rlcgo+
ID4+ICAgLSB1c2UgdGFicyBmb3IgY29kZSBpbmRlbnQKPiA+Pgo+ID4+IENoYW5nZXMgc2luY2Ug
djI6Cj4gPj4gICAtIFJlYmFzZSBvbiA2LjEyCj4gPj4KPiA+PiBFIFNoYXR0b3cgKDEpOgo+ID4+
ICAgIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMTAtbWlsa3YtbWFyczogZW5hYmxlIHVzYjAg
aG9zdCBmdW5jdGlvbgo+ID4+Cj4gPj4gICAuLi4vYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1p
bGt2LW1hcnMuZHRzICAgIHwgMTggKysrKysrKysrKysrKysrKystCj4gPj4gICAxIGZpbGUgY2hh
bmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gLS0KPiA+PiAy
LjQ1LjIKPiA+Pgo+IFRoYW5rcyBhZ2FpbiBFbWlsLsKgIC1FCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
