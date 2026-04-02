Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC69D39418
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAAffpJCqJh7kDs8QwI+MIjKhGWf6zcPQ0wiHo/VrAE=; b=UH5qPd0SOUnALQ
	eFcVhmONAl+4hKvqIr5ZBI+nI3UIOLv2+E0RLXeRZ8x7IozDP+kkYKLpSB3y1+96zJ3z7KMFjdxXP
	DvW1wM6ePYTD/Gz+6/m9HiTwuw8DXhAPTKe6LWWPGfREer5NC65ylfQNLI3M2CL410fY6MUs+Q+Dp
	N+ViUg25GtBSE/EMIVTFQ+ouZy5E/deraEwoegtun3YuW8yM4YVnmbNAkp1W9dsXqjbcspFfmHIxW
	afuQOSLREDYrljL4YCIrk+Nz83n+NWrfJE5pan7JHIKVkXwR/n/nkR9mDz5KiJRW2ZTYGlbTWWerP
	NqIcRNfalB23GJNLZlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gwx-0000000HZOr-2wio;
	Thu, 02 Apr 2026 12:15:03 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Gwv-0000000HZO2-2RXh
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 12:15:02 +0000
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b2ebca625so7111851cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132099; x=1775736899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
        b=F6fLjxsPeMqKGthjtEwmHAOFo1/u7YphRLilk2kaXA1XzLcn8Lz5wsqyNj5O/OpFZl
         toy/+v0lqfbcXebqAvFTdJJueHsS2EQWxercsJRay/nZAvunurUX21UyODafhKInPrce
         esQtO7RLRsIxavGFf12rl/5TCjujotOWJiUzyIDcqXHyO9kCeKIjoSfjlHaept1wT293
         DErCv+flVaQ2+LZiyH3ZCuDBboFYRmI1EnbUz9gd2m3jgNOet4VhE6Tiy5Yywv0RnCf1
         Qet43rWCFE5HkjOCDcQnS2bD1qZd/riz7hUKUQJ2dgXbvO1o4GWni+VJ2bZ0fo+XVeCP
         7hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132099; x=1775736899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
        b=r1WiScNL7oywaC/y+zkPukG0qXXtEoHC1CKk8Ugy2UuhUww+bd+Wdjc+kIgUot/1c9
         +NXyI6goQngUAF3jYBP4gUaD6B+xIdH94pmq6eUCEtGJpEq+1bmCSSq6cg0c1sWaPNoy
         c319gAt/0dFtAAmfuO457tV5tCynxz27Jn0nJ5ktuTlsXo/6AOvVh396s3QUzIZ4hmAs
         FyQGEVkCoTB13hpyu2XjycqErK4cBzLjmd7RCN1oK23pQhCVRXNrPV4etOSnsBVXUtM4
         AqeutLCIv1XgGn5inxYRNXb3ekbjGjO7D/hn2pepMeFc2u9qZXNhF8yHheCMqGYiftwI
         lYDA==
X-Forwarded-Encrypted: i=1; AJvYcCWulLOYyizfa5nhftq8zOh2hUMaY6k26WfEBEAd2lY+wdgMeLZmvtPw4jKF7Zqzs799DpaYF2VgMzSxNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFfgTSVCwC0zTdppeQ4UGPvSv7f67IsiaPkjw8R1idvZyGwXxA
	kKYkv0h/4pWHc3wxj3zrDjNm37T223H9WW9ZNHi9XdD2sqkF2HvWyVCq
X-Gm-Gg: ATEYQzwYrgERtnjMvihqqj6QFRB6iQXJzm3fSC2UqgXH5+rACeqJJvReColjrh1oIsL
	dJxBL13lVm7McBjimfCp810Jzd5GS71/2g+fbViz2ElLTSZGJ4Mah4krbiCtPnZSbQEDvjbNj1/
	HmSPYMBxRK0z7PAd/lLiRGNSKxTt8LJ4r+vlaZr4+vjfGFLqKLXvVJ7oLuFxhU5/gBa4jb6S9sd
	xihZlHd0rlmg8EpoZ0ocrMCoItN+F0laT9GDZMCbGNbJzlKz7T5Jc8ox/6A49IS5Flb2gDUjSLx
	W+eqeXnJoHWk5BUDIBwDIwyRYl6zX/qyLqnY+iYoxWXWd09mz9ZrtF2WZ9wp3OXyaNJ/RmKExq6
	KOG1ogcKY6Qbcjwz0fJRrIpMsJmgV8saxuhxiwfPjOoxOOY6Svxw4SmKuQm3B4H8Qp2moiri0JD
	s3ZQ42RiD+bDuKOgpcw/lHaIjdKmjAuxSl1JE+WH8bVTGgI23dfYtUWoWB
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr23690271cf.6.1775132098611;
        Thu, 02 Apr 2026 05:14:58 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1d871csm23904961cf.10.2026.04.02.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:14:57 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:14:54 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com
Subject: Re: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S
 board support
Message-ID: <ac5dvp9-pvIwguAA@sleek>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <20260328173450.219664-3-josh.milas@gmail.com>
 <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_051501_624445_D8EF2D2F 
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

Hi Michael,

Just fixed in my latest set and will post v5 after debugging your eth0 issue.

Thanks,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
