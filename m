Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3560C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uoun2PW/wihS82DOntDl0Ed8mDtUyGdxnEfm9shhvLU=; b=2JUe3T79awr9xm
	DyF8WrSF8vuRAcDLWfb2wx0o/rzOfP1O423MucKSRbMZcpDjY3hFL8/sT3ptpBcJMM1V2fVY7ueP+
	UmdhMIlV7vWsY5fmh5wwm3STBJ5ZD0wYIk2ionqaaIAUSEI9IylDppFoIkFANb9/JnfPgWpgGfgT0
	cuOa9PjN5PJCEemqTfG1lJyE6+D/90uLiEGeLaZyZiC2Jm9Z2gKH4W6TAaibcKrZ+HgC7OPkFTj0G
	zBmVEgrBoEh84YihIK9EEtiuXn8KWzM+tAmLaAaYuenXixQNsB7zigobraySAQGd7sHnDkjAa+EDv
	Brf6pZauluyFAfhndGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ0m9-00AfOk-5C; Tue, 29 Mar 2022 01:36:01 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ0m6-00AfN2-Ms
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 01:35:59 +0000
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e612af95e3so168107717b3.9
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 18:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ehNPWSEgPJrOTf7/Wp6gE2/wrCtVHAQ8IcovXGy9V4U=;
 b=H5WsehtZRcaN9DToOC1NzmwrFFT04PXuDP2xFaJ8eCuDAHHH4EYnTJ6pE1jw0ONRKc
 mU1qfZiLfIRUaQhSw7lbQ0oqBJpxRoFF1tlnlWpTyWSQ1FbNoJyS7Xl7B0ZsWlKIYc12
 ANPGXdBv3fzVx8wzgZ5yO9bsFd56XOQSe8G+G2wJqvYqb5LeUbKTfP4H4/kSew2XBFPT
 fz3aA4rGZlUuZUj4FWlDyE56sUlqsZNLYkUrUpIdLqn/iNUZwYNhrQN7QiMHBbwrdqo3
 yKG107IkbazMCEeqBCduCZadZ0aEBeKeu17nigLd3bS5H1rF3UaCffyPR2DIDmuIYKLK
 PP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehNPWSEgPJrOTf7/Wp6gE2/wrCtVHAQ8IcovXGy9V4U=;
 b=RqEz3k/Qvzyon1XVoRdSPgVqeClChzvQmniaDfS+chIrOHHaW/sPuwrNhmtjJ3tQ7N
 N2fC4J7ISv/BkR+zMB4hxYuMAJmIreMHxVFZsgcYfaZXaUzKwzpORKcxtUv+knydXZ6K
 quxzWSr2KgJ2TkgUbg/b2U8z9vxnFc+/WS3GxQ3vLeLvCTWEgf6oAMRyrAfRILtwFQ4o
 tcfwMOCgo7od+GN7TS7SRaiwTuBNYusl85QzHs8vCeHMyUKF7vTislb6Amiw3KenkVPN
 zcSbSujI1a4ePSydgfy2tSQZYr4356SY/HUhxz4lPA+jCoz0MB18KZMtr29Ro18Zwrur
 ApFA==
X-Gm-Message-State: AOAM532XkWTy6aKk8sB9hzlgx8+dgh4IH4MSX7rTSyGS6UHjy/77Y7tK
 vJL2ObQR8sLDaUYVgvGO31Yka2qx8QMK3eP1e2A=
X-Google-Smtp-Source: ABdhPJykJRyB+9MTMv00Xj1zdaq2+PZt+stBz9dbr6ukPhkeZu2oA9lSjQ2CLNMKCbl4bgPiJAYvCWQOQ2Jj/+L0EHs=
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr28536934ywb.132.1648517757742; Mon, 28
 Mar 2022 18:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com>
 <edd72c0cca1ebceddc032ff6ec2284e3f48c5ad3.1648461096.git.zong.li@sifive.com>
In-Reply-To: <edd72c0cca1ebceddc032ff6ec2284e3f48c5ad3.1648461096.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Mar 2022 09:35:46 +0800
Message-ID: <CAEUhbmXoaCXqvOAfLWavG8rvN7-rt=YOZys-ffYti0Wmtvc6XQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] riscv: dts: rename the node name of dma
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 krzysztof.kozlowski@canonical.com, Conor Dooley <conor.dooley@microchip.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, vkoul@kernel.org, dmaengine@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_183558_769242_8498EAE0 
X-CRM114-Status: UNSURE (   9.45  )
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

On Tue, Mar 29, 2022 at 6:27 AM Zong Li <zong.li@sifive.com> wrote:
>
> Rename the node name by the generic DMA naming
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> CC: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
