Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF1AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaXE4EWJ4Sm3V5q2mBdtkJflzg/i3wi8T6HeagX1fC0=; b=BtJzprU+Asckue
	ly7Z8JX7lq+XVRwMBm3BThciBUtpVqpUYYEAg1OlzCosw+DWktX+N3ZF23wAcQlfuMGJ2Wlqkws/t
	YIM7FzwaoFKtqgb3DvSe4rUHLnveNm7BVnGROSeDwEYOJce9AanAEyy7qVMg50VUB6mpvXp4TCrt/
	aBfZjPdkUGUxFMWMa1XmxyqZX2GveRa03hiJd2N4mbZ+xix1khHJg9KwdU+BOGrg81MwK6gjon8Zu
	t+CW8/v5jzx4bALx6pa6+3B2dmCvlNnXP9OWoJ7NB6yDOutrma2WSCOvLtwncAMrRpDgFBpRti/7q
	k9KYol3cuGIyi8q+SjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og0Lw-00DGMr-BX; Wed, 05 Oct 2022 09:06:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og0Lu-00DGKZ-EA
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 09:06:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA834615E9;
	Wed,  5 Oct 2022 09:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490B7C433D6;
	Wed,  5 Oct 2022 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664960765;
	bh=hJ2FlaFirUuI4hX9j6QpETml7t5ItP4nxc9UwAYJ8tw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CDAltb2OxH7o/HxYn2/oU7A5p6W5RcL0WkwL63fIQQByoKvBmfYhibYXlngZXOhDS
	 zFaUAUTu/PdVH3LgtRwifdsSM4Jm669AIkgSpwsZslVD8gjOr33yqu8HmqJlZviKjl
	 liiP+HotD1eCP5Hg9XN/zeLg1LLrLFxF/ynm2LR6wA+iHOV4B5l7OXH1MW5OfjJRWT
	 uwuUr9v+IVBG7AJ0Ec+uYWOTCfYpPfuIs1rBUN92sAS8u4u+gYRtnGGp6eL9PLeeOs
	 TYfICQAqPQ91szksq37nGOa//hRb9NfHaFZoeB57vTyjGWb79TZVkrkNYajdPLsjpW
	 uE8licpGT03VQ==
Date: Wed, 05 Oct 2022 09:58:01 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Nathan Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v2_2/2=5D_soc=3A_renesas=3A_A?= =?US-ASCII?Q?dd_L2_cache_management_for_RZ/Five_SoC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CA+V-a8tgvF16vduoQ+ZbzTpRJUmCnN-GPQs5G8AqMOXbnznwHA@mail.gmail.com>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <YzxwoELNBctbhjJb@spud> <CA+V-a8tgvF16vduoQ+ZbzTpRJUmCnN-GPQs5G8AqMOXbnznwHA@mail.gmail.com>
Message-ID: <F0B6C609-6C39-4080-8F07-7FEFFAFEA993@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_020606_540058_21C47795 
X-CRM114-Status: GOOD (  11.51  )
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



On 5 October 2022 09:44:56 IST, "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
>Hi Conor,
>
>Thank you for the review.
>
>On Tue, Oct 4, 2022 at 6:43 PM Conor Dooley <conor@kernel.org> wrote:

>> > +static void cpu_dcache_wb_range(unsigned long start,
>> > +                             unsigned long end,
>> > +                             int line_size)
>> > +{
>> > +     bool ucctl_ok = false;
>> > +     unsigned long pa;
>> > +     int mhartid = 0;
>> > +#ifdef CONFIG_SMP
>> > +     mhartid = smp_processor_id();
>> > +#endif
>>
>> Won't this produce complaints from your if you compile with CONFIG_SMP
>> set?
>>
>No I dont see a build issue with SMP enabled, do you see any reason
>why it should fail?

Not fail but complain about the unused variable.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
