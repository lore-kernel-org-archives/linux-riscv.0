Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D31C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHCdEmNaVGYljFEmIcwqJbctPCwpaQFOpzNE2MrOMCM=; b=LLhQi/7jF+FZja
	AdPawNS70Z+Jkdf8ZkmXgCk5GOUBiTX7EV4/RSlNUsmflchWwpNQia5s/20rpYCvT/ghuvIit0Wi/
	jhl+OsuQuQvEP2mmoCJ17OSuQG1LgGPVe/ojtuN88QjTigN6MS2PGKfiybIC33OjYG4uDthim+xx8
	IELkDHFB4n8wqZMpPvlTv2D9PyObHDgR6PYFBLmuQyA90GLIWK3dyI6DixZwg3iueXtYta0E47Eiq
	RHTWGiKvSZ57vwrGNNJ9ETKaUCSfphzlzhxm1DwMLBaPS0HaI5e+Opo93VhbDPot3KNMswUZnlkUV
	vB/5g9E7SUglHcZZdBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvyh-00Bfsc-1o;
	Fri, 21 Apr 2023 18:59:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvye-00BfrB-2A
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 18:59:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a92369761cso22023455ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 11:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682103563; x=1684695563;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnRCEEUMbL4VHxSaKuZGWLgXCAjCR6wrwzaIjE1iCNc=;
        b=1eyKirCqpN+P2lDW1Kog6EOhR4gZSK1257YOtYnrvSWxujPo0TJy3JM4uEJj4Oaqtp
         Giv3pKWxeTYVsJqwu+nGvVA1SQYfCzggSSa5nGFeC82PQy8yuK0+/fQEZexJUsZC+5xH
         Kx98Bl4+CWxaMKvtCMOqSR/ZKFkElFGgGQe9Dpxyn3d9pXmNvqQUKtbpHhmyRL14Ul7l
         2CYj0EJ0+5lW0vVZvPceEE97h6ySo1LzU3iHEuVjsQ39buzCHkmf17WhYkXQj0q+OAEc
         T2LLeAZxdZHGuSRl+oNzRF3z3Yx/dhcIb9ON78i3JpHr8KdfMR5NybhjcazsT5FnP5op
         JOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103563; x=1684695563;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnRCEEUMbL4VHxSaKuZGWLgXCAjCR6wrwzaIjE1iCNc=;
        b=UlNRdHiobTEj5Osz1VTWpBGDR0K29amoRkpy0YiWuvIjDgDO2CvDe9sOUQUA6wHMfn
         tWDmwI19Zx0tgNnPISKx+MFUdN06Xqt1/9HS+3c7jiBEd72zKzmUPfz3TGcu8T8LX0Dk
         UJZJ84ou8213xAcWy4Nsg5f4VpuFxAk3OsOIn+zZkg3nKicLQzZFfkfoVdjxZLkBoNVP
         lO6HRNfGr4L2KVCTP61W+oSDMUT2XCB7Hkks7u+/SrZhM0Wbb+DtxtblKiPsDuqdlLaR
         nbI9ycn6OmY7up7t1HElg3CUC4FnmH1zrnQvqykdXicCQaTmYjikz50nxgxZZWWVCttA
         PmIw==
X-Gm-Message-State: AAQBX9cV16maCBYScCBNj6/oMEQnAW/7tXmOI529YmttP528zT7lTGBI
	Ig74TAZC3KNK6UOA8QDudrFoLg==
X-Google-Smtp-Source: AKy350abIyt+aghs8+DVHIwBTnjeSWu6DXV0RCHJyPgTF8tnDrFlXaBH+mvfis5bh8pk2PcPF+EjFA==
X-Received: by 2002:a17:903:41d1:b0:1a6:492c:df22 with SMTP id u17-20020a17090341d100b001a6492cdf22mr7006809ple.17.1682103563482;
        Fri, 21 Apr 2023 11:59:23 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902ba8900b001a0742b0806sm3055707pls.108.2023.04.21.11.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:59:22 -0700 (PDT)
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 0/6] RISC-V kasan rework
Message-Id: <168191616322.7488.11200893464689398522.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:56:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
  Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Conor Dooley <conor@kernel.org>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
  linux-efi@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_115924_711495_9EE8F20B 
X-CRM114-Status: GOOD (  10.72  )
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


On Fri, 03 Feb 2023 08:52:26 +0100, Alexandre Ghiti wrote:
> As described in patch 2, our current kasan implementation is intricate,
> so I tried to simplify the implementation and mimic what arm64/x86 are
> doing.
> 
> In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
> instrumentation: all kasan configurations were tested on a large ubuntu
> kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.
> 
> [...]

Applied, thanks!

[1/6] riscv: Split early and final KASAN population functions
      https://git.kernel.org/palmer/c/cd0334e1c091
[2/6] riscv: Rework kasan population functions
      https://git.kernel.org/palmer/c/96f9d4daf745
[3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
      https://git.kernel.org/palmer/c/401e84488800
[4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
      https://git.kernel.org/palmer/c/617955ca6e27
[5/6] riscv: Fix ptdump when KASAN is enabled
      https://git.kernel.org/palmer/c/ecd7ebaf0b5a
[6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
      https://git.kernel.org/palmer/c/864046c512c2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
