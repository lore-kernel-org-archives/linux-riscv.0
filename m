Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDD1CD5BC2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fybLv3kO8HS05MwqLNRe/NPeklQzVi5dy+H66VXSZBY=; b=yndWtK5Y5lXFk6
	O+k2HwpxaeSTnZXqWcJeKenRTGeH9UYJmxFpr8pjyS+KA0OoMa/79F6bK9i8lEnNdaDXWShxudz9O
	L9l3iXSDb2q0JXPJO0+yAhTKOiyMA/loWEgyM3HikaUFX59UHXD8Nief2nbey8ofdUWsa9YZUFfB7
	3niV2vk1BJ80FIzzHwk/DxgQEODcDTVtpyJ1Wtd5n4PtVWYVe6cDsbG7ckxXFrZDQFtVdgsX/VcyR
	7X2UErE3tYJcwSYrNmUdDlGfZILEUPEjbpaI/1yUdG8aLfprmtqIajiNYwD3acvZANbb6GB28wkMV
	CnWZ2Q3UXGFg29Ugs75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV6h-0000000AM9X-0oGr;
	Thu, 13 Nov 2025 11:03:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV6e-0000000AM8T-0PMp
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 11:03:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso584112b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031791; x=1763636591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cKN1EDDwxjht3NnFiE/uLPr7VcrNdhZ1SW6uQPT/kU=;
        b=OzLXA1Dt6c7nDTl8nw8xO9vqX1DCRgyVLytC/2TOErfd2I9aLHnJb1YFjO8plrnQan
         O8vnDBpbJSDxucpD8AuckPLrzl3Z7Nzdi3jVILGSfseJmhCxR9IBgE0/ynrQz9EP7pLK
         tnXeBtY9/8HBmGMbuMOI0YqrE1W/qQ7QtZ1HyxSBjI/q0zYorA/YaJl0zY+RaratlXF+
         5lqqzVFiAqBqCMSCBwXKeTaKb2tiGrs71GNt2hzFIEWWldFro/ywfBxg43t6gYFHwm28
         LLuvZgtVLsEFkM+QGZegYr1h2x3/3HLzr8F857fsK/2dmdKrCBSlNB0RPF+h7ghxVKP6
         YDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031791; x=1763636591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cKN1EDDwxjht3NnFiE/uLPr7VcrNdhZ1SW6uQPT/kU=;
        b=ofDj8rFnaqG/qWrnXueZZ040z3a58wJIQhLBIVxxNI8crsWnNsAZ5LpFg8IVTHa+ay
         RTafYVmZiE525/2TKEQmvkf5WzD+IK/4WMrhi/aNQhzDrvYC/H8cTMHnHu9q9+G5XJDT
         ReLG+5wXIvrWc8Dy0/gU9YgjuMQ07w93FdJ/oazcc2Z5x7gka+DH15FHeNCOhiqz2+Ua
         ixAnabwxozc6cFvm7uHnLhiTcBHyYad1hsxSM6KmO4A+WbRpGr3oWmT6tJb3dPnYGhgi
         JZPLVk/iaK1KGY7vCbngSpdxc+XPKBJk+HgsxFimrwEiZ3M2Cz7X9vWtUnOAci+I0aSq
         8XEA==
X-Forwarded-Encrypted: i=1; AJvYcCVsbMZKOQFgSDDAkfqxZT5rPwjSd0xbjkQFCG7HtpFXS8wwRZ7GgDz9mP4SL12G+1TbwaQH/hp9VapOAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsJp2shWQbKyovdsEd1JgZ2NiYTKeelVOLqMtMN9SJKcBlAU5P
	G0fWJmSsneb874HS7YWHlkirI8b79lqDYAiDy/VCidQPavZCokpb7bWl
X-Gm-Gg: ASbGncve7vu4jq5QYVMWgq342QEa780RRwfssDF7+cutqBevWdaPFs10quRGpfp0L2w
	29+5n/ivckwp14bUqtoFm8Z5kKEwh4hrCw497T9+YXs9ew/ugRsgSp7MBa+jj9NOWeBvh+HnmJf
	8fkRcE56QFvRDHwIbBXgMD1rDzhIpC6gZvCRffqRGGgR6UHZQ+7t9ZmUtmYN9KAvE29wVfCXzZv
	1hQcL5jzCazk1gLGvh3YShBvk319OvYRb3xBentYXv4GFTp312BxkH9afhWbyUWZbPD5HCKUKQv
	ybsrY2J4NtSA60YJOXJ3xB9V4gsBml1b32v3/eUf+sii0fOsOQSPqxatrdkrp+UTE7vv6VX8kxq
	5f4EVl1zVFhi6ahubaluSeIp7/DByH5s/4fJYEA19hNmMIruUqMHrQ5IxH2mConh1ERKTVW4s6V
	x2hrzfhEP1tAS52LrPiUHz7OJA
X-Google-Smtp-Source: AGHT+IGTrsN1hzBjRmhe38pf5EQcIYNA2LTSuiXM2QFdlDo95u5VGbYJOeAKPxxp1waIKqvLyyQ7Tg==
X-Received: by 2002:a17:903:8cc:b0:298:46a9:df01 with SMTP id d9443c01a7336-2984ed23fcemr89013665ad.3.1763031791060;
        Thu, 13 Nov 2025 03:03:11 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c242003sm21657015ad.24.2025.11.13.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 03:03:10 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: qq570070308@gmail.com,
	riel@surriel.com
Cc: aalbersh@redhat.com,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	andrii@kernel.org,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	brauner@kernel.org,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	david@redhat.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
	jlayton@kernel.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	lkp@intel.com,
	llvm@lists.linux.dev,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mhiramat@kernel.org,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	oleg@redhat.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sforshee@kernel.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
Date: Thu, 13 Nov 2025 19:02:46 +0800
Message-ID: <20251113110246.57703-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113105227.57650-2-qq570070308@gmail.com>
References: <20251113105227.57650-2-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_030312_129321_8F30F88D 
X-CRM114-Status: UNSURE (   4.35  )
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

Hi, Rik van Riel!

I fixed a build error in this patch, could you please review it again?
Link: https://lore.kernel.org/20251113105227.57650-2-qq570070308@gmail.com
Thanks!

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
