Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEA0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5FjlUQUSneeED7d8Snzr1bM8fjvfiRjjVdzBkaocP0=; b=BDtXebugnKy2Ks
	CCGQVACtVKiyndi4Qvx4P3HJ1zyrxuC7BGEGvUK16As0BCj0OCZllfgRkWARkrkyWywF769QTGBYy
	muVnGdCB5C7+auJIXYVLq+D9cnoV7nPdsrr6/h2n+J4vD6V63HZT6e4qgsoKBl1bckIXuLzgaOMfS
	okfShHwAjl3ay7c4DvTl7ye7mSyXuGiPOTF7tVhbtNiamoDkcNO9LjuaqSGN0UWg5LA8Gx84CE0gm
	rkd2V3FYQI0YfcFdQvNdKWBSiiiUAdEJylaU0UwWB4erUUz4D0dr9ICM8QkqJT22LCCTQeyS0TEVw
	WWo5p8zSbSgUXUAx16ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYwx-000DbT-JO; Wed, 13 Apr 2022 09:06:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYwt-000DaU-Qq
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:06:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u3so1646284wrg.3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4Ur5FuAMtA6xVJsN+nl3/RAKHtJZB/dEjqv/D42SDM=;
 b=E9zncH8fDX4akfa0q887+k3HgURcftW3VOd3P3DKaRcVVy5WhbTBD846cDePAP6rPe
 +w3Ttm3WFE/HtZ9nxnTqGKlzE2nQx0WSKNbmb1UcCDOv9yhUt5WE2+Oy6n20B5S7sNWj
 PINcVdUSSIKc7BTpjDCBRb7h5SKl3EP9tpmiUon0I1W/9LqH2gQTqTtJnGTX0G7sJhFe
 1TyR2T8frmfmVy+Db9tV5J2zMjlCaTJeQAgw+Meb6bniNWCKiGyWGFJbsiSYupheLcJ0
 VyegBwqX9QvW5oOtzoSbBhqqjkZOs5rl7GNp0bBPOwQhDJ75+qI6HFAFhnsHDPxIDAmc
 MS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4Ur5FuAMtA6xVJsN+nl3/RAKHtJZB/dEjqv/D42SDM=;
 b=pJAUYxC661qcCd2u3YjBZFrLk/ZIgn6uesPGpHoxv4YWx9Uk1gdTOCbqYSRTUm6/3g
 /AZOQoMCGGJ1tJHpqcNaGLWFLe9dBRVcxmYye8S+lAJItWk6FNfcTHhyLeYYrnJuguyF
 2+9cr2VL1IHJcovSNoWd3rSxc2mMpz1td6tRAK9JyzPms0g0K1vE1IsVssYwZwYRvbko
 ku7HjOb7OPxu8MdCYenajPKEvomWL4E3fxSi+Ke4KrqqfoT7U1ihNpjcWLSQ2xT3AHa+
 g0iMhF3WW58LHogmy3tkgV4LkD0oOnGJqZmInixjWqIkltRckh/eqc6PQ50VcKeHiFu5
 zIkA==
X-Gm-Message-State: AOAM531J8h5D7s+W1AmaXq5wMX/qYt6FokBmajjIkHNSKPieaPmRsTPf
 XquA/9kcJDoPQZW0pd+J4rJH8x5Y93yw+ZSix7a9hw==
X-Google-Smtp-Source: ABdhPJyIwwxPJ6LcuXM9IBchpQCcd3b56k+vDKmb4JRXyHcSQ1I6icydynMFl1ioG+SUrUV6KnvsJSVwMsPbpOLncK4=
X-Received: by 2002:a05:6000:18e:b0:207:a221:302c with SMTP id
 p14-20020a056000018e00b00207a221302cmr14318339wrx.120.1649840761707; Wed, 13
 Apr 2022 02:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-3-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-3-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:05:50 +0200
Message-ID: <CAAeLtUAiF+d5Yj0Dak-hiCZVGe1zSU0k=E630n_BOXkutg6jZw@mail.gmail.com>
Subject: Re: [PATCH v9 02/12] riscv: allow different stages with alternatives
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
X-CRM114-CacheID: sfid-20220413_020603_903841_B44A73E3 
X-CRM114-Status: UNSURE (   7.20  )
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
> Future features may need to be applied at a different
> time during boot, so allow defining stages for alternatives
> and handling them differently depending on the stage.
>
> Also make the alternatives-location more flexible so that
> future stages may provide their own location.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
