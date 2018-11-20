Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD79C41536
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 17:46:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E518520684
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 17:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ESAUiRLm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CGbDhYnl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mL5lGmKn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E518520684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4twAxB0TalmCiWgUVkuZ3PvOzDLPft8Hk8mly0ovcKI=; b=ESAUiRLm+eQ43YiNygmQa87/n
	qHr3z/AzH10PN/FUg4SODMmxE4+EzY3pU1H6hsWNwE/nDKCAsOQ7gn44jm2X7SN8qNXEpdIb0i4uZ
	UB0H0DszN/p2NxmaFcZku2SocM1zJ7ZlJW0k4rUvkh17YisBvvgQPbv3cYqiBv2qt5N9eHNCY43cI
	5xFAoln1s7AFISlfEWVPsSEDudUh5IjJrwwxrziAMoMnxphaS03A5eT4GvdEGnBuHx0VU7j3Vtjun
	4OZB3/FkuY5EsnCY00R9ZQqKGsfrIPvz7wQks5cWkPd4K0KD0xZy/hjQL5XQFkQkL+j5I1V8Tfk83
	1oMQqD9VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPA62-0000il-1m; Tue, 20 Nov 2018 17:45:58 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPA5u-0008Ej-MF
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 17:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZUZu1XwZ8f7g6NqpBSd3lwgL1/UqWz9FgIimF7IiiBU=; b=CGbDhYnlsp9XaSzmUKWYp47aif
 rY9gcyx5+VKJywofYG6b5uqVxNQihOuxMLSCwJ6/cfa8p8MRkHwoJbXw7I7NvhswhpjnfiO7Cp1bQ
 kXSuSOPJrLs1Oeks2OC94lAxgrT/kmesZqRIAiLKxNwEDCbXiUwy9mkcMMnLvNqEKmj7i86cLEy4A
 ryvPAUnAtoxZgtXUK/NGgg79FVCnmSfu8+0W/pJ6t1zKENTno7uAMKtvgiOjMnKvjGWmGt+d5uz+7
 b84wxAIDxMUUd2TpBgAvD4B/qDOdZu5A72n57lTx+JpLqV+gf9D65iJTRtdZbTxhmN9UIVT3rumCm
 edMijfkg==;
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP9ra-0002OQ-PT
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 17:31:04 +0000
Received: by mail-pl1-x641.google.com with SMTP id u6so1320003plm.8
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 09:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUZu1XwZ8f7g6NqpBSd3lwgL1/UqWz9FgIimF7IiiBU=;
 b=mL5lGmKnmVqKTv+RoxLHuXmZVppJcsdNOft5F5ISDYcBmW4G+R/AwJfXd8KpXg2q+T
 guUtaHQaHlcq7x7PulayiauXMYWRr67bROQzwflJoA7emOAxvpJHgq2qUAGtdmuQwOCO
 +2vLPJl1cFch16mXDDOJqWaA+Ks8akJPclCAsF5okIhEHYVkobwN0A6EI5At2CvFZIM/
 iLvzvwkRF7NB3Hn9fBtr+XeUchUKv9gc9Maa4hqqbaBRaMECZsvr2j9XBXd8h4TfWI+j
 //SZIZfUNNFysnkjoJNVUHbX8xEay4AMtb8dMdBm0SNNDoZTVPc16GWpfbKZErO5r/R+
 R0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZUZu1XwZ8f7g6NqpBSd3lwgL1/UqWz9FgIimF7IiiBU=;
 b=kTseMPDQVwi9FX8f3jiDzYK5mpAob6XheXv5kTmj5HnSvoqN8BHzuT802VdslhSEA8
 ImU629PXd7hUK2YdtodWVSyxZ8Quds4uSpiIv9+RvUJ9J4CEJH4dkeZmMj+4JMoCYJgL
 kZvOw58/k0sZsq0hMrISm49nzoH/1wYCOlTc22C3gK7jdVi5HtnJa+Xo6pcaUzYl/Dop
 zSHeI+60ZJx7r+rzoFmTtyfnbOF5u/BCANHecUX3P+ZLNcKdxD1aqpXe+47LnEKgwo3h
 kT/myoo3fO7mkVrn9b9PfzB4TxfxM3QDIJhuD8lF4FPH9nU7GBjjBGfjMKezmZIUsC7U
 c5CQ==
X-Gm-Message-State: AA+aEWajHJZcbnHa3OchHtPb1/ZDFO3ai6+x+RMeOW4luybglBqVJGdW
 1JKbaL/c25pD3y0ea1E789cjdg==
X-Google-Smtp-Source: AFSGD/VUg0xRNh0DS+Ae1OGZam8imMIpsFVGVpUksfK7DwpMpJ+fde/Ext79VjmiqpKFGbFfmNOPHw==
X-Received: by 2002:a17:902:b611:: with SMTP id
 b17-v6mr3169581pls.31.1542734991154; 
 Tue, 20 Nov 2018 09:29:51 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g5sm42969593pgu.57.2018.11.20.09.29.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 09:29:50 -0800 (PST)
Date: Tue, 20 Nov 2018 09:29:50 -0800 (PST)
X-Google-Original-Date: Tue, 20 Nov 2018 09:29:31 PST (-0800)
Subject: Re: [PATCH] RISC-V: add of_node_put()
In-Reply-To: <20181120141102.20534-1-tiny.windzz@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: tiny.windzz@gmail.com
Message-ID: <mhng-f6900077-f39d-46e8-8fce-e5f7af872ced@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_173102_820570_06F55DD1 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, dmitriy@oss-tech.org, tiny.windzz@gmail.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120172950.EVCekbNK_nAZ3KP8F2R5GXMB_pRE_YjwEgM1iq9vLek@z>

On Tue, 20 Nov 2018 06:11:02 PST (-0800), tiny.windzz@gmail.com wrote:
> use of_node_put() to release the refcount.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  arch/riscv/kernel/time.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 1911c8f6b8a6..40470e669a35 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -26,6 +26,7 @@ void __init time_init(void)
>  	cpu = of_find_node_by_path("/cpus");
>  	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
>  		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> +	of_node_put(cpu);
>  	riscv_timebase = prop;
>
>  	lpj_fine = riscv_timebase / HZ;

Thanks.  I'm going to target this for next week's PR.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
