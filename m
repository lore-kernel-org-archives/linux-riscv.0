Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139A5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 07:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6ECE2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 07:42:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQnaLhaT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FdcQOxmq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6ECE2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Xxtwyk+wU1IYUkKqv21WbraXlygyknBCUbuz6KJh7pg=; b=TQnaLhaT3ZPKUpW/RNdcXZeWz
	aDCgYc3W++1KixLMY3d3/M5inCf38FKBFjWeWFoenuYUE7pVIzV0avLe6EdnOMnlL6U/LtdwARX/b
	EB3NUfFKAKPJyUpXHmh/Tzx84e6UGYgw7+YqBdVa7/2NU3pu4Hf16ZibBqNkClo90P6XZeiZadYVv
	gqZ4ZdmniMgpkwjan4ht8pXLy51Yf1Zhda3kg5+Qm5IaLa5ISFOMKpMpb7eB2ZM8adsCnki2q+C9j
	jNPW3iMHDbRtbQXKPVRwVg1V/3INpuF0mwH4thnYw/vlLZz5NBxjTybJMpA7UpOjQn//NZWAA/C52
	5/WsKdyhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9m9I-0003J2-8c; Fri, 29 Mar 2019 07:42:00 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9m9E-0003Ij-Lr
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 07:41:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id j26so803415pgl.5
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=87AKfepmg1YBU60XI47JClmDBJwrH1U9K1JCCxH1FIA=;
 b=FdcQOxmqgkufzB+tIMV+9tIAVevjyvHuEl1tI7ZedgTO+wmgMfQoe7wxbZo0sNPYpA
 TQuIAwzVeFx4aPtz9qcqnDGUdvtbGcC2WdF32Jcnyg1VQl0jb4V6EqbwPxMbKF+KM7/n
 Hj9O8I5KA1aqIq4cQF3+2Xb38n9N59QwoLnren8ib6uTgGE7tmYWkGVwS4TJiXy2LrTW
 XnNApn38hUgWy1vBFboT9VyCFBp4BXk1eFhferM84XewHAaaQHljofVmUVj7GgOtPfU1
 t4wRUjsV/tKxBG04Tdzp0nInA2qDfE1sVeFcXqFjq/J+SVpWBz2M7aNTF/mjKDizFDwp
 gpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=87AKfepmg1YBU60XI47JClmDBJwrH1U9K1JCCxH1FIA=;
 b=sqmhz6XGCLYG6B+b0yIaIPDfCW6bBoK5g8WCT/AIZl8Z2WKwoXk47Ga8+MJZRQskA/
 doYJB/JOPuXUAlrAY8HAj3KQaulH0cpciE5eN7QbfRHp72i78qNYtziflBSyIzTKIHM9
 4AT90bYqHDd0PShm2TNL/plcqcFg07CB8So6LH4f/d3i/QaJDqzKv71kEGrFPkm7OXem
 Gv7ALSRqXZCT5RsE/+n6BXOcTRRDogBMz7uWs6YlejYJlhiKl/yyceSZlFOjJd83BXff
 6TYLZgr4ddeuBlevxF29pZzZ8KkDpZYUOsWwHy3KkRZcMySKwICrr3jHqqKc9704yqb8
 eXkg==
X-Gm-Message-State: APjAAAWMwXxhigQ/DGlL0/SDg/3Gnx3+AGK9aOwxfYLOznpfdKltK0BW
 6+lB6LF2cHHAmKOMtZC+FQv/mw==
X-Google-Smtp-Source: APXvYqwmtf5zEewvs8sK1oWcllagagYPnj9wLGSYUC/XDbHLXNvIvx7rAjCRBOwTNZfs+XnT4/6u2Q==
X-Received: by 2002:a63:c104:: with SMTP id w4mr16958115pgf.409.1553845315988; 
 Fri, 29 Mar 2019 00:41:55 -0700 (PDT)
Received: from localhost ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id l74sm1846305pfi.174.2019.03.29.00.41.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Mar 2019 00:41:55 -0700 (PDT)
Date: Fri, 29 Mar 2019 00:41:55 -0700 (PDT)
X-Google-Original-Date: Fri, 29 Mar 2019 00:15:55 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Use IS_ENABLED(CONFIG_CMODEL_MEDLOW)
In-Reply-To: <20190308145302.GA13397@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-3944e622-92e2-433a-8965-c7b3d2de072a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_004156_779122_4AF8651E 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: joe@perches.com, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 08 Mar 2019 06:53:02 PST (-0800), Christoph Hellwig wrote:
> On Thu, Mar 07, 2019 at 03:56:34PM -0800, Joe Perches wrote:
>> IS_ENABLED should generally use CONFIG_ prefaced symbols and
>> it doesn't appear as if there is a CMODEL_MEDLOW define.
>>
>> Signed-off-by: Joe Perches <joe@perches.com>
>
> Looks good,
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks.  This one is also in the list for the next RC.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
