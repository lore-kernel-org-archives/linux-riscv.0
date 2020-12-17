Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286B0C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:12:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20A523600
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20A523600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cYxgxBFMpfut3Hx+ymGq54SOXDLMnCf6jEXXFnhJchc=; b=qqlxwtBFjWxxelY3Le69NWAVg
	qoyO15QadwzH+Sid4VfY8XoobjJ2V4NS5TYxbdyB9BFFO7ndhI0y3W0wYkUGL36j6Qj9QhZnhAl4j
	jEp0BoUKb8Mi6pNL+uL0uKPBsAECUWPsWRB/irffBZQo61V7AYaBslNr7DOFKJK7qMvbgEe8aMFkd
	FloOV3bkWqtwi9csfeSj0o5rzEKOYDGBD3wxuF8Knd46fVywyD1IurcLsIqXF/fk5YGP4RDJGLB8i
	v7OfWjFPKbFgpUVVg4HG6GE6qzv2fYuxncwIY9LzYqChWXiqoaSMNexXu6if14PNiWtPxpRiZAY9r
	sJYoDLHLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpoOb-0002Y1-Ue; Thu, 17 Dec 2020 08:12:21 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpoOZ-0002XK-EH
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:12:20 +0000
Received: by mail-yb1-xb36.google.com with SMTP id y4so4548599ybn.3
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 00:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=skHxIoVLp+SMbkm5xPTdyHQT8ReVVH2SXONfbEQLh1M=;
 b=nkAk6meeSPTfVQoOzH9Vuel7uag9F+3v09xDADuWoDZ8tt5O1O7CEDXKgxZJfL/xjU
 NZbOXd8a7l37cmWJ/CL8ayHgLoa34/91MjagQyqIuqM5qxHkPIlcFX2rbXNIkklhmrxo
 eYgjAQxKtvUhD0lJq0rnDodlHWW9w0aaMBPptummXcfIMqJOkIPcWQqSPPi30t7WX/gO
 bk95oBIyqQhv/Gpr/43oxRlW38BM9StTXQY3K6SRkU+l9Y7jbOSL5lMFO2d8cQS27TYA
 Nlc5hCBpbrrSvLHSHnNJ2LGt27oxWCz5800FiYwDMBEBL0IiGx438wYhd68KY1GUo8C0
 +K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skHxIoVLp+SMbkm5xPTdyHQT8ReVVH2SXONfbEQLh1M=;
 b=FK6S3egoCrgFhU1P+2IErcqCv0FCLJ9q2OCcfLCCsD/whqMVTRsh/vn9LTC8fXqPJA
 ssXDFDIVJQ2NdDwgan9HXLn7HZNGwCatHfCwf0dDZl5XUdXOHRy+l9Ei5t1jocxQ6eXB
 YUu0k6wKJb3iSZKgXgkmevZkKTqX34aIKl/WjsAoDsSxTagGV1QNi87/ARwri3NOHJEr
 nKqJkh9QCaa3nnwt33CZPbUYIIaq0wVkF8DFfY2s4OCHyMtQof44Hiqu0RbfirR+A0hq
 6vO8/2sxNx6E8wp4EAG4C5tJrUdpDQEo3hKZuD9tBReUs4UQ7XNx7Un0g1De0+02tV6N
 Q04Q==
X-Gm-Message-State: AOAM530l3kg7/FWXhXM+V8JidbHaMoma6zbq6FtsMCwE0l6h2kwoTP41
 z39x2KPqPYDY9CDzt5EFtitF8h2WR51C65Icnj4=
X-Google-Smtp-Source: ABdhPJytF59c5M9wxGDMR+P9AjaSilWM8G8AgZFxQMPipoy/6/l6e4jTlnY40fFVb5OZC0Rc2Dy0eSocthoMbFXdrbk=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr57375188ybs.122.1608192735719; 
 Thu, 17 Dec 2020 00:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20201217074855.1948743-1-atish.patra@wdc.com>
In-Reply-To: <20201217074855.1948743-1-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 16:12:04 +0800
Message-ID: <CAEUhbmV-AirwmVDN9xWi8eLwH53PFdoc+eU3sKzosA19Xd36Ag@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix usage of memblock_enforce_memory_limit
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_031219_515656_6C1466B8 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Thu, Dec 17, 2020 at 3:49 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> memblock_enforce_memory_limit accepts the maximum memory size not the last
> address. Fix the function invocation correctly.
>
> Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thank you for working on this.

Tested with QEMU 5.2.0 on 32-bit 'virt' and 'sifive_u', with
fw_jump.bin used as the -bios.
32-bit 'virt' boots, but 32-bit 'sifive_u' still does not boot, which
should be another issue because reverting the original 1bd14a66ee52 it
still does not help 'sifive_u'.

Tested-by: Bin Meng <bin.meng@windriver.com>

I believe the following tag should also be added and patch cc'ed to
stable-kernel:

Reported-by: Bin Meng <bin.meng@windriver.com>
Cc: <stable@vger.kernel.org> # 5.10

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
