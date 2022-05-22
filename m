Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE14C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBZty1keyAzSG1mykKz2FqvyYD6jF0De6pdb/DF6RoI=; b=xn6rXUfirTATsR
	AZ2xGf5t7VSqGOnilSzD3BPBmopWFF4OgqYFGaO6+mySNICjyjk5QyXgirjd55TchMQuGKCOnhMUd
	XYVszcZaGE0bADBbaz8EilwdhDZBmhEkSsPwwYIqAGOAYNRnfLPJy6EWWd9VqLN7YyQ7EN8Co8S0V
	9HUreavZ8G41yoM4OZnQN7ayZymkIeGGJwWU/eo3QzR0l7ZbxERY0xY/Il5uu0gTnroGB5b2hfGkI
	IJUGNLAXLgi7qD0+/g6HtfQoyhdEe32XHAh0ZYiTblaLrFQhtZHudcZDROCjzGx94vfya9otyCtoD
	7WfDTv3wPSp+rOmWcX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3gu-002Xgd-VO; Mon, 23 May 2022 08:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt33U-002H3a-39
 for linux-riscv@bombadil.infradead.org; Mon, 23 May 2022 08:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OpzbHgH536qvvso8nHRdp83iD1CHXw2nkTEr7wls1Q0=; b=XbOS2/hIJL65n6DAxwOwBa/Yx6
 7hHii8IWjRXtBzpz8CD6aXK6DmgSLe4PRfWZMQ5UFqzJ71iCfki5zlwmfTudi+wXbsPTNQD3/+yQx
 azhoOrzTI9OdqXaUfLjYScOGI3UheFAFe7NhtayopHyNJqDH/B0/13NMNd1G5FWCWVMp8CRXWn9ZY
 QvmKvbypmUcsoxPmKz/NlJq90zGPYsNDWZGBDhI63MuO+rpJ1fTMl+rId2bwL+U79e2ZiLfwFemi/
 kTgucf6bUCNOdJEREYhtTkswRg8wes+CO6iVWjhDdUdCpHie/BbkTYHGkMv9IsP1ocRoIB3wpxm/Y
 xixRdU1A==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsrzG-000cCS-Nc
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 20:15:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id f9so24917934ejc.0
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OpzbHgH536qvvso8nHRdp83iD1CHXw2nkTEr7wls1Q0=;
 b=6nGbt3awrMH1pvnqrHq1mc3E5sd2FK6KeJ/MlsdnrBXjODFn0wt+SA7+RQSAQp+WA3
 r8s8xHLgnmB5ghMBS7/6tEYcS5FEPfQD8VqxMQF0DT7/obAYsVUhXiI/GcMwZ6T20GZi
 LNb11KDw3RUakcFtmz5EEjh+q6LxaXxgtrwP8r9THvlrABBF+VM8sypIhiD7hshE5n6Y
 GL/mrX/+vbB4cmANUE5Ll8f7n8xqSeDBo9kjbktGZimj102mH2uXxFUuxHyp41alJsXf
 +t6oaLNU6xgXJF2e3JSzju0N1JHwRkOBzeLU5G1iv3eABFTGFAT3Xw4YXkS4WNSStGuV
 ugLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpzbHgH536qvvso8nHRdp83iD1CHXw2nkTEr7wls1Q0=;
 b=OzS1x1NAMB/0HcjTuaD1Kalw2HH0AImX+wH2MmXkwcaL3lsBldWp9vY34AUgIEBZyF
 dGYaxNHwzN0LYToVbh1AA34O+h+ulgMbkeRXYZQlrQtwbX0+OSJKdNvHpyR17rtclJ93
 yrBJbZnyWl4THZ8RiUZ+mPrgG6jNqS5a2/lztSNvvSllyv5sAYIr1FHkZxijtq1p5igr
 hjlbHUf4Xvm9JzVIUabtAL0mHZPtfcUuaNBntENPFM6oowxQ5MSG1WlXNE4S+1c+K1rJ
 jKgYRgNedOOC0/XEiBNdJlubGAov4VOadnHyV7uw+DXpgtNt613miFKKZIh7blSk9Rn1
 qehw==
X-Gm-Message-State: AOAM531eSeaTFwGfLlNIbR9RzOrBUMYER9gOCypwLQW9CjQzytABFLkR
 4e/kttqFbOaBFF8HJATG/iaPT/TMXC4VcFIgZPGXiw==
X-Google-Smtp-Source: ABdhPJxYuVG1TaflrhFCdv4pTHDcixd6ZXCps1dkNigoWccxm378qOu6FSEC8rD33asST84y8ugHUZ1ip+fPOWHHT+A=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr16517780ejc.101.1653250416319; Sun, 22
 May 2022 13:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
In-Reply-To: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 22 May 2022 22:13:25 +0200
Message-ID: <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_211540_908038_4759B272 
X-CRM114-Status: GOOD (  11.57  )
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

On Fri, May 20, 2022 at 12:23 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
>
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the dwapb driver immutable.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---

Hi Geert!

I'll pick those patches up for the next cycle to let them spend some
time in next.

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
