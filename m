Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE028C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILSODEqmDZr6NAedSufjRNn22VQAKTEogOHmI6tBqSI=; b=hUC+mNPycnOcRs
	GJlnR7oTjN5ITHETIVWKBP89Oaxu0zMHJAmlCY0UfYb1IjbmITk27smmjypPTocCPo4gf2rHHGUM/
	8GXMp/RffexR3zm0o2qCXBQkv/uXiuopQJAzIp2zMN/U9geszoDt7K6BXfh361DHNF7IDnLLPt7TX
	xDRdDRUC0x4lSP6BDKOxM2x+TZNUju5ZGZ92eNeQNu8qfB10y223v3tCZEg2of2/MuodkznWVLtDW
	0IN5KVHJDSq76qvyMN0QdjJjZvBU2QS/Pnzf078sxOf+HKiLHMGCnNLNY5ZO8TrRcu2eXhSQW3FJ8
	jv54/VWZhbg2w6nSvZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXcM-00000003F45-1Xao;
	Tue, 04 Jun 2024 17:06:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXcJ-00000003F36-1QzS
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 17:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 979396129B;
	Tue,  4 Jun 2024 17:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29427C2BBFC;
	Tue,  4 Jun 2024 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717520794;
	bh=tUBl/sGlfXdb3mfB5sq1boTwBro77b8hrFoMIHiFHAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WyxXfWtuHQltY7Xz1Wn0BdmlNCBdh+qCbBJhLPTyY7aFsljjtCGs2psPeNyTcDWS9
	 FNNnecaiXxl0W8pro08xWEFCXy11vz3aByIjYZiQtCi3OyctiXcnb6Tlp1CIdxbqpU
	 h0kS6PLrQFLSDIqraxZr4me42JwQNew6QjtQ1y82IiOaOENmKgqJRAGNAfZJPZst2v
	 oc43+S6G0pUwIis4rd88gWHLJEkabc+LfkNcYaj4XI54mloqh+VJCIseQBQHCd0VoB
	 fnTeB1Oq36tLG1Xjre/JqopFSawco6DJAXUIzydgh7qfoJJ709yCxWezlYvy7vB0Tp
	 cJ75sB8TQeOUw==
From: Conor Dooley <conor@kernel.org>
To: kernel@esmil.dk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	aou@eecs.berkeley.edu,
	duwe@suse.de,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	heinrich.schuchardt@canonical.com,
	paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: Update flash partition layout
Date: Tue,  4 Jun 2024 18:06:22 +0100
Message-ID: <20240604-exes-reuse-4e71199a2aab@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603150759.9643-1-matthias.bgg@kernel.org>
References: <20240603150759.9643-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=369; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4+UQ1S3fvbCY3fO8QuWvBZzXb5ymXFVsbruVFqi2CM8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnxnn1nlnScPrf25LrpGbkva644ms687fpzWm/XnNDpW b/WVmiodpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiJ94x/K/sPeSbsedIWVTu KzWufO7GKdv+i8zkesLEK/OgpX9jqiDDX7nCSA0ep+6t0e8jJue+2q4dejHhy2xLe7dQhhtyb0q EOAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_100635_645268_95D1235A 
X-CRM114-Status: UNSURE (   5.62  )
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

On Mon, 03 Jun 2024 17:07:55 +0200, matthias.bgg@kernel.org wrote:
> Up to now, the describe flash partition layout has some gaps.
> Use the whole flash chip by getting rid of the gaps.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: Update flash partition layout
      https://git.kernel.org/conor/c/1dc5f8f6ea73

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
