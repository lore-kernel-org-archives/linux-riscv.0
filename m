Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C73CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrP1jEdnz7b8Iy2cXqhPQb4Nl3kxh0kuuBv4o+JWBbE=; b=WJgndU9K+0x1Z/
	j8sosUMEbEZj0L8jaubNzMhJ9u+WVRwdONv4pUsPipDL/J6A3fowzYoz+9yP6OlW9WbH9z58ir72F
	B+yU5tpjsjk1p19raBmBtrly4e8HQFdRFE9/jrqN9fBdxmpnIEdrFj3WXF8oxG2qXQm4cGIqmaMXv
	dPWN6pTV6Aa0P14QynGaS+T0pkn54rno2BfGCNjYfqqPF20/U+oyZz0a3XRFFdZXzwSvKPvEIEnHr
	goZvLF+l/8zheZQsPQ+IQvu5DcQb2Tj3KmyMeMMVcMCuKaMthypoMb7wdXhQkY2W8op0TPVN97oAE
	K/VCFTKo0xcrYS1MgHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgKV-0000000EVtp-0Vfq;
	Wed, 03 Jun 2026 07:47:59 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgKR-0000000EVtI-45lU
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:47:57 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e6dcad6018so1052583a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472875; cv=none;
        d=google.com; s=arc-20240605;
        b=gaaFtdADD7FPR1okXdhJqEvW7RO/+fFJq2mhj5w8HmbBRmBt+L7fZ2XLiR532FEpVe
         NF1iGyCmTOAQYWruUjj3NedXn6lNQtbEnwvGko0W315Z5Jljb86yF706fKg+Zfh0bJei
         45eTcQXzjYBXgt+Lnox+gScVi5rcsY09RznlVbbChRlIzEYebUZomz75jC0Hxc3JX+/G
         kP4FLXgcAMJFVmcRnMUEjzU8X7uL1FhyZlcM5u5a3i6WtrYvz1rxqz4OOPYFGqV3udLC
         TbskawPK+FMmx11lpNrA2NT/qOufqwpORDfR6YrbHhqP8yGbCX/T9zCEyGMMG2hza+R9
         exwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+k5HhKFnGY0kgu/yR0YkW0s1E5Nuyc0mTfUNO8wHHg=;
        fh=5CkKWI50wfen+qKR5AbtCivT4ebrc+U9PfQw6h+PrOQ=;
        b=FrWZmDxRY2e8kfG/7LchKv3y+DY2Ji3V0Vwc1cR/JM0PRInBawKqOhgTjDmwsIdSvg
         gn8vOTM2fdKy8xKZ4VNGB3kWOC2JdSEev2Qp5X8RgZ6qog1uH5G8hfNb9jOI+s5Bf60S
         vdLxJUP6lpN4VEfURb/oVXadQ6dT7a1Q7nU7ajH/rFHTs80ttyBr684v2igJQHsJ97qB
         B6ftikFmfUELU8GhOl/VsGkfMxkRUcwqvOs+bTR4UXuOGQcoL5SY7X1fdClOFBC61uJx
         LryYWdtBgav7GqJULk6T/G25lH+i98CO3tVIvYIDBxYfQLhycgKRtFIzLwDtKYQIvwTG
         +zAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780472875; x=1781077675; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+k5HhKFnGY0kgu/yR0YkW0s1E5Nuyc0mTfUNO8wHHg=;
        b=aZVIvwjFPPXepWfOP4jNuuxjQ9e48jQiaTT9TOCJVeG3YbbTL1zgq4/jXvuY5PH+XY
         0sd+SRw6wdgqGlUHlcYD2b61r3XXcxUXLNSynHavtODMrw1xZ2GqfLnWrA2XESR36QD9
         kgZ2s6AGu6qbOqt+oYS2O57mImzOnmdUUgGCLNpoYCurTGLH3TZ7X/dcwI+F7L2B5oj5
         mx/Xt3TnfIcc7jAl/aPW3Om20kdLi9cSe6xk0KoeTni1oA9MJlAJ1KPWDOzY4Osq+Mmm
         ztSe5ubeCEi+m0+txeMAXvAgkL7Ytx3v244//RD8yUcOaKsv/u+rxQgkrGMiSAScOMHv
         M2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472875; x=1781077675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+k5HhKFnGY0kgu/yR0YkW0s1E5Nuyc0mTfUNO8wHHg=;
        b=DdgRG5A8sEGhOW3LalkW16bKFa65NuXcpPbnUceP4zJgyKT6qwYNjT9+tK8TIJZneE
         00Xug+PewOGDeQtRs2/ZUIm0veDbw1JTo19GeLI0gW0hzIRYbCGAQbl8Pa7XYFb/Q2kl
         iEbym3j9Dq5qm5nKwVR+CIpQvNeiiv3CRofJ+6i9APdD8GkDnNZ/qARaFQ3nMccNhAvB
         9KLeQRxLKYQxWqWNG49uC47ZsiPZWMNmf5FvsfjB8ee+hUvcisw5L6vZlsN3g+5/IWbF
         cGGsJbtHKtL/3kYyeK55HYGeLCwGS5Gu2qjKrMMMlHnHGO4oi4pllUryM5KHE8/Od4P+
         cwgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dHisGK/01/UcUXc3kIQblQSiqmTzNK9WMCzm9fzTxtqDKHxPmXOmZV3okPhkU5yoxfqGv1lVi+MGcQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxElNyBf+EefXUDWf6D6TTpatmb7atb/Z5DmCnAIVzRhYEJ1lFM
	UR2MKn5dmJVUMMUx6Q/OwQx4Zo4bhn8f8j0AIPUf0QPqwg9m4DPeY/kSj7+Ke0WMff0pdrLTYH2
	BZ8y6QhFYLEW6V/OBdrZDelf22VpVCCP+VHsY4EwRRQ==
