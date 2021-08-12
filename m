Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B8EC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 10:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3D360F57
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 10:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D3D360F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb0sTYfblXciNnX7fhcPzIqKqDCx7Si5hEi4iQm1o40=; b=w4k+wIkGg/WFsM
	+f7ORCTU9KwJCUforMCSEr28XXz99lM1ajN51eVhaBFdunMHF6mKgwOIjXFcUXXp9nem9iXV+/WhT
	Y2WEiHdJz0j6JuGt90En/NvYYppBQV4SixYZt9GW8CJruhv1u8JyKWcBx8J2NRdvYiG+V9KIZfLfH
	S89tM6/WtDkbjSERmhOY/pX9ukTP9WfDPJ8An5I9nFMcKdERAAzHijunJHUqZpbrj+RYO9c8aEzTb
	9nMbnFOrAseLRpG2Ij0D5Pxhaxs9sv8wDakLozOOUQ5mL+eIsOtMAvBWI5DIzovoElTjauXGaKCpV
	TX8DXD9oPZWI8dKmYZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE7ne-009ebf-QY; Thu, 12 Aug 2021 10:18:58 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE7nb-009eaQ-VO
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 10:18:57 +0000
Received: by mail-ej1-f52.google.com with SMTP id h9so10538218ejs.4
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 03:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=jlLf7LVJcFztLZ92Y0qUp+62Jebh0x2mMopBOsuvZCM=;
 b=tGnwZmvoPw40FYki1yxjiGB3wOmU3Gc4MgwW4UY0lbuwjh47Xs+Aslx2egEqgAc+2P
 /pCkQNGoAMxohIhAw8Q+hPwAm5CScqh94M9hiNrbYYVee0GuWjXAi8ctX+RbxhkRUhUm
 mA1N6M35gA57UYc8G3cmM4flh1fQhwONKAcTnMbmuuPFbpmkFqIs6dPdVigelxmvv2A5
 g8uV9KSGgh0umyua/cl2oZU5RRZbYI/0T9WwUzbZL6TYd43laeKmfZgWKMyCuG13VEUW
 0Jp6QmYp8d+ElPaLQehEUvW/invXbpjuRV2MC/auCYANIq+0nAt1zBRSkd+ONZD4l3h7
 gXeQ==
X-Gm-Message-State: AOAM5320vsnTIaZo2SOx2T+3tSkG6PP397tRU8DsiK/gdaXvYZ04YMRa
 XASXhQvb//OzGeL0/DuxB/o=
X-Google-Smtp-Source: ABdhPJxrojONErshEKQ2stXf5CAL+MErvhdOhsoNga4qy9qKlhoYnj3TD0k5G0P/u2bfvRsreyJNMQ==
X-Received: by 2002:a17:906:6d85:: with SMTP id
 h5mr2905829ejt.305.1628763523696; 
 Thu, 12 Aug 2021 03:18:43 -0700 (PDT)
Received: from localhost (host-87-19-134-225.retail.telecomitalia.it.
 [87.19.134.225])
 by smtp.gmail.com with ESMTPSA id a60sm912472edf.59.2021.08.12.03.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:18:43 -0700 (PDT)
Date: Thu, 12 Aug 2021 12:18:35 +0200
From: Matteo Croce <mcroce@linux.microsoft.com>
To: Eric Dumazet <eric.dumazet@gmail.com>, Marc Zyngier <maz@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Jon Hunter <jonathanh@nvidia.com>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH net-next] stmmac: align RX buffers
Message-ID: <20210812121835.405d2e37@linux.microsoft.com>
In-Reply-To: <fe5f99c8-5655-7fbb-a64e-b5f067c3273c@gmail.com>
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <871r71azjw.wl-maz@kernel.org> <YROmOQ+4Kqukgd6z@orome.fritz.box>
 <202417ef-f8ae-895d-4d07-1f9f3d89b4a4@gmail.com>
 <87o8a49idp.wl-maz@kernel.org>
 <fe5f99c8-5655-7fbb-a64e-b5f067c3273c@gmail.com>
