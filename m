Return-Path: <SRS0=3lGF=X3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBCEC35280
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA67E21920
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/QPAlM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA67E21920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:In-Reply-To:References:
	Subject:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Lo7cxfiv+FxDjjwsEzHAeGXOc2vE0dS/ZAd4HFsP8c=; b=K/QPAlM6ODi/Qv
	9qunDko6xMt6DfyM4+nXEvRS9sjaHe2UgE3Ug5oFoMW2TDXmbzxHkr/mUvf0CY0HmTNlPDGeUrG4z
	xAE7kVQkun+xkr8kbQx2LRFcbgSJ4Kb5AMn0c/I3RUu7/cyrpiuH/atkOd65qnaB6nNa0iSBZaiDm
	dK7b/21bvF5sOOgq8pjoFF4bxBxIB0/dm6gTPFjb+hQmNXGcEZFGpE+451T+DuNB82QO8xCmtODt4
	uBXp74swTr36TwLM6mp4IDDNMPem23K5gl6t+l3Khmx5XJdKJpFEdvsSDIGrFXd/MDK8mf4llCPFJ
	pFTAzncQLFIQ/sWIcDjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFfTv-00031R-6V; Wed, 02 Oct 2019 14:19:55 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFfTZ-0002aJ-SN
 for linux-riscv@lists.infradead.org; Wed, 02 Oct 2019 14:19:35 +0000
Received: by mail-qt1-f196.google.com with SMTP id c3so26510512qtv.10
 for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2019 07:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:mime-version:content-transfer-encoding:cc:cc:to;
 bh=xEcXpQ/NEwyCKzNgI7asImKqcpzGOLlroU+HXRPzw4Y=;
 b=VRyEg3sLOSc7yT8VzVT2W1YjvdOexctdGA1UTHDjtWh5Hz+e5k4y6dVRmoylUEnTsb
 DfhppynMVNbSQhcnGeSchrjCxC70jQBH+IxPXdEo/5s8D5mn3R4sEqvuAX4QaL1WYT56
 2dL0busrHjne6zbLqhbGx4BYDgLmtPP+6aNn7FglL87DLoTeAPKX7yErVZsYPPX4hrEl
 Tlz/RT/fw9YX7cK4MQ3z+qJa9AMwY3rbRrWFDnl45sJJSfCvu/IXKFh4z/WxZVBlOvqa
 3O3ApXrz1Xecx4Ps8k3+cLbRJ3AL88yXgqCu7Z2Enm02hKLPi6bWc6LmiR5Oi73+Nkv1
 Mulw==
X-Gm-Message-State: APjAAAVseeHt9BNbQeloOqMweDpqCiHTE52Bn+LtOdyw2K4gan/Befqp
 /hB6opIZlvuH25imzAKzFw==
X-Google-Smtp-Source: APXvYqxaLnHeciWkdlweE2LBBH7eoNN5RyZrMPdqv69QmbChVl6tENsSTpMqu/HDsjtpBHL6zYeZPA==
X-Received: by 2002:a0c:a5a5:: with SMTP id z34mr3240240qvz.110.1570025972605; 
 Wed, 02 Oct 2019 07:19:32 -0700 (PDT)
Received: from localhost ([132.205.230.8])
 by smtp.gmail.com with ESMTPSA id d45sm12737320qtc.70.2019.10.02.07.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 07:19:32 -0700 (PDT)
Message-ID: <5d94b1f4.1c69fb81.6f9ad.2586@mx.google.com>
Date: Wed, 02 Oct 2019 09:19:29 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] docs: fix some broken references
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
In-Reply-To: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_071933_929492_B23C591E 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: , Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, linux-cifs@vger.kernel.org, corbet@lwn.net,
 linux-rdma@vger.kernel.org, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-gpio@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pensando Drivers <drivers@pensando.io>, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-mips@vger.kernel.org, Steve French <sfrench@samba.org>,
 Shannon Nelson <snelson@pensando.io>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 24 Sep 2019 10:01:28 -0300, Mauro Carvalho Chehab wrote:
> There are a number of documentation files that got moved or
> renamed. update their references.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/cpu/cpu-topology.txt    | 2 +-
>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt   | 2 +-
>  Documentation/driver-api/gpio/driver.rst                  | 2 +-
>  Documentation/hwmon/inspur-ipsps1.rst                     | 2 +-
>  Documentation/mips/ingenic-tcu.rst                        | 2 +-
>  Documentation/networking/device_drivers/mellanox/mlx5.rst | 2 +-
>  MAINTAINERS                                               | 2 +-
>  drivers/net/ethernet/faraday/ftgmac100.c                  | 2 +-
>  drivers/net/ethernet/pensando/ionic/ionic_if.h            | 4 ++--
>  fs/cifs/cifsfs.c                                          | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
