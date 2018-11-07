Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143E2C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:26:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD76A20862
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+UJxBVS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2bylybD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD76A20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgRjggOq5sdjlV2x58fHcCQkaeUZpsZS3wyPH7ODwU8=; b=c+UJxBVSlAFexv
	B15ZjBgc2RMpoxnrm6Kj5yVl86SWI0n49/OjpFbkHBpHZyE9odEbtS85SBOLOuI1LcYMTMKE0MKxt
	dz2cxQ6oC8x1/9SoO2Dkbc1TggG/v8xtSGkARTmFpoH6ADD8sU1ZOL+ORdYF1u4f3i//c+7NCQzoO
	6HZp+u0FfoNQYed8CYEOfSRsydRyTnIrh0cE1y0HH4yqTlMuCl6ogTLdNM5eqIRxMaemyJ9bXYQed
	Q9DjywZngGxRh6XjaO/7Jur52N7amPKuBuM/myuY3Ve+w9fHYULCniNVtFqzBxyMamP24P2RFRcSf
	ybOhNmp5MOa2+ktU15ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKSWy-0008Hh-OD; Wed, 07 Nov 2018 18:26:20 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSWv-0008Gs-K0
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 18:26:19 +0000
Received: by mail-ot1-x342.google.com with SMTP id q5so15623812otl.13
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NLvjBGObqubTwwxqbx0lqK0eMcF80ZZo46ca3Z0w8w=;
 b=R2bylybDisRAZTdkOwDJE5GR8iZ/Cn03SD+9wpms01iVR/s2NsFj+fQllsnM0UpNCh
 hg/RZQjkarvvJ5zVpa8Xi00b6qg6jSAZXXzs20QyblD0RueqGMesGFuZ7rpwGyUraS+R
 nPHBEKky8c/Zqvtkg50eTe5Ga0EFQXc5Px5dGgNwSB1SZRGdTgD5jsJl06IRpns7zw30
 JrncLD4LlofxKWXOG9vjzNvikJGBb8q498WA+S53Vpvyvrz8cfvZ6Je2j6QOR0vtDyjX
 r7j6EhCxE3OPfIU5uq7RvTRGavnrvk2C63oV1teh5qMa1r9oqOsKHUaO5iRwJIhHxw62
 Eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NLvjBGObqubTwwxqbx0lqK0eMcF80ZZo46ca3Z0w8w=;
 b=ga4/4a28vPjUO0uZ4D8vQsSlVIMxj8yOR4AtKu2UHxpbf9GE9Jv8HdHfEuoLO5pXAI
 S6ahC6qBeSEthKly5CfEe6YbAWdAAsFprnZoavkdnscS++mxMCejWkcVY4BfDL531rxl
 OxBrz9gFwAhYY5QNsMlNPE0ZOQK9rOAal4TvOJRwzxTKknBLfz5upYJz8UgElNARbK9w
 ZkxyElkBe8rnv7+otzQ8/2h0gZBnsMx03mPn/G11cSH6+jJ9kzMt8ZVWvz6cEC4HaV2O
 EcYsNZ7OvA1/gKCkzJOkOrN3S5fhLL8qpYLW92DnwjHK+ChKRPl/hykJ3pPopnXwdYQe
 L/eg==
X-Gm-Message-State: AGRZ1gJEu6o5wg5uzl3yStY0XtJAYUueBPM7hroGDVC4pgRXJoXo/xAW
 W0oVxrGRqlAG73WxYplToK1lSaKv6MD1mOQQ3iT6BJN2sVk=
X-Google-Smtp-Source: AJdET5fWX0U0eTFQpP3H6pV0IQJgRfgpYX7m2mSz0wTZypEGUG6vtPqzd8JoWFil+lA1KxzKZomeZSEi40BAu9XBBmQ=
X-Received: by 2002:a9d:3fb0:: with SMTP id r45mr786224otc.110.1541615166376; 
 Wed, 07 Nov 2018 10:26:06 -0800 (PST)
MIME-Version: 1.0
References: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
 <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
In-Reply-To: <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 7 Nov 2018 19:25:55 +0100
Message-ID:
 <CAEn-LTr__59kApb=kkm7aH0z4w-J9xG1rzhK1xDk3xCGSis9SQ@mail.gmail.com>
Subject: Re: warning in ./arch/riscv/include/asm/module.h
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_102617_683847_D5B5C629 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107182555.lV9aDQRuEiCmWjJPnPzpIZvn3Um3jTR1A8zDny_DTts@z>

On Mon, Nov 5, 2018 at 10:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> > Hi,
> >
> > This happens once you enable "Module signature verification". E.g.,
> >
> > [..]
> > CONFIG_MODULE_SIG=y
> > CONFIG_MODULE_SIG_ALL=y
> > CONFIG_MODULE_SIG_SHA256=y
> > CONFIG_MODULE_SIG_HASH="sha256"
> > CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
> > [..]
> >
> > BUILDSTDERR: In file included from kernel/module-internal.h:13,
> > BUILDSTDERR:                  from kernel/module_signing.c:17:
> > BUILDSTDERR: ./arch/riscv/include/asm/module.h:11:34: warning: 'struct
> > module' declared inside parameter list will not be visible outside of
> > this definition or declaration
> > BUILDSTDERR:  u64 module_emit_got_entry(struct module *mod, u64 val);
> > BUILDSTDERR:                                   ^~~~~~
> > BUILDSTDERR: ./arch/riscv/include/asm/module.h:12:34: warning: 'struct
> > module' declared inside parameter list will not be visible outside of
> > this definition or declaration
> > BUILDSTDERR:  u64 module_emit_plt_entry(struct module *mod, u64 val);
> > BUILDSTDERR:                                   ^~~~~~
>
> This is very easy to fix:
>
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 349df33808c4..cd2af4b013e3 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -8,6 +8,7 @@
>
>  #define MODULE_ARCH_VERMAGIC    "riscv"
>
> +struct module;
>  u64 module_emit_got_entry(struct module *mod, u64 val);
>  u64 module_emit_plt_entry(struct module *mod, u64 val);
>

True. Originally I was wondering if there is a bigger problem with
header ordering. I will send the patch.

> > BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
> > BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
> > 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > BUILDSTDERR:  }
> > BUILDSTDERR:  ^
>
> This may be much harder. I've fixed this type of issue for arm and
> x86, but it requires a much more detailed analysis of what's going
> on. This is often a compiler bug. Which compiler version are you
> using?

Ops. I didn't indent to copy this one. This one is expected as Fedora
has CONFIG_FRAME_WARN set to 1024. Only couple architectures
set that to higher number (2048).

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
