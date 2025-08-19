Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCFECA0EF5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGZlpGfOFYUOOgy5bWH2qs38FAWGS8HuoF6nWwEo6hM=; b=w1qbweEZKVQroi
	uST85B7csW188XqO97o1ceXFnqvFa3pGgEgs7tadKfvsjm8IkJ1dVS4S7IA0Z4s4V1Imz1J6qPTiQ
	wV/fuvpKur2uBG0F5P8afORK7sO8Lme/XoLh+yYKRcuoQ9MJFTjUVSyLsrxEMGQhtJfmiKjT6ySd6
	XMZoT1PhxWKboe5K2XXVA9XZRge+irEibxkjsckl+oKL07pOrln172fAMEr2Dv55BddypTkr1Js/K
	/1BnA0DgRdQtuD1O4cd/gkWuI9jWv3PO00BC0E7Fql17gNKekCw9EyBsQjOfPXVcRFWUmRz6o/j7m
	dkznnpOOlJzwIUE9uTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA9q-00000008zsW-1hPd;
	Tue, 19 Aug 2025 00:24:58 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA5H-00000008zT0-3jaV
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 00:20:17 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e86faa158fso577049385a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 17:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755562814; x=1756167614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAPvksbcJ/XXOJoTp6wZAG7UHW44uE+Uh92CsDXqVTw=;
        b=ZQ9vbnYksE+/ezAmTKLl+lEUMg9a0beHqzGTrdx9LC4Xm8G98JzmYfgBXJ16osjLxP
         EyIeORvmqXto+jsK9iAIzbaduCu4uDtbIcUbJBRKhqj7tfOSQqk3lHZUOtW/73/Uu38M
         +DOHw3l5EpASkEoA7QMyOec669iNiWf3HOdO4bsW66JSissiCbtT9CZy+auN6Xlnk0wX
         YK96zhY6fi6Dbwqai6oYB7TgCtuOLrgop6Dc0UhaW2ArktV7KNA7rMo6EsE5pad1zRSF
         FFaloqv00YHB33lBAOsIwXb20KKlhFnadacBBQ0sG70R9GnDbNihc+SEMNYuwJ1mUxqJ
         JiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755562815; x=1756167615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAPvksbcJ/XXOJoTp6wZAG7UHW44uE+Uh92CsDXqVTw=;
        b=iQxqfa4i3ycD2uD9mPS6ezbOUyrJdIW7JmZZC3Sg84vI+4NvwfZ5ueS/Vy3Vaa5mrB
         pA627vl5iYxf4oEK+9gpP2pL7B2SGYjPRT0wMqQbUahrI51uvExYNdtvCejQowKAbrCK
         kRRx7BnmO+oXm+ZRxZ2RfWlwcJzb56uAhHypUUi5S4zO179HN9zkDcLS649qYomp+GFy
         1rEvBnOFlo7AmrJNT+Ffv1lSCX+opu3i2SHo+KPU/b0iqAb0yqBKQPGOBZ8upzDuxrLN
         hregZw1QepJlfNG4HFHnssGHf/RtdvfEWjwuA8GGyCN8WW+ikkMoRJx/p65ikoBflj47
         TpAA==
X-Forwarded-Encrypted: i=1; AJvYcCXIqi4DU02dYfku+h2jsXDM2QY0RyCpG7tC883tEz4FGLjoqRp+1jGXawAs+Yy7Ap/8o4mAcyRk4im0Qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyphqfZ7MJcj1Xr4km7FdWpSYFXFgccrjMj0b5CG4AEuOqsjCNK
	CSQA7xGwQWCmhqpnBmQatuUgpkeFVIzspcIIkT+z7xsAmT8OjQ186G0W2AJRWyuGZPo=
X-Gm-Gg: ASbGnctT1Y/53Q4YyHQMfAp+Wf+jNmDZgscAFBl8oP97MikR/lYtXWlhOEGo9wYqc4U
	C9xWuhqoy2ClcIvT7F5A0lZ1fr5kTQ0CUxCkE8thfRZZRuMni0P4/79SXQ5VW8Sarb2dyUNNb/H
	JRsDzOzt6l63VjY49zpkVOThUSz9gOq6qjMeWw7INQ+JBgFo2GhAYixBgpe6RJ9a3hfZLFGqFlW
	lN96D6ajMOBmUbh7D3xfYPeVhFfpUf9S9jxPTpl7Q9oZxs6+aBg7f2w6ALK+nIbrLavC5pXjCvj
	Y1v+cxhtse/TKvkDktTn0FZabMxUJ/QtjeGqOSf+vhqNkR2FNNJxntjeeYKzUJnaFZZFpRxeH4p
	82zTrxegw5Pwft0vNGWKmoTfLINrRBqAzRw==
X-Google-Smtp-Source: AGHT+IEHUvZuJexFz6BBeX3fk5mL3wBIkel2sx8apDNHbc6BvCRU44PVFegJAXdrEJBt21NGRDXlng==
X-Received: by 2002:a05:620a:7205:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-7e9f43067b8mr62262585a.2.1755562814479;
        Mon, 18 Aug 2025 17:20:14 -0700 (PDT)
Received: from localhost ([173.23.183.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e05477fsm685766085a.22.2025.08.18.17.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 17:20:13 -0700 (PDT)
Date: Mon, 18 Aug 2025 19:20:12 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 1/3] KVM: riscv: selftests: Add common supported test
 cases
Message-ID: <20250818-59fc63b56f8f2da1acb7d9f6@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
 <09544c24d724a0e9d01c34b3d7599d860919ccb6.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09544c24d724a0e9d01c34b3d7599d860919ccb6.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_172015_934489_84175809 
X-CRM114-Status: GOOD (  16.13  )
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

On Thu, Aug 07, 2025 at 10:59:28PM +0800, dayss1224@gmail.com wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Some common KVM test cases are supported on riscv now as following:
> 
>     access_tracking_perf_test
>     dirty_log_perf_test
>     memslot_modification_stress_test
>     memslot_perf_test
>     mmu_stress_test
>     rseq_test

I gave these a light testing after pulling together an appropriate config
(we should probably better document needed config symbols...) The tests
seemed to mostly work for me, so ack for including them.

> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Dong Yang <dayss1224@gmail.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 38b95998e..3a7186551 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -197,6 +197,12 @@ TEST_GEN_PROGS_riscv += arch_timer
>  TEST_GEN_PROGS_riscv += coalesced_io_test
>  TEST_GEN_PROGS_riscv += get-reg-list
>  TEST_GEN_PROGS_riscv += steal_time
> +TEST_GEN_PROGS_riscv += access_tracking_perf_test
> +TEST_GEN_PROGS_riscv += dirty_log_perf_test
> +TEST_GEN_PROGS_riscv += memslot_modification_stress_test
> +TEST_GEN_PROGS_riscv += memslot_perf_test
> +TEST_GEN_PROGS_riscv += mmu_stress_test
> +TEST_GEN_PROGS_riscv += rseq_test

Please integrate into the current list in alphabetical order.

Thanks,
drew

>  
>  TEST_GEN_PROGS_loongarch += coalesced_io_test
>  TEST_GEN_PROGS_loongarch += demand_paging_test
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
