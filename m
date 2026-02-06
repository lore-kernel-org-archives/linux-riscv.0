Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60299EE6B56
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjeC2tLAysZtUEbRIIx0f/PBxGw1F/4cfc5oZ18iXeY=; b=XJIBAy+wNeA7jv
	g97k14+PIuGO4nFe70uZ2XN5HWpSs2RLCj35nysZa/Lpx96DBle+VeYCL0WhDaZavK812t+UcOMLR
	exaQeofm25bFa9EbAcGl/aYvueKF7aKVyNsM5BXrzlfqciub16QG3BHMiA1DrCJM1TMs2IfueWsTz
	lDc06ciPNZvjoocPFQ66tPgj0mJHToWrnia3pnJr94VldZ0yAutRXWO1aQ1MBlSrTtzFtaN6lZZys
	3/tLagASXi78jxH2NTGjCCkasXPUx19jGfpJ79do8pYOw7qGkYrmnfDEj8BKPxUkukcp9tP2j56km
	OD+khcgEu6xcpmrFn3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRu-0000000Bnnc-1NqA;
	Fri, 06 Feb 2026 20:29:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRr-0000000BnmN-0R6j
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 20:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C68B4443A8;
	Fri,  6 Feb 2026 20:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6D3C116C6;
	Fri,  6 Feb 2026 20:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770409741;
	bh=8pY7QweJ/zLHIee24538hoA56yiZWJ4lKCvyynOS0UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uHlEaC9TDCwBzGBltw2w/LJAVFLQmAdI2NNJmKayaEmJQTDafdW/nMLy7mfUP5OUe
	 9hu+jXRaPC2I8y8ZLLQmp6vgSrja9uxQp2uVJEn2Abg2LcOK9AWeosEPfrbXvgdMvJ
	 wGGGYH0k25uCRw/f9zyUm6YPX8BJxfEwpAYClANIQNzmfi65SqZjX+uP6x1X3A0LEd
	 ERbMUkLHtU7w63krQZS+nPcYjsL+VoH4hnfSS/3cjkmSolMbwDr85h4iFHNMroZ5xM
	 BQRUpe+IDXY6jXcHfZAg+tJEc9YyUQo461BSFSeFZHNYKTJ8XuwQWOUzfPcwBA3wSc
	 4bmsoKe5JbJCw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Joshua Yeong <joshua.yeong@starfivetech.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: starfive: fix device node leak in starlink_cache_init()
Date: Fri,  6 Feb 2026 20:28:46 +0000
Message-ID: <20260206-front-jackpot-6d679f8f5232@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260131-starlink-v1-1-30985722d51f@gmail.com>
References: <20260131-starlink-v1-1-30985722d51f@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=465; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rOdFAqm0+imBDwjCHhhYXVxtGgIqRZWuWIeb7e4B4JY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJltfn93vpJ9VXDS3Hz3Rm8eplqBB08cZO9czXzqKySj+ VbtuOHDjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykSIiR4YXoR4HHe5bL6l3T nrInMnXGfLn3dtayva5fCzIfacbreDMyLA6IuumR6Sx68dbm97lcDbaesW//BKz1kX7e1uulbKf BAgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122903_166731_D4070A2C 
X-CRM114-Status: UNSURE (   5.35  )
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

On Sat, 31 Jan 2026 01:13:45 +0800, Felix Gu wrote:
> of_find_matching_node() returns a device_node with refcount incremented.
> 
> Use __free(device_node) attribute to automatically call of_node_put()
> when the variable goes out of scope, preventing the refcount leak.
> 
> 

Applied to riscv-soc-fixes, thanks!

[1/1] cache: starfive: fix device node leak in starlink_cache_init()
      https://git.kernel.org/conor/c/3c85234b979a

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
