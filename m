Return-Path: <SRS0=M4Bm=UI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDDDC28CC5
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2019 01:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9E3214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2019 01:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMyvc9BL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="huqAGmgR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F9E3214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flGVBseg6Naif5Rq/VyEPIAdyvIvMZ2mNVgb4w0mm5E=; b=gMyvc9BLdLr7wK
	IuzO6xCYIlZ1Ow3Ba/gO37FNQ3WOJeFBPTtKB9xLHwRyOt5PnchZPObdVM9ceOyo7UzAGVH7iSW0a
	WXNhQJh2+0Wp4RW6EdW+oj85/hgAjBccWsYwLFNSwMCh5pfvjrjFIfRR9MbHiUqeDB1KdjinFZlsf
	0Z0zvbfI4Fr7DysoyHiPGKAYjkx28ahmBtgX2FGh6w/RDtYUoD/mCuTFSjpam5P3Svhfp4tUZTeTS
	NBMLGyYGv9wo6z9AEkYzy+QjhKvMNjfUY2SK4QaqLWD6BA2j7YE7J4wBZ62XooSkl12ZTNm1tjDzH
	47PGZHJJ8q04NHxc1QRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZmxX-0006eh-Kv; Sun, 09 Jun 2019 01:49:23 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZmxV-0006dv-4L
 for linux-riscv@lists.infradead.org; Sun, 09 Jun 2019 01:49:22 +0000
Received: by mail-it1-x144.google.com with SMTP id m138so6721337ita.4
 for <linux-riscv@lists.infradead.org>; Sat, 08 Jun 2019 18:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gezvdrCCB1eFoVy4rTrBVmFiPugXcg77UnQ5Qbf7MCs=;
 b=huqAGmgRp/IMJ6IItXSuWcUGce0kAPYhAgld1VYkhBCxbq9jYWtGHv0VVxR4mtjtFj
 Pje56U+SCbwv7t17169G02j548woO0ZfGQhzG3gFA0ctipdR407PB1HbX595NdmtloBP
 uU1Cf+ilslY90HYbeyGdAFvZfdfgU+NjJ+99xeriSV0dZbLcnlRLfvmyGV+2unAaes07
 BGle8Q+qJmtuEsXdFbTUSGMxqIAYI82nXg6cVxO/EGEeX7NoPvzmyYIMUzILYCqz0bVR
 j2jncswh1KptTGcPwlSwss4HqKSKGUTXZ6jIUaYz6uajNDzHlisY5tHYugVJBid2NlWQ
 6EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gezvdrCCB1eFoVy4rTrBVmFiPugXcg77UnQ5Qbf7MCs=;
 b=tvGgLxmF5+FTCqc//D3EEGFAkJqlE+x3yOA1Id058ID4BeSS3RVDv+J6vzSiDvcdBL
 QV7rr5YxL0OxW/anmxxcC/JCYePAUVZDCA+YcreEDvjzSUCxUK6hFODSooev0/G/8OkR
 JJRTCtBCwwzMA1aVCtaLjNDbWiIpXEY26ThGlvuWNoehzMRaqYseY37i19TFkgYI36Ju
 lP/pDLkVEIya83Yfl+v8Vyp2AXQOC5XaR68v83AC0AV5MI3JTFO1KkuryNeWJpextV/z
 jt+rKqVDD1T0N1iVzR/ZSTY4P1lgZi3pFOw35KxG+C+ZVV5VZCNguL/bz8mYF5Ed8pnp
 Zl/A==
X-Gm-Message-State: APjAAAUKTGmYBzH+OlLYVyaRv9OoDqukyP5t6CBYNcBpBoqz983U9U9R
 Z1UDKUDo1FwtGgzXLei5XndNVQ==
X-Google-Smtp-Source: APXvYqzhnLgdvut8Sw31mC+3id4EyC0GRJRfrCSBlSx1/cpNZwMxjofbGkBFHK4zP7Mf+HeG3Pnhfg==
X-Received: by 2002:a24:dc05:: with SMTP id q5mr9924544itg.123.1560044957125; 
 Sat, 08 Jun 2019 18:49:17 -0700 (PDT)
Received: from localhost (219.sub-174-221-130.myvzw.com. [174.221.130.219])
 by smtp.gmail.com with ESMTPSA id j9sm2929924itk.23.2019.06.08.18.49.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 18:49:16 -0700 (PDT)
Date: Sat, 8 Jun 2019 18:49:09 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] RISC-V: defconfig: enable clocks, serial console
In-Reply-To: <20190605175042.13719-1-khilman@baylibre.com>
Message-ID: <alpine.DEB.2.21.9999.1906081848410.720@viisi.sifive.com>
References: <20190605175042.13719-1-khilman@baylibre.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_184921_237732_F8CA23B3 
X-CRM114-Status: UNSURE (   7.01  )
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
Cc: Loys Ollivier <lollivier@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 5 Jun 2019, Kevin Hilman wrote:

> Enable PRCI clock driver and serial console by default, so the default
> upstream defconfig is bootable to a serial console.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Thanks, queued for v5.2-rc with Christoph's Reviewed-by:.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
