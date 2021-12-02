Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7698C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DXqLYlzMdzOhSimu9A136TBspqTc2LN6GAMLtxcHI9o=; b=YFiUCvHnsTCMti
	XRfruVMTlYHK1qtFf8cPCT+n4O13GzLKmWM4Q6j0hoveKF6SqQrlGk++srSZ4B+RYFCo9Rqtj/Nbo
	LePKtytB8XrEqiIe5Vv3QbzwSW9QkHmZ9Cu2PMDI5zJuUapAk4T3F3czAQFdFAzik6NceHwm1vzFe
	VHPRqkUFiUp3jrckaN0lSFL8G4tjswmjxks1tD/NrFiWqeHYfMuLI4sCy/iSx26WdbCUmEgNcuJ5w
	i0tprnCua6fM9rMds1tr5JerxqXI2+oIe9caPGywo5VqH4Ie8yv4HK8Kj15pS1NhaA65T0Obq0ynL
	KEkXKFyTu+DuCRKxBujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msneK-00Chl2-6V; Thu, 02 Dec 2021 15:05:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msneF-00Chjs-CB
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 15:05:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id z6so28175010pfe.7
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=FMccx88RykZoULvAHDtbX2BYTCQploTSiNhL4A6PbxU=;
 b=EDTMsPiCmkjPgfbdmz86xCC6o4S7u2/XRInDSbc11lWN3Z1WypUbfrDCWiynOY53mh
 J9SFPTrcvaBJ80rcJh80EBBTM467lfQXI2kANFj92fX5LipR8hvM1HEbqLBtAD0BLYhk
 +EW3mocr/Lah7OxumEfkLiBgL685nPieJmHwhxnfkrbYewQvfKjpQBX5kram4sCxufEu
 RUe0Tika5iCRfUGaW3W5Umdp6JTeb/wSvHprg0rqPg+qnDoTIbfMTFDCBppbOBUx0iqW
 9alEI6nZBa02tSuMwAJAS5oBDG3R8sqoYrBHe4KbVjjiBGsfGm3NJIaXpWp+Tfj7cUY9
 acIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=FMccx88RykZoULvAHDtbX2BYTCQploTSiNhL4A6PbxU=;
 b=1SqseCeHTBzYpJ2MfmqMubMlEBW7irYSC0oVHOouWAyGfJ/h0i1fZ46XNWvxzEsu0A
 1Mdhi+wWZGtVNb/c1jIZcDdQ293EOppfpuR8wQpAr2vl2P1aFo4+yNMCMM60XCUdJmWR
 JbdzsrVCRW6Tt/EcAs65WuJ+ZI6Za6qyQF/FsOR7ALdQ5a/zCvtYoUT/ydviuPYNZW4O
 BAmIqHLXRXBIgZRaVpUw+nPE6652LIkTcApaqwnWRIMDJJ6mHDEzdQ7ohhMSis0fI0Tt
 O6l36q+E5eonMNiUEBuMIIW60oMxoLYEaiOc1J/FJiv+bcplSe/PqNH4z/QhJWP4VeOw
 Q0sw==
X-Gm-Message-State: AOAM531kORjznYx3SF58dbNFwFajc9/w6EfJtRv2yxhRt+i4rLPj0DmI
 ER8niCWX2E8i4yEtyDlUQ+C0ZQ==
X-Google-Smtp-Source: ABdhPJxLJDpQ5vtfJyQ+xGg3yxHSkk9cKkitsvZUSN5t/lMXlXt+fRuZ8EkF2prkJ5Id7T58mTCA9w==
X-Received: by 2002:a62:1c58:0:b0:49f:d674:e506 with SMTP id
 c85-20020a621c58000000b0049fd674e506mr12793593pfc.66.1638457521629; 
 Thu, 02 Dec 2021 07:05:21 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id c35sm2886930pgm.67.2021.12.02.07.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 07:05:21 -0800 (PST)
Date: Thu, 2 Dec 2021 20:35:15 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atishp@atishpatra.org>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: sunil.vl@gmail.com, linux-riscv@lists.infradead.org
Subject: Question regarding "boot-hartid" DT node
Message-ID: <20211202150515.GA97518@sunil-ThinkPad-T490>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_070525_199284_322F6D26 
X-CRM114-Status: GOOD (  11.09  )
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

Hi All,
   I am starting this thread to discuss about the "boot-hartid" DT node
   that is being used in RISC-V Linux EFI stub.

   As you know, the boot Hart ID is passed in a0 register to the kernel
   and hence there is actually no need to pass it via DT. However, since
   EFI stub follows EFI application calling conventions, it needs to
   know the boot Hart ID so that it can pass it to the proper kernel via
   a0. For this issue, the solution was to add "/chosen/boot-hartid" in
   DT. Both EDK2 and u-boot append this node in DT.

   But above approach causes issue for ACPI since ACPI initialization
   happens late in the proper kernel. Same is true even if we pass this
   information via SMBIOS.

   Do you have any suggestions what can be done in ACPI case? Can we use
   a UEFI variable with RVI specific GUID to pass this information? This
   will have the advantage that it can work with either DT or ACPI.
   Also, we may not need any UEFI spec update. Do you see any issue with
   this approach? Your inputs will be very helpful.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
