Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCA2FF887E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 02:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EEJ8U1Fx+lKXf82WID6hV1qUlpho/Qzcsg0vevmRcc=; b=xZtI8i1sJNTCjC
	5jRmy9+3dYKKirk+KK1WlW2nnE0zzAqd7AqplBh4sSlc4IIA2OkFxKOZz3UgwU94ttqLK7LGC5dHu
	uwFUCvFxw8t6hENjISLa6FuJXE4fsr+FMEzhGeeaGVIoLC87+LMZ3fv8zh0nDknvdVdue0sbx25Ta
	hRENpuxvZPJ0pX7FPN1F/zzcxS9k8q9R0MC2C3OWvrh/igT3EQLJgNmTcPwQ0ClwZECnwDKGH7RnQ
	XZQozv0PZ7jtmXlZ/L7QNj7pweQR0dVfKFHikEplJyczFkNOkE9+U92jV638d7XJXf9kfc2t98D5d
	io4Vrh+7WHUMQL5guzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGvh-00000004QUv-0TCj;
	Thu, 30 Apr 2026 02:15:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGve-00000004QUK-1V35
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 02:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 992A94182B;
	Thu, 30 Apr 2026 02:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA15C19425;
	Thu, 30 Apr 2026 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777515300;
	bh=P5Bhrot970eF9hSj+tikVxdnNY1yaiHMLkZnS2b4vFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvrxLDce1SspYbR9wI7N2GGlTKIMPx1rc/0KxEHpaDaq8RA4iAWA9rtlX6v/HQj1g
	 3N2N5dJivzttUb4xmTBdK33ptaZiJWNT5pP5/ON9zI6zaTx+s3f+CwMvkZyry/Rh2u
	 lH3Y/wGvej5TWn8t40uwmyES3XY7jC6HZEog7JlYBMUsielwn60R92e78fbS2gVZzf
	 eyeCsAMArpwz31wIfSbdNOu07DSPtlLt5KqkssSaK1LuBgl2NMiLMTIp8Vmh+kSgD9
	 JKcHZEq/vHPURMj0WseIntv9MibjWEqaTPZandJJsGBJ2IrCzuaCwTWxjj0C5Pw/7v
	 9LxzVyxlq6c4A==
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
Date: Thu, 30 Apr 2026 02:14:50 +0000
Message-ID: <177751516893.2918908.17754603353748839881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_191502_416225_C5CD59CF 
X-CRM114-Status: UNSURE (   7.63  )
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


On Tue, 21 Apr 2026 14:40:21 +0800, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
> 
> The series is rebased on next-20260420.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
      https://github.com/spacemit-com/linux/commit/a17be027dc5ccd51b99b5bc7b487ba9fbdc554e8
[2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
      https://github.com/spacemit-com/linux/commit/448fedd56cdfa68c2e661b16a8dfc8f3c40a1bcf

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
