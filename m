Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1827CC64EC4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mQ53WXyTCPynmLMLdnARFGgshfRqxRhr3riWFmJhP8=; b=BlHuroF94uapCU
	U4ohZ7WG4QA4AZiV+3yRj7L9xfXN/oJFfbwPLspTwHKzne/Su08OlvYZOvBfErLEMfo97CsBTHLE1
	EQJxB1aXIqJninx5dzNtzsudpMyfFWhA7kiAybnsnb81ttv6zJFHnrkFzTPzBzTO3H2PiJWf9SGA1
	NW69AEJ+lTTUheA/eRtPiod19ezC+2EaorStU/hON2nFI/hTCovONnLTUZLhjois+PS8/H6RPuKsI
	0bGoGlHB+8UjLrCEWg/nWPkBteXgPVSFx8i8NL6xGLsgnUHl9AdBdP8+/6n4gFgvZ33UjtYndqrpS
	GNQheoT12oYKNvWLSeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNW2-00FzPz-Rs; Tue, 07 Mar 2023 02:57:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNVz-00FzPS-VI
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 02:57:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id r27so15358470lfe.10
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 18:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678157841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MXE3r4DRRZF4vWFB+51VIYNyLys1Cywxy6liIMjnpXg=;
        b=G0KrM8MgnUTc3W4LeXs+jrcR1MH25aW5kvqf3fFoAhkNpQAtGYAMe91Da7E3oxrazf
         Kgd/clO8qMvTcqjtWPT4d+1j0wHoI4uj9lr52W9cyYCWvEhq7mrgLaJcDNoOZjiRQXoY
         +IS6dlroql0MKQzADaDJJpzc5EqUEB+NoCi6e/gwC0NJ2IhxWKgtcghhqCzmvBktWL/G
         5g/9hbDAOVqcbDl6LTDY1MevyiG61HUBTtv4NdX0S8f4rXszkiV61BTh8dm/HGFfA7z7
         1xVRG+fWKUk/7JSLary0NG+LLQ2dSV+3d7n7F73vBattRObpSMN24jeKAV6iBP/c5ugW
         q6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678157841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXE3r4DRRZF4vWFB+51VIYNyLys1Cywxy6liIMjnpXg=;
        b=YA5zgzOotpfg/paRcAudwJQF75SdfcW355G/2qDjWhdphVi5metsJ2DaR4BCMPR/0s
         jY9khWBo1PPoMgfLY2/Eai8zNLwERshhq8DmU5DEJMFQCECuiyVLayCN5Y1X22KlKZCD
         ef46ccoJjefMDpdAYx9bsZxerVlRDynxfbTYcR/1n2euZX2H081JSbm/vVBM0/WXWkHs
         lJ1MLYR7G+ODo0ao+17fbZCB7rPhVzHMBFOIA0kODz8E8TXiqxa3Xg5gwPmGv+Rv4u7G
         leGsbuH3cL7mbPRaNulRyqf4S+b93MOlYCZQs0e5Awj92qRD2wKnqraEEiLXR0BpqUhG
         Y8vw==
X-Gm-Message-State: AO0yUKVDEe6GAR/A9oZRizJi/VrqZErhJEmYlE6zTR+T5zDY5e9/XIuK
	QlaRW/wL4DKHws8cyI9FbDiUZaYfm6W7TQzkNeU=
X-Google-Smtp-Source: AK7set/DKfaB2mlEfIHnhJPxRUsuROLRiWvdzOYLNjy45HmkqV/KVuGeXJ1zwW74U6qE/IQ6Aq1mFPuGRMGIs0z/tU0=
X-Received: by 2002:ac2:46db:0:b0:4e1:d025:789e with SMTP id
 p27-20020ac246db000000b004e1d025789emr4022786lfo.13.1678157841053; Mon, 06
 Mar 2023 18:57:21 -0800 (PST)
MIME-Version: 1.0
References: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
 <789371c4-47fd-3de5-d6c0-bb36b2864796@ghiti.fr> <CAD7mqrzv-jr_o2U3Kz7vTgcsOYPKgwHW-L=ARAucAPPJgs4HCw@mail.gmail.com>
 <CAD7mqryDQCYyJ1gAmtMm8SASMWAQ4i103ptTb0f6Oda=tPY2=A@mail.gmail.com>
 <067b7dda-8d3d-a26c-a0b1-bd6472a4b04d@ghiti.fr> <CACT4Y+avaVT4sBOioxm8N+iH26udKwAogRhjMwGWcp4zzC8JdA@mail.gmail.com>
In-Reply-To: <CACT4Y+avaVT4sBOioxm8N+iH26udKwAogRhjMwGWcp4zzC8JdA@mail.gmail.com>
From: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Date: Mon, 6 Mar 2023 21:57:09 -0500
Message-ID: <CAD7mqrxY_BLP3fS0BnZNaGK+4j2cFjPYyWKehh7oe1f95Ca7iA@mail.gmail.com>
Subject: Re: RISC-V Linux kernel not booting up with KASAN enabled
To: Dmitry Vyukov <dvyukov@google.com>
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_185724_049464_DF7B0678 
X-CRM114-Status: UNSURE (   4.22  )
X-CRM114-Notice: Please train this message.
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

Thanks, Dmitry and Alex. Let me know if you need anything else from me.
Please let me know if you have a fix for this bug, I will be happy to verify.

Best regards,
Chath

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
