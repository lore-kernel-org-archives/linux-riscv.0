Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE1606A32F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtZJQtN8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xjETcpT7lquQhnWW9a9wmdnF/9/CT/U5UXYHIU59G2w=; b=FtZJQtN8R/rwbNz9fJZ22X5IKF
	uYfn8p7jtNFoKOkjxoGDjO3eT2Ig6S7s6GP7Z2TQ/b1kMbHPDWjKY9cPBedhTESJJXgMTu7wv5TE/
	NUGDtKjgvLWkTRnoajUDWGS7FajlzlUFFJoKx592ZLNbC9dAnUu05kO1D9rpXoppVchrvmIaRs03R
	QqyYFQNMJdyLeMsS12UHZU7RCE9L/WwfCFJNinW4RjjcA1lTrzlOULAsvd9S46paRKMkjBXM+RDQy
	ruER0oZ6pQ/usOqN5ncW5GqluFXVsgPw9Tv7BsytgcSHoCP6shAR7D8aXzErGP7/aJbS/JWcNQJpL
	Tn/+cUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFR0-000000054KX-1sqe;
	Tue, 17 Nov 2026 09:25:02 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFQu-000000054J9-0dxu
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:24:59 +0000
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AH9OVGU068535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 17:24:31 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 17:24:31 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 17:24:31 +0800
Date: Tue, 17 Nov 2026 17:24:31 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <avwdT/vGjfsUCkHv@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
 <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AH9OVGU068535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012457_949945_8C03C5F0 
X-CRM114-Status: GOOD (  11.14  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 01:53:29PM +0000, Conor Dooley wrote:
> > Move the match into soc_is_r9a07g043f() and make it also require
> > ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> > and take the generic Andes cache errata path. No other upstream-
> > supported SoC uses this AX45MP mimpid, so their behavior does not
> > change.
> 
> But a device using this soc that doesn't have a dts in mainline won't
> function properly, so this is fragile. Why not just do it properly and
> check for RZ/Five specifically?
> Can check for of_machine_is_compatible() probably?

I will check for RZ/Five with of_machine_is_compatible("renesas,r9a07g043"),
which on RISC-V is only used by RZ/Five, and drop the marchid/mimpid match.

Thanks,
Mina

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
