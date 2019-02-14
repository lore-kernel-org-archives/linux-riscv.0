Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAC5C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEAF222D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJNJm2YS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEAF222D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4LWtbSiBgVFACLiBnC2RZ+Yf/H9zMC5AqDnJMbZekg=; b=HJNJm2YSn97NXS
	cZpivdDrx7b6aoLGAw6/vaj7PYO/JOhyHW7aex3oG7qdrOI9pKPdEKEf/KGlqH59kSUD4XTYwbz3l
	ZDw3QiGMcdI6d2s4cI16OmKKeR6D2+I1Yh72Rq7o70x2yTEeOxZK9wwvqFsRW7yLcX3wQPK8TuNH/
	2xDrcf2+tfdhUQzah4a8/EiCrdAVdYBin/kq0lokHjY+Sx/+3zkfdGIVnlAyKG1zD9DUNVoQ7KeHD
	9VzY8o23i4c482i+xsCq/p5IFv1dxI1ekHTnqhqK24+wbRQER2iZK+UQKG14pS3UULRopp9pEjBdh
	LaUZgLx98dJeiEAp4AQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guC6J-0002mj-T1; Thu, 14 Feb 2019 08:10:31 +0000
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guC6F-0002lr-F7
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:10:29 +0000
Received: by mail-vs1-f66.google.com with SMTP id e16so3110893vsq.6
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 00:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7mH6uc/WErzysdhYHrwGn+Za9Ii5z+9SMgUHEvVd2c=;
 b=ZAN4b4JsfVdub/3prVwjar3j/Mc1RX66sgifnCmW74HAIXLoEzi+IQqCMaSVZCHyXn
 3UsqEa/eoC2gAZ8zdWxIEadGfITMymnAXqz6VkPyjvwCm1lXsAHmwqeLy0V28xRc06tL
 aYgb0CN/IU/TBDAQEPT+W2uotAf4NEx/5jfAuDoBtVURpXnONlx32rYXXTXEiA+Zmu0p
 gIES4rid6Q0pjB2GQmxk2+rNulp4kzbPNX07tsXzhkatbR+/NNDpGYZxaHdL/ko+H7X1
 a1KNEECBLTfNUl4kDubm9sOuHmJMoTYGR/cNIYMm2kniCq58fhaMxgkHZKr0Mkx4H5Lh
 G8Lg==
X-Gm-Message-State: AHQUAuaUNQHM5KcEt4x7jGsGj56BWG2PmlzaaoMDOyBEeOrjypbpN1QE
 WQKN5gNXtJVQ50aqkT2Ows/frmei+iUeeMhh18ppsUva
X-Google-Smtp-Source: AHgI3IainHdtNgPKfyU8YjSDdQ+iRTA5h4usd5PDFEqXOlRT2t4Q7Q4DByDOzAkMWCZQ41k3lVfXLhI1reoT4R3LmvA=
X-Received: by 2002:a67:f43:: with SMTP id 64mr1331176vsp.166.1550131826029;
 Thu, 14 Feb 2019 00:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-4-hch@lst.de>
In-Reply-To: <20190213174005.28785-4-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Feb 2019 09:10:14 +0100
Message-ID: <CAMuHMdWRPm0_u2EX5OXeraZdKL602RJvbO5aKm09Sf-HKMGzjg@mail.gmail.com>
Subject: Re: [PATCH 03/11] kernel/locks: consolidate RWSEM_GENERIC_* options
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_001027_509123_8AA3F3BE 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-xtensa@linux-xtensa.org, linux-s390 <linux-s390@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 12:08 AM Christoph Hellwig <hch@lst.de> wrote:
> Introduce one central definition of RWSEM_XCHGADD_ALGORITHM and
> RWSEM_GENERIC_SPINLOCK in kernel/Kconfig.locks and let architectures
> select RWSEM_XCHGADD_ALGORITHM if they want it, otherwise default to
> the spinlock version.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       | 7 -------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
