Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0C606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3GpJvhZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=McK9uDsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=85iOsbv99oqASGBKiaPgTjfG1rJ4FN6IJ7p2YJCW72E=; b=b3GpJvhZ5mQZVGimpurqIZuW2O
	iiquOGoBGrnqD5JAElyL1oa8h4/KUaAEGTcLLYPgELv0YGNZwJWw+SNbS42R5WEI8U5Kd9eo+GXYD
	bkaDzvCtEk8Y6sLVWElDDC9N8unPtKxqg+sVgALgzbPIDzQ4DqCJMT+KFiIPO81CX3aeWcX9dZTPI
	7YyfGYn8P5rfZLRHFqzYX5zojei/reYp0dVTAQYcRKHOuDSidFHi2qteSrbeW+EZ9RVhkTEZZvFN1
	1Blghu1NcMJmKvtBzZZhpZGQyLNuZxeldDFiX4f2QXCschYo1UXRZEoG5Y8HMdrulbFMGW0ZBf2WJ
	atQSpNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTOr-0000000CEQk-0vNG;
	Thu, 26 Nov 2026 06:56:09 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTOp-0000000CEQM-2J5L
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 06:56:08 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-38431138772so8674687eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795676166; x=1796280966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjAKdV6H7ho3CHl4fwxI87EmxvozgcXb/JceKUbGfHo=;
        b=McK9uDsE4xXBtmR5knqC9joqPj8vJgwYa5NZCv7D9LgM6Wh8G6LQea6oKgRBoMXG9R
         kGoRC1ZjRNHbYKCOPWDOv8Z91rMsk8dhU1ZZGFtNVIZfAVtyw7yoo7eeIgnzdacy0BNy
         mFuBtR6uF+PJDcRiCqXlf9oJqXGdTB71CN3vWxmGf4wK0zlAB4ZOdGFM4gO+N8QYBf0r
         jV/T6RDLdjdgKaCqjoLl0KqROTVnK1kxzINxF+Wv6ZIEV5tSipSmtDB+oRYY2BLYPQfR
         +F6gKovl3kqI119uVU5HBfaxInSxd0pVlgJMx4ploMnnkPrWBw8KwbrAEFfficrKCdwB
         uLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676166; x=1796280966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjAKdV6H7ho3CHl4fwxI87EmxvozgcXb/JceKUbGfHo=;
        b=DBKiaIaRwjZaAecFAE+Tm5WQnYeRAWY2KxiiMTaMyl+EBDl0nTs+z17uWljuX+NUoH
         3CaKW0P+ZJMk98RZqCysuEoqPKFRLdRMHEE7jLMgWVgvt6yl0ZRvl/WVi+v5mavfGqc6
         HUTr4Uy6FRuDfrexHYnsbva6uh6G+Mr5EX/dy38ZaWSMZJv8xa9ojJjx7MIMdSxPvjo3
         jVu1POoK3vp3hJfZEusJRKHszFYTFovhpJmjCoV4GqFdjaETu8YH4vjPS+q7F+J160ER
         iVyPbbWstrTnKQpx2mG3RVs8llT/+LmeP9KkjxzXcj9tKDks7TynrwYp5d/c8ee4wrax
         FHXg==
X-Forwarded-Encrypted: i=1; AL+hErEVIgnQz5m8dwAO/KzgkTPnj8QLMdK/kUKVMt1/BJBt5Lx3hVIOZX0WCXDxJBICvL7sk2gxs5mIFs5jUw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9uovvNYlU3MrbU6IoyqiiDQq4bfinPvo/NsXhO4Ir41Ellwqji
	CoyxD5h+1to+89PsuIVd5NsvvssnDvsIb+/KOD+kyHupmFWpC0eOb4+FnVjLfRTIs4c=
