Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311DDCA0FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/6WMUG+7XwaCgVUaG2oPpZsPp+OpJA8tJigt3kGUUU=; b=yOvRJn2Xemoxlc
	v0xeqjFG4xEWFW00P4k4uU2l36yG4KyuJQ2RJghWOni19b8/llFGtbv5XAr46iZQ0Xl0LxFbCFlpX
	hYVR+WARCM7FWNBWwYXuPzufhJWT0AINXgemDCPkoCpjk5NeiBQAc3GsrmFsDYbm+7wkF+txglTud
	5l8eS43Dh6nub2ABMm8kTqDcn+F27aRd1nqk6Z+CdjBeL4t3qX/wvRoewxn/Y49ais+waPf/7yigi
	W1TmupTSzeDkOO/tsrNRXGQ7iyhJppNlvqftvWF17fo7ikzz8XIJZUmET38eN/nY6ebWTUd7jvQ+B
	xW0ud1AnVu9H2tQ77C8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1GD-0000000BolR-3ETU;
	Mon, 01 Sep 2025 09:55:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Ry-0000000Bghp-141u
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 09:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756717420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DPvlEW8PtLKIanxybkO1/0NkrQlUhYQIU4DMz23K2u4=;
	b=IylPM14JQontTY65i9oh8grggJL5+EgOtSkIP5cxD15MS4hh3j/AKjDQNVmisvOx57wsL4
	BO+eWU1KQ04+SovNiFAj0YpPW93KGlT8ikO/4VYBgjRps+5RU/9DNZs0bY2dqTVG+mbzl5
	JK8WtQ6Dsv0FsRc0RqzjhRT2fMspuIU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-8mFGJcPuO_W8J2hAjUmw-w-1; Mon,
 01 Sep 2025 05:02:12 -0400
X-MC-Unique: 8mFGJcPuO_W8J2hAjUmw-w-1
X-Mimecast-MFC-AGG-ID: 8mFGJcPuO_W8J2hAjUmw-w_1756717329
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC7F5180035D;
	Mon,  1 Sep 2025 09:02:08 +0000 (UTC)
Received: from localhost (unknown [10.72.112.127])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D57730001A2;
	Mon,  1 Sep 2025 09:02:06 +0000 (UTC)
Date: Mon, 1 Sep 2025 17:02:02 +0800
From: Baoquan He <bhe@redhat.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Breno Leitao <leitao@debian.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Coiby Xu <coxu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 0/3] kexec: Fix invalid field access
Message-ID: <aLVhCuzhRTRnDytw@MiWiFi-R3L-srv>
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
 <f7d55c91-8877-41aa-8cf0-64af38a9a109@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7d55c91-8877-41aa-8cf0-64af38a9a109@ghiti.fr>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_020342_407520_787EFF6B 
X-CRM114-Status: GOOD (  10.33  )
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

On 09/01/25 at 08:42am, Alexandre Ghiti wrote:
> Hi Breno,
> 
> On 8/27/25 12:42, Breno Leitao wrote:
.....snip... 
> 
> I see that the commit those patches fix is in 6.16 so we should add cc:
> stable.
> 
> And who should merge those patches? Should we do it on a per-arch basis?

It's been in Andrew's akpm-mm/mm-hotfixes-unstable.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
