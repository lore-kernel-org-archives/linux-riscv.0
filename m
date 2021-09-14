Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C55C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:47:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCBA61151
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DCBA61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSRtosSKquUwPX77O7Gfomo96WUXeWju6uCXGcUTNpI=; b=jstv8a5+rKoAXK
	J3lb1CM/ZIbbclqzlGL4j8gukrFNQiaHevHDZ53vXlGJpibKgUnzCFPAnqOMzH6iwHQu4LUJdnWD+
	+KHsu+WCBhx76QOy4hQjln151op6IItW78nPAtIx1wIlpNMm+vbsBC8P7nIWVHUgjGVhRmlxMbsdF
	t7VZ4Usou+ZUaIF5Ly1oBuPwGnK2j3/0yaF7LPFwdrme4hygt+jDdmsQ7qytKphtNK8iiVdSNfJ8W
	dQ3wzA0yfGnsH+Tazq5tWlxZBX05fE1Vfrh7Dr8AJ35S8fSUSB0wk/zRdec2WgIElM0NNEwA3RIFD
	4V0qGRVbT928Upy4pS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAed-006H2M-0s; Tue, 14 Sep 2021 15:47:27 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAea-006H17-9R
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 15:47:25 +0000
Received: by mail-ej1-x62d.google.com with SMTP id kt8so29947933ejb.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuGH7A1j3mwghnSNlt7ii3pSP3zqhI3ZLfhyE1/i7mY=;
 b=R7AKqlIgzHsNi6Tq6c2IwOarByE0iXqz4YlcYfOLGqwYPfSWeFNr9LdrOHY0sHRCu8
 naDWlgwpYmTs3LAeSJhTpybHunXV2G0Zr6u1AYtP8z+sHgAVUF85Ux4F5km4EfIbfx7r
 jZuWndb2Alk2aESrYA3wH6fpzGqN1esmqt/VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuGH7A1j3mwghnSNlt7ii3pSP3zqhI3ZLfhyE1/i7mY=;
 b=wlIgu69OLXaBoVFrJwMblHiviRLJ2C9DTqwQjiW8ZwKAM5xIYNmAgOLe39phH+WGqz
 +kBKOxGY9rhrc/J5CKJ8VBKSE3NwQh/FIfkPFGN6Yvz5MCXzI92T9XJZdFK+tZJtEYzR
 X+3ZLmO96aYs3MkXDONFofvhs2kCHALN5wIoa4aYIgkw2hpHDAVgFs2HRdSLoFv1XY6I
 1brzsTRa9AqN9gsIoysW0w6PvcAsjwfrKrzrT1xtFLdkMz34r2iPlspl+07PVKKFdocK
 12yHvtgV+goxU5NqzBg6cRefx3WXV8B3sPmyzybHtUxFLDA1XTgu8N3SNRsE8e36Lhni
 oMhw==
X-Gm-Message-State: AOAM532+H6VweaMC2jlbsGy+9d+K27UUlvcuU1kfb0ycVyUUbANR2Mga
 XW56pp5xkKQNBk272WYT0oJQEvqO30eVjFlrDTc=
X-Google-Smtp-Source: ABdhPJyXphMH/EfyRJe2IlMzpBMI68OOPCmRpq+AAt4ApYVhTLS3fLa9A/QRTQOiHpglOWKZCOwDbQ==
X-Received: by 2002:a17:906:5586:: with SMTP id
 y6mr19195797ejp.189.1631634442541; 
 Tue, 14 Sep 2021 08:47:22 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41])
 by smtp.gmail.com with ESMTPSA id bw12sm4297889ejb.9.2021.09.14.08.47.21
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:47:22 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id v24so14447306eda.3
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:47:21 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr15545178ljg.31.1631634430421; 
 Tue, 14 Sep 2021 08:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-6-ardb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 08:46:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
Message-ID: <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_084724_362220_780D33AD 
X-CRM114-Status: GOOD (  11.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 14, 2021 at 5:11 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
>  static inline unsigned int task_cpu(const struct task_struct *p)
>  {
>  #ifdef CONFIG_THREAD_INFO_IN_TASK
> -       return READ_ONCE(p->cpu);
> +       return READ_ONCE(p->thread_info.cpu);
>  #else
>         return READ_ONCE(task_thread_info(p)->cpu);
>  #endif

Those two lines look different, but aren't.

Please just remove the CONFIG_THREAD_INFO_IN_TASK conditional, and use

          return READ_ONCE(task_thread_info(p)->cpu);

unconditionally, which now does the right thing regardless.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
