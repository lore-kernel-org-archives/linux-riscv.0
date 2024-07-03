Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2A6C3271F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 19:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qEtQdRjFObD1KcSo33ZanFbbT+Pe24bAFePenLU0QV0=; b=mjXGcZ2p+IBnh7c5613H6iFK8T
	tHUzqXEKGev5dJskf2sAz8trq6xHtGjKBktSHjc9AJsP+P1D3LgcSPe94MPInI5GFtGqccll5opcq
	1pNwh3xItgMCUUrwA7RtrytvQ0V2pCkq6pi79HYdgp+vgCRUJ4wlwZLEhEBwkDnbecpaND+I5bURw
	bS4lsVBLF3Lp++Kw+MPaFNmwNavx5dsWGNdw31x541lsyOwwPM5y3SdzCvT1jqlc+VV1MH1/rWft/
	737a5JOSsNz8b6HcLXWPO02g1hDUohzHDq0lXzRHmvHtxltvdphCt4i2sWobhpQi+n+EwCVE7weMV
	oozftD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP68N-0000000BK10-1WpB;
	Wed, 03 Jul 2024 19:59:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP68K-0000000BJzP-0bus
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 19:59:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70afe18837cso93000b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720036755; x=1720641555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llqZeLMH/2BLbFjCrwTuUEHpE/ViSqc2wj4oZtu1yzA=;
        b=dWqGTDGt2c+wklMEKHkSk2jIASd6X9bFJp5KDEwxwtex+kC2qJ68oZaCK77sirDn3W
         jRQv/j2/xK3jJRsKozjQTdojJ/5qxuwL6uZ+G+E/X6lTOAVJ89yRueADp76BOOZvZ74u
         pSL/V18PeA9MQfNbLGegiMLABGWen124QbfI5CRw/91vfXhmiL1TJJ8kU1T2Plfw2EQa
         GW8QQqiY8fOuSjcWQsvedOd2+9kSvves1117GDWY64lpCciqQhNbScscxKZqvwcwrOKG
         nVGg79WYog5gGrNKDb9Z7DlzulldcqFZOcGCf973CLVeBKQddoaWU7Yu52gjcgK6DfUv
         5+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720036755; x=1720641555;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llqZeLMH/2BLbFjCrwTuUEHpE/ViSqc2wj4oZtu1yzA=;
        b=JhEpS6ehx3ijVNtPynXHAKEIVkoWuqVSm4Im4WF9R+Ymvo5+bG8WxsNewTb7LWhe8N
         f73Eio5zodjDGUZJ9bvWkC/Mtj389mlpv93S7LBXJVH95c0gr8GSJEY9atMdohcBHSXO
         c/y2W9lwdZueG+jdi5I9Bq2bEvOiIjWMbR/3gMZ+QDrBUfS0TOB2TQQ38hlNVDoPL3iN
         UcfyDwetk8Ayq8t4oV2o8hJ4ah/8O8ctWvWEg4dgsAxq6vrjReIWTFMELClMExvdkXCS
         nRTyU+UbOH5sB+PGMa7ZaaKE3UoyTt9AGy9Ch0sRRTT2UUkkSvE+qpjrGX+VBDRCsLkK
         hsEg==
X-Forwarded-Encrypted: i=1; AJvYcCWwZhZ5yzOGRzO7SctWSwqlzKY60ExGNN8EyTQidrrrv9lT10zOL9YB6G7wyd0blEK+H/LCYOHItcaD/oB9pfH5ZPCPo0RGflvWLHHXjoIw
X-Gm-Message-State: AOJu0YxetjGWPfsJYuZ60N6LrxA/CqwO3eRXbegeLd4vf5+f5K9/aGDl
	+iarkaTdtPEGyi4YhoRVL8kUtAgS4n9CT0TuXsmuXu09qAoNwDwn78oBv7t09PA=
X-Google-Smtp-Source: AGHT+IFI2fOylyhpu9F7a1d+pF4zhchdEwR1QvH0cPmHKjCeEh3crHOa0vuNmj6ebNBPIEQBj9LrSg==
X-Received: by 2002:a05:6a00:218e:b0:706:5f74:b97b with SMTP id d2e1a72fcca58-70aaaf10da2mr11931505b3a.23.1720036754701;
        Wed, 03 Jul 2024 12:59:14 -0700 (PDT)
Received: from localhost ([199.68.152.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246bc72sm10867658b3a.60.2024.07.03.12.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 12:59:14 -0700 (PDT)
Date: Wed, 03 Jul 2024 12:59:14 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Jul 2024 12:59:09 PDT (-0700)
Subject: Re: [PATCH v4 0/3] Assorted fixes in RISC-V PMU driver
In-Reply-To: <20240701130127.GA2250@willie-the-truck>
CC: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
  kvm-riscv@lists.infradead.org, atishp@atishpatra.org, anup@brainfault.org,
  Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com,
  Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com, alexghiti@rivosinc.com,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, garthlei@pku.edu.cn
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Will Deacon <will@kernel.org>
Message-ID: <mhng-c9cb22ea-9f7c-44c2-8e3c-8bd1de101e16@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_125916_426928_E84EB856 
X-CRM114-Status: GOOD (  16.34  )
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

On Mon, 01 Jul 2024 06:01:27 PDT (-0700), Will Deacon wrote:
> On Fri, Jun 28, 2024 at 12:51:40AM -0700, Atish Patra wrote:
>> This series contains 3 fixes out of which the first one is a new fix
>> for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
>> patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
>> to its own patch. I also changed an error message in kvm vcpu_pmu from
>> pr_err to pr_debug to avoid redundant failure error messages generated
>> due to the boot time quering of events implemented in the patch[1]
>
> I'm assuming this series will go via the riscv arch tree, but please
> shout if that's not the case.

Ya, it just ended up dragging on a bit because of a missing DCO.  I'm 
just throwing it at the tester now, it should show up on fixes 
eventually...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
