Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3A9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F332761056
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F332761056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPHDtWBcYu40dXSz+YgR5Mm6I39iUCKzG1wNzzrxS/s=; b=L3L8THnLym3zH1
	i2h7scM4MZx9ncWeDg33aZARFqBrUrKM2UWdCUVJNj7Oi+TE6GYxbR5omPMxzMLYBqx7+65PDiWqz
	vwdQA48qoQgbwSeUWJU2TbKNI1gsAjPWv6ExWM7yTyWZmSDoZn8m0ydHgten38leXmCi453qVDLWM
	BFa0lEmijZNSc+UfSF75OBwMsSAMTmHjwgWZaV6xITHsWw3WiYm4wKGsvSi9RiIB/yvaanMAgoIPJ
	lRnJBA8Vrr/+wa4gTIupddlfp8Enk5BDUddrCgtaY2MYdlk0fQOSYp10VTlAyGfpRxAMaV9/JD8Am
	vFyc/ERX+RlMG/x0ZEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAZJ-006FHr-U8; Tue, 14 Sep 2021 15:41:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAZ6-006FFz-BO
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 15:41:45 +0000
Received: by mail-lf1-x12e.google.com with SMTP id a4so29767192lfg.8
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgZDRvewpIcHvEl+aClDgx6dxTBkhTg+5FlC2P6kQVc=;
 b=BpcuMcoHH1B5L3A9rysqIc0UNfq5noiLE14zKeR1TSa0gFC85lOw2Beo8dO5honWby
 rYyCHFnHkKNi7MCpw7JrIjMcXxBeTw1cz/rDSABmNfOTKR6Ymn6YfZNGpWuykLc9dauc
 iTDBkLKWwlR9RhIlCft6lceQmUvWAku/ar3t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgZDRvewpIcHvEl+aClDgx6dxTBkhTg+5FlC2P6kQVc=;
 b=tJar2GvSKE8S44ZlCQNVaFd8k6y52UvN0C9qc5bIvIht0u3/YFzU+Vsc1Tb8J+HCU1
 HpfoHcCa43xBbiz3xRKoiqlL5E0fuR0++vSbM7qNR47XLXPEvPegkECC4kbNe+Of0IJ3
 pMiTMWHQs/drydqUQgwo4cCkTFvG9GoQmz/THlOSyByQ4uR1x24S3yYE/VL/wU8wXYFk
 ByYA0YOWj93qrtJeb077DrisbN73E2Oz240QT4Xf58qqmfMMSzI5zZz875iBzfBmbMN9
 yr46EJKL6CsThqvucrZGSLflSZwg2FOr5ZolCVnX0oMEHbYyDLPSeC9SYgUi7qld4PfX
 eY+w==
X-Gm-Message-State: AOAM532aizEmglUhAutOJ8kEsOXvpy1oROqvXTXaYBC9Yo+kowSipyfZ
 BDTmD3yV7Qrh5ktnJ03WsI5uv33Rf3G8WTYf9OY=
X-Google-Smtp-Source: ABdhPJyaDPqyf47Mq/Zk7md50EBm0iI+RwUPzZt6D0px2E7AXAKRcEgN4oU8m3CTwBmxT0zmpy2pzA==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr8949293lfl.17.1631634102292;
 Tue, 14 Sep 2021 08:41:42 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id c8sm1149986lfb.229.2021.09.14.08.41.40
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:41:42 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id i7so13600015lfr.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:41:40 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr15637818ljp.494.1631634089537; 
 Tue, 14 Sep 2021 08:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-2-ardb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 08:41:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
Message-ID: <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
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
X-CRM114-CacheID: sfid-20210914_084144_429142_BE530DCA 
X-CRM114-Status: GOOD (  13.22  )
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

On Tue, Sep 14, 2021 at 5:10 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> struct thread_info.

The series looks sane to me, but it strikes me that it's inconsistent
- here for arm64, you make it unconditional, but for the other
architectures you end up putting it inside a #ifdef CONFIG_SMP.

Was there some reason for this odd behavior?

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
