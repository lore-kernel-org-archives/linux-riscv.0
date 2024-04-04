Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656E6CD1288
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TAb84VkcE72wmv0pshNynp6RktifLn9mob3VGN9low=; b=dyMDSUmBQ6Hibo
	UuQEtyE78aozTVJYlzlXp/ZrnFhDq8h+QluOK1VNEFXI48ILFrZNsFq8tKhNceT3JJ85df4aPa4WP
	7rLt1BMLkyNO+LNBbIvWxrZXYm6tTqZh9NlznF1JT+yWJOhJrO0arl98bAF3RYV6wiRjw9qqIuOeQ
	znar0HvEfF923jUNnvGs4FmMD70CLSr66JOru5JMZu/YSOxWWaTLPEvosx1xSB+NYw5ZETQKcAu5L
	MYyD4wSAA7AF7hp+c1Uoy572URiBD3yuJ+UlDzcQffkzph5NgpO/slEuEvzKaTnYeeLAFSw7IzFxQ
	gqv/iAbVhj5KONMhUw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAnT-00000000jfh-0bM0;
	Thu, 04 Apr 2024 00:17:39 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAnQ-00000000jbo-1fqj
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 00:17:37 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-789e5021703so24222585a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 17:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712189851; x=1712794651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSVBno2xCtCV3lEPrUaIPS0RwP9BPDEg1a+b7h+02fA=;
        b=GYBT1w43FnCECUV9Dcjkmo7cHYQdCgsdJJAtEch43VPJSPYEEAbMZd9HdNQ4GbC7+5
         UGq/tiWxhFy3qYi9xvB/ftGg4izWg8Ul/S7Dz7VudkJ+5K1T6fZkIanq7yA+vBrbo/np
         N1wWJYLx641vOVhoDrX5PFFuKK2BXnU1MCyszbaxLyw82I/6zhMLRH3o8n6PWx8eLuea
         2Wrc00h/Pdg4wmbUD38h3gn26dY6XC6/whh/4YtEeQjxLkRl+bXqCkwEEiTBqnNx3N8F
         9MF1V4GV1QLP1Kf4NgM1P3DKmYB/3bRomyoDE2nc8Ym3wXOxCvnrIcgp7xMK/BkRvglz
         buug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712189851; x=1712794651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSVBno2xCtCV3lEPrUaIPS0RwP9BPDEg1a+b7h+02fA=;
        b=DgaFGLXxukEGZOhS0eGqNVbjuMHHLSgPPx8qy4J+mS5PAVCEzpTLVaxJz5dJPmOBxO
         yeO+W2Y3PTSf6bNGsBPlDrOl+mQcUF8j5Neov1SlRw1GGmvBEamQcokcrgiwtHkMCKRB
         6BK54DHTCiT44CrZ/lODrh2gY42Qtv1/ZFEDmNF5uJdSjT+exbLsEaDhL1TtVrs3vbT6
         wr3sZ8jrTLMX0IZrdsB+Lw4fDxfdSzmyU0BZmVYe+Vk+H7CKwvCAAMnYtmkAq0+1Y4/y
         aYBspnqWo1qlgDYd7tvjl8AcwEIBCJe4hcoiJl/2Ra3VQz5iz6gQxPuCl4pisX43tjzb
         NOmw==
X-Forwarded-Encrypted: i=1; AJvYcCUsPsQ3RoAyNUH29qDmDOf4XL5DJB36HLyuzM8dxr5wi0sxr9BQD8xPJYhSoozOrGtC/tMoiCDp1jrsN7+j62ISOjH8rzDd87c1e1+q/XDm
X-Gm-Message-State: AOJu0YyXtYDJRYpgwqozNgsUUgCsXf+FZMeyNGUUCkYotejEfdCGlk+I
	FsmLDHSkMqatJKMVXqcvtLMEBCFA3zNSzWOhG6QPtFkjodmxxNu+c6NtuOKzgECDpM0mVY3tqFQ
	8aueZELXr3hSHRCuebaVcUWcuL4uEizvPZwvEOQ==
X-Google-Smtp-Source: AGHT+IHeyRQcXRicFrSlT78VEU+Vzn8mFeWtih7N+0UKFhl1TiJbXhDluQaV4kTzz7cFxWm7uIPajzR+MoCnf8A5Y2k=
X-Received: by 2002:a05:622a:411:b0:432:f652:1a52 with SMTP id
 n17-20020a05622a041100b00432f6521a52mr1067238qtx.55.1712189851730; Wed, 03
 Apr 2024 17:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-12-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-12-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 20:16:54 -0400
Message-ID: <CA+CK2bC-ua6DVAwZ5oM3X9v3PJx1oKWtbOdBfEdeLHQasXx0Pw@mail.gmail.com>
Subject: Re: [PATCH v12 11/11] powerpc: mm: Support page table check
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_171736_532593_87CDC5DC 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEz4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gT24gY3JlYXRpb24gYW5kIGNsZWFyaW5nIG9mIGEgcGFn
ZSB0YWJsZSBtYXBwaW5nLCBpbnN0cnVtZW50IHN1Y2ggY2FsbHMKPiBieSBpbnZva2luZyBwYWdl
X3RhYmxlX2NoZWNrX3B0ZV9zZXQgYW5kIHBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyCj4gcmVz
cGVjdGl2ZWx5LiBUaGVzZSBjYWxscyBzZXJ2ZSBhcyBhIHNhbml0eSBjaGVjayBhZ2FpbnN0IGls
bGVnYWwKPiBtYXBwaW5ncy4KPgo+IEVuYWJsZSBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hF
Q0sgZm9yIGFsbCBwbGF0Zm9ybXMuCj4KPiBTZWUgYWxzbzoKPgo+IHJpc2N2IHN1cHBvcnQgaW4g
Y29tbWl0IDNmZWUyMjlhOGViOSAoInJpc2N2L21tOiBlbmFibGUKPiBBUkNIX1NVUFBPUlRTX1BB
R0VfVEFCTEVfQ0hFQ0siKQo+IGFybTY0IGluIGNvbW1pdCA0MmIyNTQ3MTM3ZjUgKCJhcm02NC9t
bTogZW5hYmxlCj4gQVJDSF9TVVBQT1JUU19QQUdFX1RBQkxFX0NIRUNLIikKPiB4ODZfNjQgaW4g
Y29tbWl0IGQyODNkNDIyYzZjNCAoIng4NjogbW06IGFkZCB4ODZfNjQgc3VwcG9ydCBmb3IgcGFn
ZSB0YWJsZQo+IGNoZWNrIikKPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxy
bWNsdXJlQGxpbnV4LmlibS5jb20+CgpSZXZpZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hh
LnRhdGFzaGluQHNvbGVlbi5jb20+CgpUaGFuayB5b3UgZm9yIHRoaXMgd29yayEKClBhc2hhCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
