Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED5C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 02:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xs3TkwLF6EdgsF3BYjsyp+IaOOdwRlvoCJl/wtNUcOQ=; b=4FI+fi2FSGBq+l
	vbrM4G2uK4RMsVjTlf1k+eixQv1uuMWHq+Thiy3uEZ+KguSPrdLP+uFUgioRjjI2vVPLdKxzpVfbF
	kvcqt4+J9lA0b5p3grjM4UUME1tTMVOU79pTNKE6QzN3sGQYALhNemt/eggCaXGAKDfBHgk4xvJXG
	aWo4cU4o2uc1BNzvuM/guwxTA8UhfWSjph9ETFVKphFanVYFmMj7CYNhS5mc+ecHBv10Flnn35WKx
	wvuBo6jnCfcRRaGNllG3ioLJWGu6D8ZshEo85C98mxLBMHGwrNCQIeUlRHQOcWmPat3OT/uCGesS2
	lwQwvBV8Be7QSxE1iBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEDa-000000093BX-1hKB;
	Thu, 17 Jul 2025 02:19:30 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEBY-0000000935n-08qi
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 02:17:25 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-41cfa50c73dso338353b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 19:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752718643; x=1753323443; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yfhTBRXb2JdB3JZK5ErqTY9iJkcc2lm+jZagt7K/tLA=;
        b=EIGABeKIJC3H0EOdiDi4DqVBuyG+42/+OJx20p16sRFjCHqEiTbb7zvUQ9hcVmDScm
         jDjvtIHpNbmvI7RCp/kMFbJZKksqsk64QEpvTG00wJIAgHfQQIV2v7z+iZNWVqsQdwgs
         0iUaFhFsjVOWWbOCZgoxGges6JCxTRaZpmLjAeoRDsg4vv5VkqiajqnEO1585pnvqATk
         H2OuVRQIw4tBYf5VTlu1FnGDUE1y1iN83/Kj6DC4lT8YDJMk8PT7krN1mgpa7sAafinO
         BCtA9Snu37Gw0KFmZXBQRAwB8Faj6xu94aeqjV22ukkpx67GqfhF6CC7GWkbjkRq8vax
         LtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752718643; x=1753323443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfhTBRXb2JdB3JZK5ErqTY9iJkcc2lm+jZagt7K/tLA=;
        b=smH3SUFYKifrIg5Ti/vaEYCkenS3NrnBRBEyh5sVOau4zvylK8m7mPVODAkaD2FyaL
         JiLH7FG3Y8LdRZtSEyPodeISfwo2TUHTFteb6L840jdzp973B/Z/QBcQJ48pi36mbByI
         BoulEZKHplNZvpV3xnnX/TYHSm+nnaViLhSjOaC73sevqQ3opnFN3+CMXfIEl5llD3Jj
         Z7b1pCfpf0P202DixVgQvkw/yOy7SQZmRW7gvTEHyTisZYIqHahytKiDHZlSjsCaiGKs
         68c+TrrxQYXeznadAUaVcPrHad6xGfz2XvQj7dtrnm8fxkNtxiwKJMyj8MErOzZeSP6k
         GEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH+RI/R4DW5OgDK1OYk4KMk8nY8fJo4bkT9MWFmn3oYGsRcwTcjrK4ROu5b00OCrDbUw6MmMO5MJXy6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYw7Euon2TsqlTGYhUcLQqzoUP5ErVhBkQTwhZin08Pr7diAp7
	nT0gi93l5KOOdAS8YW0ALbkjqj98sBikChTmq2W7dHV7/CElYcWhkMyJaMzBHa7ywfOCP98AgbP
	aNnumJVhDIWAGSy72PkazqcCLl5JBoUM=
X-Gm-Gg: ASbGncs568Dii+J5W5H8ztmIw6O/tWn7nh6vRk0+s89t99IM+/5SQUYuMcYycRbfVoB
	9pSbFPnAbvd8XbplihD6r+L2hUca+HZpHk71tlFJq1mcpGk8dTJIoikIb+pTGYf/USe6GjzxAJ3
	TgmxJDj1ppUoQ9nbDGkhcfREqNAaP9quWxzLTZe0a1iK1ErLU2o7B+IdSDK8bJSkA+dEBfZvY5V
	QT46ek/9A7RZ4OhIoAiABRen9iOrAtd5ewY6Hw=
X-Google-Smtp-Source: AGHT+IHdEPTCuurLTYS/CkOGkIb52Puht1nHGBkhakU7lzDF5huZwiMATLJoBREg7tEIXAwFgvN7w8MhSJDaIUhB3wY=
X-Received: by 2002:a05:6808:188d:b0:40b:9307:db19 with SMTP id
 5614622812f47-41e468a6e6dmr802856b6e.21.1752718642638; Wed, 16 Jul 2025
 19:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
 <20250711100930.3398336-3-zhangchunyan@iscas.ac.cn> <8865f36d-c8a9-454b-aa55-741a82ca96b4@ghiti.fr>
In-Reply-To: <8865f36d-c8a9-454b-aa55-741a82ca96b4@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 17 Jul 2025 10:16:46 +0800
X-Gm-Features: Ac12FXzveb-RnXII_j1HVui31imert4VMFPIk7PmvaQcpWA2XDN1CctR9loF9iM
Message-ID: <CAAfSe-snJ3Z_p0UyS85AMiPWsCo976XAJREGN3V_UgisOKG3Sg@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] raid6: riscv: replace one load with a move to
 speed up the caculation
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_191724_074441_E703D752 
X-CRM114-Status: GOOD (  14.39  )
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

