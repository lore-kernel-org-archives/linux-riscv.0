Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32278C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 21:50:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027FA2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 21:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZI81MWOS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="cUtIW5VZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027FA2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KubM+M8dCEVEj9cprsWsfUb/gamwP2YddGtmcl2jqeo=; b=ZI81MWOSuZIIiG
	96pgXDasjc4+oLjtK9qGYijVbrXygDvKpGB7qm3f5z6RCTDcPM4wRZwMCL7aKvMbZzrdzUKhPde6T
	Zs9pjjN1HpZWBHHlKF8MVwTxVoh/O6xtSx9qWSFU8MSL2pk57utijLdppswuw00VSVMlqa/j1mHWg
	sy4s4eVB87TgQ/vOlJEKVNNSh61FCzRadGD7xbNorrFM3IrHpdrc+o5VV/n5lsn2/6Oq5BSTnrcOW
	o7SH/WL3ozmVEMTuwOp4hUEp4tt2AV9gNREaWDAL9NPp6wB7pWlKlX44uf4JpHIC17dhLwp0CCv34
	xYjBiWLrL+Oll/ugG5Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8XTm-0000a7-QS; Mon, 25 Mar 2019 21:50:02 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8XTk-0000YP-Bt
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 21:50:01 +0000
Received: from zn.tnic (p200300EC2F098000329C23FFFEA6A903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:8000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4180C1EC058B;
 Mon, 25 Mar 2019 22:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1553550598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=s9H0oUNY6HRHpq2P75yYndYzWuvUMTce9l9uMjVl7ZU=;
 b=cUtIW5VZ4IGHufkzwQPl9FHQObqLSRc+yOicDnoxVbsaYFD2ddC/R8u/uzGcrjAiQFvTn+
 0Tu8nHkOlauRjaVVp9oXO0oqjvTc6BG/IszGNRhbMAlrPQtB7KQU+vDtepKoTfpcdslM4O
 OAWDlnQ2x3bIIqQHR+lqMcZVMgCXQc4=
Date: Mon, 25 Mar 2019 22:50:05 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
Message-ID: <20190325215005.GU12016@zn.tnic>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
 <20190325065737.GD12016@zn.tnic>
 <alpine.DEB.2.21.9999.1903251418440.8028@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903251418440.8028@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_145000_563898_731E7F83 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 02:26:52PM -0700, Paul Walmsley wrote:
> We'll definitely take the RAM savings that a few #ifdefs will deliver to 
> us.  They add up.  We're selling chips for embedded use cases, not just 
> big-iron x86 systems.

Fair enough.

Btw, while we're at it, this driver would need a MAINTAINERS entry so
that you guys can get CCed on bugs.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
