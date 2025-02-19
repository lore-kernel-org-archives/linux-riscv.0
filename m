Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ED6C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 18:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvfLTrIdMtOxQeguH45fI6o2SgoAVV4QMOPgMNIw6BQ=; b=TnP38KTAngU0j1
	NQJ3kda11FyKT4GW82TYsQUBepBtl8Lcxg9IieThewxCXvrb1WWIPEQlalShAzp28CSO760kUPy3Z
	Bnj8zUL1RKgkw8SRahjtcD943SEsNVzzG9KiC1RMjIRTpw/ubW5h3ofKhqqI1uvqCnr1JyoGjOIq9
	9rHejtbBbmLumqw7ULJj/JwzvjKO0ge1zqL9CyKe94shuc0FOonLG8uQEtv3dvlW9cNfcKyUcbmEC
	gy8D1R97dkcGjgkD4ETSqUmeD6dvSOVC9TbAjszdkmRkdaxYCoLTP3refPT8aFyVfEzcydZ/ZGFHW
	hLtCIzRRaZk+8zYtzeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkp0U-0000000EQHQ-0xwp;
	Wed, 19 Feb 2025 18:41:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tko3G-0000000E8sk-3UUx
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 17:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C36925C579F;
	Wed, 19 Feb 2025 17:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0149EC4CED1;
	Wed, 19 Feb 2025 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739986801;
	bh=BrOiPMswomWJ6XqsINjW8va56UxLttek/R0SaLkDJy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JFojkRAE3PsCM1Zdl4floaeqDvn+dqG2ftOOM+qWurxvOO9Kb207VzPB/oAq0bUXg
	 ykrLHwMp3h577PaGrXlx23VYDkyiFo38Y/hHYbJzCPp3jMoHV76RcS0cVUnkHxWoua
	 LI/Q7UanOvy8XrQsn6hKi1Rh6Omr5fFwlpXZDLB8CL0RRBHrrxABkHne3Qlil6v69U
	 I9ZP4LHo4Dx1x0FsPzmPBIrwuc7UmmPxaAAUdJ6sKgn/D+Xi1/0za595fHdBpghE2X
	 7k1J7LXnS8YoBB2LuUB626t7i72b32eJq/CPPQrOLtS0SutmYrd8+qOpBAo3AA6+sM
	 Qk/F1Sm4FEmZg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: remove non-existent dac from jh7110
Date: Wed, 19 Feb 2025 17:39:54 +0000
Message-ID: <20250219-uranium-agony-58a183616687@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213-tidy-dollop-cbfc8fc7dc91@spud>
References: <20250213-tidy-dollop-cbfc8fc7dc91@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=571; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EfQa5Cbf8E10CaCu8nORwnfQGYXOH47Zlq27WaTHLZg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOnbxLOl/5nvOrF26fbzqmfuL13IOn2/9IpvV9uuO9rJ7 J655tnqox2lLAxiHAyyYoosibf7WqTW/3HZ4dzzFmYOKxPIEAYuTgGYCPsURoZp3d2ZbyYq/dM8 lTBBaf2mWSe/Kb1eLmu2Unx7dd5lk96zjAyNrleVpqa8d81cZ7JXmH/l0q7Ib1LWR41iNRznKR0 /b84HAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_094002_929302_F8F9E8E9 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, 13 Feb 2025 20:03:52 +0000, Conor Dooley wrote:
> The jh7110 boards do not have a Rohm DAC on them as far as I
> can tell, and they certainly do not have a dh2228fv, as this device does
> not actually exist! Remove the dac nodes from the devicetrees as it is
> not acceptable to pretend to have a device on a board in order to bind
> the spidev driver in Linux.
> 
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: remove non-existent dac from jh7110
      https://git.kernel.org/conor/c/4bdea6e33946

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
