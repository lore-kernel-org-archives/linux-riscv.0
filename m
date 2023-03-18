Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179F9C74A5B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rhEqC4QblmgoXvVkzMSAt+CSBRwZ0Drq2F6AjAp7Nyo=; b=oNtLiC9uqU5NRk
	/xdFnTaNUedduOUJu8cx3Knt1CAjMUc6uAhAFznzwzHZJWJGLoQcqap93HnoXPsEXGUas5S749uLx
	CXnH23Htku/qgXAaHY4WtLJAx52MurTgkY8Aao1vqylbuJDgmprxhnqMsGB8qH5W3htovEMZ31WcS
	8Fe3hC/N+a9iZWCNvQfMEI4fqi0OlyROtEX2pD6FuwmAUwFHwEmQhdfiqpKT+7KdzvM1GE+f6fhNz
	9UEN6ZPpfE9SOXe2AHfUDvNLy9lu1LjFN8bPYBsBscMc1+BKQJ32NIw/rO5xmA2PwesuS1W23LU7W
	uLnMQzJtvBOb05OTAGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX5-004OTz-0B;
	Sat, 18 Mar 2023 08:03:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX2-004OSx-25
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 08:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679126595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qx6sO30KWXOeH8l6ZlBEQgHux3VGZ/RgcLtlMop/hXs=;
	b=F7Kjy7q3cDtbV5aF1togYm1l7qQ2aHotMwH8k4gqJq/Dnqs2msaSo3OkEXynCSsz/8mI3J
	XPrv33IpLXPgNeaGe+n7Pdwux/s9GOZhCpSEQfFjulZXsG0Lzsaad9dGfU8VaIn1Z3v9OJ
	weZ/PDFAuy8zAmnQ7OVNJz7tR9De4ss=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-5Oeqx1xuPM2cyUfp0TofyA-1; Sat, 18 Mar 2023 04:01:30 -0400
X-MC-Unique: 5Oeqx1xuPM2cyUfp0TofyA-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-176249fbc56so4214947fac.6
        for <linux-riscv@lists.infradead.org>; Sat, 18 Mar 2023 01:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qx6sO30KWXOeH8l6ZlBEQgHux3VGZ/RgcLtlMop/hXs=;
        b=jRvV9ZQYPKvWNhZwBaLR5eja4cylCnRuXuNE1hqqp/nLarUtzDcF7o99CxLwpvCXAp
         kACCRBJVy7w4jkQ4a5K0kLTVQG2gur/7inPFoQgrvcEmSkQnF5lObpMhemQTAp2mDAxT
         urMrrCGoygSsDxhExStCr6d/VKAlG+hK9Z9JH+7kh5KqE+9AlCNy+1DzKmfopDjdwkv/
         IpwLJxaQndpONH3lWkZpXTEQ+DXd5iNr3ANYMp/ov7NXjJ8wqjLRZMYIqKWRmKzyFt7q
         oZrIxsDlHaNXHTro53qED1avW04cn8hPkcBuulsurCtz1z8q1/ECFv7e2Hc6U+6S0ZVl
         UmvQ==
X-Gm-Message-State: AO0yUKWz/KoqBEgTsqb++zEeB2jyuFQzObdDeIvsWfOp4w02MO5Hsfa3
	kz/ogH0KnVcTT6dw81aFsvwc59smeR92mHli3kvpJHfB27VxevbgMFtV9gTTWF8BlaFPxe0TcoM
	kPx1yC+rb8RNu93ueW8F/mRVeAPY5
X-Received: by 2002:a05:6808:1396:b0:386:c879:d3ae with SMTP id c22-20020a056808139600b00386c879d3aemr3370164oiw.10.1679126489993;
        Sat, 18 Mar 2023 01:01:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mh3aE04hb4EIJpiXnxz24ex1/4nqqBvuGMupJ7eKKQmcSN0VSwWqLwBDIghHvTT66dP/YOA==
X-Received: by 2002:a05:6808:1396:b0:386:c879:d3ae with SMTP id c22-20020a056808139600b00386c879d3aemr3370150oiw.10.1679126489729;
        Sat, 18 Mar 2023 01:01:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id c3-20020a9d4803000000b0069dc250cb24sm1824462otf.3.2023.03.18.01.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:01:29 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
Date: Sat, 18 Mar 2023 05:00:54 -0300
Message-Id: <20230318080059.1109286-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_010316_757984_E931F041 
X-CRM114-Status: UNSURE (   8.24  )
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

While studying riscv's cmpxchg.h file, I got really interested in 
understanding how RISCV asm implemented the different versions of 
{cmp,}xchg.

When I understood the pattern, it made sense for me to remove the 
duplications and create macros to make it easier to understand what exactly 
changes between the versions: Instruction sufixes & barriers.

I split those changes in 3 levels for each cmpxchg and xchg, resulting a 
total of 6 patches. I did this so it becomes easier to review and remove 
the last levels if desired, but I have no issue squashing them if it's 
better.

Please provide comments.

Thanks!
Leo

Leonardo Bras (6):
  riscv/cmpxchg: Deduplicate cmpxchg() asm functions
  riscv/cmpxchg: Deduplicate cmpxchg() macros
  riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
  riscv/cmpxchg: Deduplicate xchg() asm functions
  riscv/cmpxchg: Deduplicate xchg() macros
  riscv/cmpxchg: Deduplicate arch_xchg() macros

 arch/riscv/include/asm/cmpxchg.h | 316 +++++++------------------------
 1 file changed, 64 insertions(+), 252 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
