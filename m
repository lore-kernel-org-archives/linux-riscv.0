Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5CDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ji3RzinN074kxjRHFGab7ucimVrGIKD/q+INvVxdA28=; b=tLQJU+o5p+JCM7
	zZ1sitlg7GeBSX8OheCl6OWLFV7FS6XMC7ZjZoBai1If8/2ooYx+kZqn726ve0SfnzfbBU0XdpOG5
	blRk3ULlQm4DZA4BPN/4kBRv+7k+XgtpSUqHL5ClEIvu6SUjp+0tkFcXeOCF9xFBBoLjd139wXkKX
	ylElE5c6AqcRjVGJZZCsLThzVj0mbiOhtVZJIDNX6Tu620vMoiIdA5anNDz8BsWDGkGzJRsyulL82
	Nc4dqLwblF9Ia93AFzIp6SOvOqfQKjq4uSApBV+7kWFM/M7nqj+ezWd5X72yCgx3VxhRTdaa3jcE9
	9AyX0bv16kim60U/loAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG1Vd-00Frlj-MT; Mon, 25 Jul 2022 17:04:45 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG1Va-00Frhs-MU
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 17:04:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y11so18892526lfs.6
        for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 10:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iItHm3Vk6EW6BDSEYYaGs+JJjW4XNUHsFzmNCV9XOzc=;
        b=YwOUo1G3f6D5LB/r1XJsmOwujkGirm8R4FRenyogUGCgdgc+RQafd3FV9kdoNZxSjA
         G7CYMubVI7Ujd1mssOntAkIDIgUblWYYJfsTRt6U8P6YqNjK1hNzIT9iLnKxMm7ZY3cl
         vmrqUzGt2l/uvs3PU9EkeHsLM7xkjt6Xp2ygefHpOXFjKl/yyEAGto77IwnrP8VO/dAL
         iD5bDhgevSbJytibVPDfLJuAczZW72pPxFNs2B0FouBzz6CoEP6710cwUXq+mNnAvrW9
         tNqd9LAFfU/zG3GKYkwl1L8TFaUr5gcQp/iWSwvRS6tEmeg1gis4Xx6lcmjQOrGeuuwt
         AVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iItHm3Vk6EW6BDSEYYaGs+JJjW4XNUHsFzmNCV9XOzc=;
        b=vtxWz5DsUVurMY0Ct3O5cLDfHKalaUXn5L1x1fiQO7HCehDEEq8AaWyt8ig4iNohzt
         LiMPs7mWdsP/pK/5ZJSErgcnMKAt23HFNVVuiAhHL+1GSwsfUtdc6+P0zM84nRRFiQ5A
         qU/nw3ICIfOK48UC5F4QegKgrjWMx5Squfv4Ofog0QSomKTEAn7493bKCWD5OQ6slZnJ
         EiV9iY6vREmWOzlBbeDyPuxTf9DWL9PUHuh6pIksQ8mdJmViW2SfIcSVVMETAExw0kUp
         Ix4xdHPT/BOj8W8IgyK0wcpEm+VzWkFvuzLrHfgan6jwZpULA3/89WviSN0VcLfuZ0sU
         9giA==
X-Gm-Message-State: AJIora8T270jP1k5YxORiJUKs8rin5zjJ4prFnidi0fu4plVUoAWOMyw
	pFvzOKP0a391LuodzkWiFaogptGGr8z+LygvYxsTIg==
X-Google-Smtp-Source: AGRyM1sY17PsqKCQbUAdQNzNI5/Y5hFTaglHXruR7TzVZZJLrEfcHXIv6bMs3FDgGcpw/02ABTmuUqKCAFTKtoqDL8g=
X-Received: by 2002:a05:6512:1190:b0:48a:19d5:ef23 with SMTP id
 g16-20020a056512119000b0048a19d5ef23mr4715562lfr.401.1658768677590; Mon, 25
 Jul 2022 10:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220725021902.625630-1-masahiroy@kernel.org>
In-Reply-To: <20220725021902.625630-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Jul 2022 10:04:25 -0700
Message-ID: <CAKwvOdmv=pGh_ye_PfTjKf-YpJiV8Ps+OHmdMEna3rw7qT0Vrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv/purgatory: hard-code obj-y in Makefile
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Borislav Petkov <bp@suse.de>, Li Zhengyu <lizhengyu3@huawei.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_100442_753506_A9911298 
X-CRM114-Status: GOOD (  15.59  )
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

On Sun, Jul 24, 2022 at 7:21 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The purgatory/ directory is entirely guarded in arch/riscv/Kbuild.
> CONFIG_ARCH_HAS_KEXEC_PURGATORY is bool type.
>
> $(CONFIG_ARCH_HAS_KEXEC_PURGATORY) is always 'y' when Kbuild visits
> this Makefile for building.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> (no changes since v1)
>
>  arch/riscv/purgatory/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index d4df200f7edf..c2d14e2f345d 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -92,4 +92,4 @@ quiet_cmd_bin2c = BIN2C   $@
>  $(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
>         $(call if_changed,bin2c)
>
> -obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += kexec-purgatory.o
> +obj-y += kexec-purgatory.o
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
