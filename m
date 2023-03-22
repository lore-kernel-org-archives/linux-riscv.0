Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CCDC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7JUyUX4ShFtCbmAUZzJAybgWtPYTv86SjjDYN3KUKg=; b=k/jYp9ayDVHA5T
	YAfEabjAEbGrSig+85LuRjHYhkRcOGTaUHfjWNyB2izGOf53eDf8JH3RTHbdMkmXa7cRd8We4iECl
	5+aSPjG0I5AcKfgLVJQavT/KfEyt34m7A5NoLjJJ7Y0qDSIJpdty+ZMFhJ1eNZAJsiYC+PrRQRjTo
	kIelrwZUzGxUmyNZRlsUaOa5ktUSazMuY7vzDsnDhildeOSkts6d6wTe5HAoCatdkDgwaBCe5cFVD
	V2eIojHBxFNXKn3qNh2iev9GFN69IfdSIUSJU4jbpAc2R3MwS8DgNGVj7Kzj/H2A952b5YHDHfeJS
	Sr98y0qCI2KVHim0OxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1petFJ-00F3kr-0J;
	Wed, 22 Mar 2023 07:50:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1petFG-00F3jC-0r
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 07:50:55 +0000
Received: by mail-ed1-x52d.google.com with SMTP id cn12so23543799edb.4
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679471446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AdmVjcvz1/yCt2UekFt3nmmLHzuFXFt3bw5QTUpRmg=;
        b=Ong+tjrl1kElrSo25R80+eYY7gyjS21weUf7Tmo9+I9bCkc1dMGdWHoY/ueZEFJkD7
         S10DGo34JW0RdUrf2w71ggMb7Pc+Fg12C0vp1cC3EnZ55yJS0fEPYvvNUu7ykcQGlReV
         XvkggfXPJ8JKFQCyT4O50XI/7tg8NkMELNhJnqRkgT/LBB3AHtG/2VP17jLi1ZD1VCd7
         LSYXhzpc98c5ud/+Ww2rJ+MARxsc4E0Yn7wAYMdxFCuXOWCkCdCFazPHQEBigQEztEFQ
         D2cZKrxWskR7sNVGLnA4a7vFiWoiL3k0NDyQ+E54//6MHGNGnmmpurUQ/m9hz58sva0m
         k1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679471446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AdmVjcvz1/yCt2UekFt3nmmLHzuFXFt3bw5QTUpRmg=;
        b=zRcXArshi0nn86x9PNxZDCJT6CwJ0lOAHCt0pkmbpn7Kpz4iIxf8FlYg/V4N0OBWru
         NprHSuzj6r8qD0DIDW4cp/HSVMPWZikzV6A6sHTWmyPxVcvSIsV5XJT0lgqdbDhTTGh5
         BjjJfSkVBeR9+4li+S4tp1pcpeu93T10ZHcav7htzJYxydOReFSyRalAdFeEgAr7+OIx
         G97z6eIUy5/ARkbaYkuLthFGQq8gyca1ZrGEh3h8I5c3RM/7iEKeYBEJnT8TX8h+a4R6
         t1nUr9gQxqzMaTMlH1h+Uxd19ZkhB4WYITYwJH04KRThqpZkH6hey9PApln6/BlwfTMI
         /O7w==
X-Gm-Message-State: AO0yUKUOIHtexWcmaOxBefhnwEljUe/A80GRMBj99rddLXvZ9raNmx6w
	g72unj592ygrFLYz2uWGdmaGs9Svx5RxUNQC
X-Google-Smtp-Source: AK7set944h2QkdgHk0raczdce/k/+S/C6qqg7EsqCHlU2CG8ATrJisTfH2Nl3ExtjzPeRmw/k7+2AA==
X-Received: by 2002:a17:906:55c9:b0:932:e6d5:bd7c with SMTP id z9-20020a17090655c900b00932e6d5bd7cmr6960071ejp.20.1679471446407;
        Wed, 22 Mar 2023 00:50:46 -0700 (PDT)
Received: from andrea (93-41-0-79.ip79.fastwebnet.it. [93.41.0.79])
        by smtp.gmail.com with ESMTPSA id z17-20020a5096d1000000b004aee4e2a56esm7250886eda.0.2023.03.22.00.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 00:50:46 -0700 (PDT)
Date: Wed, 22 Mar 2023 08:50:42 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v2 1/6] riscv/cmpxchg: Deduplicate cmpxchg()
 asm functions
Message-ID: <ZBqzUplarOxIXrvN@andrea>
References: <20230321074249.2221674-1-leobras@redhat.com>
 <20230321074249.2221674-2-leobras@redhat.com>
 <ZBpPms0PGv4sWR1Y@andrea>
 <CAJ6HWG46-an3r3WH+n8mHHge8SjqgMbohjTmmk=_EXVmwKZSeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ6HWG46-an3r3WH+n8mHHge8SjqgMbohjTmmk=_EXVmwKZSeA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_005054_324259_D5C19218 
X-CRM114-Status: GOOD (  10.57  )
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

> > Though I'm not really a fan of macros depending on local variables with
> > "magic" names, can this be avoided?
> 
> You mean __ret, __rc, __ptr, __old and __new ?

Indeed, the wording was from coding-style.rst


> If so, yes, we could add them to the macro signature, but it would
> become quite big with not much to gain. To reduce impact it could be
> something like:
> 
> +#define ___cmpxchg(lr_sfx, sc_sfx, prepend, append, ret, r, p, o, n)
> 
> Is this a possible fix?

I believe that'll do it, open to other approaches.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
