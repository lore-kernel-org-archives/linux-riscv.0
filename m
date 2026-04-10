Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC0E99071
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dncQkZR3OXzoMoY2xAnVAxbU75O7ngNKn1Vu2K3K1B0=; b=Y37N2xpHhZyEC4
	XCc9iWIqzouS6FHAeWWVvd91exBvNc1WjxC+PzSexD8vPz+Tid9NtaA+FpvaqChHu2oOO+4QPbkb/
	90c7JXmUTyLD93gJlZYQxtaPZ5sbWThZktEUNnjsFRfTX19LXcIEf/78EGxJ98DWb2XVNEOae6WJO
	akozUmUDq58K+4Ub0pE32W0ZN0qn1OWK5Tpa3biIIZkY3w4igfu6O0Zc9755AvhE8VWhbtzW2jRPb
	QDBbnNEmLc91/92p0O+uSS1p5Zafr3+iLxkR7PoshdQ+jaaNEw3dSfIEd8N4OIsC4I7wiT0GhcZiv
	cdL6I7qB1TJe2Dc5VNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8qP-0000000ByyT-0jhp;
	Fri, 10 Apr 2026 10:12:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8qM-0000000Byxz-1GD9
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 10:12:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so1266011f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815924; x=1776420724; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2xXUchh2By+ghGGZBk84vMcNEj5jYwmcow9AN3NHu8=;
        b=P/eAQfdizQaw53Z3kcuHX4+vgnlmDG4OOCYH0qGZky9tRcurgYzBa3NpMwjIuTZMru
         CdfymJaydqdCHZkXdXlukFileA3P7RV/DBWMbxJKA+wca8/TSAY8oXXOaaYCR/qdHQYo
         nbqu2YFBzIfMX1aKJtRIazL1httCSryCcX6PRPgJpKZp7HGiJ8qepFwbIt7WK6ZbExj7
         Ub5FHVyynIz4rDEk5Wdv/G49ts0Peoxl1dTObrFKypAkDd4mKKtvkkecDAk/mpqHZJMc
         YXaZT/YSZLpRtFeTNORV35GLF9zoXBplUGJF4NUHHA4VbcvG+L0aS+a4f8XbiefnUkym
         a5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815924; x=1776420724;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2xXUchh2By+ghGGZBk84vMcNEj5jYwmcow9AN3NHu8=;
        b=S2Fe7mgnlISIPpYRQgaM360d0B/BShvBKcdyL5Wex+kgwZGchYPiE0Q+lv/pmzULFu
         qS8kP8ghkg/g/h+3AX+pXY9S9RMNzPSDujBFD0wNd+XRKq5px6oLQFpZDBfk8J9NB0SF
         vdMR5cm+O2dxeMukKJLCn+kgmDfGAb+NmSsMxzSdHY6OYXu+SuKrsEUVOctU58sSsyH9
         g+IIsoThYs5mgzKaLuzCSi0xcImBDc0YZDlBfWRWmcCfvZbOMCmngDa6vkzKJqh4lbOY
         RpRjC9SNIYR4X5xTcdNY9QsCNbwnOdN17RInDH/jwMaBcQk4NnB8LK0Rvf2/O8+XE7AI
         aTwg==
X-Gm-Message-State: AOJu0Yx+OM/Wmbu76G2Dgk+QSeQN4itdVMSev9IjX3uRnMPEVB3DNcR/
	C4tgwmfQI8KeDlmgMhxpqrhsiHEM4Honacrfmr//h65q0dPPKwhtvyuq4dYfAQ==
X-Gm-Gg: AeBDievIrlGIIlhb3QHL4rQK0d4TEGPh5Z4ruda3DHy4mVNJlVH3XUxhHtHqglPrq5q
	tWJgO1IBLVtSA2lOtJN9yK8I+21ampXlE714KgD99pc6R6cbZ80CjZRBZIpEA5AmXIvZ5S9VI+j
	05mm724MxGT36qGj+jYdmc3errwkUHH5nt8NgdK7NoXaDZsNGX9p6omAnigm0/xJjhslnEBe/MN
	v6bOxRnp40H/5RazRFF7STxIXlfZS9m5oruWzKio/cj5PVGsYhmoCJ8Wau9oSWBj4/hg19jX4kT
	V7QGATTOKroe0HlG9Uevunes6HsygRFS1ksVPuHZEpVvMlOPVF1LSftC1TqYEcfMqjFtooMQpy0
	1HisqoEhIrfcFjJDuad0s0aEtrv2E6POMs1hi5YamYLjIX7ZLjvxlwiW1SBHpxvmwIsmfCZRG2n
	s1bPqClraChc6/IyDgyn8=
X-Received: by 2002:a05:6000:2013:b0:43c:fe66:43e4 with SMTP id ffacd0b85a97d-43d642b8ecbmr4197977f8f.31.1775815923730;
        Fri, 10 Apr 2026 03:12:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50289sm6507349f8f.28.2026.04.10.03.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:12:02 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:11:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <adjM7-DcN_6KvbE7@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_031206_348945_114E2762 
X-CRM114-Status: UNSURE (   5.26  )
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

Hello Icenowy Zheng,

Commit 96f30ee0fb9d ("drm/bridge: add a driver for T-Head TH1520 HDMI
controller") from Jan 29, 2026 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/bridge/th1520-dw-hdmi.c:139 th1520_dw_hdmi_probe()
	warn: 'hdmi' isn't an ERR_PTR

drivers/gpu/drm/bridge/th1520-dw-hdmi.c
    133         plat_data->output_port = 1;
    134         plat_data->mode_valid = th1520_hdmi_mode_valid;
    135         plat_data->configure_phy = th1520_hdmi_phy_configure;
    136         plat_data->priv_data = hdmi;
    137 
    138         hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
--> 139         if (IS_ERR(hdmi))
    140                 return PTR_ERR(hdmi);

s/hdmi/hdmi->dw_hdmi/

    141 
    142         platform_set_drvdata(pdev, hdmi);
    143 
    144         return 0;
    145 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
