Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4B3C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 05:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJsyGQuljvvV6VfYpRUgD9erKi8dNxD/ZdT9REj7w1c=; b=lsVo5HIvDyJVH1
	MLt5BDp5jBwzEqSGSy8AowyVu06j7H15D3jpfl6SD1LH8k9WPUsCQAGdi1gCydeEOcOyBTG9VWdnY
	0yXFHWVHQdkpbrMBEsnA3hxjGPAbsFVvptEmd4tkrW1GMuZGDubmLAZQmpnAVyw7FJrGrfV8CzX7h
	1GoovZA+YQS/xTyLV0Sd/ys09SpaXnciC8My5ccbv803L6kEAF+qJp2yrCGwBV5lXLd4+gai1sLyg
	iLIkjOmPy1cZA9wEqsIIHGvL4nVEh+6NHKuVFRa98p2O3cklPX27NT1lVVUPFDHm7j9b5cZNHTnP6
	3DjUvpWJBDNlHYb6Cxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQYq-00GECe-2C;
	Mon, 14 Aug 2023 05:56:16 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQYo-00GEC7-0s
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 05:56:15 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-640c5df2e6eso18792276d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691992569; x=1692597369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nWy8K+A3gmg43bAetQ9sAtJN4YzGBCb2rJvrClCSx0=;
        b=B9xjF4jRfzv6Uau+Zp2OrPOPajuCt2sdF7e21IJsiZmXYG3mj3LlkGeyI371r+eo+U
         n02Hykxlhmg5GlD4wm20LUTAZU7yQ08B+f/2dPItAvKMI7IoddMWuf6WNFLCgBjWjRFq
         Bdur9Hzo7lWkX7h50IiS2uY7Mim7i4qyEe1sTRUEsKkx09cN69n5u2HhgbJiqQAnP7Sh
         9hUyc/axoPGTZUSxMidzpMyxY6BcdxZ1qX47vImGp9qUMFU4VrmHJ42/QzCY9MFawiYo
         41+pEebMtoM9NV2gvx+YeibkIahpZz83no+MXRPITHAkZ7OmHBgd4bDymB3aNtEFvNR5
         4sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691992569; x=1692597369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nWy8K+A3gmg43bAetQ9sAtJN4YzGBCb2rJvrClCSx0=;
        b=M7xIxwMdlByEuBvzRb6s50Jl4goeb9Fs6G+zmoz+zbnRnnJkPr1N+VFL3tvnsY1CZl
         LyYajRcabqO22eUcmbrGGzsh78jdvqXtlx4LeZUOeC5CtCoAuiSutLUi2ijJTn9WGUej
         iMqMKbxA6wT9eLyeLVh5FreJatKGfGX54xxS6ra9Y1FUs46sy3IiuV+IBn5UDMVHV25S
         4vLlqCvBgabSnJz/JZlQT3MRtRPDbRN6+tU5NVixVZRULjIfF3bdWEeYKsmrdRdfAXrS
         RAL2d+9uod9lUgNaNYusqXSi7VEBPVDikdTtMciNW/9pBJO3R5ND+xxLL7JNjLctiy41
         nWRQ==
X-Gm-Message-State: AOJu0YwMBp6g252VMeDXlsSIY9tZH6/r29rS83fs1c2cb4r6d+eX9oCH
	I/6TYif+a0hYKlyMUrLnQ7MWn58yVsNg0u1/7PEE3Q==
X-Google-Smtp-Source: AGHT+IHW7Xb+gaFCMb0r8VD3gHfQkPvEtJSU0q7Z911XKy/EpJw4llUFP7xsE+ImxMVfHm7iSsO25GA4euVpqbYuA3o=
X-Received: by 2002:a0c:e1d3:0:b0:641:8cb7:b089 with SMTP id
 v19-20020a0ce1d3000000b006418cb7b089mr9611951qvl.27.1691992569765; Sun, 13
 Aug 2023 22:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230809135042.2443350-1-nick.hu@sifive.com> <2023081143-flannels-verbally-9d0f@gregkh>
In-Reply-To: <2023081143-flannels-verbally-9d0f@gregkh>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 14 Aug 2023 13:55:58 +0800
Message-ID: <CAKddAkA9TZs2vVCzBWtfgo3gYJsrMMmsDMtA22iEMM3ok9TgPA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Add Sifive uart suspend and resume
To: Greg KH <gregkh@linuxfoundation.org>
Cc: zong.li@sifive.com, jirislaby@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_225614_381359_52AB754D 
X-CRM114-Status: GOOD (  14.79  )
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

SGkgR3JlZwoKT24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgMzoxMeKAr0FNIEdyZWcgS0ggPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDA5LCAyMDIzIGF0
IDA5OjUwOjQxUE0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiBBZGQgU2lmaXZlIHVhcnQgc3Vz
cGVuZCBhbmQgcmVzdW1lIGZ1bmN0aW9ucyBmb3Igc3lzdGVtIHN1c3BlbmQuCj4gPgo+ID4gQ2hh
bmdlcyBpbiB2MjoKPiA+IC0gQ2hhbmdlIFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyB0byBSZXZp
ZXdlZC1ieTogQmVuIERvb2tzCj4gPiAtIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgY2hlY2sKPiA+
Cj4gPiBOaWNrIEh1ICgxKToKPiA+ICAgc2VyaWFsOiBzaWZpdmU6IEFkZCBzdXNwZW5kIGFuZCBy
ZXN1bWUgb3BlcmF0aW9ucwo+ID4KPiA+ICBkcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMgfCAx
OCArKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KPiBEb2VzIG5vdCBhcHBseSB0byBteSB0cmVl
IDooCklzIHRoZXJlIGFueSByZWFzb24gdGhhdCBpdCBkb2Vzbid0IGFwcGx5IHRvIHlvdXIgdHJl
ZT8KV2hpY2ggdHJlZSBzaG91bGQgSSBnbz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
