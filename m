Return-Path: <SRS0=InA2=2F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B75C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2019 19:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E13D24679
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2019 19:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AMW97tgz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DUvMIF0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E13D24679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xVlHo/nlCMF/qBOiT/VWeXY0vmm1o3tLmTZcUn6/oaU=; b=AMW97tgzu0eLEFRH4HJVevSAA
	Z93iYkCDp/XheTZ2x/L8iaV6gsaw0qTHLEilog4+j7YQgnipmSpBg/iiAptBr1DxbK5cq9a5896Dg
	G3nWfauWmtrZ7t86QOsUxK+pfX9I2ZMLDCKQqnbj2rnlVxrxyabjioFjKmQWbQw3Q9Vt+fiWchr2l
	4KH/H1lO30CVLvI979WVUJRC+1hXdVXwhtFA3g/KLnHSqh+n4E0D4rc1mrJg+4WREWyyZiMmdGMJI
	Rl6mWEsBWuhNdCamWoAXW21nSRv/n9EBpggKFGc20imE+zm3sfSHZnKdzgXbKBbYDnhvKKKIlFltu
	ywi6IYHWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iga0E-0003uF-Vq; Sun, 15 Dec 2019 19:56:30 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iga0C-0003tW-2f
 for linux-riscv@lists.infradead.org; Sun, 15 Dec 2019 19:56:29 +0000
Received: by mail-pg1-x543.google.com with SMTP id b137so2422351pga.6
 for <linux-riscv@lists.infradead.org>; Sun, 15 Dec 2019 11:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xVlHo/nlCMF/qBOiT/VWeXY0vmm1o3tLmTZcUn6/oaU=;
 b=DUvMIF0QFOTQxH81JOUzG93EnqkGo8iYo7Lrg7rDp7kmCy6fNi6LPYdGbuqMmmu2S/
 vMk5R1Tekf+KM6khmVWfEBHeKGd+Wcv2jCAhovSwh8RjJZaRBfk28pjyuiMG8HNghhN+
 RGpRL7jhtzoad+EEq+rR/V5hOa4pErRPSq+SaZBigyAKRf6YXqLM1hQ5euCCFf5xtp/Z
 YTgjPnsFknNsrc1ov6fL8oK+ABWoNVAW7bwwxEeErIJKhQ5iJrzk2MqKPm/NVGCgIcbt
 bXcJnvnnxPH+i+AGlY8aIW2Iout+LDUg9YYF2Yw9Oe3rgYWimi2IYVB3vRIfTrBbz3yN
 9hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xVlHo/nlCMF/qBOiT/VWeXY0vmm1o3tLmTZcUn6/oaU=;
 b=uoOx/CkWc5SQ+vbzvcWMISed0wTihZkjHpZnUWALFHHv2iIZfEn9vsPVpl5JWWyB6R
 jE582M6wm373KnbQI0Tb9kyUwHoNzBaTsrUZ26WY261CHA3CTnuGgyELSSdsGJEtBhLi
 KRey+Dnops+70lw6dQjcHR01wv/0PQCHSVEgUnYV+E1tN1C9dYTbqIG+E6qtFW2aiMap
 SwciiqUBKtvJ5FOQqd8efBDvob1m5q61o2hTbk3lVutQY7gBKQFMzVQi0hOt5K+4/JTA
 J8G2GV+OfzVJwzdU0ImibGMlkiYR5Uc2qBB9dshfT4hwHBurM8PbVz68wrOAIIdXZEzT
 DEyg==
X-Gm-Message-State: APjAAAXDsS1xaqSrRCJ2XHaygsvDyy5xXBbCotUMBU5q6ggIWrDV333J
 UF72c1T76k6btUYOr/SHF+J5Eg==
X-Google-Smtp-Source: APXvYqxEKsNxK2ArifpMSeV3q5mX++F0jrdmxTOyWcJDZYYNJOVdT9sdTwJBe4gGIhdguz3qVIfILA==
X-Received: by 2002:a62:8205:: with SMTP id w5mr12272097pfd.136.1576439787225; 
 Sun, 15 Dec 2019 11:56:27 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id i3sm19528061pfg.94.2019.12.15.11.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 11:56:26 -0800 (PST)
Date: Sun, 15 Dec 2019 11:56:23 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH 2/2] riscv: cacheinfo: Add support to determine no. of
 L2 cache way enabled
In-Reply-To: <mhng-a1ba4b8a-4c6a-43e9-a87a-f8bbbe3555d8@palmerdabbelt-glaptop>
Message-ID: <alpine.DEB.2.21.9999.1912151155010.64438@viisi.sifive.com>
References: <1575890706-36162-3-git-send-email-yash.shah@sifive.com>
 <1575890706-36162-1-git-send-email-yash.shah@sifive.com>
 <mhng-a1ba4b8a-4c6a-43e9-a87a-f8bbbe3555d8@palmerdabbelt-glaptop>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_115628_220680_F53F85E0 
X-CRM114-Status: UNSURE (   7.28  )
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
 Atish Patra <Atish.Patra@wdc.com>, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, alexios.zavras@intel.com, yash.shah@sifive.com,
 robh+dt@kernel.org, tglx@linutronix.de, bmeng.cn@gmail.com,
 linux-riscv@lists.infradead.org, allison@lohutok.net
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 13 Dec 2019, Palmer Dabbelt wrote:

> I thought the plan was to get this stuff out of arch/riscv?  It looks like it
> only got half-way done.

That's still the plan.  Will probably send that one upstream in v5.5-rc.  

Am not a huge fan of moving it to drivers/soc, for a few different 
reasons, but some people seem to feel very passionately about it.


- Paul

