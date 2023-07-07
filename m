Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E0C0015E
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ6n+J8tcWSHdPToJoU3DWlr38YHKCPVH0zq3G1yqmM=; b=clZ+DCwFUuSA6y
	scWJtBA44LGoD8G3wFIlGjZXVOnbJ0O2d39cOTW0uYz9SEY5qWCnSfYhFE/STyX5LRD9nQzs8bnMJ
	d2zCSayLG4F+Myw6/sjypWhPHyX0lE/vaQ0hCEzSxUp4XkSOX+s07JImM4TUTC/Uq4XPVZ2f8R5TH
	I33cYMmKFkt/QnEEsEY+IKTTMhD5c/JQMuX0db9lKRu+lNWh4464QV05HgT+hFXjVlx9jmOLjjlo9
	kYCGZ4g2dvAQ2iI61FS/p3eJfGY/CDVq67TM5fTI9DMMm6J7TxGfhIxXahxdXYn41r/VoM99ABNmv
	YaDov3BI7GIOH3khAAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnMY-0052Kj-2j;
	Fri, 07 Jul 2023 15:27:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnMR-0052Hn-2W
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688743627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
	b=Xp3V7QpxR0t4kn3riQcIygCunUkXwI6NZ3Tna1R1/eSSKIttUgnUBIEMa0bUEAsweRM2gc
	U6nnWomAy9UZxVmI7MDDjcPICPUqvUyj2cWWhWFPcUxqtL/gbiqKCzm2QxuPCdKnlNpwQG
	VW5QSR7ucZvmaJXYRS7+9Gx7xwPi09M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-Vqyu_JiqMa612JTZ5N-hlA-1; Fri, 07 Jul 2023 11:27:05 -0400
X-MC-Unique: Vqyu_JiqMa612JTZ5N-hlA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3142665f122so1022681f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743624; x=1691335624;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
        b=Xg7UV7zlnmPBMl67NftA/JU6o3+mT5EMDJp76/Y1ZX3N6Nvb0nICjJGp4OLKmxTuvy
         tp73Pqu7Q7AwGRvWDzrZJtSWfhiYWgFmLFwd/u4jrqNMT1RVJEj3n1h8ZEsbEJTXzHef
         Av/dGCC0fsPRiUbAvWLg23w9IW6Jpymf8NLB5jnLnpuuOpzH4Y1hUySxDEFMdzyG4FGK
         DkYyRH+jC6bngllQLnv4583u+h/Mo4tZIOBsIHbKvcM7PdE2Hy0eZpwXVwbIBOTx9FZ1
         zdsKQd25zP2djAxPE1W0DGQ8vOBZFRsAu4OTaO3d1D/aD8MNBsR7Tu/8GwE2z2d4+MoS
         kBIw==
X-Gm-Message-State: ABy/qLaPpKFyOS89rr9Ma9Z4XH0tPtY9GbvBlPXs7D6pxRNhpZsiHI80
	Io+pK20BVCrm0hiXAka4sHlTYnC8aTWly5WZxiXI2WmnJgiI5G725Wu/s3j9IJeDT2iFBxIdqka
	eWWRdXqJ7U3fpQS7oq6BwuK4shbpN
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr4668101wro.3.1688743624749;
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmxd1jbrrvV1R0iu/TeFKW/e1nuXfI0DnXijMIXAlyALphvzgzqltgfOe8J565vUOEzxyvoA==
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr4668074wro.3.1688743624480;
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bl1-20020adfe241000000b003143c9beeaesm4711005wrb.44.2023.07.07.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Ard Biesheuvel
 <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky
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
In-Reply-To: <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
 <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
 <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
Date: Fri, 07 Jul 2023 17:27:03 +0200
Message-ID: <87bkgnyc6w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_082707_891344_E4C511D1 
X-CRM114-Status: GOOD (  12.85  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 7, 2023, at 15:40, Javier Martinez Canillas wrote:

[...]

>> And this is only used by mdacon (not supported by ia64), vgacon and
>> vga16fb (not supported by ia64 either).
>>
>> So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?
>
> Right, I though about doing this more accurately, but in the end
> went for the simplest change rather than spending much more time
> trying to clean up the unused variables etc.
>
> Let me know if you'd prefer me to respin this part, otherwise
> I'd call the ia64 bit good enough for the purpose of the series.
>

No need to re-spin, agreed that makes sense to keep it simpler.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
