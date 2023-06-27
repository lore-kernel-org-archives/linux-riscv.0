Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F9EEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeCTIE+trvVCtRWa9AdIO/b7qICAhcKGe0Ob1zYswP8=; b=rg1ym1hLgmW6nF
	qJxGcIBzj7KoUw8DWZT22rn9SPiXUs8NQUALgaMOPaPSGrHj90Ii8QWyezjv8255fa/mSIm40GxLa
	fCnc0M2Ovzaby9VFzZ9WZl5hOEXnSX7tuy/hkjzCTYdigyf5bg9Z+j4ezWU2vbw/cMavM2+gAhYJg
	0R4/sQUKlPneH/LpdLMM8vIa8rsZtUlA/Jd6lXRL6TkJqsv+A7MEOCnhwa2ARHa5E1k9WLypXl1Sk
	JKm3yzmbxy4TMYe8u4KUOobai7+Me9T5HiYXydJ8dUXNofVZxJaWxQVdsFr+daZzCC9Mj4M6yqQBt
	GsqMvtGfhAO4Lim4iepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE24u-00C6T0-2n;
	Tue, 27 Jun 2023 06:21:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE24s-00C6Rq-1F
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 06:21:27 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so2258744e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 23:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687846884; x=1690438884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pe1lKlEte9odBdUn8Yh1NFVZ6H9gIwm0aa2j35EkhA=;
        b=LE2DQpYBcgbltuAjRWfYkbt9QZ/wIGq/+L3CBGU6OPJSp8dBTQKPJA2b2QdjngiIvt
         1EToFV6aqqfqY/MIgoc/EVGFSwVANXnkz26RwJmnrlDxzExTzl2s1W2YoXP/b9z7LxQp
         wPuOdTAqoSeyGJdC9KKhcRmPWg50tqWsnzMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687846884; x=1690438884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Pe1lKlEte9odBdUn8Yh1NFVZ6H9gIwm0aa2j35EkhA=;
        b=FtZ8dORDhKfoO9cSNW01o+x/Y2wxU7lJVWU1vWfKQCxDeHmgmC/GqhAQLNoIwxee10
         PLARtR6B5EfrnDPjIa5cDKhXhx5fTGGOkzpFUmS9ZbFn6PIjkcrLf0xCJ7JchTO1LLfD
         XMrWkgHbNRZ5z/Kpgg9crFTgzaNWgfBn3926TZFaQN0VSdQcSZGDzS0mSTAJITwxFc7P
         EY2raqleDSwXyrKWi3Yb9N5cIFRSRu3Kf/v8C8lbOzF0HykymHuBVOBdT6XFZKse9AtN
         vUjJ2QMS1ZHXgCtPkrmHOv0yXb5op4v1yb7unF1J9JgfQ9ogeU/fVOqrrEhwwV8GYR7b
         fXeQ==
X-Gm-Message-State: AC+VfDxntwqDdpx2h/TR6iAhtQ7lVWCU23p3CCqmHtVwqUCUKxM8Fan+
	yXo2rXc0UNxkiS2XVdNDNarflBXpifbXtxqkf30N
X-Google-Smtp-Source: ACHHUZ4ZQ9icflqwjIdw0UaRMT9Z/SbuJQyz0T5kUl6N4B9HZ+Mbkhmz+Co3NYQjhDyawHkbIf6/b4XOvKQk9NPqznk=
X-Received: by 2002:a05:6512:2206:b0:4f9:740e:ca38 with SMTP id
 h6-20020a056512220600b004f9740eca38mr6488884lfu.53.1687846884138; Mon, 26 Jun
 2023 23:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
 <ZJphvbTsp6Q4Dfrq@x1>
In-Reply-To: <ZJphvbTsp6Q4Dfrq@x1>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Jun 2023 23:21:12 -0700
Message-ID: <CAOnJCU+HqEgGpLGb1-4JrSC30rZZ_8Z5h3HMAKUN2xFu-D8uvA@mail.gmail.com>
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2023
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, OpenSBI <opensbi@lists.infradead.org>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_232126_608317_483D34D8 
X-CRM114-Status: GOOD (  11.42  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgOTowOOKAr1BNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDEyOjU1OjM5
UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gVGhlIENGUCBmb3IgdG9waWMgcHJvcG9z
YWxzIGZvciB0aGUgUklTQy1WIG1pY3JvIGNvbmZlcmVuY2VbMV0gMjAyMyBpcyBvcGVuIG5vdy4K
PiA+IFBsZWFzZSBzdWJtaXQgeW91ciBwcm9wb3NhbCBiZWZvcmUgaXQncyB0b28gbGF0ZSEKPgo+
IFRoYW5rcyBmb3IgcG9zdGluZy4gSSBhbSBsb29raW5nIGZvcndhcmQgdG8gaXQhCj4KPiA+IFRo
ZSBMaW51eCBwbHVtYmVycyBldmVudCB3aWxsIGJlIGJvdGggaW4gcGVyc29uIGFuZCByZW1vdGUK
PiA+IChoeWJyaWQpdmlydHVhbCB0aGlzIHllYXIuIE1vcmUgZGV0YWlscyBjYW4gYmUgZm91bmQg
aGVyZSBbMl0uCj4gPgo+ID4gV2Ugd2lsbCBzdGFydCBhY2NlcHRpbmcgcHJvcG9zYWxzIGFmdGVy
IDE1dGggQXVndXN0IDIwMjMgdG8gYXZvaWQgbGFzdAo+ID4gbWludXRlIHZpc2EvdHJhdmVsIGhh
c3NsZXMuCj4gPiBUaGUgY29uZmVyZW5jZSByZWdpc3RyYXRpb24gc2VsbHMgb3V0IHByZXR0eSBx
dWlja2x5IHRvby4gVGh1cywgd2UKPiA+IHdvdWxkIHByZWZlciB0byBzb3J0IG91dCB0aGUgc2No
ZWR1bGUgc29vbmVyIHRoYW4gbGF0ZXIuCj4gPgo+ID4gVGhlIGZpbmFsIGRlYWRsaW5lIGlzIDE1
dGggT2N0b2JlciAyMDIzIHRob3VnaC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2
ZW50LzE2L2NvbnRyaWJ1dGlvbnMvMTE0OC8KPgo+IEkgdGhpbmsgdGhhdCBwYWdlIGlzIGZyb20g
MjAyMiBhbmQgdGhhdCB0aGlzIHdvdWxkIGJlIGEgYmV0dGVyIGxpbms6CgpDb3B5IHBhc3RlIGVy
cm9yIDooCgo+IGh0dHBzOi8vbHBjLmV2ZW50cy9ibG9nL2N1cnJlbnQvaW5kZXgucGhwLzIwMjMv
MDYvMjMvcmlzYy12LW1pY3JvY29uZmVyZW5jZS1jZnAvCj4KClRoYW5rcy4KCj4gRHJldwoKCgot
LSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
