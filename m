Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF44EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yrQ0oJXRrMnAPlmqEKK6/IJ7DEg0ptXII4b5Iicj/Q=; b=LrB88Ykx7XAudL
	kUyN790yiIck9UhwZhmCvMxL09lhFdVdojz00mbZ4+yTiIJabRPdiGtv+vR7RB9ZTu2cBsZ0uePwl
	3RtxHY5A01IsP0c2Cy9WUVgRyDHMIbcFDkXZqtOB1AuvszLiZeJ11p7eutmu0ecBa68dxkcF5Pg2O
	DUzDLDOxfwj0Ff6LeOLsuJO2a/1seTNclv9XxG/lW69H13aL7618uEAKm6YytfZ8C69MvuEcfBF6z
	ABOywljLf5PYZa10z9agl0WPpfSB3eLNRZNfBP1LWwvJkr3ZQ+jKNsV3aRimsVuVyxaRWsJpyCVy4
	T3d/SEtPZgUDE1oWQ6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlhH-004kdp-1X;
	Fri, 07 Jul 2023 13:40:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlhE-004kcU-2w
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 13:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688737225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSLQOQX2Flx1G07KYazrMVvBAcWU6hFPEM6DlSyIig8=;
	b=eI7HLyTquJeltXAjZjlZzjfX1r7qoLqUZYvGh2P/pdIC8xRT8HT6aHAG6nCDCTCDAKQOob
	deV/8z/8SxIHI5hfBWFQUbqzySdDDzn2lg6ngxmuOLEjH/5cdNgnoEqFfwLUO8+MeAxqmC
	KvajGha9WdFbG/Wy6k8lEd72MypWH0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-yaanWbL1M_Kx7buPzlT5MQ-1; Fri, 07 Jul 2023 09:40:24 -0400
X-MC-Unique: yaanWbL1M_Kx7buPzlT5MQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31421c900b7so959744f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 06:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737223; x=1691329223;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSLQOQX2Flx1G07KYazrMVvBAcWU6hFPEM6DlSyIig8=;
        b=brcJzxLudIihi0Qdt65etHT0Fu1kntZGINm+pE2sEsm2RZZ0LmK4vgouUxnDHGp87n
         Cezim3g5Ub0dGQvQHIJmtdoDyq0dOWgsyVdKzY1qPd38qIyaWDrIY+J92uUDgUolf32i
         NrYDelzV9uTlSCRGO0JxypaidBPOzJ7eZjekmTNg3PW20UCld8eG5Fs7Fzwn2Z0LN40q
         mbO20WHSmc78TNOB7/+l2q7+WDkCAnuI3dEm0wxPZOO7TyxxGXeNL4d1ijzw21VAC7rm
         2chnDAfr2jqJ+62UB2kkaWI7B2SZYGafh37tomh6VvoXC1NBUNO3Dnt+tnJuzS6tjn87
         /vsg==
X-Gm-Message-State: ABy/qLb/p8nH6TewcnoufRNyNDcvmKCq5ywTZH2XVgJPUEFUeZRuuZna
	4Gq5tj7RAs4jGUVRLMOl6gg7JNmvyQ4DorNmCavKdqYxdMEyFq1rP0vSZ3IsWDOQoAKY9IJK4Ef
	jQuAq9gyDlHMy6NHoRG1nw7c2NXGr
X-Received: by 2002:adf:fd84:0:b0:314:2c7a:d100 with SMTP id d4-20020adffd84000000b003142c7ad100mr3491313wrr.42.1688737223527;
        Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGembFVs9w4+Nx6kwExMzgs9gyKSxG86BN2Jn1gUhGo+dJC0cQ0C5x3R9/Olki3X8v+sW6RJQ==
X-Received: by 2002:adf:fd84:0:b0:314:2c7a:d100 with SMTP id d4-20020adffd84000000b003142c7ad100mr3491295wrr.42.1688737223237;
        Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d60c4000000b003112ab916cdsm4482161wrt.73.2023.07.07.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Ard Biesheuvel
 <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:40:22 +0200
Message-ID: <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_064029_026183_E09DE2A7 
X-CRM114-Status: GOOD (  19.37  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On non-x86 architectures, the screen_info variable is generally only
> used for the VGA console where supported, and in some cases the EFI
> framebuffer or vga16fb.
>
> Now that we have a definite list of which architectures actually use it
> for what, use consistent #ifdef checks so the global variable is only
> defined when it is actually used on those architectures.
>
> On powerpc, there is no support for vgacon, but there is support for
> vga16fb. Loongarch and riscv have no support for vgacon or vga16fb, but
> they support EFI firmware, so only that needs to be checked, and the
> initialization can be removed because that is handled by EFI.
> IA64 has both vgacon and EFI.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

[...]

> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
> index 5a55ac82c13a4..0c09ff7fde46b 100644
> --- a/arch/ia64/kernel/setup.c
> +++ b/arch/ia64/kernel/setup.c
> @@ -86,9 +86,11 @@ EXPORT_SYMBOL(local_per_cpu_offset);
>  #endif
>  unsigned long ia64_cycles_per_usec;
>  struct ia64_boot_param *ia64_boot_param;
> +#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
>  struct screen_info screen_info;

I think that only screen_info should be guarded by both symbols ?

>  unsigned long vga_console_iobase;

It seems this variable was never used since it was introduced by commit
66b7f8a30437 ("[IA64-SGI] pcdp: add PCDP pci interface support") ?

>  unsigned long vga_console_membase;

And this is only used by mdacon (not supported by ia64), vgacon and
vga16fb (not supported by ia64 either).

So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?

The rest of the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
