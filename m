Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FDCCD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eexxdaiapSxVtuJr8CQujMplbGE3Wzb/xH3U+MMqbEU=; b=JbqD2coa0RDQBb
	QgaEIQnGEbJE55qNPLh1MtvGGUiVKUhJPH2qJ/PdcsQEV3aIhu8PDw92FtpGHaoe9/Z3qVonSNzKU
	DjEr0/u/zrgTnOFroYN9JeLA+u2WoroKIZTaQpvXxK6RXSiCTE/tcKBd+OroUAr0rkHk8qO+QhL+h
	l1r+IfR6Ik2d197RZirEyV1NA+f9Gc6nqP3owNcvSNsTo6Dd/Jg60lOAZ6+hyAlHy33FpRyWga+bq
	FKDhLbTPWxhfYqkvKGMwdcpU3irWsWoZ/JxieHN5R0svp/x69HtR2UXS/h+Lep2+B3sZimG2tDGKA
	jpPW+9E7EDvRhPvv/sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtXW-00000008Zrm-2wEj;
	Fri, 15 May 2026 14:29:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtXS-00000008Zqu-1FdN
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:29:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-bccd251d622so1038232566b.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855356; cv=none;
        d=google.com; s=arc-20240605;
        b=UI+GgpZWF/v+dWRdoOxDHtezKDr7hW6YpF7+weS2t5SwSk8IRKJKSkASlMgWaSCIfH
         fhhsUhFqsxUsayGvpnR/nlBF5ckznSit7Z+nScZtvw+9j8v6sdIt/M3Sqn11cgU/cMro
         YYl0PY5wAj6fi9TIVAq9gR18SuQTtv8GkpWQfDUlefDiN68G3DHoSCbMOfFGU8hRtMTq
         osPCnqmnDCEoLsdTphvTPmFV+uW8GgSPr+m+4YOw3KlEP/PIGwWXOwskbwiKJQkyTADp
         des1rF5MZANA8TbvkNEkKljDXRLYuxZtcyeC8Y+ZHPGngDGvfjFRnWGuhfengC28ZW9/
         WJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOWH8qQVPt22tmx61JYoYEomxWEbQj5qkteErrA0Nfc=;
        fh=3Dg0t00Mg3rT8/Sxjxl8g+42B/JcI2g/yAN54xridx8=;
        b=PxxiFq3vwhBfT2r5yqjnaFgrn1120Wn11digElZXkWUDIMBeN2uBwrT2bi7YOrnfVL
         L0SYCc/2sCPF5J3vnQZb48XqEIWViwtciyozEo+lFekg4CxN1DjipiZTu8i/EUFqEgPo
         JUIY+dDz9mm9gSio8SD5eO8eVBtSstgqnmSkuqj6JqPLNcazxPOK8xHjyZ0z8Ke6ROSw
         L8uPU8GxV9rgIPzWImWS81aKb0W3MF8w/KY5Uy0LT/51dpVb07AGS+MaoPhFCC0PPkPd
         BVsvj/0ysVPxWEkLl6oJJJAB3/Au4Gg3Us6lpbifdk5T9Qp2yvFJXuEhNvbe39jnbaPC
         yNgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778855356; x=1779460156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWH8qQVPt22tmx61JYoYEomxWEbQj5qkteErrA0Nfc=;
        b=mBJ2o/fsylg5ZoX/L0rzDynU9kGUJRG5blvn3zAvjF5I4/ED9DxrJ55PvrDZN8TKyo
         ADjhhD8GVWZ+fM77975i+XgYUWrkL4Cs2vHsr/DD7HGZ5Q7QNro9c/VaEvLbuAuMitvo
         wWjxCy+in5PjXPsqJKntT3YVmkCZL8aEgL85jGyWRE1+HStUsfm03kCBwN/R8U2ZX7kt
         FPxs0npqnqIq6X9YPchJ1VrZqlB1ub20+JdOiSO3f8x61JCYjxstn69Dc7aOAwOY+MCf
         cmaY0N9st8uMFAbwghuTm6GUo1jC3q33pYQm3/Ah/uibHIdxoby60iHZKxXEkW2SlLb/
         s/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855356; x=1779460156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOWH8qQVPt22tmx61JYoYEomxWEbQj5qkteErrA0Nfc=;
        b=oawY1i509TTnZR99JkeqiyEnnaxqC1zmeQa6GdT8HtLx+SvIxj3n7KIGcpWWz7IoFZ
         X21w7oI5H0UQ0owNH5YB+6SAnPKCSjyYR4U0tklYtEEXQtH/kNpqqqddXGRDGG9E7HgA
         PFPkIBZO16EGvaLOlFtfRMFdVbnYvHLzTayiuQ9kY5lq2Hcyf34tFGH/wnME/MvLe6gB
         mLGlXNeFe8XarEcf6ianq2esYzIQnF0by25+87VaPqPErBJQYGu2+nMa4Ylh04uo+VST
         s6Vc8hBWP1anod1X6dyvm15o/p8RWwLEViw7/nJr4BjSfn3YkWK1ifEHQlNi9J+tCn/B
         0SKA==
