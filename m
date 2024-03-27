Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8129C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+ZIg/qXDCVAFIbkBJxnciUGayGCApkN2Y/ykAzcrPs=; b=a1WV7jIoAMlF6f
	fJedsARSFPO077BMMoO4HueOokKGtx9sSX5ymV/tqhYveVwc/qGPVmufwfBLjdrrD+DGF62geTt8f
	CKS4eSiws5jdwIUoASrkq6TTHsbjV/icLbwoz6aSi1MNRO1S3lwX2tojWacxn7k81iI2AhcoqGt22
	wJ9qA5gVLOK0PHgEFgzLl52urTVeS2B5PUfl03kcheoN2HNoyezp5QiGPYuWgtkoGuzTj4p+zv8bB
	JOWvJTx8ff2BQBYpEj5h9JFY7J5wlhZL6xvDluh2WCdvD2wjosF1UMEfTo6NoMS/5iK5tsjKEVREF
	zUm6J4wqR+spBTdFbAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSsy-000000093DX-3uGA;
	Wed, 27 Mar 2024 13:00:08 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSsv-000000093Bw-1r0P
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 13:00:07 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso102206021fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711544401; x=1712149201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HVEa/HFe7JX/HhqqfzC9fsfq8bO473vqm9Cz9tqeHE=;
        b=j1jV7ODeTKUgIdnFi5Vv0BPbsIkltWhqVS9Ixkm+dVb2LsiQ9i8e5md2hXiNIWoNz3
         68Auru8erwc/+sFGkfSjSDAtvT+z2HIU3xNg9td6reNiyX5BV62RkL4dPlBBnMIf/p6D
         qAY8rZ4r62rq4PpdVRlJMze9XTy3QU5/MBgJxNpc/+6zCTReHlWUw1YZlxzHAP0nAZV4
         WWu+eHS66Ds1OvF0vWXCxG3b/t9Npi+Yez3oZ/B488A5JVodGp9hFbO6FQmqhc7YA3s7
         NdbJUyBx0U5fEtrojW8n3uPn/Y22Uz5E7ARtlgkdjumLlKndmiUFkX0yOBWXls3CYdBC
         GHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711544401; x=1712149201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HVEa/HFe7JX/HhqqfzC9fsfq8bO473vqm9Cz9tqeHE=;
        b=KxaLPgyigkvE/Ib0Iu3HCmvKNuFVPti8hoSbEvGgsmADXIr56gWHpfPf8P2CKXYgcI
         H3Sgu4sdiZmZCOxG/SuZguA+UoVHfEm3WMv4W3D1jDtOL0TbpVhh0EliUWEXxPdoOfZn
         QQy3ATEhQe5nqkWa2/UPe7VTPbxHkP8+nzDpk4ukpjLDXkKIXsUV50PnIi1LcMgD+XGr
         gbGieGkIlbLravlQjdE0SZWI1ZZt4bCbjUMEUxRl8Ja1Rmmd+cLqQLenxhyXM+lDOhBW
         xzu5KEkZoSF+3AtLR2hJRBn3OyRIlOWm2q7dWC9/+Skcra2iMc971PiPPJJj/Ud1fNFv
         0S0A==
X-Forwarded-Encrypted: i=1; AJvYcCWdEtLF8L9/VqQkyj3hovQpyeQlLpPb5wZTzj7NfWBqoZRryCyi4pkgznB7EWOs5zzu40cPMIrl+q0YcQx4ECK5fIXxPA4zUIROcnJ82CMw
X-Gm-Message-State: AOJu0Yxp5TTa7k+TFLt7N+s+IPD+xuOAfPscZ/lAsmonxtly6uWA2uTk
	RKy04GoMu5+g5NvYirVgmADtqVA90IjqoyE+2vXTIp5QCOIVZqjU
X-Google-Smtp-Source: AGHT+IFouCRNYkYRV67WQAcwc9OED5iUKbO3r0hO9D8ZlgmVAFEp4RjujTC7cKTS7untWOjRuN2gSA==
X-Received: by 2002:a05:651c:1037:b0:2d6:cb82:24e6 with SMTP id w23-20020a05651c103700b002d6cb8224e6mr820276ljm.37.1711544401122;
        Wed, 27 Mar 2024 06:00:01 -0700 (PDT)
Received: from gmail.com ([104.28.160.248])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0a5500b004140c161e8dsm2096164wmq.43.2024.03.27.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 06:00:00 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: christoph.muellner@vrull.eu
Cc: ajones@ventanamicro.com,
	alistair.francis@wdc.com,
	aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	conor@kernel.org,
	cooper.qu@linux.alibaba.com,
	dbarboza@ventanamicro.com,
	eric.huang@linux.alibaba.com,
	heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH 0/2] RISC-V: Test th.mxstatus.MAEE bit before enabling MAEE
Date: Wed, 27 Mar 2024 20:59:54 +0800
Message-Id: <20240327125954.1809-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_060005_553630_5BA979CE 
X-CRM114-Status: UNSURE (   4.85  )
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

Hi Christoph,

You don't need the access to MXSTATUS. There is SXSTATUS which is a
read-only mirror of MXSTATUS in S-mode.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
