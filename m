Return-Path: <SRS0=2rL4=YD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2DEECE58E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2019 07:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850FE2190F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2019 07:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J5NoRyDl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850FE2190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JJpR+kieTmoHTN8BluiZjR7tYO/uziy5YHpi7w4x4w=; b=J5NoRyDl2XRr3D
	cAAtQNSkjeNLQsmUy6UF2Zyncu8ej9E7uRD2tbT2HWIkw+HgikRj3YVGH017ovCf6fk4yz2F71Rzi
	ua/CAfhRSpz4kAATmzA6OmB6v5Gk7SGpPFc5dLAO7k6zPEtjQMoGYRstirIENPqFS3Nz90WPwfugN
	WMccvHEGbXBWLtFypNaowEDNmZcqhbsdE29FzEUWUlAcnRm1EGQ5HuCtEBMfJ9uzsXMJKph9XMSqf
	ab5rsr7xH+l7pOaSylk695rotitXbeTKQcI3TFIB8MKRbEezU0HmB/yPHt4gt+zVn3kbYlKX4PM7u
	3IQp83BBbpjEyTTujzDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iISan-0001ey-RT; Thu, 10 Oct 2019 07:10:33 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iISak-0001dT-L9
 for linux-riscv@lists.infradead.org; Thu, 10 Oct 2019 07:10:32 +0000
Received: by mail-oi1-f195.google.com with SMTP id k9so4013115oib.7
 for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2019 00:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TU10B3nKbfIpm9WNlkT9iNcLTqsb+xgrJpyrz4+X/IA=;
 b=b40VZqqCxMjgttJTDHoEZrCczqEhRdVMun0bVobqkPhBjv+QWD7RSVzhb4ueSKeNhD
 ar9r3ITbY7b4Pp0yt3I7yQxFGZhfwWuNE0YqmpPx2RdfzzuZWsrweQXn0Ch8JQGi4mND
 1t1UdH7Xi2pQMtHqKyYDcz+0a1cAjiC+5YVDUaiCHIwPwBjVTLksN97+F22KlxLHsYl7
 RWI+55p1qbQEysyJE2UEwBNfy6exNEMw7z5ba2yCkBtWoWy/y7lFgm2tqybBaVfLSmQ/
 anYsGstztVDtUmdViThHdUFlEQFMmvSb/BIneTO0ZfOE5tOJW9JWUIQoxoEfO/SfThpk
 Y59w==
X-Gm-Message-State: APjAAAXsLpx3Qez7lX1p6CXu4a3VSEG4YWRYOB41EZAcLu2GzYwxJWdk
 tQEyu/3UzzMQ9BEmrQOrbmirc0xtEcTNK9Gj8as=
X-Google-Smtp-Source: APXvYqy+li7Xr8sM09s9qHeHYmcP9+9HHF++GuPo9eOazB7/UBi9MtzGp2SFtJxnjCj66BmyNdMv5eH+ZbbiswlC9f4=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr5896405oiy.148.1570691429202; 
 Thu, 10 Oct 2019 00:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2019 09:10:18 +0200
Message-ID: <CAMuHMdUfqvkVJHHwyuYxLSxj_iUofx-vSvEj92C5mg3bGxHqmA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: admin-guide: add earlycon documentation
 for RISC-V
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_001030_688575_0B108854 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Andreas Schwab <schwab@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 9, 2019 at 9:53 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> Kernels booting on RISC-V can specify "earlycon" with no options on
> the Linux command line, and the generic DT earlycon support will query
> the "chosen/stdout-path" property (if present) to determine which
> early console device to use.  Document this appropriately in the
> admin-guide.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
