Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA83C07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 17:15:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0998613C2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 17:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0998613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvsCke8h7mgP5TMD4ll23IjtO3fyp17wrq4cZ+G2uls=; b=hCKQRPlsu57eUl
	3ot1EIY0IayVCa3rFpqsbSFrTSU7dwUdLeOzLjah6MSd8ag2Exu6KXmfOdX5erdwuPNWta++dozPx
	YFlpVm7mA5mU2rqH9aloGnhfaOPp45waIag1cQqBMq2NpI3YM2aKoPyDw8vgjhgY5aj8/Ya0lhLHy
	Y03G6JOnV1AAk/JKTlSh/mzSOvuiczmoFUfs//Qi/q7yd7FzscLQrKU5ejVCM7GPgwvVfqTpWbkUz
	C2+ixH8LxV+cVTQ6Sdinj/kObxtE8Nv+fPQsltzdH73dizV+O3ZlX5MW4yDWRlWlb5FFV/Ev0I2xa
	CBcmKw4Bvydf29NQd1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1u5g-002CLL-2m; Fri, 09 Jul 2021 17:15:04 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1u5d-002CKV-6r
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 17:15:02 +0000
Received: by mail-yb1-xb36.google.com with SMTP id p22so15759863yba.7
 for <linux-riscv@lists.infradead.org>; Fri, 09 Jul 2021 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UfAm236+ZW2LhRr62fKnJMwoIctKDz6MX0I8ooLV4Hk=;
 b=Ti/AAu6fROwptWF8bpkOULqE3NuqDJti9uO0acIPfDTodRUrNg0kunoeZmAMhw7eat
 XNCt4Hsw8+Erz0qFR24p9Jj/TCMmVPcVdzb6cKu894/aUOFKeqoGXZ2u3GaZMWRzo3vU
 K0YbzIvlfxGV4u/HDl9u7yhi0Z2G9bBsNMM94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UfAm236+ZW2LhRr62fKnJMwoIctKDz6MX0I8ooLV4Hk=;
 b=LawORXSOXy26m/5QGtQskHBLz65gNYSBviJNBj01PMYc0bqxDhveSxBzIXtWh0wRww
 ihLUsYyXeloYj/981SkpNs/IhETPzjtyTE65ghX6SNguC700gOcRX4ri8E61C6ml8yXy
 9ZoavYex6nih90/1POdbAg1bdCfyNilqvr6QspERkZeOl9cYXSmlHei7dA/Wa4PSkfUg
 rBXhRMKmaH8bkgejD1tyYd6NBO35C1x7YnCjzAeXeJWsmhcqHe5AcHfVsUDMGIlpgfWD
 5bati5r/4D356bUcKprIswzxdeSBbmWRKhq5RNXFbrqjXUuGDKzx5fFjEeCLf0sYrLSW
 uXhA==
X-Gm-Message-State: AOAM533AepKn68+pgP2FBoTv3GHnEIRAj0h7eRnz4OYjfBKCf8o73yay
 zxEAJbEMwDvVS17C8d+g/ZPYuUKOzlS2fae0JCROClFkwGsoXOc=
X-Google-Smtp-Source: ABdhPJyQNjjz+iD+y8t80vrh6c1jtsrqchb4uyODrpPHieb6ZiR1HsxyXwYB4IvCM86/upEIhDFi2E4YhoitiwyInY0=
X-Received: by 2002:a25:3bcb:: with SMTP id
 i194mr45897853yba.442.1625850900256; 
 Fri, 09 Jul 2021 10:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210629134018.62859-1-xypron.glpk@gmx.de>
 <877di3mfbe.fsf@igel.home>
In-Reply-To: <877di3mfbe.fsf@igel.home>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 Jul 2021 10:14:49 -0700
Message-ID: <CAOnJCUJhYZbAL9dMReJt0=y9V33Ed1DaBCXGCdwxH8iUU3bcRg@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, linux-efi <linux-efi@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_101501_273975_F4D25168 
X-CRM114-Status: GOOD (  12.02  )
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

On Tue, Jul 6, 2021 at 12:07 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Jun 29 2021, Heinrich Schuchardt wrote:
>
> > Requiring that initrd is loaded below RAM start + 256 MiB led to failure
> > to boot SUSE Linux with GRUB on QEMU, cf.
> > https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
> >
> > Remove the constraint.
> >
> > Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>
> With that patch the image in
> http://download.opensuse.org/ports/riscv/tumbleweed/iso/ work again.
>

Thanks.
@palmer: Can you take this one in this cycle ?

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
