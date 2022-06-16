Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB1C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrpbFonhrOGGJZQ/miwD8pafy0VPEYCwybH88XZlkkI=; b=rf4RFzcRg5QPgD
	eehgaP6jsEeo/ZlF4u5uw+c5eAHL9j1j0Snq8tX0AdrY2eJzdmIAj1/rRr/cQs4xegm7iXJ9OfXCW
	6iC0c6Avg0QrbmqBvVU+teXkgeb99YPNggcYw4Xs7HorHuzrXG2ZFIHPgrjTtPvCJoKFPRWYSXGFn
	P4pVYgo+xGlCQ3g9+0m/5O/ewyu0fBTco/o8jeVGbOiKuQKj4ayC35Kv6OEudgdsdeHjhdvbBM9sh
	LmWFD72oHoh5DyAw0WHbOaV9d8YDzDqqst6u5L/4osOKQy6FWy7PxphUhTe/xBxi9Hp4oPG0L+Wvp
	HVG/qbG2uxua21a1P61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lKc-001Vl5-MJ; Thu, 16 Jun 2022 08:58:26 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lKa-001Vh7-1W
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 08:58:25 +0000
Received: by mail-oi1-x236.google.com with SMTP id l81so1123869oif.9
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xG2TGaEkQL7haiuCt0Cz5nx5rsHcf/OvCU9fytCYyXY=;
        b=nIAElHSSl5CVMGo0msyL1mhzt91z9l5Qt2aaeLmOwwrwCViXPqYb2OfAFO7c84c7/N
         8BEkTIVVw9IWCc84J4edy2HUGsuQ7UV6i48bWMjxcskQvyjgArxt36NaKRkgypf8uY/H
         oOPAr8yJb08mdcast40u6irHsYTNf+Oo1slkQ1hiCxuQZVPmhOWyZsGWBXVyeBf8mI3k
         RVEvX9Q9oBn26I9xX/VD1fRNcCRlINg7THgqffb9LMOwDgx8FsAESO9j0Bvx76X6E2Ln
         e3WVTZElQv0EjF+Ayho+Vbmj18SPsv3P1HqKG74OoKs2lqN+EabHmPTTExmVwL2UUroB
         yGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xG2TGaEkQL7haiuCt0Cz5nx5rsHcf/OvCU9fytCYyXY=;
        b=V3DFyJwFE5ZLXnaxHVp9fX9tx9TydO+LFzkUpP1dRlz805juJTTJDjTNrEbEiVcuJE
         YHA9rG9ChlCVht9raZDqToll6U+PLoyjF9cpRExTiLXH3tqjBuQmp288z+8bvmKP+vML
         vbBpfgX1OhmK/7H15rMOxVAsQh0jzYpjskcOaRfgBdZ42g36rO1Gp5Paohtx/qpsy/pI
         IkNnwT0veTAXpsKAmjPuE0aEbA/rwvcNbIvad6qbb4W6rmGT3oMJkCAYc/gFsdmG7oms
         pH+xlof2OG/nrUylpzuHQy0WifgTKVdxtkEQ66XHsT6goArKj5eDT8DPsZxkQK1Fkx4/
         /ldQ==
X-Gm-Message-State: AJIora9pg7KOOhq5ToxsNK+hyyV5X65FPMj7IZJbm8ApRSPM6SHcHOH4
	BAc7cYGmGljcrCO6MuT3YtVbZVzd9HrSIq/66vmehQ==
X-Google-Smtp-Source: AGRyM1v5PeyhM4gU7UuWSRoGMnAO0Ix+0RH04mbi/q/C0xb2GoZBmqf1O5TsR8ozzzgYhjiTUOieZJfKIv+a5ffRtEQ=
X-Received: by 2002:aca:3c44:0:b0:32f:15df:5c2c with SMTP id
 j65-20020aca3c44000000b0032f15df5c2cmr1900743oia.285.1655369898580; Thu, 16
 Jun 2022 01:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220609071833.1051941-1-andy.chiu@sifive.com> <20220609071833.1051941-2-andy.chiu@sifive.com>
In-Reply-To: <20220609071833.1051941-2-andy.chiu@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 Jun 2022 16:54:54 +0800
Message-ID: <CABgGipWN7OryuK2EPJ99KsvvheG_u0v_spULn14xBQNpcWPdcA@mail.gmail.com>
Subject: Re: [PATCH riscv/for-next 1/4] riscv: align ftrace to 4 Byte boundary
 and increase ftrace prologue size
To: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, rostedt@goodmis.org, mingo@redhat.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_015824_137433_87FF9206 
X-CRM114-Status: GOOD (  16.10  )
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

On Thu, Jun 9, 2022 at 3:21 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> We are introducing a new ftrace mechanism in order to phase out
> stop_machine() and enable kernel preemption. The new mechanism requires
> ftrace patchable function entries to be 24 bytes and aligned to 4 Byte
> boundaries.
>
> Before applying this patch, the size of the kernel code, with 43432 of
> ftrace entries, was at 12.31 MB. Under the same configuration, the size
> has increased to 12.68 MB after applying this patch set.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..d0b922c04e1e 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>         LDFLAGS_vmlinux := --no-relax
>         KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> -       CC_FLAGS_FTRACE := -fpatchable-function-entry=8
> +       CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4
>  endif
>
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> --
> 2.36.0
>

Loop in: Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
