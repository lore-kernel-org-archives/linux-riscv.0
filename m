Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE1DECD9BB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 02:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ejUYk5dnXcM8gQQ1JDT3i0eQxLnK9KJo0YvpAri3pJ4=; b=BV+Lk61xfhbcw+
	XfEVwr7gFB35n2Lnm369feUIMzRb3EsqNd35nSTG7BJf+vsOd4Io7+UTurBJz7hADi1+aTwzqStDU
	uXrFlYgqUCD1j0sNP++hIMbQZw68Ia8Bn2H34eSC4jSOXhg27lj2x6/Ox7GA0ePPZK3EkvMoXEjuq
	2KZ+mg1+q1IseozqFNG/OY5x0fYQdEq0/PMtjsKu/By6FnJRI+EaMyKmFhTrtFwaiLCYo/ybd6nJF
	vq6ioRhQK6/+xTDeywG/WhUGEu0OnqBDcqykO5LKBjOzp/rlb3/63kv5AFvNggbJ1vqdzPAP9uMr7
	wuBMR1v6flDx+Wlfqw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBdx-0000000AlZC-2zNY;
	Fri, 06 Feb 2026 02:32:25 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBdv-0000000AlYt-0NFb
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 02:32:24 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso928422a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 18:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345142; x=1770949942; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTv5aR1WBOedsI7siHmth1ku2vaQ77x2+ptDw28qK8s=;
        b=lmkhXEXNL1tceEOUmBbz7OC9RyfE/pbvOro1jVSrFVydSwT9XavdOQzpkrHcJPbD+M
         YhOIgCUsCMYwfPX9n/toEvV1lfnTiZCcERoiWZgzx0FSLvI3kXz211pkLinYeAv9E9RM
         bFiU+VsJkRvqQpFTvk05FA+RC5ArmBwkaEYUZjJEm7SNz3F5p/MmowMYj6rgWIeLT3Y/
         /zO03A2I/OB0IJyeskPnuQrvfd23h23eyZpyQVzx0+4bj/7mn871+WVy6hH6qN05EPS0
         Er1rdp0r+F4OE1AgJfSgPeZbXf9Ci3LSn+mCrGx6yFLooz60Ey52Wd2I+l5ADS0DFIBi
         Zmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345142; x=1770949942;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTv5aR1WBOedsI7siHmth1ku2vaQ77x2+ptDw28qK8s=;
        b=BnTSL22dZf79xQUfC0gl2256OsPg8Pi962keeYYH/+/H5QsblJO30qmfg4gEWhVqfs
         2l2AIAzq3nbvndcEH+uKn2tkyMLJ8ByzMQlTp+7I9Ffv2S8Jm8RdpejiQseTgicE6B9X
         pnl+Debz+4GNvGuEI+f67bFje+EU5yCBgIF5kdtDa+hRTAE6DDckdBrP4WgDziet5j7Z
         N9vBVmm4F6Nb7sulbF6XQ9MaI3EcURQtO2mFPQivZXECof1Tdwpc5NlEwvVNleaolb+j
         zrvJDd/nrPstlN+35E31KxnMYcde5KbD926aDNaQym1viSSsLXSOkRXvHCxgsZbLdVkY
         4tRw==
X-Forwarded-Encrypted: i=1; AJvYcCUSASAHlN69ASnyFEQJUT1u3S3yXdd1CQBgZa7WezuH9e9pysd+M7UukDEZ8QG/YCbFVwRirF2FNLeoZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaeTVWAHZDaw1fdywfBwHplKOJ7nzgTcT6yyIyixgDWvC8IZxg
	WUo+K42nS7r5tIfDol+6nlkEYPpsMRANm9rVpzfDXXLo44lM294EuQSKSPtwo6heTt7blotw8Wx
	PyUj3P3OYsA==
