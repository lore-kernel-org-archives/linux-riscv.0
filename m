Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF911C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuAChNdPcv72sZJvC5FCn3Wg0d/pf3LfzwfOTX2pLuo=; b=3QbO014w6QFonP
	R0hu/caDPny7981jzXDgnzZfAsbBatTkfUsTZ2Va3P/xvMEKTm6xVhMnlJYU4w86n+aCz26VJm2Af
	O70vw/RprSX2bqxEVpgu7ZvVghhSuyaAWs37FhjHA7gjeJASfxqphlazKbWOndSrXEluHxSuKZe8Y
	QgrlxDp+X/bt28pfff5XaOLyYMGWbZVncg7GYbcKqqsQmITRfCek1iBJOx0MLt93HtSLsdk/pbmx6
	I8+rUGFQJrOTnVMj015la/VrVL36cBPMQLm9c+2H6lJe6lJZRrvSELa6K1YYuLY3M/sJsHnC/NZ5a
	mxnaCMRV4s/Ws7SSc+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppxXO-00BogI-0l;
	Fri, 21 Apr 2023 20:39:22 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppxXK-00BofV-0x
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 20:39:19 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id C3FEF3200B68;
	Fri, 21 Apr 2023 16:39:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 21 Apr 2023 16:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682109553; x=1682195953; bh=G5
	baiNIip/EtCwDIuLtcOUpxLQymRj9yAPz3xryqCiI=; b=mmDihcGhHnhrPxdxOw
	EzbUyNwOEHsybBv1V9kWN7+mzWYN2c7Jf+Y5jSOz8RMvc6UUyWik1e48BRESKYcf
	OklYCbNhQ2TCIHPkrF9mQo4ZEC+pcOljO3zo/3Ukhvymg0p7U5gnwr5Ow6xG7TFm
	R17Mgu5Jy6TGYTIAngd51jbQqI+VGbUsDptA1qG+0INu0BTSY31c5k8laaIUzYUr
	kOjXIjTnrppOI1ZQeyjHkckZvWY59QaGHATmO5nuWepbsLZAuu7+U2aExnfCBhCe
	v6wSIKs3Ajq52Ebuxi0YT6sUK03nUEGVZa6/gHlq7/6gNWWefN6Ij4DoedJ9ml7c
	e9Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682109553; x=1682195953; bh=G5baiNIip/EtC
	wDIuLtcOUpxLQymRj9yAPz3xryqCiI=; b=Mwrg37u8XRQTiWhGNQRPceLvqklBn
	XfpaqO4rgXmDaV8DNRhh43x01e7uoUnx8E01OAEKTYAtMjfYNyUJze6mKE01t5h3
	NHbBGAiutFbF3mmryBu/+awGvUWaBHQvgT9KzXo9w/qFzutp4PBIll7E9/H2+uOV
	QrHP82W2Nb4obQf1FAdYx4AvqV+ZgtT3Tdxfg+GVloxuOJdPWvZNl6Pl/7Qfxvzf
	mvZP4uXQuxC6tqDSsih275ZC2sATBBrz7deP3Q9bKUrHwZHtfBczgm+8quMJtWW+
	9qXaH/m4ulM097nyeATHDrVnWNlmCwgO3MS4UONQKLD03aWdFmTBOhTtA==
X-ME-Sender: <xms:cfRCZOfxUh4UvRVleAB8g0sJgs65GAqZ_KyUIKDeI5J1CKvJfalfvA>
    <xme:cfRCZIOlkAlAHD_7_xgGM8jlpyXZ6cXjym4CZlsmpq9QRq0c6a4oEhvM1-Dy44oAk
    bp2WjqgdiSa6YDOKT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cfRCZPiCbi0iizyUCgV3DukiFw2pskRPGZFe8DTIn2pTVLZ0arrSAg>
    <xmx:cfRCZL__O7NGd6nLgFiUswzS4dCbJXwL35HtRfKR8RGKEats0kGgjQ>
    <xmx:cfRCZKtCqdpe86fbxslNjibDysaLQkDi3yuJbv7yEJ_6fDKy-nEelQ>
    <xmx:cfRCZH-WyqBJriJdN97gm2GEDtxERX6Z3NS2u7qKxETWOimOSzqyvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E5ED8B60086; Fri, 21 Apr 2023 16:39:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <74a647f7-cf5f-4c23-aad6-77bf5b04e116@app.fastmail.com>
In-Reply-To:  <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
References:  <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
Date: Fri, 21 Apr 2023 22:38:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_133918_617156_3E3A4237 
X-CRM114-Status: UNSURE (   7.22  )
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

On Fri, Apr 21, 2023, at 16:54, Geert Uytterhoeven wrote:
> With W=1 on platforms that use the generic gcc library routines
> (csky/loongarch/mips/riscv/sh/xtensa):
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice, this is one I don't have in my series,

Acked-by: Arnd Bergmann <arnd@arndb.de>

I have patches for a lot of other missing prototype warnings, plan
to send them out after -rc1.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
