Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1E8C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BD3CCpINgrQQYPFX1Acqj8BvZ/rxcfdJBPXDbfHcx2c=; b=HmZgDeJ3d++h6Q
	tHnq/ZolbUZCgHIbw+8dXFAz96iJ6/LAoCUZaYlW+ASMuNBAwX0MIf1+a46Xf0HtgKaUWmFwJBqjg
	kO5k5CFydAgAFHww76zHVx7a5eOpn047DVJQtXOUZoZ4YCajGZmAVPEJEVveLK0e3wTYwTrLGJnSC
	FgskBmodXI5JrDd09IP71vCqv5ou3ZAQBoLbCPSgB44jGO3GO4LpaPPeGQ3pOxQOQ5d12sr8x222L
	YGZottCl8vSj6U2NFOQl3G54oRPOTP3+QUO8tkcrfGS0RJz5G3biZZ3eQBgxPLeF3ySVlOtpfGtgo
	XRLZnqibq6E3Dhf8et5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTKI-003VOR-S7; Mon, 30 Jan 2023 12:31:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTKA-003VNN-AO
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:31:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72A8560F77;
	Mon, 30 Jan 2023 12:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA5CC433D2;
	Mon, 30 Jan 2023 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675081907;
	bh=1owcSCoKbfIMbxpA4IUXuT/V6qrKuhQ2DkpDz3IcX/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=reVpaRHIlaXaCGccMb3DZuBWu+eWpPJfYI9T3r3MTrbx3J6HMvC3+65W38nfzoQyA
	 SRuRbu0O0TYRwWYp5LS5z9EvI2GbUHjEVi+1rW5RPCaDSxHXZirSSoVupq84Tu8S1+
	 l2qK4PEp889vLErM2aCwOWwUKianGi8FKDgIvwaKPYR6ihw9tyKD4avPqNzEF5cd1M
	 BVgpvRIS1cIu32eQux4nqoehFlG5h7NDPxvQEFJvGt3AyhoR7L1tu+JE124N7+SzGi
	 IY1aaiD4G2Lj6lbxL3KmnynmF28bDQCuu158LYZjwqeuI6BZZiLsBu89qeW9zkmk3E
	 pTwKYtogMy6TQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v6 00/13] Add OPTPROBES feature on RISCV
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 30 Jan 2023 13:31:45 +0100
Message-ID: <87wn54i4pa.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_043150_437279_EC341B30 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEFk
ZCBqdW1wIG9wdGltaXphdGlvbiBzdXBwb3J0IGZvciBSSVNDLVYuCgpJJ2QgbGlrZSB0byB0YWtl
IHRoZSBzZXJpZXMgZm9yIGEgc3BpbiwgYnV0IEknbSBoYXZpbmcgdHJvdWJsZSBhcHBseWluZwp0
aGUgdGhlIHBhdGNoZXM7IFdoYXQgYmFzZSBjb21taXQgZGlkIHlvdSB1c2U/IE9yIHBvaW50IG1l
IHRvIGEgZ2l0CnJlcG8uCgooSXQncyBuaWNlIHRvIHVzZSAiLS1iYXNlIiB0byBnaXQtZm9ybWF0
LXBhdGNoLikKCgpUaGFua3MhCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
