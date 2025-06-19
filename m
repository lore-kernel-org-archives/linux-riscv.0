Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707B1C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Px9kQTgD3oOBWlLq1Bo3q6xcIcLMJLh7k9A7cygYok8=; b=u1HSYt2ryQdYek
	LzlOY6a3EPJc6wwdpvaZFcFowF6jOVnhnpMwVEL/7pvYymBDXXeGpw4M1w4EnocjFtZZfn85fT/4S
	HeAI7yGWGlWSM7w8kmfWszxGOYW+fRV7sd+BaNGRxV/P1sWa/cZ77lg++Sr7JhC0EsF1D/cyvci4E
	+AwFAtzpjc/y8mdtRU82p0sCdfFXTyrOWC2aA1xO0zXSTFwgQizBDd2GbSJrUoCIoWTvbO3taFRuK
	U8Gj59zLVlXTGCaKWjocgcsV8bajtOHzSv2s9DwmBL65K4AyMNYaj/p+sq2H+aVlVVWxq9n9VMzZn
	3WwXDPOW57bq8nsG0Qbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIsx-0000000DmCX-31ZM;
	Thu, 19 Jun 2025 17:17:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHic-0000000DavV-1qGR
	for linux-riscv@bombadil.infradead.org;
	Thu, 19 Jun 2025 16:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U/vtXNOCfjYgJx01e4YvTxts8iz5D3jQXzSGlJi8bPI=; b=a2ZuLeOYADDinTv9mcbG72/+PJ
	lgdkk3phzp8QhjqNpmK0rR9gLS0ABQRYGOt3pLm6vMH61uL8uKuXEZ2HGQf4AJXRTKykWdrXREw5X
	qNBTkKtjSNX+nAhVUfMQV560bwOSpELirQ9BAigNMTA/umnKOktcBCXY0Z4FxzzN18LkS7UA7e8i7
	wARjpPB29wt3H4AdcOptn07MCe56EoU4XzUXYKhIiWrr2AvW+vfoiA3ialRJubaszXDTWmWBp5+Mc
	JkGMrGzkPPA8Qo2CldGKPqG9ki63i5pchPBAqHqYVB9aR06jmfFu31aawmk81Wwe9fTt45yhDnAn5
	0NSPKi6A==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHia-00000004TIR-0UAK
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 16:02:25 +0000
Date: Thu, 19 Jun 2025 18:02:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750348941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/vtXNOCfjYgJx01e4YvTxts8iz5D3jQXzSGlJi8bPI=;
	b=LuiJTkqsIDR9h49GQh+uoQ4iUvWpkZXr3nLFvsl7au4LHCI4g0ci5EzdW2iu5Yh2Toy3wO
	IhOYIKVaNsa0gD5T+67qZ/z7Me8HPZmeFU3mHVnDD1HvIIaBMhGQHMAsYWGNwQdF3qx9H0
	9YHafVEiEqiKGn0cY9yWHS8rVhTdjbxXwzlTVjO2eHHTuTJ0Vy5kB9W7wJrVE8M+f1roeA
	XlOH9lS4+7XNNWi7tau5zhtM4AXr3v7yC0HW68m2ZV7RdtS5Q+NDunqUh/FAs+aKMO08Ts
	dcj0jiT2on5bpdljjal4TFNtdTUiNPxmI+oERib5DvuaVzElfoniPd/BYTnM9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750348941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/vtXNOCfjYgJx01e4YvTxts8iz5D3jQXzSGlJi8bPI=;
	b=TpER6sZeqGLmYgK5EghvIxVVJJrd20ApiKRJnN43MnW/eN/59m31nMAZiirEqKARNbz9mS
	OcutLFbLCiICeYCA==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: rtm@csail.mit.edu, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: futex(0x1ffffff81300000) on risc-v -> mm panic
Message-ID: <20250619160214.CuDLtJ3p@linutronix.de>
References: <77605.1750245028@localhost>
 <21e7809a-ef55-4b4d-aa29-f6ef2bb429ee@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21e7809a-ef55-4b4d-aa29-f6ef2bb429ee@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_170224_317654_49764D32 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, Jun 19, 2025 at 02:35:21PM +0200, Alexandre Ghiti wrote:
> On 6/18/25 12:10, rtm@csail.mit.edu wrote:
> > This program on risc-v:
> > 
> > main(){
> >    futex((void*) 0x1ffffff81300000, FUTEX_WAIT, 0, 0, 0, 0);
> 
> 
> This address is far beyond what userspace is supposed to be able to access,
> even in sv57, see Documentation/arch/riscv/vm-layout.rst.
> 
> The problem is that access_ok() lets it go through and then gup returns a
> kernel mapping, which isn't good at all.
> 
> I can't reproduce the issue, but it seems like commit ad5643cf2f69 ("riscv:
> Define TASK_SIZE_MAX for __access_ok()") is the culprit, can you try
> reverting it?

Yeah my git bisect said the same thing. At first I thought that commit just
uncovered some deeper problem; but staring at it, I think that is the bug.

Just send a patch.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
