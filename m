Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6076DC624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0q+ZFQNp7Vk9KGSPDSUdlqeksfDoONoAX/ZqOH7240=; b=S3Tc3gsagXEcGI
	acq8nx61e1P6Vg45JX5viTYb9sJyNhx24bECUXLJCSd133dMJie1vdY3Jmq3cEX+6SNtrsx2GkNFv
	96zqsu2lgqoVDX5JaUul7JfPuifgTNhL9tCkylaGc0ptvywnyGHyhZbDjMhRKnIOq0NyLyq0CeB+5
	A+oEtlVzg89aYB6JsQo7W2x5XS9yubbboXxZAGvs0NXzIDR4Yksr9WN+3PcRaARpdUWoC/F6pDXWv
	ajDyam64vDltVagIYdrN6Lair2Sn533W5R04SlyoDsUa9zGbYUwLLpbXXj5eLVNrroLLk7Wtob/RO
	tO5ufdDs86N/9r9kozxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13S7-00000009jyo-1TBZ;
	Mon, 31 Aug 2026 14:57:39 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Rz-00000009jun-20gn
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:57:38 +0000
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 3F804C018C;
	Mon, 31 Aug 2026 14:57:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 14DDF1D;
	Mon, 31 Aug 2026 14:57:23 +0000 (UTC)
Date: Mon, 31 Aug 2026 10:58:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Rui Qi" <qirui.001@bytedance.com>
Cc: <mhiramat@kernel.org>, <mark.rutland@arm.com>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: ftrace: reject out-of-range non-direct targets
Message-ID: <20260831105820.22085739@gandalf.local.home>
In-Reply-To: <20260901020000.1-qirui.001@bytedance.com>
References: <20260707121235.759104-1-qirui.001@bytedance.com>
	<20260901020000.1-qirui.001@bytedance.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: i3pjcmzphm14rwrt1owf6ty49twegz1t
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 14DDF1D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1//eGqi8bpd7aR+4JRxanQExgdzhlCWk8w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=kimCP8YvJCUrptM2WnuQUVqNPk5kAPjReUuPtX6bnJo=; b=CEBXjHXo/VvdsMQTjfUVOvrvdTU2K9wWoKunjm5+neGQf+heP7S4QpWKvNqXJ5DC619z43JnJMeT4+2ZSC4pz2pgo5mdltlbKDtldo4R+juO5Z7HJfcVKmHpffF7T7AyoC/anhPYEbDZTmkBI/6BgNj5im8omFwbblloWVliimg=
X-HE-Tag: 1788188243-30817
X-HE-Meta: U2FsdGVkX19lQdUL0R9LZgKiHVJI6aXbwu2zVZ/wFibAXM2rhRi59Dnl1TnGlQ96Wv8srtUKsRWlob/uDFb7hygVDLaWVpyAgWSACryK37fyeTbGFDkskivDNtHwXiWByiLLiIIccRVuUuhFr5F/GWBMgdKYqKsXdEl17M1LAJ4E8qd64ogN0lg2HPP4oFPAJxVpzhIfaLIh9em+EHnxK9T4YFw2vWHXFWoDkbH9W0iF2Qjry0wl5pVjF7/cPFk8sMV/U2eS39zZ9Ryj/eGiJ0YPc7BivS9+FPKfj6YSq4aZ+vvlECRxB29glzPuCM99zhmBPx6gI8GV4Ds3DGEQjqbrxoWY1tkb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075731_694672_D23EE090 
X-CRM114-Status: GOOD (  12.01  )
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

On Mon, 31 Aug 2026 11:50:45 +0800
"Rui Qi" <qirui.001@bytedance.com> wrote:

> Hi Steven,
> 
> Gentle ping on this patch. It's been over a month since submission
> and I'd appreciate your review when you have a chance.
> 
> The patch fixes ftrace_modify_call() on RISC-V to properly validate
> old_addr/addr instead of always treating sites as FTRACE_ADDR, and
> rejects out-of-range non-direct targets that can't be dispatched
> through the existing ftrace_caller path.

This patch looks very architecture specific. Is there a generic ftrace
issue you have with this? "out-of-range" issues are specific to an
architecture (x86 doesn't have this issue).

You need the RISC-V maintainers to review and accept this patch. I don't
see anything specific to generic ftrace infrastructure here, which is what
I maintain.

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
