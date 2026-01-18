Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E741C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaLXiwmcQjHXznMCH/bXQvv8masor2wmn5bmAzCwliI=; b=ZXGrD0Sw9AMPZ+
	r7fF84FlwK+0LwGIrebKlpiAFxS3jBbPvVIlC1BKJWcmzqqLbDSjZaAJ1gviApNAcRJ4JmV1jPnMy
	jLZD/hw5c36Ku2/u6CgzOXfYPOb22WlxEHf+x8CgJmGL9oIcn0JVn0UW+Aiebz2GFapPlokAtBfK8
	gaU/wOOH9hyNuK3zirvpwNcBze2PFIb4YIGfXGK0O/6LTjXXgV0So5UWfq/sE/INJRpz2o1sgyUeh
	EWMPSAr00GIQKTZMTKCZjJkuOD0DdfRxrsCn0MNzvT3yTIHGX+G2N7a5YXOygBS/hhwV6KTrbJSaY
	jaQ2SkpYD2CdssZh9tsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPpT-0000000HIcc-37jr;
	Sun, 18 Jan 2026 10:16:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPpS-0000000HIbc-216C
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 10:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2F3060010;
	Sun, 18 Jan 2026 10:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127D4C116D0;
	Sun, 18 Jan 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731377;
	bh=s19NetTmsIr6AFtvr0RsCliQwj7ccRfYFNcoxDaPdj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlwyDo9GdmbJwXokTADnJ8bNzM+xQ5A1/KZ+7hXlHPJVr8ZiHJDOyGcx4/qCJZVrw
	 EWnLYpNPK1o2GZobQwE8bpD+HrbhSU+u4tY72X0QXhwru9tWdWvW1dGTeY8Dwh9Ges
	 OI/IboUK5W1YRUbF1vMDHL23gEkOho/ROAlm7ziwPEgwdPDHCuE7B6TBXG3DQmS7T7
	 xmf3c82zBHWo6NQg+1HlQY8t8gVPAqkltHjcjVzO6YmEzSk0UpO/C17XmmD/qAT8AC
	 C6K8oD76+aHQ2lacrAogNFlbFcvQLDN/q3GG86SeMIZusR4xU9o5FB15NFszHt4ta9
	 MKKQyrAJA+OqA==
Date: Sun, 18 Jan 2026 11:16:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Message-ID: <20260118-magnificent-horse-of-warranty-e5fdac@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
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

On Sun, Jan 18, 2026 at 12:18:57AM +0400, Anton D. Stavinskii wrote:
> Document the internal DAC audio codec integrated in the Sophgo
> CV1800B SoC.

Squash the binding into previous binding.

> The codec doesn't have any special configuration at the moment.

At the moment? Hardware is done. It does not evolve.

Write complete bindings, see writing-bindings document.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
