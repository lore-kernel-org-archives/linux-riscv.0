Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B9C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4GFiAoaZX0QCxQJo1xQGsjYz+RCSQeYL2PsUgn+uwM=; b=V36aMFFPkz6+uo
	vjo55NEHmTmDdC3TbybpaQSGwKvsI3p8xpzxZ+SLRGSG0ybuYk029QsdI2rZn6rrz7Jv5uyOcZXbP
	7rBYQGVMhNL6nnGFLCtQDgXTrP+44UVaQGVaLxcgVrdbpMgo5JkgrQdUE2IdoDQ1tKE7Ccjzpk7Pn
	69JESVuCGrZd5lUEF4jxd2Utn9YS7kUXmkJCNBIUragiCilXSFz4alJvAfft4ZQODo/h2D60dSw9G
	WP8JxEy4M0SnSqSCJXdopiUAdhU7Ac8+tiKVj6te0ZJ6uaGgunTlLJaWKQheY7eoyxawA0NeN2Ev2
	yUg8cT7eDO5YL1KEj8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNe6v-00Deo6-0d;
	Wed, 10 Jan 2024 19:19:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNe6s-00Demi-02
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 19:19:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50e67f70f34so4652396e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 11:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704914367; x=1705519167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5cVSTgOAWnoOzaFpiCIURaVM+zGpRmlLYF3NdjWZwk=;
        b=SkvVvfhfI6uwjv3le4Jexxd2R7/EfCW2T9Et4JgtX/WdDYErBjwhU6WJ7Aa+3VYHNL
         hiQA+FZ5LnesbGksi9aPL4RWWiTvWLrDlZj7hG7Hw7vM7UmWDTxndGMwMkNvqcBAUwA0
         zeAK/qwmNasRr+om8rvivxZfsAW6moswovjjRgK868O5RLpz/HHFNsKzM3g4yJ2ge3TI
         VZIV5T1kxcMfIYkyPI6jqjYu1iIQS8OrS/TxsOZGMA10fq7e9TmlMKAbhoR2H17tpl3j
         fbTaNY2jH1R8bbXgKnKYvrUGaS3Wq1IqvMvPgJHI0nFBhMLrSAh4F0xEbKpaIlf6S/58
         gyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704914367; x=1705519167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5cVSTgOAWnoOzaFpiCIURaVM+zGpRmlLYF3NdjWZwk=;
        b=NvrSUbu9hd/kG3jcWt320+UOER9JgV0qNvAANRGTzC4SVJSF/xQeSFeDJArvLqX2oJ
         Is7dhWRqpkHrosKVk3kJ8GgyMDrhTJICXOTmvd511e/vZmo1cdPy42Kuu1wIrUHSPDWt
         pyuRjV1MieHC3TYpPBU74hIygsu9t93cyA3r0oA4mnNzev0gVkY9M5IJFQjsRNG2nOH6
         7+gIeDrPs2fCHCoDy5TKdve9bYUuychfJkBhx6X9q+fsrBZKgi88XPo8Wbfy4jGNjQX6
         0qiv5Mm+focEVzb3GWpeA/I1RoGg8TxYo1C4dRXWq12L0jSEq5OGaTvDv6WewD40rnky
         ZLEw==
X-Gm-Message-State: AOJu0Yx8rJW0XOyfiNP3BTWfbj8eZtd92j94RHSjvScv4u3pT54bdpOq
	EtJZHy536nfjubbJvQfW8kc=
X-Google-Smtp-Source: AGHT+IEpPIA3bQflt6grfxy3W8FpVlnhz6kj9XieH8DbDol9R5vip+tGCp6qYJ+pIwTKQ47N+8X4vg==
X-Received: by 2002:a19:ae04:0:b0:50e:d3dc:264f with SMTP id f4-20020a19ae04000000b0050ed3dc264fmr545169lfc.87.1704914366968;
        Wed, 10 Jan 2024 11:19:26 -0800 (PST)
Received: from andrea ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id gl16-20020a170906e0d000b00a28bf7969cdsm2360182ejb.180.2024.01.10.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:19:26 -0800 (PST)
Date: Wed, 10 Jan 2024 20:19:21 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, corbet@lwn.net,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
	charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] membarrier: Create
 Documentation/scheduler/membarrier.rst
Message-ID: <ZZ7tud+yKHgptGos@andrea>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-3-parri.andrea@gmail.com>
 <63046420-264a-4e7c-b45c-17f0486ba4d9@infradead.org>
 <ZZ7qiIDFDEMEfNiS@andrea>
 <a759c808-a14c-4370-b47a-7db908fa3127@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a759c808-a14c-4370-b47a-7db908fa3127@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_111930_048466_2E245F3B 
X-CRM114-Status: UNSURE (   6.49  )
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

> > Mmh, unless I get a better idea, I'll expand those occurrences to:
> > 
> >   "The commands MEMBARRIER_CMD_PRIVATE_EXPEDITED and MEMBARRIER_CMD_GLOBAL_EXPEDIDED
> >    require [...]"
>                                                                             _EXPEDITED

Oops. :-|  Thanks.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
