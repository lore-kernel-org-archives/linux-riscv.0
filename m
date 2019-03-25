Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E138C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 12:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D284D20823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 12:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6e8Cf7M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vf98oRl4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="G2NeGcEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D284D20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5b854kpi7brscp1MQl3m8zsM2+7B75uX4s2an9X0iBo=; b=V6e8Cf7MYf03Mw
	+x6Iu6WzlUIWgbTYte4tMmz8Q6L6Kko8xvFayxx6iOVDSQFF7CEO7+y6DNK8oJGplYNK3RE2qDCrK
	6gCAxP9Q9StrZb4b4tabOSopmZOBC+mCQioYJVmTnygz/ERgTx3zMkt7Ld8UIwPL5ezu2bsIe2KIH
	CY0YG9KaJ57p7ova732w849w4L35XEmfiiaF0V8S0KirDCXWfYbcMMGVADtyUpP1MrEgKci06DaM7
	q/ghuBFrmuEvOvzHukimgyfjaBT16W00p/lqiRbhbYcO3b+s1fQqWA2qeqMpO0rnuhViOPEFZkgj6
	bElTxj2Fj8KgoWrUZYwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8PBO-0005jL-PD; Mon, 25 Mar 2019 12:58:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8PBM-0005aS-PX
 for linux-riscv@bombadil.infradead.org; Mon, 25 Mar 2019 12:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFzQ7GNWaVAumVgyG+cSi21Ho8TZd42FGY9Arz6Y4yY=; b=vf98oRl4zawJ+A+extBXOtWGW
 9j1dk0ReLXNVR9YWg2OssnNAfvMHx/nrynvTfUsf5NwWMFbvC4GhEWZ2phgieerpTc4VzQWvki6BE
 xiZBU6vxsqFaxIHn2eOnZ77wS7ii49Vj1JBkr70KAkNGXtV5SlE9ErmvXGgprGRc595skxukrfKnD
 ljkD5h2ByfL4Nb9nqmd7pMuYODKax2Rsbe9Zbx3GQ+KO3B/DHUV+UxfJtsYO+8A9PMavLbPK5HyiF
 TszmLH7Iu6i79kb4yeqpa4ALuHkFIH8SmFY36h9kaeFqGrjhOvBQf4M0RxiA1lbxW7iFPsT+83yWO
 lVV1k7BfA==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Ow7-0006Y9-Dl
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 12:42:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id h18so8919540wml.1
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mFzQ7GNWaVAumVgyG+cSi21Ho8TZd42FGY9Arz6Y4yY=;
 b=G2NeGcEmWHclffPMp8dUCG/6loXXv/rvUbFk/uX22GzsqP403bHLIUxlXsgedWXZNa
 6Uke4A3u5L6eGGQxsJ17AhBLXkINWZAqMsZDzT79MdtXk44EAgO/vtt1HmxWqXbHMNkA
 vXI3MMf2cKs3EU/4a19bvD9vmAAaCZJdCp8hh8yf6EW1NupQOnAz/4HskGu29O/OFPRh
 4PiR4lQ8MMejiCsz8PplG8dDnoL+FlDAnpIeziQP70bZ6C6ddF29s2xQlQj4HS1Qf1KR
 PjBICPXdJE4KjzD0QWrrqaPqPFMdLi17WRUNIPnq1CEgduHHAKsfBuk09F9taifS4w0A
 KkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mFzQ7GNWaVAumVgyG+cSi21Ho8TZd42FGY9Arz6Y4yY=;
 b=sXgMzncGeFD7QREhuGFUySrqmmbV9cgHVA6SQeo9SKfR1dlSPsN8mMy9YeJclp0GsA
 BiQVRuDdnNj819MgxtzNVa4niyfZ1NdNAC5b9eHOVSNVVfvJQIEgTMgL6zFXKfI/DPfV
 jMTS+DjWjPUZlEsDjBQEqI+UaKqHLGS3TLX8jc8VAhrBD6PJb2ierj/Y35vm9oU7JVlw
 3zvQKy0sgOTOZQ9lQArWLBiDb27phkvIBTEmEmLVDKvTDyljU9/V807D2N8u28rMcgye
 A6i5Ly5BlCgIaMTDQ4uD2zHJGT8O2Lg7DH4Viu6SQgJsMG2WXv8jSPHEEFEE9IhoPx1L
 Kqfg==
X-Gm-Message-State: APjAAAUUv5TIm0aV+/MW3YEj+Hih5W19Fpk7+3x+GVNaIYxZjkIvS4no
 VZNXSqxjJkWzru6BF2Pi1wupzlrTFRl8vIY4QGBbrA==
X-Google-Smtp-Source: APXvYqy1THQscj2/NI24dCHt73h12xj88wpspCSSBitjdiDq7X5eA/XadjO2SIQabTihz8+MhenEqwJlR43yR9iLwxw=
X-Received: by 2002:a1c:b455:: with SMTP id d82mr5854534wmf.153.1553517760087; 
 Mon, 25 Mar 2019 05:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
In-Reply-To: <20190325113935.GD27843@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 18:12:28 +0530
Message-ID: <CAAhSdy3MZFayMDTiEEV7WseUsxgcWT_um=nbPgXUBFik19OYuQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_124243_477961_2C6B6159 
X-CRM114-Status: GOOD (  11.57  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 5:09 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> I'm still not sold on this at all.  It is a lot more code, a lot harder
> to read code and all for a very narrow corner case that isn't even
> going to be enabled in default configs.

The old page table setup code does not exist anymore.

It uses new code for 2M mappings as well.

In fact, it will also try to create 1G mappings if possible.

The code is lot better, readable and flexible.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