X-Forwarded-Encrypted: i=1; AFNElJ/T211FlFrX8LOyq8T7lQG39JzcS10SJGVFPiNlzAWiMTPXzJAQj6RM0g8WvztNaQDntT/SHGzqdrWnEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeoYcbFiu9QOyJwi1y1+tWtSjBxrixoENMYUqmPPz+ZaMtLdWZ
	82MJxymeQuzjAlDW6NfKrYcslPAomEOYuIVkfs7fw7WrND5hm5UNZb4k2TTtdyUX4Hb4AWnGDiq
	F9irfVp280L99v7axp1vOj8QG6p6qTqqKU9Z1WGYR0g==
X-Gm-Gg: Acq92OHWOHkadJ47bRHVmOEv0beyiDFnlilmooh4IA/GOe+ery8JX4ylXKWlyyga5rs
	lPXCywjn0rrXXdLmDDl8QKZdySsKnR31u7x9XGzVsfDbpJpGY7oUDYvb5pznmzSOspbIUWga0sH
	Si9BAxTKWrQPMlEndieYpTku+Os4YQ3gc0LIGyzD2OV+IVEX3p1V2jr8P7WjI+VTX4iKcd3s+dr
	JwT/paYdcymmXTcVp9MXMUltwHjbVo/jg8DWE8Ln49MKkEqDD11uCO5MdQBLmJ79DVtHTkPZyi4
	X3ajuP6TeQ==
X-Received: by 2002:a17:907:86a2:b0:ba0:d58b:6045 with SMTP id
 a640c23a62f3a-bd51797a648mr263918666b.27.1778855356200; Fri, 15 May 2026
 07:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260514075036.1432352-1-zong.li@sifive.com> <20260514095605.2c7d8761@pumpkin>
 <CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com> <20260515102411.4d3e868a@pumpkin>
