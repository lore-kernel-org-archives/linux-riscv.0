Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4C9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mi59qqJPkH9PVCxNDDQGbw3SW+bTLZrB67/do56TG/I=; b=TAXzbdQAHP8OQ/k4rfrRmB0kwh
	eJF2nsSiPQeW07jITxjT0ehT4IAxjwM0C+yn30gJQb+3+sUee8x+pmFFSAFPKZZPJJf95vB0iIp/l
	uW/b1z4TdduCwF/pnaiuwFO/aHEuEYxXUl8AgCdM3aDV+8YnCRiJuDeWNOum2dcCds85SzjOqy3vF
	Xa/aak8oa8hYt/GJ0PETSxPLAOrEz2DEaBPSKUabGRrUGhLbaODZQUw8NpnLLaMB/yKQ4JpPEfkn2
	J3BaiN45ONAw9VdLdKyTsfts7TZlb5RXxQeU/2oqDfkh8j/Xh4we8zomBManAy770PZpZrq2/5vky
	ZBlU/PAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9vt-00CmDE-0J;
	Tue, 12 Dec 2023 21:04:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9vp-00CmCB-1h
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 21:04:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ce6d926f76so4412701b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 13:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1702415083; x=1703019883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXCOnbYbo1oDbYsUXOqGGj5UISArUKYnIPWgHEPvDjQ=;
        b=qfK4xQGsEJ1MgvqjWYlCGkPaGPQ5q353EU98W5eLeY1NdGNEebkZQPMzizoIjyr7t9
         VfXHw7pSf4e9zHsTnAu+7ZZa/xYfv6cfi7Z6EVhsT3pHdg12WzOh6UF+9RYa6vtz8gGq
         8jWdlyTtCAVy0w2pezIMVYiZ36Dfpbl/OWx4/YJwzFOmbanXDXYxPgwrYAnpCjvzL5Ih
         ygbYmbKFmr8VbemB5QKGrQQtLGZXa4AnPdU1ZAsvaOn9MwJ/zukTgjG85pDp3tsyYzZV
         KktuCmOdfzqh/LVz1L41gwb3pvpg11Bi2iWZvcFl9lR6HYVAV6Y0xvqWcTtsMSN4oR1T
         8qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702415083; x=1703019883;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXCOnbYbo1oDbYsUXOqGGj5UISArUKYnIPWgHEPvDjQ=;
        b=aKn1PhxE+AI0ynFT4UiG9C+5XEkh1j428i8xlkLx4P085LLj/DXQp0qRgZ2FmIEw8x
         pfkNiE7Hbz8o43iPL+pMFcgz9kOXvNwiFkigjezgkZUafo1ON33nGLMNgHwfBatFCB2E
         YX8KyG6QK/P8/V8GOdpavGwgKcu+HHAUGqzg16RFX56w6UdfzmyBGf/Bq55rglS1XXFF
         51OBJAkw5RXsXR6KvsUPOPPYHZySaEBQMgf9mp/DMkwx0pHUMtGM/rB6t0Ayp5DGUO6V
         m/a0Xu52rp7uP5vj7RfBKtJH19FJY98aJyFNkl/wJtWvn6uqzUzXEViqIhARzLLXWRPB
         +YrQ==
X-Gm-Message-State: AOJu0Yy8mGTJDOHBL+0DhwtK2C8DAS/hSq4X0HdXhgffYFr1SsxEkuVz
	d4+Y35cSKNMcAR1rzJjigOlBvw==
X-Google-Smtp-Source: AGHT+IE61QRANzgSPbOgmtPUskN2VwVdPNkZ7fInEOmKuM7txtCu/lMVHSlCuGpBOJ/y7lhzZvTlPA==
X-Received: by 2002:a05:6a20:3946:b0:190:e59:f154 with SMTP id r6-20020a056a20394600b001900e59f154mr9530635pzg.18.1702415083565;
        Tue, 12 Dec 2023 13:04:43 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id o28-20020a634e5c000000b005c6bd30ea57sm8531769pgl.47.2023.12.12.13.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:04:42 -0800 (PST)
Date: Tue, 12 Dec 2023 13:04:42 -0800 (PST)
X-Google-Original-Date: Tue, 12 Dec 2023 13:04:38 PST (-0800)
Subject: Re: [PATCH] drivers: perf: constify the ctl_table argument of the riscv user access handler
In-Reply-To: <20231206-flanking-frill-fffeca740221@spud>
CC: m.szyprowski@samsung.com, linux-riscv@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, atishp@atishpatra.org, anup@brainfault.org,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, keescook@chromium.org, linux@weissschuh.net
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>, mcgrof@kernel.org
Message-ID: <mhng-8f7ddf72-8e2f-4dac-a67e-624eb5511a14@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_130445_692702_3875D165 
X-CRM114-Status: GOOD (  16.23  )
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

On Wed, 06 Dec 2023 02:55:48 PST (-0800), Conor Dooley wrote:
> On Wed, Dec 06, 2023 at 09:46:42AM +0100, Marek Szyprowski wrote:
>> 
>> Fix riscv build break after commit c8be9e66ca1e ("sysctl: treewide:
>> constify the ctl_table argument of handlers").
>> 
>> Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument of handlers")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> This breaks the build when applied to the RISC-V tree. I'm going to mark
> it "handled elsewhere" in patchwork since it needs to go into whatever
> tree has the broken commit.

Ya, thanks.  There's a second copy of the fix over at 
https://lore.kernel.org/all/20231212-garage-pellet-c6a2bd34854c@spud/ .

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

for this one too.  Just trying to merge that fixed hash into 6.7-rc1 is 
giving me a conflict, so I don't really want to pull it in myself.  So I 
think the best bet here is to have whomever took the patch take the fix, 
but LMK if there's some shared tag thing I should grab to take this into 
the RISC-V tree.

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
