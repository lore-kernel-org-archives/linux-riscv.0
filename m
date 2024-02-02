Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F872C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 17:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OBTXG/8torigyv4BqArtxeyiBscdvYvLD+mQvvobYnw=; b=K52EGILgpbHOWn
	8CzBpFmKCcIOurzY6b0+llEw1n15h6z3u/Wo6mR/UY15YMdz2Tx5KMyu6r2bx6ezd2bNXo8t36gii
	SlvSNrswJvb9crnFnniVeDR4ynJxtRn2ta5TxoB17emzIH1DFg2ChrCG7R4jNpNr/6wL2ora1lJy+
	EM2XoN0HyAMSQAsSKnbDjq0gtbVpBz9YexD7u8wPK9s9itk5etDE0vEEbXUrChLOKZR0n5L07FQYR
	lFXwYH8o1y5uSQ79PHygcpD8yGVpc4faxU4ryVCjK0VnLbV41XVKARF1yoOqGENOH+3TX43MmdLrJ
	jcvIb8OoaRImyYUV1T2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxdD-0000000CgLK-0tq9;
	Fri, 02 Feb 2024 17:47:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwVA-0000000CL4X-18qw
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Feb 2024 16:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zdXQdXt7uLhKSI5m7G79mULu/VguSqRuThE3UzF0G/M=; b=aifPETObhhiOMra8ydkezrXDXT
	XpiEDlrH1j3CJ36h21mONklo5diQLSvQ0XSyUvioKXjW1cY3ldSG49460Fqvy7EvC+U9NpO76XHYB
	JqsE/VGJcD1zatgaIVZtEiqDdfIdbnMRawuaMuyk/yweLdCXV1THBfkymyW+0eRg9+9zKJuS9cvLf
	A4corM2k9lnXHTbgkN3o5c0KmS5CvBRJTIfadsfAniOFzh7WKpsQkVZ+tz7OV/FDnttArvHXocqSP
	RbF8U6p2k/0HXqYHqUY6ocoKS9l3jzV95ygCw7d//DFIqfYP9GpscaBnlk/VXjXiPtIpbH9b7fxp2
	I3+IOuJQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwV6-0000000A5Ou-2e8Y
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 16:34:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d918008b99so18359425ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706891685; x=1707496485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdXQdXt7uLhKSI5m7G79mULu/VguSqRuThE3UzF0G/M=;
        b=Z2mWiyADpg68sKN2PP4aoX9+CyMuCLZJLB0juElgsfsSX0+N0bztVelkuIcEM5b+6e
         OCPeDc/alCsjXTBhzXmgU1cu4mpKhyjtecBnd20kmM4YMPkVTOPvumzex+IW1TATqSkk
         GbRLO5l43xlh+88DnlCGtyVb25rXFR1YSMVBHdR5ch8PhQthslKRRlZeVOQ14JZgpHhP
         2+NOvEyyEmFbxbAJ+yln4loIjuFQTfvv1mVudg+g+S1neifJm+dXDmO5kgeYgBbtbkpS
         SDnjDBIhQgADvjIHgjlaN+D0aZbdnCNC7MWH35yuGDq+FXesaFxsuZJYJcbwTymAEy2/
         OELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706891685; x=1707496485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdXQdXt7uLhKSI5m7G79mULu/VguSqRuThE3UzF0G/M=;
        b=YrWTT+JgilvKpAMAORP+D+n4fNkIrp5Khkh4XgUD6/1ISRJb7jmRTYTmYtSg71ML4X
         HEKCODVS3UWf2+HRW4HB7KMWdLi0u3DifmHZodQZ0zz9ldHmPHTIYAZ1PsK03Nz+9xpM
         Mf1665IQbssLbCBmpaM5VvftNR5oqZWuKLVLDKL4gCcNNoNY1iNZ8+YMPlsPOUlnLnGu
         v9ZJEnKFYhd6d7qzjRCqLQHqhMfA44oyES4kSUNvZlNijKyI+DhlvkXnItzcz6K/eLBo
         wkP9TK9qENaQTncIXYQltM9fU8+vomJZg2PUxJMoE5/lHFOiuek9OyF6zFnGupDf/chs
         QTLA==
X-Gm-Message-State: AOJu0Ywh7h/7fhgq+yPqmFp72tfgyX4eMEbPT7kWpapdkpqTQl4Y9ZZz
	OjCEYdgwR7FkZUPvVGipbonC4zQDEsUmkUIQ62lN+jqSN2ILj9VWT89loQrKsfc=
X-Google-Smtp-Source: AGHT+IGeSXexknJyqCvxmwiH4L2JVOdEJAH5LevXg0Rh8dfbIrxux5chSbtz0h0DsQdD5qCN3QQDlA==
X-Received: by 2002:a17:903:32cb:b0:1d9:6091:6f3b with SMTP id i11-20020a17090332cb00b001d960916f3bmr4721097plr.47.1706891684987;
        Fri, 02 Feb 2024 08:34:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVqKdY77sH4w/gkgczn3OarUbhZoeewIrRVoedcjoAmpjy2EH+uuY1EUYIhfWI+JJqio+FklxQl1cB3xtxG4uHlt7uG5w2uVyoK08N64wTmY9ggGPUC4khyuhLoXSSaR3gl8O4yqPnNHGFN2yb1OgBwCPFDfETYS3r+yVfJV3L5S/2Hv8vXEiAY0AJncaVFLy0F6jA6ymeNnJQJePdLRpir1N3kZ5q37J7r1diC2vku+m06f8Uq1NHv9cmGmScGAx+ePj6Q4VKXQBjr
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ju15-20020a170903428f00b001d75c26e857sm1784870plb.288.2024.02.02.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 08:34:44 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH 0/2] efi: Fixes for EFI_MEMORY_SP memory on RISC-V and ARM64
Date: Fri,  2 Feb 2024 08:34:31 -0800
Message-Id: <20240202163433.786581-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_163448_987310_0F0A81EA 
X-CRM114-Status: UNSURE (   9.02  )
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

Two small fixes to enable the use soft-reserved/special-purpose memory
(EFI_MEMORY_SP) with dax_kmem on RISC-V (and ARM64, I think, though I
don't have a platform to test it on).

Patch 1 fixes a trivial integer narrowing bug. Patch 2 prevents adding
memblocks for unusable memory (including soft-resreved memory) so that it
can later be hotplugged by dax_kmem.

Tested on a RISC-V platform that presents a range of EFI_MEMORY_SP with
Bjorn's MEMORY_HOTPLUG series[0] applied.

[0]: https://lore.kernel.org/lkml/20230512145737.985671-1-bjorn@kernel.org/

Andrew Bresticker (2):
  efi: runtime: Fix potential overflow of soft-reserved region size
  efi: Don't add memblocks for unusable memory

 drivers/firmware/efi/arm-runtime.c   |  2 +-
 drivers/firmware/efi/efi-init.c      | 12 +-----------
 drivers/firmware/efi/riscv-runtime.c |  2 +-
 3 files changed, 3 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
