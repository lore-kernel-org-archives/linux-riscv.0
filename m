Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE523D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lAq+QduPtl2NzAgjlzcKw36EGuv9/gA40dKPxTlfrcE=; b=m1xLEguwBzDlYO
	986dq04RrBZIx9M5h8aJDuAwoYivWn0nU1lMWVUoYa2O72M5VqqOnH93lxbtw7ubO8Psh/G+XuOMO
	6+UnjAgXhlMjzeLKrPKxr9Fwr1g9S6yv4B0wXLbYsWUnvbyEYa7N/fGQ7h3Cz3DlbDoNL5iyTH1ii
	86GIYAFlabbfcSZBo6aB2bbi7KZFBMPL6ToirTPdEii/7k3JEWQIXjBa8YGsNoq5nBGx9FArzCJXd
	J9fRdSkcvyz2BQjRElnnZColhZmBNYx615jqY4pDitrmseGjCqAzjST6W3ycUawXX1ocb1lhp0MUZ
	GkEoz2DR4tfTpa/8CkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTjP-00000000F9u-2nRv;
	Sun, 18 Jan 2026 14:26:19 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTjE-00000000F7v-0O9y
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 14:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768746364; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SH/mBlnE9Q83qr6IqlYb4lUWXDGSgxADDTA3VtIxpy3UXKjrysJ3QQBW1UnQ32iamZMRNy2NXPQkBpRHf/3k2X9IzPFz35LQugjKYCrFLC+k8bZGTZJuOy0L3GLI2uG1aw53JjPHdri/OwtiuZgLMrPVmL0Auz58qwNyBk5x3i0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768746364; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cIbPtT78mcjstGf1Y3m9nRtHPOd+0Pk3EGb62HGCGxc=; 
	b=lMYTLm2DpgR8YGJUx8ucI5+tfX1aRxEaNCkLX4aphK0jeD1t8szCFHk+9tZnaE++1xQCoiezpyVZUAl6G73QskeQp549yJKviJQ8XGmohG00lAvsydeW5Bme1vTo7V+2jFiAzfmxBGdy9VqugSmI1zwbVcORGJQ45Lg/ne51Q/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768746363;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=cIbPtT78mcjstGf1Y3m9nRtHPOd+0Pk3EGb62HGCGxc=;
	b=PnRa8N6jIwImc77Ho/PSQk4Pdu9Gvhzh839L234118mnZKxDpQb6g000ViV9b/s7
	bF2bP5HiE0Bb9rrfmTQD78pSLq/Yb68/AsdM3MsfYFVgl9rz6bI314sRlhrASObu3g9
	nBaPp2wURV1UaAR6ctlHjwi+XMTFUZ/pVR/PlJ9w=
Received: by mx.zohomail.com with SMTPS id 1768746360351543.6650268721444;
	Sun, 18 Jan 2026 06:26:00 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 18 Jan 2026 22:25:07 +0800
Subject: [PATCH] riscv: dts: canaan: k230: Add "b" ISA extension
MIME-Version: 1.0
Message-Id: <20260118-k230-ext-b-v1-1-6a63616b11cc@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ML3WwjYwPd1IoS3SRdgxTzVPNkc/NkY4s0JaCGgqLUtMwKsGHRsbW
 1AH1Y7XZcAAAA
X-Change-ID: 20260118-k230-ext-b-0d7e7c77c38f
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768746344; l=1939;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=BvWaQkUJBvXg9RkiY/LFSvINZsVIPdXwcgP3Ppmyk8w=;
 b=IaCH2tmViS4CQfeksoNrNF8X5ZolFJl8pCbzGa8e3HsTadaJpgRxclYLdJgnnYmhhNIwn9QwH
 wePvvUWzNciBZ/b3lmo9ZvgQvXIvszNjnpkzeNHo9kSJ7fWqrEvk24B
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_062608_663476_3449D21B 
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

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update k230.dtsi to conform to this rule. Also synchronize "riscv,isa"
with "riscv,isa-extensions".

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Based on Conor's k230-basic branch and rebased to riscv-dt-for-next.

The commit message and implementation are adapted from Guodong's patch
for adding the "b" ISA extension to multiple dtsi files.
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 5a1bf8a15abe..041c9947a8fa 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -21,9 +21,9 @@ cpu@0 {
 			compatible = "thead,c908", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zfh_zba_zbb_zbc_zbs_zvfh_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihpm_zfh_zba_zbb_zbc_zbs_zvfh_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "zfh", "zba", "zbb", "zbc", "zbs", "zvfh",
 					       "svpbmt";

---
base-commit: 99a8c0e33dbf0117710b7f0c5cd1cb39638235ab
change-id: 20260118-k230-ext-b-0d7e7c77c38f

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
