Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80972CED24D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 01:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+8YBG9ohxsGhjnb/++8KrBv56sa7kYbj0h4OzlF3V7w=; b=nDimkHQ89vWhwy
	JQ1T3j9MlexGM6Whs6VpeFUQnTOVQCQ8qNp7JgbKXiqCvBvTEOOaw3cLVDD9vIf6PQ00s5bGYXqrw
	i2JpWH4gmbFRgtKuY5TjV7pMgBoaUw5ZfUn0Uq+iz/SDcDtSXhqkUwY4h2GO5U71nfPTkKahsBkUJ
	Ar/XipPtCPDicewZrpw4NliarjVdh3tvfTYov/Nx2+YzbArOf4o4V3rEfn7wUuEH22sxCB3T4lmtn
	/Ppo08UQbaY5iRapzBims+hLc/C68w4P5aeaVnuJZnckQtSAQCWJxYgSxUoMhdogqQU/qwBqAcAmu
	L2PTyowkNEftNQZPpzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxzGM-00000004DHi-0OP5;
	Tue, 08 Oct 2024 01:43:46 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxzGJ-00000004DGL-1BG4
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 01:43:44 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5e77a1c5ec6so3013374eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728351822; x=1728956622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhudap/e3GFJwj1GIVucRxNplIWeVCeDgboG8FiJJq8=;
        b=KQ1t/+us3gsqGtSYN8mgH9XJjBIPLvR3io2e2IbTAyzfRhmKmEvzaDqG3W365SFmP8
         6CHNNtXEHjP/XfPk16itpPdoofdbz1ERPDYHmI017JtSeeXq7sL0zXdGdH+N8cyfthWt
         Au2gAfMSwrDQy4trAhkx/xZpYY85Oc30mnzEbDYRJP0mtOc+Z+6DSMsho/Q7gOPPUjN7
         GYTsMYcTloQ36whYURk3Rsq9hFFDjrEVnD7T7inRG4TdIqVLVKfnXfKKORrMglzb8Ebo
         x3SOegVwRbSRxqAq4Tv8bxI4Z1HOl9Kf5BMvMCtPT0JaEvRhCmBagmztwa9XjzeeO9jw
         g0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728351822; x=1728956622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhudap/e3GFJwj1GIVucRxNplIWeVCeDgboG8FiJJq8=;
        b=ptITP2m/8K2zuYabK4Iz9IyvM2iq7LWpprSB+94hX1x2S27aL2kEf3qlzwh1PYabqm
         BO1fCpcnTzeMgUdG8CbFgHh7nchOUEdGat+7jvLtcCF6Ed/BmkMQjBYC/j8kLUlhWxhc
         kZy6nkY+wKNEC7ldvKsnFVfHNpcMI94C5VOFi+BDOaR/PvRKgXHtto3Xtpj5Zze82bqJ
         2MJCLKFQONUQJdmKt6ZeaZrPMiqOtXXMLHFqs2esYcA/cU9E/HHtvhKGH2hFXlZKOHlv
         qTdA+YC5bt4Kwk9j5spSEMpCk6Q7t+0zO+A6S/z0/bthgn3cpfHBLsOUhH3N5tEUdvRt
         Zlsw==
X-Forwarded-Encrypted: i=1; AJvYcCUM+A37FGefxdIs3KLR+ixk1e31cqLukX+fRZ8BAqUEmM/yxA8i+O2iG1NBQNjYz6tWKXGuuH5n17L5EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Za/Q+jcAPg549jzv9fCy7CZHVgtP1cNXYQxe14J7zLxk42tu
	8ywgMue1PUxqfYdvy5wwnCjHfocS+pwr5lYDNoa65/leEU3lSuMC
X-Google-Smtp-Source: AGHT+IGIYq93CKi8OSj8ClnvKD36PL+CeAVrFU0fxaJlJ3lvOtN58r2VCxwx5Kha5hH09rJI6fEg3A==
X-Received: by 2002:a05:6870:96aa:b0:277:e7bc:69fd with SMTP id 586e51a60fabf-287c1dafc27mr10088239fac.13.1728351821709;
        Mon, 07 Oct 2024 18:43:41 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-287d70eb210sm2593033fac.23.2024.10.07.18.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 18:43:40 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH 0/1] Add power key for pioneer box
Date: Tue,  8 Oct 2024 09:43:32 +0800
Message-Id: <cover.1728350655.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_184343_344211_19E7A327 
X-CRM114-Status: UNSURE (   5.53  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add power key for pioneer box.

Thanks,
Chen

---

Changes in v1:
  The patch is based on v6.12-rc1.

---

Chen Wang (1):
  riscv: sophgo: dts: add power key for pioneer box

 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)


base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
