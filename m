Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AE8C43217
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Nov 2022 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpquQfLUtNtFYEqyQr+Jx1fXX3gaAENqHh/ak1w38EU=; b=eY5FZaAlvMESOe
	S41yXyY1GsXp0TffzJf0i6MSMLsciyDhKh8HwpeX8JTDAxOjp9RU+ujtZKtMlSCp1A2Ij7AU7BH8r
	04QZKioZTqTMXVovxj1VHYFLns+xtxVSyDw5eplEpnE+H5rxau/VyQoTpO6h34l7/ARRunrmrqmFa
	pTIFWv/JTR00KJPUfNDgedcmANDnXvREkp58CeuIC2d4QO6Igz5D4oqkmhhNKivh9ZoZPdrW4ayjl
	7EiRkn+TdwJ8UMsagigf/5KcFz34PHctiTE6gzQa8hv3x3rFrxkwK3gAOIeaVbgJy5NClzgUSO4ID
	rzPLW0BVYG7Ta00HT74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oreO3-008AG1-9U; Sun, 06 Nov 2022 12:04:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oreO0-008ADx-KS
	for linux-riscv@lists.infradead.org; Sun, 06 Nov 2022 12:04:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id z26so8306356pff.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 04:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WHoM4Iu4fJxp7HgcJoBzK0BlZg2s5EfrY+4N37pGSY=;
        b=Dgepef9Ywlk+Bne97k4KA0Ls1tS+uiI7lvEMTzRG45yu5TaYWrohbVnbOb6yw9Vx+B
         HnvuocWSr6F+xShFbxHBZTJki9hNrS+1n3dkTjUPgE8jRCkJmgoiZgxZ7LtyFO6QQkfF
         KOFdpJziTjOl8ub7InvS3lJjaBdCvIppAVbPgOCE5F6wuPXjWVDcTRxgeI72BdMyM90T
         /9cox17jsFfvAPfTuDllejwMwf5867E6hB+6LV4qXNBC4nNHpw1IGQ0kEeTeBo36L6XA
         ntzh6z5P1Znw5CwEZfIlFPndvJuLCwWQrY8eKKEZup9PSdGN1boS29vlSeNy0bQgjZOH
         lIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WHoM4Iu4fJxp7HgcJoBzK0BlZg2s5EfrY+4N37pGSY=;
        b=tx4f0+QnvvJZI3/H0YYW8FljFoUbVEPitcGo2KDdORNfQWt1Wkess1NWOPL81AquTZ
         D3GME3buyRYFAmVRC/OrU59w17N6FO1aYQlhoAFK473jJK0Lg3FeF/aadc1K+4NS8sAv
         YEPa5f6koKRms4j4ftBdJaUAIAIUgmD+EgZkRV2esYTwGZyCGffTH3BrKoE6hiqNZ4lL
         7ARzod4GZCrZAfneLQQcRFbxUGbrrbHXC9OHE4DkKe331a67IAijFzNLu2pYbzuADnej
         stfGvTxj1Ur/iOVRNCkwFjfaoNm6mo/vgqrXDDcYmZ6bi8TtIxZextE35/uOa+sTFpth
         BA2w==
X-Gm-Message-State: ACrzQf27935u6nc2gwQMnslYLrfxTkIJBHkrKx9nDS+sfrDa27VzPdRb
	S3He1k91RRADw8HmPnxnKYY=
X-Google-Smtp-Source: AMsMyM7KMlfHuBbOBAmRlK/2wwFT5NvjeQ+Gnze8bJIrH/qSzi9yTEp+tAwE1ocYNzW9o6nxzhkapQ==
X-Received: by 2002:a63:6c8a:0:b0:46f:c6e0:8ee9 with SMTP id h132-20020a636c8a000000b0046fc6e08ee9mr29630094pgc.493.1667736255755;
        Sun, 06 Nov 2022 04:04:15 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902c40500b001886ff822ffsm2993075plk.186.2022.11.06.04.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 04:04:15 -0800 (PST)
Message-ID: <07e0949f-fa9f-e4f8-2891-aaf9f84ede7c@gmail.com>
Date: Sun, 6 Nov 2022 21:04:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: alexandre.ghiti@canonical.com, aou@eecs.berkeley.edu, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, Akira Yokosawa <akiyks@gmail.com>
References: <20221106100239.53704-1-bagasdotme@gmail.com>
Subject: Re: [PATCH] Documentation: riscv: tableize memory layout
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221106100239.53704-1-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_040424_712326_C823160C 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi Bagas,

On Sun,  6 Nov 2022 17:02:40 +0700, Bagas Sanjaya wrote:
> The memory layout is written as table but it is inside literal code
> block, which renders as preformatted text. Write the layout in reST
> grid table instead.

What's the purpose of this change?

The tables in html/pdf output after this change are almost unreadable
to my eyes due to the proportional font and random wrapping inside
table columns.

I think in this particular case, "literal block" is the right
choice at least for html output, as can be seen at:

   https://www.kernel.org/doc/html/latest/riscv/vm-layout.html
   https://www.kernel.org/doc/html/next/riscv/vm-layout.html

Yes, these very wide tables need horizontal scrolling in the alabaster
theme (in next), but they look much nicer than your version.

In pdf output, wide literal blocks are force-wrapped and don't look good.
Using some smaller font size for latex might help, but most people don't
care much of pdf outputs anyway, I guess.

        Thanks, Akira
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/riscv/vm-layout.rst | 120 +++++++++++++++---------------
>  1 file changed, 58 insertions(+), 62 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