On Wed, 16 Jul 2025 at 21:40, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 7/11/25 12:09, Chunyan Zhang wrote:
> > Since wp$$==wq$$, it doesn't need to load the same data twice, use move
> > instruction to replace one of the loads to let the program run faster.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   lib/raid6/rvv.c | 60 ++++++++++++++++++++++++-------------------------
> >   1 file changed, 30 insertions(+), 30 deletions(-)
> >
> > diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> > index b193ea176d5d..89da5fc247aa 100644
> > --- a/lib/raid6/rvv.c
> > +++ b/lib/raid6/rvv.c
> > @@ -44,7 +44,7 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE])
> > @@ -117,7 +117,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE])
> > @@ -218,9 +218,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             "vle8.v   v4, (%[wp1])\n"
> > -                           "vle8.v   v5, (%[wp1])\n"
> > +                           "vmv.v.v  v5, v4\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> > @@ -310,9 +310,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             "vle8.v   v4, (%[wp1])\n"
> > -                           "vle8.v   v5, (%[wp1])\n"
> > +                           "vmv.v.v  v5, v4\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> > @@ -440,13 +440,13 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             "vle8.v   v4, (%[wp1])\n"
> > -                           "vle8.v   v5, (%[wp1])\n"
> > +                           "vmv.v.v  v5, v4\n"
> >                             "vle8.v   v8, (%[wp2])\n"
> > -                           "vle8.v   v9, (%[wp2])\n"
> > +                           "vmv.v.v  v9, v8\n"
> >                             "vle8.v   v12, (%[wp3])\n"
> > -                           "vle8.v   v13, (%[wp3])\n"
> > +                           "vmv.v.v  v13, v12\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> > @@ -566,13 +566,13 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             "vle8.v   v4, (%[wp1])\n"
> > -                           "vle8.v   v5, (%[wp1])\n"
> > +                           "vmv.v.v  v5, v4\n"
> >                             "vle8.v   v8, (%[wp2])\n"
> > -                           "vle8.v   v9, (%[wp2])\n"
> > +                           "vmv.v.v  v9, v8\n"
> >                             "vle8.v   v12, (%[wp3])\n"
> > -                           "vle8.v   v13, (%[wp3])\n"
> > +                           "vmv.v.v  v13, v12\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> > @@ -754,21 +754,21 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             "vle8.v   v4, (%[wp1])\n"
> > -                           "vle8.v   v5, (%[wp1])\n"
> > +                           "vmv.v.v  v5, v4\n"
> >                             "vle8.v   v8, (%[wp2])\n"
> > -                           "vle8.v   v9, (%[wp2])\n"
> > +                           "vmv.v.v  v9, v8\n"
> >                             "vle8.v   v12, (%[wp3])\n"
> > -                           "vle8.v   v13, (%[wp3])\n"
> > +                           "vmv.v.v  v13, v12\n"
> >                             "vle8.v   v16, (%[wp4])\n"
> > -                           "vle8.v   v17, (%[wp4])\n"
> > +                           "vmv.v.v  v17, v16\n"
> >                             "vle8.v   v20, (%[wp5])\n"
> > -                           "vle8.v   v21, (%[wp5])\n"
> > +                           "vmv.v.v  v21, v20\n"
> >                             "vle8.v   v24, (%[wp6])\n"
> > -                           "vle8.v   v25, (%[wp6])\n"
> > +                           "vmv.v.v  v25, v24\n"
> >                             "vle8.v   v28, (%[wp7])\n"
> > -                           "vle8.v   v29, (%[wp7])\n"
> > +                           "vmv.v.v  v29, v28\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
> > @@ -948,21 +948,21 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
> >               asm volatile (".option  push\n"
> >                             ".option  arch,+v\n"
> >                             "vle8.v   v0, (%[wp0])\n"
> > -                           "vle8.v   v1, (%[wp0])\n"
> > +                           "vmv.v.v  v1, v0\n"
> >                             "vle8.v   v4, (%[wp1])\n"
> > -                           "vle8.v   v5, (%[wp1])\n"
> > +                           "vmv.v.v  v5, v4\n"
> >                             "vle8.v   v8, (%[wp2])\n"
> > -                           "vle8.v   v9, (%[wp2])\n"
> > +                           "vmv.v.v  v9, v8\n"
> >                             "vle8.v   v12, (%[wp3])\n"
> > -                           "vle8.v   v13, (%[wp3])\n"
> > +                           "vmv.v.v  v13, v12\n"
> >                             "vle8.v   v16, (%[wp4])\n"
> > -                           "vle8.v   v17, (%[wp4])\n"
> > +                           "vmv.v.v  v17, v16\n"
> >                             "vle8.v   v20, (%[wp5])\n"
> > -                           "vle8.v   v21, (%[wp5])\n"
> > +                           "vmv.v.v  v21, v20\n"
> >                             "vle8.v   v24, (%[wp6])\n"
> > -                           "vle8.v   v25, (%[wp6])\n"
> > +                           "vmv.v.v  v25, v24\n"
> >                             "vle8.v   v28, (%[wp7])\n"
> > -                           "vle8.v   v29, (%[wp7])\n"
> > +                           "vmv.v.v  v29, v28\n"
> >                             ".option  pop\n"
> >                             : :
> >                             [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
>
>
> Out of curiosity, did you notice a gain?

Yes, I can see ~3% gain on my BPI-F3.

>
> Anyway:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks,
>
> Alex
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
