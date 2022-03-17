Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQtr6fSx9QMQ6VRqI4ud9Kq0G7rVlmo3NVIpIZu8Tas=; b=F7QhmeJRS+JD95
	eBiqkqSvi3NgbC2YJ4ippu1PpzOSIWNGqgUgCjYaeSAi7dlg5hFv2fY7zb1EjD+S4fXOVJ8oPRTyg
	cLgkSlUx7PseC9NMSuZ5XTqOvl7hWLIcShv2oFjg+HsDESImobp19V9JIaKVYx+I0rcfjXQKEj6HW
	c0mCqWk6Gi++NPp8LfqSVs5xs7zGM+4uDtNhSjFClUvq5VgmVhrCbDpd0kSY9Uwin+Yr/Rkvrs2vT
	yivUvHTsDKMayyNyd0Rbp1u0SdxSQpv0oL+Ymj54DI/LQW9JrfQepxb8+fJ+eeOd+9aft/m/AnphO
	TR8qneOq7ylWZKzahRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUuDB-00GwTP-3D; Thu, 17 Mar 2022 17:46:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUuD7-00GwS4-Up
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 17:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647539213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llqjR9J1FmybTT0pHxsozwhPdyLYqoq+OgcFl5fMvI4=;
 b=VoAhd3m5tt2tOFusOR8P0Gc6+W7X3u7kmOYWooMmBwq/5wkqCri72Na+8/QRAifaQmzFlx
 TFDspP5mhCPcau7RXWkT3SKUvJNSW+MUg2U28gibt9HHD7eVdEsdDHKaO0GYflW6jbObb0
 ZYamGQj2Qep3BDVLa+VPSpsvFFWSpsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-D_1JD0DkM1yNyRBj3b6jGg-1; Thu, 17 Mar 2022 13:46:49 -0400
X-MC-Unique: D_1JD0DkM1yNyRBj3b6jGg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A59218A6584;
 Thu, 17 Mar 2022 17:46:48 +0000 (UTC)
Received: from [10.22.8.95] (unknown [10.22.8.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EC33401E87;
 Thu, 17 Mar 2022 17:46:47 +0000 (UTC)
Message-ID: <67ba2190-dd72-4ad0-32c2-de43418b73a2@redhat.com>
Date: Thu, 17 Mar 2022 13:46:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] asm-generic: qspinlock: Indicate the use of
 mixed-size atomics
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 peterz@infradead.org
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, boqun.feng@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-2-palmer@rivosinc.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220316232600.20419-2-palmer@rivosinc.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_104654_078571_F4690453 
X-CRM114-Status: GOOD (  25.58  )
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

On 3/16/22 19:25, Palmer Dabbelt wrote:
> From: Peter Zijlstra <peterz@infradead.org>
>
> The qspinlock implementation depends on having well behaved mixed-size
> atomics.  This is true on the more widely-used platforms, but these
> requirements are somewhat subtle and may not be satisfied by all the
> platforms that qspinlock is used on.
>
> Document these requirements, so ports that use qspinlock can more easily
> determine if they meet these requirements.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> ---
>
> I have specifically not included Peter's SOB on this, as he sent his
> original patch
> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
> without one.
> ---
>   include/asm-generic/qspinlock.h | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
> index d74b13825501..a7a1296b0b4d 100644
> --- a/include/asm-generic/qspinlock.h
> +++ b/include/asm-generic/qspinlock.h
> @@ -2,6 +2,36 @@
>   /*
>    * Queued spinlock
>    *
> + * A 'generic' spinlock implementation that is based on MCS locks. An
> + * architecture that's looking for a 'generic' spinlock, please first consider
> + * ticket-lock.h and only come looking here when you've considered all the
> + * constraints below and can show your hardware does actually perform better
> + * with qspinlock.
> + *
> + *
> + * It relies on atomic_*_release()/atomic_*_acquire() to be RCsc (or no weaker
> + * than RCtso if you're power), where regular code only expects atomic_t to be
> + * RCpc.
> + *
> + * It relies on a far greater (compared to ticket-lock.h) set of atomic
> + * operations to behave well together, please audit them carefully to ensure
> + * they all have forward progress. Many atomic operations may default to
> + * cmpxchg() loops which will not have good forward progress properties on
> + * LL/SC architectures.
> + *
> + * One notable example is atomic_fetch_or_acquire(), which x86 cannot (cheaply)
> + * do. Carefully read the patches that introduced queued_fetch_set_pending_acquire().
> + *
> + * It also heavily relies on mixed size atomic operations, in specific it
> + * requires architectures to have xchg16; something which many LL/SC
> + * architectures need to implement as a 32bit and+or in order to satisfy the
> + * forward progress guarantees mentioned above.
> + *
> + * Further reading on mixed size atomics that might be relevant:
> + *
> + *   http://www.cl.cam.ac.uk/~pes20/popl17/mixed-size.pdf
> + *
> + *
>    * (C) Copyright 2013-2015 Hewlett-Packard Development Company, L.P.
>    * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
>    *
Acked-by: Waiman Long <longman@redhat.com>

Note that it references ticket-lock.h. Perhaps we should reverse the 
order of patches 1 & 2.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
