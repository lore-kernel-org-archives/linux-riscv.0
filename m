Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FB1C001B2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BLd8wfidedi+UbBDZfz8tqvvKSg2vLGXN/b1AFACtBQ=; b=Kop7syQ0y0ZP24HgGFlyAxu67R
	27g1oo7pyG69TA7+aMbVa1RWsDHh280teFjH2NBow63/14d/XoDXgi57kXlyzcpdx3r4jvKxyZgED
	6QqHrSTEQmuIbTBQcotUKUyScJ2o3YzMYiXhp8zpAEfIlNxmDQ4RvpXxHXMudmK6EWhss3WM8coT1
	+Szn4rJu+aA9sDcUfRzSgFekQNaeaQmLCbPv1jkdRjrePxH/WkvyUSbrOf0f4bdN56haxFETNAAz7
	n0ly4dWQt6UQv8swzV0aJvFglcn4fPr1m+p26/DhqYQuJsbitBs0n84t1bJVrynXGsiGwLO9n0bLs
	hUA982Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S89-00HZig-DY; Fri, 09 Dec 2022 01:24:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7Z-00HZ36-JG
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:24:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id s7so3306690plk.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 17:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz7/c/S2bGL3JTpjy3sYti4VzazclRNAfcMOHVpG1Bw=;
        b=S0N7VpnML01I1L6SW5KOI9DKu1LS3c6R0Et4r9F7A6PRsDs94yntO1CATXIuDiKFZ4
         1sOCVDYtNF6bYYs/nUNfWEHfevc+Pb0VPw8vKF1EfWtD2wAmWtuVfD/S14wKvKRjJs5V
         92FQGFCRvRnKfLTk/0niX+hbGFwII4uggFmPl/bP6gDRjwP2l4iGvIK0Duf7S07mHzTR
         fWlaTS4phVldfR+KVs0zfOEEJZr23gKA92YIeYOQ3twvizc2w/Rs9wyEHKzE+7FOcD8g
         pk2blLS8G/qHJCqUbjBLEWFa/qZgSmfjYEjBYcFbl6A+s2yhudwWHRykm5mGF21cxBJl
         rZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz7/c/S2bGL3JTpjy3sYti4VzazclRNAfcMOHVpG1Bw=;
        b=qy5vXVSduw40Vw0pvSGojjGrkKwJCWBxSfNMgPK8aXOprYCZXQ6Ztne01Li/pTuzWH
         KjPGcLM4CgzSKVJSaX5aFdH6TKRz4UZzj9VTRbydbYjOYk1bYNY3vKaJ25GB+CfPeK/9
         bm7WbiCG9q30fGV58p2wLT6TYhMYNJ59ESLOUr7OC/zSKAmFxZgwy/Mejt+AkbBOAGMp
         98EJ3NIsuDO06Nh23eGgH8cvVFvMBh3JI/4l32DskXrzuz32Uco+YGlGDTYKGMa31isE
         bW4jd+sraXme/UOGGPVMZl8ChySLfHxtDMihQkjZSfTj2GYOE5p2yeNH0UEZqP8z7Kt4
         JPpA==
X-Gm-Message-State: ANoB5plB9rXgNid928dowMTjn3NqS7DzELQNtdHmvNNbv8g/r7SD1qoC
	wQbJqBlaSLjmSKbz9wOLR0AJdw==
X-Google-Smtp-Source: AA0mqf5JV626aJGkuzlbbs77P4VoHR85hIo7nQXghzW7EcenLGVsWYy6WzOo5qfwkw0gro4BSmwSWw==
X-Received: by 2002:a17:902:ec92:b0:189:cbf6:9534 with SMTP id x18-20020a170902ec9200b00189cbf69534mr5222889plg.0.1670549051231;
        Thu, 08 Dec 2022 17:24:11 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00188f6cbd950sm55290plh.226.2022.12.08.17.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:10 -0800 (PST)
Date: Thu, 08 Dec 2022 17:24:10 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 16:12:01 PST (-0800)
Subject: Re: [PATCH v1 3/7] RISC-V: kbuild: convert all use of SOC_FOO to ARCH_FOO
In-Reply-To: <Y3xmZd9wqj7wGcCy@infradead.org>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor.dooley@microchip.com>, Christoph Hellwig <hch@infradead.org>, damien.lemoal@opensource.wdc.com,
  emil.renner.berthing@canonical.com, geert@linux-m68k.org, heiko@sntech.de, samuel@sholland.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
  linux-arm-kernel@lists.infradead.org, soc@kernel.org, catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Message-ID: <mhng-c7b813c3-e38b-4c31-bf13-3c8dfd8ec711@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172413_748080_BB992F03 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 21 Nov 2022 22:04:21 PST (-0800), Christoph Hellwig wrote:
> On Mon, Nov 21, 2022 at 10:14:11PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Convert all non user visible use of SOC_FOO symbols to their ARCH_FOO
>> variants. The canaan DTs are an outlier in that they're gated at the
>> directory and the file level. Drop the directory level gating while we
>> are swapping the symbol names over.
>
>
> I still very much disagree with this.  ARCH_FOO for something that
> is not a Linux architecture is a really really bad idea.  We need to
> fix arm and not convert riscv, which got this right.

Makes sense, though I guess I'd argue that SOC is also a wrong name (but 
at least it doesn't conflict with the ARCH_* symbols that already 
exist).  That'll touch a bunch of trees, adding the Arm folks to see if 
they're on board.

I don't care a ton either way, my only opinion here is that RISC-V and 
Arm should use the same scheme.  If the Arm folks want to move over to 
SOC_* that works for me, and has the advantage of being  no work on my 
end ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