In-Reply-To: <20260515102411.4d3e868a@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 15 May 2026 22:29:05 +0800
X-Gm-Features: AVHnY4KFvJbJlbTY2B-b7oG29hdvbI8oMtimXbSLORHoUu4mZM3cfwuiidgZAK4
Message-ID: <CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_072918_363646_809F112D 
X-CRM114-Status: GOOD (  25.41  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgNToyNOKAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIDE1IE1heSAyMDI2IDExOjQy
OjQ1ICswODAwCj4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gT24g
VGh1LCBNYXkgMTQsIDIwMjYgYXQgNDo1NuKAr1BNIERhdmlkIExhaWdodAo+IC4uCj4gPiA+IEkg
YWxzbyBkb24ndCB1bmRlcnN0YW5kIHRoZSByYXRpb25hbCBmb3IganVzdCAvMiBhbmQgdGhlIDJH
IHVwcGVyIGxpbWl0Lgo+ID4gPiBZb3UgbmVlZCA1MTIgbmVzdGVkIGZ1bmN0aW9uIGNhbGxzIHRv
IGV2ZW4gdXNlIDRrLgo+ID4gPiBUaGF0IHdvdWxkIGhhdmUgdG8gYmUgcXVpdGUgZGVlcCByZWN1
cnNpb24uCj4gPgo+ID4gRHVyaW5nIHRoZSBkaXNjdXNzaW9ucyBhYm91dCB0aGUgQVJNIEdDUyB2
MyBzZXJpZXMsIGNvbW11bml0eSBwb2ludGVkCj4gPiBvdXQgdGhhdCBhIDRHIHNoYWRvdyBzdGFj
ayBtaWdodCBiZSB0b28gbGFyZ2UuIFRoaXMgc2l6ZSBpcyBoYXJkIHRvCj4gPiBzdXBwb3J0IGlu
IG1lbW9yeS1jb25zdHJhaW5lZCBlbnZpcm9ubWVudHMgbGlrZSBBbmRyb2lkLiBIb3dldmVyLCB0
aGUKPiA+IHNpemUgY2Fubm90IGJlIHRvbyBzbWFsbCBlaXRoZXIsIG9yIHdlIG1pZ2h0IGZhY2Ug
c3RhY2sgb3ZlcmZsb3cKPiA+IGlzc3Vlcy4gQXQgdGhhdCB0aW1lLCBhIHBlcmZlY3Qgc2l6ZSB3
YXMgbm90IGRlY2lkZWQuCj4KPiBJdCBpcyBvbmx5IFZBIG5vdCByZWFsIG1lbW9yeSBzbyBzaG91
bGRuJ3QgbWFrZSBtdWNoIGRpZmZlcmVuY2UgdG8gbWVtb3J5Cj4gdXNlIChleGNlcHQgZm9yIG5v
bW11IHdoZXJlIHRoZSBhY3R1YWwgbWVtb3J5IGhhcyB0byBiZSBhbGxvY2F0ZWQpLgo+CgpZb3Ug
cmFpc2UgYSB2YWxpZCBwb2ludCB0aGF0IHNoYWRvdyBzdGFja3MgYXJlIHByaW1hcmlseSBhIFZB
CmFsbG9jYXRpb24uIEhvd2V2ZXIsIGluIExpbnV4LCB0aGUgbWVtb3J5IG92ZXJjb21taXQgbWVj
aGFuaXNtIGNyZWF0ZXMKYSBwcmFjdGljYWwgbGluayBiZXR3ZWVuIFZBIGFsbG9jYXRpb24gYW5k
IHBoeXNpY2FsIG1lbW9yeSBjYXBhY2l0eS4KQXMgSSBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLCBtZW1vcnkgYWxsb2NhdGlvbiB3aWxsIGZhaWwgd2hlbgp0aGUgb3ZlcmNvbW1pdCBt
b2RlIGlzIHNldCB0byBPVkVSQ09NTUlUX0dVRVNTIG9yIE9WRVJDT01NSVRfTkVWRVIuCgpJbiBf
X3ZtX2Vub3VnaF9tZW1vcnk6CiAgICAgICAgaWYgKHBhZ2VzID4gdG90YWxyYW1fcGFnZXMoKSAr
IHRvdGFsX3N3YXBfcGFnZXMpCiAgICAgICAgICAgICAgICBnb3RvIGVycm9yOwoKTWFueSBwYWdl
IHJlcXVlc3RzIGZvciBWQSB3aWxsIGZhaWwgaWYgdGhlIHJlcXVlc3RlZCBzaXplIGV4Y2VlZHMg
dGhlCnN5c3RlbSdzIHRvdGFsIFJBTSBwbHVzIFN3YXAuIE9uIG1lbW9yeS1jb25zdHJhaW5lZCBz
eXN0ZW1zLAphbGxvY2F0aW5nIGEgbWFzc2l2ZSA0R0Igc2hhZG93IHN0YWNrIHBlciB0aHJlYWQg
d291bGQgaW1tZWRpYXRlbHkKdHJpZ2dlciB0aGlzIGVycm9yLgoKPiBCdXQgMzJiaXQgcHJvZ3Jh
bXMgd2l0aCBsb3RzIG9mIHRocmVhZHMgY2FuIHJ1biBvdXQgb2YgVkEuCj4gSW5jcmVhc2luZyB0
aGUgc3RhY2sgVkEgc2l6ZSBieSA1MCUgbWlnaHQgZXZlbiBnaXZlIHByb2JsZW1zIGZvciA2NGJp
dAo+IHByb2dyYW1zIC0gaWYgdGhleSBhcmUgYWxyZWFkeSByZWR1Y2luZyB0aGUgdGhyZWFkIHN0
YWNrIHNpemUgYXZvaWQKPiBydW5uaW5nIG91dCBvZiBWQS4KPgo+IEkndmUgbm90IGNoZWNrZWQs
IGJ1dCBwdGhyZWFkX2F0dHJfc2V0c3RhY2tzaXplKCkgc2V0cyBhIGxpbWl0IGZvciB0aGUKPiB0
aHJlYWQgc3RhY2sgc2l6ZSAod2hpY2ggd291bGQgb3RoZXJ3aXNlIGRlZmF1bHQgc28gcmxpbWl0
KFNUQUNLKSkuCj4gSSBkb24ndCBiZWxpZXZlIGl0IHNob3VsZCB1cGRhdGUgdGhlIHJsaW1pdCB2
YWx1ZSBpdHNlbGYuCj4gSW4gd2hpY2ggY2FzZSB5b3UgYXJlIHVzaW5nIHRoZSB3cm9uZyBzaXpl
Lgo+Cj4gQnV0IGZvciBhIHRocmVhZCB3aXRoIGEgdmVyeSByZWR1Y2VkIHN0YWNrIChzYXkgMTI4
aykgeW91IHByb2JhYmx5IG9ubHkKPiBuZWVkIDEgcGFnZSBvZiBzaGFkb3cgc3RhY2ssIGFueSBt
b3JlIGNvdWxkIGVhc2lseSBsZWFkIHRvIHJ1bm5pbmcgb3V0Cj4gb2YgVkEuCj4KPiAtLSBEYXZp
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
