Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584ABC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 03:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noOpDRr2SJWz5sjUug/2M0xgqMO8A1kCFpTYPDpizv4=; b=gUGxdBUN6Kw/ZG
	dK8TNqaeg/YA6AyKpeY6FU17eIOLyTp3v17FxQFhK9r57cgaMqbawHT+Pzeb8odd029TZZgH9xhZ5
	eQ0Zl9VbZHJ8HE8RJYhdgF3SDENnLwBTYQYaDTbuf880sWbMERognx56XS4q3cJ9lQm5sPzKnBtPL
	xFePbRez+VvutJ/TUp/MG67RuvOghml7FBPe9HGLECSSA9OdA3Ig9+gYmfoiBQUrXSeYt1Jlprr/L
	9hrirwrqCcysYKuva5w9N/kmv/EbhMjAcUyjxf1kjY7FX/Jq/B1a5cK4Hr7CZsDnLf0wP0T/2MCum
	Y7rkjaKbExVTpaPj3Q6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYH5f-00000009qyG-1vnt;
	Mon, 29 Jul 2024 03:30:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYH5F-00000009qsW-1sN2
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 03:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722223799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uO9CpgXouDh8hOZN70chmiOKh3p65Id9D7Y8jU0waHQ=;
	b=StOwZourodaoq9QzHty1L1ZLLouWxdNElh5fdiA2zGVvIJD9sS0y13wPiayOC4S+njn5gs
	iEohWPK8vm6JTcHK0FYdo1NeLQZRC2kMhlMM8Kf2B53WpOUNayrLoMFaZyV/s9vo0jIC+g
	kKulfCZ1VArVT5a6VtzUybSbNbkr9Kg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-iQL7kj1FMMaHm6fmYiu_QA-1; Sun,
 28 Jul 2024 23:29:56 -0400
X-MC-Unique: iQL7kj1FMMaHm6fmYiu_QA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA7CD1955D47;
	Mon, 29 Jul 2024 03:29:53 +0000 (UTC)
Received: from localhost (unknown [10.72.112.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D94083000193;
	Mon, 29 Jul 2024 03:29:51 +0000 (UTC)
Date: Mon, 29 Jul 2024 11:29:46 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: akpm@linux-foundation.org, vgoyal@redhat.com, dyoung@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	rppt@kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] crash: Fix crash memory reserve exceed system memory
 bug
Message-ID: <ZqcMqsMo8SYVv4Tl@MiWiFi-R3L-srv>
References: <20240723020746.3945016-1-ruanjinjie@huawei.com>
 <Zp8859QW+YV1KqQ9@MiWiFi-R3L-srv>
 <564e362d-5e8c-5d23-9c54-bfb811794169@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <564e362d-5e8c-5d23-9c54-bfb811794169@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_203001_636098_B95CF53B 
X-CRM114-Status: GOOD (  16.68  )
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

On 07/29/24 at 11:24am, Jinjie Ruan wrote:
> 
> 
> On 2024/7/23 13:17, Baoquan He wrote:
> > On 07/23/24 at 10:07am, Jinjie Ruan wrote:
> >> On x86_32 Qemu machine with 1GB memory, the cmdline "crashkernel=4G" is ok
> >> as below:
> >> 	crashkernel reserved: 0x0000000020000000 - 0x0000000120000000 (4096 MB)
> >>
> >> It's similar on other architectures, such as ARM32 and RISCV32.
> >>
> >> The cause is that the crash_size is parsed and printed with "unsigned long
> >> long" data type which is 8 bytes but allocated used with "phys_addr_t"
> >> which is 4 bytes in memblock_phys_alloc_range().
> >>
> >> Fix it by checking if crash_size is greater than system RAM size and
> >> return error if so.
> >>
> >> After this patch, there is no above confusing reserve success info.
> >>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> Suggested-by: Baoquan He <bhe@redhat.com>
> >> Suggested-by: Mike Rapoport <rppt@kernel.org>
> > 
> > 
> > My Suggested-by can be taken off because I suggested to check the parsed
> > value after parse_crashkernel(), Mike's suggestion is better.
> 
> Hi, Can the suggested-by be removed when this version is merged, or a
> new version needs to be sent?

You can send a new one and CC Andrew.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
