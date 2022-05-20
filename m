Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7958BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nae2S8xG97g+fwArGVPnI0LleWq/n6F+jKp3mYpDRCU=; b=xNErcI7ms5ciEv
	j2GUlH4gnkhU/RiOGQ3PZB4uk+bKvLjQF2BihbswXdsoGVYkbacWQWSkPCiqj9jOQmh3SpZOwAnuY
	uT9kfQxGt2tUIpz7og1zGRwwbmWjb3tCLc0z2k4UYCTA51n8wif+EzO9y4gogVDlyOhp5zPTY++47
	Walq96xrMpoPdOYAtCYbgF2mW+WB2p+HHtZqQSW30jYJeNNnL/bIVXt4Em+lq9j0bLS6/scN+R7aW
	F8DituEeGIR+iZ9eScCD9ROhhZliuGXjC5+6W5EjLv+1FZpuFZxR4I+Ca0NnBZLQkD0K1jc+4b6jf
	kK2P9TkTN8k8YvVswzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsBKc-00Eonv-Qg; Fri, 20 May 2022 22:42:50 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsBKa-00EonB-Hg
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 22:42:49 +0000
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-d39f741ba0so11823798fac.13
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 15:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=azdu1pWAgwViwv7ELQ/aqUGNmN2fRBBuvMjhaKlYBAM=;
 b=C7GeaNLIlJ7kn163niaj0FfE9uW+xqZD5E0Bwu+k1JE5hX68ILhpGlbk/GC72BWIuj
 auPKmKcnUNRVo18OztODN3GklPzZ3QRKCx+/Got66RWkd48sPg1RJ4yCQzyhm8TZQTxF
 k/emNAoXs08/BX1Sxc4WHmAzlW978DuOhFugxj0F0vIIz8Pdbd71CB/f4eKF4j5D2yWd
 09t1l/3pjOS716Gl768iwxAJUmAfGEjW2YyKzFXY1NAXPgNA++S12xy/zGIKxGeCtmvC
 8rgNI8bGxWH2jJVPlXp0pUaGOUIumjhduAHn/3O7CX4pwqweT8w5wvA0u/8isuBw/CTz
 QWew==
X-Gm-Message-State: AOAM533OkH+yawtSuUIIuXax74y5+BXa7AAaX2F/OBFRiJ1dWWy1ny3h
 rfN5sv77i6xAdmaVvMmFEA==
X-Google-Smtp-Source: ABdhPJyfg2alBejsld9ZUdZbsybzuds4RCSyXYGj21XRzYKGKqSXGreA1gnu4Og7xPrbNxKE4KO6aQ==
X-Received: by 2002:a05:6870:610f:b0:f1:9314:8005 with SMTP id
 s15-20020a056870610f00b000f193148005mr7504540oae.77.1653086567460; 
 Fri, 20 May 2022 15:42:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j15-20020a9d7f0f000000b006060322124esm1437488otq.30.2022.05.20.15.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:42:46 -0700 (PDT)
Received: (nullmailer pid 388541 invoked by uid 1000);
 Fri, 20 May 2022 22:42:45 -0000
Date: Fri, 20 May 2022 17:42:45 -0500
From: Rob Herring <robh@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: lizhengyu3@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 frowand.list@gmail.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com,
 jmorris@namei.org, serge@hallyn.com, liaochang1@huawei.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux@rivosinc.com
Subject: Re: [PATCH v1 1/5] drivers: of: kexec ima: Support 32-bit platforms
Message-ID: <20220520224245.GA385188-robh@kernel.org>
References: <20220520154430.18593-1-palmer@rivosinc.com>
 <20220520154430.18593-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520154430.18593-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_154248_637975_250774E4 
X-CRM114-Status: GOOD (  10.53  )
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

On Fri, May 20, 2022 at 08:44:27AM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> RISC-V recently added kexec_file() support, which uses enables kexec
> IMA.  We're the first 32-bit platform to support this, so we found a
> build bug.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  drivers/of/kexec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Assuming you don't want me to apply it:

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
