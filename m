Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03EFCD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kQNydbNy0uPzamKKE6C0t3b034HX9G0gIdyvqh/upmA=; b=O1K9hK5NKUb0oW
	4SM56sYa2Hy7eVQtALMr+1x9qGco6rMIgvX6RpQ8LftLwmATsxVFM7icII7z0n6f6s6kH6piB9yWZ
	/anymHmjm7PVaqR/lxLbxoFh0DZah7WJ1zY+UqFeV5/a09qpJgAI4srQUoy0o3BgsLNgm57Vdv64h
	OHnoZDBpHLekFGe2IrmJ+qUVnN5C6FNfMYQAGNZAaH5Iiv61vfoB3/fPPM8I9K+CgEOO8z8GL5Qb5
	Tt4UByco/D09Tc9UJbBpvET8MqpEdy2Uyi9FBB+kDmH86AZroFFl9/2viKNo2aU9TpmtJxLrYLlzJ
	Ssaffv02zpCkOomNvOhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWoe-00000002Iit-3aJF;
	Fri, 19 Jun 2026 10:51:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWoY-00000002Ihi-3Gwl
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 10:51:13 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-842848fd613so1799254b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jun 2026 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866266; x=1782471066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxFKvuyFF6BTG/rctR0orxCMzNYM7JR4gRpefuX09Jc=;
        b=d69K5NY+SmUmaJtbJq5cdTIC/RfPecbCIcLMpG3lUa6NKX0e/XF6z/33tB61V9zbAS
         6g+EbHHxr1oQirpBDmUyI0o0kB92MvHNWIOYfTzXpHsWQFHIxZYnidZqODREc6dX9oVa
         PPUJZ1gVQ+bwT63KgNMHMYiycAhkHdofL3pQnMCtpyHU7G6weOxEveclUo+XHsExCrwZ
         c7OrQ8MJFfx+bpMaL+nUOP0Z9MOafNJ67UgU+x43KV2tjoj0GZ31CRGyinbnXAd3HQoJ
         BN4URMU+Uco/CdUT4WGj1xB5aFUyxVL2cgmlfyAlderKtSzs7Uv+V5NfdvBbZqrui8v8
         fgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866266; x=1782471066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxFKvuyFF6BTG/rctR0orxCMzNYM7JR4gRpefuX09Jc=;
        b=RpwGE7qJwLuYKnHXYs92ovwG2briz930pBBJ3QY/4ly3oYLwKOh4QkbjS5LGXa80mn
         ulPxtsWTimog+Y8L0BagaA5A6gl2YrxAwc6MH8YQv42/WqErkrTmEv5EIIFnhNvGq2nG
         hjicEHxBBT8AoutlGPsG2dt12T1gMoGa0003HLu6o1jUrtiie3piTtRCqnwp9ATuLDNO
         FXAyabXXJP4fJ5zXAL/FSai6QXIH80nspqO8+uYdeuXpnflsYlKGO6/DOWcFqqoVJsWt
         DL/EDvv/KCmPtRVl2QrWnfEdiZIgOnGFuVcUJ7mYfRMj4uONL/hipYGMkmc5ryR2WOiU
         pjVg==
X-Forwarded-Encrypted: i=1; AFNElJ//SRMKafOmAMlS//F/C/55LJGU0swU13hrG92jx4JjQ8mGive/FHYgJi6yqGGJNxP5QWnc6BMls4eYNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYeJt8pn+KeE/hOjeJWtP+8bNoqPkAAFEg7TX6DvjP/XsiEzF4
	6ZaxqDHuRMIa42h+9SJ9Co4fQrFUBx9i+pLycN+Adlx/TTbG6uXsDjbh5TL4y2sjaAI=
X-Gm-Gg: AfdE7cmcMCVtJJtuPjNdqb9TyaAQUrYmzjiqHTaymiV6Itu6L3FbIxSW7mGly1j48wS
	WUVPHQ2BciLByXGykBATymNxYjNhxPQdSWHEv9IaLD2m3tTlqHVXNMVJAnXv23c5s5Uk152JWQl
	+GmFytbEDFSueQtLYS7LYIpadNGcK+ZkgCj6RzvKAquuAASyRaHCUi6awLeEpOVSY6sbEB/2m+0
	XF/PNYCJk+2vjj3Lip/28qUoHmV5D7sEXhU5gNrnwdVrd9/RDiRSHZM3ycprYAdYOC0gAo72nil
	Jkg9Cugb/6Qw75Et9aicri46Ae6gmD0h5F0ULzLc0EAi0BoPyKsYcjZdZ2p25lYw/5TlqDc1Twl
	Pkun6gkIccfhs7qTvThvR/BXEYGkA7Wro0Ib+Cuor73qOLLdBVAOyEC0hzZmXuBvBByqHYAb7kH
	k/HX7rrIBZocYUc5ZNLtFND6yN4tfVWGSIane/
X-Received: by 2002:a05:6a21:4c85:b0:3b4:701f:a0dc with SMTP id adf61e73a8af0-3bb33952d2bmr3655979637.26.1781866266328;
        Fri, 19 Jun 2026 03:51:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:05 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT bindings
Date: Fri, 19 Jun 2026 18:58:31 +0800
Message-ID: <20260619105834.1277302-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035110_852213_F55A3D0F 
X-CRM114-Status: UNSURE (   7.62  )
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

Add device tree bindings for RISC-V Worlds, a standard extension that tags
every transaction with a World ID for fine-grained isolation. SiFive's
WorldGuard Checker is a hardware firewall in the system interconnect that
inspects transaction WIDs and enforces per-World access policies on memory
and MMIO devices.

The three patches add: Worlds ISA extension properties (riscv,nworlds and
sifive,trustedwid on /cpus), per-hart World ID constraints (riscv,pmwid,
riscv,pmwidlist, riscv,pmlwidlist on cpu@X nodes), and the wgchecker2
binding with access-controller specifiers.

The access-controllers specifier carries range, permission and config fields
to support three use cases: 
1. single range device protection
2. discontiguous range device protection
3. sub-range memory partitioning.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf

Yu-Chien Peter Lin (3):
  dt-bindings: riscv: Add Worlds ISA extensions
  dt-bindings: riscv: Add Worlds per-hart properties
  dt-bindings: sifive: Add WorldGuard Checker

 .../devicetree/bindings/riscv/cpus.yaml       |  21 ++
 .../devicetree/bindings/riscv/extensions.yaml |  29 +++
 .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++++
 .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
