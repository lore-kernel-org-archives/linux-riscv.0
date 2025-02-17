Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A1C021A9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vbMbncortRcqrB/MUrdqo77d6Nhm6dTwwhilEHTHVI=; b=sVSVUw6HwD4Pa0
	bC6hTB4FqWkqPc5clKj+nlvcYsQlsMsK8xH/ddKoT6EU+WtXlsouJImi6+hDvb95AwtNCP5mPlxYJ
	cu5Fo+R2QGaTDwLgHmSXB53MXo9HGY0gC6Ze6ZeIKnYUacO5XbBIZNTsuatokPQGQR4qQwXB2fWRD
	UCdsr8FJ8WAicEKPlNVxtkB3Q+/xG+0nZe49ieId69zazUf3mU2ehevOW8vy0OmzSXnKSGWOR7wQ2
	PGc5n5Bicbb9rjIpet8ugT/DYaP2qiilytwtMZiSZLsRnKPOIF3atY+j21XX+exdfJAmDYIfltvpr
	dX4edhW2TCrscE3IBYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6He-00000005fvv-05sx;
	Mon, 17 Feb 2025 18:55:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk47k-00000005IEA-3Yc2;
	Mon, 17 Feb 2025 16:37:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so1962301f8f.1;
        Mon, 17 Feb 2025 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810255; x=1740415055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
        b=faTD7Rp2JJcWtslFej0pETk3OHTC+FIVyNfpriVwznlNpmJXVljo1wlizHz6snrmEL
         Vw2TLgCctIY5/2IRmNwU8dUeHodcq/j0Zbd6xFw2JiU+pSq2H7HxXMVnTVJ+9aTr3FMY
         S/LWdhlMBaAvqkY8JKAGGAkCtbV+nAQFMm5vWRpvAhtGg9ZqTSwEQqvpLspg7nK12Kgs
         laYfZ8TZX6sx88mtidm8M084sHXHTAu4oyz9BnJOZvHr+eylNa62HN8XAS6P9C3RxhhX
         p1Osnzd1r9CI7e0+tkD+jlO3/m7qSx3Gk9AoYEqYUI/kaEHKloOPM7RMPRWbIHd88mX6
         UxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810255; x=1740415055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
        b=rFhPKKxt5wqc4jhgsrC/NoOuE9u6gJVkcwl2d86Iuu6xQnzoSyw2NIfqxSboF0s0yW
         TVRA57UBQTobeocASaLpn/H633kKay4b4hgGefQCf6CZUETvjY7Bd3J2Pcq63hNw0VgT
         ARPpNDN7Ajy6uWJZsOGNoUo8JZ8nbHi9DtqQtt+74yzvkBIpgPwNdZB9EVEDT24BHWjT
         IxZjALv9fnT0R48QHEFVDzei5V8hTZ7Ycw+rX4GG/YH1gurAhBUpeTXtUhhLW1fM0Dmp
         yJYUa8S507ORWnZK/vlYHPlrAGv4ddVwdA7HHfcDmkgcoAGXmu/nfEMFxtlpGXzoONU6
         FkZw==
X-Forwarded-Encrypted: i=1; AJvYcCUKJvdIfvWSLCXHcxdlNHlQlAMgqnUXJq9UmOdVctTQ7vFb93QgZfEeAVJCrJwv2KVoB0iDUNXdjl1ncG6PcB9N@lists.infradead.org, AJvYcCXHkpJV1viaI7zsaKvm0x9WljLYpj3h1DMJOVlizcNDZiow9z07g/Vha54wxoVnYYm/N9k4Pu0Nor+a0sQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiRm6a58l43iW1L/rkbnygWQi/KuglCwu371TuYgXrkHz9ACpk
	5l+xSc/aPKfq/e42kg+BeyqLX8bCcvXqM1KUUj0+plafWYW5ZEgm
X-Gm-Gg: ASbGncuYB7hyW4S9ynDZiARMAuAfSN7udPSqAqlthKVnQb/0+eVuRDcFRE8GpX9Hgt5
	LEGaE+t+1K49uHLeavPswsIkq6E0r3B0+z6u9orINNJzxfMHxakMKY6LdqLuwlmPR3QWZ5VEMVm
	9QQsUvwu39dNrjrzxAzEDkZ0jfpt1AuurX6OcXzO9KVnOzDm47n5Rb0DQPhdyDysK6fL2xe7rVe
	0+4SbI0/dZPbePu++quUC/M+7a43n/C9E1EMvnMTFR7WaAiFtWmnunGEm5rUk0/deRbYg1amT/X
	nNa2vJPpTT5OdfrfXV0808pzfHjUt9OymaaGSJjxl68wJat4ZSggqj0AIg90dmzsBVTYPbmga1P
	/oMyKprc=
X-Google-Smtp-Source: AGHT+IHfk4fhCYlLR37pJBvXWtv75DWNoeEDbdc68Ccdk3uRnLzXu0R2uoxz3Sfrv9nYBkbSbSFitQ==
X-Received: by 2002:a05:6000:4007:b0:38f:2b59:b550 with SMTP id ffacd0b85a97d-38f34167df2mr8240262f8f.50.1739810255313;
        Mon, 17 Feb 2025 08:37:35 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f2591570esm12881221f8f.59.2025.02.17.08.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] soc/tegra: pmc: Derive PMC context from syscore ops
Date: Mon, 17 Feb 2025 17:37:13 +0100
Message-ID: <20250217163713.211949-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083736_884768_2BA61A25 
X-CRM114-Status: GOOD (  10.27  )
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

From: Thierry Reding <treding@nvidia.com>

Rather than relying on a global variable, make use of the fact that the
syscore ops are embedded in the PMC context and can be obtained via
container_of().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6a3923e1c792..ea26c2651497 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3143,6 +3143,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
 	u32 status, mask;
 	unsigned int i;
 
@@ -3156,6 +3157,8 @@ static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 
 static int tegra186_pmc_wake_syscore_suspend(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
