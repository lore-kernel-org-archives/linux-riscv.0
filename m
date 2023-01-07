Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8F1C54EBC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZFmbFgTO1W0R1kIA/afsi6AqLbf9j84RUi3r2WfVkM=; b=B+8VECWzTHkaO5
	UsqQCzRQv9O4lGi654AWeUa+lJAKzMZSm0l1sXnrFlKjAz8bJqaTLEcRpTX8s29zoJ2z+yGe+sJNp
	eP3wYgjrln94Jy2qImxOZDiWV9M6x6ozX2V8wNhGb03r9eKQwAOK5Gz9eKQW1aRmQlJvD6MO6TrQF
	x3FivZheAlmB4hPS4U8penv2x+BTkTnFDAb+oISGaqg2gPRiI5pwQYc4kk7e86rVR9AhLd4jYbH9t
	Pb2prIKMd4BTuXSECiieZsXzgH43lgSg5o7I55FenWxJkYCnOMJXCK0RwpW06DaIfvFJDGyQKELQg
	+082GqKMLyt2RLCWhT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEF0o-008BVU-Ay; Sat, 07 Jan 2023 19:37:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEF0a-008BTR-2R
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 19:37:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05B06B802C4;
	Sat,  7 Jan 2023 19:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EB6C433D2;
	Sat,  7 Jan 2023 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673120250;
	bh=fVL00j/8O9tGd6A6KSF3mGxZ0GZgukS1psA3N+BQmSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HdZIjsunrrX2YsmSmKN2PzwzYp31NXEV71E74pIpapd+sfdRVkzCIujqdrg0k9iNP
	 8YsTeRM5K4RDblkRTP3XiMO7CGP2ltPzYDnt3u44oyNH3waIb+yakeo9bh8Iu9rGPe
	 +oyLYHZuH0QWyn8KjdtjZ6ARx1CZ1oOz1z/7rwPgXP5qdQOvyU54q3z9tlCyP1hBLT
	 tLcKaIMKnJHr32pRyUVptUeep1tHHW51dOM0BVls2b+1lsLCmpnJXW2LQMvyZoFC5A
	 OtmSUp/grmbgtqrkxh5Fru0Aoj2D5mSS5F2ir+2ArS7BoNjH2TZuJgG5+aB5JLqseg
	 /S/QWI/wOfgqw==
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	robh+dt@kernel.org,
	palmer@dabbelt.com,
	krzysztof.kozlowski+dt@linaro.org,
	zong.li@sifive.com,
	linux-kernel@lists.codethink.co.uk,
	sudip.mukherjee@codethink.co.uk,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH] riscv: dts: fu740: fix size of pcie 32bit memory
Date: Sat,  7 Jan 2023 19:37:07 +0000
Message-Id: <167311996687.855922.17515622188982373442.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
References: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dxSZXyG8JNR1EB7MnPTNY7y7g+e2wmkJ7/30kO6IgCY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk7T95brxqyfn6z3mHjny2Ob5Pk1A2m1z1b1tBQXhKndbsp Ts+to5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZ9oOR4cKyx5P5njovfKj92PGpiE rK1vUzL/7c4LnvRtz+t/Lfig4z/K9du7J/x5KGp7WPBEOvmB17sNYl4F/1Ib61BvJ7fMPnlLEDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_113736_395331_96764FF8 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, 06 Jan 2023 13:44:56 +0000, Ben Dooks wrote:
> The 32-bit memory resource is needed for non-prefetchable memory
> allocations on the PCIe bus, however with some cards (such as the
> SM768) the system fails to allocate memory from this.
> 
> Checking the allocation against the datasheet, it looks like there
> has been a mis-calcualation of the resource for the first memory
> region (0x0060090000..0x0070ffffff) which in the data-sheet for
> the fu740 (v1p2) is from 0x0060000000..0x007fffffff. Changing
> this to allocate from 0x0060090000..0x007fffffff fixes the probing
> issues.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: fu740: fix size of pcie 32bit memory
	https://git.kernel.org/conor/c/43d5f5d63699724d47f0d9e0eae516a260d232b4

I checked the numbers and they look correct per the v1p2 doc.
I added a T-b from IRC for Ron, added the cc: stable and fixed the
fixes tag while I was at it.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
