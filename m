Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA85C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7Tw4ZWD7LlYiWoFTcz7l7IcyriZU1kU7MzQ1qFNXGo=; b=IoK8JvwvE9S5zS
	6gWQk1jMoHQMXG/WJlyNotJabhacuFXKRGl5WOBnGK+H+Dwc4ZbS0zxWlSGp+exxExAgH7RHESqxZ
	PeP6FPRC+VCN3VPpqa8eJI+VJDKqJfxcdIHmBZnXtRe66JSsr4Aa7sZcswlRaqsRYuwtYDH7miJ7q
	g5dqSD0hd6l97GhmFkchjJvz3ZaRfO1zpKA+1EMS7Xkb4Z9oXLbwTZfYIBsqIszvPlWUvx0yYFp/i
	6eYWAYtRrVxGyC/YUBU6Y/mLjm2a/KBO2mw6kPVtxG3NmGGvbQw2Fmq6UGMp/mOw1ed/ddQG0/fWj
	xUEXCpOkE8o6oRYxwhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ8I-000HcW-Bo; Wed, 13 Apr 2022 09:17:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ8F-000Hbf-S8
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:17:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id g18so1655282wrb.10
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QevIppUHzFszJ+svmEliy9enENifrM8XKuXo2Lypfb4=;
 b=kL91AK127SudV0s3BmM1tHsiMRH85Wt5P1sQ6+1rvUsVr8tAMroIj8SN0fDYAxFWLV
 Emr94FEzCSUxVdi7xj3lZU+LMpABV6hPpCknYFMrDmcNMIFEZj7dcGG6snd4BeMnHz76
 qhiPunciB0W293+xW4BimGSihgpa5v1vEsOK21c6aUQWhS0r+j0KsAdabzCqk598sK7a
 simNaOGNWdomZDFBECfsCD8SKld6TB0/9JY0p8VLaVPKDJzkZ6Hh7xaPeLEsNEHo+h2T
 QTgnm3swhzvCvu0Qi92J7nNL8wsMKFigdarmicY6BR1tehJGz/VrLPFptoFOf5rwrHJH
 GnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QevIppUHzFszJ+svmEliy9enENifrM8XKuXo2Lypfb4=;
 b=nezCbCSsYsq+hUKZidRmsTwuSqTtUutEPlQ72o//A/9usy2zYX9fPjZl5oxYIgp+W7
 l6Ef2pp2GvKnkDQiosYhv/nKuNDFvoEKu13wIpqoN/qthX0d+llNJRgSgxKhFPwoSL51
 LHHeo0f6wRv4045GqxGwVz+Patqd01vvM2pRphfeRM6kbHWJLFv7KUxRXxXj3fjtlLl6
 9gswJu3cNUGAyMW3d07N6BzrZryfDXZDHtoeIBoRMBGex3tC1rv7XPbPSVKe+MebF5gY
 OczGD5eMsm6rGleIaJuc23nrrRptIv/JlsUOlfRpmRqGs0HXTEjQLY+XsvglTwtHnNK6
 gWtQ==
X-Gm-Message-State: AOAM531Nzp9VKoViaFcOAJX3/0fkv1D+o+hevhwF8bzW7FsP1DY9ltny
 gJdW3n0yw5QFcLYaUxjOikIGcksZwuu30oedMrS/0HS31IrTpvLf
X-Google-Smtp-Source: ABdhPJxI7FAkeF9HaZmGrVRQ0z4l9fIkTFq/AM1woxFHWDA6N4y713vIH4IlVLDxWVkvqQ1Qe9zRNTUWIVZvHgEAn5E=
X-Received: by 2002:adf:e84a:0:b0:207:a697:462c with SMTP id
 d10-20020adfe84a000000b00207a697462cmr11117743wrn.312.1649841465722; Wed, 13
 Apr 2022 02:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-13-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-13-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:17:34 +0200
Message-ID: <CAAeLtUB=FTTD32j6AP7Mv1DsaP3VDUkZcHAAmB6i-iD+A4zvmA@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] riscv: add memory-type errata for T-Head
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
X-CRM114-CacheID: sfid-20220413_021747_942752_012AD4DB 
X-CRM114-Status: UNSURE (   7.06  )
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

On Wed, 13 Apr 2022 at 05:06, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Some current cpus based on T-Head cores implement memory-types
> way different than described in the svpbmt spec even going
> so far as using PTE bits marked as reserved.
>
> Add the T-Head vendor-id and necessary errata code to
> replace the affected instructions.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
