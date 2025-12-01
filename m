Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830DED116F3
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEeCJcfB7f3oyWkOt9WkxX/FQRCOl9TObpM9qk/iWfM=; b=5AvwZ/3feFKlq5
	hqpI35xbFr7F6o6biDCilxbEDZjYL9ajGI0GWGwN7jR/mGUtsyx2UzLiSEQjQH784nAp3QoH+DrpJ
	0T0TN2k4HZVOmtmL17ZUhoRke02XjwHFM2a001R2236Mo9FsosUVCh0TMFNordsnYogYHmZ/7krxb
	Il3Nk6UV9eA8xKZYgmXaLfOreFJwz4WZfI+LyU9+xIYR5zdSA4pWMjqX1uZ4g+XsUyMAwBoZw0k8h
	tLGk+8vv3lAOiuJWIy/oQLnO8hR5MLmf/B0gh2o3ctlAv1YDERhju/Z8ZqEqSsDhfXkqJylvDTVNy
	Lj8HFAvGhaZIYowobL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ440-000000041uc-18M6;
	Mon, 01 Dec 2025 13:35:36 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ41t-000000040B0-1xYE
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 13:33:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7aab7623f42so4525066b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 05:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764596004; x=1765200804; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6/zDtzLQ3mrDGsn5l6i06J8GNek6GlWuIZEcOWe0BHY=;
        b=BGuYFR7Qzga1EqBLgmFwoKVtclzzi+f3aqKF3dAT9aUOVWkzPAashxxPN2Tx3PCkLt
         hdTdictkC6HhYom7nV+cMnC1N5NEhbIrfiAh8oQahE3LvcsRegFOp/YGx9+F3vUpxHj+
         4qwO6nIhrh6M4Dug7bNCRe3X8xN8DjPtAACkqaj0Lz0l5opp0NvSbK03TKCClDIyNBtq
         xPFfnvfsSnWnz/1CFdIodTYN4h0aq58Ppf9dicZIQUFTGEDQj1b8vukzgB3qZPWGxE5e
         qXIrkKHj/DO+jBkzljX3x9YPy+1ZPW0RqflteHGuCoOMsyzrPPlcZnvEdIiPorLBhWRZ
         kENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596004; x=1765200804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/zDtzLQ3mrDGsn5l6i06J8GNek6GlWuIZEcOWe0BHY=;
        b=PVu7F/V4qTMhduy5bUSUGDXNwX94eBNTRFFI14Oofn0ch6O25yN+EeAgjIZyehZwYK
         3oY+7l75UKKJjZifsUdp8CRqsSXEjxnu9+zORipXRDbEOWQWLJbp/qGdVTAeR4ocaGu9
         Nz/ZqdrXeA8iJMvFiJi9tGpzc0c6YMzBzP2dwNaVOyio2GqpbVCXi9l2n2gJL8hkZXE4
         ROTBmJuCCGNzqTiDwSAq0fAoNdbdiqKdxRchNGW1x/pTAK/nst+uXhGah7jOJSo39k6P
         e6IVrashQEqSC3Q9wj0nRe22aUcf5TzqL6F3fomx49tn8hw5dMn3I9IeC5ZOEFw5JO6W
         yYQg==
X-Forwarded-Encrypted: i=1; AJvYcCUcuWKsmD3Udn2lV6EzGVewO2IVoDII44X0kUlvisDhynUssid+3EUCWSAmG4xU2jX1WBrnww6jzAnrUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxfVTTpPWUiM7gIfZ1KqVYgyVE9uxB7HpX54MAvKzbhLkmDOdU
	UpIrqEjUBeHJubhT3aTOtgqDtO1mU60MZGcDzCTSxjMQIoNfZ7UNP6LmiRZxMr8q9Rw=
X-Gm-Gg: ASbGncvKFE2X7ctBVDgzUojE2Szjv0SmdAgrZIucSqGCIoOr8YtW1wzoqJ8Z8YssRQG
	wTnJzk12BH4+Nwc1slAQeR+sjubewXhnd/Xa1kJapFumXfDnpyCVV/yloMAvMtp/1il+G0OEygg
	2F2vAx0Z+FkOvvwLBGYeJuFmf+s7qOZgJvr4TtFGqUbDFGThBdo1YFcjIPe7qbVGgbHaJ31nHSx
	pIECQCjt2qIiiEqaU+IJgCoe1GWPxKeXni+BuEDqT8slqVJxUh0pjAqW9LtCrP85wGzNuICWkrp
	gU/vajE0J25Z5+1f8S2xad7SzvHGHtPjZs3kgWQquA73R4ShgQlvJMdIZvSVG0gPQc3YutEECaU
	YJH/UcXCshiMljS/m065TJhK6uI0Dcede2Rw8fkoG3S4uRXjEGAYNEJtOw52DqWdbKyXTHtNPnL
	Hi1lelpade46bU0AmeRpkFi5JhdBtn
