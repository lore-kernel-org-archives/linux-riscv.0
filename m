Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C744FCFD65D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0Gu1+XH+EGLtpwXzRqEuZKJHgaXOR3vTotQBcQET+I=; b=zItx/tkJkkXVFu
	87yR1/3ffN6mwTFXWoTASPf8+uvfSSxfIsLOxUTDWgfRscd28dFcgAc68IMHONBZ3Vpc3TMaa2my1
	ew+T/cVy62F0pTx07/SNO9GGNjie+dSi5CMHmIBJmT+LOg+xL4VC9aeT8uEiLAGSiHphmi2SH4vut
	fzE489zahK0EoCI6A+AhHuFU2EPZjq3+0UsG2nWTPTxO/R1gwvgnswodnRl9Bbyud2kxyr4luJunb
	rUg4Ao/o+sLJ3POJDlI3+ktbkesF3rU44pdIJ7hQHuxlSjytnyYJdex3PVj49682JMQW6+Orob7eU
	AkdKH/rSs557iKIiJLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWKE-0000000FH7Y-0xtC;
	Wed, 07 Jan 2026 16:23:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWK8-0000000FH3l-1zIT
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 16:23:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0a33d0585so16901435ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 08:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803028; x=1768407828; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ+7Q/Ti00gCIw+7hhy5kDVy5X0XQseCMCNmnyae2YA=;
        b=cQ0Co+F4EQi/kfybr6dE86iFZwOz3vr6pMlkSnwsoEA8gjkTqd8m0JAR8cwk3YW1gY
         hJueaisuQjmVZdk7tdmp1+xgc/2X8jNazkKaNdG50cA/2kRBxWU9XbMPlfLxLW3fzeBS
         FRRgA48De62hllNiDJNVTvtHB5DvWnSnOPYMx0tKYmXYdopt8eDdvT8dP/WeOlBlDwCJ
         7FSIDLerQMQ3QO1F26XM7gZOwpmWW8sr8aFmTEOmzmtkPClEUAtphn/In+MZmI58KWqn
         rxTk9PBl/kWGfGfmmVmxktU3GuTk4t0IMGD2sIa3Hwvtl77BGEfCWDaNsUvbAPXvSG/Y
         2joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803028; x=1768407828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQ+7Q/Ti00gCIw+7hhy5kDVy5X0XQseCMCNmnyae2YA=;
        b=tFm8aH2IKrhr4hkvN8y6EKZOnyA20ZVNNNtHsRW0wT5nsiTIEoXjGLP0ntWpw/DohI
         1tNtBIRCKbVReMT+t7Wf0TKjZdDRrxQbGopWHC/lBp24ndg97srLYuntFfjkGIhnkADn
         PTr7a0EitFNEeLtcWfY9zlkUh7iPT2nmq4WQj4cmHd2lY8v9konbqc55NmzmI9qa2Un2
         zjkrjfVxX4S8v6fKzs0uOXL7ZkQW1EKKpnsdlzRbHLT+Kr7nlmYTIswLHu3An/mIfW8R
         R3fUxSszIh/6zi2rTpj7nYMA66Q+5H2jhEJ0Ryi77kj1eaq7ebp4qoBOKrCFHYRKg8D6
         lVog==
X-Forwarded-Encrypted: i=1; AJvYcCV2ipgWY0qXHeT2Xv41Dkf6rDY9UXvAmvjZXfiW5K03wCJN/Eka5mEhhJ4vv54vOBhjkvyeclU+Rw/PeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmPquZhatLSOykcEd51+E/SAmNQIdZzxo6/txSCGFWacB8Ib8o
	U5P9tDe8L9Zsf1UiGwXs8D3sY3Dcx7hd2GATTk/bHmbeIN9zBDdNTvRa
X-Gm-Gg: AY/fxX6KtjyNvpp5I7ieYFVIoTyFl+Zb57hJR7IPdIoF7cglm1mBZzBx8B0qzqFVRED
	hV3J0E1DwQOLYz3gnGq6J9tstEM3RhU1ZPH/demR4KdzPuPR/edYjfvbI9ztLqKteAqWppzMAlS
	vcpM8VwXrfYQEDsS8MvyJAlP+IYGkfIywusyvjTb4n9w4+yj8Z8ZRt91IONI8GxXIGtpcPCmXwq
	wjlyfYbqvI+i8ZHC724JWPitaaLLgRNChmEAquyDjdTBvIdPIKPHirdjJbSwqvj0k4SOzAFU7KR
	1nwCKjA7naB0ETzqmgi89OKP0jegRWDaT6WFWRCNNwjjOTj6XDFpiPG+IknXu6ostB3kPjtEeZb
	91knTS6Vx24Ru6o7kafD33evkXVmhgMEbANS8tLrUUL3wmhJSsR1wUhXamxnh5b7+lB4IJ6UGxm
	4XhXk=
X-Google-Smtp-Source: AGHT+IHaiHjB70xigUp/SSo/W4q9gkk85M7RPzHR2gkRrQPwVPEkFh3CLZSZ2WYZHlPy3Xh1Wb7TAA==
X-Received: by 2002:a17:903:1108:b0:29e:e925:1aa0 with SMTP id d9443c01a7336-2a3ee4a8758mr26237475ad.45.1767803027716;
        Wed, 07 Jan 2026 08:23:47 -0800 (PST)
Received: from localhost ([211.94.250.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4fcsm55666365ad.12.2026.01.07.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:23:47 -0800 (PST)
Date: Thu, 8 Jan 2026 00:23:43 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
 <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082352_758289_D96D2393 
X-CRM114-Status: GOOD (  13.36  )
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

On Wed, Jan 07, 2026 at 03:22:42PM +0100, Andi Shyti wrote:
  Hi Andi,
> Hi Encrow,
> 
> On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> > Add resets property to K1 I2C node.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> how is this patch formatted?
> 
  Sorry, I forgot to add the version number when I resent it.

  The initial sending process was interrupted, so I
  manually regenerated the patches using git format-patch 
  and sent them again.I have verified locally that the 
  entire patch series applies cleanly.

  Please let me know if you find any other formatting issues.

  Encrow
> Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
