Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C73FF60FB
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uv/Vd/lDDCeohTpTDuJAzB/kDb8EaCzmc/LLUmJl590=; b=fWgPqfSWG1B0CW
	1ndsxHgtlDAQ/TPMvbiTZy+Dq1qhl0v4Yu7Zcp4bpgqWJA+/ORNjPIVXh+D/m+14JvoQ0+0izrCA2
	1BljRk4gRBMPYRKAadETtRDIQ+ujvS69OgUkk06zqFjolMs4jPF6mwzCEtiP+8Qft9aeg76OGbWNV
	N7SSfiIOcu31TQGwc7OsA6oubA4Fe7V3rYZxNGRtF+AwhbJ+WQ5UJNdWvw4OigyOGvalXtab9BT2T
	Ta/+GvcxbDCFT0nWpklnsmsqwgaGXmL2J+Lq2LDY/B6xDXzWA07+e2aWdeByTspH7mYCC8dyKzhKp
	X3RvJW1dtEpHD8NdPjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WHY-0000000CmID-2dNA;
	Tue, 31 Mar 2026 10:25:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WHW-0000000CmHp-14UV
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 10:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6063403BA;
	Tue, 31 Mar 2026 10:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A17C19423;
	Tue, 31 Mar 2026 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774952709;
	bh=xmjyC8ovGkrmNwtrFLdhkEH1h5K0uYv5eS0Flx7Rrts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtIiybZBckAAPNikznRrqPyk4IcOSE8GTBLK87eKRva9mPmMywxLJ1evTLvVZjwS5
	 gnuJJe3Ns9W4f6ISxthdx+KJVA04HgOfBxtlo7s9JdHbKUfhyFxns9+l4OO9DudwBy
	 E0WLnN+cJtywNIAqI2jEDRLKsJ3lcoInIr+/PkRiD0tmkkpfToq7HH3nlznSPUkp3g
	 bCJUCToLSVSIiiqVMPzWANx42NhUUa/w6jAnDEqUeXhPVUB9f8Thb+9W64pfWo1Q9I
	 Eqlg+i8h/7NdbPfX/m/8rkMiKsYG35x6JcclNX7+sqYGPF5ftbx/8y3U1KAASduL2v
	 M15xncmXSrBOw==
Date: Tue, 31 Mar 2026 12:25:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Guodong Xu <guodong@riscstar.com>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
Message-ID: <20260331-faithful-gentle-fulmar-0b9e96@quoll>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034539.67167-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331034539.67167-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_032510_314050_8DCEE1D5 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, Mar 31, 2026 at 11:45:39AM +0800, Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>
> 
> Document the compatible string for the Deepcomputing fml13v05.
> It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
> Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.
> 
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>

Name feels clsoe to login name and even login name has a '.' in the
middle, so a bit tricky to judge. Please clarify your name.

> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Is the review coming from some internal sysstems or downstream forks? If
so, does the review checks the same things as upstream is expected,
including known identity in DCO?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
