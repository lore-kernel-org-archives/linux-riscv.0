Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C3FC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 23:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8w0PhbjjB8NyQcznNRnELPddlEj3ZIA/Sx8/eFumFhA=; b=YczlVIBsoId86S
	OaHUS/7iw653KY/Q33qv+fX1tvQsxiTXFPNB8gBeMNBX53BaCXrqdqB/biQvCD7PWTOF5WgUuJ4wH
	EQWQ0oIJ9TvmuzAyj6ik9Wc8RpYZwElBGbc0/qz2hyd5bJxAbbrPdxBwvkAw4Q5saTrRx4X0OBgj5
	kxHz56Dv6gZYsfkktmrsHrNx4GR9ZzjZvFOjPui1oejDsv1MZRAz4dYnqI2HYBY0ECjldP3QOeUdw
	tpfc3cEZ3mPN8eYYVqczVL/BAKyHChGGcfEgAra7XS/WZlcson9Dtz4ovaGaj5zlEcBI6vQcwiUp/
	Sqpv9xICXQe7ZjGdkrwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbqLk-00000006ax3-2BkU;
	Wed, 07 Aug 2024 23:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpD8-00000006SFW-2XDq
	for linux-riscv@bombadil.infradead.org;
	Wed, 07 Aug 2024 22:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d/17UOMKe5oLrCx17iNXp2TK19+E7NavssE5gQNb1UE=; b=IXJ8Q5ZZvrWpfajyRVtU4/RUgd
	R1lSWo4uXOXxZp2yvwANfAlyk0k8vbZHxr2JkP4kQyoUJEGgeE/knH8bSnxz+/Xf0LfN2L/09XkZG
	WLFDasCJ90pAqM8GJEoB3cziVxa2Q4sEBwbLBWxEEpkY26wQPZmXjGGwQzSpekyMQU6KT82CxH/IM
	rwJqlc1PWgLPV21+D+M+LjGeIEP96HKMiSgtKX8eJPDAU1x7aySvRNshuQxOYCatczl+j/eKZftS8
	mtx+/h+bdKxzcmfTsgmSAlkeOwbr42b5tfWkPmNZFAOJM39PryiYMxELVi95pRmElw6zGohXWXcI9
	3rf6muGQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpD4-00000006htB-1787
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:32:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2cb4b7fef4aso335026a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069960; x=1723674760; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/17UOMKe5oLrCx17iNXp2TK19+E7NavssE5gQNb1UE=;
        b=dJWeADNYspxqTq/0TDgEdvZrQPrYnsXCpmvL2ao0QPLmyyyK4JnrZ64dWeT0W7usXz
         sp2NgflZ82yFGjJXk3xriSYVgX6q6yA3PO4ZV+nhH0xGNHQwNLSdiWNCa/u1+jpvD/3s
         WpggGDO4TbATCXT1FZPt7KsZpzEi+KhOH2nzf+grYjadrhCu+wiystk1eJ8ao8Iab/oX
         9j3tjVkhD9Pc+o0UJSRGCXt4Q872b/UZv38utN/dF3uNUWWmQrQT36QWg4sZKWdxUzlS
         U4jAfpQcsFxV9mz83QHzgL0odYqCwMjY0HnHzxDK9C/VTAmRwgwVpDYpW8SXGC3G/0d1
         GVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069960; x=1723674760;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/17UOMKe5oLrCx17iNXp2TK19+E7NavssE5gQNb1UE=;
        b=CtIeMtvs/EMM4j1GFOI8aQVkVw5cBeAyMBiz6b/tzxFMop8iAp5cDQK5XGeMy9ZBw9
         M1fkiXDnK7tRp9rVpKGE367pCk6CM4nYLSMDI6JfCRxWoa1mcH5hLUpa1lMqs1ls0v1O
         zFR2/T2T9+TzsVgQXpycXYteKzbvY1yrHNQ7nD9j4T2nPwWblqCNRxMc2j4J9Uogw5QD
         wrQAJdQ/c0qhN6T/kRXdYTk/LORbeNnTzWWK2a0NZ2WZoXtJNdRIqNZISjlvrbKtonYu
         tSaD8H+0ZOTeLqN9xb9qN3/5poMrSyO1HQE1FaKo1dLs9SMe4W1VIguxfopLhd+r0gqn
         3VKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9F/bRITsbyssXBEY/jBakAH+qvnTgkpX8u/1up7e2vlh82BqdRs7iD094WTkJzHGcLsAdb9bRBJ9rZhvWT6QrLxsjFdPms50YHHmuZrVa
X-Gm-Message-State: AOJu0YzkiAMACgddG1/McB+J5nfhOOpgcPF5WlnoUm3q/Su8RfS+yVAq
	ZUNLXtM46Qiq0Ni62iNITc+8BrzCQZ+RFXV+qBogLQXMUasK/s+zivsgecb/ZLI=
X-Google-Smtp-Source: AGHT+IF6ltj6rd3uaMmAKqZ9lRxXF6GH8BM7xXm35nsHglv5MkLIzgBV5TQkDCcootMgdowWsa/ZAw==
X-Received: by 2002:a17:90b:1254:b0:2c9:96fc:ac52 with SMTP id 98e67ed59e1d1-2d1c347b2b5mr29119a91.26.1723069960420;
        Wed, 07 Aug 2024 15:32:40 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b5a39bsm2102276a91.50.2024.08.07.15.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:32:39 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 35/40] kselftest/arm64: Add a GCS test program built
 with the system libc
In-Reply-To: <20240801-arm64-gcs-v10-35-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:07:02 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-35-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:32:38 -0300
Message-ID: <87jzgsdkvt.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_233247_472095_6DE16031 
X-CRM114-Status: GOOD (  12.25  )
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

Mark Brown <broonie@kernel.org> writes:

> There are things like threads which nolibc struggles with which we want
> to add coverage for, and the ABI allows us to test most of these even if
> libc itself does not understand GCS so add a test application built
> using the system libc.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/gcs/.gitignore |   1 +
>  tools/testing/selftests/arm64/gcs/Makefile   |   4 +-
>  tools/testing/selftests/arm64/gcs/gcs-util.h |  10 +
>  tools/testing/selftests/arm64/gcs/libc-gcs.c | 736 +++++++++++++++++++++++++++
>  4 files changed, 750 insertions(+), 1 deletion(-)

The libc-gcs test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