X-Google-Smtp-Source: AGHT+IHKFtSw/hePVAblgBz7XowJWwPF88SK94EexlhYEAxjFsftk5tagEj2K8x0BHP2JoIqJWGmSA==
X-Received: by 2002:a05:7022:41:b0:11b:b1ce:277a with SMTP id a92af1059eb24-11c9d8482b1mr22957607c88.28.1764596003940;
        Mon, 01 Dec 2025 05:33:23 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm72909407c88.9.2025.12.01.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:33:23 -0800 (PST)
Date: Mon, 1 Dec 2025 19:03:09 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: huyuye <huyuye812@163.com>
Cc: ajones@ventanamicro.com, anup@brainfault.org, aou@eecs.berkeley.edu,
	atishp@rivosinc.com, bhelgaas@google.com, catalin.marinas@arm.com,
	conor.dooley@microchip.com, dfustini@tenstorrent.com,
	haibo1.xu@intel.com, lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, rafael@kernel.org, robert.moore@intel.com,
	samuel.holland@sifive.com, tglx@linutronix.de, will@kernel.org,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn, liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn, lin.yongchun@zte.com.cn, hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn
Subject: Re: [PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <aS2ZFdMFMwdlLHA2@sunil-laptop>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
 <20251201130757.7032-1-huyuye812@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251201130757.7032-1-huyuye812@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_053325_517263_2342CBC3 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMDEsIDIwMjUgYXQgMDk6MDc6NTVQTSArMDgwMCwgaHV5dXllIHdyb3RlOgo+
IEhpLCBzdW5pbHZsCj4gCj4gQmFzZWQgb24gdGhlIGFib3ZlIHBhdGNoLCBJIHVuZGVyc3RhbmQg
dGhhdCB5b3UgcHJldmlvdXNseSByZXNvbHZlZCBkZXBlbmRlbmNpZXMgYmV0d2VlbiBMaW5rIGRl
dmljZXMgYW5kIFBDSSBIb3N0IEJyaWRnZXMgYnkgY2FsbGluZyBhY3BpX2Rldl9jbGVhcl9kZXBl
bmRlbmNpZXMoZGV2aWNlKS4gSSB3b3VsZCBsaWtlIHRvIGFzazogb24gUklTQ+KAkVYgcGxhdGZv
cm1zLCBpZiB3ZSBuZWVkIHRvIG1hbmFnZSBkZXBlbmRlbmNpZXMgYmV0d2VlbiBtdWx0aXBsZSBQ
Q0kgSG9zdCBCcmlkZ2VzLCBjb3VsZCB0aGlzIGJlIGFkZHJlc3NlZCBieSBhZGRpbmcgYSBjYWxs
IHRvIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyhkZXZpY2UpIGF0IHRoZSBlbmQgb2YgdGhl
IGFjcGlfcGNpX3Jvb3RfYWRkIGVudW1lcmF0aW9uIGZ1bmN0aW9uPwo+IAo+IEluaXRpYWxpemF0
aW9uIG9yZGVyIGRlcGVuZGVuY2llcyBjYW4gYmUgZGVmaW5lZCB2aWEgdGhlIEFDUEkgX0RFUCBt
ZXRob2QgaW4gdGhlIERTRFQuIEZvciBleGFtcGxlLCBpZiBob3N0IGJyaWRnZSBCIGRlcGVuZHMg
b24gaG9zdCBicmlkZ2UgQSwgYnJpZGdlIEIgc2hvdWxkIG5vdCBiZSBlbnVtZXJhdGVkIHVudGls
IGJyaWRnZSBBIGlzIGZ1bGx5IGluaXRpYWxpemVkLgo+IApZZXMsIHRoYXQgc2hvdWxkIHdvcmsu
CgpSZWdhcmRzLApTdW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
