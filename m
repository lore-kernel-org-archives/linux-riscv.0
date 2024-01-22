Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4C3C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKUI2+ucUMYUUOqPN2AqRV/1GrCR2ftoU/2sw2pusrQ=; b=H934+/UD4gccXl
	WSbGPmSrcV6fba3OGn4tcx4rL2GfdMwUdehFPBNxj+rDy3oztsaaWoKhlp9ozFxGkPpbv0YArqvcc
	0VehSH6xDlJSNCVWVgkno8SGv3rgHXtW5zgz0SsgBcCWT3fqwx9P6E3tyqVQ83RytrTlLiK8zXxL0
	FOXRgBPi3nEkLD6gaL/2M9kXmm1sl47BsDeIQR6DNjj7Aj7fEncDD4265KUvrfTWYIgKBcy9mEfZw
	U/IxkOXRcs7WChoWiaaLge3Bc+ltS8BFpqwcnUo6xHdzgNMB0fhfyK7cDB6GZKC4356ai2xG+MvTJ
	o1sVFA/AETYYPYaEBnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxPG-00D2ZC-1G;
	Mon, 22 Jan 2024 16:44:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxPD-00D2Xh-1H
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 16:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A4C6CE2B76;
	Mon, 22 Jan 2024 16:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71659C433C7;
	Mon, 22 Jan 2024 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705941852;
	bh=TW/AN33h2oTcesoDKGns8E03o0QAbOXHGZZP55YuaO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VjVar1uFmKpt5+lIXqzXknpmFH8UWaIxF+e+ahlZpm1bGIckUNJl0dMaFjBz2Bpja
	 E5jM8xEUnRGR7G4jxUUQBVwJM1lqHZhN+uKYBdfnu8z6ls7Yw3oAiX8Z376C6zoo3v
	 +OoSCMAV4aN52a31JIrnN65xfvarfznlkneqc52XAbxGtJ5+/m3pcqwZvOgBKWEdFE
	 9nniraj69VpqFgc9RURQPmAv3ER7/7dp5zyhiFPL1hm770sKaLhpkmzrNU7ON1Y40S
	 D9MooXFwHdpMuN2juxkmZY/uE2LlTgJ+DJac5JarpNJxJHmMsXQlva0mCPLFI5gC23
	 PQ4byDDeIqdSg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt
Date: Mon, 22 Jan 2024 16:43:49 +0000
Message-ID: <20240122-subtitle-luminance-517a0bd92582@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <607c5ba8b95b1a11b6dc532223e9d7abcc2c20e4.1705935812.git.geert+renesas@glider.be>
References: <607c5ba8b95b1a11b6dc532223e9d7abcc2c20e4.1705935812.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=350; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UjseNzGXO9922yEWb8pAmj23ZPXNexQeybrnoHVRzPY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrZrtUf2fedNDmxsQPeSryXUnnvmz826lwWN9nFvcxm bVXPJzXdZSwMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAifG8YfvS4myrGbamXWM3D 99bgmRej4HqLvAPfP23u3cPnc+otIyPDEtf9IbuLK3aevfUgb7H73pQ+H4tGrbLgCkuz0sU/+Qw 5AQ==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_084415_610004_B20AFA3E 
X-CRM114-Status: UNSURE (   5.19  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 22 Jan 2024 16:04:14 +0100, Geert Uytterhoeven wrote:
> The symbol's prompt should be a one-line description, instead of just
> duplicating the symbol name.
> 
> 

Applied to riscv-soc-fixes, thanks!

[1/1] soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt
      https://git.kernel.org/conor/c/6dd9a236042e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
