Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C64BCAC5B0
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yyu7Q0GEyefEIzgiRDrertsnF7tEHp24P5PttfOZxnI=; b=q+aXXnxkgkIBgX
	ZU9RowZfctzYzb9sWV64xL/vr7meK8WnPNamhZta05n9XiwEecemEhV2Fjty7C6dCqCO5PUxHcGMe
	l76rrAxtCjb8qpEBP611kMFWSlN027t1vML8jcNVHM3VieIfwTWPVpYfG8miqaEcd4HcI77Tw2WLK
	qQrTD+jZAvf8m1BrZEKJvad8RXLMv8a8+ZQpZRcRuEikfHx32U3RpGcfeTFuvX/sW0utoV9xScjuF
	q66GZ7SNZWyGycqnxWqoi8gKSvaPVEUSRnaxm+chbiYyg9FJcJ4z589Zkz9EfidZGXaHxgVP9Jyju
	PhpBqTXIWdad4ke3+v/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5yWj-00000001DcU-2riv;
	Tue, 07 Oct 2025 03:38:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5yWi-00000001DcM-17nD
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 03:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 373F5600BB;
	Tue,  7 Oct 2025 03:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84930C4CEF1;
	Tue,  7 Oct 2025 03:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759808290;
	bh=laZlRMTJlLHx1xQYrZ7hDVs8sVtuuELaDehxxN3PvFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROLtb6vsjucBJQSHz2BW/Vcz1e6EhYx3ZzN5POI13Vu56ZQ4+60GniPAlE489biPh
	 Zf9dbzT68TFBmeK+NpkFYLlIqJuRmzAT12EmOzDSKIdRBcokuiBSZ+m6FPExWG9kdG
	 5V1+7n5n9wmYUwxQK6b4JZCR/VLG8qi12/LqtOGCG/ymE9Gu3oHIif55WaqcEwZ65Q
	 dSXQGTGPxxxmofkurEPP5sBB+e7+mIFzwb/Uane4ktZUYsRZXvTEWkSAK0MnEhg9vk
	 tQVdK9i+R/9Sqlfy2/Ww7oQQ0soJbKlAkEAzQ4qXISSMaBJh10Xn220n6IQR6q21vo
	 V2+Z7FbFnIbYg==
Date: Mon, 6 Oct 2025 20:38:08 -0700
From: Drew Fustini <fustini@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	Anirudh Srinivasan <asrinivasan@tenstorrent.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Drew Fustini <dfustini@oss.tenstorrent.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: Add Tenstorrent Blackhole SoC PCIe
 cards
Message-ID: <aOSLICqS1Hxi9gBF@x1>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
 <20251006-tt-bh-dts-v2-6-ed90dc4b3e22@oss.tenstorrent.com>
 <a05be32b-dc8f-444f-8c1c-2d49eb19536d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a05be32b-dc8f-444f-8c1c-2d49eb19536d@kernel.org>
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

On Tue, Oct 07, 2025 at 10:20:43AM +0900, Krzysztof Kozlowski wrote:A
> On 07/10/2025 06:21, Drew Fustini wrote:
> > From: Drew Fustini <dfustini@oss.tenstorrent.com>
> > 
> > Add device tree source describing the Tenstorrent Blackhole SoC and the
> > Blackhole P100 and P150 PCIe cards. There are no differences between
> > the P100 and P150 cards from the perspective of an OS kernel like Linux
> > running on the X280 cores.
> > 
> > Link: https://github.com/tenstorrent/tt-isa-documentation/blob/main/BlackholeA0/
> > Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>

Thanks for the review.

[snip]
> > +	cpus {
> > +		#address-cells = <0x1>;
> > +		#size-cells = <0x0>;
> 
> Cells are not hex. Please use decimal everywhere.

Okay, I'll change.

> > +		timebase-frequency = <50000000>;
> > +
> > +		cpu@0 {
> > +			compatible = "sifive,x280", "sifive,rocket0", "riscv";
> > +			device_type = "cpu";
> > +			reg = <0>;
> > +			mmu-type = "riscv,sv57";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicsr",
> > +					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
> 
> Blank line

Ack.

[snip]
> 
> You should have at least serial or any other interface, otherwise I
> don't see how this can be used at this stage.

The goal for upstreaming this minimal device tree is to make it possible
to boot mainline kernel builds. I attended the KernelCI workshop after
ELC-EU and learned there are not many RISC-V boards doing boot tests. We
already have Blackhole cards in servers that could be used for CI, so my
goal is to enable mainline to boot on Blackhole.

I had an explanation about the serial console in the cover letter but
I'll change the commit message in this patch for the next rev:

-------------------------------------------------
From: Drew Fustini <dfustini@oss.tenstorrent.com>

Add device tree source describing the Tenstorrent Blackhole SoC and the
Blackhole P100 and P150 PCIe cards. There are no differences between
the P100 and P150 cards from the perspective of an OS kernel like Linux
running on the X280 cores.

There is a virtual UART implemented in OpenSBI firmware that allows a
console program on the PCIe host to communicate through shared memory
with Linux running on the Blackhole card. CONFIG_HVC_RISCV_SBI needs to
be enabled. The boot script on the host adds 'console=hvc0' so that the
full boot output appears in the console program on the host. 

Link: https://github.com/tenstorrent/opensbi/
Link: https://github.com/tenstorrent/tt-bh-linux
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
-------------------------------------------------

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
