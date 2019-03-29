Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E1AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 06:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C762173C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 06:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmEQkWig";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="R5HTzTyD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C762173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=i0IWazBcQJjHgspbIPmY5c7NBn2vrnEOgrJ6S3lyVrA=; b=jmEQkWigWlMkRGjtiM/qTuwVV
	eGPsRAF9WbX0UU0DsG5zJ+EINgnZ7UwuHVhy5aRAc1rxD4mEp6b11xzNeEWjFhCz6Tvf9fG0gbH3A
	FBNGkTzU93BzTTvcl7LNDh+JFYLWUCy9bfsGqsKUv0/kYrvf0sQXOnda8Mt//ty2vWtEGTgNDorkr
	hnNm09dHukfQN+oD15OYexGUN1aNir7gaxzEb2LD8cVLcIDJl7QwH7DjAaP6hhF66o91Vp1vzOUw5
	VAwU2qvpiwWf8TZCOmrWdskkQM6AJ7HSCcbKCJLCh1RuDKNh/n3hOmAHnFXdsp8uLSAC+g2rdnwt4
	xWfa0OVKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9kql-0001I2-I3; Fri, 29 Mar 2019 06:18:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9kqi-0001Hd-NP
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 06:18:46 +0000
Received: by mail-pf1-x444.google.com with SMTP id i19so557754pfd.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1l5JI+ZvP4zqZKbBPfvQEpr5z6b0/ApcBAe3hBUDHXc=;
 b=R5HTzTyDk169QZTZJ1fjlYeJqh2sGvCWhWKJcRAKU8hP6QJymWU4k5BT4BzC9qIyUC
 Dvac+6ytrPeA00pQUKkzqjeXQ1RC8UcmH2qYJjRT9zTTABQbcWl7wK9OlDGUoP1stWiv
 zbmmiqdR8xfJo4tkNOIq7PBIknz3zIVmrR7/HNLSzBCaifsLggPrehqUsJ8y9GxbuJqF
 Tinp3mkS3BRdnL8cMHuzGOoe7K58/wPZDKFmxmgxJ+yz4R1VkoIOqbcdKUnnR99jr8NT
 QzPWLlkSFGEEGkooMlhGXTxslSgJ788H9MIhfybBfAyal+VO9c/12D+g67YuFrseIqqi
 uzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1l5JI+ZvP4zqZKbBPfvQEpr5z6b0/ApcBAe3hBUDHXc=;
 b=jzDwZHRoW6Ulu8BsWiLOEZ5alu/+xLMbZvGCIZrkoHJoTecyg7vsTHPWooPRPOZgeQ
 QdLMIFnFsNcc2ysAmclxuXRvl/fdxC5CZgUj6iRrsespFH6i70B8N65bALafF4bqqx1I
 i5QimGzxr9TNHEu0hclBbDo0JterynAtIJ8/l0AA8tn9oe1PNzEEHSvI0LKRhqGrOmT1
 ZiUx+cIda+ntaycf5mZdKcRNDmHkRnJuGVMCY+xYMpRCpI4AV+KPX8Qg5Ens9AxGCzaw
 xb5Os0HSP3vC2vaxtkfPyUpxeP/1ld5/8OIdOdSLJkqIRVF2+JaK2CIMe4MhNBsPLPsr
 6Usw==
X-Gm-Message-State: APjAAAUJu99HD7zvU9A6/KybotnagXcm/XhuqL2mC6uT42X5GHWX5h9c
 PaejZ68KfmxUoV6VUfZAjrGL0g==
X-Google-Smtp-Source: APXvYqzbG6H1PfNnNYQIdyca0sEFVnS/c7cEhnyimF6SqaqO2FnSCJk3sNjrRKfbUPdD31KyNRqYuA==
X-Received: by 2002:a65:6098:: with SMTP id t24mr5942417pgu.57.1553840323372; 
 Thu, 28 Mar 2019 23:18:43 -0700 (PDT)
Received: from localhost ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id 71sm2500849pfs.36.2019.03.28.23.18.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 23:18:42 -0700 (PDT)
Date: Thu, 28 Mar 2019 23:18:42 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Mar 2019 23:17:34 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix FIXMAP_TOP to avoid overlap with VMALLOC area
In-Reply-To: <20190322132509.GA19263@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-05d2bbbf-c808-408e-8fc3-14c00ac167b6@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_231844_799033_4CDA1C8E 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Mar 2019 06:25:09 PDT (-0700), Christoph Hellwig wrote:
> Looks good,
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks.  I've added this to my fixes list for the next RC.

>
> Btw, what is the 32-bit test vehicle of choice?  qemu with the
> virt machine?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
