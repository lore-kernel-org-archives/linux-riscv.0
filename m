Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE9AC5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZpBh3IqIkpNd4UqBN/4fWY41PufWMRP+e+TW+b94s0=; b=cJ3Z5CQKI8TcE3
	Gjpr8wzwGYLMkR02FaUlvrAoZrOBkLx07zgsgqNqAttyfHcigDWle8nwZPuOx+bEE7afWdlGSJDRK
	XGRarNLxrSeZ07c/G0mMaAmo+yE7paU5COl3gcD9RoBVBYgkWlbMt027Pgk6ZdcpwhJ4qGxBCq0jk
	nJ4p1AjfNjpAdlesKeYzRNNR/7I85bYAnjK8bbb9zu3sikUaxGqHWgCAQmphwvFNaG2JKrZWql1BP
	OX4lOjqoZyG3Pqu63dCPiVnEGGm/WkrgOwcbDozAdE09dUjzZgSvPvhsKE8TpBNxZJGuZtqXHC6PW
	e48X6o2ogr/SwYLoVzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDjt-000000079gd-02T3;
	Fri, 07 Aug 2026 06:07:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDjq-000000079gG-3fkI
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 06:07:28 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786082842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+Luvg/YvUlQx9EXWzueYWupKY2VuFFRN9swMAUwpKA=;
	b=qKYPzUk3K9jIP3duBXi8LrHrGj4RDDWgjY4imN1bwP/0gnZd+3rpmxuhHxcnFOVX8ikmBO
	9GtrvB7Kg5Sgfl0EYnMA72UH1GdCr7N1nuaquzevjeDiObVavz4Ptc6ckhzj9djsH7HEn6
	TjUAbHkHdx1UGpWQUohZYjgitWup0X+yHhxG52Koxfjgw8JhP8Pn4lCeJ4ZPbQuAfnhG2s
	vWUBYpMVJTg7Ir6uRQZUWRAo2+oTneLWyHDKLTTj4fma60g9Uu5XUTyv0gl18pvKbIL8Z6
	a90rW+4Qv6C4fuvj3mMi8T2ozGmh9J5tDBmOZHcmNLnjssZ7g6kWtU+PvVcqWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786082842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+Luvg/YvUlQx9EXWzueYWupKY2VuFFRN9swMAUwpKA=;
	b=fu9AdUVfFKNaqDs7GL5EFvEpPqRqlQaXywDZbiVUAi+T9KXv5SP0rqnamBbxwqnkvV7Zc1
	IyTi2ptyb45/j7BQ==
To: Paul Walmsley <pjw@kernel.org>, Rui Qi <qirui.001@bytedance.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, Jingwei Wang
 <wangjingwei@iscas.ac.cn>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
In-Reply-To: <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org>
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
 <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org>
Date: Fri, 07 Aug 2026 08:07:21 +0200
Message-ID: <871pcaa2g6.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_230727_052982_E6263501 
X-CRM114-Status: UNSURE (   5.06  )
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

Paul Walmsley <pjw@kernel.org> writes:
> Now that we've queued a patch to get rid of the async hwprobe 
> infrastructure, is this patch still needed?

Yes. Removing async probe only ensures probe is finished before the
kernel is done booting.

But there are usermode helpers which run while the kernel is still booting.
This patch ensures probe is done before that.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
