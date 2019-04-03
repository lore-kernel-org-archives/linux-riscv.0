Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28C8C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 04:49:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7B720882
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 04:49:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k3LEP5HC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="UfkepF8D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A7B720882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41J9xXsrpfsaeyvMDFZ3ej2SDRWqGQb3tx0SkGEbldQ=; b=k3LEP5HCFg9OTc
	ukehoh5v0Fp2NHu/IYYBjX9c9LKtLGoJB83WQebRoOweZpc6E3+5wouTc0KdOfSbdMcU6Uze4wxVl
	ULUnUYWNHD91Di+IIfTn7o2seArRVXq1U2c5ZKIqWqF1+W7Cirk/oo0Q4cIKlDkznF12kwee918eo
	I7MHRyctPRtbmfho8GjMJ8l7r6Bt4dqipYnVbRzAs2RoFJI9yL03ijFVz8cGuc+knS8WNrUO7PGZE
	5JUsuM0E7LtaGaoGCglJBa5SQXkN5luu6WGG8V1RNHtQ8wAZrkgLyC4C+OA+byD6jTAO6aJDsZB5u
	j3PjlhH/gXNOZlHTUj2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBXpu-0002ml-Sf; Wed, 03 Apr 2019 04:49:18 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBXps-0002mU-H4
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 04:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=J2yPnwpo1zaHuUEejvXXUjfEb0WLmg+jPFitP8npvZM=; 
 b=UfkepF8DjynlVJCy+Yqz/OtVtW9v+AiDoryz6DO+7Y4WF1gFlC/Mee+HOT0LnHxEfbws3rQqMKOJqvQh8jrc3OFGGSGh1Gp0IdclLUCb+aN8cw1aEoWWZhDBAZg0fCf2lb/208hNRu8IDctrNG+sf7FOc4eXa1DvTVjaso9Zl6w=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1hBXpo-0006pi-C3
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 04:49:12 +0000
Received: by mail-lf1-f53.google.com with SMTP id d18so10657964lfn.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 21:48:56 -0700 (PDT)
X-Gm-Message-State: APjAAAV4sVPthpdfQetOmuDdMprqNKRIVXAbfbL69qtY6bWcPMhqH5d9
 Vme8V2UjVpvumNRUwJ2PrMO3Uq9fC8ebk4cf1+Y=
X-Google-Smtp-Source: APXvYqxS4N3IUG6PpWr/UoAMiYMPGhAvgDYZeld0Ard0rlLhyoJFlLHFvfec955nWlsjPJWBRQrSqCkT4juEI+iNL28=
X-Received: by 2002:ac2:5921:: with SMTP id v1mr26059179lfi.135.1554266931464; 
 Tue, 02 Apr 2019 21:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPweEDyjP7iyoyuHVOUPpJSgQzUZkx5Zc+yC2kFKjuxYELEXSQ@mail.gmail.com>
 <mhng-a66e2566-0146-4da6-bb93-15d7feb0c1b5@palmer-si-x1c4>
 <CAPweEDy-fDPZ5JO-iMPucigpQ45PH81n-v5sQhh1bpvrsnnYtA@mail.gmail.com>
In-Reply-To: <CAPweEDy-fDPZ5JO-iMPucigpQ45PH81n-v5sQhh1bpvrsnnYtA@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 3 Apr 2019 04:48:39 +0000
X-Gmail-Original-Message-ID: <CAPweEDx=FDQ6QQjB2z41YOdk4jQ5RLY=BFAsA9Oi5wRozVF2Hg@mail.gmail.com>
Message-ID: <CAPweEDx=FDQ6QQjB2z41YOdk4jQ5RLY=BFAsA9Oi5wRozVF2Hg@mail.gmail.com>
Subject: Re: [hw-dev] Re: [isa-dev] UNIX-Class Platform Specification Working
 Group
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_214916_843803_8467A938 
X-CRM114-Status: UNSURE (   4.38  )
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
Cc: Rick O'Connor <rickoco@riscv.org>,
 RISC-V ISA Dev <isa-dev@groups.riscv.org>, Gurjeet Singh <gurjeet@singh.im>,
 Atish Patra <Atish.Patra@wdc.com>, RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V HW Dev <hw-dev@groups.riscv.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

https://entertainment.slashdot.org/story/19/04/02/218226/justice-department-warns-academy-about-changing-oscar-rules-to-exclude-streaming#comments

that's interesting.  i was not previously aware of "Section 1 of the
Sherman Act".

Delrahim cited Section 1 of the Sherman Act that "prohibits
anticompetitive agreements among competitors." "Accordingly,
agreements among competitors to exclude new competitors can violate
the antitrust laws when their purpose or effect is to impede
competition by goods or services that consumers purchase and enjoy but
which threaten the profits of incumbent firms," Delrahim wrote.

i wonder therefore if "deciding the standard RISC-V arrangement was
the best fit for this group as well" - excluding us from that
decision-making process constitutes a violation of the Sherman Act,
given that "profits of incumbent firms are threatened", and
"competition by goods that consumers purchase is impeded"?

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
