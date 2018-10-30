Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D33C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CBD20657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 16:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W9hbntDL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kBBZy09R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CBD20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Sl9JqFWN5vLUy1bkk9qnk5MAVtetqWXrURVq9Cj5T0=; b=W9hbntDLJbzU21
	9+Hmr3VP2kYBm7baQxtc7ZgNvIwUSBCn/Mg8Ut/Xm++W6Ag1CUdXZMU+nJSNZt7CcSIbe7WMn1Pb2
	OqQ/MIKuQrhi8n3hlMoNbf3p4ss8TXOFeU1typjfO9/TFwig7UZUFQItVFQZj6hpK0cpXk5rYfiNJ
	6616FSP+46eh1PZFR4/JCw2P8uqsDEL9MrRX4lv/hIVSaUd0lusY9CL0cJRJC/wbA2vn2r/fGXnQy
	IpO4qwRY/qf4tnEIHgHhkX45jWmwZrLceWYhzn67lYCknQeOx/y1xko7ZqnnHSOdf3nb6Zh47yIEP
	TKJYWtlSju3T4p2ERBfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHWh0-0002iu-7I; Tue, 30 Oct 2018 16:16:34 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHVhm-0000p6-Bu
 for linux-riscv@bombadil.infradead.org; Tue, 30 Oct 2018 15:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BkYL+Y5GGRMd6N0QpBgW8DzjmK54rkY5Ly6LQnAts98=; b=kBBZy09Rp6T4uGACjZQiXhfkq
 h3UCvHo6JDBdNFhpBh3F3uSdZR63ankS4YjDin1HQnzPQDrcggG45w4VjAkVZZ5g1Z0TJKW0jPyTe
 bZKsnEPgOcPfRZMDN8tWzxrJCIHPUX9Pd9m5ub5rzgOdaNrgL4lJTIKoivEF5cDY3c403wX7kiSYL
 3fngGKIw+nJZJo4AdbVG5CfKp8e4+LdhlP0DLIiSOyVSy2yGN4RsrFVufoCzKREnjczJ05NPkSssd
 dQ79eC7E6p3KBf38GpSFuDE+9ezoqfyl8HrhSk1tqiVBuFP5nDQeJjlFVk/eCIVSchkXznrfLv6UV
 o3e2RR2LA==;
Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHONr-0000zH-Kv
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 07:24:16 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A11CA313CA1B;
 Tue, 30 Oct 2018 07:23:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
 [10.36.116.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5118B2AAA1;
 Tue, 30 Oct 2018 07:23:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E7B7B3DC7; Tue, 30 Oct 2018 08:23:44 +0100 (CET)
Date: Tue, 30 Oct 2018 08:23:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Forney <mforney@mforney.org>, christian.koenig@amd.com
Subject: Re: virtio-gpu without ARCH_HAS_SG_CHAIN
Message-ID: <20181030072344.sstmq6jxcmyzbqmr@sirius.home.kraxel.org>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 30 Oct 2018 07:23:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_032415_767080_75CC7CBD 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030072344.j4_2_YkaVd6r18w5yAV6aCA8XFxRXrujlL97vHxXTIk@z>

On Mon, Oct 29, 2018 at 12:46:34PM -0700, Michael Forney wrote:
> Hi,
> 
> I was looking at adding virtio-gpu support to tinyemu
> (https://bellard.org/tinyemu/). I got it to work on x86, but just for
> fun I tried it under riscv and ran into an issue with buffer
> allocations (though, this should affect any arch without
> ARCH_HAS_SG_CHAIN).
> 
> virtio-gpu uses ttm to allocate buffers, which swaps pages to ensure
> that they aren't consecutive[0][1].

Interesting.

While hacking the virtio-gpu ttm code I've already noticed that I get
non-contignous memory even for small allocations (cursor, which is only
4 pages), but havn't found the time yet to look at this.

Christian, care to explain the background?  The commit message sounds a
bit like it papers over a bug somewhere else.

> However, this causes sg_alloc_table_from_pages to use a sg entry for
> every single page, limiting buffers to only 170 pages (the number of
> sg entries that can fit into a page). This is only 417x417 with 32bpp.
> I believe the page swapping also makes TRANSFER_TO_HOST_2D inefficient
> by forcing the host to do many memcpys instead of just a few.

Probably not *that* bad, the amount of data copyed doesn't change after
all.  But, yes, I'd prefer to have shorter sh lists too.

cheers,
  Gerd

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=fdb1a2236b07948e83e0a777e1795d4f07e52c33
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=ae937fe19636067ec5e20d7f1fa10c6cc6000b52


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
