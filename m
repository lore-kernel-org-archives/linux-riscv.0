Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E95C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZ14p4/gu2d2DfPSmM9R8auI4LHp1/tpz7MxpTieUzQ=; b=ROn0pcTLjm+918
	IAIHeUlpBfIln6LR4tzYGHaSZMTtRFASEgx8tbbQQaKKDtjdZ0gDQCusvtzGOQepcC1C9fnNoanLm
	HeHBC1c8h37aHsP4S16Y0J/XHiMR2P6zmasjK00YAXAUCOvlRzyEmucUALNC00YOEPfZyfOD+2bZ3
	qyJRteMJOgCvLKTq99U2pJYQP/rZYY0ar6FYH5k6O8Wqfbt648DGUU8ATqib1v79q2eDCTKK22Y8c
	jWKm7xsexOCnFKudH8uMnJq8SPrgx98TCI9h5BNsqJZ7hiqXixvWTj9at9XbrxseHg4KVaPfTlZHm
	TMU2I2gyOwfhKA29GUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysDd-00CRic-0m; Wed, 08 Jun 2022 09:43:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysDR-00CRh3-VK
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 09:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654681383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3+IKQAxPaDV1lsEnEpDWXsKDpaqq+QeuuTyOBnuSML8=;
	b=SRcXbCnqITV5krBZyXyigAgmwXF4IF3oySkb7XNW92dMMDvpbbKJ5kQbl6gmU+BXXu2Jr/
	H+yq24S8zDYOXwqVtrH7eHHgvEshFNpSEM0ZHpsG34EnciVGCqR9flIYzYN71SdFpjbBjP
	XGdOB+8CUTd1X0gP9/ZfmFDPvw6fBH0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-w3WQnUBOPViMCdoJoJfKsA-1; Wed, 08 Jun 2022 05:41:16 -0400
X-MC-Unique: w3WQnUBOPViMCdoJoJfKsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5C61C01B2C;
	Wed,  8 Jun 2022 09:41:15 +0000 (UTC)
Received: from asgard.redhat.com (unknown [10.40.208.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0009D9D7F;
	Wed,  8 Jun 2022 09:41:10 +0000 (UTC)
Date: Wed, 8 Jun 2022 11:41:08 +0200
From: Eugene Syromiatnikov <esyr@redhat.com>
To: guoren@kernel.org, Christoph Hellwig <hch@lst.de>
Cc: palmer@dabbelt.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	hch@lst.de, nathan@kernel.org, naresh.kamboju@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	heiko@sntech.de, ldv@strace.io
Subject: Re: [PATCH V12 02/20] uapi: always define
 F_GETLK64/F_SETLK64/F_SETLKW64 in fcntl.h
Message-ID: <20220608094108.GA18122@asgard.redhat.com>
References: <20220405071314.3225832-1-guoren@kernel.org>
 <20220405071314.3225832-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405071314.3225832-3-guoren@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_024306_169014_2AD40150 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, Apr 05, 2022 at 03:12:56PM +0800, guoren@kernel.org wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Note that before this change they were never visible to userspace due
> to the fact that CONFIG_64BIT is only set for kernel builds.

> -#ifndef CONFIG_64BIT
> +#if __BITS_PER_LONG == 32 || defined(__KERNEL__)

Actually, it's quite the opposite: "ifndef" usage made it vailable at all times
to the userspace, and this change has actually broken building strace
with the latest kernel headers[1][2].  There could be some debate
whether having these F_*64 definitions exposed to the user space 64-bit
applications, but it seems that were no harm (as they were exposed already
for quite some time), and they are useful at least for strace for compat
application tracing purposes.

[1] https://github.com/strace/strace/runs/6779763146?check_suite_focus=true#step:4:3222
[2] https://pipelines.actions.githubusercontent.com/serviceHosts/e5309ebd-8a2f-43f4-a212-b52080275b5d/_apis/pipelines/1/runs/1473/signedlogcontent/12?urlExpires=2022-06-08T09%3A37%3A13.9248496Z&urlSigningMethod=HMACV1&urlSignature=fIT7vd0O4NNRwzwKWLXY4UVZBIIF3XiVI9skAsGvV0I%3D


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
