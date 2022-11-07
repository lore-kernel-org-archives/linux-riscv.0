Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B755CC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8a6oloPXbDjGTnYgebVOrF82NXOFJvvIX09JrD/3kM=; b=qou24COKc68dfOFPTm2BE01dU2
	LuO/XkyvN+kLAWe+vqVd6DWiVpzlhaHQJOuZNxUkkkcEeCiCfqxYCkwbbWNhigLWwU9SlO70R6Bw3
	KIzIH0okYdxV+qUIVc92g1o/fq0zwZ0YL4d10sfYNKov3p6ecw3NDZXfe8UvZ70QIGiBJOPHpC6t1
	n/ExUQt/uGnTIptNNsGvOaNrPMNMMAmAv2RLkNALx2+3dy514LyxI+hgdfsEFisePL0PnDjhMiLG+
	SdTYNzJQtK/odKFjJpOrjWYnbBVQP+/y+tLAJS6aGTLOcXPFFIztDq+gKbF+8fxrT8nJUpwrg6oZi
	A+Lzikow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5Gt-00GM3d-Q0; Mon, 07 Nov 2022 16:46:51 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5GA-00GLJK-6E
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 16:46:10 +0000
Received: by mail-pg1-x533.google.com with SMTP id h193so10919180pgc.10
        for <linux-riscv@lists.infradead.org>; Mon, 07 Nov 2022 08:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :subject:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EW0pwjVNjZMsjQ4rgo3AByKUdX34ffUMtNXivNYRjZU=;
        b=iuQvd/SY4HMVO8eh2FDeRfmuFXB/dftHBIq6vItZQH6zH0DpbIYvd6ahKEbkfa6Yb9
         aHkAKJ2Xe0oaoAwLXjHJy7GQ/oFQ1iRT9NkvUfKe0SypnzjNam7WX1+5yAYmjvtMPd4A
         w339N/bXvC5+Y1UNy69e8BTYAzGEp4juIK6QiXIzpIa6dT93V0riYBdXXr08avijqhLd
         /hMDJcuYAX0YEVoh+0F9I3NJlHGazT/N7Cf3dGx0+vsnDZKKih8QvkjbEcG2dZ3Y58dj
         AY2EzYWWRNjUPn1WlzI6eKz3z0qYdViUhQ6fRY+qL6hUbMy87RUql2ZSP9KP9VadghCq
         /MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :subject:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW0pwjVNjZMsjQ4rgo3AByKUdX34ffUMtNXivNYRjZU=;
        b=IcnERHD2dtGTKvOqeydqMs+1AREJ+iKDe90eJaiW7UjmGT865uVbGwu1qxAJuu3ZTp
         oaRtrYpGLE/N7h9IIxvtyQ6dYU58ic8D6yCC7HP8MeebWlNgqobnccTQAHsW9R/EjIuf
         ldzdswCD7XuSQNQWAyxP59++ZU2NdpdrUtXaRyuCcl07YpEvT4xCmG7kdPhLAGmpUdJO
         dftCFukCHgNMVQ7nhS9g9l6q6s82smjAaf7i4tCy2WTZix+FByoXHq8QBD/F00w2Vjwc
         8DWm6T128pEXFpE26bau/QchsYffMCDW1aH/bVzI3GNTXfoMrr3mflzBYilJ38GY/ASn
         F7tQ==
X-Gm-Message-State: ANoB5pkLQmbSHPCEZ1dobLud/3feE7lQpPtlnornbNKkSc+qf5Ll/rbg
	jHp53E8bOYlEOZDcU1z5BEAGCg==
X-Google-Smtp-Source: AA0mqf4UDNIhvzVyN78Jom0q8JlAl+vfEHjgjMMkpb8O8b73d196gzQo4lTFKPuP0naElUpZOTx2mQ==
X-Received: by 2002:a63:ef56:0:b0:470:6c2d:64eb with SMTP id c22-20020a63ef56000000b004706c2d64ebmr7236342pgk.49.1667839561438;
        Mon, 07 Nov 2022 08:46:01 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00186b0ac12c5sm5207034plh.172.2022.11.07.08.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 08:46:00 -0800 (PST)
Date: Mon, 07 Nov 2022 08:46:00 -0800 (PST)
X-Google-Original-Date: Mon, 07 Nov 2022 08:45:59 PST (-0800)
Subject: Should we merge arch/riscv/boot/dts via the SOC tree?
CC: krzk@kernel.org, masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net,
          linux-riscv@lists.infradead.org, soc@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, kernel@esmil.dk
Message-ID: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_084606_467740_2920BFC8 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This has come up a bunch of times, but I don't think we've ever really
made a decision.  Historically that's not been such a big deal because
the RISC-V device trees were pretty inactive, but that's changed -- both
because Conor has been cleaning everything up, and also because there's
a bunch of SOCs showing up with RISC-V cores in them.  We talked about
this again at plumbers a few times, but Arnd wasn't around it person so
I figured it's best to just start an email thread and see how people
feel.

A lot of these new SOCs are based on Arm designs and the device trees
very much reflect that, so it makes sense to me to just keep the device
tree merges via as similar a path as possible.  IIUC that happens via
the SOC tree these days, so it makes sense to me that we start handling
the RISC-V device trees that way as well.  That would make things easier
for contributors, as they'll have one workflow for all their SOCs, but
also easier for me as a lot of this SOC stuff touches bits I really
don't understand and thus get kind of lost trying to review.

Arnd: looks like you're handling most of the merges these days so this
would be increasing your workload.  I feel kind of bad just dumping a
bunch of stuff on you, but I think at least now the RISC-V DTS are in
reasonable shape so hopefully it's not that bad.  It'd certainly help
things on my end, and I'm happy to try and re-direct some of that saved
time to helping out in SOC land but I'm not sure how well that'd work
out in practice as I'm pretty buried.

On a somewhat related note, Conor has offered to pick up the otherwise
unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
change over to the SOC tree we might as well just do everything at the
same time.

Presumably we'd want to adjust the MAINTAINERS file in a handful of ways
to make sure patches end up in the right place.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
