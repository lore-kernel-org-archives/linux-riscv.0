Return-Path: <SRS0=cAep=XA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52F5C3A5A5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 08:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53182070C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 08:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2TQ7z2w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ebB8Hw3M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53182070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddAz27KJPqQaOUjSl8auQnZyNTWYtUK/Car4nIExOXA=; b=S2TQ7z2wPhaW6N
	WSAEp3jUXGfNC3qOpi8eYmGCMdq8Yo6RSoZGaNU7xEIGvqKyzqPS0A1qSTVltRzH84SCDNRU1b6Jb
	lKAOe6VIrq2R7zTDc9Eshv+hZJAWor8c1osjEp4Hm7UkBMf4bNiBRX619tsFEWRc/MLbk659YhCmL
	H2msysKVYwGRD27IKM44/syz0AygKKyLXC580r9CNWV0cPnuDwoY2mQHjaAzLXfQVK5xkxqIGTsrU
	Le6jouMmEmS5pdCVJgmUCbuKSY/n9rj1nZeoaE1yEdiiRGqZ0Kdoj55+kiDcv1ptFF23ZH7o9MPIO
	6rnZFV0A/UihyoU0s+vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5nPB-0005Iw-Ec; Thu, 05 Sep 2019 08:46:13 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5nP9-0005Id-Sz
 for linux-riscv@lists.infradead.org; Thu, 05 Sep 2019 08:46:13 +0000
Received: by mail-io1-xd43.google.com with SMTP id h144so2971241iof.7
 for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2019 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=n+8GYsbOuZke0FPu2jyBC2Zd40xC0wf4raNZV2u6eis=;
 b=ebB8Hw3MFacBxf8uDh0EfKcIawQ6Tu5jnSKanAszZdjYCBcO6FavmxtPZ1AmrQSMjI
 +0u6SNi/gQofyWsSX79wa+1QZw733vxjLKqoZHXtlqYLSSSphvwHL+KKduzPn5Y9Net7
 /Mh7OrSd8cIfOygutefrsMQT9x+YGVQ4kfZpe7QHOVv6lAX+3+luGE93ofuJB9ISXA4D
 mAaXOlLHob6mX5Biy8YjFujjnivcLRWkXBpea4gfS6OfDht/6iJLRmPWAPdtmxCG6AM9
 xtaQ7dAgLpF5rXVFDm/NBT9VQqdWAS7u7EkPkU2ZgFZ+A5s1khRksaXX76HgevaCMkII
 2cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=n+8GYsbOuZke0FPu2jyBC2Zd40xC0wf4raNZV2u6eis=;
 b=P2HtjSSS6dWm5ZacE7O1fNf5lm1ynWnk7xdxHu07Tz5H57bVkAiFOCbqLAKPqY/bOq
 s+o2oKB0VPpgsgMf01uCoMYwLTZZDnP/vhFKIhhteMOaTURG24/J8dq/B7cTHZ2D0obz
 SG4/NgA74/ep0Hy+WlJ7xna6QNfjoqMbDauoqvcEOi5M6kb6enUgmh7zaAQuFn6tlLxv
 VzdhvmxTLOo1ude85Mp68fBSEtVdaRyPZlB0SUBeNdNpUQcDu+v3i7deYe8cLZQs/vC4
 lrT4vEfDTeaEodvo/cNovKOwTtDMLaa3SWigY0sxDGCIVC5i4yuLijJU9ETnmL5N1SJH
 IIaQ==
X-Gm-Message-State: APjAAAVmdoqpoPyhlW3mMJz8veGl4HNUEt6oWOq8FHGGBpsclx5R9QiA
 bLiuN5UfQfHwkMEeKnhrlmtXLg==
X-Google-Smtp-Source: APXvYqzviX/JH9pBDh9d9fuUOHfvDxTO2iQdBVrkiMmNOJ+c08wbmNjrsdyNdduORNL2dzY0hQLdDA==
X-Received: by 2002:a5e:9419:: with SMTP id q25mr2662092ioj.249.1567673171187; 
 Thu, 05 Sep 2019 01:46:11 -0700 (PDT)
Received: from localhost ([2601:8c4:0:9294:cb6f:4cf:b239:2fee])
 by smtp.gmail.com with ESMTPSA id k9sm1225681ioa.10.2019.09.05.01.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 01:46:10 -0700 (PDT)
Date: Thu, 5 Sep 2019 01:46:10 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/6] riscv: cleanup send_ipi_mask
In-Reply-To: <20190821145837.3686-3-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1909050145530.27305@viisi.sifive.com>
References: <20190821145837.3686-1-hch@lst.de>
 <20190821145837.3686-3-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_014611_933532_1553B18C 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Aug 2019, Christoph Hellwig wrote:

> Use the special barriers for atomic bitops to make the intention
> a little more clear, and use riscv_cpuid_to_hartid_mask instead of
> open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks, queued for v5.4-rc1 with Atish's Reviewed-by:.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
