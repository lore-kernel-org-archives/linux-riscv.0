Return-Path: <SRS0=RRT7=FT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D126C4361B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 17:01:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E120422515
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 17:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E120422515
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ewr9vGevg7EP1JN9h9ahYARrLXw4REKu2rTg4crrFA8=; b=xo/6TawRsr1BKVdwKb4su1Vb9
	mJfgzM/gcfzzKZ/kYawFWRnam9agvuAFpO40ni6i/QUoTcjCiObRuyikkIJZ8VzCD9Lz0WsJcjpc9
	IXYciCfezYsLLJ5pny9VS+wogL7kUuQDP5l1m3+RZvMWENl1JaJNnJcZtgMduw1YCePptRppVkbSM
	4A4xr9aK2dFkBB+wVQ+UV7p+jDTv2+E+hzq70w8dd1vcB6axQgVxmEBoE0rlh+kyTBVXg34RklRyN
	Pdk0yy/i7uUY2y3x8h1NzqN+tog5oyffX7pHz9PzNbD6h0YyMp+cn6T6SBhcnqV5JmzeymG/nXf5o
	JLtdAcShw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpDh7-0001wn-QU; Tue, 15 Dec 2020 17:01:01 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpDh5-0001vW-IS
 for linux-riscv@lists.infradead.org; Tue, 15 Dec 2020 17:01:00 +0000
Received: by mail-oi1-f194.google.com with SMTP id q25so24053057oij.10
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 09:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X8gCJMjUmleKLa/nPoLv/63eSrzRGptbGJqEgfH+stU=;
 b=YM2rVrpbMpfksa90qeHZB+4Xp1gGIl0HO1fcyjPfo4wHxJGFR+pNtmKvr2UpcdYySs
 Q8ivuyCbJionzxEis6g6yFxEZpoDmhgcbr91FPVUQganXsPbWbAaBf8pBSUGZDgkBb4X
 yJbtl+RGKSIA5AAQG14/EiEEkokuYzI71zWlTDVsoAMqzzJUrKQ3xPEoOsgr8h4bR3VF
 UaKavSfucNQ2BfZHFxK1LTYimNpq8QiSec2OkoKBCxTbtJaNzCur3KduVeewudeig7aD
 3RvPYXMHV8uzExbgPNlzjBvqk5AyYv0rOCW8+mlt2kQT0YwNpMpEJ56JH7UEuQj28FsB
 F4UQ==
X-Gm-Message-State: AOAM5334+tigzPJqrEyE9xx4kkifnnzBBKnWmvJJ9mDaZI+0qxBhvDhu
 E/cAIQY4uPUKDaSXZvmrpA==
X-Google-Smtp-Source: ABdhPJxBKssZb6QQehemTtLam4Yhhb6MzbIdTgEOXl9dxsoqsQm/sUt/QY7L3oNjBwyYbVfUOyty4g==
X-Received: by 2002:aca:75cc:: with SMTP id q195mr999080oic.173.1608051658841; 
 Tue, 15 Dec 2020 09:00:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q77sm4770421ooq.15.2020.12.15.09.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:00:57 -0800 (PST)
Received: (nullmailer pid 4025072 invoked by uid 1000);
 Tue, 15 Dec 2020 17:00:56 -0000
Date: Tue, 15 Dec 2020 11:00:56 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v10 12/23] dt-binding: mfd: Document canaan,k210-sysctl
 bindings
Message-ID: <20201215170056.GA4025018@robh.at.kernel.org>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-13-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201213135056.24446-13-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_120059_698817_08E1F55A 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 13 Dec 2020 22:50:45 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC
> system controller driver in
> Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/canaan,k210-sysctl.yaml      | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
