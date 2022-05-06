Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426AAC43217
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SdD+TXYYKdExcSRyPfANIYeeviDeBWp6WQysrW1YF+E=; b=GwYuHnUKRUZsq6eEyazRSogFBU
	7EibyPaLWmPrSQR0JEkEuuxnm2QLVJ9K/7kRsGtdBkEXy0y0KJFP2QYzdvOdyWWJLBjPWth4r8F2z
	XVHaYDKa94Cw0WHA8F+gmzdTOJ2hjISgAZim0fn0nHF5X6HgxOmri3c1TQULEVNyDjn3r0yDA2M5C
	0xyFJo+DWN7OIIWVZlUM9/iT6SpJtJ3fBGlZr5QRiLwmoqe6TgxT1lstn742aSwLwlXljj3fd1wfk
	HY8kgNMcMouWYF90ax2lq1gTCDmjsTsps5yKkEz7YtU0l/8L1BpN0hiFraSBaLn2xOQhLy4gSqny5
	fMEpoWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn0wu-004QBW-Ak; Fri, 06 May 2022 16:37:00 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn0wr-004QAb-3B
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 16:36:58 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 204so3897715pfx.3
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IxfEVaIASIXkXL8knX1ujN2Jx8pBG0nLkRjrhRCWVrA=;
 b=StYX5UPicuaF9n0QU9myK3qk5p3hczv1u9hC/nV0vUJuDQT5HdcagM7KezGdbpgHM/
 ObU2BvvQ/dPpoUVp3R/oQQ4jbYfufwT1B8VABslQ6hzNB3LIibSgMWLIx/e/C8P+r/iC
 2mZ6egIUiVnweCr8Jn9w6GA9EgKFha23YCwTzRtoMQl7lBb8maqmA1kA1dkQgqfuZrBr
 SsXy7B54ypA/G4EECcjIyPsyuum9NCFCqiZ1CVFojPooYkUmReUr/uhqLO5BxWPz+Bfl
 1arzZCQtQXzzuNZXwqKKxkf9gdjcFJlgCAJRxVCel7SWZ1nDE4c0hfMI410FlDabjAEo
 zOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IxfEVaIASIXkXL8knX1ujN2Jx8pBG0nLkRjrhRCWVrA=;
 b=OgQe4U1gQqjkiU9WrW/oLEtfOV5WxURxhBBnMSWTOU+q+ei3i6M5WVdusyifbXQCQ0
 jf7OG67uqZkd6d1HMnwm0MpGUrCtSAHXttT6ABEJfPCW7JZ1MjHWXfjQAzBGW5NoARW5
 u/uIXBgNi9hrU3mpOV7U1ht4VCthFjsq3Oyh8tSKypqQWpKjfl9vrLu0uBkfsTZnEHlA
 TpxwdJPJj2jeMITIrM15PDE0vezrS9CDSB9yu9Yr/eiMpLkbjAaBtcgmZalrRRrDRSeN
 oh7M9ixq2ZDxZd5hFISUETRbjTW4NSe9I5qfyJMv0XwU7rR3DGUgHHUxct0qrq+CaMle
 pqHA==
X-Gm-Message-State: AOAM5308qIjgYkWFGRdPzsKA7w3BG219aQvjFRIgIzeqDUs3veAVFGPf
 TZVp7vkQwZhp8/r9s1UEec6AKg==
X-Google-Smtp-Source: ABdhPJwm7eczUYFnvi1topoIWQleGXBPYrCKhjccEQ4CcjUe1kwpr7NaCnWnS8JPl6j9DdL5rUsdVg==
X-Received: by 2002:a62:6d47:0:b0:4fe:15fa:301d with SMTP id
 i68-20020a626d47000000b004fe15fa301dmr4357053pfc.29.1651855013607; 
 Fri, 06 May 2022 09:36:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 d1-20020a170903230100b0015e8d4eb210sm2097789plh.90.2022.05.06.09.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:36:52 -0700 (PDT)
Date: Fri, 06 May 2022 09:36:52 -0700 (PDT)
X-Google-Original-Date: Fri, 06 May 2022 09:36:49 PDT (-0700)
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
In-Reply-To: <e3b6a7ed7dc612d7338bc95d8fbbfdfc@mailhost.ics.forth.gr>
CC: mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-506fb56e-9288-4a73-b984-91a54e11081c@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_093657_386672_EB329457 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyOSBBcHIgMjAyMiAxMjoxODoxNCBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAyMi0wNC0yOSAxODoyOCwgUGFsbWVyIERhYmJlbHQgzq3O
s8+BzrHPiM61Ogo+PiBPbiBUaHUsIDI4IEFwciAyMDIyIDE0OjQ4OjE0IFBEVCAoLTA3MDApLCBQ
YWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+IE9uIE1vbiwgMjUgQXByIDIwMjIgMjM6MTE6MjMgUERU
ICgtMDcwMCksIG1pY2tAaWNzLmZvcnRoLmdyIHdyb3RlOgo+Pj4+IEhlbGxvIFBhbG1lciwKPj4+
Pgo+Pj4+IEFueSB1cGRhdGVzIG9uIHRoaXMgPwo+Pj4KPj4+IFNvcnJ5IGFib3V0IHRoYXQsIGl0
J3Mgb24gZml4ZXMuCj4+Cj4+IE5vdCBzdXJlIGlmIEkganVzdCB3YXNuJ3QgcGF5aW5nIGF0dGVu
dGlvbiB5ZXN0ZXJkYXkgb3IgaWYgSSdtCj4+IGdydW1waWVyIHRoaXMgbW9ybmluZywgYnV0IHRo
YXQgIlJJU0MtVi1maXhlczogIiBwcmVmaXggaXMganVzdCBhIGJpdAo+PiB0b28gb2RkIC0tIEkg
a25vdyB3ZSd2ZSBnb3QgYSBzcGxpdCBiZXR3ZWVuICJSSVNDLVYiIGFuZCAicmlzY3YiIHNvCj4+
IG1heWJlIGl0IGRvZXNuJ3QgbWF0dGVyLCBidXQgZXZlbiB0aGF0IGlzIGtpbmQgb2YgdWdseS4K
Pj4KPj4gSSByZS13cm90ZSBpdCwgYnV0IEknbSBnb2luZyB0byBsZXQgaXQgcm91bmQgdHJpcCB0
aHJvdWdoIGxpbnV4LW5leHQKPj4gc28gSSdsbCBzZW5kIGl0IHVwIG5leHQgdGltZS4KPj4KPj4g
U29ycnksIEkga25vdyB0aGlzIGhhcHBlbmVkIHR3aWNlIHJlY2VudGx5IGJ1dCBJJ2xsIHRyeSBu
b3QgdG8gbWFrZSBhCj4+IGhhYml0IG9mIGl0Lgo+Pgo+Cj4gRG9uJ3Qgd29ycnkgYWJvdXQgaXQs
IGp1c3QgbGV0IG1lIGtub3cgd2hhdCB3b3JrcyBiZXR0ZXIgZm9yIHlvdSwgd291bGQKPiAiW1BB
VENIIC1maXhlc10gcmlzY3Y6IiBiZSBvayBuZXh0IHRpbWUgPwoKVGhhdCdzIGdlbmVyYWxseSBo
b3cgZm9sa3MgZG8gaXQsIGJ1dCBJIGp1c3QgbG9vayBmb3IgImZpeCIgYW55d2hlcmUgaW4gCnRo
ZSBzdWJqZWN0IGxpbmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
