Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7358C5519F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 01:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF46206C0
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 01:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FtbEb5Ib";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="S7JcPDrd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF46206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UAFmootaZFESlHiI9+mSXeGNT/0mKTTS35Z6fBc7Ezw=; b=FtbEb5IbLnVs4HA/OT8QqBGJH
	NA6VCxiyIFm0fHcwGs797arZ5mrp/ihMZ+bWpLN7YEoLc1Zv5Ds1HDOKskvWZL56OBCzlunw2ojeD
	bHrw/9x0xvm0sqh/9k8eWUd9Jpt4jhUWFl3n31EzvqGgBT77VuqpUFNkoLInUWxwbR+oxkSzU6dgb
	VvVETNb4Ki65Hnelu5C6oeoeAk06OPvMBb8jV4RK6j2A82Q+XKQBvQTwIGbdNawlVizDfJgGRLCeq
	BAXz2gtPUv7yfanxcqwl9bD/iJC0WzuCvjZrWrG9KW9/yPy9nfWk0o1ShSpkk+BK3Bzdk2tsR9BaE
	rfXRi6BHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdOK5-0000ds-CP; Fri, 13 Nov 2020 01:56:21 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdOK1-0000dY-IY
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 01:56:19 +0000
Received: by mail-io1-xd34.google.com with SMTP id r12so8228004iot.4
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 17:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LYTEj+st6Uq7mcpLQ4z/J7LqJMAeKHIEMUYOsPOmMIc=;
 b=S7JcPDrdp7R5PqNCipGX2SISE/O1Z3YJHbWicdOmdG2gI+DlWTDrNcuhQr0dm76H2H
 vWco6CVU9JbT4EqD3P0tr1GocOvphVdJg+VCdNmftz7rKYz5wnWBSlIkT4F+oQbzaxDv
 LM6+uaF08kqx5RmPkYNDYitr5osRgLG0fIDFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LYTEj+st6Uq7mcpLQ4z/J7LqJMAeKHIEMUYOsPOmMIc=;
 b=d88n0hs+BoY2vh+76vdfA+z6EazgfdVr0pX5+qhxqCx9BanDQ3j+k37JvQP7F9adUp
 EGgDqcdrhinMzvDqK8aUt/Xix27P1BihKAkEGtEudC0pxH5i6sAhp0sIdvkKZ/pl2QG2
 I8lzy6T3yXw7+1yIyoutpLYvQeVydXEALz9KRABwSQWiFtlId2agP/Pqi+3O21ZqIH33
 5sU+dP4IyEv+QsQ4GMgVLycYxlADF9AnYGfleua/W5eivInRbvdX1oxLzixohayclMx1
 QHy349alUNyCH0MGKOSJ2Ls61Z5nD2z9ymnG7/p++ewr/RNn2dl8mdGX0Vk77ivMQxVK
 DIiQ==
X-Gm-Message-State: AOAM533uh/qPznyMhFoT6BXAjxHg0UVCFpCammcSVCC2vXkWYIYM6GKP
 2likpOMSNp5U7BMGYGaXNJ8Oa+68lahqUsZAGYlr
X-Google-Smtp-Source: ABdhPJxNFtK/6fKIoXGWhogUvchYFAc6nA1rSaxCfDGNa1Ro8oNlRv/7fN2Vwp806oSJxrG4ESgH8Hb6nQq6fvne1cA=
X-Received: by 2002:a05:6602:2d93:: with SMTP id
 k19mr85694iow.51.1605232574959; 
 Thu, 12 Nov 2020 17:56:14 -0800 (PST)
MIME-Version: 1.0
References: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
In-Reply-To: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 12 Nov 2020 17:56:03 -0800
Message-ID: <CAOnJCUJ-NGhQMZcEpgFzHuzHs-=E3Ea65Tfu_v5gcDfZPkuvRA@mail.gmail.com>
Subject: Re: Status for RISC-V Summit
To: Drew Fustini <pdp7pdp7@gmail.com>, arun.thomas@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_205617_920811_947F3FED 
X-CRM114-Status: GOOD (  12.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KyBBcnVuIGFzIGhlIGhhcyBhIHRhbGsgb24gdGhlIFJJU0MtViBzb2Z0d2FyZSBzdGF0ZSBvZiB0
aGUgdW5pb24gWzFdIGFzIHdlbGwuCgpbMV0gaHR0cHM6Ly90bXQua25lY3QzNjUuY29tL3Jpc2Mt
di1zdW1taXQvYWdlbmRhLzEvP3NlYXJjaElucHV0PSZzdHJlYW09MTMjc29mdHdhcmUtdG9vbHNf
cmlzYy12LXNvZnR3YXJlLXN0YXRlLW9mLXRoZS11bmlvbl8xLTMwcG0KCk9uIFRodSwgTm92IDEy
LCAyMDIwIGF0IDQ6NDcgQU0gRHJldyBGdXN0aW5pIDxwZHA3cGRwN0BnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gSGVsbG8sIEkgYW0gdXBkYXRpbmcgbXkgRW1iZWRkZWQgTGludXggQ29uZmVyZW5jZSB0
YWxrIGFib3V0IExpbnV4IG9uCj4gUklTQy1WIGZvciB0aGUgUklTQy1WIFN1bW1pdCBpbiBEZWNl
bWJlciBbMV0uICBJIHdhbnQgdG8gaGF2ZSBhIHNsaWRlCj4gb3IgdHdvIHRoYXQgY2FwdHVyZXMg
dGhlIHJlY2VudCBhY2NvbXBsaXNobWVudHMgZm9yIFJJU0MtViBMaW51eAo+IHN1cHBvcnQgYW5k
IHdoYXQgaXMgb24gdGhlIGhvcml6b24uCj4KPiBJIGN1cnJlbnQgaGF2ZSBsaXN0ZWQgYXMgcmVj
ZW50IGFuZCBvbmdvaW5nIHdvcms6Cj4KPiAtIEtWTSAoQW51cCBQYXRlbC9BdGlzaCBQYXRyYSkK
PiAgIFt3YWl0aW5nIG9uIHJhdGlmaWNhdGlvbiBvZiBIeXBlcnZpc29yIHNwZWNdCj4gLSBlQlBG
IEpJVCAoQmrDtnJuIFTDtnBlbCkKPiAtICBLR0RCIHN1cHBvcnQgKFZpbmNlbnQgQ2hlbikKPiAt
ICBrZXhlYy9rZHVtcCBzdXBwb3J0IChOaWNrIEtvc3NpZmlkaXMpCj4gLSBrcHJvYmVzL2tyZXRw
cm9iZXMgKEd1byBSZW4pCj4gLSBnZW5lcmljIHZEU08gc3VwcG9ydAo+IC0gc3lzemNhbGxlciBz
dXBwb3J0Cj4gLSBidWlsZCB3aXRoIExMVk0vY2xhbmcKPgo+IEkgd291bGQgcmVhbGx5IGFwcHJl
Y2lhdGUgYW55IGZlZWRiYWNrIG9uIHdoYXQgSSBzaG91bGQgYWRkLCBtb2RpZnkgb3IgcmVtb3Zl
Lgo+Cj4gVGhhbmsgeW91LAo+IERyZXcKPgo+IFsxXSBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9w
cmVzZW50YXRpb24vZC8xbUQteVBkLXpCLUROWFZUVE5XR2QyMkVadVNpOV80aGNKR0hZenJEUUxq
VS9lZGl0P3VzcD1zaGFyaW5nCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
