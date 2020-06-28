Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4635FC433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 15:54:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1737C20708
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 15:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GG+55Q01";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiC2ieSA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1737C20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UFa/1RKRYsr0I0S7y3amZZ0bXEZRnccIp8CARW/CAFo=; b=GG+55Q01gSt086Xcz+IeMZNEX1
	hBEqzjhdN8ZiKm2743XjT32bbEGb1P+2B2DHB2hef+9MBN+PJmsfrCmmDpfeAypp9tFlykIAWYRDm
	GguIMwp2Gbc15Zw4+dvA8SRKvPNYobcLNaG/+ndkiuYvq3MQ8Kh3Ci4bAn3jyGW/X0ZUegyzLetkC
	8E6QqJXXFE3FBHtFDJN1kDIWgXB38I2EfckSGQOPjxlYjxHd10AJgYfJBw8gATxcZ8OMBNqgJYUdw
	8a6JmlS1SlSC95NwPeFdhngG+01CGEgLzTdHfxg6SdSlzMTB7U+iXKaOMttAnBpixgOePv+bUR6mE
	4A/RvBLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpZdS-0006iv-Nz; Sun, 28 Jun 2020 15:54:26 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpZdQ-0006iN-OU
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 15:54:25 +0000
Received: by mail-lf1-x135.google.com with SMTP id c11so7744636lfh.8
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VTpDcQBjCwiJ8l8+3Ch4PUjrLLpdEL+TIpPR5IHOI5s=;
 b=DiC2ieSA9PnX2540+pbN2TIMeTGgetesvn2H9cg4RZuo8IRjObHeSeg4hl2BrHAhJl
 jxJdsHao0LriRtuIdEmjbaSnQTmXg2YlfV3YpNPXUE+v4KQncaUuvmppf8lLefxNZy/X
 H19mwyRwerUDrIYn7/wAEwBQ2raQvFCigC4/K7Dz6e2rZvTfcNByI4dkXWdTmsVTA1ni
 MCQAhQDsi6tvNrgUC8ZcUHxVjMr8RFvMYvYkqlDNbjgLyNIR2mUyKD5VzPpNA9kQvWst
 aC8UjdZaPKyjFPko4Fp+S/mJZvVyvyWHj0aFStcZuBFr4wt05Dc7gBhVib09iY6uBpBT
 xUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VTpDcQBjCwiJ8l8+3Ch4PUjrLLpdEL+TIpPR5IHOI5s=;
 b=oA45EonZPVAIQEBBlz6kxtbzQYxke4ouMMzv34F5rEk+zNN5cF8St+5FIllLAq9zP4
 5ZW/9RptPPcz4xcKPmh9OBBZyXDMvMWxwlxvjntGg3tAA73UKyw0mDWjVNx+JyiNErmq
 fcocMkQ4OxFAltk1ue3KL7yt58JHDtSvUVo3C68PL9Q/FoqVildYHLrYyLejWKum3GD8
 JQzkH9I0ErmPaCtpDWZ7SI9PhJVKPIpCsb9xWNW9nh16j9t2DSJEpmkz/aiOyUp0NhYx
 FgDkt1xrGhsIccw1Znx8GClvnRz/CK2qHyteeTD+BN+amfyjNOA6CZUM2zGtHyMLlWoD
 9OcA==
X-Gm-Message-State: AOAM533FVCnG13ui9GwjxJdtmFICEp8+zF4l3+Q3XrdHZ/mxrP9RbvPl
 E83SpSlYRF9FJtMP87a9LBHA2AUdtteQAtZNPNSf23Cjr30=
X-Google-Smtp-Source: ABdhPJyXPzIJN9xNW/A9y9nYeT0HJSk2d0AujT0d+utWwdDuq7H0qOMhwX1OwQviQVP33pNxvI/yWcllatBxitDXnjk=
X-Received: by 2002:ac2:5090:: with SMTP id f16mr7291319lfm.86.1593359662796; 
 Sun, 28 Jun 2020 08:54:22 -0700 (PDT)
MIME-Version: 1.0
From: Drew Fustini <pdp7pdp7@gmail.com>
Date: Sun, 28 Jun 2020 17:54:10 +0200
Message-ID: <CAEf4M_BK29oDh94-j3+nixqfPi_r=13Svs4xOUCh_oYjPUg+pg@mail.gmail.com>
Subject: Kendryte K210: state of MMU support?
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Damien Le Moal <Damien.LeMoal@wdc.com>, 
 Sean Anderson <seanga2@gmail.com>, Carlos Eduardo de Paula <me@carlosedp.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello - as far as I know, the MMU in the K210 is still not supported by Linux.

Anyone know of progress that has been made?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
