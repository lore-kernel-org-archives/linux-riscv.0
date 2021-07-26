Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769EBC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 23:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2CE60F5D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 23:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A2CE60F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=U4OZoV+e37HiOyye3noD/jF2BAo8q2KEz4R5hWlZRDc=; b=qtX
	ZnJmToWXUOD6Oxy6rdIf68pafvjM+kw78Nom6mb5wGrQjnFBoy/RSrE/T+QAHByGyRP8KzTpkQbT9
	t+oeA4mHzfun5mK2JaTkvd7evJcDvElNa6iolY8aqAqC5Ob4Hsk1L9sVAAXEVgijefiN1XDIIIb2U
	v6prOMDsNrCFrHaxOnWfjtVItPQOP7EdaCeNprQMRQ9xtw6h0WIT/8M5nFMstFKFgHmPeSuHbmvZ+
	y4CcjArh67MiUDpe4QI890B3EErzHYmOMFhJV0LVJZ+/z1AmxVjVs1jDp9hDHEw+qncU6BUyjtmzc
	iW36hsS0AoeuTj3TrU9obyW65OR4uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8A1p-00Ce0C-5L; Mon, 26 Jul 2021 23:28:57 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8A1m-00Cdzr-HB
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 23:28:56 +0000
Received: by mail-yb1-xb31.google.com with SMTP id s48so9077293ybi.7
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 16:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=zgSgDkvEKIDk0kyR6Q56XVAjR3EYkOGz3kHVpC2etys=;
 b=K4CmCJ43NCyFpG29Smg0wmS3xsuwYnGQ68K69tacUp+6Uz77F5FK8fInfgJ/EDZ9AP
 LLIBa/2oDdkGP7bpGRQ6zbp5V3Ib6zlmuUp0ab/ZVI4ifEWOi2CCzGOlEqrgi7U3T1DF
 RZEQs/hEHBb4zGsm0Lg3DDBIzjAcHLPX5r7w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zgSgDkvEKIDk0kyR6Q56XVAjR3EYkOGz3kHVpC2etys=;
 b=h8U/4CP7yJ68RglCySdlNf7wOdnRLxxtvc/8MVlYXk1P87oWeTg8PI25KxULPL7sUz
 8qHBacZ2ASzHJdMjkEp1s/InLDRcmNCVyecLtmsjhiK5nq98nHEAM0zYey90/J6zy/ul
 W4k6r+K4EYcxqTzI837k7IRbFn/71i0M81YYI0X+e0WspVmp6T6cK7BhnTXEyHieFain
 N/t1fKdOInUzZvyCEIn6+zvxAro9GEIGNbonRO0xj5qTawfMBQdTYc1sdtgKxzuOxJSA
 dg5AQbZHI1xDSf4VEKTpegwqwUjS15C6Zrddevxawwe65YxZp7lA2im7qNe18HxFv35z
 JekA==
X-Gm-Message-State: AOAM532DaxPicWlVgZ2fU0qyoEjL9o76j4XJdu7hCn9Zlw4tqt3GbQse
 h09bj/G0o/RdArZ/71QBkBY8fgJslTolLKb/PAifmqt8YvftolY=
X-Google-Smtp-Source: ABdhPJyEAL+/Eq5Mb8TwK4epv4BMfbe2jo6Hiq7G1XUx4T1qCwtod9+Jr/MVVP2P6MjNco+OHkfxFeoz2c0rdSrOvMw=
X-Received: by 2002:a05:6902:1507:: with SMTP id
 q7mr27820385ybu.326.1627342130283; 
 Mon, 26 Jul 2021 16:28:50 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Jul 2021 16:28:39 -0700
Message-ID: <CAOnJCUJSYeJk4gqCuFCNJikZqOgkWG5CV-xHzZVLAXTJMY6GYg@mail.gmail.com>
Subject: RISC-V Microconference Accepted into 2021 Linux Plumbers Conference
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>,
 RISC-V SW Dev <sw-dev@groups.riscv.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_162854_661710_5F7EBCE1 
X-CRM114-Status: UNSURE (   3.49  )
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

The CFP for topic proposals for the RISC-V micro conference is open now.
Please submit it as soon as possible.

Here is the announcement.
https://www.linuxplumbersconf.org/blog/2021/index.php/2021/07/26/risc-v-microconference-accepted-into-2021-linux-plumbers-conference/

FYI: The Linux plumbers event will be virtual this year. More details can
be found here.
https://www.linuxplumbersconf.org/event/11/page/103-lpc-2021-overview

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
