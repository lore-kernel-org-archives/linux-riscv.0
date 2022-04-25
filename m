Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA20C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJuxfSvVRQf4Tu2GPhPJwNP6PWuyUF8ziwMgGQOfhD8=; b=si3NISLxIvNM4x
	7qwf/koW0ls3KCYdSZRxyONmzGyFhIFHanmitmJ+AaFDWbtYat+YU34Y7E+yP3toTObSvB8nCgHkI
	eM4qosfzwnAe5OQ3qirNwAbaN6r6rS8yLDYxCTRUN/x9gOkOn4vYCeF/h8iUIsDj9NFmYQT2tvyuN
	+oPa/SGUNTSnBKi1gp9LPNT7L84SMCVifTZFeirWoj0Hxg0vNtXK3SWjnYylbVsf1cuiOMVV4Ql4j
	dpPv34MuXbYjYSONfbqizA4mUDTTQ6sZggLeaSpHouHL9AmPgOm0Bw04QKIe5TtccRhsjB50uKnXf
	89ZupMhYmkvtqYqhgP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niy2m-009YG0-HY; Mon, 25 Apr 2022 12:42:20 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niy2i-009YDk-Tp
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 12:42:18 +0000
Received: by mail-qv1-f53.google.com with SMTP id jt15so5662282qvb.13
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 05:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZf1GrCckJe0wVu2MCyi5HuoNfLGjLy3HZ1VU5D0sTw=;
 b=fUEib01n8Mh/O7iVdn6AYxqw0eCWpAn5m6Tqrvm6PPMk4m+aNe2n8I5uCbOb9jfCaG
 A3//fHGmR49EdJ9UmfcpubqNItfSEWTYDevzZsY5H5Rrr6/vGjRWRh3H6NUCB2RXp0Gr
 HosGRRbn0Qp3JLVWUNRiwZEHEAL7EykfDA+UtlVP9fATyZ/9v2/uwjilLb4uKv6aqUoS
 J6dtBtRRSvZJ9Dgni9zM7FjG7OnTtbNOhbW16jyIoliMEi8BA+w2YfO2b8lQ8CUO25iR
 jHD1R/fS4mJPhvP+1AFgidhc+O9Qdgb3ADbfPc0s2nKHAD3ExrDV0R9p2fU1PNihhRdB
 WTiA==
X-Gm-Message-State: AOAM532ozOWJD1yZ1lQrT3ZGnTaxi3JWHzqdYuIDKxBJxt4sud1/HD7T
 aDDFM0YT9KbW5eVUIOFKZiHe87pwy4imQA==
X-Google-Smtp-Source: ABdhPJx3Oby+NvxSCkEJnGGSOOKtpgGgQ921Mc/PK4LYPnEykffv33X/K4Pc1jthdOhcQapdGHxLJA==
X-Received: by 2002:a05:6214:27ea:b0:446:54c7:a504 with SMTP id
 jt10-20020a05621427ea00b0044654c7a504mr12503724qvb.20.1650890534197; 
 Mon, 25 Apr 2022 05:42:14 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 n81-20020a37a454000000b0069e66f8a905sm4834754qke.17.2022.04.25.05.42.13
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 05:42:14 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id v59so13876080ybi.12
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 05:42:13 -0700 (PDT)
X-Received: by 2002:a25:d84c:0:b0:648:7d5e:e2d4 with SMTP id
 p73-20020a25d84c000000b006487d5ee2d4mr1960099ybg.6.1650890533603; Mon, 25 Apr
 2022 05:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220422211055.9278-1-palmer@rivosinc.com>
In-Reply-To: <20220422211055.9278-1-palmer@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 14:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
Message-ID: <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW
 supports sv57
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: alexandre.ghiti@canonical.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_054217_000358_668AC6E0 
X-CRM114-Status: GOOD (  22.44  )
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

Hi Palmer,.

On Fri, Apr 22, 2022 at 11:42 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> Similar to the previous patch, this allows a dt-selected downgrade to
> sv48 on systems that support sv57 in case users don't need the extra VA
> bits and want to save memory or improve performance.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This is on top of the patches from Alex's set that I dropped.

You mean "[PATCH v3 13/13] riscv: Allow user to downgrade to sv39
when hw supports sv48 if !KASAN"?
20211206104657.433304-14-alexandre.ghiti@canonical.com

For both: "DT describes hardware, not software policy"?

> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -740,6 +740,11 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>                         if (!mmu_type)
>                                 continue;
>
> +                       if (!strcmp(mmu_type, "riscv,sv48")) {
> +                               disable_pgtable_l5();
> +                               return;
> +                       }
> +
>                         if (!strcmp(mmu_type, "riscv,sv39")) {
>                                 disable_pgtable_l5();
>                                 disable_pgtable_l4();

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
