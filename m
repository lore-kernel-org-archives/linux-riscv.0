Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075B1CD4F5E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XcRrMLyKuTslimCnKB8VYKShxyoU9gCWQLKa5VsCWc=; b=FkXVbZrcNfIfIo
	cGAOPde09thQfRe390cZlAyCNotxZIggA4wK9Fa9qfMy3ZjO9um0peM2EK4xtA3pQG5reEQXJvz1j
	M6b/fyFUm7n5MklU05HTeiikYP+cciBDCy5CCbJjyNpQE5FSXoVUkHO6iMKvRpMLJ1EQYDBCJp/Ml
	wR3woAAD8HknU0EYZR/yhZpXhH/xaHEetLZ8WUo/mCGKlB3oL3J6oYGEsJS79X4S3McGLtk993c86
	tj6n665yI4DofvjhcIYSV0kH8MuI9Wzcrf/B/OaLNrnENE0A109J/U36lFCluDG3lB8EZ9Amzwfgs
	Vx54p69yRi2OcEZhKPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Pk-00000007QBe-1Yph;
	Thu, 21 May 2026 10:14:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Pj-00000007QBQ-1JcI
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 10:14:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9292060172;
	Thu, 21 May 2026 10:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0AE1F000E9;
	Thu, 21 May 2026 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358442;
	bh=SM4vtZEXgmc6yvSzvUjAsVz/y1Cx3gMRcwV+nh/7Pqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O0cNH7H/8MpT+9E/tLvJBt56Egcay99gyWDs8k9sn1HAl4raVPOTFlBvWW7kAz1q3
	 O8T08Ni+FbaEc2lpK8jfrTRXmJnCw5wo8cnBchCiJc6SfIWkuq9HtwwwjH1c0krEx2
	 lpkBen7h3OZ3g5LYk83K2DIv9aIBhEu2pi8Dp3Ka64wD5rwc2//ZsV779O9AN4a/ct
	 VdCT/5gMdu9z3CvY8k1qWnu1YtKFTNmg0xTRTPQOcj00TqUT71vAwIdT9XhFqdDWGi
	 zgNJfbpgZZ/O2+Pb92qtC3JRnipKNqKS/Vwx58lnBLLxSMZZkfS3DlHbtzTKav+6J6
	 a5Gvhlh8MIQ5w==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dominique Belhachemi <domibel@debian.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: Add StarFive JH7110 SoC support
Date: Thu, 21 May 2026 11:12:52 +0100
Message-ID: <20260521-treble-bootlace-29788b4cd86f@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430035259.3402954-1-domibel@debian.org>
References: <20260430035259.3402954-1-domibel@debian.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=423; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=sDY0f4222fvZ2OSyDnqfomGVXgoz7NfktE9I/5QiHDo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFl8txY/nLN98eWy3F3HbydbvewOCdPf4eP7ouTo1oRvP dlZ0nPcO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRsyEM/4PmRP4UY2jMD795 J24917bIe5IOn+wiJG/+TvjGJHKMbT0jw6Oyg7ubJHcw7Tua03CzgLfcp2lhu+BJnYDl5Y/nBAv N4QEA
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

On Thu, 30 Apr 2026 03:52:59 +0000, Dominique Belhachemi wrote:
> This cache controller is also used on the StarFive JH7110 SoC. It does
> not have the data-uncorrectable ECC quirk that JH7100 has, so only
> QUIRK_NONSTANDARD_CACHE_OPS is set.

Applied to riscv-soc-for-next, thanks!

[1/1] cache: sifive_ccache: Add StarFive JH7110 SoC support
      https://git.kernel.org/conor/c/8e2501e1494c

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