X-Gm-Gg: Acq92OExS7/rrGPLf5Kgy8z2L6YPgFyuRvCYyoLDkGCnYTnio4nkeo5sr0uS7wmCs7V
	UwtRTdeEMynmXAN9EY1b7GNsVwmWPr5s6pgk1lDVETUNGTJhfTADAwHJV3hYTNvsT+L1g828phq
	85ClImFLZYzWcIxIbHWu6iLuTp1B1TZCtIT+/Je950hjueE7a4RVXOruYWJXlJkUssgdbwifAkz
	uNdvtmcQ4fLnArc8Qs6DCMrjpIBr7RgN+yeDGB1otWNerokmJtgG0zGXhcUkPeW5lr8OyV2vpR+
	AB82QxNHK681HSNpf1fIDs6kLPGVb3Tztyi6AKnEenm5Gh2YljxOvvckjvHeC3lnfLxN9RPNqA8
	jMkLyHCIwstmuwcBU7jib4PBbjcXd2OPOKi/xkg==
X-Received: by 2002:a4a:d742:0:b0:69e:3e6b:c05 with SMTP id
 006d021491bc7-69e480d703emr947479eaf.57.1780472874785; Wed, 03 Jun 2026
 00:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260603074222.593243-1-joel@jms.id.au> <20260603074222.593243-2-joel@jms.id.au>
In-Reply-To: <20260603074222.593243-2-joel@jms.id.au>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:17:43 +0530
X-Gm-Features: AVHnY4JfStX4mReWrm-Zrl_ALhOyuCAG6AKst28Q6jY_1MMSdONlNPi3BurP8HE
Message-ID: <CAAhSdy0VgZd+7x0j5CZTj-9D6n4=UehzKZKp0nzTBpmuJESqeg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004756_040765_115F1B3D 
X-CRM114-Status: GOOD (  11.54  )
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjEy4oCvUE0gSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4gd3JvdGU6Cj4KPiBBZGQgY29tcGF0aWJsZSBmb3IgQVBMSUMgaW4gVGVuc3RvcnJlbnQg
QXRsYW50aXMgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtl
cm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwgICAgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMu
eWFtbAo+IGluZGV4IDA3MTgwNzE0NDRkMi4uZDRlMTc4NjFlZGE0IDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNj
dixhcGxpYy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwKPiBAQCAtMjksNiArMjksNyBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgICAtIGVudW06Cj4gICAgICAgICAgICAtIHFlbXUsYXBsaWMKPiAg
ICAgICAgICAgIC0gc3BhY2VtaXQsazMtYXBsaWMKPiArICAgICAgICAgIC0gdGVuc3RvcnJlbnQs
YXRsYW50aXMtYXBsaWMKPiAgICAgICAgLSBjb25zdDogcmlzY3YsYXBsaWMKPgo+ICAgIHJlZzoK
PiAtLQo+IDIuNDcuMwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
