Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F60C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rJQUymJYkCuoT8Tw/FZdcdD2ePVSna0V5U2BAEwuO8o=; b=zqWL9gPkOacxt2
	D4usi/FZIdKDSLhcnFIZAgV0YsL8VhqWbqRsV6uVZQBeSL99KP8DD69bf2Obt+RpG+pLr8kM/wMjP
	FXAkoyWvWf1rtK7IVTqt63ufCvcgEP0ifGc26PBzW5LTSH8xPzGClD9yOaLWMSM9/BQCSpcvQ28ob
	skjXxiAdzcugdm74GZQpMD4Yc/6AlpAnFQlg2TPp0f1LDho0u9+56SqJN8cd3EaYogrJSwGJwyoXW
	WdanxW6HqSWT6Lleg/tVTOmSYv/xnHZAq0NRwpAIzQnqrDScdHfCZlIMpC9JR6IFjyA+oOFdK3Dox
	WkA3l3G2PEJtn8d7kSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH7A-0000000AyON-2o9K;
	Thu, 03 Jul 2025 10:24:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH4Y-0000000Ay36-1zqY
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 10:21:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742c7a52e97so7526158b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538102; x=1752142902; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf3OnllIKy74CmmPzQiN5iB51QA0QlwijmOja/0ll0Q=;
        b=P2yfFEzCMddZoL+VPW2AOGwEffIFD7noaieZBU11hQYJhtkoy9tF5PmjXcxN807Nox
         LuZcZBuXtXIuR7HexSG9BjoBUNmHvLExIBsbW9Xdt5ciQdmKl+LqbCxyHClE9oHodIzM
         4NHvS0NBD3jpdymEgh0MX9CuCHUkyoJS7r446tMkO1f3o9KX7x4Eke6olHlMlfCMROqK
         UwfbqB0H9+jjvC71rUvx+KViMuDqh2YwJ4+DJ/9qcZNlLwFXaMwDk9bLsGaRmOq0TIgE
         pnmDL31Ki+zItRMhL6+/atoOuctsSP+8SJkerz6o0gKKvDXFUS3IDI3N4p71N/5xzjoW
         RqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538102; x=1752142902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf3OnllIKy74CmmPzQiN5iB51QA0QlwijmOja/0ll0Q=;
        b=hmmT+aoBJBGYJyliNWHZrNmz4M+ORQU+jOBEA+5Wbv/F7/zDMI74xa7gI8a57qtmSV
         Cz8N9QI2WAkDZqMMspFPnrmO4oYMiB1EwqUw2q2dzCs7iW+fTUPqvBmzGZ1HD2h71FcN
         ME1Ilf57TeJpasPer0wskD2VN8oSHlyM8NNnD+smT2OcTLJ0UtrB+GVLmV8gRkB2rAvP
         z9Or+DwXwjxnrNhchxJC/wyocQCguT21DLj5DpY81lIVe/Xe6As4JHzhR3Koqcbj2hoS
         K49Cl/dGQHj8xKduxZJHHLDWOkVMCcnbBADarIP0376uQoFqeAE0B+0AORasg5OygCFp
         TI+A==
X-Forwarded-Encrypted: i=1; AJvYcCWDY9aOTVHwgO0nsVSX+a1KyYwWUL/blMUztW93uafXRCcZaNJSXQoMb5u3FO2JmOuqiXXlG7oEjj5yZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOXiVK3rJWkaR9wnseQU5B4y0N/yHHjgMBGJ1vS2Pz/ykIULTu
	aieMx+CpUo4k6C7WU9G63GoMxyPkiKKhVvachlUewjkSDksx7Y83d8tG
X-Gm-Gg: ASbGncukwpaSPWXB7o0JB3dLXtO4roOlLm7woXLdGk/yiMNVLfXHKgKPxzRRG5bPvpy
	Xb8oN0Dxs2MqYPRimD9hOEH1l2PTBBJvDKJ6DfC3z0VlQQnLmxIioLNLs22o6kHYG9s9+vn8DbO
	SyvEZlrMuKv7pJjdJTvwSLAhWlFp7Rcj1VH8urTBJ2JYMZVbth0BDdi1WDsmeqS/9olM9POw5zZ
	M50Sgq0zfeRgiWXD37M7xGbP2AyMvkZMKA6oFBqPO/J56g6QkQwQvPxLGDO9zO3CJDoCR9pwZVc
	LInaV4S+m1kvWxGLcMaH+V7cjJHCMwlk5HlDZDumRHtMO+unQaU1LXCU7sQO3A==
X-Google-Smtp-Source: AGHT+IGq73HxNPtEVSnp5azdraH+JoXEP6E2e3ILYaUPK7FTlIC70puJ7IGvGTsd2cf9o9WMfsGxwA==
X-Received: by 2002:a05:6a00:3cd2:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-74c997fd590mr3720134b3a.1.1751538101662;
        Thu, 03 Jul 2025 03:21:41 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541b6e5sm15788469b3a.43.2025.07.03.03.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:21:41 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:21:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Question for CV1800 mailbox users series SoC
Message-ID: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032142_511422_70F1C9DE 
X-CRM114-Status: UNSURE (   5.49  )
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

As I have seen you take the mailbox driver for CV1800, I wonder
if you have developed the driver for the 8051 core on the CV1800
system? 

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
