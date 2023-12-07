Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DEC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16XLg6P+/yGWwEPMTfuBryYetB+D3x0CbsmtCb1K5mE=; b=n+tAL6UVs90om4
	jZ/w80/P0jlo34+QCXd3Kw/EOKjfwzzfuy/VjXKgt6NbIMkgEN2l/9z7xcJQ//tzEKTkW3Wd88kb7
	vyaDe59rVBJtSCg///UMVAkKJhKh5kxAZhT3EYxNoMa489xoyPRGDEClNGG7sSTRjCZwxWKo391hh
	lQUuVGd/s+9Vb/XRfmXyulBA+eA1v0ttcwwvVVjJ0al35Py9RuHwY3DA2AWM2ed0mHaPWLrKTMdlu
	0yTlBD7I81trJiJsDMXY+63Hf/2Ft/hUytyh9Wy8O9kfPbxSDzteu/nsTzbqwNPQ9n9uerxcnvrP5
	xssMcBee/BMj9uRiL4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7wm-00BzYH-2C;
	Thu, 07 Dec 2023 06:33:20 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7wh-00BzWi-0f
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 06:33:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d0b2752dc6so4844325ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 22:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701930789; x=1702535589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wT1sxbADQW/P3RnIhNKOoErO0PmyPZLTD+XFv+Dmqmw=;
        b=qngKICFzVDPUhrgRXZVvqkLZVwX8JLxd/3ynTWgYg19fsWfG1y6jDqvzzHlLsCVmDj
         EcRExff3xJ/FMZ1oxOvp3alCMSWSirRD5fPsWp+lJCKtYSNsYn9/LNQsoCDWgw9U5Ufj
         iTvFEpM4S+PqCKi0v38DM9F8ri07pbSa/EIWEfkjLmNb32dkwD0/f65BKLrJwTOGRlxQ
         z8w0Iu8Aaq/z28voAYH4TVC1jpeM0m0Oa87JeHv1D945V+/QqzRLjjRp8pyaNbdVvbtI
         KCJ5LE1emKIyYwM8dkvEP3gZ0sWJ7aBS/8HM0qu60vV+EfgE0d1ObeVLS/pKEfcPQ7/0
         isXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701930789; x=1702535589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT1sxbADQW/P3RnIhNKOoErO0PmyPZLTD+XFv+Dmqmw=;
        b=N6m5XVa9eD8TaZkxrGHdG3+zRFKaHi9AGAxAhI4tpf75JBwQwM2saqqIgi+vb2dncZ
         2i3Vz7OJppxFSMDylFzEpzNDkXkY9WZxOTEjOOY46ThKIyDAAfalCxedAJfPtXi1dioA
         sWubKbWdLkth1MhEvrcxkKi3ED5EWrpyICS4J+jjvdLvJowMgZg0DtnLv7W1dPedTAG8
         fuzQD1z/IxKtKfjXUafAYXsCTl5EfbE5KQmLvWzypXvqRARiRYUNIdBxax3sO01+l2Z4
         7ZbJVagujkw7qrwahHIAb4ILOnNsQHUb4Xw6PvcUUUwYhMZ9JGDNyWtVhKD2I3yknApY
         C4sg==
X-Gm-Message-State: AOJu0YzymeGLYuZBsnOYIOl//j/XufzkcEw/j20PkjqIFzqQTPaU8Us1
	S7iNl4H2W3ZIxAzK5O7CsRJ6VQ==
X-Google-Smtp-Source: AGHT+IGmAPvOgFD2LOhm3MP0gbls/N07AmNDX56j2zJ3nzhmHoKF8tEd2y6A6nIQCZgMGdF4lq5yNA==
X-Received: by 2002:a17:902:db01:b0:1d0:bc5f:ce62 with SMTP id m1-20020a170902db0100b001d0bc5fce62mr1982325plx.107.1701930789101;
        Wed, 06 Dec 2023 22:33:09 -0800 (PST)
Received: from x1 ([2601:1c2:1800:f680:c2eb:f39a:190b:4379])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902b18f00b001d0acd4e707sm520880plr.176.2023.12.06.22.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 22:33:08 -0800 (PST)
Date: Wed, 6 Dec 2023 22:33:05 -0800
From: Drew Fustini <dfustini@baylibre.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <ZXFnIWcAlJ5d/SE1@x1>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
 <20231206-th1520_mmc_dts-v8-2-69220e373e8f@baylibre.com>
 <CAJM55Z_jRhJLLQg9_OzJ_UeqaoqByu_BgxmwtVRUK2Z+qEKZxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z_jRhJLLQg9_OzJ_UeqaoqByu_BgxmwtVRUK2Z+qEKZxg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_223315_249892_7C3190A7 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, Dec 06, 2023 at 04:10:28AM -0600, Emil Renner Berthing wrote:
> Drew Fustini wrote:
> > Add node for the fixed reference clock used for emmc and sdio nodes.
> > Add emmc node for the 1st dwcmshc instance which is typically connected
> > to an eMMC device. Add sdio0 node for the 2nd dwcmshc instance which is
> > typically connected to microSD slot. Add sdio1 node for the 3rd dwcmshc
> > instance which is typically connected to an SDIO WiFi module. The node
> > names are based on Table 1-2 C910/C906 memory map in the TH1520 System
> > User Manual.
> >
> > Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> 
> Thanks! The rest of the patches look good too, but I don't really have
> a schematic
> to do proper review.
> 
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks for reviewing. The BeagleV-Ahead board is open source hardware so
there is the full schematic and PCB layout in:
https://git.beagleboard.org/beaglev-ahead/beaglev-ahead

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
