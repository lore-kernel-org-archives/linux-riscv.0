Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0FEC43219
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bpG5uZjbmx/UrmdwLdff09P3QzGqZRxfiLhnXY1PTsQ=; b=mDqX0d4AzHwa8y
	JlcFddFeIbz/aLHD2uYB8MazHGH8vC+fcndkEbIvybDcUz3letgy9jgnerWibR0RhF30OAGGoslD5
	7qaz3fxqA01XzZsAvONk76k8pvWxt2oSLQztRBX2ArKysESOXihKOTIksNiSYnIg5vacZL/EZhs1H
	xeUdSr3H8lJ62V1wthFF+m+IMo8d+zUAY9HHEaQZnqmzUwoKcBKaae9rTkIZWhggVJtPoOH7lsVsX
	u0NY0Kg9B9MCQDyl5krm7bafjHRcbCgnF+Fbetxl49Tg+bZvLrGJxJNPUbc9HQMSubpZF6odgsV4k
	yoNFeMZ8fSLFpdAN4w1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4ow-00DJsS-P3; Fri, 20 May 2022 15:45:42 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4oe-00DJhF-Nd
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 31so8042641pgp.8
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=gs3k/28itFHvJXmdsRExbdUsV2UQMie33SCkn2ny4ZU=;
 b=0L8NTjV/6EsGEzTVPkwaauu66xx4YsEzUoOBnKyeT8AKQ+eiucSVQznEY4zduqcyDi
 0CLs1ZMX4LtInxWYR0lOUHXiLuT12sMMkriI+yvKElKS9UMbR0JE+OaI+76C2qdfF3Hy
 jZtun6jyoo7julKaC4P4QdqO9PLV/Vg5jCN1X0S47LZt+9QFApjRdLCcdWX62xXndUY2
 nQnxou1/l4hl7wb+KaYWLjGwV7izEFK3VT+KEM82NspqCBHbsTa80DQ5q+k3u7jsgDO7
 h/fFQFJjvATlEy9anqSgbM0MJQYkuyscPwNW5Es94zhcTICI8DGnphfk4ySh06KjrZAa
 zQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=gs3k/28itFHvJXmdsRExbdUsV2UQMie33SCkn2ny4ZU=;
 b=4io/8UJGBq0NDSyf5rdvbJzHOVA2oNNcsypwh1n1sw0xhmQoytJOWwl8m+pcqO1+zP
 Ck/r6UOeqMRJoVhbk0MouoaOaaJCPzjD5NNeSYorVGLBEB7lvbtALf+Y1/Fz0LLQ3/SN
 9ij9k2W5Tw52LBuLh3J4zTgtDVyhq9CBIzr59IUp7SZk4wlO6Hqhwnb6aJKfXyKCG1fE
 cxe++KV2RJAY6fVFgg1YcEFP8+7IHNduYuTApySmVqnQtyN1QL97cWWFfZGMJcl1EubU
 fvHFNxBLe+j+umJe0y9vykAi08sxZQrHjUqth3VxxRE1bEH4t5pku4Vf24y7EiUwcodI
 IVAA==
X-Gm-Message-State: AOAM530gYvmibq1slxTe7jdgJ4XXLtKa1Qih1C1NAnDdH4sxTG3Ji4Yf
 eQKO6h4SN3JJoLEOo/4RP3ibFw==
X-Google-Smtp-Source: ABdhPJwZQuyWJmMpMf/TR7lpahjw2nquTx9J7AVvExgDhp9Su6K3b7Yem6V1CcSf9pHCcHH0pCVRBw==
X-Received: by 2002:a63:488:0:b0:3f5:e6da:4619 with SMTP id
 130-20020a630488000000b003f5e6da4619mr8966800pge.6.1653061523297; 
 Fri, 20 May 2022 08:45:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 k18-20020a170902ce1200b0015e8d4eb1easm5838502plg.52.2022.05.20.08.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:22 -0700 (PDT)
Subject: [PATCH v1 0/5] Support kexec_file on 32-bit RISC-V
Date: Fri, 20 May 2022 08:44:26 -0700
Message-Id: <20220520154430.18593-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
 zohar@linux.ibm.com, 
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 liaochang1@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lizhengyu3@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084524_816012_E9C528BE 
X-CRM114-Status: UNSURE (   6.85  )
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

kexec_file() support was recently added for RISC-V [1], which triggered
a handful of build issues on rv32.  These all seemed pretty minor, but
it looks like this is the only 32-bit platform that has attempted to
build the kexec IMA support before so I'm not sure if there's something
more complicated going on that I'm missing (I haven't tested any of
this).

The rv64 support was just merged into kernel.org/riscv/linux/for-next as
83a7a614ce58 ("riscv: kexec: add kexec_file_load() support").  I've put
these on top of the pre-merged version at
kernel.org/palmer/linux/riscv-kexec_file-rv32 if that helps anyone.

1: https://lore.kernel.org/all/20220408100914.150110-1-lizhengyu3@huawei.com/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
