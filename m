Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33332C77B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuoyR3ayW/TutNG9cNBPTzdm2YZTTpO02ds8KzG7YI8=; b=saxBiJJGg9nW2O
	ktTXnr7H2jw30IJd9TaNgXMTqWiirG9O+f81k6qdcjQoSjGq5WSZzcSt/ZBq1kOhCtpBWs7MQq5Ps
	2s7g5gQCyAJlQBDhGxqcoYeFKjJFkSBXiFJUylm85dWD3P7P+UqQnW8Y/vfVjOQzPv3FlKtDC7QHv
	EkMe3NMyEhjSI2xfh00eq7qb/4ocfwikE5ousKMDnhpcetj/Hg8f8DIliT5uLnB5hN1Ik5fAcfi8H
	W6WVvDWYi1+IfxUmGbKAf/lAdJqhHthC5lcUx5Ja11Exu1DnhebEmfxyeTQRnrPQXquQ+HRPgtqvy
	j3LN+b++Nq0TWhoGBWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptulu-002Mwb-2G;
	Tue, 02 May 2023 18:30:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptulr-002Mvl-2I
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 18:30:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-24df161f84bso2179954a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 May 2023 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1683052237; x=1685644237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAQhEZIUqoIg0WnQQGu+sRHru4VeOPDcrcJOWO8mzYM=;
        b=QjM/2sf2VRIXbJlIzRfspouLF6OuZM13jytkJSo3lm29qCdTX3iy9oFho8ke4D04d6
         +fvfL7eI22XqKz84cG+LDpkPDr9sOlvKINQQLOdwgTfEkbG/w1xgS1i7TagtJipDNBIJ
         cntbWwggh4Gt23pMnbxqAxN0HmsNc+SUBdKZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683052237; x=1685644237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAQhEZIUqoIg0WnQQGu+sRHru4VeOPDcrcJOWO8mzYM=;
        b=Ux0vyC5SvNRaypnAHMeHXsHNxav0hZlZvvvyuETNNEXLfEWqhGO7hy41TPOLSYPSL7
         BFSDLsvcVApdSNaQABAHC3UWnmuHeu+tQPqK1Y6tNHrA2FQc8ow8HDVZyCCX2sve4CNJ
         AToL5d/WtuZiapU7B/BPT4cktv99M5ZpLGcv57sQaozoxqt6DPqtaujFh6oFLiiKc+K+
         ZVoSEeDjTVjIqqxJMGNo15g4SM4jjyfayrumDXrWrT5bGuRG/+UOZ4eVC5XWggLFGjbr
         RKXx7pn6cXOsaUqlKzOP3XPMJmPSR0q6hAsgsPDa+FH5OsPXiaA6OhKTSnIHK2VPCZKb
         ruAg==
X-Gm-Message-State: AC+VfDyIo8P+rt7pd/BnuenzlEOrpclcWS6tgVG0KTFtyys89ToUQXi0
	datX3Q8Q8Y6s2j16ZMHFDGc7uHh7y/lkNC1JYr/5w0WMFgSlFGQ=
X-Google-Smtp-Source: ACHHUZ44v9vV7G6qU3mFhTW1gmFkmFApbCz7Px2x6Eyp75qSLo/vyu2HGH0wO8TM3A3QDhzJO/gbUVlzC/Dwiaqo1rs=
X-Received: by 2002:a17:90a:195b:b0:23d:3549:82b7 with SMTP id
 27-20020a17090a195b00b0023d354982b7mr19010390pjh.46.1683052237457; Tue, 02
 May 2023 11:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-f3c5429e-4361-4068-b88c-fb528681881a@palmer-ri-x1c9a>
