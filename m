Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C765C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 09:13:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1D52067D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 09:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hZf0Fgiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1D52067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3pb2ERJY92SxNqS4j3FFCgGqKsCPPstVBlxy+y8t0qo=; b=hZf0FgiwKCgRRgkrLd0LSNbGz
	r0HXdSaS/ojhw3bPvH//hvVXLSOdH8NUxxHNNKqJSwThcnnhjehSEkFXi8w/cgPioVHY98v+J84fC
	Ht64/+ac//oPG08xUH50LI8s0I4SpSY9jhY2Yaoji4Gw52zfjPkU72uCjmaaepW+hAmcOvNldk6Qo
	mjqkN4pWHrniGr53ZEAL/ChrUW2skQxHaAeYZxORh92bqK58oKCkce6kaBSNoRMi1SDTU0v4H/7j0
	FX3pzdhuEU5rNTZvFxJwTdlCCuyGA+hrCLVQTjqKsRLoCjf39McKIbpINb4LWO0SyhkDcygU9faxg
	ls5KPNZHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juuWP-00061t-8r; Mon, 13 Jul 2020 09:13:13 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juuWM-00060C-L2
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 09:13:11 +0000
Received: by mail-ot1-f65.google.com with SMTP id 72so8999731otc.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 02:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Kvnn1U97jZEFNfOWUSAsH/gkQzeVqu192LUXU0iCy4=;
 b=kTDxsY/V8mNm1xCxxemB3OYLrdDIlvUlnz3xrGL4t/U+ZI/fHX2lKNKkI2vS5HsF04
 cW+BgpyxlCgMYRZhB83m1xe5r3H+Jf3Ruwk4FgekkLhLRN1MXD+iRYPwBFG6CbB1Yy9V
 hrrvObJpDipG5lOA4vbuI1bNkNdPZnq3Qq2zHABKyN0u3Myg5EIEn0vG5Z3QXb4YwcnS
 DmxuLRgVxDHTgduhQtCUVFAkz9rickCCMW3d5Z2/UAVAAVaD1IFWmp0CIJKimZDJn+Rw
 +WGbWB4s2uEsqMR1A8Vb8LBnZiy6aZ81XaOaBcheglCT8BV4SHAWVDzx0YY3CkVJZd8w
 RbyQ==
X-Gm-Message-State: AOAM530n1kZiHACmK2Im6yoO+SnT8/kSrU+TxUKHZERne3Ppd2wlZaV7
 FTiRE0DqPWdFKSCpbLruuNspxR6rkbTC6HbbGVk=
X-Google-Smtp-Source: ABdhPJzCNB4z3cnwFxg40yF0vD7KxhFEnVze7JJzdymORNXy473eBLB/B4cnQoGYWPXmt7S7GLNnpSjsEbLKguPGOEk=
X-Received: by 2002:a05:6830:1451:: with SMTP id
 w17mr56644751otp.250.1594631587724; 
 Mon, 13 Jul 2020 02:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-6-hch@lst.de>
In-Reply-To: <20200710135706.537715-6-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2020 11:12:56 +0200
Message-ID: <CAMuHMdVyy+cj+mpRJAW=1=3aOJWvUrLhXjJxKvVFdFcGr_RJRA@mail.gmail.com>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_051310_749953_F6862E7E 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 3:57 PM Christoph Hellwig <hch@lst.de> wrote:
> Add helpers to wraper the get_fs/set_fs magic for undoing any damage

to wrap

> done by set_fs(KERNEL_DS).  There is no real functional benefit, but this
> documents the intent of these calls better, and will allow stubbing the
> functions out easily for kernels builds that do not allow address space
> overrides in the future.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/include/asm/tlbflush.h | 12 ++++++------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
