Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CFBECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:27:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D212082E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F60vO8QY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YHPG67L2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D212082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUkQp4jhWU6qJtWAldjIXmIZ7LbPSPW4IEWIuKgZulk=; b=F60vO8QYGwMHFV
	iT6AAzbkl16Ctop8BW2BKSDzAG2uiNnKPApO0b4U67F+WLpbC93pVEFuTu4wvoSwGcQdk6hsTy/vv
	7LLJzilUwyPnu8dWllNOHnCs1u0DdqgTi3BDnAbn3MDcRVttv7389rFmw/0IPKJPvs1ojnGYbfp5j
	18HRvPqSDEsJwog8/qpcWBGHMRZQ6J3nIVmS0nmeYXJ3IBey83soPfrAlvzbtZzP+XkyO8yf46xcx
	dAvvyu6yw5LzZ5kZafxhQHeXvNp1xzRfbZWuHMQR1VVwmXG3FS02rWk8wmovZsJUmHOsVbVE6Jbg7
	+LdcclNWuJWYSr0MNWwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFQg7-0002MK-Qy; Wed, 24 Oct 2018 21:26:59 +0000
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQfU-000222-0x
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 21:26:31 +0000
Received: by mail-yw1-xc42.google.com with SMTP id j202-v6so2703354ywa.13
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=u3MMUBgs+lsDZG/eqkLJuq8RYjlBeGZiaHE/yxUCnxI=;
 b=YHPG67L2fs6lMYJJ84UmE/Ootbj9PMAkfGP35hu5wykOjfCCDeSGZyM31GpMZ5CESf
 kwjBR9aAuqE7WhfORbng3AE+67rNFvvteCRmcNhvTOT/VZso4obNtZ7NTeLxw464CQB7
 ZwJ1Rb9nfNHJU/xsp0HQMrpDjk1sr9b2w58qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=u3MMUBgs+lsDZG/eqkLJuq8RYjlBeGZiaHE/yxUCnxI=;
 b=FCHDWmunh3uY4g8sEmfhiqHO1uvtbeH/8Eq6xXVW11/g3LMazFUsLr9v8R7Tle7RTw
 7hILCkziizHnF+eATyD/UZ6yodXeNP9WR1+TkQdEiFuLFiIZqy3FpaxNv4sg+iz+39Wj
 1M00bkdgKNrZF2C7xZViNwK9P7ofzEluXCYPF3fDr5g39jVsukVxqy8f6kMY8mLkZVu0
 G1iLl3Tx6/g1ldF9I853uJWwo8pzAaVgOlUG8WFQzNoTydfwzpa47L5MbvoLCAXGqnzJ
 6JinN54ApYmApYOAzQ9CxPTOLhYRo1eyCKxHlaw/5zXVUFSjzUDchj3gfOm5oU+O2Ng2
 5t0g==
X-Gm-Message-State: AGRZ1gKtkoSdxzDy4V05qDAGQmPADROooGFVwMjRhZHFW7e0WR2YsnGC
 Xr/fELmYFR6XK26wmqWBUOz0H2eZXds=
X-Google-Smtp-Source: AJdET5cnIjfTCfMUsDJMw32cpOyBKyJ6/TJDc+FlvzQap7jCd91CI1KXlb+eDa953kQmkvRyUunxEg==
X-Received: by 2002:a0d:f404:: with SMTP id
 d4-v6mr4058177ywf.486.1540416367667; 
 Wed, 24 Oct 2018 14:26:07 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id j185-v6sm1428524ywf.4.2018.10.24.14.26.06
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 14:26:06 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id i78-v6so1020848ybg.0
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 14:26:06 -0700 (PDT)
X-Received: by 2002:a25:ac8e:: with SMTP id
 x14-v6mr4134609ybi.141.1540416365577; 
 Wed, 24 Oct 2018 14:26:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Wed, 24 Oct 2018 14:26:05
 -0700 (PDT)
In-Reply-To: <20181024204036.8799-2-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 24 Oct 2018 14:26:05 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJxPKcivD6PtK0WwGVphU6Uzj4QAFXrAw52UjUDTZSupw@mail.gmail.com>
Message-ID:
 <CAGXu5jJxPKcivD6PtK0WwGVphU6Uzj4QAFXrAw52UjUDTZSupw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Move EM_RISCV into elf-em.h
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_142620_121845_85FD21FA 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Paul Moore <paul@paul-moore.com>, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, david.abdurachmanov@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, David Howells <dhowells@redhat.com>,
 Linux Audit <linux-audit@redhat.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024212605.vmSL7ZLhwEuwLuOrINJjZ-suceYnJ-KM_P2Cnmpa1kQ@z>

On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> This should never have been inside our arch port to begin with, it's
> just a relic from when we were maintaining out of tree patches.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/riscv/include/asm/elf.h | 3 ---
>  include/uapi/linux/elf-em.h  | 1 +
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index a1ef503d616e..697fc23b0d5a 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -16,9 +16,6 @@
>  #include <asm/auxvec.h>
>  #include <asm/byteorder.h>
>
> -/* TODO: Move definition into include/uapi/linux/elf-em.h */
> -#define EM_RISCV       0xF3
> -
>  /*
>   * These are used to set parameters in the core dumps.
>   */
> diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
> index 31aa10178335..93722e60204c 100644
> --- a/include/uapi/linux/elf-em.h
> +++ b/include/uapi/linux/elf-em.h
> @@ -41,6 +41,7 @@
>  #define EM_TILEPRO     188     /* Tilera TILEPro */
>  #define EM_MICROBLAZE  189     /* Xilinx MicroBlaze */
>  #define EM_TILEGX      191     /* Tilera TILE-Gx */
> +#define EM_RISCV       243     /* RISC-V */
>  #define EM_BPF         247     /* Linux BPF - in-kernel virtual machine */
>  #define EM_FRV         0x5441  /* Fujitsu FR-V */
>
> --
> 2.18.1
>



-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
