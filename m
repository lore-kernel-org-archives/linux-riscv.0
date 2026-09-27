Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F27C98338
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TvPOONvqVf65tOqU+OyYbFYEzqwa/aeu/Sl2js+G4gg=; b=qdenHojmuhF8ut
	+IPis9hsoWuIYUThqjXQcaAG+Ed90X16V9cbQjGjkgFb7HeNWkPZdjAYcjRHQUnb4ulN7Pb6p5P7v
	nk1o5xxrFtUdIpHLEuOgsX6gny9Cj2lQUzQ7UjE+U3JopYCN0F+eOw/QKpT11hWI0hMHptonJFKeQ
	4f2IBk8Iw4WA909PI7PZp5LSeFO6SFoeHP2rRzCoJlqwAyliAo7A3V21FWs/8WPh7vvfe32oKzecs
	8r7s0rcwbUV62Dvxq1jieV/q2Nq7RZpFYthlhGJSFKkisKo1tM6qMa7DAJ1VqdVFt83YtqXKbI9Yc
	/RE4Cyk0+2ZCj9SoSAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArzH-0000000Gc6K-2LcT;
	Sun, 27 Sep 2026 16:44:27 +0000
Received: from mail-lr2-x0f.google.com ([2a00:1450:4864:38::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArzF-0000000Gc5t-0rIS
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 16:44:26 +0000
Received: by mail-lr2-x0f.google.com with SMTP id 38308e7fff4ca-3a64dff7acfso20463721fa.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790527462; x=1791132262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9i9q/dJ0TzJzbLEzaTtZxs0gRFtr74CiVWwdTizVWpQ=;
        b=ZwyAT1Qx1HWCsGZqAAKd7QInzvjnIwt7nfiAK8m7dd/XHGovZNZv2lHu8WMCnf27c9
         aD0uBYvtAIViK9MMa03Fc7Q3c7dgO+jW0ACK+StrjuL51ynrpIO57r6RqZlpK4uJj8YY
         g/TRRm00PSLY9JSxyPoKaKXdRVmgKwWN0jvyVTkao/JpWyKUZgfAgU9u7kQ11VUjRecy
         yr3NzCKpZv/gbxdNnA7+KM42wWS6ljJD57SWg9DkQDuyOCGFi/QbVJCUa0zozRa+jROJ
         cUOTwhL+EMkqKwzHbRNxXIOZ3KqZlYCI64bkFQnmkEGown28yGuIF+8yEdFXf3O/vH1g
         cwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527462; x=1791132262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i9q/dJ0TzJzbLEzaTtZxs0gRFtr74CiVWwdTizVWpQ=;
        b=yiMM0sJtJlBdUyRgi/Jgh//Qyg+pK0UOV/zTX7/7zjewnnC6g4gEcCJVUxTri2XCSY
         Tq1kKM+4qpzL+xLKJa2lRZQGPu3dtyfUxmDELhJl+F2Jqc+WU3vJrlk/cnbkGnKQ6gry
         SW6u1WEsRfg0IVkHi7F/3SkFQ0rTisahrI4FBkEhssqTYat1vYTLuXTtVvNRTU4Dcfql
         9qZ+qhsNLOipoUcOyc8rGjP4q9WGvNfmAwFOFbesR/ZlDTQ2nsSzP5zVsaZI0WNxGhF2
         9rtuowqeRS767idAmQfGJkXUPCrc8VaPvHNHLjIxoODsbG6xy5MuMBklV2qIMCbm8B+F
         XB5A==
X-Forwarded-Encrypted: i=1; AKwUvBzs4CqzVr3zCpC4VGSA8ddjLdmPZaeN2Zh7EGJupu+uD66SChELv9zygu9Roy7YTtQwNlwhcJrttWkGHg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLqJ4iXxbdVwXlJXOFImxOKwb4kBvSxp9Vxqvf7kZJwBZVuv83f
	Avao+qDyldCf8M9gpeww2jCNrCXDymPz5CxdEEVa0YW8JkP9llp0ImQrIHbicoBW
X-Gm-Gg: AYBFou09mYqWXpTVoGPgvOyfAG3NfiDtkOxj4Yc9sKeYH02l+dbGaiN1UBVxvjDauwV
	mq33DKgTLUlOAA4pTm7KOs4G7KWaPKV8PY5GXIgvLKuzK+90BvfeeKLuKsGasnMASuP6w+Z8RF6
	+ahepxksuv6kYKWy53007u0AgesolvaKeDELXXuH+cu+ZGhMFPx7r+PjRT5TZp0OW/2jzLHzw8K
	AJKajwsnUY4ltGmTGIobwotECloxZIsps+WdMSHcHc3boeSQQvIFu0doYHTCebqvOVY84P0S2a4
	3DgtND1QO1A44mwPQsV6jmT9zpYhD34vxlaxiAhGGEsrXmOdt7lkPWUWe8u55mzqbsNv9EK5LlE
	hnaoGxUPiqCf6/K61Ga9GndTX4sLCHnboqwg4OA4wu1uuBFFWPbI4KWtOcQUtCopUVVSFpueGcq
	u5Wy/OltDeZbz5qlOK6WE5YTC9BQFajF7sTL8CN8jp9N3lG8wfXitgNqdlGsVVLX+KKAAhUaYF5
	x+f80xpgffKv636Qw5VbMln/tepR/Cj
X-Received: by 2002:a2e:b8cb:0:b0:3a3:74b9:8a7a with SMTP id 38308e7fff4ca-3a63c410288mr30893731fa.19.1790527462361;
        Sun, 27 Sep 2026 09:44:22 -0700 (PDT)
Received: from artemiipatov-ThinkPad-T14-Gen-2i.. ([185.119.0.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580b28sm22425781fa.11.2026.09.27.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:44:22 -0700 (PDT)
From: artemiispatov@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: tglx@kernel.org,
	peterz@infradead.org,
	anup@brainfault.org,
	atishp@rivosinc.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	hui.wang@canonical.com,
	artemiispatov@gmail.com
Subject: [PATCH 0/2] *** cpu/hotplug, riscv: Fix CPU stuck offline after failed hotplug attempt ***
Date: Sun, 27 Sep 2026 19:44:16 +0300
Message-ID: <20260927164418.3090433-1-artemiispatov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_094425_254322_FA860946 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Artemii Patov <artemiispatov@gmail.com>

These two patches enable RISC-V to retry bringing an AP
online when the control CPU failed to complete the
SYNC_STATE_ALIVE -> SYNC_STATE_SHOULD_ONLINE transition and
the secondary CPU is stuck spinning in cpuhp_ap_sync_alive().

The need for this arose during debugging RISC-V SoC. Control CPU tried
to wake up a halted CPU and sent an IPI via OpenSBI. The IPI was masked
while the secondary CPU was in Debug Mode; when the CPU left Debug Mode
it saw the pending IPI bit and started processing it. Meanwhile control
CPU did not observe the ALIVE state within the timeout in
cpuhp_bp_sync_alive() and aborted the bringup. The secondary CPU
eventually entered Linux and got stuck spinning in cpuhp_ap_sync_alive().

A retry of the bringup fails due to both the current sync-state
switching in kernel/cpu.c and the incomplete SBI error handling in
arch/riscv/kernel/cpu_ops_sbi.c (see the patches for details). Both
behaviors are addressed by this patchset.

Artemii Patov (2):
  cpu/hotplug: Skip kick stage if the AP is stuck in SYNC_STATE_ALIVE
  riscv: sbi: Accept SBI_ERR_ALREADY_AVAILABLE in sbi_hsm_hart_start

 arch/riscv/include/asm/sbi.h    |  2 ++
 arch/riscv/kernel/cpu_ops_sbi.c |  7 ++++++-
 kernel/cpu.c                    | 17 +++++++++++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
