Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBC0CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcdHkIzf/CFCOqQjpq3VpJGV9iyEIDpbznW944UEXpo=; b=2orU0xZelGU+Ff
	MIGSRP4l1HOHqLtmjJ90/LWCG8s667fvPiKcEFd1YMhM2C1C9ujZKpQolSMkhOhx/Wc51pFTGbpWW
	5+QbLc3yLGJh0/uJ0/y40gqXo47sFZ6A+mPjwgmnQiQbtNrBK5DyXQAkJzWpjmZ6tHrgGyu+1QJnF
	NwZA3J5HHWkEBfmcx5JVoF4nEFSq4XsFcNYPf+v9ztyT0J4/Yp2xE7XvjeHronRPaIQ50bt6JgNik
	dp0skyY1U/QS7yVOKS7pKYQ+nQK2Rgn3RxHj+IJYUoW+oWxGmXVlTBHmAXOadcoNbciBasxS7jLix
	cAKfOQsU64KoZy7kKpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1u-0000000BkjW-01T3;
	Tue, 19 Aug 2025 22:42:10 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSRV-0000000BTuU-1MSi
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 19:56:26 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e934bcb7623so2312380276.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755633384; x=1756238184; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0YSSq8a6qNMYVsVtxnnlDI+CrQNR0wWlBueW3tq4rPE=;
        b=nCS0yuQyn/z3/RPqRtvfKwEBA8MTrT+0P5APK6NjljuK2z0WBpAYEgrPRCRf395M2K
         Zswap3nG0Qx893ONuVNfnbXjU6J0VhbZMDmwCNpy72XEcU2Gclb4vLD5IYdrP0Vn9HlE
         VRVL2Z53lo0oQuR2+2RpocHaRxZQ9VgNQR/7l0AHYk0cM/hrea+OGwtQQOa+mJdaC8y4
         yZWUqIIJZ3LVFc8phYSV4Va0/6vAn907SKXeyZZHk7G6kTyL50Dk6YuA2x+kiDKmoWUr
         ojKEy08CPMKB6Nph9HmC2PnZjvh0J7eyWHZcHsEAGjL1dQpdAnCK5CYo7A+uvBqJLMoB
         Nvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755633384; x=1756238184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YSSq8a6qNMYVsVtxnnlDI+CrQNR0wWlBueW3tq4rPE=;
        b=texpzpgbFDtHy7r7bnKaqqFkpcEIXlZpLave2J2DHCKZDCfgrCZZLAUHpq75641dib
         tatQzBPqAzsToBJPt1vlCw+tRJSqvliimXMhSnK4s5t/Cl8YLyevJ9HBryyJLcjpuDnU
         6cqKjecmqpG5FTx61zFQ4c7gtZ7OUM5NjN+B9a1euSfc907FwVMyBOJ5jLjn3w4Egwxp
         HDoSVwg2fis/QBLSL8hENLKgJNVjhaOZBx5c2ayxNER33B3DApuTR1B3FkKXUFpoT1E9
         iocFJMvZPSYPNoBGottkxeGBdr+W4hONk6/oTgrkj8RvlDJcuAnkxb//wNi6Ei2mB4FA
         ixPg==
X-Gm-Message-State: AOJu0YwHjeoLZPHtcvkbVibjwKreQ5xgV+3QMCNJrb8RfsQU4BBXKeSV
	MljSRHZW+0gVWZKq5tfQh7hvhWBHQnZ1p31S8ySbf7fdrEkirlcigJLFNJbfDuCAMttfhGqncnH
	jbYo+hW872W7xHH/p3RjQvIIbOcoJTOM=
X-Gm-Gg: ASbGncv3MGuqS+1EDXRyv1SsM1vruLvsnrMO0iWRPPQOIn4yU7nmbiW4CECztBHVHKN
	IgiT5mopuRoQG1FbtyW+fEjYlLqzPf6qQpgQMxJ7IP3KqeyvUE9dlmWgw6vwtVPqq/YSBgX+3x8
	J00avMkeufLVYIkJhphdDRxfTD9K4UJjniwhF1yeyZ9+nbYN6Pq9YZxdred39hzmT5fW43qLflS
	pYU/Ltdy2laXbuA1TYQhdlIOYW23/3KX0JkXzs=
X-Google-Smtp-Source: AGHT+IFdbfy0fxqRd3GjBip8j9yWAHQyrex8vYR/5+o+EUewPgvc1dcYAMzWAwGzsxo2/bPpxhVfIWhH22crU8sUUoE=
X-Received: by 2002:a05:6902:630a:b0:e93:3ba9:9e5a with SMTP id
 3f1490d57ef6-e94f659ec32mr481358276.10.1755633383709; Tue, 19 Aug 2025
 12:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
 <20250819-fa2f9d3392614bd654c530c9@orel>