X-Gm-Gg: AZuq6aJ4FWlKKXBfgqDHD4+7VlemRl15LWXZyFDI+jjRXOrOjX3l8uB5PaLNRDsPgF3
	opwo/hDKVlvOZLdsiqMysDYoMlDEnR0Lg85Sq8g9BU+NPZOFAKrX3Arg5Ms/vzQNXzoZPZZ/7LJ
	IUmgXabHo1/v5OO5Ok8H1dJ19UgAJS/R1Js07Zjh4Z5NUt8KWx12k7zH3zhiukpntUKTtM6gB8F
	mUIsZIfNVTXfr08DL2w6TqTc+K6i6bAdAX7A3CcJxmplbbaBNR7QNVE/AOR8XzkMwYRYeuVIpcu
	qGtGAtddJwb9hiJk2KQ274tW/F1D+VFM0IsuEJe2Y+xbKsjPO+EOMfHN3+Kzz/ZGkt35UZayRTJ
	zpG3+nnBBAduFM7uqZjjXVN0tAyHJgLknhJrh9gVh/Oq+4EAQnI+1aq5IcTwbsmkUwOHyYRZn5C
	HIE5S9iuWFcNPrnTh55XxW1pzETmkmxvCed2BG959wrxOizpv+qWbM+CAqhFPXLDXQga9VAe5y3
	Ey8Sx3nTATELRahf80=
X-Received: by 2002:a17:90b:1e08:b0:34a:b1ea:664e with SMTP id 98e67ed59e1d1-354b3c8c50fmr1174536a91.15.1770345141658;
        Thu, 05 Feb 2026 18:32:21 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 0/3] regulator: spacemit-p1: Support board power tree
 via DT properties
Date: Fri, 06 Feb 2026 10:32:01 +0800
Message-Id: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKFShWkC/23PzU7EIBQF4FdpWIuhl/+ufA/jAujFsphphdpoJ
 n1373QW6mSWh/CdAxfWsBZsbOgurOJWWpnPFNRTx9IUzu/Iy0iZgQAjegDelpDwVFa+9Dyg9gY
 zOqczI7FUzOXraHt9u+WKH59Uut4O2RLWNFHl0PVaxVFlCyKhFkaP2kXv3Igug5UgbFRKW8Brb
 wwNeZpPNDt0ujcKvdZEJLuuTKWtc/0+vrD1x8zD1249F1wKHxFsjjn7l1paamuoz9R9VG3wl6v
 /HIhDciYKY7yK4QGXvxzEHZfEgyMohbZ0447v+/4D+GvG840BAAA=
X-Change-ID: 20260122-spacemit-p1-ae596efe885f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_183223_257349_1C5FF5DA 
X-CRM114-Status: UNSURE (   9.40  )
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

The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
applied to regulator.git for-next, so is no longer part of this series.

Patch 1, 2 and 3 (previously 2-4) enable flexible power tree
configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
are replaced with explicit devicetree properties. PMIC supply connections
are board-design decisions. Moving this to DT allows supporting varied
topologies without driver modifications.

The supply binding change is an ABI change. The breakage is acceptable:
Yixun Lan checked the DTS tree queued for v6.20 and found no consumers
of the P1/PMIC regulator yet [1]. For the two K1 boards in-tree
(BPI-F3 and Jupiter), initial power settings come from boot firmware and
a probe failure of pmic node "spacemit,p1" has minimal impact.

In v4, the old "vin-supply" property is dropped from the binding
document as the updated driver no longer parses it and there is no
fallback logic. Only the per-rail names ("vin1-supply", "vin2-supply",
...) are supported going forward.

Intermittent dtbs_check warnings are expected while the binding and DTS
changes land through different trees, but will resolve once both are
merged.

Link: https://lore.kernel.org/lkml/20260125110333-GYD71302@gentoo.org/ [1]

Changes in v4:
- Patch 1: Drop "vin-supply" from binding.
- Link to v3: https://lore.kernel.org/r/20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com

Changes in v3:
- Drop Patch 1 of previous series, already applied to regulator.git
    for-next (commit 41399c5d4761).
- Patch 1 (previous 2): Mark "vin-supply" as deprecated to avoid
    cross-tree warnings.
- Patch 2 (previous 3): Describe the ABI change explicitly. Add
    justification.
- Link to v2: https://lore.kernel.org/r/20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com

Changes in v2:
- Patch 2: dt-bindings, remove providers from the example dts.
- Patch 4: Added the pmic supply properties for K1 Milkv Jupiter.
           Updated the commit message accordingly.
- Link to v1: https://lore.kernel.org/r/20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (3):
      dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      regulator: spacemit-p1: Update supply names
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 +++++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 12 +++++-
 drivers/regulator/spacemit-p1.c                    | 25 ++++++-----
 4 files changed, 81 insertions(+), 17 deletions(-)
---
base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
change-id: 20260122-spacemit-p1-ae596efe885f
prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
