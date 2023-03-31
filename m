Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AA9C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW3AjcxITDSVr3i/aWEPZXSB8NGIekttKr5I4gFzgfY=; b=1FO58TyQqJ4YYS
	PfZu5JqM7ZIXrJXLa9Ol4aX6bkFH7SC/2SB5nS8rjNTPnoGutcOza1kN+sUAqrUcs43n2zSqQOEUR
	ndhPhakvLNUQsGBPB6kWYwCo6xQqMVAQQrf1fHCKgRvghcSnh7G16WQj8pq/ZzOzEloI/bmwp6cBq
	M9WkG6WRiOFNPp2TuDbuV9Nlars11iUk/U/nw8RCELqXN5huY5KJkX2x/fV7AErCIe9lba0ZK/U4b
	+B76rx8zdf4DLcjrYQ0e3RzvbgEJ3UGHvyOJl8QpwVU6KR/R8bdBBGdvMEFQ+si893IUFQFVHBWNz
	9+8gwM6c7DaYyMWFrSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEvY-007Y7y-1I;
	Fri, 31 Mar 2023 13:36:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEvR-007Y75-2A;
	Fri, 31 Mar 2023 13:36:21 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piEvP-0003v3-P4; Fri, 31 Mar 2023 15:36:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v17 17/20] riscv: kvm: Add V extension to KVM ISA
Date: Fri, 31 Mar 2023 15:36:14 +0200
Message-ID: <2167919.NgBsaNRSFp@diego>
In-Reply-To: <20230327164941.20491-18-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-18-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_063617_708109_E82817B9 
X-CRM114-Status: UNSURE (   6.77  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 27. M=E4rz 2023, 18:49:37 CEST schrieb Andy Chiu:
> From: Vincent Chen <vincent.chen@sifive.com>
> =

> Add V extension to KVM isa extension list to enable supporting of V
> extension on VCPUs.
> =

> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Acked-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
