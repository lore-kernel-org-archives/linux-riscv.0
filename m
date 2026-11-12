Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA802606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bKZzDfQf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IX86yE0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m1BKElI5vzS1HbNRYvG6NG44IUEtHnc1PmIX5hdyHTg=; b=bKZzDfQfOBu/KGY6yM7uL6sMyM
	IVY9XUwIyqU1mY7uevPGCYN7Rt+Ws2TmXVlqI7XDUN6fZ5xtqffF2PncdM3U3vcqAMuR1XxeeeK53
	tyda55RaFFNG9rAcY/o8VcsTiF88DNRCeD7ewnUWA1ZQtnq+80nzu50/KTAHY1ZkL+2/nzg5LMf1o
	XWbUc33371Bif/9WxlP+gVxCzedU7dtVzPNs+jIbPf+Ttl1LDHbq/V4IgMipkSQ27Po8k9HbFD4SR
	5/6WSmACwfKxJhf+s4S8kEMyyc/nlSPmWziSJDkcgAQu1dhAHsTiI5FdnzwKOrfuzzVr4VNLgUVD4
	khJOURiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPkX-000000090a6-2Skd;
	Thu, 12 Nov 2026 08:01:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPkL-000000090Wc-2Cr3
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:01:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA37E63768;
	Thu, 12 Nov 2026 08:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233F11F00A06;
	Thu, 12 Nov 2026 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470484;
	bh=Ho/SJRRXKfR8E8InR6yIipzjTEX73uVp+KDQpwqfDkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IX86yE0iZxcEtAHfeuJL5JpOZ67UmXFn4xmBbABbBa0UsO+e4sJcaDr9iM2WfqGHN
	 o288DfoA0kbfws9DDfgZkNQOVndsS2O40l0a1HdoXRAgwyb67U/6q6nOxVRXh9GI/p
	 0GR9BPeQZ9WCriYLfb7f7Jd644e+U6WvkZjHxk75KuwE/eOawKSvRQIL8Z+qrTPuOD
	 nEhm7jVmQ/hMokN+4rI9924j55yBPxw3sf+LgcaDaYVhFN/hWGOuw0hjEaHKnYHU1Y
	 1EByIWY9rj5y5xt1xKalYhi+KdNX90cjFcHLaV1JuHX7inDwhkBbynOlwxkfgSkE4L
	 U7uXoaJpMPX2Q==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Nov 2026 08:00:56 +0000
Subject: [PATCH v4 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-04-k3-pm-support-v4-1-de3931aa5153@kernel.org>
References: <20261112-04-k3-pm-support-v4-0-de3931aa5153@kernel.org>
In-Reply-To: <20261112-04-k3-pm-support-v4-0-de3931aa5153@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ZGjBATuMj77MYSRucrBFIOVycrvyLdzdato4w2GM7iQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBq9XJFJRHeM+96J1XxoxUDOhiZQ7PxNdW2PQ0Sn
 IJLqlh44QSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCavVyRRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1DuxAAhE9s65q1bXYp1hReThKLBqb8GyA6p3Y7+JDedJPLBUFOdOzfc6ugT
 h2Mylgd3QbT3c3oO4D2rQhfNuVJ2fXyTfHmtug08hhGrt0L9cQjA0399GU2DbOUBKKbLoNw3vaY
 WyxAuVWVILwsARTWT+uXm/kRnNtyVZAPqcEBXjk5lznKtuPlrLX15/mnxwIIb5+WISuEY6in04b
 pQFRfUNcl7mH4F06NpAQ96Z3IzoyaK+JRDVPvyEKzqG390giTDO3KDaH8rkTInT2+DpX4oRsqiW
 W8VRFbgRIK3NvVRIphReMKdJJYopq/vIw4etLrFYek8xMzA/tDaqUl/78AjL360/HPShcll+//F
 u52/F7UL9NV07kMc30ESQ8lbI/jKUy2mK0xSEZJSRunf6CnxkGpQzY9ftmfZYJFRxlcK4OgYoxS
 WOFkfvX4p7xGjLJn/hENvzqFgPA8PNu/BiFO/HRvQGHjCh/n7Ha4erRnCq09INyEt9VBbWqzc3r
 ghBqbSYd6f9frZZUEUb4AIf/NBOBSWzFC4nOTKbAUdGzvs82kmRBwKqYb+cW2+znMFzab2Mwxn1
 Yb1ny/FBX4DhSLCAqL1Z/KMjgxVRdcN3/U3kfUlDXbURuAhv1TNitOW5TpViUtklJjMA64u0b1R
 rhm9+gWVKzgGFmOjpof0ocGEPNhaEI=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
Domain Controller is SoC internal module which is part of APMU (Advanced
Power Management Unit), it is responsible for managing power across multi
power domains, which includes power on/off, isolation, power-on sequence.

The DT documentation for the power domains already exists in file of
spacemit,k1-syscon.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/power/spacemit,k1-power.h | 14 ++++++++++++++
 include/dt-bindings/power/spacemit,k3-power.h | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/dt-bindings/power/spacemit,k1-power.h b/include/dt-bindings/power/spacemit,k1-power.h
new file mode 100644
index 000000000000..41ef540b5c44
--- /dev/null
+++ b/include/dt-bindings/power/spacemit,k1-power.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_SPACEMIT_K1_POWER_H_
+#define _DT_BINDINGS_SPACEMIT_K1_POWER_H_
+
+#define K1_PMDOMAIN_VPU		0
+#define K1_PMDOMAIN_GPU		1
+#define K1_PMDOMAIN_LCD		2
+#define K1_PMDOMAIN_ISP		3
+#define K1_PMDOMAIN_AUDIO	4
+#define K1_PMDOMAIN_GNSS	5
+#define K1_PMDOMAIN_HDMI	6
+
+#endif
diff --git a/include/dt-bindings/power/spacemit,k3-power.h b/include/dt-bindings/power/spacemit,k3-power.h
new file mode 100644
index 000000000000..519fbf946312
--- /dev/null
+++ b/include/dt-bindings/power/spacemit,k3-power.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_SPACEMIT_K3_POWER_H_
+#define _DT_BINDINGS_SPACEMIT_K3_POWER_H_
+
+#define K3_PMDOMAIN_VPU		0
+#define K3_PMDOMAIN_GPU		1
+#define K3_PMDOMAIN_AUDIO	2
+#define K3_PMDOMAIN_LCD0	3
+#define K3_PMDOMAIN_LCD1	4
+
+#endif

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