Organization: Microsoft
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_031856_067954_A359265C 
X-CRM114-Status: GOOD (  26.31  )
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

On Thu, 12 Aug 2021 10:48:03 +0200
Eric Dumazet <eric.dumazet@gmail.com> wrote:

> 
> 
> On 8/11/21 4:16 PM, Marc Zyngier wrote:
> > On Wed, 11 Aug 2021 13:53:59 +0100,
> > Eric Dumazet <eric.dumazet@gmail.com> wrote:
> >
> >> Are you sure you do not need to adjust stmmac_set_bfsize(), 
> >> stmmac_rx_buf1_len() and stmmac_rx_buf2_len() ?
> >>
> >> Presumably DEFAULT_BUFSIZE also want to be increased by NET_SKB_PAD
> >>
> >> Patch for stmmac_rx_buf1_len() :
> >>
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c index
> >> 7b8404a21544cf29668e8a14240c3971e6bce0c3..041a74e7efca3436bfe3e17f972dd156173957a9
> >> 100644 --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c +++
> >> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c @@ -4508,12
> >> +4508,12 @@ static unsigned int stmmac_rx_buf1_len(struct
> >> stmmac_priv *priv, /* First descriptor, not last descriptor and
> >> not split header */ if (status & rx_not_ls)
> >> -               return priv->dma_buf_sz;
> >> +               return priv->dma_buf_sz - NET_SKB_PAD -
> >> NET_IP_ALIGN; 
> >>         plen = stmmac_get_rx_frame_len(priv, p, coe);
> >>  
> >>         /* First descriptor and last descriptor and not split
> >> header */
> >> -       return min_t(unsigned int, priv->dma_buf_sz, plen);
> >> +       return min_t(unsigned int, priv->dma_buf_sz - NET_SKB_PAD
> >> - NET_IP_ALIGN, plen); }
> >>  
> >>  static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
> > 
> > Feels like a major deficiency of the original patch. Happy to test a
> > more complete patch if/when you have one.
> 
> I wont have time in the immediate future.
> 
> Matteo, if you do not work on a fix, I suggest we revert
>  a955318fe67ec0d962760b5ee58e74bffaf649b8 stmmac: align RX buffers
> 
> before a more polished version can be submitted.
> 

Better to use stmmac_rx_offset() so to have the correct length when
using XDP. Also, when XDP is enabled, the offset was
XDP_PACKET_HEADROOM (i.e. 256 bytes) even before the change, so it
could be already broken. Mark, can you try on the Jetson TX2 by
attaching an XDP program and see if it works without my change?

A possible fix, which takes in account also the XDP headroom for
stmmac_rx_buf1_len() only could be (only compile tested, I don't have
the hardware now):

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b8404a21544..b205f43f849a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -93,7 +93,7 @@ static int tc = TC_DEFAULT;
 module_param(tc, int, 0644);
 MODULE_PARM_DESC(tc, "DMA threshold control value");
 
-#define	DEFAULT_BUFSIZE	1536
+#define	DEFAULT_BUFSIZE	1536 + XDP_PACKET_HEADROOM + NET_IP_ALIGN
 static int buf_sz = DEFAULT_BUFSIZE;
 module_param(buf_sz, int, 0644);
 MODULE_PARM_DESC(buf_sz, "DMA buffer size");
@@ -4508,12 +4508,12 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 
 	/* First descriptor, not last descriptor and not split header */
 	if (status & rx_not_ls)
-		return priv->dma_buf_sz;
+		return priv->dma_buf_sz - stmmac_rx_offset(priv);
 
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
 	/* First descriptor and last descriptor and not split header */
-	return min_t(unsigned int, priv->dma_buf_sz, plen);
+	return min_t(unsigned int, priv->dma_buf_sz - stmmac_rx_offset(priv), plen);
 }
 
 static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,


-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
