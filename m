Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1349C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tRuqi9KPmhifuIv2vjD/yS/6ZCOuXwEkMLReFg5tPxg=; b=pEH9JXQoV6ceV5XD/NEjim5Dqn
	x0pxn6Vprk/0PK5lGTKgcGFB0xWbkML0oLbR35OC1HBhy3T3lM22LFn4q/x744/zI+Keq+c6gY5bh
	dSxBtdaMZuWEnSm4J1DGof2b2tLGWeXD9t9xjKnyKMY7e3c1+UvzBgrYOjZEx4/iofsmgvrX0O1if
	LhCbMyjHjY6rt+JO/9B2X3kGstOSuJKAfmB4oMlOL27CuMtxV2h5gCWJUWaAdHs3RmnkxN3UYZL6X
	IcJHEpY9oqLGe+m5YxGUXnPfAV1mtRyz7lJ9VGaratUaMme7JOdSLXi4PwG5o6ZVgLGxr6bTrkZ6j
	QUx+k+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAo-00Ab5J-SB; Fri, 12 Aug 2022 16:06:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAi-00AasR-Dc
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:06:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id r69so1162833pgr.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=OL8SXdfa/gecLe6XgajC00LdJvk7CncrQMI/Yj1+rRQ=;
        b=OfxSRUDvj+90whqrcUf3Sw7ZWDUP9dPNKpgF05MwqwEG4M9EU1P6i5WAh0V/WVRvyX
         0xxD/FAAwnBE7J8ut7J0z1yXVpMUbyDclx6eMdosJUPtzVp3HrxPAOIkyYmejLVZcpCJ
         hWr+fxkh6YsQpNswUvB22GsJRcXRL8tW9gU7aMh71Y1QKHPAxZDA1eTQ4NUyOLsUM/o9
         8IoiBHKtN7MsjbnNT683pJrML397WDEjrIdxZ1M+hwNtkOaKuF4KjzK+u3ihRr7h7FVk
         apkgbaEKaGHABkn9cxxFLjGJt3cVQmCRJDYAsjw4UjDmF+jYoCX2GLzT3jluIsvF9V6S
         elrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=OL8SXdfa/gecLe6XgajC00LdJvk7CncrQMI/Yj1+rRQ=;
        b=pAY89hmx9wq+A7GbVm6S6g5+n3tpn7pXRCTs2QTJLkdMRgHUE7KoUAfd9TXX5qeqA0
         XrgFft5kQ1YBoFohIsqscaG3OxX37b7X3vAZaNqkH3rlh31d5rp+qJKZIcYK1ovx8dHo
         4kfpeTCcIfCOcgKWF19O/+nmIqnUKIvga8LwWheMummtfTL6KDVU5CxLhsbofC7hJotu
         /F32g2cegbeap++Gu9trt4W71VMQIaGD9eAp25U5JSPd7eaj40YvfHmOCaOKsXp7fV8Q
         LUx1N5Wv/YnAnbuIvSisKAxythL7geWETnw8Z/7GSIXa6KdkwD6DCLiXnMX/aaCHRBOP
         JvmQ==
X-Gm-Message-State: ACgBeo1KrvoFHtuAFbWAn5T9vkupeV2frrEL/jmtlQoVSVC5OB83JZ90
	S8pXVKDpXY9dBfbWdEYzhZOPPw==
X-Google-Smtp-Source: AA6agR4J6AAfGP9PV3avfft0XvB5qeSkTVfYlxf30tkPFvV5Y76TZIldDkwuHe2hzeEVXh/qZj28JQ==
X-Received: by 2002:a05:6a00:88f:b0:52c:6962:274f with SMTP id q15-20020a056a00088f00b0052c6962274fmr4651021pfj.12.1660320356091;
        Fri, 12 Aug 2022 09:05:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b001714fa07b74sm1979387plh.108.2022.08.12.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:55 -0700 (PDT)
Date: Fri, 12 Aug 2022 09:05:55 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 09:05:29 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 1
In-Reply-To: <76d4f1d3-e72e-ef2e-12d0-f241fe680717@codethink.co.uk>
CC: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-7e789be2-ce2f-41e0-935e-d966cb93ff4a@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_090604_696245_DF8703E3 
X-CRM114-Status: GOOD (  14.59  )
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

On Mon, 08 Aug 2022 00:35:24 PDT (-0700), ben.dooks@codethink.co.uk wrote:
> On 06/08/2022 00:36, Palmer Dabbelt wrote:
>> The following changes since commit 924cbb8cbe3460ea192e6243017ceb0ceb255b1b:
>>
>>    riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol (2022-06-16 15:47:39 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0
>>
>> for you to fetch changes up to ba6cfef057e1c594c456627aad81c2343fdb5d13:
>>
>>    riscv: enable Docker requirements in defconfig (2022-07-22 13:43:28 -0700)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for the 5.20 Merge Window, Part 1
>>
>> * Enabling the FPU is now a static_key.
>> * Improvements to the Svpbmt support.
>> * CPU topology bindings for a handful of systems.
>> * Support for systems with 64-bit hart IDs.
>> * Many settings have been enabled in the defconfig, including both
>>    support for the StarFive systems and many of the Docker requirements.
>>
>> There are also a handful of cleanups and improvements, like usual.
>>
>
> Hi, are some of mine and Connor's fixes planned for part2?

Yes, though maybe that's obvious given that a bunch of them are on 
for-next now...

I was hoping to send that this morning but I ran into a few snags.  If 
there's anything else missing just let me know, IRC is usually the best 
way to jump the queue for small stuff -- it kind of just gets buried 
otherwise.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
