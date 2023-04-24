Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6599C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPF8+OVJvLwVTK/C1ITQgjqVieHvm/dgk/bD0sWascw=; b=DgLwDgJNpec2Ng
	afw+IDsUHZCwFri4XimyVIfKckBMfSWnsB0dfaIqAKX/j01fZWR/pDDsc9YI6Bde+pVlnNvNIXiiL
	gT9W59I/PORG4nxE97TDwGzMMUToO6WFpB5sxPlTRHhufwQxWKfOEzVakS7GuBWHfvC6qUJKs4VSn
	Qj6xyxWubarNlUhQvf+1tuu79cJb8HlSmbbr8YfCUDZxGSsBNl8O76h/8BeF5TxhDq+uIrjbzcIl8
	ibDj0ekeACmaChv9T7iC7fubjBdkh2Aox07tsEAot8YC5i7TPlJBM8Vcn0R5u2qs2YgoztVMkO5Gz
	xdHZkOyuP1aIzjqGoJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqy7m-00GhVp-3D;
	Mon, 24 Apr 2023 15:29:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqy7j-00GhUP-39
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 15:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682350139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3Xi1SdkhmIfRjRu7FuyqmHC/va+/w7r2t9GfgfXyFY=;
	b=Jj8lqqmE+0NBB/0NO0Q6MJKyVA7LlxK45seFUsbrBcHSW/YjdAr1a7mbxXLjvQkO+nBHe/
	bU9h1N0qDTGogdPvV+ET6vicdy05mh6B3sNRBKTJgV4pnbMfApiwFjeFkTkH9tfLedhuCt
	/S7TWs1A444128dj1SKeZQWt5Ei7ErU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-zSF27hSuNk2LL6ngf1XAMA-1; Mon, 24 Apr 2023 11:28:55 -0400
X-MC-Unique: zSF27hSuNk2LL6ngf1XAMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B378D85A5B1;
	Mon, 24 Apr 2023 15:28:54 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.225])
	by smtp.corp.redhat.com (Postfix) with SMTP id 728CE492B03;
	Mon, 24 Apr 2023 15:28:52 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 24 Apr 2023 17:28:44 +0200 (CEST)
Date: Mon, 24 Apr 2023 17:28:41 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] riscv: uprobes: Restore thread.bad_cause
Message-ID: <20230424152841.GB32615@redhat.com>
References: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
 <f60e6e0f-a520-2e8d-0b81-6b15498cb300@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f60e6e0f-a520-2e8d-0b81-6b15498cb300@loongson.cn>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_082904_241014_BC479590 
X-CRM114-Status: UNSURE (   8.61  )
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

On 04/24, Tiezhu Yang wrote:
>
> >diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> >index c976a21..194f166 100644
> >--- a/arch/riscv/kernel/probes/uprobes.c
> >+++ b/arch/riscv/kernel/probes/uprobes.c
> >@@ -67,6 +67,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
> > 	struct uprobe_task *utask = current->utask;
> >
> > 	WARN_ON_ONCE(current->thread.bad_cause != UPROBE_TRAP_NR);
> >+	current->thread.bad_cause = utask->autask.saved_cause;
> >
> > 	instruction_pointer_set(regs, utask->vaddr + auprobe->insn_size);
> >
> >@@ -102,6 +103,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
> > {
> > 	struct uprobe_task *utask = current->utask;
> >
> >+	current->thread.bad_cause = utask->autask.saved_cause;
> > 	/*
> > 	 * Task has received a fatal signal, so reset back to probbed
> > 	 * address.
> >

Acked-by: Oleg Nesterov <oleg@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
