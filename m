Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F0BC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 03:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wU7CwjtXFLJtvca57xtkTBgbC7s5G3m/Lh+KISx76uI=; b=WHckpd3b1sF8H0aOtyxwYGL5nr
	vGwKRkDSxnpWk9gGq6kIUiAzjuU0/jKYyiCg203xlZvBb2SSaOBSOvXfD/d+kkOor6YlRGsxm4ejC
	dcF1+sBPq9x8E9IWdMBgBmBn77vowgmjKAzkXn7huYTB+Ru+OOwyHDGAYiPZRZShnR7EA/EflOpqO
	/DZ1A3r4z34h78kazHaGxOH4blEbxzjTOLFGP8Uy7vslLDhUPcS6N4E0nnHMg5gbWdJEAeKiu7lZs
	YSpQdCKzQGg4T9LfaKqY1Eb7mssT+r1WCAWpABQ9FdxjHS0b7l1DnOHQ990oHJvhJqH2/EhA0ELe9
	I3F1tuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNmo7-000AuW-H1; Fri, 03 Feb 2023 03:32:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNmnx-000AsO-Pz
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 03:32:03 +0000
Received: by mail-pj1-x1036.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so7618999pjd.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 19:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ELdr8kr8cfAFHro3oo2nX8Zeaf+T1iI5OEPVbajWl4=;
        b=jCJnuaG7D0JNqsasbCOptl2FERdbLdwSDouVdFGzdlhZ4c0vC6kncai50bmmbcG/DW
         Sb7Q7TTuIW399D57jto6QS7jK7rNGJfTigkW4VVmK8ixDAHFWk+AjRyf/EIoK4SW+kaf
         4oqgE3ORR+Kae4q0iDp42Aaevi8KRRznIjekikScXpDDIySq4G+W3WG5YRVSvm90lcLs
         i6r167TOVqnrFS1cchC+nMQa+SdsnBqvWgEziNgvGavPegJwuoxvGFv5fZH+5rwlJWHS
         uRjz49UFgst62dCFszB9MGisu5ceibyxM/Q2gNIrFfVIWNN41LF4scop8rJgL2j92Zaw
         Yzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ELdr8kr8cfAFHro3oo2nX8Zeaf+T1iI5OEPVbajWl4=;
        b=xSuUBTyznfJS6I/whRcOz8UQyEe7aEzGBkXvRC4keov14uT0kjURwzy3yjOMvjUExt
         GN6QJKGnY9yJsh4oMOpHFXdHgqHjJdwHA2V9bRrysGUm2iA3v39NfxjStCMl9SmQfEQ+
         N3tPbIu8mkVhA0gdPGu7GRZnu+lZ8NqnvEXcpKO1gBjRNBaLmRLr6RHZWrC38b+0VITk
         ZaUa1z97PILYI0TC0b+yWTkJPRBBPLuu1oeUCO7GpaI8GV0pc97Tnu5qFWSwv7bhGzpu
         jeWVVmMjCVMBhA0tFI+/Aho48EAAoaZya1vRvVM2JgwgJ/NFUU7nyaqX6pMG/+zSHuqa
         JG/Q==
X-Gm-Message-State: AO0yUKVMfgvxbnuFH4xmdAURWwANDtDQZJBojCeJkwX0QL3Aw8yNuIfl
	THi8YXbLMIuBjvdGW+8PwBO5QIHYKdxiuG2N
X-Google-Smtp-Source: AK7set+57aLnObSHcH5qlDN6Mf7iQBt+c9eQWgNCT+CmyqH0+99UE+sJruvk7QuheXFpwkAyk9dl8g==
X-Received: by 2002:a17:903:41ca:b0:198:d8a4:1ece with SMTP id u10-20020a17090341ca00b00198d8a41ecemr1658070ple.8.1675395117606;
        Thu, 02 Feb 2023 19:31:57 -0800 (PST)
Received: from localhost ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902edd000b001966308ca0dsm420998plk.167.2023.02.02.19.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 19:31:56 -0800 (PST)
Date: Thu, 02 Feb 2023 19:31:56 -0800 (PST)
X-Google-Original-Date: Thu, 02 Feb 2023 19:31:51 PST (-0800)
Subject: Re: [PATCH 0/5] mm: Stop alaising VM_FAULT_HINDEX_MASK in arch code
In-Reply-To: <20221203030356.3917-1-palmer@rivosinc.com>
CC: linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org
Message-ID: <mhng-15cb5600-7883-4454-aabe-6e695a81a45c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_193201_851945_3B6E2D38 
X-CRM114-Status: GOOD (  15.37  )
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

On Fri, 02 Dec 2022 19:03:51 PST (-0800), Palmer Dabbelt wrote:
> When reviewing
> <https://lore.kernel.org/r/20221029084715.3669204-1-tongtiangen@huawei.com>
> I noticed that the arch-specific VM_FAULT flags used by arm and s390
> alias with VM_FAULT_HINDEX_MASK.  I'm not sure if it's possible to
> manifest this as a bug, but it certainly seems fragile.
>
> The RISC-V patch is on top of the linked patch above, which isn't in any
> proper tree yet.  Everything else should apply to 6.1-rc1, but I'm in no
> particular rush to get that cleanup in so rush on my end for 6.2.  That
> said I figured it would be easier to send along this now, just in case
> someone who knows the MM code better thinks it can manifest as a bug.

Just pinging this one, I'm not sure if it was just bad timing on the 
last one.  That RISC-V patch is still sitting around outside my tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
