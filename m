Return-Path: <SRS0=/MXx=UB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE44C282DC
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  2 Jun 2019 08:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD112788C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  2 Jun 2019 08:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzutfLAS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ll60+3BZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FD112788C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dOudm+54JOJ0Hvur3x/LZCfx7xfjJmb4aMWr8AJxwc4=; b=VzutfLASx94aTe
	tmPiz7TyfCBYmHJZBN1bIIyrYEPAcX6kQVmr1owvotRfDSpWEeJbjUtpbbRIv9YtTdXygFBDNi24A
	AjFawilBfgQ6FwNdGjRJ5fNLmk+p/iiULsyvfVHP6HvUGDXVro/27YjxiERAg0y2OYk4ynxL8txbK
	DWnkalMplBvjIpV3/KZayKx6eHBMsU18cFSuX8oGUHG+UJEMboZJQMrLYP/1fqwxlfgZQDD963jkp
	rKI9BsxaRJvGlUrEYI9QJIwht2n8E2L2psfNtegREczZ8MvZlodLb0vUxAXh78bG2hfhQz54fq+WX
	HWxzus96vZpiuSmzXVpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXLVl-0005PB-CB; Sun, 02 Jun 2019 08:06:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXLVi-0005Oi-4o
 for linux-riscv@lists.infradead.org; Sun, 02 Jun 2019 08:06:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id s3so1194656wms.2
 for <linux-riscv@lists.infradead.org>; Sun, 02 Jun 2019 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:subject:message-id:user-agent:mime-version;
 bh=i/hfo7Of2DjU/8nVgdxSdJ+UmmcoAojSd1TjlivmETA=;
 b=Ll60+3BZiHid5SgkpYwizKijDVwyt1HV2OpUrbc8J8NB8P8r6CkJaxjXsjH35mxsCD
 tAY8qqva2kAsJAXuLW/tH0H22Vrh9LIBQwrRo2l0HFsG0G0RnnYkDhvmnmVKFhV/rUDE
 jN4FSaV7smkDgYCURREGflCB1u2TgSfDqe8W4IWO7djrzgfuOyybdt6OX5BSPbidfAwF
 +lyTjoeZ+pebzC4o5M2gO2ZX5cXaApOwDiyknZZnqqiC1AM1Us07ptkVViKOYJrMDv10
 8iFPjgvLgsXjiPMBOFj79emU3G/kHTaAJz8+2rWoLMuVaeMPiOQmTZBQTGfnzo1dxwdw
 XADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:user-agent
 :mime-version;
 bh=i/hfo7Of2DjU/8nVgdxSdJ+UmmcoAojSd1TjlivmETA=;
 b=gB+PlFg3mg70ajEibT/5K6vxxbxNqbq4AgaDZcsctP8HEYRZ3qoLQYIEXBCc0Aciku
 ufGRs/69M0y3q1+py1g/gw/4g2Qw0NLT0JQKuylLwpFMuInJv7PbUZ6LIiaR6dNfFhyR
 rbYrCyZcIo5l5O2TUjryOZ4s/Co40HIo0lcv5zlduFLoZRLVJ/Pbo4VQ58K7mnWWeKns
 iVx9LPJfIoxIi91D9kWRyxiKJz1vcBpiwXsGs9hfrbZTLoteFMz6hjl8zm7EawSAw2Ds
 /RRMbZVXD7VzUZGhk2kvVtkzd9YEqK/VrKRpDVT0DaFkE5IidYFc65IwxsI0lhvHekgx
 pk5w==
X-Gm-Message-State: APjAAAVCYTq5Qhm+ojDlpAcsYHEMyLPiSXLrGqA+1MpHYu3ZrsbfO+zD
 FiY9PnIKxs+wZgbDRr+pG7VSrr/aaG0=
X-Google-Smtp-Source: APXvYqwZ99le5sUXEkN7ObI0zUL2ItWFAbjGlxqe/xcop0Jrfu7KDtSlyao4dJAC/Ft0y4H32SIjeA==
X-Received: by 2002:a1c:6346:: with SMTP id x67mr6301480wmb.16.1559462792596; 
 Sun, 02 Jun 2019 01:06:32 -0700 (PDT)
Received: from localhost (217-76-161-89.static.highway.a1.net. [217.76.161.89])
 by smtp.gmail.com with ESMTPSA id l7sm4605025wrt.71.2019.06.02.01.06.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 02 Jun 2019 01:06:32 -0700 (PDT)
Date: Sun, 2 Jun 2019 01:06:29 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 devicetree@vger.kernel.org
Subject: Sorry for the extra noise
Message-ID: <alpine.DEB.2.21.9999.1906020105161.9338@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_010634_253933_ADD50C43 
X-CRM114-Status: UNSURE (   4.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Sorry for the extra noise on the recent DT patch series posts.  It seems 
my patch posting scripts malfunctioned.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
