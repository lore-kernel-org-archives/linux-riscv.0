Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BDDC25B4F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 11:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mx8EeECeZ3FOJP93THhfZX1UBg0U5F9lwbOj4+BXT78=; b=NcZfTH5ghFMe5Z
	G2VgazDcsTz8cCj6uOf+wup0imzxR5US8Mqia0Y2kY4G84BX8n/7AKp5ONnHIGXp7Fkl1q5EtVtpn
	2bcRKfo2VLXD8sGitITtgFdzVRDG+kqZek7Xyy4I34dmIrO4fwbcNR8zS1gq6BtPDNWzpBlEU04xL
	8iXuEPalXyhTA0oLRwAEEKW1/UgOStechpsu1pykgBmTu+ksWdwEmBXNMfb7IOwYtdYIHTK63rd5C
	pxz/Wcoq3CUNZg/O9CKNRV/tAjwBwEi8OltYW1haVoGdMB1FJwEhAm1QU+qFjYC2sJfO9eOKVnGAl
	gSaRty40mn2ghbjwwohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQL-0000000CUFh-0XqZ;
	Thu, 02 May 2024 11:16:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQH-0000000CUDt-1M4e
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 11:16:23 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0CCC6424A5
	for <linux-riscv@lists.infradead.org>; Thu,  2 May 2024 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648577;
	bh=or9J1KNamr3SyadMwGskzlQdXHkztewT20MwCVZSRlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=S2JhjyuTdEQmt/x54ukbrqQxmCaqRJIgifIijBkargmHXU63fnBLrydmFdLeVLCql
	 Jjf+otZLgNFgDJQ8+0O8OD5RKWYHamUs6fuBXK1/0jJpc6h+M7kbgKpSdlXk4982YH
	 5VkmMilE1t4hf0KvlRLgZ7S6csoQ9/CZMtMifgU58/fME5BpHnS/gd0Xf8+T/IS9fo
	 wpFDYczHrKA1WJYauNCDGFz9QH43Xptkwbzhb6rjnbgYGublTKrXDARtnqwgnJhZIX
	 zPAgYM3ncSqzWlwccM8Qh9NchYLPe5AGpsuBYwUb074CSyM3KDoj9RUhEmMSA7KOc4
	 Nrk1wMTn/zUBA==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51bc35e78a2so6896723e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 04:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648575; x=1715253375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9J1KNamr3SyadMwGskzlQdXHkztewT20MwCVZSRlo=;
        b=FIDjPve5iVl0adLKvDBXlgW48yvDWo9qAkWetx7bMxWiEx+aYxvZa6BVHV99yMHCpR
         ZiwB/g9uk/y764Es4/9euhME6TZRIpfsifxOgIACCblW0Yt51c1O2C8DDUo7ZHiMTIyp
         dYruy61JnBnqy1v7buEyN6zzTzFzru/rDj9Jr8x5+lRg9zfyH0FRJgJfJIxKQIQ/ufOn
         kAx42PMfFSAg4e/P1jCX3uyUchENXD0eyJKtAsVrHfagPOn/9cAVLtcHHaja2Hp/ohUI
         3dDGM6gYEV91sQuYdgTTbvHUjWDrtPtk+xD1pTciHSiHP7qwuYiyAZbq6MaKelPrSt5P
         4BIQ==
X-Gm-Message-State: AOJu0YynAf290oI62lAKPR0Tm1rf9e7Pigvt3hrbLqp5hlagp0orbpGS
	ZcAxKrQLgYPgi4D9nFawUsHBlSg7u9ucimualwa70TgwQnJJ0nZA9QseKaNDurOW0g8mHisuPaY
	0Slr0so5FWzbQLt/sWhVWGvTWGBIzdO7I5ZsRDjE/LUyoE1lsO25XgSH52slL3Qdz2uRYz0hkgD
	TSdTqCW2gHvAfptw==
X-Received: by 2002:a19:6450:0:b0:51b:bb22:f21 with SMTP id b16-20020a196450000000b0051bbb220f21mr4131198lfj.38.1714648575615;
        Thu, 02 May 2024 04:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbuAj3aP4RY2E8LiKmkKVQKaw+wSBaSVpfSeA/6/airVEvEgvLgc91RZ0Nt20kQ1CC2w5sWw==
X-Received: by 2002:a19:6450:0:b0:51b:bb22:f21 with SMTP id b16-20020a196450000000b0051bbb220f21mr4131176lfj.38.1714648575240;
        Thu, 02 May 2024 04:16:15 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:14 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 0/3] riscv: make image compression configurable
Date: Thu,  2 May 2024 13:16:05 +0200
Message-ID: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_041621_817084_E4F0A8C0 
X-CRM114-Status: UNSURE (   9.37  )
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

Masahiro's patch[1] made me wonder why we're not just using KBUILD_IMAGE
to determine which (possibly compressed) kernel image to use in 'make
tar-pkg' like other architectures do. It turns out we're always setting
KBUILD_IMAGE to the uncompressed Image file and then compressing it into
the Image.gz file afterwards.

This series fixes that so the compression method is configurable and
KBUILD_IMAGE is set to the chosen (possibly uncompressed) kernel image
which is then used by targets like 'make install' and 'make bindeb-pkg' and
'make tar-pkg'.

Patch 3/3 depends on the previously mentioned patch below.

[1]: https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.org

Emil Renner Berthing (3):
  riscv: make image compression configurable
  riscv: show help string for riscv-specific targets
  kbuild: buildtar: install riscv compressed images as vmlinuz

 arch/riscv/Kconfig         |  7 +++++
 arch/riscv/Makefile        | 60 +++++++++++++++++++++++++-------------
 arch/riscv/boot/install.sh |  9 ++++--
 scripts/package/buildtar   | 18 +++++-------
 4 files changed, 61 insertions(+), 33 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
