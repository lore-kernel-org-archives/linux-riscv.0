Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690A9C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 21:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD5B20827
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 21:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lf0ykUP0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9mSaYwF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD5B20827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yo8dp2uvUhjwBgDXZPS3qYHxnk1U5OeIm4kw4/dpxhA=; b=lf0ykUP0WBDvBL
	jVSe9iTYLret8rfBkjghcg1z40JuwkxwkIumAmpyovwTKKZX39C7dqJ6WwEHeJMG6LtPdAMb/IYFQ
	erjbGEY7RzydrDtryDfabIB4pnLFzs3jNMZiRkyJ2mbnWQSUpJ5AvVYomYQaSD/iM5Y3FAMK5zNEU
	jMKZhTEOAUbl8HYrFBqRfjV1mSsHC8P5TlLPG2hN0jrZYjUD2VgxvkBiq9J0oGfZOV2i4mcRm8kQO
	m7AgVhbJLd//f2ZcZ9i4W1EYj6n9yuOttniApMGt7wUJZs3wFChLM8DiuTDDK/bOEwG6NXElRRzC0
	3iyIBWhBtuEXlLL9Q4/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJm0v-0007Pt-EP; Mon, 05 Nov 2018 21:02:25 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJm0q-0007PT-MJ
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 21:02:24 +0000
Received: by mail-qt1-x841.google.com with SMTP id l11so252551qtp.0
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 13:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ljqT6SoS+BY1LMcOmQwe13XhRQucfFPBxgKJcODiIRM=;
 b=a9mSaYwFxCPW82bR93nbyF0AsfEyRi4KIDKtHurutkoYDG7wieZcl+LBJ2Jp1JPApt
 4t7a1NRETqfjsNVwAEoXGWuhavthZdKaLd/DUz++gvj3UGYl9sEnGgy4v90vU/FU/KTx
 yEzi3557R+Aj4rtTaNwLzDI5Ro/lmj5C3XCyqyaa0NcTyWShyAdpZb8sViTO2pjgLHVV
 +HrjEvZhDANrcctMTUWBgcWHoYNEUsPP0Wvp/pMxsz0LEtlRJjmLdhgwnavIciZRTue/
 kQg8RP7k51HDWP+LszdME+IoR3fSu6tfu2DtODY1PFSMpgxm0WUxgtjxMnnFArSMaX+h
 EO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ljqT6SoS+BY1LMcOmQwe13XhRQucfFPBxgKJcODiIRM=;
 b=sF5672JteVIlONepEnDROfhY2Z/YCYKuEd5DUIyYsg7t5l3G97xWAoJ371U0ZgcLeq
 F39COvDLg+PpO0aIIs08j4VW+LSNfTWJlQNk04pIVmwaeSNSLsZ7FKMbeJ/G2lO/cxBf
 q2I8U3sbWOwMtnwPsjl1dDSFJ07mbaCenuO/oyUKBstUaczmrPgTvY1GE+WVTJ/Sze2C
 Nss8GVp647IY96brzaTqM/YhzvH5OYTLLFos+6wG21E7+Xh2Ll+uI0nh8IiWB6njcoAp
 E+wBMllW0txraOoVyfQkaIk+8PRxNCQrt2HNrKk44c5+8Sb54XExSeAZkBiTQbQ3ir5Q
 vkFw==
X-Gm-Message-State: AGRZ1gIrsSeBjpc0hj8Rz0yXnY+rsbN4jZ/FOzdNfI+5pLegvwcL187w
 ScCMoTsGj9hdbcV8+U0h4vTW1ixnQRwQnzjqXyo=
X-Google-Smtp-Source: AJdET5fCtX/geySdHPn/wmHYy1uemNfp3BPj8wXl130/L1ep6JZkkf1vdw7WUR8i6awmitphtLSnUb2CjUEHmd1n1bQ=
X-Received: by 2002:a0c:e202:: with SMTP id q2mr22354958qvl.180.1541451729489; 
 Mon, 05 Nov 2018 13:02:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:9881:0:0:0:0:0 with HTTP;
 Mon, 5 Nov 2018 13:02:09 -0800 (PST)
In-Reply-To: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
References: <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 5 Nov 2018 22:02:09 +0100
X-Google-Sender-Auth: IHr4h1LdQo7jNbsY1coz9dhwie8
Message-ID:
 <CAK8P3a3KgBq72763QQauKNWdSv9ZRRUWMDxt1RycV6RxAJsCng@mail.gmail.com>
Subject: Re: warning in ./arch/riscv/include/asm/module.h
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_130223_597331_AC3C7E68 
X-CRM114-Status: GOOD (  12.15  )
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
Message-ID: <20181105210209.EgDcAEMQYFxAnSDADHWl9roGQo7WOW_ez0cKGpKrmhg@z>

On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> Hi,
>
> This happens once you enable "Module signature verification". E.g.,
>
> [..]
> CONFIG_MODULE_SIG=y
> CONFIG_MODULE_SIG_ALL=y
> CONFIG_MODULE_SIG_SHA256=y
> CONFIG_MODULE_SIG_HASH="sha256"
> CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
> [..]
>
> BUILDSTDERR: In file included from kernel/module-internal.h:13,
> BUILDSTDERR:                  from kernel/module_signing.c:17:
> BUILDSTDERR: ./arch/riscv/include/asm/module.h:11:34: warning: 'struct
> module' declared inside parameter list will not be visible outside of
> this definition or declaration
> BUILDSTDERR:  u64 module_emit_got_entry(struct module *mod, u64 val);
> BUILDSTDERR:                                   ^~~~~~
> BUILDSTDERR: ./arch/riscv/include/asm/module.h:12:34: warning: 'struct
> module' declared inside parameter list will not be visible outside of
> this definition or declaration
> BUILDSTDERR:  u64 module_emit_plt_entry(struct module *mod, u64 val);
> BUILDSTDERR:                                   ^~~~~~

This is very easy to fix:

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 349df33808c4..cd2af4b013e3 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -8,6 +8,7 @@

 #define MODULE_ARCH_VERMAGIC    "riscv"

+struct module;
 u64 module_emit_got_entry(struct module *mod, u64 val);
 u64 module_emit_plt_entry(struct module *mod, u64 val);

> BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
> BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
> 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> BUILDSTDERR:  }
> BUILDSTDERR:  ^

This may be much harder. I've fixed this type of issue for arm and
x86, but it requires a much more detailed analysis of what's going
on. This is often a compiler bug. Which compiler version are you
using?

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