X-Gm-Gg: AZFdTZdo0qYZRaiSDEYUI1dNYrN1bOQ1uo4O2GVaqH5ytrWqdRKcg0etdDFoN9UtcIA
	/Eo7TdzVa4b8CGpbgYS4hsfKMnG/myMjtatPrcm08Y3mq5uOzTSfHXYQhEEcA0fJbhEL3jsABju
	Ao5Z7uSxgQBq3EBDM0bgorXGgzQgIfcR1AL+WmGNR/r8c0hkVAPlyNgQWfWMoGvokvZ33PKw9fY
	zbQa2++WCZ8N2OMUiR/nV09R6Jzq4hr1TP7Qy/K+TWEJolZmuM+OuwmqfHwEaRp9mM6+6eovmLz
	19sIQaV135tCu33ofO4USYi3vZSmUEHmfwT3+13g56NSGOqo51awmPCv/gyIOhl+r3fXm5zsS3B
	yNQpVUmytlIusT33AYH+P0bvnaAMmTYWszULZ5KRXyPUz3cygGiZOaYf0gvwE3fA5lSVPqPrF/2
	gVWVwjBlA3d5iH0sgPLedEdvo4N7wDzEGVc3iY/wD20uVGo1mTjVGCpFO3MBS3+7IOo2WpdZuOP
	pfEbBLz61AiS9YsK9T8sBRUivRtFSpZW6bOFRIQu5+LUTrI20XNfdtymkPKFHkZFXiU3uze7aEu
	55b3mLZHMDcWgRXWlzWkXjwpLXTGEBvpr9ti37zETIdq
X-Received: by 2002:a05:693c:4143:10b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-386b1067bf5mr13281344eec.20.1795676166107;
        Wed, 25 Nov 2026 22:56:06 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55580030eec.13.2026.11.25.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:56:05 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Zane Leung <liangzhen@linux.spacemit.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Eric Lin <eric.lin@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Wed, 25 Nov 2026 22:55:35 -0800
Message-ID: <20261126065537.705845-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_225607_606039_B96D06F2 
X-CRM114-Status: GOOD (  14.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mayuresh,

> +	if (wrap) {
> +		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
> +		src.cur = wp - priv->start;
> +		priv->prev_wp = priv->start;
> +		/*
> +		 * There is no way to tell if trRamWp wrapped around more than once. As a
> +		 * result priv->prev_wp can't be used and the entire buffer must be copied
> +		 * even though some data might be duplicated.
> +		 */
> +		bytes = priv->size;
> +	} else {
> +		src.cur =  priv->prev_wp - priv->start;
> +		bytes = wp - priv->prev_wp;
> +		priv->prev_wp = wp;
> +	}

Consider the following trace sessions:

  session 1 writes 60 bytes, no wrap, WP = 60        buffer: [0,60) = S1
  session 2 writes 70 bytes: [60,100), wraps, [0,30) WP = 30, wrap set
                                                     buffer: [0,30)  = S2 (end of it)
                                                             [30,60) = S1 (stale)
                                                             [60,100)= S2 (start of it)

The wrap path copies the whole buffer starting at WP, so the AUX buffer gets
30 stale bytes of S1 followed by all 70 bytes of S2. Nothing from S2 is lost,
but the output contains data that does not belong to the session.

Could we reset WP to the start of the buffer after every copy ?
The non-wrap case then always copies [start, wp), and a wrap can only
happen when one session produces more data than the buffer holds.

Does something like below make sense?

--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ rvtrace_ramsink_copyto_auxbuf()
 	if (wrap) {
-		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
 		src.cur = wp - priv->start;
-		priv->prev_wp = priv->start;
 		/*
 		 * There is no way to tell if trRamWp wrapped around more than once.
 		 * The entire buffer must be copied even though some data might be duplicated.
 		 */
 		bytes = priv->size;
 	} else {
-		src.cur =  priv->prev_wp - priv->start;
-		bytes = wp - priv->prev_wp;
-		priv->prev_wp = wp;
+		src.cur = 0;
+		bytes = wp - priv->start;
 	}
 
 	tbuf_to_pbuf_copy(&src, &dst, bytes);
+
+	/* Next session starts at the beginning of the buffer */
+	rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
 }

Best regards,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
