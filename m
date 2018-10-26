Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E305CC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 01:13:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83025207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 01:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTs+RoF3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FMs0ukMb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83025207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLT2kGQb+KpahnfVAIHm9fInRs+h8x6VuxdReab1x38=; b=tTs+RoF3I6AAHx
	e4xkZg+MVrFfVUfMaNuPRj7DT+oUmAN3JuE4Zqv36SFHrYFfEAxprlHN4fpHSc1v4HTos/ZYvisjq
	rgx2s3YeIY8GjAqVDMRBGyATfhxHQ9Gm51T0XSn2Q8wejKHH3XlYsamC+GzYJDsn72Fhhj9Qk/yYV
	HCPHeXICz+jT/wKIXzVjw54NXONG2uy3gqFTFz1l8UQ9MAemUI+MF1fHVyaiJhp2x5czp5QFezysz
	I1WxJYB0zJrwohtPOJPMIpaNEd8j2yD/qr0dK1JwAVUU7/red7acjlyOIBmDYoEpiBBTbWrDPmAsi
	CQSujvArIqfgErmV7pVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFqgj-0000fV-4j; Fri, 26 Oct 2018 01:13:21 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFqgf-0000eo-95
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 01:13:19 +0000
Received: by mail-lj1-x242.google.com with SMTP id t22-v6so9975922lji.7
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 18:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sx2uoEnwZtNWncWgGbwOXJH1F/f37Op88gT7831Dwso=;
 b=FMs0ukMbGrXHlLKYGmrim5xPZeNgdiTfLPFL4mWtVWGxB6DCGjOqHu3UL1wWX6Bod2
 4azS0EtvVrNvRseX3NEpSzeXxT9z2yyIcmDgAddnsT9AdbBqRH2hIvI9P9uNj1ui3i3Q
 f7FqVLGz0c5aKa81GduHOSsULuBWqfBlylkX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sx2uoEnwZtNWncWgGbwOXJH1F/f37Op88gT7831Dwso=;
 b=G+WbJVEEYzk+9y6Wppd3NfD8A9eMCJed7GpiFN60G4yzJ5mKCyVDFLhzKtsutwxwkP
 iUfDYJKXK420e9dG3UsLSn3YAVot24GlfspL183lB+HCNCwaKlmAlQGb8Ad9ZuUYUSN4
 qMmOGoR7NHTlXWSDJV0Y6xV7L2RHHfvsP2gFffE6JH5+poO81smNsPS4DXf+qBOpFvQl
 8yNETIoCkKZv4L4sCESnUe9YehoqElxYcURzzF2+NHk/Iq73gsr2aUgY4WVUtULdm3qd
 fCviCaA3ITiJyXmnqmxiBOj889YdTUc7FI2ePDVxXLk7e2bO5O5qqWtomPF87gzLaq+q
 2aSw==
X-Gm-Message-State: AGRZ1gJPPC5wsv1WzLbCV2kIEOG64OLHhYWm7CiCeZ4GP+Ds5VwlCNvQ
 2tn5gk1fx8GA0jFyh95JgegFFGrfADqK7A==
X-Google-Smtp-Source: AJdET5cSgfqPPDQN2UtMLm9RVJyQcEzWkRT6nf7I2XgJn12oLDyZfwO2WiawHQ20rnCyKcOzefy+SQ==
X-Received: by 2002:a2e:4e01:: with SMTP id c1-v6mr946249ljb.157.1540516383766; 
 Thu, 25 Oct 2018 18:13:03 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id n195-v6sm1511087lfb.26.2018.10.25.18.13.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Oct 2018 18:13:02 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id j4-v6so9972298ljc.12
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 18:13:02 -0700 (PDT)
X-Received: by 2002:a2e:9584:: with SMTP id w4-v6mr915704ljh.118.1540516382096; 
 Thu, 25 Oct 2018 18:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
In-Reply-To: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Oct 2018 18:12:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
Message-ID:
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_181317_331482_BB2FA182 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026011246.XjLoUQnL9l-PAGHbHkmMvBTVufGlk3LCtWPz4kflnek@z>

On Wed, Oct 24, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> I'm pretty sure this is our largest patch set since the original kernel
> contribution, and it's certainly the one with the most contributors.
> While I don't have anything else I know I'm going to submit for the
> merge window, I would be somewhat surprised if I didn't screw anything
> up.

So I'm not entirely sure this is a screw-up, but it does have some
signs of being one:

>       lib: Add umoddi3 and udivmoddi4 of GCC library routines

We have *actively* tried to avoid needing umoddi3 and friends, and
have so far succceeded in doing that across many different
architectures, and many many years.

And when we _have_ added it, we've added it as architecture-specific
optimized routines when people really need it.

The reason to avoid a full 64-by-64 divide is that

 (a) it is really expensive

 (b) code that needs it is almost always actually wrong

Almost always, the 64-bit divide turns out to be entirely pointless,
and the code can be written as a (much cheaper) 64-by-32 divide
instead using the functions in <asm/div.h> instead.

Does RISC-V _really_ need that disgusting full 64-bit divide, or was
the addition of that simply a "we didn't know better, and didn't
realize just how expensive and wrong it is"?

I've pulled this, but I really _really_ hope that I will get a second
pull request that gets rid of this again, and fixes whatever RISC-V
code that triggered this to just do not do an insane full 64-bit
divide on a 32-bit architecture.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
