Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E28EC27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGkaftt2vIRKFePv08p/+DP9c54wWUApaFfzd/7yOF8=; b=xyGdoCcrazQpgd
	xucMVP5FnapZXf462up1poy9YkNagCu041wMpoZkHA5M1HLYjgHU6TFqE+ZAgqrocRqSiH4HJt7UY
	5OubR2T2kbrQHDFn2GuKuwv2VJ0AqOSv4ic6rbM/2Tr9bc6Y0X/T2qe6JCG3nyvZ+KYukAY9VmrNN
	1vyDyHDdv1ABw4aG5Pr+D4tcCPOmVmbJW44rn9zfNR3aba8dnE5rcCtz80hnRgmg64ZeOHvpmuzbt
	J00GDurEc2adyiyiPxlTXqgdGzxRBKDxKurfUG2NAU8JcJgv0ai0YKTmrDL5hd9ab/8wq+8wvwrd4
	5f4+VVDiznZrQggyaNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgTD-00000007U3X-2f7h;
	Thu, 30 May 2024 14:09:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgT7-00000007U2l-3Ecj
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:09:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52b840cfecdso62376e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717078163; x=1717682963; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mflbPVUEVN5KoG/50XqrCGHjXlLJoerBkLPgw0zOWSg=;
        b=YYaHowv6jxpE0gYb1wRxIIRVxnKkDCNRYntt8vQeV8/ER0lLan9RS3HWI2CTBfP+OX
         WomThjxUC5qPsH7ansK0+jmKZUabw4Mt1Qf6Kp/0FKPeCUb+s9g2jmuw/UvjU1WjsIYv
         eVYft3wBZwG4opXe7NAwXaZhp22TofGCJX5AHPMNkrz/2LWH+Wha0wi7LFL//A88I+42
         zl6jzEtPs7/e7+1xTtWyKekbgPjD01scUDO13JkqWQUWB9S7T3HndGwh6O++jaRpNQEi
         6KqqVTaDVf7whzSyLqFExaUriip877Sl8tfBSV1UJIegOgIyJHexAE7hyxf+a3GIcKQz
         AuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717078163; x=1717682963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mflbPVUEVN5KoG/50XqrCGHjXlLJoerBkLPgw0zOWSg=;
        b=RqUHBuY3MgzP6HX3J/TaAFKmspfQTeRd2I3eXIaWCuCCuK156Xh4EjjuALyukn7cwt
         unk2PgtPlNI6K5bfro4dlG6UhG3q2r4U3S5ua1pDE7WBCpY4c+/nMVTCOGTAKc+go42W
         6wyNogDA/kZOUiGYXNUl6sgHR47g87TPg8CWgMYF03hvKFWc20J96KKzP6R86jktOHCf
         G8vShEG9W3yJ1xHo1klIoRK0+NzLTh0g5M29tC5UDgtOvLcVOoAzcwoRm6j4AQYTHMVK
         R9dUELC0EJdf/0JyWkMOU92s+VtoX4G7Wz8/laQQLQPu6rrSM4goDRsPkDQmab2KkLJJ
         UTdA==
X-Forwarded-Encrypted: i=1; AJvYcCViBcfdbKoek3i0EFGupyN92OnGLxkqt05v6bmx+l6KWBfphudDu5hDzEb3JuMG6trKLaQUAa9upMelijbABhhKMKVJCyScaXQNmOXYsvaa
X-Gm-Message-State: AOJu0YyFqrE9Y2qUpAQSLKfka8g68DC0RuzPSqnyqjgEdarf6S5LIQpK
	u0wfco2YGMgb+CA33Ve4+b9uGhCpnT6iWnDUtwJ4D4OaprxUf0K2
X-Google-Smtp-Source: AGHT+IG2pcFtvxeZ13j+AVA7gE9C/9R2T3iDq+lSthzGXcayIpO/isarwQfFK8O9nusR2DNnU5XpeA==
X-Received: by 2002:ac2:4218:0:b0:523:8838:cea8 with SMTP id 2adb3069b0e04-52b7d4919damr1570148e87.69.1717078162433;
        Thu, 30 May 2024 07:09:22 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785cb3a3dasm9195355a12.67.2024.05.30.07.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:09:21 -0700 (PDT)
Date: Thu, 30 May 2024 16:09:17 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix fully ordered LR/SC xchg[8|16]()
 implementations
Message-ID: <ZliIjQvbQRGq+oL0@andrea>
References: <20240530075424.380557-1-alexghiti@rivosinc.com>
 <ZlhpA9NsgI0z6t/E@andrea>
 <CAHVXubi+XW=v=MKDov5j0v2QG-cAMjWxdqMRhgfLmo1JhCkryQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubi+XW=v=MKDov5j0v2QG-cAMjWxdqMRhgfLmo1JhCkryQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_070925_930843_16F30588 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

> And you already told me that privately...Sorry, my mind has been
> elsewhere lately...I'll fix that right now.

Np.  While at it, one nit below.


> >  #define arch_xchg_relaxed(ptr, x)                                      \
> > -       _arch_xchg(ptr, x, "", "", "", "")
> > +       _arch_xchg(ptr, x, "", "", "", "", "")
> >
> >  #define arch_xchg_acquire(ptr, x)                                      \
> > -       _arch_xchg(ptr, x, "", "", "", RISCV_ACQUIRE_BARRIER)
> > +       _arch_xchg(ptr, x, "", "", "", RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
> >
> >  #define arch_xchg_release(ptr, x)                                      \
> > -       _arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "")
> > +       _arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
> >
> >  #define arch_xchg(ptr, x)                                              \
> > -       _arch_xchg(ptr, x, ".rl", ".aqrl", "", "     fence rw, rw\n")
> > +       _arch_xchg(ptr, x, ".rl", ".aqrl", "", "     fence rw, rw\n", "")

The plain string can be replaced with RISCV_FULL_BARRIER (cf. asm/fence.h)
to match the style/approach used elsewhere in this file.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
