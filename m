Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F108C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQtmF3NRq4h4xCfgLn/XrNDjcOkfufwhuKm92K+GqGI=; b=sqQyaAV3nhpvQ0
	BzTksec4eo4ZpyOjJUqucsoRcNfy21At2WQrOVoKQpyBLo3XriV8qzXgZXEV/STh9yiyX4JDUuKCO
	Exb8ow8SImIPFS+zJ6tGMPf5wIzkgsL7rhEfemPz/vIMJq5Pu7Af6SV4rey2R1t5XtX5XFn/mh/3F
	a86koTP1BfkvYDBt2gH7DEPJSiRoRJXMzfx+4FU1SUCMBIs+ZPD+1NZpltCf4Y1v3O0DLJi5oyl1Q
	Bd6BkPdy9RpFK1qOZqHovTyBz60cJhgYWuy01l/u6WlZbrgadxxHPHPgInU0IItxXZtfm6JTu025n
	8ZHpPL8BLcRC/9v8pZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRnT-003CMh-Qb; Mon, 30 Jan 2023 10:53:59 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRnR-003CLL-ML
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 10:53:59 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-50aa54cc7c0so126360307b3.8
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUC6K+TUdMSstlrzdppRdz/QrMCOXm0EOP7+90i1xZY=;
        b=ht9m9YFxQLFVsUimHeqoJwFOz8qFoSRwZxDiiTuUCr6V9x5I9kzETu5HZ7Rmjy4sEi
         fZhXb5qv67wtF+fT5O3UuWa+FO1COtdg5e+h2L1kz6syB0Vh/fbc7sY2LvOPYqFgz4JM
         wPEP8L+Z48T6Y/f7lzkOWKTluCOkEGZ9SxMMaXB4rb+AePPqGO3IckIkQOTgfEGw7zP/
         c2Mqi7wWoSXJaPWKSLOS5iLCgUz5XOrtLj7Rjb5HwZyghhU6UVRiQXKGEnbEWzxGOPKo
         HBisRg6xWKEI08xXgJdaZdfAf2SfbJwAkt9DNzkXrMyp6I1MoYB9R0TN1VDZhpMoLg+F
         TWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUC6K+TUdMSstlrzdppRdz/QrMCOXm0EOP7+90i1xZY=;
        b=PO8BYQSQjuC3tfyCFWn9Mc41pkofCBGXOJny3FamHsOJBwvPNMuqnblniF+s1BHM9x
         L8sQNCKAR2HlvC9DTwV3khGVddZUfuLc+sW0xmY6ZNrKBUAJF4GMNxbdf0ictU3Mg3na
         n3ka2VeWPKzQE4R/ZAH7lTazL1JEDY7sIPxSSBd1qUhbqHkd3GmapDNJ10aijOz1SzRV
         1GdXaYRQVNFN0T5SHBaiqbCR/HEg9KynEE1SUDiZkIbh/Rim2OHybt39xMXnMFjRrpCw
         cSsnSOV8SMAJMXga+Vm7Uq9YSmc+XE76XIjpvi2BhO31qD5vBYmjRfzIGTp8E5YXOe/A
         iyyw==
X-Gm-Message-State: AO0yUKVfvBZw5rIqt6XdnBZ37rDCNPNsENHx9rdBj04SX/m9+Ggu4qdO
	YlISCu51XMzB7ZOnU6xZnwbOnjlbKx6cS3JgWKY=
X-Google-Smtp-Source: AK7set8tcLkYYaI01/h2mGKxIOWC8zR7J8jV7aBtEhF+UBiWCM2HORVPRdg6Bslygx9SHUJanm0vt4LR3QDgRmsbg4g=
X-Received: by 2002:a81:b246:0:b0:506:55d9:3a78 with SMTP id
 q67-20020a81b246000000b0050655d93a78mr1975529ywh.339.1675076034014; Mon, 30
 Jan 2023 02:53:54 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
In-Reply-To: <Y9KQPxzHBuZGIN4U@casper.infradead.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jan 2023 10:53:28 +0000
Message-ID: <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
Subject: Re: [QUERY]: Block region to mmap
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-MM <linux-mm@kvack.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Geert Uytterhoeven <geert.uytterhoeven@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_025357_769089_66DBF4F6 
X-CRM114-Status: GOOD (  25.20  )
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

Hi Matthew,

Thank you for the feedback.

On Thu, Jan 26, 2023 at 2:37 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jan 25, 2023 at 12:30:13PM +0000, Lad, Prabhakar wrote:
> > Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> > memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> > virtual address falls within this range, the MMU doesn't trigger a
> > page fault; it assumes the virtual address is a physical address which
> > can cause undesired behaviours.
>
> Wow.  I've never come across such broken behaviour before.
>
> > To avoid this the ILM/DLM memory regions are now added to the root
> > domain region of the PMPU with permissions set to 0x0 for S/U modes so
> > that any access to these regions gets blocked and for M-mode we grant
> > full access (R/W/X). This prevents any users from accessing these
> > regions by triggering an unhandled signal 11 in S/U modes.
>
> I have no idea what any of this means.
>
Basically we are making use of the memory protection unit (MPU) so
that only M-mode is allowed to access this region and S/U modes are
blocked.

> > This works as expected but for applications say for example when doing
> > mmap to this region would still succeed and later down the path when
> > doing a read/write to this location would cause unhandled signal 11.
> > To handle this case gracefully we might want mmap() itself to fail if
> > the addr/offset falls in this local memory region.
>
> No, that's not what you want.  You want mmap to avoid allocating address
> space in that virtual address range.  I don't know if we have a good
> way to do that at the moment; like I said I've never seen such broken
> hardware before.
>
> I'd say the right way to solve this is to add a new special kind of VMA
> to the address space that covers this range.
Do you have any pointers where I can look further into this?

> We'd want to make sure it doesn't appear in /proc/*/maps and also that
> it can't be overridden with MAP_FIXED.
Agreed.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
