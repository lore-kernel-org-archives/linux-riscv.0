Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1335C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zq5RqGolUwCSNgVPx9xGK5R9Co0QrwSt3TagTXJgxrY=; b=rkZ0DQiTo34QX3
	a4b+g0tujbWF9doLUEk6Rh0HlDtDZEcOPyiJvXBANgtWHL2oQNSvPyJ83ynXyyjDfrM1BtAOW+3AB
	dRmAbCu4B/jtjxfABsQ+ALSQJx5MAR9VBnXwV6mFk7FjSbhsrGwXhRkEkDRXEhzI/sELbLFgg17Un
	Qbxx4HV2kFvF9TSrH3hrzh4QX/XVqYRQToYEu9eql5iuZ6uC+VYu8LgN9JKWWFRUcduyfa5SsMKiQ
	iwVSJg9F2YSISFAe1h50QHy4tVNp1KW/DbiukUT4RcUVyl3I+Vl6iCidBik1+Hfh/jQT6tw46QjAe
	7reHmzlHSWoGNqLLLsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYyu-000EGY-G5; Wed, 13 Apr 2022 09:08:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYyr-000EB7-Ne
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:08:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so749963wmn.1
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D+w+TtMxvv3nKTGIfsbKoASKEHBzjXiu+DU3lDjZKyw=;
 b=aNCHq15QDaD89o7nVZeY9MurmjKfqtiGJEXZfbfO63x8D5id0i92mVcvuTCuWdSC5S
 Rho/gfQfwWj0HPpNTNVTQJNCH3CZyFT+h/Z+UyhZ4vF3guqVdCWzF3xChxrz/X6ysA7m
 585fn/NMR3FLP/+FD8Jrn8XMBByJiMRP5mnUlgf6dxzOjzrnNSWAA9am/GGJYhpmJ//x
 l6RlZ+QBfpOp4jn28dvkxHg2LHKF/zm+V8ooymEe80uSvuWKmW4X/qm1z1nlu5jYySUU
 Zju2s6X+IZMVLX069dSJQbsHIAvRWR2Hx60YSjz9p66zma4iLXiBUPEHm6M/vXykn867
 bUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+w+TtMxvv3nKTGIfsbKoASKEHBzjXiu+DU3lDjZKyw=;
 b=Ax2InQSPUVKE2lPcLyW/Y1mtEf00agmsjcG99eELDI3b3GuaUZLMCfTqEwxFu8uhog
 RuOz1ZYiNUv50jiGePc/tRH/h05/B0QcZZxHxd1h0b6kyK5t7to9I/avOJQkIHue9vKm
 P1LU7XetveeFJNrSl58ZlQWqvaIBRN8FB+0uf+GvRQxHMVfUD+Ud4eehWBO6cc2ivcZq
 VbFsHw0wPhYZUo6nOUQQAGdt/qmLMVM4S5A88O2wYsRO3PmPNfsPmKtqk8OfZGl1gNwS
 Ou+vnSXK4sb0sTwFUekxgJ+DHLvjCZhglhU8pmSo98vI/iPmAnI1frP38jmfU0nJSy45
 ADaQ==
X-Gm-Message-State: AOAM530kOPIClALmWc/jMGbqnXnplZy2PQMSl4ucVi30WkiQko4EGwlQ
 Qkc0ILXDSpQVMXkEA+0zgFUVEE85gDnWWZVirxFYlw==
X-Google-Smtp-Source: ABdhPJw8ko1FICi2ay6XTVS5LEnfXs5l3CxjK3vAdnQU4/nd5dvTqqqiOB2+3p7m2t3t14PYG58aOewTQWcU4+goHHY=
X-Received: by 2002:a05:600c:1c9c:b0:38e:3270:373d with SMTP id
 k28-20020a05600c1c9c00b0038e3270373dmr7623569wms.199.1649840874909; Wed, 13
 Apr 2022 02:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-4-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-4-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:07:43 +0200
Message-ID: <CAAeLtUC-RCtaT5fUOhT55uF8TeEV+RzYyqv2_JXBfgPYG_Z9Gw@mail.gmail.com>
Subject: Re: [PATCH v9 03/12] riscv: implement module alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020805_843310_364866D0 
X-CRM114-Status: UNSURE (   5.91  )
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

On Wed, 13 Apr 2022 at 05:03, Heiko Stuebner <heiko@sntech.de> wrote:
>
> This allows alternatives to also be applied when loading modules
> and follows the implementation of other architectures (e.g. arm64).
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
