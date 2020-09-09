Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E63BC433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 20:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2776E20C09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 20:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6my0WGD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="MiqgAN2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2776E20C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0hZwKCU+d0dZStlhPzidCLEKR0UQY61DkqqXlVpWROo=; b=A6my0WGDxRqMFZI86Q2R1JdoQ
	p7RNr3vOMs3UaB66yWumFwtnPWccpCTtgM/KhlYGS55jprKlML7n5bzDLUf+BnmvAjlfgZfQbiL3h
	83gY9heIfH42Qi8ltOilBAVCLFkdDrA+myehBPBk+9QeAurDMlVPzRT/JuXWqeLGjNThyYKbnLuG8
	fTi2z61gWDL4O4/w54VJ97z7jyILum8i9O3u3BaHMooV6UeJ4pH1srUK7OT7bqW72+zj3TRuwbXd2
	q14Kvv01LZ5fp3/9IPBHVAz2BFUBrnO53G0RLK8XCMOYF9tOKadidSZ99Txx8D6nfiofLlpM7EcVy
	shNhz0iUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG6kG-000519-5s; Wed, 09 Sep 2020 20:31:08 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG6kD-00050G-1I
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 20:31:07 +0000
Received: by mail-pj1-x1042.google.com with SMTP id md22so275558pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2020 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8+h8nOrddZ60rlqGY9p7zSWVef5h+u0J2bJfQopxnyQ=;
 b=MiqgAN2OnenhsyDpyowqhXqf6C6CRJ6jVfkqQesa+MBeanQoilnFquVDff+DJUzapj
 km6Fowe25oRZ+qYHDZ/VAt5qim0j3EzThGbAvQLyq1faD5fUYevP5KAv+B92wZwakyHy
 Zmx9m+FV4gP+7WUYXWgW/vj+TXgnADnqytLUWTVwZDzpeQ56e5VOKivWCizhVSxJatFE
 QvFmSFuSVVV1Z5wkPBoljWJHLfw1eAy2OH3dsz4qGlgnF1QCCuH9nWMWpMHNQs1Zq9OD
 N9TuKc5tCYspc2dDK//nNIWJ8mfrH+k4RDSeYINS2IBNOO3QMf0rqUj7mBDbZygGWI30
 FwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8+h8nOrddZ60rlqGY9p7zSWVef5h+u0J2bJfQopxnyQ=;
 b=ZSfV5suZdW6rnkUWyWNBD/jwVs202WyQMSrIod5nlCpzNRM96bJM8lIkPbcRn2GWTq
 BJ0f4b5bbgx6nZFu1TT17eV/jlDOHZLdnfhHoxDvxn+t2adNuoW/pNg7etAU+HYoUaxX
 heBtossbFtX9nnQA/yl2j1iLmySavx6C9/tlDoWwHiojlgGDPum420kOYelUo0P+cx+K
 mewq6ETix+iGefyXF4TDHrrUAbkwI81TWd/c3Pkq5Co6CvAoB3Pfh+vmhFQEdrbd0tNK
 R4mU6/j5uthl7G36UnE9vOLV8/2fcCU//Lp54NhfntJ+wHWMYeAKmkzsQdl7DJ9yoxcq
 81tQ==
X-Gm-Message-State: AOAM533AkSGK2jIZR2apt1Xi07tG4P92yZQEQ43YU1o/96avpTwRzRCt
 cdCWMPI4jWJm+ocbao0OEJbVuw==
X-Google-Smtp-Source: ABdhPJxe3euwzyJoC/f5HEii0QnaurgSe+quMpchKvFdeV9Etihcx+hbO9sMKi7a+vuksp+62X0OeA==
X-Received: by 2002:a17:90a:3e4f:: with SMTP id
 t15mr2308869pjm.19.1599683462094; 
 Wed, 09 Sep 2020 13:31:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 31sm2962434pgs.59.2020.09.09.13.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 13:31:01 -0700 (PDT)
Date: Wed, 09 Sep 2020 13:31:01 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Sep 2020 13:30:24 PDT (-0700)
Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
In-Reply-To: <20200909060045.GA13647@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-1b96da02-cbf5-42f4-bc30-a1c5c9cce5fa@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_163105_120535_6F871551 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, dkangude@cadence.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com,
 Christoph Hellwig <hch@infradead.org>, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, james.morse@arm.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Sep 2020 23:00:45 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 08:12:16PM -0700, Palmer Dabbelt wrote:
>> I don't know enough about the block to know if the subtle difference in
>> register names/offsets means.  They look properly jumbled up (ie, not just an
>> offset), so maybe there's just different versions or that's the SiFive-specific
>> part I had bouncing around my head?  Either way, it seems like one driver with
>> some simple configuration could handle both of these -- either sticking the
>> offsets in the DT (if they're going to be different everywhere) or by coming up
>> with some version sort of thing (if there's a handful of these).
>
> regmap can be used to handle non-uniform register layouts for the same
> functionality.

Ah, cool, I hadn't seen that before.  That seems like the way to go if this is
truly an implementatic-specific register mapping.  As I was falling asleep last
night I remembered that we did end up with implementation-specific register
maps for some of the IP we integrated.  That was usually the case for IP where
we had some signals that we just didn't know what to do with, and while I know
the DDR integration was a real trip I'm not sure if that's where these
registers came from.

Hopefully someone who has better access to these hardware implementations can
comment.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
