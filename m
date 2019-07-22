Return-Path: <SRS0=ZLBf=VT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3D9C76190
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2019 20:02:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34EA9218B8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2019 20:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+NwonyO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bTR8i8zU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34EA9218B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6n4gdKb8CmDv0XkVcq36JGxIQFglzaXuMZu+/ZFD/o=; b=R+NwonyOsikjiu
	rGQKLAItGb1bUfnY0pZa4ETJaiUhQkn4XMMNCSku6VRABvsLnzcHsDvHd8zxnt9VYhL+pFKhxb4M/
	oI5TiFEw9UEs4uucZH3SHubmqUsKUEp+gNRsGrx7pfpVWi/86R2g/i6Tva1QlPm3pCMOgz6oB0DoN
	ijMJNed69U6OCUJ3eBlkPkvmI+LmCku6RRdxaZieJQYdCvk1P4I2JbSMCE4K8fRWFwOU1SckG1uTz
	02i+XpHWHI21EYPemo9TqrDIMlVv9caRZnQ6Vky9wTOlyazlTn7N+a8ywoYaZd8puxhtd937mGytn
	YSEduGVermdmKD0EYB0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpeVg-0001HK-5J; Mon, 22 Jul 2019 20:02:12 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpeVd-0001H1-Oo
 for linux-riscv@lists.infradead.org; Mon, 22 Jul 2019 20:02:11 +0000
Received: by mail-io1-xd41.google.com with SMTP id s7so76637418iob.11
 for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2019 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7KHxh1QD/oXTDWc3Ol8Je8VksYYJh9G9PLns3mcwbuo=;
 b=bTR8i8zUllpMoZ40e03tB7gNhfdJCmmPPAe3V3S37KemxLp2Pfxvdg6aqvRR3nOCMy
 HJUD6xok/NPrliUcSvpBk5vw9NErK3Sgck4dkOw5uYesjEvb0gHvhsbP2cK1sr4pp5Cz
 oVd9jSLisJxIT7CfnmqtAdZwZDq2f6Swd2q3xGrPkPfYRkIoWaPJ5i28Klj54ARyZFTH
 ciWWyOR6+9PFVmVxngR1A312ewaEpkO9R7ubfD1Y6Ulr6DiDalliFyWtv1Ab1hlVpOWK
 zZCh82ajNKWjL+YqFRpoPFhpfupq2020UWCY+v9nviowDi4pL+x/sHuOQdmywjW+ViEY
 zz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7KHxh1QD/oXTDWc3Ol8Je8VksYYJh9G9PLns3mcwbuo=;
 b=uaqORkvNrAV1VK8m4iUhrYlMyux3OSq8atTJgwlTOPUqlRD/HkXDAYmV2zlNW0A2WW
 /wO9G/FHdIZYwfRFGPNJj/jqD6ThxdRHmECWoCY/G2NzO+3WIyil1ZrXHoxpKLEvpE1f
 EB1MUiiAAvTZsyP4GWnpLkPWe+nSw1HvqUbJerjze/ogXeyWTSnKTjz64xCze4WZGtA9
 cN/unNrDX7mJdd5g/jdsSenzfcnLRSTACiwn2SFee73QF8AxahM842P3b27MpVz9LmRu
 2PGOjWtJOjoav5dz9ckEJzmwH4u5yJG7TMA8tAOsDqJAi9ni3dWltTjHOWU4ush7a1A7
 7j5A==
X-Gm-Message-State: APjAAAW1zZ/ZqlTFbEu7CuNmk70ankqRhNVDjiJ9D5YhIH/aCeo8zBxH
 0B0QqTxfG4kle9JMhKg5SoB7xw==
X-Google-Smtp-Source: APXvYqxyOswcj7g0LDvyDOV3fbWCFcNrYA4iTJciHHWKaqUGvlZ1qgSVQwNjOcAJl5e0SpvoVdMXaQ==
X-Received: by 2002:a02:bca:: with SMTP id 193mr35203345jad.46.1563825729108; 
 Mon, 22 Jul 2019 13:02:09 -0700 (PDT)
Received: from localhost (67-0-62-24.albq.qwest.net. [67.0.62.24])
 by smtp.gmail.com with ESMTPSA id b8sm33365705ioj.16.2019.07.22.13.02.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 13:02:08 -0700 (PDT)
Date: Mon, 22 Jul 2019 13:02:07 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/3] macb: Update compatibility string for SiFive
 FU540-C000
In-Reply-To: <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1907221301490.5793@viisi.sifive.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_130209_810213_4C3341AF 
X-CRM114-Status: UNSURE (   5.75  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 netdev@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, sachin.ghadi@sifive.com, robh+dt@kernel.org,
 ynezz@true.cz, linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 Jul 2019, Yash Shah wrote:

> Update the compatibility string for SiFive FU540-C000 as per the new
> string updated in the binding doc.
> Reference: https://lkml.org/lkml/2019/7/17/200
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
