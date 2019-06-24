Return-Path: <SRS0=P6b6=UX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F83C4646B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 21:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0ED720663
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 21:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nxd6wZAj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DHSaqTwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0ED720663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smgC9VckS0Iv0Si8M7RQdaDscw15RCsoohEpJDlVGB4=; b=Nxd6wZAj7tDjj0
	4sygWWfShbwyzxyXaJncFECt9W/x8j7HGgVcdyod4W8JvJw/yY/79lQw5slGzbUKcbfE1gdBBgPEO
	6syry9T2U9t0JAno86jRs8mEz6Og1RR+vwSB3eK4d8KvTX7MfhAQa8XTV41SYguvzDQetVCM8bE/9
	rInZgxfg4gIXWxiUU7GY/X6Map8YLAfJqyFNvAHYmGQ1eVFtv0ri+0EGs3JwMBk4U1YYTYnlllPYc
	gfDcNcECuii1ht1//h7R1TVR+HWvWA5tNd7gKNMUbWsq9Kb9iYFkdqg99sp0f4BbRPh1OOd3qAy1M
	FrgAUAUcwla+9Qnd6/xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfWRE-00073p-1c; Mon, 24 Jun 2019 21:23:44 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfWRB-00073T-Gz
 for linux-riscv@lists.infradead.org; Mon, 24 Jun 2019 21:23:42 +0000
Received: by mail-io1-xd44.google.com with SMTP id e5so326052iok.4
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2019 14:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=fs+nly2CqDJY2F03DH2S4onxLharejPukjuN2a0s++k=;
 b=DHSaqTwlJv7AurjXB+C8yOpKCNMewWdCZE4JcB8h/68BVRArdlHcI3Z0CrqS2lOl4N
 cEuIUQ92NhpHODPahLAAAbPLC3F3VIDggVp/hnDP8ARZc8HllIYg2VTXTIHSFZeVOA6P
 EHoCDwGc1moMGzaIOzYrQ/0AYMsFdMmCbS6F3sPuj2bmiaic+wYjH8WB6ENupkdcmDon
 mNZU3TxmidJOwPzPrNs1hURzJ14pEcIuPh/sfV77/TmJDAjSe7zU8C8/g9gsUadaVYyg
 4AvvVKmYbh9EXCCQNrv+YfL0FQGqaZJqjFHbPLVNXefr5LJA00rvZIKPg1D6wFA2qH07
 S3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=fs+nly2CqDJY2F03DH2S4onxLharejPukjuN2a0s++k=;
 b=GWRpYTo8JPSQcgBSwotkaPk/WaX/05KJiFWOiRRza+JLO7WT2oBqQmKxjsk3X7RKK3
 pF+BU+78mBuDZs45GqebgwGwz93X6HhQ/dj8GbFUhjGWoAMccoyCa2vgB6Mw6vBn6VsJ
 YsL1wKsHIv7VuZclCgkkV5pM1DXbGS1lk3N8sTNB1Myf0o6n5GM+Q7LcXJQVPvCYS7db
 8T/HBecVgTGqVJNp2scY4OaMd2bN+g/Sx2oBwftvKR4ZuPODbGVcacWkHjDbxmyBkHKt
 rr0m2m0bWZQPx5+lnGRE/+vwfrYo66SJm72bgM/GX4vVp83/E+kBIOwrDOZb6ROh6yMG
 hnaw==
X-Gm-Message-State: APjAAAVgrFJTyBhwHUKEdYY/0E6+AD/L99JeHuJqsjupikq0tSzvz4SC
 FQBjHJBoND/HUbDcq4ErJKeB+A==
X-Google-Smtp-Source: APXvYqxgSwaipvyNNYGbOgoKTx3/dcZraYFCAkDEUKEpgskncaj/x86AyejV/paA8RMTb+D5/LZPNw==
X-Received: by 2002:a5e:8209:: with SMTP id l9mr18130595iom.303.1561411420072; 
 Mon, 24 Jun 2019 14:23:40 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 p25sm14832445iol.48.2019.06.24.14.23.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:23:39 -0700 (PDT)
Date: Mon, 24 Jun 2019 14:23:39 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH] riscv: dts: Re-organize SPI DT nodes
In-Reply-To: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
References: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_142341_598042_5BB047AF 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 24 Jun 2019, Yash Shah wrote:

> As per the General convention, define only device DT node in SOC DTSi
> file with status = "disabled" and enable device in Board DTS file with
> status = "okay"
> 
> Reported-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

This is a good start, but should also cover the other I/O devices in the 
chip DT file.  The mandatory internal devices, like the PRCI and PLIC, can 
stay the way they are.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
