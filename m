Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10594C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 17:51:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972D5206E5
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 17:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qm86tsjX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="YTQoH/ZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 972D5206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=77WWEmgdacnOpEsr7cnJ0s/UBSuzkDuEKT0H08JobjM=; b=qm86tsjXI9rphnvNOzWXtVFAs
	koZJrGZjf/4iGtBgOuWp20vbyMV/NhXd63gweBt2Q6cyKBYFWA7F4XOY4phIcU/J0Unyq5kc6ymo3
	NlsFaWWSulDxho4qwYrs8vm4hBzTbRET73AYN1rgAbj4AG9zEekqhgN7ZmNyIZl9+fQ+WZLIyf3uk
	zsEt/aopp4dP1ncQVA73kgb1xG8lI5JdythKFYz6EkCX2eBpdRifOrl1JVJDoYE+HYYeOKfKoNeT/
	oUWg2FkckZ2z8uhRKV5SVaugSZIQCQQCTb+LHs0PNKBEniF9W/DCqANEBnugHxW8tVX/J+aPNqxIq
	nY9Gs6d9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMELb-0007Lp-Ey; Sat, 26 Sep 2020 17:50:59 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMELZ-0007L1-Eh
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 17:50:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id 197so4948620pge.8
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hTdWakHiHp9Vlr0UcT3ntAxXSZRAAFha6FtskJko8Jw=;
 b=YTQoH/ZPZdj0DZHE9slEFw8q8+yyJ9RzJbYifN3Ucgx/DTLM0FjB9VMp0WUnu8Fo4+
 PepP4szgSee/u9o/rZUz5w4EdvFNwMgZMo9tc36/8AbqiOwDHt9YGDBlUppMgJpBfzYg
 7AYr35Btmhq6fY/v1TxRh+eJI7r5vi/cmmXxwRzbSJABMWSkAqD6IFTaIS0HEHgp/Cfp
 tN55uKlV211JLSUPzCQU+lJ1q5hf4iMfO9eE6wAPjJetSUryuCCuOG3Th3Cb8D67Ylgp
 a08soHTvJAjhcXT3/C8o9EBOgZnEWPcMYHNgcsfXBIcjjylqjvM7KtPG4MQeXrBGk9Iq
 +Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hTdWakHiHp9Vlr0UcT3ntAxXSZRAAFha6FtskJko8Jw=;
 b=bpbIcP4/tJ1RBwyRoLdgo9IaraWG83vk/CtvBWff3+gVzjgFXP6C2ir27LyqyJ1o4C
 gvla+vBszK1mH7g+0aELwk8IyXNMpek3LDqB0roglU6G5YiS7kVWNDoQXoE2fPhIvkOy
 37PsJgMKvXiRqNqSHOjZnjKZwUSrJpH+Aviwpb5MC86CyfSgIltN4dXrCyAsKwPpl4nc
 h8hRCoSWQsSzF8uEcsFfusI7JHa/Vstrj2dxg2MBmOTcjqyAq10fwkr/QVWWdSqrXB6l
 YdHpFgCFR35FGqjP5capNKqoMXhsua9eAhiI+8XjQa3yZ5yo1xd8HEcZ2zG/6Za8qANB
 inLQ==
X-Gm-Message-State: AOAM532+ySAT69RoIr7+EW3LqJDXfhekA96DWvTaci3MA3yGdSAkIO2X
 wR3nnDZzQ84PJoETnkf7+Wwo2w==
X-Google-Smtp-Source: ABdhPJzfmrgaHodK6b5xlg8OXYJn9Q34MTXKO9hZBFMHRHq1Kp+6jQlqwc2rhCTpfcPOuGwpd2mh7A==
X-Received: by 2002:a63:6306:: with SMTP id x6mr3566849pgb.161.1601142653517; 
 Sat, 26 Sep 2020 10:50:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v10sm2328987pjf.34.2020.09.26.10.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 10:50:52 -0700 (PDT)
Date: Sat, 26 Sep 2020 10:50:52 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 10:50:51 PDT (-0700)
Subject: Re: remove set_fs for riscv v2
In-Reply-To: <20200922043752.GA29151@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>, viro@zeniv.linux.org.uk,
 Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-9b0b114e-a104-40b7-b4f5-ad64dbbbd5bd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_135057_603833_D0AA8D8C 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 21 Sep 2020 21:37:52 PDT (-0700), Christoph Hellwig wrote:
> Given tht we've not made much progress with the common branch,
> are you fine just picking this up through the riscv tree for 5.10?
>
> I'll defer other architectures that depend on the common changes to
> 5.11 then.

I'm OK taking it, but there's a few things I'd like to sort out.  IIRC I put it
on a temporary branch over here

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-remove_set_fs

under the assumption it might get lost otherwise, but let me know if that's not
what you were looking for.

Arnd: Are you OK with the asm-generic stuff?  I couldn't find anything in my
mail history, so sorry if I just missed it.

Al: IIRC the plan here was to have me merge in a feature branch with this
stuff, but it'd have to be based on your for-next as there are some
dependencies over there.  I see 5ae4998b5d6f ("powerpc: remove address space
overrides using set_fs()") in vfs/for-next so I think we should be OK, but let
me know if I'm doing something wrong.

> On Wed, Sep 09, 2020 at 08:55:15AM +0200, Christoph Hellwig wrote:
>> now that we've sorted out a remaining issue base.set_fs should not
>> be rebased any more, so you could pull it into the riscv tree or a topic
>> branch.
>>
>> The first four patch should go into base.set_fs, though.  Arnd, can you
>> re-review the updated patches?
> ---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
