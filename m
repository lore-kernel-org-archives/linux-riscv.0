Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22579C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 18:06:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8C621780
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 18:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASkHEeOK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UBe4hx85"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8C621780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=sWZmcFiQXB1pfsHM8JWYAY1S2pPCeKfUW+6iT2cnW54=; b=ASkHEeOKzS3tQXBzg/NVVt74G
	snI0SvFsQJHQJv1RoUKNhsTU8TI1rvfY51ltZL4FeI8EhJ0y5WVvPWDyPd2eHMhaqrshhackblPvL
	II5q2qYXGYNah7lzfwHD+iwu4QH4h7suFd+RdLfsoUMUyXs+np12kXG3JEDf8eTAZTEtsdLUJ+uE4
	FnO0BBo1IocJmczje6kWGoBWRngPhfSD4k/uvHc9aHFCaGFnin03xsVvFO6E2fok8cY74nYDymEkF
	N1xdZv8koXPDXeJGplW8i1FLCz39KcOJGWDhD/7Uv9JzcCabJvQF2INMP1kVlS4AOYdbR8/mNTBEq
	tI6XRN1WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMzYv-0002r1-G6
	for infradead-linux-riscv@archiver.kernel.org; Wed, 14 Nov 2018 18:06:49 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMzYk-0002gt-8E
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 18:06:39 +0000
Received: by mail-pg1-x541.google.com with SMTP id 80so7716001pge.4
 for <linux-riscv@lists.infradead.org>; Wed, 14 Nov 2018 10:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lbcVccfhtSZbJaG4asGm7Gtmboe+/b7Vmk3/13dlQTQ=;
 b=UBe4hx85YDF0N8OoLiD8P+iBTd65eU58kPGFe0i1KYsnBQbLqmJXT9xerOtfhyd9J+
 PFmdZqzAIxfoAgQNYSi5TpNahU6xpXesgz/hceJZTxKlbnF6Gjggm27STeOlI6bGYzS+
 xHX6bMH4WsnN8L24lcZO93U85QFclmkH/N0v5eQSjoheuHP83400U6tT7Ad2zflONgjG
 PEK9PTFJWRP/P3v+bGNdHxQJ8U5LQ3YoZR1KT2b7XSZ0Logi4gAlRsYbrhG8BJFhkLdI
 TneqYztnHmD45AwnQihgcY8Y8HQABGtu8pKDahw6LOTJSrsILXO0mka+jrYPAzzDuUJz
 Utqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lbcVccfhtSZbJaG4asGm7Gtmboe+/b7Vmk3/13dlQTQ=;
 b=nII5hmFb/qFSUGtC2Utp6peNDRwF3e2pvnrnQOBEZjx4qHbCe0pKx3EDrB5JenBopl
 K6Nnd4Yjqpu6c6s61z5ewHxijk7SqGSEO1UypFxZh+i3NE8UstvTDEr3PdI9cfFntsrG
 uhA/FANtmSikf7BKBMYmWlDsJwB8gxJW1n9suKnHgUJsmHn1NFL2M0XusoAS9e8+KbT5
 X4yV6KUJ9kYP7cALI3Ii7xrSFog4IgQaQNHEeUsi71H7x8ewoUgdAjHN8/uLSR3qHLgV
 S6r1x2S+rScxbZ1sVzs28QvhrgCPprMq+WAF2wpvPfpTbUPVHeNUpKUR+0I/isgAuHeI
 cPuQ==
X-Gm-Message-State: AGRZ1gIfOTfnyj8rOpCB3IMQPW/OcjnQaQHG/zUEfLfChoJapEjW+XjW
 SkzMvksgm1UkBLYUds8+4vJlyg==
X-Google-Smtp-Source: AJdET5e3KmwOCpkhKsCCAEaxA3wJX+ZqZprDYTEAFoI9F4ij4mYi4qSTcAo16v3A4U/4rT8cMqUvkQ==
X-Received: by 2002:a62:ae06:: with SMTP id
 q6-v6mr2995619pff.126.1542218785707; 
 Wed, 14 Nov 2018 10:06:25 -0800 (PST)
Received: from localhost ([64.114.255.114])
 by smtp.gmail.com with ESMTPSA id s144sm23566927pgs.87.2018.11.14.10.06.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Nov 2018 10:06:24 -0800 (PST)
Date: Wed, 14 Nov 2018 10:06:24 -0800 (PST)
X-Google-Original-Date: Wed, 14 Nov 2018 10:06:22 PST (-0800)
Subject: Re: [PATCH v2 0/2] Introduce common code for risc-v sparsemem support
In-Reply-To: <20181107205433.3875-1-logang@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com, linux-mm@kvack.org, akpm@linux-foundation.org
Message-ID: <mhng-dfc065e5-80c6-4a9d-b95b-95170df42969@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_100638_354882_3982DABD 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, sbates@raithlin.com,
 linux-riscv@lists.infradead.org, logang@deltatee.com,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181114180624.m4ujEVlg9e4nmKVWydtVThYErustunbRCwnOINRirH8@z>

On Wed, 07 Nov 2018 12:54:31 PST (-0800), logang@deltatee.com wrote:
> These are the first two common patches in my series to introduce
> sparsemem support to RISC-V. The full series was posted last cycle
> here [1] and the latest version can be found here [2].
>
> As recommended by Palmer, I'd like to get the changes to common code
> merged and then I will pursue the cleanups in the individual arches (arm,
> arm64, and sh) as well as add the new feature to riscv.
>
> I would suggest we merge these two patches through Andrew's mm tree.

I haven't seen any review on this.  It looks fine to me, but I'm not qualified 
to review it as I don't really know anything about core MM stuff -- and I 
certainly don't feel comfortable taking this through my tree.

I've To'd linux-mm, hopefully it just got lost in the shuffle during the merge 
window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
