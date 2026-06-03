Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F1DCD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 02:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPreIC85vvso6x8GdCn7Xzej7CAyXCyCxp1VWzt01qw=; b=ZdamxqIR+KO+81
	tlya49MfSodLP1I8sG62FmQhWrNCty5j6o5SQZ2BxKDf9QemUbrGbOPhn7vPjyG3jLY1O/cjOUr8h
	dxDWz5ph1ikAXPHMXhygxilI43PHrrYesL+Thcrfb4UhsboioWVhDVzDTHHYzCS/9h6voEU0xK/zT
	4YRX92mR5e/riJHkRjTYaG2zAUQyz76dvGa5n7LXRhE86FeivoCAPmaJ7KHZy4na0/7FnljjId91y
	VB+8IpzZXxNBu3LnyUSxPE7nsIuTzKjUlSW61bg2RG6ExhSWBwuTi3TBENHkFyx9o8OZlC5gLxtKs
	8kOld/8z6TVtu3ABEjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUb0X-0000000E5Hb-35LB;
	Wed, 03 Jun 2026 02:07:01 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUb0U-0000000E5HB-0a6G
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 02:06:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36da8439078so2656457a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 19:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780452417; x=1781057217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+F1aM3WBZZAtQTaYVDf+ZQQwiErQhbecMAZSECvtDQ=;
        b=sqFCAltueUQOSHTSA7P3FWGrj6xK3isnFK9vrESZe/FMDK9T9NQCECcm8pJnByrZFk
         zgKrh8x83wk68LbZf96vQJfW0K4SeJSD9kVFozkCifbgrXNH/FOumW1VVrZfORxhxdR3
         f1YJNCiepeuHpj6u6OFCI3pxXuAzfdgpIqFpZNABfLSheaDUBwCgZpojJcnR8KZnUb7V
         LwbO1QXcjEKaFusexZ9taDRoc2jIrRfoYNkn7UJ7u9imTP+iDlXekak+NBd0aMz3xrU6
         nhzZavx5IjGrzoubAFkPadii9IdUXhSxqMdhg6pDzf0UYiYV0e6wzteVYaVKwWq1UCs/
         EGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452417; x=1781057217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+F1aM3WBZZAtQTaYVDf+ZQQwiErQhbecMAZSECvtDQ=;
        b=FqPeZlitIe8KkURYhnqO2R229HOhuHanmq+Xq06J4nIVulcHsn3bOCQFUhZSHrK7i+
         Z07msNsX7eRCjOVt/8XNTLZN3QbGKBdncXL2YhYd8CdzgWEF+lhGjxMsIMaoj2ir3X7B
         sp9d3wTpk4ebp3e310+nUdihmYUek+hMduXQCZEJHjcVThS9OnynkyxcJ4Fvw8lwj80R
         ISEFJHl64hYTSjSKvTXCGLHXQgNN2yOJ2u9PK7mC/V60cQ7dL4BW5PqYUcWQQCfGiRFq
         FXAV0K6JySdP20Jg0tJGyK+omtQBX+IH74LWVJK2Ijz2lDEzMh5QoEL2FQ9RFPJ7UdCQ
         bmgw==
X-Forwarded-Encrypted: i=1; AFNElJ8uJLq1XV2aMWemVfet1QHzP/kRn1REAel0pog9uPJr0j8VDvvcVNxYmEgTZtQun/rB2lx1Ltqz23idmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFpm54lN8E+yz/opAzoG3I3cpk/Vqqr7TfJJ+ZB/wyXhClO8+u
	mY5gxUnD91s7Pse4rClQXeCmPTV6OGeSxhE3W1kGc8oj7CJdCKH7zhes
X-Gm-Gg: Acq92OEX9dRB8WoWUWfzMAVmbsLwywkFh6YTGmLyf2XGkCNrts71/sy+GPR0eRBmGol
	kDdsHATL84w9DslV1qBrjMelYnXxtwo/WLnyQ5WuKdhKbqfvmxM6ClmI0kct3KXX5b27lAKd9Hv
	lsm+S2Ja2LheJSIv8c1IOF8PnJQoTWzo/oqmr1bHcTIu5tAXn/StnUd4C4h1IsbxHicDAVeGqsr
	t64fKA1/SbgRSh0KDm01137gQqLQrcg3rvzd1bi7Lut8WRG6mnD98hm1OqI9E3WLWdP7pXZZl9U
	zTaoDBKCufvzKHYcwzW03IGpYaZqJPDGXia3nb8C3t6yv9f/kQ1BttK6h34nvVW/JW4ljsEKJsa
	AzWAV+LzDE+Uu0YD7bFzJRCE7WXHveOBz3AOoimAo6IC4meTzPvpux+BnOSyVudx1Z8jo4yveif
	6TcGpCl+/DmN7NWHaXScEhWwOc+14hg7yC0g==
X-Received: by 2002:a17:90b:1d52:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-36e30a28f32mr1195624a91.15.1780452417269;
        Tue, 02 Jun 2026 19:06:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9877d85sm4190993a91.14.2026.06.02.19.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:06:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Wed,  3 Jun 2026 10:06:35 +0800
Message-ID: <178045237640.222315.13582367282574161417.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426013449.694435-1-inochiama@gmail.com>
References: <20260426013449.694435-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_190658_234380_F5302954 
X-CRM114-Status: UNSURE (   9.50  )
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

On Sun, 26 Apr 2026 09:34:47 +0800, Inochi Amaoto wrote:
> The CPU unit addres for SG2042/SG2044 misused the decimal number for the
> unit address, Refer to this discussion in the Link, it should be in the
> hex format.
> 
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/
> 
> Change from v1:
> - https://lore.kernel.org/all/20260406232655.144043-1-inochiama@gmail.com
> 1. Apply Guo, Conor and Chen's tags.
> 2. Remove Link tag for all patches.
> 3. Fix comment for clarification about node name change for all patches.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: sg2044: use hex for CPU unit address
      https://github.com/sophgo/linux/commit/207cbc477406a72952e27ace2eadbae55164f129
[2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit address
      https://github.com/sophgo/linux/commit/a7e658907686528fe06a11828b04a3e42df9ef18

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
