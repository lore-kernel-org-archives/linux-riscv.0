Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AD9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D506760C41
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D506760C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAY6njC7VvFblsqTeGsafEhTs5u/z5ENTZsRkbun05E=; b=NbRYYIwJJe5UqJ
	4elAgmz3CwYnCWayHEPZ3RbqBScEhqq9sUrX5v2sdwnhqjoxShpBiefygxQl3W5uAiJVDpmLw1PfW
	hUzAM/rX01uGYOJpGkxBRfGmvguXxBhl8Na2mPQpVLeDcV+xEbIp0R2wPHGeysWeQSiWgd1JPY6wT
	C+iQsM1r32BsWj2QGNig/ir19s38EL2IO1oTUDyoLQ7NxhCL2Rvuzu3uFakCrCcmYB+tO2FVXRK2p
	PDcQT3CvYQ7VSsS+YdJwcmq4i/eZFGE27ykq8VcCsda1kxmpYzMugftM0K7EMmIBMM71KLQHLWeX2
	1GMbOrf7qB7O36xytnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf635-00HVV7-G8; Mon, 25 Oct 2021 19:54:23 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf62m-00HVCI-GJ
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 19:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191644; x=1666727644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCy3IumqXQBouXXEPa6nxFODZXMtRI4XUvf0Po2mZLM=;
 b=TUoIzqF1Z1lWCItDW0fYWWEQ30sCtuWbA0ui9WzKAZMlFApTO3TBMpR8
 x7aOI5Do4aAs9UtMcFb2PeVQYgYjldlr16mN3zM4jVIFInJCF5j9s1BWM
 f1NlvXsPCbNvDiQHp3i2zpt2/MYo3HOCnGi1ues45aCDgjbNb0AJ2seKr
 3QHHp0rnsBXODNsy946h+3a3/HJvCFviUHxvP+lcs/uex4uBHibTcHVfT
 Y3R8n2vAcW3BA+6NlD0Tj6jdvKTGRmgoENPju7gGLTNC2mNiJmYZz30Wk
 98wIRcRsKOyJ0kwE6GD+eiw5C0LzV4dvosY8mgjw6D5ONnKPS9lRE6Jvs g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287682873"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:53:59 +0800
IronPort-SDR: UCQsdv0R9dvtdE6ImVwUW8AOt4ABccCKx/D86dJoU16aR6KHNhxQrtZPRi6IYz40v5fqq4OH3Z
 GbejK1lQBu7WH76YmIAIeAgZlcAMgt/5rJUPKV0Uc9yW5ICW6x8zQP7UsOftE1VQsYiBNcSoA8
 UshxGKhQd0sw/jfFPz9O6WWUbHP0elahYY+oTn6jPT19kp/L7pl7MRUQOF4faLT6Zw5+9y/BN8
 TNLbbnr6r9tkmBqIwAfq7/MXaof+J8Xpaxlij/YjRLkNchmZwVhx64KZn/o3yg3/keEgRMyt3e
 TtW9AJWiTDEV9iamYINRbCvP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:29:30 -0700
IronPort-SDR: aCtzHnd6pbCvl4fpTnR1j83yaKX8pxZjmksZIRBZqTfD7aLv+ZCH3yAu1XSEW8YQ28LglwCBOm
 mfodnMO14DtBzyQzDZYTvPXQRdmYHVFoejY6Cttr2RXGNbo5AkdwXavvz5GDlj4AdinWNw+kJh
 oK2RSfawvyy1SSCPvlPCBOSAGYfnv26uC7fjog1wwy2sygjLKa60GOyAshiYdg/snBVeEU9SPd
 NWMuXmL92f1u9xbbyf2FeHlMIcNRQWAwZqeNuaX1RhiID97nEOWj3hOvQQXTjXLTpW4DxlvVUa
 tQw=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:54:00 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v4 10/11] riscv: dts: fu740: Add pmu node
Date: Mon, 25 Oct 2021 12:53:49 -0700
Message-Id: <20211025195350.242914-11-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195350.242914-1-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125404_685075_796BADC6 
X-CRM114-Status: GOOD (  11.29  )
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

HiFive unmatched supports HPMCounters but does not implement mcountinhibit
or sscof extension. Thus, perf monitoring can be used on the unmatched
board without sampling.

Add the PMU node with compatible string so that Linux perf driver can
utilize this to enable PMU.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index abbb960f90a0..b35b96b58820 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -140,6 +140,9 @@ soc {
 		#size-cells = <2>;
 		compatible = "simple-bus";
 		ranges;
+		pmu {
+			compatible = "riscv,pmu";
+		};
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
 			#address-cells = <0>;
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
