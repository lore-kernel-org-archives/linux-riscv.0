Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31187D1D88D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCNyNmXCwJMpUnxuEbpNVV+PfTUR9iY5aCy8NV4KUxU=; b=SxYoA69wHosW2S
	Li6Yao/7uT4yoEXBECMBbSl449kOpJ/GNJ1H4xGwE+IRdY9vgTtwhl/IhByXF5bLgDU3aq7/Tj5fS
	bzF5JksibAew26Icuvk4d4upcYXHefeupIpNNbNyEU3XqU7nSPTDDeIcrQUGa/iTHhlVjKFn9xMij
	EEAblfflE+RUPcR4Yq1K+2rch/U9jSfukl2ot0g527aB8cVRV69VApsGLugQ1EXIrXA41Z34+Qi/c
	h6AW81fWmRhSh08HMefu7CZu9LY/zEwGOBflq7P/Hmt/4s+J8Ne9KaUn7oRiEPSsN/L5qv0OTPnu/
	tgt5PjTYoTlJiPvX7buQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lSB-000000093Lh-0kbu;
	Tue, 15 Oct 2024 17:35:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lS7-000000093LK-2w9f
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 17:35:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20cf3e36a76so21669635ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729013722; x=1729618522; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JytOzcc+dUIDL9WdRCARe9Uv3pKvU7/eSVdxVkOAXWI=;
        b=d/gTsRkzHR/MYk0v2JsFKMbl6Ks0WNRzfsoGcmlQ4bTJBqoH8b4YLeeSjirctSPUMW
         k0mDnx+0xI0/FSKbnI7dL1762RVTWJqf0Sq+GsSTvvh6ol2rTZMwSUa2htDn4FoUy0u2
         wxGf2n6EhsVD2A7DG6ZcqQYRNRYfC65Gb3gLyyc5Mah6Qhy1jAx8qsyWaz5fNkU8fxLu
         YriiAIASx7RUrlgyGnOo28/UQJ7tO056wQOShiR++5J2FNndDj1voPPv90GhFaUwTQ76
         UeDpxVGBedBjfFpxwUGkuzcCHW0LppnmDfDBxKkMRjjjLXqNBmJHkLeexY6BkzitZyva
         Z9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729013722; x=1729618522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JytOzcc+dUIDL9WdRCARe9Uv3pKvU7/eSVdxVkOAXWI=;
        b=P8unV1DPDcoxGzMQC2dD00jN/XcXI7tpwK72hjfMjgiOoA8uo1CiyzRrF4buZdA4Mf
         m9cWx+19Uj3eVl6tLThZivD82Rj4Nv8/39F78mkNeFQSzxy0fd6S3gGPpGik3udol0uo
         xQ6DVvabYR2lWxe4W9jFNmVBFYeT9z2Gz/qWRmFPXAI0RPP/WYWAVH6BzeNV8b88wasn
         1ZPkU4O3lbMx8OinPBKDylj6GT+0/WqEptg0Ia4iVYZ1zrcZ7x01R+IbvzB3dVxAmoDK
         6qJSxGDiPbGrXgkSz4Do+6DBSGpmGErpucWpor2JSSDBYbqurPbvjOvbq8Kt6O1ONKD/
         aIVg==
X-Forwarded-Encrypted: i=1; AJvYcCVLNyh6wz09j16KtpT3j5jHiZ+zS+Qhd4kIf+LXqT8gP2ojcw1LgyrULhZpQSgOTAVdCN0pjCAP+n1UCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsA4Hky++JAtJjgYm8sVg5OXz870/iMwAA8SVi74pkfM+Rq9eD
	y2GAUoO3pkqsdrOxK/VR9VC8ZYPqP8sjQWD7NeNLD2RSy9dapVDrd/iuNdIXVL8=
X-Google-Smtp-Source: AGHT+IHgnKPG+JToMuAc0LWW3oeijO/iQFtN52pi0xgDD1whm+yFZJ03BLmZqH4aS986t90jj6sCwA==
X-Received: by 2002:a17:903:2301:b0:20c:7d4c:64db with SMTP id d9443c01a7336-20ca16be1f5mr250149925ad.49.1729013722182;
        Tue, 15 Oct 2024 10:35:22 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805a180sm14526195ad.242.2024.10.15.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 10:35:21 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:35:20 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: dts: thead: Add TH1520 pin controller support
Message-ID: <Zw6n2HJqltna1Y3U@x1>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
 <20241015-thriving-dizzy-4708ff6b6ebe@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241015-thriving-dizzy-4708ff6b6ebe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_103523_765804_5838758A 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue, Oct 15, 2024 at 06:19:19PM +0100, Conor Dooley wrote:
> On Mon, Oct 14, 2024 at 10:54:17AM -0700, Drew Fustini wrote:
> > This series of device tree patches enables the TH1520 pin controllers on
> > the BeagleV Ahead and Lichee Pi 4A boards.
> > 
> > Patches 1-7 have all been cherry picked from esmil's th1520 branch [1].
> > They do not have the issues pointed out in the previous series [2] that
> > I sent out which contained out dated versions of the patches.
> > 
> > The final patch was suggested by Emil as there are not currently any
> > users of the spi0 node so there is no need to enable it in the board dts
> > files.
> > 
> > I have tested on the BeagleV Ahead and the LicheePi 4A. The leds on the
> > BeagleV can be controlled as expected through sysfs.
> > 
> > [1] https://github.com/esmil/linux
> > [2] https://lore.kernel.org/lkml/20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com/
> 
> btw, this should have continued the version numbering from [2] and been
> v4

Thanks, I'll keep that in mind for the future.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
