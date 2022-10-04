Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7086DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 05:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hsGBGfixqdZJWybQ3sf8E0mMNbUAlRk9IOUS97Vj0k=; b=2NzajgoTw8rWe50DhLPbA62Xhz
	fjidGFaKUTKhv/JmSLs9i8FDq2GKFYO5coQXUt3KU284gvrZPh9gN44sYsjBISCxTv0oohhG+GK7l
	qHAuJEgQjEuossN+DEthq1fK+96q+ja164YD1R089mFChqf9i1Slr5SsPp14J+uwN4ahQpM0XqHRY
	uvJvJqm4lvLnPvkmT/aUFxaXcXK3f3lHvBY8rI/zbzwvBMF4sFhb7i7CY2LELBhNg04AjlI1dpjM3
	8ZNNuIL+j38WhetLrhRK0caXl1cCBDJXKlRA/yq92tgVpE0/oUwkkJIucT99OEy6lUob1R8bSEGbq
	br53AWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofauF-008blY-Hr; Tue, 04 Oct 2022 05:55:51 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofauD-008bka-1C
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 05:55:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id f193so11878308pgc.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date;
        bh=BTfAb6gaUwtFAZ2pkmfrI6SWUGvuDNZ2dd/8+vefOg0=;
        b=GrrLjByOnd2oG8gisrEbPB0wIsIYxXBM4wQt43gtBGxD1k+UoNAdb8ywkYGAg3b7Du
         zPq9JHohXWUIYCbXMcj3H6Erq9gjN/iAcGMM8STZ2d/SyWX1H08gKj/tVmSiNJ8J24+Q
         nCF7qMGBPLuBpLuJl8Eov4eLXKVsEF8x9QfzhdOx7GtDBky4t3DStXs9XR6XfCMD8yt8
         Vp/A8CI5xjOqpsUQrsDIb0yV3vYwtLhWJ0BN9b9nhOt/fda5k+zaeGHsGbuxcM6M5jVH
         zdk+hBZj+MRDdgzJ+q49MD5FX6kd8yS1OtzlBnHTn/dk9y9UMnGgNuIZybPBq12Jxs/0
         zqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date;
        bh=BTfAb6gaUwtFAZ2pkmfrI6SWUGvuDNZ2dd/8+vefOg0=;
        b=lCq/4L/eC5k8IbpQNSgtLjDESg2vOVTxMvm5j1nPVhC9n2KeCH6wW1M95m7Yp2dwee
         7aqsNkzOM0RNGLnj6HMp2jJ1B82GlcZcM2LaXkxiFuRTVIEMO3V0gtx6WGIR205KIGOo
         0fQ0nu8AXJd9RIVrM92vswyYPQKYj5tjyv7SYhzQ0EW3W8SAo2j9IxXKwLjn6jUeOA3H
         SGZUszPrCdyaR9ZOBAuwNra6JJriWCAdyRZjxuqjV4RpR8xUxdF5c5FLrDz9CLzQVMeg
         LUwI2wRRTko9KuO2xsMxPMUR4+QYISm5Uj0oXtFzRfj5jBxf+jz7Tvt45WsBd6g9nb6F
         dRuQ==
X-Gm-Message-State: ACrzQf2ClOD9G+q9W/p7m8gx7DsISAdSKgtrhpJI+1dsKUCqjX23D/fw
	l9IMcO3qqI+0oael9fCCgQgDsbtMPRCAbqJPM+CCO+UwpUR429GK+Ncd4NQSlzAXAgogH0+cLaM
	Y2VJvKgxBf/qqhrS3mLAg4Du748xP7g5/MZFhm6f2v2UjJkRdAYN5ru30gTTkMcloH9SlzjzFAS
	7Dr3KVbfyts0f/ThQ=
X-Google-Smtp-Source: AMsMyM4SRBVlaxAZarZ0Iaze6rOsCBwpwyppQ0H5jVogpAiT6ZfoVTCwkZQTsatoXL1gRMu6ZGos1w==
X-Received: by 2002:a05:6a00:1a44:b0:528:6af7:ff4a with SMTP id h4-20020a056a001a4400b005286af7ff4amr26361716pfv.78.1664862945329;
        Mon, 03 Oct 2022 22:55:45 -0700 (PDT)
Received: from hsinchu36.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id m12-20020a633f0c000000b0044ed37dbca8sm3111857pga.2.2022.10.03.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:55:44 -0700 (PDT)
From: Ruinland Tsai <ruinland.tsai@sifive.com>
X-Google-Original-From: Ruinland Tsai <ruinlandt@sifive.com>
Date: Tue, 4 Oct 2022 05:55:42 +0000 (UTC)
To: linux-riscv@lists.infradead.org
cc: atishp@rivosinc.com, greentime.hu@sifive.com, vincent.chen@sifive.com, 
    paul.walmsley@sifive.com, ruinland.tsai@sifive.com
Subject: Regarding the changes on /proc/cpuinfo for ISA strings
Message-ID: <63898081-16d0-39a7-fe96-f4eaa5babae2@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_225549_185207_CDCEC27D 
X-CRM114-Status: UNSURE (   5.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish and all,

After the commit "a9b202606" introduced for Kernel v5.18,
the `/proc/cpuinfo` will longer print the full ISA string provided by DTB.

With the comment of that commit, it seems that the policy of `cpuinfo` has
changed to print only the extensions provided in the array 
"riscv_isa_ext_data" and those extensions must be properly enabled (by 
toggling corresponding Kconfig ?).

So we are wondering a few things and hope that you can enlighten us a 
little bit :

1. What is the policy on recieving vendor extensions ?
Hypothetically speaking, if a vendor submits a patch which simply adds an 
entry into `riscv_isa_ext_data[]` without revealing any detail, will that 
be acceptable ?

2. If a userspace program wishes to know the whole ISA string, is 
`/proc/device-tree` the last resort for them ? And if that's the case, 
what will the equivalent in the ACPI world since we have learnt that the 
RISC-V ACPI spec is now work in progress.

Cordially yours,
Ruinland ChuanTzu Tsai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
