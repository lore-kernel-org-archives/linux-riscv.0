Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE2DC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1BC2148D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 06:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0j1qSNM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="HBY7dkAy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1BC2148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5ejFa3Tqp2OJRES9K2Z59NpjE7W500cuOT5nqJCFZM=; b=B0j1qSNMzqsXRi
	8gvxLYAmQDEW8LuPPAFBOG5Ni566WyuxBjRY1CZaZx2FMxY1ysaRKsc/EXt/170H95Yl7EIKsiOh4
	CvaD7A1mHAfjPjJZBhETLPiXGBGUow80xSkX3POutgeJmPxafozVDSKKSyUuRZhQJxdTx8ZXQpuy1
	4faT+GWZUywjf43gXD9wVNfpSZNcCtyZiAtu+PxxX5SGoHaCIMo5TqWn4AxxIpOjl5GsV0uh3cJQK
	/ofcAobVhoqmmg6pxGQNPqI5wzgA4z1Xk8z3k6ejrgDm12HUC94qxMWQ+sIQPt2QL084Wcs2rF8ef
	oOMDxao4KKAfwOz6tYaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJBfS-0004Fg-Au; Wed, 24 Apr 2019 06:46:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJBfL-00045J-CY
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 06:46:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id c12so17276852wrt.8
 for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2019 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AyVK2GRakZiSagpjjAHHtZd/+k3S6z9JMKxhTl4oqnk=;
 b=HBY7dkAyqC/HNR6mbKXMpZUMyhGjlkdKC62ZFnZYR5uBPx8SHDEmBv6ED1ytC9vtH4
 RTVl6nNHJQbWTzaozEuAwJSbGgIPnbI83yCwU3+gE+YVQDkVtjlRf0ZM2Ouj9KzfYfUp
 YnWsVi7npWgoTCdpANmv807o7SDGbttPdKMVqK3N9jNvdyr/s2DoGwPdcXav8wGPb1zf
 OJ/9pxg5K10iquAiPB6zFKbM/xDGiEXIN4wYtSVhxSRn68arFNd9FQj6RRzsOW5Y/8l2
 qck+ko5bSQm9K4CCVJb9fW605JGurqLUudZz0jhCZI12+1ZlUoMUMkCMg4cpuTUcQWU2
 uenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AyVK2GRakZiSagpjjAHHtZd/+k3S6z9JMKxhTl4oqnk=;
 b=j6FKkwpCzcRPsLHJEoNK/gmtd8kfmnLkv0NnlP1a5SFJD7kKgJ6FXMAwheEWaRW8Zs
 Ua37sLCu7GeQ7M8b6uEXG2SVgMb4YA+jGM0WgQ4T4H1MQY//xg5IqSkiVGYaDPM0XuEA
 PT9ZeIhUpuvc98KJ701dYBDMd15c9jHaLTSGBgaLp7TeeJKIu6rmadcNGh9cFCVY+W3U
 GGhDHJ91o5PewJkKf3qgmM4XOrd7kx7VM8+D27st9N4wboqHP9r83NAulZEHKBfWVZDu
 98pVycrjs7TbRJlNEFg2ltBtB3FmC9hqTiSKWECq4OorvD1fk5MxTpNu9onQQBVKV1LJ
 tTyw==
X-Gm-Message-State: APjAAAUYd+sFw/uNBPBJykKOhvS8RV/JWUo+TgdDAz9BuZCqswZSGmxF
 mgZrEXlKDm1cvi92EmDfYNSRNo3NH4JvIuvmc4uvxA==
X-Google-Smtp-Source: APXvYqxnhEnqYUaQjOU8P7vuX1aGF73xOst194+h6qMRyX7r29YrcCS4BF62VPpUrDDVmD9r4VXvO8hQgndSvryLl2E=
X-Received: by 2002:a5d:5346:: with SMTP id t6mr21566738wrv.59.1556088357115; 
 Tue, 23 Apr 2019 23:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190415093648.7525-1-anup.patel@wdc.com>
 <20190415093648.7525-3-anup.patel@wdc.com>
 <20190424062947.GB10400@infradead.org>
In-Reply-To: <20190424062947.GB10400@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Apr 2019 12:15:45 +0530
Message-ID: <CAAhSdy1Xc9AjPKY0RzLL_qsBs6wax23fi2BTVtMhuS0mAoKZmQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_234600_128393_D340074F 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 11:59 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Apr 15, 2019 at 09:37:23AM +0000, Anup Patel wrote:
> > This patch adds SCAUSE interrupt flag and SCAUSE interrupt related
> > defines to asm/csr.h. We also use these defines in kernel/irq.c and
> > express SIE/SIP flags in-terms of SCAUSE interrupt causes.
>
> I'm not a fan of this.  For one this pollutes csr.h with bits not really
> needed by most users, and it makes adding the M-mode nommu port which has
> to use the M-mode causes much harder:

It's not polluting asm/csr.h because when we get interrupt numer in lower bits
of SCAUSE CSR.

These defines certainly belong to asm/csr.h because they represent possible
exception causes when we get interrupt.

We need these defines for programming HIDELEG CSR in KVM kernel module
so it will be used at multiple places.

>
> http://git.infradead.org/users/hch/misc.git/commitdiff/1221f5c32345ebe7ea2c1cd6e8a01ad4b422aaba

You can certainly use these defines in your nommu commit by using
"#ifdef CONFIG_M_MODE" in switch case of do_IRQ().

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
