Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A23BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0299560F8F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0299560F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yHGnKLTp6L+HyRElYF3yZyhIa3uj2lt1FpVCd7Rb/Ek=; b=xPZr8axXuZgyf9oYPUUJuHH1K+
	pa8vpj5eMJg3JxcaXvZ36ReObA1kWbQ6qH+HjP8ut+RBXZJ051mpxz+z0ALUBhTRD/BNpMSGajYeB
	h4DuaS3fqog6PIMyVCQKS5HvAjfykm8E+fxvHAViVkoUVBh2tIX4lYyunrpNss9UTIGbrdl6yvI75
	BwYYMynbcqHtq/+QEzApgdNdaEVmWJgBIt9Ll/f497lRA0EL1M0nQjb3p5v5+7w1B9W6iLAyIeY7m
	16Y4PnhR2YIOWrr+eyApzFcJViNkcTV8qKCrkMa6FfcURuc0cNKlDYUGW1ksBOkKIaABL4bDAAubu
	UXGd0R5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOwmX-00EPEH-JS; Sat, 11 Sep 2021 06:46:33 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOwmU-00EPDi-4q
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 06:46:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id oc9so2815252pjb.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Byf12TJ+ZzJytO+/aTSk+K6Nx6eB3hCnyGXMON4aO+E=;
 b=HOj18WdhhreeM5OVFqnWwOq80WlFI29IU61xJgFKFBL96bZNKS2b8jiA9S8QstauL2
 5dQ1eXlCkW0IVcXJoIIYByyeur4GLhtqOsEaZNqA8JsWaL9BB4D//ub6HGqbZAKuhIAD
 kg+9mbKglkbvJgfVMAmO0uu9XweoteLSOYU0ouEQOU+3ZCdWoCgz77ATstfaRyHZ/Mb/
 7eo20ZGbnjGqtNnDpWIX1R2f294yOZoJpcR2f07ujm5U7mejRpGzNTXOlmvRzDYihxWx
 hBixOoC1F89yXY516ruYy2XWE97GIRn0Je7Fg2+YdAI2/ZN35UBEwUFEThMdkPfUAWDz
 ukpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Byf12TJ+ZzJytO+/aTSk+K6Nx6eB3hCnyGXMON4aO+E=;
 b=ZuCdI0jy7S02i7k1GYW9yVG+EBeUOMure2hppk+Ks0PCdQGQc7u3ZRpCD9jdMQXZz1
 KYHIv2TErnUM/0y1Sw+N4ruVhK1F5Np7Qt76bNs0O8cI93rq1OyiQxlIDH5R2WgSDJdJ
 uzI1Qtt0sBQxER5kUlYq5z8cDc0hKHnluh2if4/CUNtG9PnEGV+g0SEae+EifrSly8NG
 w/blCcPXeUFyN+iD16BOb/UDyoyKBGu3NrFbp2MyVdXPdwNpUGOK4zlGwnO6aP9NRQ9y
 Y4PKuJCDytyBzwrVP8x1jAGi3NPHb8oZ6mcFvBqqNS7+FcI3LhX7lCLsl+07yxtREEPH
 C53g==
X-Gm-Message-State: AOAM532TYP6OBr69vSZpb9idwYHdYPuwH/sSsQDiJFvVmycrehQx7Gl2
 0qQ/6ImIOBPf6tfex9xQ5b/YLA==
X-Google-Smtp-Source: ABdhPJz5zMYwyFJ/x3cbzNJcSEbvbWYqx9piMU6jONkVOp5hpoIYweqMyb0v8DBz6UqjFyCW2uQCtw==
X-Received: by 2002:a17:90b:4c4f:: with SMTP id
 np15mr1634891pjb.30.1631342788956; 
 Fri, 10 Sep 2021 23:46:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a15sm858356pgn.25.2021.09.10.23.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 23:46:28 -0700 (PDT)
Date: Fri, 10 Sep 2021 23:46:28 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Sep 2021 23:20:41 PDT (-0700)
Subject: Re: [PATCH] riscv: move the (z)install rules to arch/riscv/Makefile
In-Reply-To: <CAK7LNARVjdVf5QRFduKrxb-TJyiCdUPkpSSMtYiS7yN2yAZhEQ@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com,
 tklauser@distanz.ch, vitaly.wool@konsulko.com, 
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-2e119b02-3df0-477b-ba4e-4fa5c3eba1ca@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_234630_238961_B248A121 
X-CRM114-Status: GOOD (  21.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 14 Aug 2021 16:49:14 PDT (-0700), masahiroy@kernel.org wrote:
> On Sat, Aug 14, 2021 at 2:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Thu, 29 Jul 2021 07:21:47 PDT (-0700), masahiroy@kernel.org wrote:
>> > Currently, the (z)install targets in arch/riscv/Makefile descend into
>> > arch/riscv/boot/Makefile to invoke the shell script, but there is no
>> > good reason to do so.
>> >
>> > arch/riscv/Makefile can run the shell script directly.
>> >
>> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> > ---
>> >
>> >  arch/riscv/Makefile      | 7 +++++--
>> >  arch/riscv/boot/Makefile | 8 --------
>> >  2 files changed, 5 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> > index bc74afdbf31e..3c437fb09a07 100644
>> > --- a/arch/riscv/Makefile
>> > +++ b/arch/riscv/Makefile
>> > @@ -126,8 +126,11 @@ $(BOOT_TARGETS): vmlinux
>> >  Image.%: Image
>> >       $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>> >
>> > -zinstall install:
>> > -     $(Q)$(MAKE) $(build)=$(boot) $@
>> > +install: install-image = Image
>> > +zinstall: install-image = Image.gz
>> > +install zinstall:
>> > +     $(CONFIG_SHELL) $(srctree)/$(boot)/install.sh $(KERNELRELEASE) \
>> > +     $(boot)/$(install-image) System.map "$(INSTALL_PATH)"
>> >
>> >  archclean:
>> >       $(Q)$(MAKE) $(clean)=$(boot)
>> > diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
>> > index 6bf299f70c27..becd0621071c 100644
>> > --- a/arch/riscv/boot/Makefile
>> > +++ b/arch/riscv/boot/Makefile
>> > @@ -58,11 +58,3 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
>> >
>> >  $(obj)/loader.bin: $(obj)/loader FORCE
>> >       $(call if_changed,objcopy)
>> > -
>> > -install:
>> > -     $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
>> > -     $(obj)/Image System.map "$(INSTALL_PATH)"
>> > -
>> > -zinstall:
>> > -     $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
>> > -     $(obj)/Image.gz System.map "$(INSTALL_PATH)"
>>
>> Admittidly I don't see a reason to do it this way either, but it looks
>> like the other common ports (I checked arm64 and x86) are doing things
>> this way.  I don't really care that much about which way we do it, but
>> it'd be better to keep everyone aligned.
>>
>> Are you converting the other ports over as well?
>
> Yes.

Great, thanks.  This is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
