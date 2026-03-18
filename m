Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B091088E54
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heVmijXDSUt16csZf7qDBfVgeXk1L/L4G3MtWemZbn0=; b=lAwQayalqhGA1GahpQCEJHQhD0
	Ulh4DFOYCQ0cV5H14hb71OKsEWihROxpvzb2zUg5y9+Ga51KxaRTvBL4LuN/0MpQoArYPCtTjazk6
	ZT3jjcu15Iy56tXvKzFe3740uT8kd2gPcjNCtYperLFT+Rz9cTntYE/HY2uLR+Op/W3UrlGlHsiN7
	la+jUbCB7MM5EDCv3lknwMyzC3GuskZobjDZbps3w8TmmGyF6hH2g/D38zc7NYa282x8IB3iV69Co
	6B6Y63TOO5dQilcXjCHIVJljH2Z9duuuS53IP8h8+tq+kNrU5/ZX/6Of4lRVjaogNL7NaZvzR4UdJ
	gNQ+j0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w305H-00000009SzQ-42s8;
	Wed, 18 Mar 2026 23:13:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w305G-00000009Syz-1DFW
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 23:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0019643C47;
	Wed, 18 Mar 2026 23:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7177CC19421;
	Wed, 18 Mar 2026 23:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773875628;
	bh=ZvtnrXqW6+Tjrs/Zh/8uRpgts1gHpjGFO5tLv74B5n0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qPQWIXwb526DC9cW33w4s30It66ccPJ3T/byVMEbaj9IHHKMBK5D2dT9ljC9ecB9A
	 Mndj9MNQ0sSeZf+FNEEyseCVI0YmeXuOEemWCBkarOJje1GnntZgosN69D4l455a1M
	 XL00kNfxhfUNqtDxy7150xP83Rvh0yGj6wYdMs265fSzJN1sp1LOOC+pKqYZN7EBjO
	 K+2Kq7PrtAqwxEMpRoPHqM6ibCqHNCMQ8m623wjGQh5rz6bskMP2N52uNUbgsmY8qJ
	 iNzCncbe2hyp6bnCuUNqa+SuocEgAJpxvHbgXjAKSwwFP0RfKqocIxfdJeZh7FwuQF
	 Os1Cy6gzT7v4g==
Date: Wed, 18 Mar 2026 17:13:47 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Simplify assignment for UTS_MACHINE
In-Reply-To: <20260313164012.1153936-2-u.kleine-koenig@baylibre.com>
Message-ID: <683be8d9-1003-0015-a452-d15be6bb1754@kernel.org>
References: <20260313164012.1153936-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-536609226-1773875628=:215483"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_161350_478871_53CBA7DB 
X-CRM114-Status: UNSURE (   6.39  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-536609226-1773875628=:215483
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Mar 2026, Uwe Kleine-König wrote:

> The BITS variable conveniently allows to simplify the assignment for
> UTS_MACHINE.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Thanks, queued for v7.0-rc.


- Paul
--8323329-536609226-1773875628=:215483
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-536609226-1773875628=:215483--

