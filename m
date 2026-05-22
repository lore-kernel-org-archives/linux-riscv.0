Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BC2CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssvit+ZMs4zelD+v2yp66QHjrGPlhyh+l1UuJAyTf1U=; b=WLYps4uRJMplGi
	Ej+uh9yBRFDoFEcO9BKP//tm64Pk9kBkkD9VsncrnP6qmCa0CX29YGtGT0jFDS0UHkJ9uaX5tkEno
	/cuxyu2G8JCh2see3hnkm8OPvvzHKkqO8oQYtI+BxJJjSEQBfEPhnqUoh7C41kp9wiSSoZ/qb4Grf
	bf0mf9gDcVHRe9gxmB6qKMLxdc0IOqqjxPe8O7esBI5agR+dCcuumOdbg7szxhDXaic1lBWOz25Du
	hoAWv4SpESTjlWbPpfT76/s6oABVP+XYo0yHRwQgH5USPT80jr6L1CHd6yCNpLxI91nUuoFqT5umc
	DunNPBi5xukGz5wSUCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZed-0000000CGDw-3X7d;
	Fri, 22 May 2026 23:51:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZeb-0000000CGDN-3j2q
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 23:51:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6C8E40E42;
	Fri, 22 May 2026 23:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9604C1F000E9;
	Fri, 22 May 2026 23:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779493904;
	bh=6g7V95ZW/7q5E25JeKj3G83kjhPIboZBdOl4zmD1wYI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MSkbwJJE+8ADZbAMpTWSfMzpfI2UpWKiAri/D+dXhpPS6M0VmV9phPMn0qVppvbOE
	 A+pfG4f2gLwW5dwljH7nAI/+IoW9ZSXG7bcZQdHCdYMITt2C9yluWf7iz1CGBnr54h
	 B2yAAEHm2257M01PkrhK/WX2P15cnl8AI60Iz5jaXtOCEXPlvVtk3NxtmuabWUROoP
	 whDXaUHzBK0Jq9gEnkUPudWJ+qGkXg35hrHECGI+XOWh88Teyf9uNIrcVwVwlpcN8w
	 na+AGYuHGZBW762dMwxfEQ6q/ldpOMRx2ObK56MYhq1KQIc1FyrAiV1v0xxH2m4fmP
	 +Bs6XqHnPLn7A==
Date: Fri, 22 May 2026 17:51:43 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
cc: charlie@rivosinc.com, mr.bossman075@gmail.com, palmer@rivosinc.com, 
    alexghiti@rivosinc.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dead code cleanup in kconfig for
 RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
In-Reply-To: <20260329203249.563434-1-julianbraha@gmail.com>
Message-ID: <add8b8a8-3aff-fde1-2fff-74763e3bce92@kernel.org>
References: <20260329203249.563434-1-julianbraha@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_165145_949292_955C3CEB 
X-CRM114-Status: UNSURE (   8.83  )
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

On Sun, 29 Mar 2026, Julian Braha wrote:

> The same Kconfig statement 'depends on RISCV_ISA_V' appears twice for
> RISCV_PROBE_VECTOR_UNALIGNED_ACCESS. The first instance is in its choice
> menu, "Vector unaligned Accesses Support", making the second instance in
> its specific Kconfig definition dead code. I propose removing this second
> instance.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Thanks, queued for v7.2.

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
