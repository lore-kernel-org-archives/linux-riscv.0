Return-Path: <SRS0=/uwW=7K=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DED4C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 May 2020 12:37:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8932074B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 May 2020 12:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ctBlBME3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KcAvrYEt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aisp8qRE";
	dkim=neutral (0-bit key) header.d=redhat.com header.i=@redhat.com header.b="FxcSBRC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8932074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GRwkxAXKadNb8L6vblVDH1YHL3lLq/VSX5Jl4TgNeUQ=; b=ctBlBME3+FBr3mhQWfyR+/f31
	BvXpCMcXbqoMGdnijFzsXguH0iq6litoxmRvweJW0IHMFuKrARLnpYt0pJZed9XfdesX9L7St17JD
	Mjfw+E/ONadvOBR8rfklbQP8ATa5IS7vaMWRuDcWRkDStYBhN9eg4xSnXXYlCMzX5vPfGI+JfD2z/
	aBTmRbQRE/RN+x+zGVZMNAY8VHRDqxZrhqN+dh0CyPOhQMPYLcvgBeX6rzDqg4NhxUzJBjM7Sgdjo
	l8/cEi9TLL2+0PDnZf/WAZD5ApTf7L7TQ4Zy+h7aBVvhQYEGDxeV4rIBHjXFSYdDoDNz4Bfdjtu6V
	sXmPpqmnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeHmi-0000bl-TW; Thu, 28 May 2020 12:37:20 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHmf-0000ZX-N3
 for linux-riscv@bombadil.infradead.org; Thu, 28 May 2020 12:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GRwkxAXKadNb8L6vblVDH1YHL3lLq/VSX5Jl4TgNeUQ=; b=KcAvrYEtmyg+LtKYz1UEDsRkVU
 VdqqYq3YjG4XqeI6DEwWtCYrdyE/kzh8tuEKXY/9UH7b5HAYTOXN2dEVJrJy0bQBLUU/I3BZXe08B
 qKhgrxJqqsxovuQvoHw+dbpBxiv175C0gCBDds29tjpXzlIeJwcGlB0vAkB97AB0bfSt0Bkf8NCY1
 7G/ZBOscX0A2lg7SiWUsiZq/xE2u635+QhYtIlcHwR9+CpwCHJC6Wrvn/2P61ipPwFR5K0KriBPT5
 LK2AWv/PWYx8QpVUGrwNrcH0B30nmfRnV8yCXmzTi0HzPO063conpX+5JLyM2oLLE/KjxqjplORgS
 wnHvwsfw==;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHmd-0007Aw-9i
 for linux-riscv@lists.infradead.org; Thu, 28 May 2020 12:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GRwkxAXKadNb8L6vblVDH1YHL3lLq/VSX5Jl4TgNeUQ=;
 b=aisp8qREGtJsTbhPQlr2s8xSZwp7hGPo1T28LgtDPb5QIxQIwcQYEhGT491TzHBOzU8x35
 7GyoCgLjPa/s4OYmJIr9YVFm/gGS092UoYxLMP9CMMbp4VusWw3PvfHZqFpzVKkPtFunbI
 YQ5kzlTrzrE0soVaAApCl+ZX5hO0hKI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GRwkxAXKadNb8L6vblVDH1YHL3lLq/VSX5Jl4TgNeUQ=;
 b=FxcSBRC8kqDMDAUVQJ1htPE6fwIbTBYADO/FomCsTT7vEYnsYKwPX4w78jeSmd+mYzn42W
 DjpqIFig71SCrGHDjSPsC9r7dGrapj10bQjtSw9XP20ZHCnPVeGcW5qXM4PtAKxUrKZEAA
 iX1GVjtPdx/4OX3OQPhFz1zO3qMnHMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-EyyxwPu9Nla98fHg1KPQ8w-1; Thu, 28 May 2020 08:36:45 -0400
X-MC-Unique: EyyxwPu9Nla98fHg1KPQ8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F52108597B;
 Thu, 28 May 2020 12:36:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.7])
 by smtp.corp.redhat.com (Postfix) with SMTP id A969F1001268;
 Thu, 28 May 2020 12:36:41 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 28 May 2020 14:36:43 +0200 (CEST)
Date: Thu, 28 May 2020 14:36:40 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [RFC PATCH v5 01/13] ptrace: Use regset_size() for dynamic regset
Message-ID: <20200528123639.GA19813@redhat.com>
References: <cover.1590646208.git.greentime.hu@sifive.com>
 <e490cf0a1b57b7cb34a5ea1252e7a71109d6ffee.1590646208.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e490cf0a1b57b7cb34a5ea1252e7a71109d6ffee.1590646208.git.greentime.hu@sifive.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, palmerdabbelt@google.com,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 05/28, Greentime Hu wrote:
>
> --- a/kernel/ptrace.c
> +++ b/kernel/ptrace.c
> @@ -888,7 +888,7 @@ static int ptrace_regset(struct task_struct *task, int req, unsigned int type,
>  
>  	regset_no = regset - view->regsets;
>  	kiov->iov_len = min(kiov->iov_len,
> -			    (__kernel_size_t) (regset->n * regset->size));
> +			    (__kernel_size_t) regset_size(task, regset));

Acked-by: Oleg Nesterov <oleg@redhat.com>


