Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7094EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 20:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D5EE2086C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 20:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTHr+UBe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="XEthsVL8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D5EE2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4ufp0EpqmPFbHSSLJL4eSYax9394yeYLOaWqa2tEjc=; b=sTHr+UBeZnQMgf
	Gyedpj5Dv8LGm/jM0h2SrLS0MPT+yuB1RJc8mf1bGmfByhJY5fnykespNNducLZfWADKcgw3r8KCk
	mgoOSERC+hj5O0rks0y6iEMGgQzsjafYFc4ZnxqZm66ewCL/xuekX6JFQVGV/JNMTlQ2LMqKHgxLL
	FW3atdseG3cybPd4aTpiiPzBO05PdWpsn0JqQDSuSgYX02mzBk2bOSEZwdlX4mliKQrO1ODSXpYUj
	KZgmGr6+uezoQz5YUyu9XLqI+RPjgHLEeLIF13w5ehuc9FuJdzKtkkzBAnFTW6H8qnvBy4XZ2xCw9
	29kPRb8hrnrbxDlGsMsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNOFE-0008Q8-EH; Thu, 15 Nov 2018 20:28:08 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNOFA-0008P3-JT
 for linux-riscv@lists.infradead.org; Thu, 15 Nov 2018 20:28:06 +0000
Received: by mail-it1-x143.google.com with SMTP id r12-v6so31403601ita.3
 for <linux-riscv@lists.infradead.org>; Thu, 15 Nov 2018 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cafcOmuLYw/QUgVJslWZRnzNm+HBqhgujYm2tJCmbX4=;
 b=XEthsVL8wm6O5L+a6JpBLmCNep8SfInq6yj1zz3eh1XbRQ43NWG56YH96KXtp0TPCN
 4BR6EYlCGzDWrnHoMfUD/7nryFIZWiFI7PKm5P33WH12TyB7E0/OegXjGjyZD96sFU/8
 J1rpAA2KlyJbCtAodl4CeG7Q+lH/IjzYWhU72+EUZRX3onToBlu/uVSwTxg0y0YAcxG1
 aQFrTuyuurxFIK5iZPmN4fPAp7rh2CmONXpUh5Yx44EKTGGYVwpdksm5U9PpP+eoDRpL
 eFSwkE3NcDGoH2F5leI8jywPKmVgdbfbfDfyBTY6GwfPDq9VpRLLXZXMk+0EW+tOKlSN
 5Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cafcOmuLYw/QUgVJslWZRnzNm+HBqhgujYm2tJCmbX4=;
 b=rhFwyQvO/LSIvLD0k570L4y6o6ef4k8CfZ+QO8UZgCe11KlCB/JAff7Jq38h2mgMhB
 4dxUU0Z36uZXnQLN5bdQZZOX8HyfRn2xDtPL9XZ/R9eqdw8g+VZsZSMuX3rZWZkGvS1P
 ITQaEM/CiCleMF2qatLWXMM6+Ad36ZqM07mCbV5Iqm2ZUIKVfVNKn2jsy9BO7tOJIKiU
 foHdied+EJ4XOjfL3mbPLTWUjtI3otWQcL/1rWuaqCHsKTS8AyIPDI5g59qNcfcH8ZkO
 08V27lxC49Y1v3OkUhBZPvEgUxCeYw/TFUSuFZTpsGxQZ8wLjzi36oS7bxQfDW2WwHJS
 Ewsw==
X-Gm-Message-State: AGRZ1gI++1DHWTjt/eVegqYmtss14atgh3goCUtLjewQpHslsAqLqlKg
 VrP7zbJK1snq5rWmsAlEEOBlUAxfO2k8PtFUQhxymQ==
X-Google-Smtp-Source: AJdET5fj58LY7c8mSvxcWVowcMbBbAhv7v6PervL0csf1W8ikXXqOKtpviOHETrBeM5F5M45gb0d2unWfDljDkrMNtM=
X-Received: by 2002:a02:88cf:: with SMTP id b15mr7008396jak.10.1542313673351; 
 Thu, 15 Nov 2018 12:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20181115002755.24195-1-olof@lixom.net>
 <mhng-4c28d7f1-e034-4506-9ace-40fc2abd1668@palmer-si-x1c4>
In-Reply-To: <mhng-4c28d7f1-e034-4506-9ace-40fc2abd1668@palmer-si-x1c4>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 15 Nov 2018 12:27:42 -0800
Message-ID:
 <CAOesGMgCM57JNn2_MV8PL+zu6h2i3=saawbdmA3rgEJBUOfreQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix raw_copy_{to,from}_user()
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181115_122804_639895_61140AE7 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115202742.zSteqHupzL2gbnxiBraXd9eXmdILXSLUvPIzLw2JjU4@z>

On Thu, Nov 15, 2018 at 6:59 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 14 Nov 2018 16:27:55 PST (-0800), Olof Johansson wrote:
> > Sparse highlighted it, and appears to be a pure bug (from vs to).
> >
> > ./arch/riscv/include/asm/uaccess.h:403:35: warning: incorrect type in argument 1 (different address spaces)
> > ./arch/riscv/include/asm/uaccess.h:403:39: warning: incorrect type in argument 2 (different address spaces)
> > ./arch/riscv/include/asm/uaccess.h:409:37: warning: incorrect type in argument 1 (different address spaces)
> > ./arch/riscv/include/asm/uaccess.h:409:41: warning: incorrect type in argument 2 (different address spaces)
> >
> > Signed-off-by: Olof Johansson <olof@lixom.net>
> > ---
> >  arch/riscv/include/asm/uaccess.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> > index 473cfc84e412f..8c3e3e3c8be12 100644
> > --- a/arch/riscv/include/asm/uaccess.h
> > +++ b/arch/riscv/include/asm/uaccess.h
> > @@ -400,13 +400,13 @@ extern unsigned long __must_check __asm_copy_from_user(void *to,
> >  static inline unsigned long
> >  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> >  {
> > -     return __asm_copy_to_user(to, from, n);
> > +     return __asm_copy_from_user(to, from, n);
> >  }
> >
> >  static inline unsigned long
> >  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> >  {
> > -     return __asm_copy_from_user(to, from, n);
> > +     return __asm_copy_to_user(to, from, n);
> >  }
> >
> >  extern long strncpy_from_user(char *dest, const char __user *src, long count);
>
> Oh, no idea how I missed that one.  This looks like it's been in for a long
> time, so I'm surprised anything works at all!

Actually, it boils down to a memcpy either way, it's just that
exceptions and access control isn't handled right. So as long as you
always do valid copying you'll luck out.

> I'm going to add a stable CC and PR this to Linus this week, assuming I get
> some time to at least give it a minimal test.
>
> Thanks for catching this!

Cool, sounds good.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
