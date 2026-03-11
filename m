Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6E112580C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dGLP2BOcxrdw82qEEwgONhEwuSS5RDJ0ohWQfdGQr4o=; b=5DQMo3ayfJqZa8
	4SkKApU4me+yLbUjtLozeKtbl/2oeFjxImTwQ2DoXpivD2Cdno+jVUD27pjzpXD3H4ag8ZHXSx9fj
	WgzKf8muI+L1dvlKsBtUNnYBi/vRMKk85B/LJNyhkyDescGpCz1nwbJAF3bFQLyypJ04+VF7l+Ibp
	NBZ0P/zULHD0s2uApoKOuJO5IxiTunQEcfD8EvrbNvJGZnXyy63Qa7zhziNq6HkNDIGpTouC+QJXf
	5Y74idzufIVeKGKPhAckXI8tfR2l6ItRuMz35dL3ZQPOg4MvYjtdyCANYKKqEBr2NIPnqyQHCHOEu
	JqVye1+f5iLMGBLJcasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jan-0000000BdiE-1rlo;
	Wed, 11 Mar 2026 13:27:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jal-0000000BdhN-3CpC
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 13:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F053060122;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8804CC19425;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235634;
	bh=ePHchjnhwuY+HtMvCqWbW0nK976smbTfakDyyaKGCPs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Z7gFBIjdNSd1aqIcHBLavydrtoiHR5ES3RMnA9LDeTgyuY/3Sias+XwB6WSXfVDEE
	 vqbLm9tLiAivqHg+LckJ/z0o51eRnSuaw8NnGBr9hU5+GINdQ0bAovOLFUkgbW6s0q
	 RttJVn3oiwTtybLmsYV1hUDO+M1uCr/IvxXsgLvdEYfejrMUv3z3ANg8E2xXATCWE5
	 i0bDMhCiRoJxf8eBUVSp3yDxZjWPqK5vJ/bhpY/NxHecf9Q7bMntiAFR8y/GIlFRv7
	 el1mtmGM04A9nwQuReRMIExghnNhbgy6vFb79rIw4DSF4Ibu3mw4C/wtRhkoeQbuzv
	 yMwAoqrnsDZXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795591062875;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v7 0/3] riscv: Use GCR.U timer device as clocksource
Date: Wed, 11 Mar 2026 14:26:54 +0100
Message-Id: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ5tsWkC/23NQQ7CIBCF4asY1mJgUhBceQ/josJgZ1ExUImm6
 d2ldWFiXf4vmW9GljERZnbYjCxhoUzxVmO/3TDXtbcrcvK1GQhQooGGJ8qu8IF65H1PkSsNBkV
 wrWkDq1f3hIGei3g61+4oDzG9lgelmdePpeTaKg0X3F2EC2ABvNbHbkB3TfFx37nYs9kr6mvsp
 VwbqhoWvQwGVOsV/jP01zBCrw1dDfBBoAFprTW/xjRNb1bYGfI6AQAA
X-Change-ID: 20250424-riscv-time-mmio-5628e0fca8af
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773235633; l=2879;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=ePHchjnhwuY+HtMvCqWbW0nK976smbTfakDyyaKGCPs=;
 b=fkCkl0GxzOWg/0LN7Yq8FbQepOoJ8On8qs/X3czJQ4tyW3a9cG+KEyiZo6KHMeEh5eEM7PwsL
 2J/cOJRQcL5CyvNAcMBQMDgs4QuKm3cVf0H3TDMqkAN5/T01YSZrBmK
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds bindings for the GCR.U timer device and corresponding
driver support. Accessing the memory mapped shadow of the mtime register
in the GCR.U region should be faster
than trapping to M mode each time the timer needs to be read.
The timer device does not implement any interrupts, therefore the
timer-riscv clockevent implementation should suffice.

We tested the patchset both on QEMU and the Boston board with the P8700 bitfile:
- Coremark and timer kselftests on QEMU emulating an 8 core CPU
- Coremark and timer kselftests on the Boston board with a single core CPU.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
Changes in v7:
- Replace the previous implementation with a new timer driver for mips,p8700-gcru
- Add a patch for 64bit reads for timer mmio
- Link to v6: https://lore.kernel.org/r/20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com

Changes in v6:
- Rename mti,gcru to mips,p8700-gcru
- Link to v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com

Changes in v5:
- Fixed build issues on 32-bit RISC-V and sparse warnings
- Remove clint_time_val and clint.h, replace with riscv_time_val
- Depend on RISCV_TIMER in Kconfig

Changes in v4:
- Remove "select" from mti,gcru.yaml.
- Refactor the driver to use function pointers instead of static keys.

Previous versions:
v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/
v4: https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com
v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com
v6: https://lore.kernel.org/r/20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com

---
Aleksa Paunovic (3):
      dt-bindings: timer: mips,p8700-gcru
      riscv: clocksource: Add readq options to clocksource mmio
      riscv: clocksource: Add p8700-gcru driver

 .../devicetree/bindings/timer/mips,p8700-gcru.yaml | 38 ++++++++++++++++++
 drivers/clocksource/Kconfig                        |  9 +++++
 drivers/clocksource/Makefile                       |  1 +
 drivers/clocksource/mmio.c                         | 14 +++++++
 drivers/clocksource/timer-p8700.c                  | 45 ++++++++++++++++++++++
 include/linux/clocksource.h                        |  4 ++
 6 files changed, 111 insertions(+)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20250424-riscv-time-mmio-5628e0fca8af

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
