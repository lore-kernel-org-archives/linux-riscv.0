Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C3C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 19:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbz7t0NY0umkLeD7W7cWh6DZXY4bQQ8nICvhyBWiCVU=; b=sEafYEaI97Wb6p
	VDUIOTSxHxe07pkJNsvFbMJc+aS/F/eiyWNBilhku+opD7oETCHzTQrSc5iDiBsZ0xuwcACBkiLsK
	F2udSWxhQZGRzKCUdMbtghsRWyoTydrSp5vxXrPABANGKqnzisPWc+pGU2wFx2jj1OKrbuDYPVj8k
	3NfxTebcJp056OT9UOUN5VOOFY5w6ywD0Hk4xu/NILs4yChpTmNZuRx4JnLJZih1Xwh+EHrJwljwY
	0K7zanB+Cu0UVI1YYlKp/5igHqAEUh6wAxA4k+q8gU8febKmBnrlu4mS7KpbK4zvDChXHc5k7v+Pc
	BBiEimr6ZdQPB1EbLVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBa3-008Zxl-2Z;
	Thu, 10 Aug 2023 19:44:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBa0-008Zw5-1w
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 19:44:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso982857b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 12:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691696657; x=1692301457;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwLcr+qLqxp9uILJzHR0AOl3psh7swIvtQXIg5ZMp1w=;
        b=CvduWUlZzx84mIAB1T9e2rAahPkDRFSk+A17ilCInoLdvhF0h5YmvXr0wxkj4G6JNK
         D2jdPfkidRPUf64LYrN6aMZqmngbymQJayobTVMBKadsh8c6Lxo6S6teZGcn0i/jk5PS
         Bi+mOY/cVwuE0ZmygLL+H81ecFAE/6ZkA8tRRaFDKnXUMAGpQCj8KbEaqmEuLvddBp6E
         4zO6z5BaQBCNtAticZK5mPSr06LQ0VIkrFG5X28+KKeYm4JI9YNKIqoh/0zgtijGoLz6
         vFd9IwDkCL9Ak3WXXaMh27b42q7OvpiQgOtGylm5HpVxnoNB0c4KhODIiYc5rcsa9Tv0
         pK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691696657; x=1692301457;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwLcr+qLqxp9uILJzHR0AOl3psh7swIvtQXIg5ZMp1w=;
        b=WNO2hGywq6MmfLJ+QUdKPf9lYbwc2Dm+1ZvaPvOovfZyUoJSv3Ptol6zqi4ax5iTXr
         fPOtAUZKfXtF1S7EPyXfJ3bF7MOkaWEYpZKZEkTLtgo18DTe08iReJ29QZcct1mSH4iq
         ulM6cZd3O3Xn5RNidSzCQZENJ/SHhwTRl2DZMzmPEbHWZ/YGOuopYavyiCEYI3B1fydR
         FfmKwN+F4Exf+f0aYGPKH/vI7UDALkIfqNvvSpnthC/PAHgzG4LWzUIA+mSwP6qSmpav
         +cH02S5jO47Xpm24uEWSI61Q0LufWLlSPx2m5t0tJpI3x96DKdssW2mIiz8fMFpkY8PB
         KIEQ==
X-Gm-Message-State: AOJu0YxvpmEDe58mUngZAXiEj6Z8p3xIoqdY44YKA71EIz2GMWRDB/Jr
	605PrAav2qocKtoLuxRwk4EuA1VmckD9pEZBkHo=
X-Google-Smtp-Source: AGHT+IFiVdYsssSNSg+RLnpvaujHNrG3IHRYouNiTyLod2XG58mtE1PEiNGLAjtoTQapbZ0NEqrCNA==
X-Received: by 2002:a05:6a00:17a8:b0:66f:578c:59fb with SMTP id s40-20020a056a0017a800b0066f578c59fbmr3901964pfg.10.1691696657149;
        Thu, 10 Aug 2023 12:44:17 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id bz4-20020a056a02060400b0055c2bd881c6sm1758899pgb.84.2023.08.10.12.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:44:16 -0700 (PDT)
In-Reply-To: <20230803012608.3540081-1-samuel.holland@sifive.com>
References: <20230803012608.3540081-1-samuel.holland@sifive.com>
Subject: Re: [PATCH] riscv: Fix CPU feature detection with SMP disabled
Message-Id: <169169664355.3729.14458848108996711975.b4-ty@rivosinc.com>
Date: Thu, 10 Aug 2023 12:44:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_124420_656492_1F4BA0F8 
X-CRM114-Status: UNSURE (   7.11  )
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


On Wed, 02 Aug 2023 18:26:06 -0700, Samuel Holland wrote:
> commit 914d6f44fc50 ("RISC-V: only iterate over possible CPUs in ISA
> string parser") changed riscv_fill_hwcap() from iterating over CPU DT
> nodes to iterating over logical CPU IDs. Since this function runs long
> before cpu_dev_init() creates CPU devices, it hits the fallback path in
> of_cpu_device_node_get(), which itself iterates over the DT nodes,
> searching for a node with the requested CPU ID. (Incidentally, this
> makes riscv_fill_hwcap() now take quadratic time.)
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix CPU feature detection with SMP disabled
      https://git.kernel.org/palmer/c/6514f81e1bd5

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
