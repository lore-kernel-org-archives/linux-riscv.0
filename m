Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96930C4CEC8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EDE5206A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LkSaKGUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EDE5206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8WP1EwaHDKiQM+BdpIdzXa2Zhihgxw1H40yTBcJAljE=; b=LkSaKGUC/caAwH
	rTAspOALvkRj/KZrFsXotcX90wDZuaPNTb4xi3+Xk8BsulwPyBsJG5deRpJZQb9cUumXLD5HfvX9d
	8zrCwPuyCppmnn+cvSGNwu8MKVSn0cHLQlm3GDi8MXeopFyo+ZP6sJsXY03TDBaEw9b7YHDLFwuFC
	ZXZ0+iqkV7g9TXu+IF9Z9McSgGGFaw+y9EwCCjvz7YSu/GIdE1DJuq0jXnxLJIEBrHcC0xPRkTOhW
	DnYFaSkHIzA4CiBVdJ8FPrfG8QA7tnsLJSXdnUey5IkcmGEXHHsuqYgKZCwt+BXtIG/D3TXJiFy9O
	GPLWoP7Ub1KWmyz7t2Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8rEH-0003Qq-Vi; Fri, 13 Sep 2019 19:27:37 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8rEF-0003QM-6o
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:27:36 +0000
Received: by mail-pf1-f195.google.com with SMTP id y5so15931765pfo.4
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:from:to;
 bh=GeNQTpb4muGawgtTnFW9WgNICQSqi8hVoxKQKMkLI14=;
 b=Ld7ED5zkUjyza/rjrOGXRx1S624zdIpX7nvyXAYsHac7/GMX7oCNKvFTXWDaQdDduu
 8cI7Ii4lnfjBm+x+vMH7nY+kRFJyKLoceephBUN4YG5mu71juRgGgA3WJqP0JgCxbkua
 E6V0Pm4gkz+tAg+WsR4miu8ImRvMURE+p/b17HCH+w6hgO0LqpASQr9C/iFw6ACaz9uf
 1rptAo9V/sx7yFHb6a4ggW4J20mw75MI4ZdSlLXSwzMECMVHXfp9m/0WmnFU8VqWTsaM
 RZSwrSEiAiXHMlq34EbJ5HwwXY0Ju/J7Ztiu3WD3sw7kaag/To21nS7jS0hesgqGbV4y
 S0dA==
X-Gm-Message-State: APjAAAUtq5+CPKj7VR9PGSiLeiLvnSrATqIWIJrK59sh9iRNFT2sFPkA
 9xXXIPAlKH7ABgvukieDApbsonQ3qqd5aw==
X-Google-Smtp-Source: APXvYqzostOhWeIkz4TIEJK5V/KYG6ym0jO69mh6r1aCjNXJrh5pFVP5VFh4IOQ2pJHgw0Wvlena2w==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr6742026pja.26.1568402854140; 
 Fri, 13 Sep 2019 12:27:34 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id r2sm48732441pfq.60.2019.09.13.12.27.32
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:27:33 -0700 (PDT)
Subject: [PATCH 0/4] Documentation: riscv: Image cleanups
Date: Fri, 13 Sep 2019 12:24:29 -0700
Message-Id: <20190913192433.4316-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_122735_249201_C3E1E5E0 
X-CRM114-Status: UNSURE (   4.97  )
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

There were a handful of issues with our image format documentation that
I noticed when reading it.  Nominally they're all independent, but since
it's text they'll all conflict so I've sent them in order.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
