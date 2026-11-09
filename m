Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE5606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWafvuMw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=JhM5iZI3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M3steTNqxk3KcxqbK3ArNpTYRkV6RvrMohneqfACJ5E=; b=UWafvuMwfamx0ePGDp5OdaNOOJ
	nphQbrJL9Pi5f9Wx0+iX6ZWzAfbSWepiHenQPHGn3nkkp71PHiLu1zQmXNQVm6arlORoPvfAGCHeg
	4iYyTUMcVNYiNCjtcOMBIvOXPI+J+a2MU8uGIthj6dRBIxDE714+5RQMVgQlqZUN0pMd5HVAggQIO
	iDHUBVXxoB/rKCHmAXlo67ePVL+e7gJJAfCMj1ZG697ty/FW++CFweqbznMDDAFI7M54/g26f1Lj1
	481ZOLUaqH339RN6018en61HLXApC3A/BiOWrqNfTqusUMU4gAq2lZkdaJ57o0ix6NblqdNTKskRM
	heK2Bilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHQ2-0000000HMfV-0Kjw;
	Mon, 09 Nov 2026 04:55:46 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHPy-0000000HMen-0FUR;
	Mon, 09 Nov 2026 04:55:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794200117; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kgJ06YONRy5PtT6LHHPXY7TeZ2USZKKkLv8VZandB6V0/jYTAD5MvY/abxIpfJJFHvhFWImCLYhTZydSTic0Z01jk7gYNT43rJGqer251Q++Ix2yk2HeUdVCujgY7ckjqQ1u9FFJderC3M8BUeYFhHh3B+5fVMXYF8u/gYTxadM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794200117; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TVjYb4BBcraXHmLMuxAJ4VYWO2AEgU5Dcu295blPONo=; 
	b=JpBUlC2mqu54blu6aDoBbT/qtR6O1cOs4yA9O0dwWCfAC5hfHKXxxVVVWJfoB4yqdA2NQxjl8Ug8RYyhZSgVnQeCJ2gRoi37EChlObs7aDKGX1YWKFBK/Fce/Am4weGpuQV0GXb4GjoDItAkXP4RWME0kT2mpmbgsvCFVtJjpfU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=JhM5iZI38onPijDbb/bTo6SBqko9SM8euQYqdXR7Rge9qDB6vu8o53ARCnp9UqaIVhzgBI0Xhj1icaq7Bd+WrCPBNMtUwAjy0+Oc6xUN9gl8IIcATPbCKWj0FOz2sI69wwQoMKuXHh1KUF6gB0U8eHn9aU+LJ5zu0+HSNvQZHu4=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=TVjYb4BBcraXHmLMuxAJ4VYWO2AEgU5Dcu295blPONo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17942001166001004.3701295111581;
	Sun, 8 Nov 2026 20:55:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 12:55:07 +0800
Message-Id: <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Richard
 Cochran" <richardcochran@gmail.com>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Andre Przywara" <andre.przywara@arm.com>,
 "Norman Herms" <dockseed@proton.me>, "Vinicius Pedrosa"
 <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
 <20261103-a733-ccu-v6-fw-clocks@gmail.com>
In-Reply-To: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_205542_467522_FDCADCE5 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Enzo,

On Tue Nov 3, 2026 at 9:33 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
>> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
>> +				      1, 3,	/* P */
>> +				      4, 3,	/* mux */
>> +				      BIT(0),	/* gate */
>> +				      0);
>
> On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
> stalls at warm reboot. The system-controller firmware uses the R-domain
> timer and mailboxes without Linux clock consumers, so disabling these
> clocks as unused can leave its services unavailable.
>
> Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
> bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
> revision? My standalone patch has the diff, firmware references and
> board results:
> https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

I'd prefer not to mark these clocks as critical just for the vendor
firmware. You can see my reply in v5:

https://lore.kernel.org/linux-sunxi/DLYAHDTH3129.3AYF0OSHL8RJ8@pigmoral.tech/

Since you've already submitted a separate patch adding these critical
flags, I'll leave that to you. If the maintainers agree that these
clocks should be marked critical, your patch can be picked up.

>
> With those five flags, two RAM boots of my A7S integration completed
> warm reboots without clk_ignore_unused, and all five clocks reported
> enabled. That is one board on vendor firmware. Vinicius reported native
> PSCI reboot working on an A7Z without local critical flags on
> bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
> the boot chain may matter. I haven't tested suspend, or shown that each
> of the five flags is needed on its own.
>
> Thanks,
> Enzo

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
