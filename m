Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE7FFD063E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eERcjOUgySyBKMQnncOzzf6mAFm8UN0rOTL7nD/ZHzs=; b=ymagPMecIcLmc7
	nwxyK6n4QRi+LxfSfqzW7UGqDn8ku/dDacgQS1oM9nkcXvxx5JnvlmXuus9zT86u59V/jzJ+jNvaz
	VvTaubKlIGHwyyAju1NRodSx6waC4asta3mYMQpXamdD7/3wvvdJDDdIeIOOqlRSWZLmpGvS37iss
	Xuax0evADsYnwl/WAKe1lDPtvSGt5Puf6esMjufkwJs/nsi48hR86YJxG3oMp5h46il2wIkJf5VVr
	9+iip8BU/qwhNf+2F/3z4fz2Kfdh6EOamPK7TqYUJkS19QSsndsQ/JZXGfS1wB+3BERIKQzLW/aQl
	ou0W4S6so2ezM0g9qXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DaM-0000000Axw6-12d8;
	Wed, 11 Mar 2026 07:02:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DaK-0000000Axvs-39Cq
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 07:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C12B6012A;
	Wed, 11 Mar 2026 07:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B533EC4CEF7;
	Wed, 11 Mar 2026 07:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773212543;
	bh=oEp0zagVz/EKP3oxg1isMpE3fIGisB1T3dXsWTVrdpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icwXk+JQMwQUrKJOn6jtJCSJkbG/Y3cGfZTlZJh6uzdoYw+WWSE6ZeMJd3UamP8uc
	 JK4WOJw+3i4pNSkCcTB6L1EujwAhmvMQQC58vuR9aCiDvdbCB5buitTXA90WICPnQw
	 WaA0O5VLCtPRTWDPgfIbzzXXNWLl73U7KMeBfrPnr8QbYhSaMCwpcSkKsj427MkKGb
	 TUDvITYa28rpmTrWEvAS8dCT2P73+87rEPHBhr3xhgymWDSn3azdTsJWR4gd/HVCwD
	 g3Qm78MEyXKPvUA/QLL1T1ojsKTzydSe8rILiD4zGRUolu819EmLdeAGMJFa1EIBjG
	 PqURs1aPe9B4A==
Date: Wed, 11 Mar 2026 08:02:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina.FernandezAlanis@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Richard Cochran <richardcochran@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Vineeth Karumanchi <vineeth.karumanchi@amd.com>, 
	Abin Joseph <abin.joseph@amd.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Ryan.Wanner@microchip.com
Subject: Re: [PATCH net-next v3 09/10] dt-bindings: net: macb: add property
 indicating timer adjust mode
Message-ID: <20260311-uncovered-paper-hog-e32fcb@quoll>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
 <20260310-aviator-upswing-80e8543a2300@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310-aviator-upswing-80e8543a2300@spud>
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

On Tue, Mar 10, 2026 at 05:17:16PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The GEM IP has two methods for modifying the ptp timer. The first of
> these, named "increment mode", relies on software controlling the timer
> by setting tsu_timer_incr and tsu_timer_incr_sub_nsec and performing
> once-off adjustments via the tsu_timer_adjust register. This is what the
> macb driver uses. The second mechanism, "timer adjust mode" uses the
> gem_tsu_inc_ctrl and gem_tsu_ms signals to control the timer. These
> modes are not intended to be used in parallel, but both can be possible
> on the same device and which mode is used cannot be determined from the
> compatible on all devices, because some users of the GEM IP are SoC
> FPGAs that permit configuring how the IP is wired up.
> 
> Add a property to indicate that gem_tsu_inc_ctrl and gem_tsu_ms are wired
> up for timer adjust mode.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/net/cdns,macb.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