In-Reply-To: <mhng-f3c5429e-4361-4068-b88c-fb528681881a@palmer-ri-x1c9a>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 3 May 2023 00:00:26 +0530
Message-ID: <CAOnJCULybsPrygGe6easQUgFTXOSUFQ+nOPEYp57F-vkvhuHLQ@mail.gmail.com>
Subject: Re: Atish is looking at the excessive bouncing
To: Palmer Dabbelt <palmer@rivosinc.com>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_113040_004903_61A6CA29 
X-CRM114-Status: GOOD (  18.39  )
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCAxMToxN+KAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFdlJ3JlIG5vdCBzdXJlIHdoYXQgaGFwcGVuZWQsIGJ1
dCBpdCBsb29rcyBsaWtlIGEgbG90IG9mIHBlb3BsZSBhcmUKPiBnZXR0aW5nIGRyb3BwZWQgZnJv
bSB0aGUgbGlzdCBkdWUgdG8gZXhjZXNzaXZlIGJvdW5jZXMuICBTZWVtcyB0byBoYXZlCj4gc3Rh
cnRlZCByZWNlbnRseSwgcG9zc2libHkgdG9kYXkgb3Igb3ZlciB0aGUgd2Vla2VuZC4gIFdlJ3Zl
IGFsd2F5cyBoYWQKPiBzb21lIGlzc3VlcyB3aXRoIHRoZSBib3VuY2VzLCBidXQgdGhleSdyZSBh
IGxvdCB3b3JzZS4KPgoKQWxsIHRoZSBib3VuY2VzIGFyZSByZWxhdGVkIHRvIHRoZSBnbWFpbCBz
ZXJ2ZXIgd2hpY2ggdHJlYXRzIGdlbnVpbmUKcGF0Y2hlcyBhcyBib3VuY2UgbWVzc2FnZXMuCm1h
aWxtYW4gc2VydmVyIGRpc2FibGVzIHRoZSBtZW1iZXJzaGlwIGlmIGl0IGdldHMgdG9vIG1hbnkg
Ym91bmNlCmJhY2tzIGZyb20gdGhlIHJlY2lwaWVudC4KSXQgc2VlbXMgdGhlIG1haWxtYW4gc2Vy
dmVyIGNhbid0IGRvIG11Y2ggYWJvdXQgaXQgdW50aWwgdGhlIGlzc3VlIGlzCmZpeGVkIGluIHRo
ZSBnbWFpbCBzZXJ2ZXIuCldlIGhhdmUgaW5jcmVhc2VkIHRoZSBib3VuY2UgdGhyZXNob2xkIHNp
Z25pZmljYW50bHkgaW4gb3JkZXIgdG8gYXZvaWQKZGlzYWJsaW5nIHN1YnNjcmlwdGlvbnMuCklm
IHlvdSBzdGlsbCBnZXQgb25lLCBwbGVhc2UgcmVlbmFibGUgaXQgbWFudWFsbHkuIFlvdSBzaG91
bGQgcmVjZWl2ZQpvbmUgcmVtaW5kZXIgZW1haWwgZm9yIHRoYXQgYXMgd2VsbC4KVGhlcmUgaXMg
bm8gb3RoZXIgc29sdXRpb24gYXQgdGhpcyB0aW1lLiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVu
Y2UuCgpJIGhhdmUgaW5jbHVkZWQgdGhlIGJyb2FkZXIga2VybmVsIG1haWxpbmcgbGlzdCBpbiB0
aGUgaG9wZSB0byBzZWUgaWYKYW55Ym9keSBlbHNlIGlzIGFsc28gZmFjaW5nIHNpbWlsYXIgcHJv
YmxlbXMuCkl0IHdvdWxkIGJlIGdyZWF0IGlmIGFueWJvZHkgd29ya2luZyBmb3IgdGhlIEdvb2ds
ZS9nbWFpbCB0ZWFtIGNhbgpyYWlzZSB0aGlzIGlzc3VlIGludGVybmFsbHkuCgo+IFNvcnJ5IGZv
ciB0aGUgaGVhZGFjaGVzLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgoKCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
