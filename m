Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86388C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 20:28:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 698E622B45
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 20:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v05njzFE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="l0a6HVWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 698E622B45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ra1p5/pU3YwxpIXwH0p8fu7wlCaOpOY7IG19Cd9pnLw=; b=v05njzFEwpjVDr
	pQmWT4LYJtjfyy+fjQlKeUgU1edjmvTBAmTkUZMqofNjcHDq/9NMtZR94HCsWPHTEzGMarbIoc6Zj
	0h2j8YFIu7eXF65MRAieSDAGY5xKjdhnAaR4MGdsExfePif027MjEemYgmIrMtMClqDd1tEObGHn7
	6Lu5VIRP7coVnUplbVgtLLDyUmp/MCt7gQlNiTb7q5wOVCj6u4Up4myiHGkCzCIXcTM7UDAOgU3qv
	94MOeUh1ORImnzBFC8kKsLkubrwja3n19/vC6wP9tetN+JFbYq7KE8vNeYeIbXG1asFnnsrkzoduD
	irL6Vlc4wEr7wmOEYOEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2h4g-0005hr-1V; Mon, 03 Aug 2020 20:28:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2h4d-0005hD-TQ
 for linux-riscv@lists.infradead.org; Mon, 03 Aug 2020 20:28:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id k18so11639055pfp.7
 for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2020 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SBoPOjD1+MjiXrruMja5i7W4XOLzC3P8vUbULr++NuY=;
 b=l0a6HVWeCWI2AhX7ypkmAE7Z4QGiGH3dI/vLGnXTBwK+3qQHmaMjclbOkJli8lE61u
 GV2RbjxNFtf75hFGCiu8ZICd1S70rCD0s2ruB1fKA98uRf/PWS3OaA2J/hveo2oljVnt
 SUoowxVdqom9zC7Kx9Sdba0jscNt5iGx99I5eOfwtPwpswTNOGwu3+f+94eLZZKtcjhp
 6Ukm7Ybfwk5cf+2WL451K9t4/bNsMCQU9kFKkB4sGdPfa8c1kvnvvm6E3ql2oi3nZIQY
 d9SEpH5Ah0/Yt2n80tURq5YpblNNh5Icop4492fiY5d76THfdIMMuh5rOcR7go3DGjkT
 bgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SBoPOjD1+MjiXrruMja5i7W4XOLzC3P8vUbULr++NuY=;
 b=pM+IxVv7ts2fPTeDoFDBmplZ3xkN7KxoWFXLYsmy7J1VIuIxFuAX2VGn7S2fPZKR3Y
 ZhY2zxBxA/u8evUpTZJh5+wU1jnAWFet+2sAdDslvYIn0c+16SxlzJDtfJ/nuAawhMbw
 FQR0CzWzr32k7G2DM86zTuXDtb16rNCtXJeT2DeOIWVEgAF3xWokagOyrL/ugAXwERQo
 2yjVS7LA3E5pAEJghTJWnV7QFpsYb6PvuM95HHfQntCneRF8glwES1dv+m8ijjGqb+88
 xDNcwkK7aXJ5/NJawudsOv1CKgRqQhmyM9fdJyrpibmFAtyniIA+tdBsIVcojZdtZLKN
 LSow==
X-Gm-Message-State: AOAM5305y6QbWia/WN5A99UHG9Xa83Q6aaCJ7i7yiwroS/VSgz2dKQck
 01Gf87X2RhRb6blZkm6p+nk7sddTeIU=
X-Google-Smtp-Source: ABdhPJygL33BUyF1KQExljzYiGr08JxnD9OM/+ZKKlyHGQCfT6K24FhbyPFZFBX48wTcK5NVZeLp+g==
X-Received: by 2002:a62:31c7:: with SMTP id
 x190mr17817336pfx.100.1596486521540; 
 Mon, 03 Aug 2020 13:28:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j4sm21382027pfd.92.2020.08.03.13.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 13:28:40 -0700 (PDT)
Date: Mon, 03 Aug 2020 13:28:40 -0700 (PDT)
X-Google-Original-Date: Mon, 03 Aug 2020 13:28:39 PDT (-0700)
Subject: 5.8 Pull Request
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, tklauser@distanz.ch
Message-ID: <mhng-5eec5674-c0b1-4909-b30f-7fda1228a99f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_162843_956960_531049C9 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Looks like I managed to get my 5.8 PR stuck in my outbox so as a result it
didn't get to Linus and therefor wasn't merged.  There wasn't anything
critical (just the -fno-stack-protector patch), but it does mean that
riscv-for-linus-5.8-rc8 isn't going to get merged -- I could send it out as-is
for the merge window, but it seems easier to just put it in with the rest of
the patches.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
