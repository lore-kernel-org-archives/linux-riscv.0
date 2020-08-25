Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C78C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:21:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C4C207BC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFBERpmM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="dUzGSIj7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C4C207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=pVTFrC2QUDox86UWJUfozub4/8jc0+qXifcXZLxP9Z8=; b=sFBERpmMd66uAJ89EdpzoazxE
	jAMMnYDDwJQX/8ui1M6gl52D8X1uePllZ2apr4T1VUo9dulyFhOE/3deYOCpZv9aFDQ1irWf3VcTB
	2L5QYTPOEtLCLmW6zrG53x8mVAApuxiEl2knqlyrKX5W4f1z7priEZqKY+jrxYDKpwZN9t3rE8GqA
	b7XpJmcMS0WjoW7Q6eIO75RnUw027wrGUX4h6HbmTSjnx5R1tHMceSzpEBCXbUrxhb3O4U6B+Nun3
	3r4ZF3uRTxJ+NyWEIaYrGc3PeSUsI1IxLT5w1wZPRBtPFtyri4sCjygSXBACQGwlr/nLK11B8wPrB
	GWxTXtyqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAbhD-0006EB-1J; Tue, 25 Aug 2020 16:21:15 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAbh9-0006DO-WC
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 16:21:12 +0000
Received: by mail-pf1-x444.google.com with SMTP id t9so3572859pfq.8
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=L2oKOEupV27qICvhHWyDiF7Etr6coIqCr/1x6dmqhP8=;
 b=dUzGSIj7hwNgocfGDBX79TyuBWGD/fOm2Tg3Linokc59X0xu1MFMlmTbNgfGTy728H
 BdFE9PK3BVmeSzVuTlgnN53gSvnKvh9fS3mj7jGA2iZOsU1hhN4pIXHGs/JHtEk9cTmE
 FlEgt5s48sUOt/2X/olt0GRPSUg6ygVgvAiTmbiOEBpSP/a8sEbBASJ7otw07bfGV7gS
 MVA4xqoviXvU7lGMR6R587gy4jgLUBV9M8QV3Lj14ZGlZURKsqJtP0qdU88/Q4teVjUi
 Ie6nU3Zeq3C9ErwtB8wgQ5MxzDJQrcXiDyYuRHX76mNcCg+b2+icUn3keM2LOhjNxtQx
 yLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=L2oKOEupV27qICvhHWyDiF7Etr6coIqCr/1x6dmqhP8=;
 b=CHmvMjLErq1y2XzZiMvQlTB05MRXZtkBoy9engrHdMn3omNohcf28WDU1xZH8hxv4N
 5YUMPkIarmJJVb16OImivsWKBxu8A7IF8wUwAAHTlip8sIjAgWpD9FP1oLREaPULg4hh
 I6Ht4KXyyuQOkUvMc+nkoHZc/ToshFvelIMKnc49en1shRWmJQQUHovF0Orf5hh7F8zC
 pv858QHfzuqRsbssL42txqmqCQio0ESkLRfWr0pjxXuq73nZTIri5TcWxS1NPrwDpaFS
 QoUwa66UgVkNvH0m05CQYBpjMIvQe29V98LscXp8M5hTMsOWufe7SPqFh30fqEmmivzc
 pX9g==
X-Gm-Message-State: AOAM533LcUNKKk9rUTU3xjUFAPAFZFyh1ljga1dj9gyBj7TWPW2W3p/q
 tJWhMQI5yHpN3mFYS58Yi8tNuA==
X-Google-Smtp-Source: ABdhPJwebpb1N/6mwKYVqcIkEX1j6oogLtgxeUyZeXL3dpd734Qx9PxxGJc0uVXs+W09T/PfruA5eg==
X-Received: by 2002:a17:902:16b:: with SMTP id 98mr8256384plb.23.1598372469704; 
 Tue, 25 Aug 2020 09:21:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d128sm15020864pfa.24.2020.08.25.09.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:21:09 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:21:09 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Aug 2020 09:21:08 PDT (-0700)
Subject: Re: [PATCH 0/3] SiFive DDR controller and EDAC support
In-Reply-To: <20200825161958.GE12107@zn.tnic>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bp@alien8.de
Message-ID: <mhng-a19106aa-1a18-4fe0-b8c1-9c765f03f73d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_122112_033645_6B1FD543 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, james.morse@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, aou@eecs.berkeley.edu, linux-edac@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 09:19:58 PDT (-0700), bp@alien8.de wrote:
> On Tue, Aug 25, 2020 at 09:02:54AM -0700, Palmer Dabbelt wrote:
>> Thanks.  These look good to me and I'm happy to take them through the RISC-V
>> tree, but I'm going to wait for a bit to see if there are any comments from the
>> maintainers of the various subsystems before doing so.
>
> I'll have a look at the EDAC bits these days and give you an ACK if
> they're ok.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
