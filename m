Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71661CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sg9Lw1BUfwUfZYNOisVINw2DhcCGohftEG9TsPpiCtU=; b=Hx6Ssd0jEbvWg4
	/5QpOh9zjt65LxbBh7GzjxIIHMgSpVPIOEUCv1ayXtFAVdqOt+yJASkrsu6GpkdIKxYUAhVwn4VOM
	deMTEypVVS1jAyyDx5HeiMiDUUWm62Y9MgrfhgEuzHz2B4ddzBtTQTpMIkQDgjgxYF+amivuuL5uu
	7Z5dOkQD5Z8tuImjow144OlJLcNFtEBo2TPUUBnl1FKo6RlyVecl9YxYqpJ8OWlFRlwdlb2Ks5IFv
	D9f6EAToy0D2r27wwOMFH2wlvjFQeYzBgqtRPAE/uceBY58w/jIhb6EcBUMRPNMT8Gs5sOJCmStX9
	AwqbUzvMpeyW+63RKyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6jf-0000000D5De-30ht;
	Wed, 13 Aug 2025 08:21:27 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6gC-0000000D49Q-33Es
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755073067; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XA36Ve/0/S62HqzFuuX6quZURG5COE8P/83tYLKioDeEMzH/n5lM947IZotfAfg0N1OmtAEhLmyp3Df/nE9VYp4lJW0yURJVSR8Og/uE8o4u+SwAmiQwYB0EgbA3VX5aBsilzRIXkwsHSDIzo96E7TmGFCyoRXudtd10cvXECm0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755073067; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gEWMFY8tHqWtDUaEv22ptG9h5sOHmM29oTvYBwnxA9I=; 
	b=OLZPWZaOL3+7zjgNy7nTle77QKMoSsPgPpas596L8cXvMbMlpZ/nzSOiYVh2sf3/UO/QqArWitxNRQn5muY9yHh/+90fINqR7UzklomKArp0Joua1AzbTJ2I4GMGteNDKfShV1y3UT/0gk8XwKmES+disQLjpz6AV0W5i6FATb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755073067;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gEWMFY8tHqWtDUaEv22ptG9h5sOHmM29oTvYBwnxA9I=;
	b=kTZc51Luw9RUNQ97EftVX1tS6gYNhJMMIplio+lMxJOMvmkoAQK6gvd5xWRNK3Km
	lk5HMv4p6+/eBdBYgTGLscszl8Hy2eOnlOJM+aG2TvHTL2GdDbLCL71AktgJn6qfMUg
	Ki6QdPfChr2m94Jhb/9zfOaxRGT0tL1vADrj7diXNfh/QvAWLKAGWAkw8gDGnQGyQQr
	qSTZe9gMfkZhgj5uRIxDNhcTCW9saYen6+YBLji3/Vz1pelUww5IOhCkxNOxUmiXOjr
	UNfSAo8h+SX5thyu9NxOk01xZZzxonn7QsSGS3K1l3lWIc1Mlav1avlSU6w5Ovs3PTX
	YgehTpbTYg==
Received: by mx.zohomail.com with SMTPS id 1755073065363841.0786632079869;
	Wed, 13 Aug 2025 01:17:45 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] dt-bindings: reset: thead,th1520-reset: add more VOSYS resets
Date: Wed, 13 Aug 2025 16:17:15 +0800
Message-ID: <20250813081716.2181843-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813081716.2181843-1-uwu@icenowy.me>
References: <20250813081716.2181843-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_011752_821899_37E7E186 
X-CRM114-Status: UNSURE (   7.67  )
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

VOSYS contains more resets for a display pipeline, includes ones for the
display controller (called DPU in the manual), the HDMI controller and 2
MIPI DSI controllers.

Allocate IDs for these resets in the dt binding header file.

Now all peripheral related VOSYS reset controls are here, only the bus
matrix / IOPMP ones are missing, which shouldn't be messed with.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 include/dt-bindings/reset/thead,th1520-reset.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-bindings/reset/thead,th1520-reset.h
index 00459f1604897..ee799286c1754 100644
--- a/include/dt-bindings/reset/thead,th1520-reset.h
+++ b/include/dt-bindings/reset/thead,th1520-reset.h
@@ -12,5 +12,12 @@
 #define TH1520_RESET_ID_NPU		2
 #define TH1520_RESET_ID_WDT0		3
 #define TH1520_RESET_ID_WDT1		4
+#define TH1520_RESET_ID_DPU_AHB		5
+#define TH1520_RESET_ID_DPU_AXI		6
+#define TH1520_RESET_ID_DPU_CORE	7
+#define TH1520_RESET_ID_DSI0_APB	8
+#define TH1520_RESET_ID_DSI1_APB	9
+#define TH1520_RESET_ID_HDMI		10
+#define TH1520_RESET_ID_HDMI_APB	11
 
 #endif /* _DT_BINDINGS_TH1520_RESET_H */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
