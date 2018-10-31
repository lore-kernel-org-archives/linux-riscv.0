Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4744EC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 11:16:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0D920685
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 11:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RplwACm6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ysz4Sgkd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0D920685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smSRDr4dUOJKIYMXkqEgMF6k0HWumVVns85WB6uZi8M=; b=RplwACm6HfxPRK
	kNJJkeCeea6mq5c/yLNFHJUHIuneVxtYvSOQgAyg0tUzoduLQtknE0RCSbOybhpShL7kkg7H4y8Ta
	Ffc6DBNFkxrvcPmMpO076ipLcpUdyXrGvVHa3af5+EJ8GNX+vMUQVJHDJwfBmfHTzky7QoXmIXZJv
	0Ss+qFLcer9Dr2965CGpOebexfGQGx7MLJ3vlE7hNAcVyZDxB+mfkLRZTLISxl2a5hpapEXhpHlb/
	7Xyl6of2XY8s48+KrSixB6ZF/RU7iDS2cRQas/micxTZO+q9LvYN8eNhBTtiEtA1APKlkR3TQKLIw
	+VBef10p1P8N5T7Ks8FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHoUH-00020i-A0; Wed, 31 Oct 2018 11:16:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHoUD-0001zR-Pp
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 11:16:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id a8-v6so14114909wmf.1
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7vQvy5KLwqrDn7EUCo/8EmVFC5IwBb3hk8HLIvk7rnU=;
 b=ysz4SgkdjfFcFixMYBOz5KUEUklcvWIU6ajJ1JuDQjuxGeymuXouKrClLdFTJCDI61
 fqQSsVykHVcvdsVQc5FI3mkEYM7p94y2qFM2bvikJUsuSGyhcLSX3aLlGDimBYFn+Ivo
 wOvUZ5hAFaJ0vlZlRogMCZ+SSuZ4EBnwU+ltDRI2SilKMXmLE184joVL1K4jk6OhMoSg
 xRn2asexGTKWstpdyKmWXpyBcD6gpLcLmxUwKgazLBcmXlyi2lvpJDb2zH2aph7pEY8s
 OF1Lr1sK+9h71iO4dD5TjRd8iQFXX3bWqMtjEycWpuyY6bZ+oZBStRH57IVc39d+mbKj
 sdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7vQvy5KLwqrDn7EUCo/8EmVFC5IwBb3hk8HLIvk7rnU=;
 b=Pn8D0V4IH/OBCwQxs0pMsi9faCFYI9RYF+TeTHhS77GZBZsS1qygK++r+ewG3sUElw
 gBLiw4yKWKPXSlk41/2/kVM2Lrd6TRuKSC3tS1ewR5gyBmkLDG73lLuTO4Kyy1gK+Qi9
 ymqlsIgmm61YvnxvQTa8i6ZX3z/bUxOCtXiQlwTyt9231nXMog+lJQp2Qlx2Ki0il7+m
 N4Mfmx7MNmcYcpP71WbqcnNJVjQpSOrLQ0/+h3gnzOJUzejv/gj3yQZLK38gpUGR+2F0
 eSZX0qJ5m/aqAin67G46u1NzqCmFjllAz1g0wL+1h4y+Z+dqwguc6SF3v0kxBwlg3e7p
 XR2g==
X-Gm-Message-State: AGRZ1gLLOmNvjX8Mw26gcrFgNHcCzGJ87fPS3ZoivLLU70fLTSfYJrhf
 MkqRDS2TJcuqXEXIBWxHsZ2lJsv6E0V7p0EfaEL46g==
X-Google-Smtp-Source: AJdET5faAzyy+wMLbmtf7+Merb3jsa/FDSCEvJNlc6neDZoPDcplqXrtuTRrCPNaLqPYj9XNn8U4DJuj4ZT15nu0/BU=
X-Received: by 2002:a1c:cf08:: with SMTP id f8-v6mr2003559wmg.56.1540984581673; 
 Wed, 31 Oct 2018 04:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
In-Reply-To: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 31 Oct 2018 16:46:10 +0530
Message-ID:
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
To: vincentc@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_041633_838031_FD8EA817 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 alankao@andestech.com, greentime@andestech.com,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031111610.x4sCcNY23xfQB_TPjZWW6D4ii_H_ShPFRHjSV0t5y3s@z>

On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
>
>   RISC-V permits each vendor to develop respective extension ISA based
> on RISC-V standard ISA. This means that these vendor-specific features
> may be compatible to their compiler and CPU. Therefore, each vendor may
> be considered a sub-architecture of RISC-V. Currently, vendors do not
> have the appropriate examples to add these specific features to the
> kernel. In this RFC set, we propose an infrastructure that vendor can
> easily hook their specific features into kernel. The first commit is
> the main body of this infrastructure. In the second commit, we provide
> a solution that allows dma_map_ops() to work without cache coherent
> agent support. Cache coherent agent is unsupported for low-end CPUs in
> the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
> need this solution to overcome the limitation of cache coherent agent
> support. Hence, it also can be used as an example for the first commit.
>
>   I am glad to discuss any ideas, so if you have any idea, please give
> me some feedback.
>

I agree that we need a place for vendor-specific ISA extensions and
having vendor-specific directories is also good.

What I don't support is the approach of having compile time selection
of vendor-specific ISA extension.

We should have runtime probing for compatible vendor-specific ISA
extension. Also, it should be possible to link multiple vendor-specific
SA extensions to same kernel image. This way we can have a single
kernel image (along with various vendor-specific ISA extensions) which
works on variety of targets/hosts.

As an example or runtime probing you can look at how IRQCHIP or
CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
hooks should called in similar fashion.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
