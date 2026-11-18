Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5105606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLto/tvd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbaIDOOr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l/oG/23Mx7TIGfRsR31j8Y0cmVWy61DKHhgvgZxeN5I=; b=gLto/tvdrWj0MG5wMxd8bDMB9f
	MDMsAFE2GqUe96H0tbWdoNsG11aLhMwHp/4ALiFwnc/7UWQl+P134REtz/IFZzdpAL3sshJ3L8xib
	DyRkEQeEKTrpMMpbZxwetpeqv7Y08PrJPfoYpxfn9LoNWEzisR93WpE24A1/LFezxlYiVsX0bToTH
	bapNauOPBsPow9doQFauefwpfpsJgTrx2sWf81fI4nO8VmYtup1XY904Dg9Fr1tLyZcdsYiqjihJ2
	FnbUITL2zdnGVJPk0a7Z1dfsXmv6l0mQRijWT0fNGhiq3We+p551m+rEM6cqUY6vrhNSUFOA/YHN6
	FWwKrY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYxS-00000007qea-0CFj;
	Wed, 18 Nov 2026 06:15:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYxP-00000007qeC-0p2b
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 06:15:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e9d7791b00so5929935ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 22:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794982546; x=1795587346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=AbaIDOOrvDNe7cJ+iqQqShPX7OLC0Hmwke9Ly9qdcEg73/wzppXCkn7o8TMziRRL9p
         ZHJiNwG4g8pSNSg0bXeMy1nW3BBupRqYVaNqHyRB1rWIa56k//UMZWrfvoggOs9feM9d
         bT8l0+FgFfrzr+Y6ho73DBtHXye+Qoh84F2/C3VsSGUdDHZNbXJeJEOUiQyfGh0uH0ir
         4lgNeAe3VRng0UngUzBL8ePVNuSuVHXQ3UayAVyNomxd+oO3PbWHQqfuOM0ZpYwEviwh
         H7n3cZkamOSdq4NroeQmZ/I33kn41y029swGA7bWbZSDbPX51DiEwVV/MovrpimMHjjh
         noUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982546; x=1795587346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=Z+Na42Qfbs0MBEH2jhtGTn+udf4TF6PAST55wpg3BjU8WZO1ecvbxixFJE1Ii5na4Y
         BRLfNN/wYyFHfZE/8JpkrYiBkXCXydZKFDVqdPod66EPOGht7092EYMw60qkmeO+zKnX
         NRzQ1n47m0YZZaUC3cC7dDlyjMtw4ae40ydFdCTuKEhY2wEA8x/68LbbsC3vQIieBtxp
         TUZ1e7xznXMy4Tm/SH5nOpq+MvUKQBwHAoeMAdXWWkhKNpz960vGKIeCLWmnsajbBygY
         jT9zZr9/PGH2qSXeh5GSyGcdQTG8W8iRT61AaWtLqBrv5/Wc7Gbsq+bwq5zyo9SLk1nQ
         TxKw==
X-Forwarded-Encrypted: i=1; AL+hErEEtlxcM8jBFqMeydJxnJDyLYUFaXHjU6hPLwCv66sUzHEDOoDeWqzs/YYp2RcziDNvhwiDBPxpBUJ3xQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9qaUoF8e1sxwTX+0nTdfhAWztiRmYL67GLQ5z0zgceJjP9B591
	PoPe49bE0QpaBLbDrPKsWJ3Esbc2BWGLnLWTN5XTkdIXtM/oEP9wa8jK
X-Gm-Gg: AZFdTZfbHKERNuIguqhiO9nWwjZ80uYN7kRd2uZwhCcrAp9mn3a8f94Qeo9E7qSa+PL
	yF6kbOs1kdGMSI0yAuqqKskraVdC0RnikBAPNK7K06teu1VPcCfbqnM6IGRnOp9Zb9IeBRVMu2b
	8ShGz/GBLkgzdHURcbzii9gk+d3xwKJny5M6iZOFx3sZQ2xUKB/SI88gzDL5ODhHeVfCfnN6v0a
	a2jGRZD9XWRiXWKAdNhOkM82cr9pu0VF1s+CUUOOTzMb0rydsmKqGUmbkb6z6wjNBtCKVd4zMAO
	2xFvSpl1a4MD/Zq5DIdEJZ5vuEils71btkvHIb3CrOix+sfErCK/VchJk3JqwhtCJWT4j0D2Wzz
	Z3+qOEyzeSw0UiGdBmYOwPAnUTTotLQmLrMy6pT/ZqHm38OrT2kdhvKpdERV+tKLWurHBU7g4xI
	oqx+9kh49dEYPoXXnwd0uNqV35P+a0jNxNVMazsdoLK08N/Ueyxmh3a6yDj8uBmjt6qvH0zSmwh
	O+6aFS7oFtSVy9bTYAuP3qPQKxwZ1vAfeg9ATdC5ODr1SAvTXOyvIhFKMmtMvipEnWD8xyOAsPy
	PkZ9jhO55Vp3wr6J171s0Hemupzdzg==
X-Received: by 2002:a17:903:1205:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2eff72f4375mr13854935ad.11.1794982546300;
        Tue, 17 Nov 2026 22:15:46 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm7508955ad.71.2026.11.17.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:15:45 -0800 (PST)
Date: Wed, 18 Nov 2026 14:15:37 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <ypx2d34mlq2a6juh77hpivaxg7eps33xzc45pvuvc77x4a332g@y4vjvirk3qj7>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <avzCmVhf8tl6hi_B@aurel32.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avzCmVhf8tl6hi_B@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221547_262293_9001E58D 
X-CRM114-Status: GOOD (  24.70  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 10:09:45PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-16 15:54, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> I have been looking at the code with more details. Is there any reason 
> to "expose" the whole 1024-byte efuse address space in the nvmem layout 
> (of course with some masking) as opposed to the 16 banks x 32 bytes = 
> 4096 bits only (still with masking)?
> 
> I find strange that user space has to know the address of bank 0 or bank 
> 7 instead of just looking respectively at addresses 0x000 and 0x0e0.
> 
> As the layout exposed to user space also includes status or control 
> registers (although masked), this might makes difficult to support a 
> newer version of the efuse controller which have a similar data layout, 
> but slightly different registers colliding with the bank data.
> 

Hi Aurelien,

I will use a 512-byte NVMEM space, with bank 0 starting at 0x000
and bank 7 at 0x0e0. The other banks will remain covered by keepouts.

I will also update the temperature calibration cell offsets in the
device tree to 0x1c and 0xea. The hardware accesses will stay unchanged.

Best regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
