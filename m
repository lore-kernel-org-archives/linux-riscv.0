Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B56C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 20:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0LFYYS/XVcjDtT1IIYeQdYJInVRHZH62YMf6sFx+7g=; b=DJKeopDuMsBGtj
	+UOxzimsrmGDjhiMaUOa4MHKtz1cazJeZGSjHWLc0q4RCGyNgQk9khA2GuGRA6hZCjS2KVaayMdjV
	snNpZuMUbQCb5o4TOTlpWO8q6QVEhu7KgtvRo/I3z/+gC3MetjZoFH2oNjzc7B6ge939ePdsEN5oG
	LFLk3egcvOneW2GFXtHG2yais5KbLGZfx/KYR2r2qO048EqsNvQQUGjrXMWRNfw/F/X0TjC7Oa6Er
	Zgop4kQAJHI8wogLy0QPX7G982X4wTWGIuFvrGLXidisQvw7/S/R5zDPCm8JPeq5zyq2VlZr7+XDR
	IMBtp0O5hpKtmn1TUBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUYxn-00BawX-29;
	Fri, 11 Aug 2023 20:42:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUYxk-00BavB-2a
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 20:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691786540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYsuYB/f15MU2xfH+EM7bqeXLDjg5PV6c8YrC96T5p8=;
	b=Suhsd//6zqH0bsE33O0VNr9IpTBt3neTvmJeYp4/wANru3jHFzGQtf9bB4gafPF2H/FJY0
	ukCDybDign2QbiWJCg/PJIVrO4c86bJPAByTt5OaXhGG+lImQMxZFt6V5LxzEJ1kiTDCls
	9CIyyN2XOeCgT3uYmIedpbx/zfeyIhM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-RkKW7mn5MiCC7qNnb5xmEg-1; Fri, 11 Aug 2023 16:42:16 -0400
X-MC-Unique: RkKW7mn5MiCC7qNnb5xmEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B4838008C0;
	Fri, 11 Aug 2023 20:42:14 +0000 (UTC)
Received: from [10.22.17.82] (unknown [10.22.17.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E581D2026D4B;
	Fri, 11 Aug 2023 20:42:12 +0000 (UTC)
Message-ID: <5cf1117c-d537-703c-cdcf-f43c5bd9ed1b@redhat.com>
Date: Fri, 11 Aug 2023 16:42:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V10 18/19] locking/qspinlock: Move pv_ops into x86
 directory
Content-Language: en-US
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 palmer@rivosinc.com, boqun.feng@gmail.com, tglx@linutronix.de,
 paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
 catalin.marinas@arm.com, conor.dooley@microchip.com,
 xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com,
 keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com,
 jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230802164701.192791-1-guoren@kernel.org>
 <20230802164701.192791-19-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230802164701.192791-19-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_134224_922345_B972361E 
X-CRM114-Status: GOOD (  10.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/2/23 12:47, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The pv_ops belongs to x86 custom infrastructure and cleans up the
> cna_configure_spin_lock_slowpath() with standard code. This is
> preparation for riscv support CNA qspoinlock.

CNA qspinlock has not been merged into mainline yet. I will suggest you 
drop the last 2 patches for now. Of course, you can provide benchmark 
data to boost the case for the inclusion of the CNA qspinlock patch into 
the mainline.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
