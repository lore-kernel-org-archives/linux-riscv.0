Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B108C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:09:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33084206A1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fF2/Jv3I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAUwIwgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33084206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PveS6PGgh5oZ3ehD0KXmkqfULIG8DD6FT6f6UpIl5r4=; b=fF2/Jv3I9x6/rNHa/YFoBB/5j0
	yIriXmeiv0Af8pTI3Q95p+vB2OZtjvhRXlW/iM39xJZgK55lkOXe7QUl7sxQ2OWvT3/MuFEQZ1Im8
	TIUMDNBXesNNnlL2XNpdH3tyNywPIz3WQrFFWh9BIswnpgw3L2BIbB0/+wIjudC6S2Cd2lRjBMEjE
	aVjcGrrpyswKH49JP/T6kbtSSljdJYnUO5ETTpCuv5UkFrn/1daTMdnxLpNqxdVx0ly/WZIdXdRVp
	yTE/KoElhA+afjQqAYEYY2cxoyC+nQS8mCZ8xLmjgaHVXvy6nvv+RyZ5FU2gbi+LSeHNAVZiGyxtF
	WI7Rc8ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonAa-0005fy-6T; Fri, 26 Jun 2020 12:09:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomZb-0004WK-JN
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 11:31:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id g2so4983959lfb.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zHiOa3lfODbIYpa6aQjlyxpyDYMyLRS023Y18u9aNbY=;
 b=SAUwIwgHL3wVXhLRagbn9AJ2HzDcRM0J/aAICosAk3Id4JBsJMEDqLt/d0PUUdMmVR
 hxHNAyRXmVCfZN75XrCmB8+C30lIF4QidP+qno1l0xeROtPWnCvcLTYeVThmoAA3uGai
 mT5jTCsAl8rIrKFZNnC4NfbYdxoB0Xz86pGAib3r29bTk9cgsTxD6tiOcIfYVFSQ3cl4
 PIeU5mD42ilw28kOLXDvm797Ddnz1Z0QLyCX2d/UPwVO7cf6axrT2DRnwclDA66uBijI
 pEytYVYD5OvFgvcWL7pe8ugPPS2te0qUFNtNAQXCelXDWYdXCth9vaENWfgcpy77PGEL
 Mw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zHiOa3lfODbIYpa6aQjlyxpyDYMyLRS023Y18u9aNbY=;
 b=NnvvwblNv++/6KJojH0LimTMLlSR2TfQ61zqzuXuB5WWDIiwT4QtwE9+66VxHgL2QT
 o6Q11VA4kMFLai70l2zJ23NPBsmlWAm3adXSQz0BnXeiAW6ZFOhvzejiQWNz4RpRAqeO
 1xCYRel7wAfnc0AeOMeL0JksG4+O0qdXHd7/nZ0fnbdvozz71it8eJ9lrk3LSyxhzUMP
 YoY/TIHr0C9S80fxvhmr2lAMljhjAmae1MUBdw+2+7fmlKNfNeDu+JdIS5VaoPJXULE+
 HhBfSRTRBqqJs9sMSh/iYCC63rfNleK2IVgQGIf8czh72kZFmS6hJ1s+MEUD/svAxLf+
 y94w==
X-Gm-Message-State: AOAM5316eX9IUzJQI1iIwARbUufLtuxOcKPYqozpbVLGnsdmwlgkdMZJ
 ErMkKf18kFuq+xb9tbhTWaf3yWIdTAFmsZmhx+s=
X-Google-Smtp-Source: ABdhPJzGWY5XEB9s9uZ4OUaYd5mramYHBCydxH4InIU2KNCydTnTdUH6/7DTk7vtwuoHFzNc6fxkSBDQHBGtY9reCyg=
X-Received: by 2002:a19:f806:: with SMTP id a6mr1587463lff.206.1593171067016; 
 Fri, 26 Jun 2020 04:31:07 -0700 (PDT)
MIME-Version: 1.0
From: Drew Fustini <pdp7pdp7@gmail.com>
Date: Fri, 26 Jun 2020 13:30:55 +0200
Message-ID: <CAEf4M_BefktQdsD+2SKC6jRU-CfVSR7LDgNpdwZm2r6C-HwqDQ@mail.gmail.com>
Subject: Linux Plumbers RISC-V microconference?
To: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>, 
 Damien Le Moal <Damien.LeMoal@wdc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello, I did not see RISC-V microconference accepted.   Was there an
application made?  If not, the CFP is still open.

thanks,
drew

[1] https://www.linuxplumbersconf.org/event/7/page/80-accepted-microconferences

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
