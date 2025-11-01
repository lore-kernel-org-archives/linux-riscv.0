Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2DCCCF9F8
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+tEjS9X+E9wqGOTe7rFX6+Jkp+OqU5+lqDqo4tg5is=; b=XQnuAibeOdgSi4
	QNHOk2XFCNQocPxEFyKFGGCQ8aQNVDgGcFB4w+E56ZbVjp8/YUTH00uUZmYroZDHsEBlCb4WrzTO3
	fZBuUT4JHy+LAdqKC0w7+dPQi55pbMS2QDHbGM0kUPr+vQIlVJ5A7SvCYJMNq+ngkEVES/RacHFp/
	rkp1Jnx/bi7ehbYczeIohUSMB2d68Z1eNDLBQKrmn1w7pCERUY6CeUwrNwYoWFG8JO4aP20Seak8t
	J1Onp0HClxYJlM0e72xUH0RdiZ+mnnA4Ajrczckgxv4naDD5MeOOwDfTM3jP98tla/uiy0+e7xfHh
	B+2/692k4fgAvrMj1cXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF8ON-00000007Fal-3JUK;
	Sat, 01 Nov 2025 09:59:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF8OL-00000007Fac-1rmN
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 09:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AD8C60146;
	Sat,  1 Nov 2025 09:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB00C4CEF1;
	Sat,  1 Nov 2025 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761991163;
	bh=IjdCMT0CzaODPEdiqPE/BBz8I40EGyTVW1/f1aFsFhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzC5TlwbpCo+vAQ8OoU0MEC77hUcM1JhYZwdLAiyhakas77mh/q2Sh3vbOKf59hFX
	 zGCvAqd6EYw21u9e9bDF8tTGvfgA0ylgDJUSAnSDm5QkK+EOkdrXpU6cb36+HWViln
	 Cj0iYYFMWouS9OrjZuVr+LNjiF06weYfsmBCg5duVNW0sYax7RfTua9LDaQcLaYnpG
	 BRykl9ZuDzKxDcUFcQsYcpl0J3CK0vv9oFTVgnv4oU6B8S20gO3Vt4yL+ub4433S82
	 +Qjq30Sm4czVZwV8dXBB1vw5fqhBFagcOrrOsYGzFLzYbCaZQTWRLALHFoy7HJHkbr
	 BLQ7mifSoRp0A==
Date: Sat, 1 Nov 2025 09:59:16 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 5/5] riscv: dts: thead: Add reset controllers of more
 subsystems for TH1520
Message-ID: <aQXZ9OjXC-cse0lk@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-6-ziyao@disroot.org>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:32PM +0000, Yao Zi wrote:
> Describe reset controllers for VI, MISC, AP, DSP and AO subsystems. The
> one for AO subsystem is marked as reserved, since it may be used by AON
> firmware.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

I've applied this to thead-dt-for-next.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
