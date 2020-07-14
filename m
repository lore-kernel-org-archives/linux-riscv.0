Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E73DC433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:33:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B49E221EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oZMVVQ8c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IobWZMZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B49E221EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dK6LtOHePlHbZ+BLUThSQ74BFpFK6Z6UDaJCl8X5hhY=; b=oZMVVQ8crkL/An45TwE4oty53
	E3tkPYlJCaguTpxdpZvP+W/YYUtJ8uEFN3UpfrYiLzjubqIgZsaANFVlW6kx9SN3X8iqfFUkrEmbi
	beeMq2evMz/+qYgIraD0SeuIeqH1mqtrPnbWhrooRjxJ8tSTc3+XzjWCX3zJxjm32xfH4zaWcqnN0
	JPZUf34wforX1XAHjL1qfu5yBa22hJn1syeVVJ+fvSveB3ys5mr1FpvoRj6zjGeUtIZUt+ePMVrpt
	4h5NQvAs0zzf0dmVCnyZu5gD0946+22BTK1bUq8rDnMwtrbGjaA3/XwY1nRG0oOlkbK7Uufzzgn2Q
	k1oTPpd8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvMwE-0003Ck-TR; Tue, 14 Jul 2020 15:33:46 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvMwC-0003BG-0h
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 15:33:45 +0000
Received: by mail-lj1-x244.google.com with SMTP id r19so23290469ljn.12
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rYU4sbMcFdjvk+wenfKOdKBg9lSiSVy3qR8AsDWIT4=;
 b=IobWZMZ2K4lfIlp2s0OMaugN8Nr0+nroGDJtXkiC4e/XOIRS/xcHqGwEs/K6W4JaY9
 vx/FIjFLSo1MrfLf/XK1RlzcMb1/WLsHEyRjvsEhdixC9gGSR6G0trgFj5aiUsbt1zRC
 5VvJnSve8NLK8sjeRHlLk7K93NUoBQ/sk2+O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rYU4sbMcFdjvk+wenfKOdKBg9lSiSVy3qR8AsDWIT4=;
 b=eHycWsznsaWlY8ZOlrk+bcrm/aedJV/Q8+5CZ7MLb3gyhl/l7U28C9qajvn1yOi1ma
 kE30ISc/2njrXNqylguk85ttkDkWjeT3XGjiGzSR92/PwRgQYXLrdeYjV4AFXeWxjikU
 dNogi8erxdeyd0+3HwzbIWS2ubmBG8ZtNsX4eD43mbkp0JE0BMTo7EQ5zkwl7I46txjr
 Q49/EllMQ0to1T/6uaiQbdRsuh3rFhidTHMLdzwFvQxchKjaiL0Z3pdO1N/PN84sB6jy
 bAzFbNIkSTQVXSEFPVmU7QW3FYUhSnVLI2Dkv7pOgtv6ujL624YSu3m8KobwbNEs+EA2
 /WeA==
X-Gm-Message-State: AOAM532XIgXDx37HQDzSMYuij9Cs23/xMmmHAWgp4yw/pnbxAww8fyu4
 D24blIAuU2CVRpokQZu8+ryIOUPmUEE=
X-Google-Smtp-Source: ABdhPJwHNBLPAJ1omUVHHqw71qgbf7kcOVpM0KXlwP73jYz7RoSmBEtUAAbwRBku9Zesimry+YIb3A==
X-Received: by 2002:a2e:7819:: with SMTP id t25mr2379963ljc.17.1594740818306; 
 Tue, 14 Jul 2020 08:33:38 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id m14sm7295073lfp.18.2020.07.14.08.33.37
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 08:33:37 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id j11so23319980ljo.7
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:33:37 -0700 (PDT)
X-Received: by 2002:a2e:999a:: with SMTP id w26mr2542103lji.371.1594740817078; 
 Tue, 14 Jul 2020 08:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <CAHk-=wjGjwtgYJvLOd5aO2dWyPsC-6ED2Hthoxm1Eerf-Ahd-w@mail.gmail.com>
 <20200714070955.GB776@lst.de>
In-Reply-To: <20200714070955.GB776@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jul 2020 08:33:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibed1S5_XMgjrUTOgUf0UOy1djm3e14c3YOm1Loj2vzw@mail.gmail.com>
Message-ID: <CAHk-=wibed1S5_XMgjrUTOgUf0UOy1djm3e14c3YOm1Loj2vzw@mail.gmail.com>
Subject: Re: clean up address limit helpers
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_113344_094546_1DBA118C 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 12:09 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Jul 10, 2020 at 08:25:35AM -0700, Linus Torvalds wrote:
> >
> > Ack. All the patches looked like no-ops to me, but with better naming
> > and clarity.
>
> Is that a formal Acked-by?

Yup, the patch series looks fine to me, and it looks like you fixed up
the things people noticed about off m68k behavior.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
