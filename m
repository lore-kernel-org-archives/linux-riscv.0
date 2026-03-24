Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F429F532E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuP0cQqeqhJrDVaQ0LEFDL/N3aSWD4/nomXeNiKkWpY=; b=jD+5CXd7KHAcUu
	6Q7BPiQX993Z/UQpqTBMaYtnPpcOQfBxT8L/SLymCZshA+PCw5+gNvckp7wtmRskBQVkuoMrPUplr
	tCEGmJSY2LLtX98BjMNFBLe5lFkOEs7qXDFNGV/HyGYuLnMA7ZWKeIsqmd5rJTP9DGYQv+vP8zAxz
	G+Y/9PbjI0+HWqpAlTfJ0PGD5uto/m4ejt7e37UGjw4PZgaCKWhM1OFJpIqB7tsQgpfpT1DtevOmo
	gB8RMUvtiE2vXQt8+fhReo545TdnxwoidVwqhS2K5hDXR2K7UW3LBamsFah/dZYoKjhdVUjw10sIM
	TGypFTGFysdG+uIzwiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vMd-00000000lLL-0dMn;
	Tue, 24 Mar 2026 06:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vMb-00000000lKb-2RwL
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Mar 2026 06:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=; b=UpGMUF8RU21KmqtmvC6Ad8ogN6
	NtYwsBtWviL7sFip2qZpbA7qOr8oSzfBlnF1qIC0Ix7FGOHlh78JNAff2N8cBgGsL+gQ9vVDdDtHb
	Vtf1yoBFcgCTwGo6VCM1gxApJYHwBRWddkEH4qJSWTEKmNe57inDL4ld4WTl795fQaXWgrNv8YVS1
	1x2/tecVjJxOknfCqoob5slpmVashV2CoSZr6EOb1eE1cnnEMJWj/mX+n7eVYGJaR5jMeE0CdRHox
	DTOhzIvZHaWW4KhYs1nsms9fun6Z7+TezHE16RLWmL8qFMsuKv8prwb76z+jXxJe5LB68CBbaVX4O
	a7fiZHRA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vMQ-00000003J7w-0ram
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:35:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so1134405f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334125; x=1774938925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=Y/R/ZjAKuKpdTkpMeyc3ckcWpyhAZfPzYlJT2snOsFv4UUiS8/kFepNB9xwZF+Hyrh
         L9tnslBTS437ip+IxhXv3pP4/JCsQ8IMyrRnWZcxEjVRYuKho5mZyQUqpJdEMSH9Yoe5
         olnYvKPX+rYPbGzGqCd8mcIHDBYzgR9eV6McgTVx7xW0C4VrAhJuMvaOKDjx2w6nh/YG
         yx96Foi6N/d2fup8sfqC2xy3XJ7W10aIydSuXw7e5lALtTeb5DxAcVO1eSYfGe4BZLT8
         8HvtvrMISbK+QX/Ggy0o1EuYu7RvL+5sn8C63alyGbDS3y41FOQEVO4opxiK8XdTCkZi
         66wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334125; x=1774938925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=GOzd+moVSQ023O6HCELhyRs3A2UHvayz8Ar4Iz/F6f35QtIDywfnimqiBSRUkXHs1m
         R4NfgcW43cfW4Jkfp2qQW8ZtImZz9uhlsg4W4Q1BSXrmCbrwdSDnacNtbIZiNEhdQxUp
         +p+jF9VRh0VY/iYCwcrVbYtgTWyEGGC8uG2/E5KOML50GMHsxsa8QjUyV/rjE/r0SNyJ
         cy1AOt7f7IrhY7UfE9s6P7WU2ahlezPuAXDRkWSLSXLtJVi65t39UWUTpc4OGy3WsmGo
         KA/ocNdZHtVLgYZp8NH1OYEEK598Uhg/I82twmvDJGxgrL+12WDMmx/fq19vPHqxSFqd
         Y1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXy4vWGRmV3l7xjHTSPiHTkIk1bc8c2vOgtdKZIn2RZ+2gIzGS1N+e2VsIX11ai7YC/lD1lTZorjuKTtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx29mPQQoHAiwHXf19pP2JkZTJPQxyLvoeG+8acjMuvj0lgtlVK
	h0Wcq/VUD4KWOPcAiTlW6t1JamYaC4XvRl73yROmU70W09VHJuz+8Qxi
X-Gm-Gg: ATEYQzyWm2lD6s3IHBSo5Qn80Bc85+6u9xdxxYFpC20bUEa+cxjHQx/YyrCvEnNUFGU
	53w2UZhqdNiuCn8rHgQsYqUeQLlZi4jNUzIWH9esdLrjWCrr1RixyJy3A7RX0jxfgtQNTBUglmo
	dM8iAjsSciSZweUXxkGuI8hFhRzv+GdPBmrcpOL9Mx+4CLjHDfpoIoAr4eWwkp6QjwOvSr1YcN7
	UZe9vQ5b7OityORzo3Eei+zZoNnJKGB/5ncp0r4F/fO7YrVSO8cFjAR6sicYAtyYRMaG8TtX/Fz
	Ip+32YzyYTUlsg1IV8v+s/JA/iF0QKaWTUqyuoMAfOBxEdjHVEbfmULgKQzb+wCofum+g/ORblZ
	Ki8clGohg2+68/IpAWGVb4FoNVNbPDZnYm19DcGTIIPbFLs+yNCUHahQPLLuVeRf/zDHyHuOmJW
	fVyUq+YfSf2cX6b2meiKc=
X-Received: by 2002:a05:6000:1aca:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b6423fabamr24225594f8f.14.1774334124571;
        Mon, 23 Mar 2026 23:35:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b6470380asm34457509f8f.24.2026.03.23.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:35:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ruanjinjie@huawei.com
Cc: devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Tue, 24 Mar 2026 09:35:18 +0300
Message-ID: <20260324063519.3258161-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_063533_329629_A6270E61 
X-CRM114-Status: UNSURE (   4.68  )
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

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
