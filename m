Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A799CAC5B9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RCdaWMSh2EYlh+1agO+Y+KROC29x5g7o3A1j04o2/U=; b=aJ0Mcsq1ZMWjCZTdfgMHL6OjZm
	xHnJF+TfDdmR32AhfN5dY+5nBNGNvBwZnPZWF9/ccXXv2DaioWxHqDG8Rj+LugYWPElxmyOk0pkxg
	xkeAH5RfFxiLRwf4gNvdGtbVi44bIjPTWFkDVHU/JnNpxLIJ1x/WQNNKk4l13WS4MLHv1QROkrjKY
	3m5EIv2AULOu0WHhCau8emAUC2cTykmogUBKbSUJ/YHjcOimxvPAT2osmq3UEiApZ6xb/BBxfMNcK
	Bc0eibhB/0YI8g0SBGFz+f1tqh92EXuI/CjGnjoHx2PN34vA95Gib3gxbCMnqx+f1sVjgy5I/X/a2
	QKzOG+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v270p-00000000wF0-38BL;
	Fri, 26 Sep 2025 11:53:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v270l-00000000wCL-43Nz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 11:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758887594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VLEhIrJlHfb6A8TjzRrKlq1NWG1Fjm+KGzJKyI2nT04=;
	b=GomO50C8CKw6UATx8kTHbxG5sLDukZ3XfgkiV5euRf+KmfHfdqMD6S+5T13M/xSvY3YSxl
	2IZqmba5NiKgIzlvq+wxX68JqBv8LdNld9gao32SH8pHQhIDrWKu31YjP37NXiIr0Ge9z5
	5PaQieVqSmtQLgkk8ZGFNkR7TIMc6IA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-ABErQ_LOMMqxbM2WX5LXsw-1; Fri, 26 Sep 2025 07:51:37 -0400
X-MC-Unique: ABErQ_LOMMqxbM2WX5LXsw-1
X-Mimecast-MFC-AGG-ID: ABErQ_LOMMqxbM2WX5LXsw_1758887496
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e38957979so6911915e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 04:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758887496; x=1759492296;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLEhIrJlHfb6A8TjzRrKlq1NWG1Fjm+KGzJKyI2nT04=;
        b=dF/U8pzBiCDObasS6M0IZcqt+RhIcxlrvK0K7iMJF3SsHAhugReKLoLz8eeh3u33n0
         K91WuQHGDpmzj2Xk8XoX0zX4B8Yrwe8QGKo/8WVs0O4pPRnIe3WmdpFcyncP0tH8O1L2
         oLkGVESTfsO5BQ6Jhs4EufBslF2mMbN60F6fDqjKmAnOgbcKHbzG5Z0xHfTMg94Y4f5d
         QlNy/aMabrkcWlbPJHNyqCmf2gFVYW9GHXJ9B129oSEPmZSiTl3/ROdaQ08qem9IpRKe
         kyPVlaXOU7Bo+u6j3Z+fCTZ3VgLk8dEwuUh7IWHcb0Lk93zSnTjmwXzWpm1ERx6siwcg
         /v0A==
X-Forwarded-Encrypted: i=1; AJvYcCXdTKmt6ITJsMy97l1YdB1LFK3sTUWfKwTXZ5+Rq9f52jb3blnIgHsuKdQK0q6hq3TNYV8iqu3K6QZHuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YytdrsCzWtXs9l4VWYnvDPNq84jUoxamK/A8gaYELTrQlyTRDmk
	UryO+c0q69fkUTH97p9Xyl8Hdyy58OqyD7JLIRFB7KClFjiJ3s7plalEISH/8U3o0S/SBiIF1Nw
	wleCkIN9YJHObV08kT2dpKQMxZoZD6SuAXu71bhk3f+Xulsr3ahLSOPsf/g4ucYYJWNgYMA==
X-Gm-Gg: ASbGncuzZ4Zsh0FEauRdVBDPqPK996UzDU1DD8phfBlQOXB2qMq0dHz1+NBVKzMxYW7
	yVgjAUmWiSEXSFykSpq9W/xD+U1oLWSSf6J+GYLJTDH3HS7S6YDWHOOM3RgyBW0gBbe8ibKQ5w8
	wudxCwp3BI2155LFx3EAobjl9SXcidPvSGTZFNigzbYQ5sXG2SBnHnh+1lDL2jSm78khEIovsk2
	p+Ct8Kh/6txpbORPJa5x+41UiJn94fs7Z68LxNZWHhQdCW4ZRAKT0dWsSRNUqK10sfdzI8c8yvW
	+cFfWFdDRcI1Aa97g5eEv+LVdmGWW8wSkEawZ1hrFM90Z1eGV18EsViR304R1hg4rPtjGALjm5J
	5vKDeqw==
X-Received: by 2002:a05:600c:8287:b0:46e:3dc3:b645 with SMTP id 5b1f17b1804b1-46e3dc3b88amr17813125e9.3.1758887496091;
        Fri, 26 Sep 2025 04:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhEuRpxIn4z6fRY26sp9Iq3dQid2wrlFsVQ9tJ4On9InvvWfOwTygPAa/NdBQbfhwDVMhyRg==
X-Received: by 2002:a05:600c:8287:b0:46e:3dc3:b645 with SMTP id 5b1f17b1804b1-46e3dc3b88amr17812865e9.3.1758887495593;
        Fri, 26 Sep 2025 04:51:35 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net. [47.64.114.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31bdesm112709175e9.11.2025.09.26.04.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:51:35 -0700 (PDT)
Message-ID: <16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com>
Date: Fri, 26 Sep 2025 13:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250513151631.3520793-1-namcao@linutronix.de>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250513151631.3520793-1-namcao@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u141Fn9KuiIvcrrNZ91OaBZY4xZnbi-0JCpF0jHfqAc_1758887496
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_045316_075976_34EE5EE6 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13/05/2025 17.16, Nam Cao wrote:
> Add KUnit test for riscv kprobes, mostly for simulated instructions. The
> test install kprobes into multiple sample functions, and check that these
> functions still return the expected magic value.
> 
> This test can detect some kprobe bugs reported in the past (in Link:).
> 
> Link: https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/
> Link: https://lore.kernel.org/stable/c7e463c0-8cad-4f4e-addd-195c06b7b6de@iscas.ac.cn/
> Link: https://lore.kernel.org/linux-riscv/20230829182500.61875-1-namcaov@gmail.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
...
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> new file mode 100644
> index 000000000000..3886ab491ecb
> --- /dev/null
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef TEST_KPROBES_H
> +#define TEST_KPROBES_H
> +
> +/*
> + * The magic value that all the functions in the test_kprobes_functions array return. The test
> + * installs kprobes into these functions, and verify that the functions still correctly return this
> + * value.
> + */
> +#define KPROBE_TEST_MAGIC          0xcafebabe
> +#define KPROBE_TEST_MAGIC_LOWER    0x0000babe
> +#define KPROBE_TEST_MAGIC_UPPER    0xcafe0000
> +
> +#ifndef __ASSEMBLY__

Could you maybe change that into "__ASSEMBLER__" instead of "__ASSEMBLY__" ? 
I'm currently trying to get rid of the latter in the kernel sources, see: 
https://lore.kernel.org/all/20250606070952.498274-1-thuth@redhat.com/

> +/* array of addresses to install kprobes */
> +extern void *test_kprobes_addresses[];
> +
> +/* array of functions that return KPROBE_TEST_MAGIC */
> +extern long (*test_kprobes_functions[])(void);
> +
> +#endif /* __ASSEMBLY__ */

dito.

  Thanks,
   Thomas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
