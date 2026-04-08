Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BE810F995A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcOLgtPPX6F4/LJUnMaR/zG0k2GX+Z8YiJvRRXLCb9c=; b=T+BqFgvr83noCO
	rA36sHPm3S8kyxjmk0xf2dVRm6HJ1eISxlU6xOu+SwCK9RuI0YAV+FQxiWLoJad6+yiQhPnoUIg7J
	ByGYwowIpIZF0o7W1oprAScPGzSK6E1ihep0Iem0gmdLAEh2FjqNpImAy+L2dnO6xVbpMJFBPXWm2
	bq0+ObLlJlTwc8g4M8g/6uuyaxHKRQMgCYzQKIqzfP4H+bnvSGmp6oK0/12cab+P3sVrKT4UBgNOh
	yG6r9RJ6A290jciJJL5dcPGsx6jhU4OOr1T/yY//OUAaDIdgve99msZjaYPNVYd3R2x6FQKIwedPB
	DCozkcvbqYxNQLyNex9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWKj-000000099Q0-0pGZ;
	Wed, 08 Apr 2026 17:04:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWKi-000000099Pu-0aXb
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 17:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17E846011F;
	Wed,  8 Apr 2026 17:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72002C19421;
	Wed,  8 Apr 2026 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775667890;
	bh=IWPyGXQ4SlgESVVUSmf5ONItQUVsirGO2BNtqolC4Lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4ruKw48hzOAn3J0lNic5exiEZbi0Yv1B2ax/wflr2Y8JUeGTLYnrCaWyIs1Ya2wh
	 ziNPIFdjLQddkE4q20QNXvd59rC6YIsGT4H+qghRSEtP5rpT3iy1S5wqsa8jiOQfad
	 KYBI8XIomHuJrfIrVkpJXSK861V4YIRfUIiYvkXGvF3ZiBdK+uOpnAODNAMltxM1Dv
	 2nL1QLRETDNQFRV5KoZuSNp3gBRWQR3N5MbM2ZjKClo2UR86Xj1RmxLhImmE+toEAJ
	 M4vqisl1iDHX3RRRzaFYX8ZERsUHkKGCL16D8nkvbZVLAPsB4b+7REgF1vLWCrk3QY
	 k4W/eDI5n1EJQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pic64gx semantic conflict "fixes"
Date: Wed,  8 Apr 2026 18:04:40 +0100
Message-ID: <20260408-overwrite-expiring-82891c334a1a@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0+n/rYs9NffjR/pk7EiVoWwYTXJXJ3Bv/k/254MwoAc=; b=kA0DAAoWeLQxh6CCYtIByyZiAGnWiqehommUTcwAuRtQ1e3JS0/OPIs1P87tls5H8PNuUzifi 4h1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmnWiqcACgkQeLQxh6CCYtIEdwD/f0Hv v45MmwChbeC0HldbL0TRUQQ8QrsK39RDZTGnHf4BAIpiWtfht40dZaZN7rhkY7duOVxdsL1GrcF kD3XoUjIP
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 07 Apr 2026 16:36:22 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Paul Walmsley <pjw@kernel.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Alexandre Ghiti <alex@ghiti.fr>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] riscv: dts: microchip: add tsu clock to macb on pic64gx
      https://git.kernel.org/conor/c/89991efc78d7
[2/3] riscv: dts: microchip: update pic64gx gpio interrupts to better match the SoC
      https://git.kernel.org/conor/c/53c013c3b27b
[3/3] riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
      https://git.kernel.org/conor/c/ae488e2669f3

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