In-Reply-To: <20250819-fa2f9d3392614bd654c530c9@orel>
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Tue, 19 Aug 2025 22:56:11 +0300
X-Gm-Features: Ac12FXzIQLU8vU26ZdusY9DGZ5ssPJ-ELU0uh3EW7_mIuxWhMhzAYP3TD3j3r5k
Message-ID: <CAAbFZ0g4xSRQnP_sVMR10zTPeJtYX2wo9Pi0SEcvbubEiiv6Gw@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_125625_364574_58BE89C2 
X-CRM114-Status: GOOD (  44.38  )
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

> When the kernel is aware of the extension

The way I understand it, there's currently no way for a program to
know whether or not the kernel is aware of an extension. When the
syscall returns a cleared bit for some key, you are left to wonder
whether this means the kernel is unaware or if the extension is
unavailable. A value of 1 means that the extension is available, but a
value of 0, unless it has any higher 1 bits, is ambiguous.

The new key helps because we get to decide what to do in the case of
no kernel availability. We can decide to print a message or do the
fallback or something else. Point is, right now we can't know whether
the extension is available in the kernel. For our extension detection
we never use the riscv_hwprobe API for this reason and always do a
SIGILL handler based detection when possible.

> What I think we need is a way to better automatically expose Z-extensions
> which are in the DT/ACPI. I like the idea of generating a sysfs node for
> each extension string. Those nodes could then have properties such as the
> kernel's awareness of it, etc. I proposed something in the past like that,
> but it was considered too Linux-specific.

That would be good too.

On Tue, 19 Aug 2025 at 22:37, Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Aug 13, 2025 at 07:33:48PM +0300, Paris Oplopoios wrote:
> > When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> > bit in the resulting bitmask means extension is not available or the kernel is
> > not recent enough to support the bit. Currently, there's no way to
> > differentiate between the two.
> >
> > This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL, which
> > returns a bitmask of all queryable supported by the kernel
> > in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a fallback
> > extension detection method when the bit they want to query is not available
> > in the kernel they are running on.
> >
> > Example usage:
> >
> >     struct riscv_hwprobe req = { RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL, 0 };
> >     int ret = syscall(__NR_riscv_hwprobe, &req, 1, 0, NULL, 0);
> >     if (ret == 0) {
> >         uint64_t bitmask = req.value;
> >         if (bitmask & RISCV_HWPROBE_EXT_ZABHA) {
> >             // Check for existence of Zabha extension using riscv_hwprobe
> >         } else {
> >             // Fallback to checking if an instruction in the Zabha
> >             // extension results in an illegal instruction exception
>
> The new key allows us to know when the kernel is aware of an extension
> or not. When the kernel is aware of the extension, then a hwprobe of
> the extension's key generates a result that unambiguously states whether
> or not the extension is available. However, when the kernel is unaware of
> the extension, then we still know nothing about its availability. IOW,
> how does the new key help? The fact that this example use still has this
> fallback path in it implies it doesn't.
>
> What I think we need is a way to better automatically expose Z-extensions
> which are in the DT/ACPI. I like the idea of generating a sysfs node for
> each extension string. Those nodes could then have properties such as the
> kernel's awareness of it, etc. I proposed something in the past like that,
> but it was considered too Linux-specific.
>
> Thanks,
> drew
>
> >         }
> >     }
> >
> > Signed-off-by: Paris Oplopoios <parisoplop@gmail.com>
> >
> > ---
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst
> > b/Documentation/arch/riscv/hwprobe.rst
> > index 2aa9be272d5d..6d77def0a46e 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -360,4 +360,7 @@ The following keys are defined:
> >
> >      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >          vendor extension is supported in version 1.0 of Matrix
> > Multiply Accumulate
> > -    Instruction Extensions Specification.
> > \ No newline at end of file
> > +    Instruction Extensions Specification.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing
> > the extensions
> > +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> > \ No newline at end of file
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 7fe0a379474a..501d49b7a02a 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,8 @@
> >
> >  #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 13
> > +#define RISCV_HWPROBE_MAX_KEY 14
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE    ((1ULL << 59) - 1)
> >
> >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >  {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h
> > b/arch/riscv/include/uapi/asm/hwprobe.h
> > index aaf6ad970499..a3b92df4dc05 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >  #define        RISCV_HWPROBE_EXT_ZAAMO        (1ULL << 56)
> >  #define        RISCV_HWPROBE_EXT_ZALRSC    (1ULL << 57)
> >  #define        RISCV_HWPROBE_EXT_ZABHA        (1ULL << 58)
> > +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0    5
> >  #define        RISCV_HWPROBE_MISALIGNED_UNKNOWN    (0 << 0)
> >  #define        RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
> > @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >  #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0    11
> >  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE    12
> >  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0    13
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> >  /* Flags */
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index 0b170e18a2be..40e7fa5f85f3 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >          hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> >          break;
> >
> > +    case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> > +        pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> > +        break;
> > +
> >      /*
> >       * For forward compatibility, unknown keys don't fail the whole
> >       * call, but get their element key set to -1 and value set to 0
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
