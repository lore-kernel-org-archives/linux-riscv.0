Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E9606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B5YSWa49;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RMsvTuBO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=HsX9mwXiHcI3+Bf75dOMyVedibgdeLZs+sEx7enP2R0=; b=B5YSWa49dv9PIFgv4KP6O1bjQ5
	KIyAEJEA8yKNWrTlyh04hFxU5ip1n9mX6jBhwyyxR+RUMQ0u2pkmHqnioQwsaJROhHLGdwBk5L4GQ
	fkPViss34b/3x0YpPc+wak6sD9LfwtvIVYLhEXUoz6KdvM3JxuHdIpmll/NpFHQPkDUa565Am5gnr
	FvjdkKNWp6NpDUK9MFq+HULyclnirfy+nzLYgKjdG9t9fCmhT9AZEfPWLOGC02QNK5BdnCXXsIzzp
	DvR4kKtH/Rue6OzsMLJrsz3P+/WBlIgVoFC0478lCIkLUq3vMeiQI9x/4z5P5pJ/HTm10QYagG801
	KKzz4/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknK-00000003mxN-0TAP;
	Tue, 10 Nov 2026 12:17:46 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknG-00000003muL-2G8A
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:44 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso12420075e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313060; x=1794917860; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
        b=RMsvTuBObzecIWcgIe5UiAwkLFlzOMNnJ57iFgQv2csnGGsWg7U7Zxh3isGPJm8y3s
         7evjtuoy/03sNSSy/RgYNstGCeH+3170FgQMnzkJbw+5cnJNuGi8aFmU99yMLc+iwVs0
         fzv9YwW8kkh+lvAkM2c99mrZwDnCPX6loyYZAdJiyzzYKBbustdZ/1SzMigA9zBGhjd/
         5ALJgRBeDw2yV9K3D6M3EkA/++ENj+biut65jDZTjgw6/kpPNNs/4Bcuwj2UfpRjNfmh
         o4mOuCm6fI5aoc5HjNwlScQyHpFScyI7LYACACt7JeN4KNiJpWRuPx3PrFQqKRIcZ2bl
         o0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313060; x=1794917860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
        b=A/irETsSXBfcwdDS7jtyQwII1en+gfzTK+kexVPQj8yMnEIOdHPyu3ucLwF6paZIh0
         ODIcfJvTL4r9OWhT1edlzyyh+hu1483Jy6fv4xJcAv34TzDj351xNRXxxjR2cE80vt8l
         HTGQqeqirpC3vjri93QHmrQ5HSpknQ4xyjAWbYm1Ucw5Nff+LUHE0Uq8psLVsnCObLuL
         QRomfmfOquQea0FwP5d4ZyfSNeMF71l5a4zi5iy4HlXDWA3DhmUtfhh2zQDglrk5Yqux
         BYs1gj93a+ax8b9DlYaZkibfWaKmKncnYN4CM4iQH5r+whqMvU1DPD0dZMeYJSs896uO
         CVkA==
X-Forwarded-Encrypted: i=1; AL+hErG7oxVcir3bF1ysA13kl35CmieNU7QbZ91dcHB/sneuRJR7nArB8VkDZVnUpmGlXIgOYBqobS3G4gCyNQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+u84hguwPwFbHkJzNhJ1ttprju0/tLyKe4fcscWdsrwNSn803S
	oWhl5mBF1Am3n/iKQsATu948idG78yqC8Aq537H4AukerPDsuOIdEpa27HwKWaSZ20MHIE0+QA=
	=
X-Received: from wmbc22.prod.google.com ([2002:a7b:c016:0:b0:4a1:8bbb:59bd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c9:b0:4a7:c366:d791
 with SMTP id 5b1f17b1804b1-4ba02308537mr40596315e9.1.1794313060140; Tue, 10
 Nov 2026 04:17:40 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:33 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-13-ardb+git@google.com>
Subject: [PATCH v2 01/10] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041742_586813_F626E401 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Prevent the I-cache from fetching stale data by issuing a barrier after
the data cache maintenance completes but before performing the I-cache
maintenance.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..62fc8e53c8a0 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -107,6 +107,8 @@ void efi_cache_sync_image(unsigned long image_base,
 			base += lsize;
 			size -= lsize;
 		} while (size >= lsize);
+
+		dsb(ish);
 	}
 
 	asm("ic ialluis");
-- 
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
