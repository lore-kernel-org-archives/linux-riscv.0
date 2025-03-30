Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8730C36008
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 00:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n0yHdj/tEul/jlkeUPIaBXSAas/IPsKY+g1iaDhpmRM=; b=Wb8bzAM+u2vvCZ
	6KhcH/b9fMmCPGLxZ3up3hXxCAtcMiPtoz/uyZrIukuSNA4DoieP8Zzz8cVR66Ze3vRNg1ktCn0bv
	CdjpYVQ/Whl/0D7eE4zF1xTDRIo9m8/QdCKsiTCDD0i5dL55U7H88T4MkxSIz02eCyEYjmAC7hftn
	k/Th9Ul1Aw4fcKjHrfvKU3wvC/slbkZ9LjnfTtHg1PM7BsqDoA2f0FjvA1MSoc0kV0+NVh3/Nw0KL
	zzyRTnGR7I28Vb4dplNezRe+pSMp7KVn3Ru1FiwPi9QmDQUFHCo7/5aNqMXt14n+/LVsH6BweBkvy
	hoA50EBAPgFi0YGnvPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygaR-0000000FfhH-1m9a;
	Sun, 30 Mar 2025 00:31:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygaO-0000000Ffgw-3Ydl
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 00:31:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-301c4850194so4556180a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 29 Mar 2025 17:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743294696; x=1743899496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8sX9JQgcjDM5B2WbHLYXAKpNL5V5b9vaaWmdqn5sl8=;
        b=LFmHtSZyZD+wXo/ugzf2SvS3rk6Xj9uI8hgSEks++3HUd+MiGTHjSfXZgjiai69CFo
         cgCNOwD+jMmOE4oZUkvmmxS0xQ9hE3vDLhNAVQy4h9AlGL9op1gJPhVKhq+jxzhvrgVD
         3/Ge6uBp4XE+BlkbtnFFMU6tIcR/+2rTgQNV24VRuM9CflhZMLaxE2FTUD9/kA55rDOr
         PGlUe+cnE7r3wgOBZvb50oju6lq7EiZ1CR8+OqFVKg6GMHszS/z26GmCSXWjh4R8HSOx
         vlr8FsUAqHtxTPpJqcEb5xOU0ylnFwRN1gHVSHtVpEViRN+10zeJAEzkUB2AT19A/L+W
         ktaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743294696; x=1743899496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8sX9JQgcjDM5B2WbHLYXAKpNL5V5b9vaaWmdqn5sl8=;
        b=QuU53QZpiZ/VfJ+fkSz6hGBaMMhWAGQuG/YRWXZUT4puxBhmaqKMFH2lDh1yO8L63j
         sfROH1mEWFWk4Qk3jz4qvlCXYAVVodgeEo+pBY4CZRWFd4fy6z5x3rBvYzHDvpPoI8BP
         monYcp+saQZfxdjwA2vC6rpY9m1v+l3cp6Mn8dSdD0c4beQFprWvEjME42ZWYMpDFvvS
         r1EyeaEh3V17GKMRotW7KWTNtw//MkA0+3TnMBJQIG7kJ+PwlhJMxejyj2gk6ppHteP3
         AFslMNzt1UwViHQ5Ln2HWH+onEIhBHlXIaBZ9AzvZdeVI/a8c0oYPepvVSabsgWEFH3x
         +lgg==
X-Forwarded-Encrypted: i=1; AJvYcCU/2KgGE1UL2qDe4rlcDfoIKnPrIDm/YXYZkm3JF9h3PDzIBWufOxKXUzsQdCYNPujza41BrSUuD2c9HA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2X/MycAPMZCm0JtTcURcuibzdGlPFC4SBXJlOxb4vI4xReat
	FhTlgp7ynsZi7nayKy7NDP9zlZRonsaK03BIKv9jnOYdfNkwr/LC
X-Gm-Gg: ASbGncuusnm+MQvIOx4dZf2P+jyLdiFNGF/yUa5bKJ0LyEHRQqYm/QwY7rDlAHF76LB
	fnGqeFJzY9Jtt7IuWuJKidCQAn1WCYFugmUID5GhaE+3YCnO+nY3j80F/37WCGXYlRGcTQMlpJ9
	byNGf0JoB9/9IDWNu3Xy5fcFvfKxaYDr+9pqBMd0mjeNtVTv5PFv/TMdQxHKSrbSvMxg2KYctl8
	ouwtpCtUzGL9bSrLmEC+VLg+6wmOCxyo8BZCI22GeStxutBz9Ny+L/y2QWZezttPjtK14lBXZhE
	LwxMdE8fhv1+4NtRlpbNY6g6LcWFXFInBAN+TvCswxT1pnLsjv/Qi1RZkmGI1CTyY/rABPa30Ld
	+hRk6klxZx978BIwsMflGdkeHQO9GPMg=
X-Google-Smtp-Source: AGHT+IFjOYlNIkklCiPR6SNYbKSePzshOfqmakMpfEqa1st5hBR7yRveiAYE76V57DWiH0YclLcTpQ==
X-Received: by 2002:a17:90b:56c8:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-30531e89c4cmr8376057a91.0.1743294695638;
        Sat, 29 Mar 2025 17:31:35 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dfd497csm7466308a91.5.2025.03.29.17.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 17:31:35 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v2 0/2] serial: sifive: Convert sifive console to nbcon
Date: Sun, 30 Mar 2025 09:30:58 +0900
Message-Id: <20250330003058.386447-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_173136_886106_A39F7AE9 
X-CRM114-Status: UNSURE (   9.16  )
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

Hi!

This series convert sifive console to nbcon.

The first patch fixes the issue which was pointed out by John [0] 
that the driver has been accessing SIFIVE_SERIAL_IE_OFFS register 
on its ->startup() and ->shutdown() without port lock synchronization 
against ->write().

The fix on the first patch still applies to the second patch which 
converts the console to nbcon as ->write_thread() holds port lock
and ->write_atomic() checks for the console ownership.

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/lkml/84sen2fo4b.fsf@jogness.linutronix.de/

---

Changes since v1:
[1] https://lore.kernel.org/lkml/20250323060603.388621-1-ryotkkr98@gmail.com/

- Thank you John for the feedback!
- Add a patch for synchronizing startup()/shutdown() vs write(). 
- Add <Reviewed-by> by John.

---

Ryo Takakura (2):
  serial: sifive: lock port in startup()/shutdown() callbacks
  serial: sifive: Switch to nbcon console

 drivers/tty/serial/sifive.c | 93 +++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
