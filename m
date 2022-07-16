Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B157C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/X98LjVlYX3Gx/S31SWfkT5olZTVfX/8sk6GeBWZEjY=; b=coeHVnrxukNIMN
	4Wr1/Pxl9f95AnseCVpJ+2fE22zEKtkp+zMFOcc3YmrJSYBV3L3/Tuxpb1+Rcn9iCi2+Df9fnYGPG
	JEVEp6jCJUL4sPyw0Tr/sTBflQzS42S7lT+X27hXBeTU5y8nlkWhg4qYvSccP2HnYmo0zHwrDjGuK
	7xZ+avoyKN9XUEAKi9hu2/n7eDXvvvMnOX5Eqp3BoTejNU+T2ovwQqq2jU6Hw0M+7F/7wVg49aLNa
	dKXQ78zWGDfv7evODAH+FvhqUOHEm+VsrbGdkIC7KTqm/IVANuY9ntxYitkiagDfI0xcPJonH3nAl
	CWw/RoekXobihW3fHFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChyU-00GIHs-Sr; Sat, 16 Jul 2022 13:36:50 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChyG-00GIB9-PK; Sat, 16 Jul 2022 13:36:38 +0000
Received: by mail-il1-x130.google.com with SMTP id a12so3792508ilp.13;
        Sat, 16 Jul 2022 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5DwIeby9yP04RKpyJxL5PrbdIqogg6yPOhWbo7JHmTA=;
        b=XobnjiTf7v9nif7ZIlYg6CbjUFX3cB/9L3Hz5e1BulKOtPVn2M/orxn0vsUl/cpKhY
         dqFf2lJQAMgMO7d98L+pRwuR0kxrQIFhvsuMfZeYqLfiBHZYZCWTEUSA4lkLSVrdAHUr
         Ix8rI8hyA0tAOhtbM0japKKIgJGjWKbUUtZAcLwcznI3x7/TobbZkwBk11WGmJYEkEcL
         8QiDsZ6qmsKQg4OwcqnhT1EZm9n34q8SAbthTgCkexcQOgHQg2gIreI8iCBG+J/k4Urx
         m81j8/RwwDwDhpw8LGZKfNWdJQmkOT/+vxA1G3qnh3GyJA5IWNOdXvpxn5y2BkXYBdpc
         MX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5DwIeby9yP04RKpyJxL5PrbdIqogg6yPOhWbo7JHmTA=;
        b=l9Aee46vLG4BMOVMdMmZRKvJAanv4VXNEm//Q+D8Tg81HXZ+aS+GlJsgscGT1rgJ7T
         14fxMVoFQZPn+k4PalJlUmqe0gdkbW585nAntS+RKuPTBa4/1UbOPn1ndkYgLl9xwiz9
         kdQqaaDNDeawVO+DPeSSwMkwjKWuMiZGFRUGLfSQsB/uk0w+1oHIWA5oUeNuborifWuw
         gzoKJn9fJXNB5Xm0EilKE0IlHE3L6CNX1Z9ACWlC7+CmKsQVTDy4AYdU5ej2j9QBmvkA
         rl42JSnzXHjkUkATzop1aKutojcDjM02K++GgpNv7sr663I7NsBwRF+/vNwvHo+M11Pf
         8xNg==
X-Gm-Message-State: AJIora+e64y2a1YwvDi/pY23CdqHPWLYvgMaBA8K1L6st2J3xCeKqhCN
	Cx1pe5gCngkN4uJ2C4g8Fb/levB6L/j9Ikd0SJ8=
X-Google-Smtp-Source: AGRyM1tG1YsrvjoLRvogD9K95sp2B6IZvclnFGnFqUdc0M2V7E19ryC7xwimpnUQHvy2WNgV44DytXl4VP+O6mesyIU=
X-Received: by 2002:a05:6e02:188f:b0:2dc:7291:fd02 with SMTP id
 o15-20020a056e02188f00b002dc7291fd02mr9120346ilu.321.1657978593469; Sat, 16
 Jul 2022 06:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220716124214.329949-1-conor@kernel.org>
In-Reply-To: <20220716124214.329949-1-conor@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Jul 2022 15:36:22 +0200
Message-ID: <CANiq72nYRkHV6N2bGpTz3td=2Vto21apvZW0igTT-mV8TZtB2g@mail.gmail.com>
Subject: Re: [PATCH v7 00/25] Rust support
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, KUnit Development <kunit-dev@googlegroups.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, live-patching@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_063636_864521_7B62B9BE 
X-CRM114-Status: GOOD (  11.13  )
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

Hi Conor,

On Sat, Jul 16, 2022 at 2:42 PM Conor Dooley <conor@kernel.org> wrote:
>
> Maybe I am just missing something blatantly obvious here, but trying
> to build rust support in -next fails for me. I am using ClangBuiltLinux
> clang version 15.0.0 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa and LLD
> 15.0.0. Is it just expected that building -next with rust support is
> not a good idea?

Please see https://github.com/Rust-for-Linux/linux/issues/795 for
details about the maple tree issue.

I will update the `rust-next` branch next week with the new version of
the patches; but if you are interested in developing, please use the
development `rust` branch instead in GitHub for the moment.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
