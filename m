Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42693ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 14:17:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146202054F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 14:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kc5M+IGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 146202054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7SHwwpaFG8vP/BfOgbhiK/sAmmWJ1zN1jylcakCwVU=; b=kc5M+IGcFbNDF8
	egCAU6n5hiH9uks2kZSZCL1dZ6Nu50tHyE4pvVPIj07O/s7j77AFYhyFHn2MjUUHmnQrsb/K5tk0R
	TuJXMbp+isO91/q3zPxvdiPQReLaqtF4MQAPWjU69xIVJNNLQbst4mXS88bFnVcb201nLhSFXiGlv
	CJz+jrGncfdIsFezO7r6jsD6lNShwqLNQc10Y/TgJDbeh9Up3+rn7kiQUYNUn+OBU997GzGQXR3qq
	xHcBPMrK7jDwBGnSQnlTjS3dGvtzW0Se0A8o7OGLnwde+TQfcpWr1NIwjNV+QPg7PM0yjlPVNOMzx
	uoSY40/gw4NIdGUhy6mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHrJc-0002mY-BN; Wed, 31 Oct 2018 14:17:48 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gHrJZ-0002mM-Ko; Wed, 31 Oct 2018 14:17:45 +0000
Date: Wed, 31 Oct 2018 07:17:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181031141745.GA5183@infradead.org>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Zong Li <zong@andestech.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, alankao@andestech.com, greentime@andestech.com,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 vincentc@andestech.com, linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031141745.2zzDVfOyfE8tvVCznO95cI-Bd7sMIrZsTBOTkHTw72A@z>

On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
> I agree that we need a place for vendor-specific ISA extensions and
> having vendor-specific directories is also good.

The only sensible answer is that we should not allow vendor specific
extensions in the kernel at all.  We need to standardize cache flushing
and we need to do it soon and not introduce horrible bandaids because
the foundation did not do its work.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
