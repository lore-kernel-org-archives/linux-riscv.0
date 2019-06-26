Return-Path: <SRS0=5cCT=UZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE64C4646B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 08:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52A8204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 08:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+SOJp2M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B52A8204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S22cLHpO+aKkB8lJGFYZgGtVJTG7Ee0xJ13nwnxXwD0=; b=k+SOJp2Mxko/6h
	YTHQCGz8L1qhn228AzK2XbR3hLmA7jYNahIJ4gTFRJMBKSgPnVOJm2Ys4YaRMU6q1L6l3rydW7fy1
	t7oW9PciRJQZyjdDu2xBhmKIbS4cjOIEGfq73ahNhXyx0MmNtqlY6PEOFHjJvRSomDYnu6eZMCHLz
	cOi4m2dAEMSX6ghMJElDOMmDZyiE8e4fwGpAF1L+5qEtOacgHegPo8OOAdeMlvs6Zs9SfraaDSDkk
	SPfPWTtfiB7z0mxmDJbqcYJZfBAFIToYBUnwaNa1Fl2Z1sq7iO/owgA06IqWtOfUS4se6NbMpeIsZ
	AjraVSKt0DpXeW3P/i8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg38b-0007VD-4f; Wed, 26 Jun 2019 08:18:41 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg38A-0007Ip-LG; Wed, 26 Jun 2019 08:18:16 +0000
Received: by mail-ot1-f65.google.com with SMTP id s20so1667739otp.4;
 Wed, 26 Jun 2019 01:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0IVbKnkaSGCX3gm0GB9llTNW29e8KVqX77iAzmybS0U=;
 b=SzZGTtlTczVxH4KFeNyrc1+tzd2gBmHNEZMBA5ykmod2mA6W8rycqDzAxgtS/T4t8j
 R8/RbnsPC0j7gm0gzHODinwtE9+QfZADRqP+VQV0u0bVdiX85PIzY0D9DRod5aQOZy0h
 Htc3GSLxNLmaBCyy/qrNXN28F2fTXTBL5Xc9uOk93c6GPPmad1vPyfaq7Jt1AjyJIM3R
 LYnTMXsSm/csdlkkmTJcg1CQPm7t+4B385rYgkUT/mNl2BrYu9FBqxEAFp8zLYiCACIG
 8G+thWbmCJx87/h0A42ZOvyIHL+FXmtSNBIQD+6AyxEFfDTFu+HLgRPAXPDhoO+DDFMa
 IAHQ==
X-Gm-Message-State: APjAAAWQsK/efyuf2qBYGQpjb+UiYaYiLoll5KA+2emTh/UYEoh68F9I
 +plm9ttfItRlzfP2RlhsoK0/hXAKlkH878pP3EA=
X-Google-Smtp-Source: APXvYqx21GlpsHmjxHQKZ88k/g5/4tos1Mt5NsOKYjmDkJoG9anxOCkcBrQN/NZvOzKudbfMCl4uzn2PncvBxlK+Lzw=
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr2314425oto.39.1561537093283; 
 Wed, 26 Jun 2019 01:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190613070903.17214-1-hch@lst.de>
 <20190613070903.17214-9-hch@lst.de>
 <20190625222941.GA1343@ZenIV.linux.org.uk>
 <f8a61a8e-0469-a9d6-e0a1-01a4619d7363@linux-m68k.org>
In-Reply-To: <f8a61a8e-0469-a9d6-e0a1-01a4619d7363@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2019 10:18:02 +0200
Message-ID: <CAMuHMdXkMh+pOqPNavmYAhKXTVT12nC5gKc10CJj_CXME+uhWQ@mail.gmail.com>
Subject: Re: [PATCH 08/17] binfmt_flat: consolidate two version of
 flat_v2_reloc_t
To: Greg Ungerer <gerg@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_011814_708487_43B4BED5 
X-CRM114-Status: GOOD (  17.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Greg,

On Wed, Jun 26, 2019 at 9:23 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 26/6/19 8:29 am, Al Viro wrote:
> > On Thu, Jun 13, 2019 at 09:08:54AM +0200, Christoph Hellwig wrote:
> >> Two branches of the ifdef maze actually have the same content, so merge
> >> them.
> >>
> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >> ---
> >>   include/linux/flat.h | 6 ++----
> >>   1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/linux/flat.h b/include/linux/flat.h
> >> index 2b7cda6e9c1b..19c586b74b99 100644
> >> --- a/include/linux/flat.h
> >> +++ b/include/linux/flat.h
> >> @@ -69,15 +69,13 @@ struct flat_hdr {
> >>   typedef union {
> >>      unsigned long   value;
> >>      struct {
> >> -# if defined(mc68000) && !defined(CONFIG_COLDFIRE)
> >> +#if defined(__LITTLE_ENDIAN_BITFIELD) || \
> >> +    (defined(mc68000) && !defined(CONFIG_COLDFIRE))
> >>              signed long offset : 30;
> >>              unsigned long type : 2;
> >>   # elif defined(__BIG_ENDIAN_BITFIELD)
> >>              unsigned long type : 2;
> >>              signed long offset : 30;
> >> -# elif defined(__LITTLE_ENDIAN_BITFIELD)
> >> -            signed long offset : 30;
> >> -            unsigned long type : 2;
> >>   # else
> >>   #          error "Unknown bitfield order for flat files."
> >>   # endif
> >> --
> >> 2.20.1
> >>
> >
> > FWIW, I wonder if keeping that type is worth bothering.
> > Something like
> > old_reloc(__be32 reloc)
> > {
> >       u32 v = be32_to_cpu(reloc);
> >       int offset, type;
> >
> > #if (defined(mc68000) && !defined(CONFIG_COLDFIRE))
> >       /* old m68k uses unusual format - type is in lower bits of octet 3 */
> >       type = v % 4;
> >       offset = (int)v / 4;
> > #else
> >       /* everything else (including coldfire) has it in upper bits of octet 0 */
> >       type = v >> 30;
> >       offset = (int)(v << 2) >> 2; /* or (v & 0x1fffffff) - (v & 0x20000000) * 4 */
> > #endif
> >       ...
> >
> > and to hell with bitfields, aliasing unions, etc.  Unless I'm misreading
> > the whole thing, that is...  Greg?
>
> I think you are right. This is much better.
> The old mc6800 is the odd one out, the rest have it in network order,
> and this makes that much clearer.

Is that correct for Microblaze, which can be big or little endian?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
