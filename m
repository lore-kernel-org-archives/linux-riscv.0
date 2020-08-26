Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF167C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 16:43:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0AE206FA
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 16:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0RpAXQX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CakgDGbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0AE206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LfdzYYpXxx4o6xkbhBV/XhIrqER/zOq+A7mZdugRuC4=; b=t0RpAXQXiHaL9Tqt1ghvgYP2j
	VTFbfx6UBzKSZGLWGPCHwlNA0oDNypGpn3n2s7yLbRExMosF2ItqXtDD0jtflAqMN06uEFk6YgsPE
	uMkIim28qxR2rPsyNuq3um1+WPp9FPBZj/yDuKBz4yjTpXXaY064pQIFjapNjVjHcr3k8oOfUg/Qi
	AZVxS660P9XTs1qHm0TaHc8dPgTHKoO9lociDT/dHTwG7DHWV2krEtTA/pOiTH1ilalfcK0nP8Mv/
	CFA7ZGi5FEA0ys1ovCZe2Yi7V5BHFrj9djGXF0d6LnPOGYIwpQ1CNrX3s8QEJ+T8n77aVgwYIk9hN
	ywactEg0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAyVy-0007aj-KV; Wed, 26 Aug 2020 16:43:10 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAyVw-0007a7-FY
 for linux-riscv@lists.infradead.org; Wed, 26 Aug 2020 16:43:09 +0000
Received: by mail-ej1-x642.google.com with SMTP id j25so3757367ejk.9
 for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2020 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qkFKNXoEvLaLjtg+VSz16h2fveq81SS9ALzUgSNtgqs=;
 b=CakgDGbRZTzTHaByk+lLgKHAFfB0XFPxYb9/t80ox0YhHH6u4XkpStD+n9gvJwp9JU
 VtqToaWErw3FJC5UxOOpsUCF16upp6oUyIAFWdDggM7wTBxaiX1QV+qpZxJLV45hNDxC
 ayAhXmZ6ca7mOKsEwullJQ/liwoiVexsABkb4fhgdWMsCMdkkoov3yrdFEjoelWh2evY
 fIzqGDHTHD2AbVrW30YWvblbDe05bXcj6o6ddg0Bx3HxeYynyXQ8MvIkdkiuSHM6GDff
 0F7pwhT+7dkEWxpHRS6yLOP1JQ5RfpmEenZp48bc5QtfWss9mCqpr/uGMTNOm/xkRg3O
 jijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qkFKNXoEvLaLjtg+VSz16h2fveq81SS9ALzUgSNtgqs=;
 b=qt0B3HxjXMRzdK7Fgx0sVDV3+lkc1lgQGYOIKvW8jgvehcDlZ/7fixM1hFHjeSc++N
 FpadFdhkD4/WlhYythD5N6liFhNYQ49Uifyzm3c4E6zhzTBTvcyVN253daIg/bnNSAHM
 qYVbR8rLJuxHxwyysXZcsiPeoqtzMYSUMKyLDyERwpUg4O/iT8WEwGj14Md9KerldCeH
 n0mPS+rvOCGbyEDzsVYs67O9Hy8O7MbomvSN9fpOZ6ufbHpZdgIW6mW8DAt80l18U1xn
 LUXGXWfLTquqLIFPKTcii2rVuW/n2Kh6Udd9Banj7atQXkma3yALX7BVLFMyLUjkylUo
 6Rgw==
X-Gm-Message-State: AOAM5320I+5HfWeX+i2wr7fLF/LkfEYFVW57rUmgj6J5aB8NffChervA
 2AsXCMgCJoHKfG3w760izowxbyYFXvDTWqYeJdU=
X-Google-Smtp-Source: ABdhPJzSJAHgQkmx8WGIzyyLafbpaY1jDCkkSspzLKWqPbii9E6oNzLepZsKGVV6GZz8L/MNYEUf9aWeQHpJYteEUfs=
X-Received: by 2002:a17:907:7094:: with SMTP id
 yj20mr16281482ejb.471.1598460187197; 
 Wed, 26 Aug 2020 09:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145249.745432-1-npiggin@gmail.com>
 <20200826145249.745432-18-npiggin@gmail.com>
In-Reply-To: <20200826145249.745432-18-npiggin@gmail.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Wed, 26 Aug 2020 19:42:50 +0300
Message-ID: <CAOJsxLFoX5rk+k5GASBh5vxL-Vfj7OkD_UE3p=_cS3SwhBVEaQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] riscv: use asm-generic/mmu_context.h for no-op
 implementations
To: Nicholas Piggin <npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_124308_550015_08D8281F 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: "list@ebiederm.org:DOCUMENTATION <linux-doc@vger.kernel.org>,
 list@ebiederm.org:MEMORY MANAGEMENT <linux-mm@kvack.org>,
 " <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmerdabbelt@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 5:54 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Pekka Enberg <penberg@kernel.or>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
