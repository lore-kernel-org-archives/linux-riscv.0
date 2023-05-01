Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24EC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+GQdOGuw9FFyw4MjgddAGkvxi08fgHzlHMvcKM2Ds/M=; b=U0B828c/A13Ry3YH4BDtVRJ59D
	+6bI7Af4Dyi/1YDVPD2hMTqcUc/+qMVtWe0U3zpkyA9calzHQa3gk2Akw9O086GQ/YYhmUKXHpHuT
	J4CrBwuyL9Gf9eyYqCKpZdr9WifN4jNmLmBGHjp00O3/fxrtNsprahJJrKdEd8jsC+LgWblwkQjmR
	S2TSBWQjx9mBMektCsv7pWvDgdqa+2RJBzVriWlvIvMo3pxVyGeh3EXj/VPYfNCpwIpjKsJYG5Hzv
	UWnb4luEbOXH5SFB5AW+5HzHhW/BMcKqCYzNpl+kJe4MLsINzxDiXIFccV9Rcm5rEEtpYRRxBDI8H
	xHKcf15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptimX-000E5s-2k;
	Tue, 02 May 2023 05:42:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptimW-000E5U-1w
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 05:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=rTv50nIrfCNQoHawn5oqdnZtRiKF6KBiXdv3yqP+nIQ=; b=HI2bOxjaJoVtpEIBPDewkozp6g
	Gt72VqVvLC9hiBEGxgO7S4SCo0siLEBnHwT7ueWERLQvZg+WDfCkeBbe64He/M6hL8jEUmOqPoHkN
	ksVn2dl5kcdYuAgPIy3AMYx67p+HfsaN4tZ5fophFfMyA3enGBlR7LkRCRiobQkYgz4xmf5aa+Oud
	6ozG6A0gUsg7i5+eJ/pfd0lnGaZD23iP84l7g59cAK6hkpXEzE7vhpdVKBptoLUsEc2F5B5RSYZkx
	HNp+5IwaCBO8TBphVuNGmloAiOCGFfIYK1IREwGrZ2gk8MXs9x7k6on285IaojPYd+V4eKVWtw4qm
	ZaSW/Z6Q==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcOF-00F2Yy-03
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:53:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b7b54642cso2241449b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682981579; x=1685573579;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTv50nIrfCNQoHawn5oqdnZtRiKF6KBiXdv3yqP+nIQ=;
        b=5TH88B+l/7j3ul1jwKaO8gqEIyO8rojGINeSxc/bgUfFZH6rQ2VQJceO7sXn/TesAe
         Dse5qoBWDUWo+CCuFQUJycg4nuA6rH1yzXNsEoWs/kPtjbf9BDPzDPVOVQZQc7txtUrS
         InabVGT7UQdNZ5sLtDPo64Hc5FHZ8bmxGpUWCoQ1BnGK+t0sXueblI7MOrAgrFW4LE4v
         SBIYW6GovG/szVV9akB4v+u89SJ2w4T8q4nzMILasOH+58gqMPT8HseOtzO3GXrkyWX+
         h9rwpQto2t5kXHJT3KZAWuQkM56eusondqvpKJlQLsNoJ+DwAoFE7ytDpOYC29BTi8JI
         rTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981579; x=1685573579;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTv50nIrfCNQoHawn5oqdnZtRiKF6KBiXdv3yqP+nIQ=;
        b=gWF+Wqx60zmsgheTPXhJ93AeQLEhVRpAP3bPqJLxZiE9AzIbcst6+/T63v9awOwNS8
         5JmRNmCP8Wh/298OWZNTaj8+06qLQtmvH6isPkGLn84ufEZcx+yxt+dVsLtgTPV2sdYW
         2pNiKWu+c1DcqBlF1pitrZw8hwOC8H5u2t0k1QVPT0uFzTW08al2ClZQ+v443xKRD9Sk
         vfD/XVo2GqLO5OpW1Oqh/c6nfngN7Yu1hlb9QzponsetIsuRZKeGV9ibajKmIyqRhvz9
         lZb/ft6wDca4nrvA8uZh9Ajic0Ra5mO1YlLlcA0KnifClJ1Ekd3O4nx+T+yfSLGNFSjE
         fsKQ==
X-Gm-Message-State: AC+VfDyaiEUkWxKaN464eX0DujdthzpJz0MBAXGI/b+WFL+dUepo1ABn
	oXYxVaFxgmkZFVAiAzFfihVPSQ==
X-Google-Smtp-Source: ACHHUZ5nK2f1+8bX7jtr1uIhCEVldW9ZMDhDwM/VQw5iiDhuDlrHmavF3TrbDWZd82s5R2fExE/J4A==
X-Received: by 2002:a05:6a20:9191:b0:f2:dc4d:935d with SMTP id v17-20020a056a20919100b000f2dc4d935dmr19737997pzd.18.1682981578961;
        Mon, 01 May 2023 15:52:58 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m15-20020a056a00080f00b00627e87f51a5sm15911641pfk.161.2023.05.01.15.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:52:58 -0700 (PDT)
Date: Mon, 01 May 2023 15:52:58 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 15:52:33 PDT (-0700)
Subject: Re: [PATCH] RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP rename
In-Reply-To: <20230429-neurology-sudoku-8d53b23d01b8@spud>
CC: Conor Dooley <conor.dooley@microchip.com>,
  Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-e1596f31-67bc-4e2e-b86e-a32da907eecd@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_235303_197758_59C2E89B 
X-CRM114-Status: GOOD (  18.55  )
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

On Sat, 29 Apr 2023 02:32:33 PDT (-0700), Conor Dooley wrote:
> On Sat, Apr 29, 2023 at 10:27:33AM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> Lukas warned that ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP had been
>> renamed in the mm tree & that RISC-V would need a fixup as part of the
>> merge. The warning was missed however, and RISC-V is selecting the
>> orphaned Kconfig option.
>> 
>> Fixes: 89d77f71f493 ("Merge tag 'riscv-for-linus-6.4-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
>> Reported-by: Lukas Bulwhan <lukas.bulwhan@gmail.com>
>
> That should have been Lukas Bulwahn <lukas.bulwahn@gmail.com>.

I think I got that right, but the email bounced.  I'm not sure if it's 
just the list issues, though.

> This is what I get for hand-typing an email address that I could have
> copied from lore I suppose.
>
>> Link: https://lore.kernel.org/linux-riscv/CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com/
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> I guess you picking this up for your second PR makes the most sense
>> Palmer?
>> 
>> CC: Palmer Dabbelt <palmer@dabbelt.com>
>> CC: Linus Torvalds <torvalds@linux-foundation.org>
>> CC: Andrew Morton <akpm@linux-foundation.org>
>> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> CC: Lukas Bulwhan <lukas.bulwhan@gmail.com>
>> CC: linux-riscv@lists.infradead.org
>> CC: linux-kernel@vger.kernel.org
>> ---
>>  arch/riscv/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 5c88ac4b52be..e1bdb3fb16cc 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -46,9 +46,9 @@ config RISCV
>>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>  	select ARCH_WANT_FRAME_POINTERS
>>  	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
>> -	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>>  	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
>> +	select ARCH_WANT_OPTIMIZE_VMEMMAP
>>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>>  	select BUILDTIME_TABLE_SORT if MMU
>> -- 
>> 2.39.2
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
