Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D169E7C711
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 05:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Hf5df6Y0nw8TNzyyHhiq5WdKCHiAu1wucjjNdE+esE=; b=L5MdyglmpAVsQ2
	b0GTkJHxg0yuU7HBXmJ1/6+QGirTnCLuO+vdzRjW8Y0poxuH76hjcd9q41hYpL10zlTSnP8QM+kKy
	zDvev7OI1bHJRfeNG/fPFC0nT0TV6sJtg3UrXzkB/XkRac7xIDYYFMXZYDYRUou4kT9pfxhYA01wV
	KYzU3ZlVfacBH4f63XUa2lfe+kVmdWpkv4qVi5QS6/NC4gJWPoRWNk8Tl050XJBPRLvA3aED2JlG5
	Eb/al+D+jpTXOXdc0HjFIXC7zk7x//465WWF7M5rGM38cpVqiKEdyDo1Mx4WNjN7A+wVfYR0Hrx2W
	89GF9UUCaMJa6/K6SutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmPqn-00000003Git-1MeR;
	Sun, 01 Feb 2026 05:18:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmPqh-00000003Gi8-1UVm
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 05:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8781444353;
	Sun,  1 Feb 2026 05:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8BCC4CEF7;
	Sun,  1 Feb 2026 05:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769923092;
	bh=C0CYUBRG91ipIlTc3TywEPoRqbFy/T0H4CJ3dcoDfEQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=vA1QOmD96YCHPkdcmJprh255ZcgvOnq/CRbEHi2daIEtGlrRlZbp6hJkTpT0Zk2mq
	 31rE76VmbJqk7KdqxtAW4VPlE77OG36HLPAufomh4dKgWo5uhNA0UmSG1/PXD38ahB
	 2BxPPZIyL4RMjjJZtg4CNsnhUdegTab+73FEH7hE=
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <cover.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
Date: Sun, 01 Feb 2026 00:18:01 -0500
Message-Id: <176992308158.607015.13478428408379130887@lemur>
X-Mailer: b4 0.15-dev-da43f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_211815_892334_5B213E87 
X-CRM114-Status: UNSURE (   7.83  )
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

On Sun, 01 Feb 2026 05:38:07 +0800, Han Gao <gaohan@iscas.ac.cn> wrote:
> This patch series enables the PMIC, voltage regulators, usb and pcie
> for the OrangePi rv2 board.

Hi:

Thank you for sending this in. I am working on "b4 review" functionality 
and I am using arbitrary series to perform agent-assisted reviews to 
find bugs in the process.

This review was done by Claude Opus 4.5. I do not know enough about the 
subsystem to make any judgment about the quality of these reviews, but 
they look valid enough.

Hopefully, these were useful. If not, I am sorry for wasting your time.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
