Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A09C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 01:06:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5E6204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 01:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p1cvr1mk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCjYjmya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E5E6204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lAyRDG87mZiusIfR+en8pEeYJ+OEuzefmqeC3AxkC5k=; b=p1cvr1mkfrLL/AN8xLKPNbEuH+
	4/V/z2j/eTEJWyXmlKhFPJ9KGamQbbrBTAl7MdtxDndtu8ZU/ysjePVQcD1Q0z1ORuMknGfC8BmKY
	Hhy+VS8+kxYtjwo4sgfULGBvIEsOxNDVuhH2/5pdfk9fNOS+HCIg70h/p5DzGBMaKs0EuNQ+EWRvp
	GKputjmmJTQ+hMQKc2GRKvj7T6egMYgYe6AU79v8n6imhdVSqaYQcDEldmWO2q4YAUk6tZcsneXeg
	8jl0XrM8VYk0E28Wq1npadxK50mpgL15TUKA3Uh9ae/j/e5goTxWqvie5mUXkOtG7nCYSxuvOEPrz
	k30fbEFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxLGg-0004jf-QE; Tue, 13 Aug 2019 01:06:30 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxLGd-0004ih-QC
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 01:06:29 +0000
Received: by mail-ed1-x544.google.com with SMTP id e16so12203673edv.6
 for <linux-riscv@lists.infradead.org>; Mon, 12 Aug 2019 18:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=j4lyVR+ucz/sNBr6Uuq/ocVwe18iA7ulKcx4G6tyoUE=;
 b=aCjYjmyaMNiomMMaGaGZsCa62g2hyeAOyf4+2CRXxLKdO598HULUn8YNFrJTTUGusc
 kXW87UlSSFlzLpCEV51d+04lZjFLfEBKoyqi3lu6ksn4d2VjzF5Kb11SF2pdO8VeJdR2
 4BMbp58YdFPYsKOJWfrJ80BVjhpJr49nM9GyBIdgB94I3PVPNf23Ks9MSEXz9+vP2lKq
 nm3YiOXFHkvcK9yem2tMkAuvQi1nLZ7fh64Tgz6sLH159VIieKLvlSSzZwr3mC2EEvdw
 Ep93Kgjgepi5Iw3o52lvnHdOLcBzSaBtPU3bEFjC4IltK5Z6YeeqS3Q/dK2yDtzpJ+SE
 BDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=j4lyVR+ucz/sNBr6Uuq/ocVwe18iA7ulKcx4G6tyoUE=;
 b=NA/WPR5AnmRVNC5Yp4WS1un8JcMUj7X1Go/4IQ6NbhIhBG7ZkCh5JopXYz2IP61dSn
 LqXwi/gQQFMUd4VvMiEpmyHtSR8trjJPGesgR0AuLvNoYIUEK1eYWRKi9xAIFxnujoiS
 YjZyls5CfhelbiVe4OBM89SQOkApQZbjZCRiHlramIufsFHZ+/hnCgvkJxzup9qbHvN7
 bahm+dZtfyE3Bj2+Yk+WqHQpm/SToi1e5qlt+NEFYRZ9KgPnqqWk+Xajv/Dr19ES/KPX
 /26YQ3/g90dRCKD83/Ezz0ASWMiWgpqbNesALD6Z48/OnX3cKTHLLA2h4IjzGZiSZAST
 HX8Q==
X-Gm-Message-State: APjAAAXlOuhzl4MZyyoG5qx3qEnkSnj19oF66nex2/F9us1eCl4pq1tn
 IKtUBZ3CxxTpE9GLKgT8kkDcHywOqA6jeifL5k4=
X-Google-Smtp-Source: APXvYqxsCrHWWrWMc4dJWpWtHfMOKBXzWhxk9gpd3SLhKDy3qkruMVroVvkOqFD5XJJ7cCViAlN4JWxSZi5PS7T4pm4=
X-Received: by 2002:a50:8687:: with SMTP id r7mr21038172eda.137.1565658385191; 
 Mon, 12 Aug 2019 18:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Aug 2019 09:06:14 +0800
Message-ID: <CAEUhbmVo9vNsKBD9oA3XtA07jr24PqKFYsEmGeKwLH6WaQdgsQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to
 cpu0/cpu1 nodes
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_180627_875706_B2B975E4 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 7, 2019 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
> for consistency with other cpu nodes.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>

ping

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
