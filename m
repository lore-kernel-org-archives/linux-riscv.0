Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34745C761A6
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 00:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9mmAmhGzYKglAt0rEWXIhFa2bMA9buFg0bNMWERpgo=; b=zuBKSfCzFh7I/m
	q/kEhmB3Az6wSoJid7OYxRK899j+RusJxEz8JjArbIZuB/7BzFIfjGA0R9EyQoWOaXuIf2wjzhzFK
	qaqjNZRx7SfSho6LLfxrZ+Jf8XOIui4xHtL+GFW1YmJknYK8Q1mmEaqaG7YwmSJBbKEoktcRVi5w3
	LtTJcVGpUFzoA/wdDqTomu4+9bEW8P485gKYtVB4i9ovsgZr9gmKv53RCj/x4sOkF75vo7HzFaYji
	etSXUpcZ31AEn1NscVgabQCEFTn4nG8OF92AMONDSfjLH7XZudILXfUrRLLcKWd/zL/yzY/o3yyaV
	OV/RPk+S1JDbZX3YXCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkZa2-008rYU-1k;
	Fri, 07 Apr 2023 00:03:50 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkZZx-008rXa-2H
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 00:03:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id lj25so5086705ejb.11
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 17:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680825823; x=1683417823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+8kfy3tjKLPe3TifJTVuacG8Zo955zar201sEBpYQI=;
        b=MNxZauynb0gVNoahtsqVvCiD8C2zrTbmZyxhykOshWSl4e4x5UNTGqTuT7/wA3I7k8
         isZu/+ogsApfCs7W/ZB5fS6cxwdrbU9TU7BY1fI0qASwr6BjQJLXCeNFv+s+Xh83T/xY
         ll8AO3x+gov4OAc2i56yvml4nCb4zNkFKJ5u74M0JI4ko9UKgzW6TnWtMQRvEHud/aEw
         lomkn4kZSlpECT9vUFQuUsSM478UXOnO04ZA+Z6NzoehD+9jPv9f2qOB+4HKsfrWSX3v
         vE03MFZzWVxQUnH/d6yU0N3M5EsXJIX4L+16l1ynHUGQ6r7rbi5f6lCkt63a4xE6+x4b
         yzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680825823; x=1683417823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+8kfy3tjKLPe3TifJTVuacG8Zo955zar201sEBpYQI=;
        b=Y5xYDcbr97/DepLQoKPtsvLrL4wAPU88FkBaFzzeh4zj1J8tm6K9I5Y/k0asv3HiZ2
         RQeUnL0tM/57+ifEXmbHlqXPMZwj0Mfvx27PEVPmJjF0S5aBYvQ+Qz9VwkHWP3YmyNLG
         il/HfXfZprst1tmMg/sbWJ8CTZV/6+8Sx6B20qQE38NoIkOexNcDv4XwmY/NRoRUYFpH
         h9BYz8QBiGpgl3gqQz189xl8ud6Z3PbISAY0gmaiA5fbqowshy/F6qXjr2pYozLLxUqC
         Wvzyr4HaUy0C/d5LTw3lWw74wNQNmxeKsl2gP+DwPBtR71ktJukRZtYtAlj0hplePSPE
         Em3Q==
X-Gm-Message-State: AAQBX9duscEsWgKREEcI6KOBV6wRpaQ5El8A2u04nw+YpvCKubmE0M10
	QHvH1F23FI8w4ZMp/6uBusE=
X-Google-Smtp-Source: AKy350bZf3Pgmi2zLBkprnBI1EXh9QEM6UWQo+KFZnv2Ap/aVssuKQNynTVN5Pac7j4VHVTr9tnMlw==
X-Received: by 2002:a17:906:a18b:b0:933:44ef:851e with SMTP id s11-20020a170906a18b00b0093344ef851emr558038ejy.55.1680825823181;
        Thu, 06 Apr 2023 17:03:43 -0700 (PDT)
Received: from andrea (host-79-35-32-179.retail.telecomitalia.it. [79.35.32.179])
        by smtp.gmail.com with ESMTPSA id x5-20020a170906804500b008def483cf79sm1373504ejw.168.2023.04.06.17.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 17:03:42 -0700 (PDT)
Date: Fri, 7 Apr 2023 02:03:36 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <ZC9d2DIOMy27AAT9@andrea>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZCu1tFrQCVe2sgNz@infradead.org>
 <OS0PR01MB59224C99770F84D8CE2D0DBA86939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZCxFUb8+eQPzqBmo@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCxFUb8+eQPzqBmo@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_170345_743675_0ABD81B9 
X-CRM114-Status: GOOD (  10.16  )
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

> But other other point is adding more cache flushing variants should not
> be easy.  Everyone should be using the standardize version.  If it's not
> implemented in hardware despite having ratified extensions you can fake
> it up in SBI.  Yes, that's way more expensive than indirect calls, but
> that's what you get for taping out new hardware that ignores the actual
> architecture specification and just does their own made up shit.

FWIW, ALTERNATIVE_X() for "three instructions with (what should be a)
crystal-clear semantics" already smells like "we're doing it wrong" to
me, function pointers would be closer to "we're looking for trouble".

Thanks,
  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
