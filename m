Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4753DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 22:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaWaxehtgO794Cfk4oNy1rZlBpleXMgfvOfHEKrCnOE=; b=bBPFa5xr1dMOsb
	gVGafWZTlCH4dn6tFMzbckojq024ZNG/7G294XrRNRuicCMhPk3vZ+gSrtjx754I+Mv9WA62/0exQ
	s6NDCM7UKodV5NfFjQQN/TkxxUyu/JKSl+/96IJbJDlBxiyIj8bLaPEXfXbHtjxUJk1Vq7svdE6Hs
	sAwJfYtfVCoCJydVd4pg+H6+2T5Q8Gfj8TfqUzGTAzQl1vFRbvssgj6rm4CV86F4/rZcnDC56k6Q/
	4hApmCyvh8h3h6Vc2Gg90n6igJGTI+9bNOaapt3MHojXyM9wK3i6AUUSbRzyBWyWBgRM6oXvyPMNN
	f22E+wPV/eGyJAHRz+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzAO-00CpG3-Nv; Wed, 25 May 2022 22:07:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzAL-00CpCI-N8
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 22:07:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id z17so25816wmf.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Q7sKJrWCeWlhDVlmgSMW2NcMhM9lTStJjQlrUPtXIXA=;
        b=eopDrfIHJM8IF7mRG8hA1fo2Z2Wv/QglL0DtGpj2qBJXnvOnh1uFoTbEHVqbkZr0hi
         1O2KEk/Z9GSg59UhdSmK3b5z3iVSpalv+n1BwIci6d50WLLJInpEBSGAw4ky71skcvD3
         /b3NE+1mQei8LSfhnv+8SaHZvIbv7uB50EyBNoO8jdsEisPSiaNB0on7Qtwfa6I2YuiZ
         GCbv4e0aOQZctw6zlpkceuWHL3kV8Yso/gqdhaZRhoFUH8r3QRigsVls1uRN5+AABNuZ
         wnVVqB0tjHY354zrffCBXnjwbQ3PE3ULsXel0OiEr4U8q824qwvFh3Ssnth61pUZV7CM
         z9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Q7sKJrWCeWlhDVlmgSMW2NcMhM9lTStJjQlrUPtXIXA=;
        b=ihsfx1a3/gNrA5LQongtEa6TafpKHR19HHIWHnQzFhJItLTEwIA6aLnTpRnMqSxGGL
         UuzN/+TvAYdN6iQikNXEmEpqmyWtekjYqbB9gWTtQb6y2YDNI6tPnvVRSWQz4jQ9zEF4
         G8gUB0gXO6jCCjE6uEHMhOYl3Q10dbjY9UzHBSVNRsSsBnRR2eiuvHDOuR2pCN6YnI3e
         qZ5icXEKT2anDfAx3/mKB4JW+awK0/c7GIYMxiVW4cIJUMBHIJnfd3b5pCa6B8szz6wi
         sNi2P3l6i5A+gio56bfhHzA6b5sMR6qfAD7QsL0ciBl3HM3FtShnzEuzhzFoYw4DN2cF
         ephg==
X-Gm-Message-State: AOAM532RbuDUT1ENoQkQiSBxtp7JHn66caNeSQcYBU8mWIyoJ2BiiqKB
	cLrk9UxCi2bJBWLxFbvWdrRe5w==
X-Google-Smtp-Source: ABdhPJxRatrP6XqsNDLEYgx/Gmo8kTof4rjho1S2HneKMFITFunNGJP1JxO1h65VIohlIXxM0NUT5A==
X-Received: by 2002:a7b:cb4b:0:b0:397:3dd8:917a with SMTP id v11-20020a7bcb4b000000b003973dd8917amr10399106wmj.20.1653516456713;
        Wed, 25 May 2022 15:07:36 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id c15-20020a056000184f00b0020feb9c44c2sm95151wri.20.2022.05.25.15.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 May 2022 15:07:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
Date: Wed, 25 May 2022 23:07:35 +0100
Cc: kernel test robot <lkp@intel.com>,
 virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org,
 linux-staging@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-parport@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-mm@kvack.org,
 linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 bpf@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Message-Id: <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_150741_783101_34FC24C2 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25 May 2022, at 22:50, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> On Thu, 26 May 2022 05:35:20 +0800 kernel test robot <lkp@intel.com> wrote:
> 
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> branch HEAD: 8cb8311e95e3bb58bd84d6350365f14a718faa6d  Add linux-next specific files for 20220525
>> 
>> Error/Warning reports:
>> 
>> ...
>> 
>> Unverified Error/Warning (likely false positive, please contact us if interested):
> 
> Could be so.
> 
>> mm/shmem.c:1948 shmem_getpage_gfp() warn: should '(((1) << 12) / 512) << folio_order(folio)' be a 64 bit type?
> 
> I've been seeing this one for a while.  And from this report I can't
> figure out what tool emitted it.  Clang?
> 
>> 
>> ...
>> 
>> |-- i386-randconfig-m021
>> |   `-- mm-shmem.c-shmem_getpage_gfp()-warn:should-((()-)-)-folio_order(folio)-be-a-bit-type
> 
> If you're going to use randconfig then shouldn't you make the config
> available?  Or maybe quote the KCONFIG_SEED - presumably there's a way
> for others to regenerate.
> 
> Anyway, the warning seems wrong to me.
> 
> 
> #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
> 
> #define BLOCKS_PER_PAGE  (PAGE_SIZE/512)
> 
> 	inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
> 
> so the RHS here should have unsigned long type.  Being able to generate
> the cpp output would be helpful.  That requires the .config.

This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
i.e. a u64, which makes the shift without a cast of the LHS fishy.

Jess


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
