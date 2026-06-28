Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981F4C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QOCBJaqGJ+5V/2TxDXHWdwgbvUne3kuiJIknkeVtmk=; b=s6MRDz3iMu+PN2
	cveElYkzn3m8EESUZUxZ6lmA6p3AQIeJP+qQw12q6m+xXG/lSKvN9uLBxmR62B2NvbM9ietvm5aJT
	ozgc20mo4lbRmabZJyi3lLLvaZzHiV7ZsQFw0wfOp0Ppe4Xiy7y1NIQMf+f6TTPTaGwTEVd2GG2KT
	ioJhzsGs9m9dQVuM0EbEZnGUXwMVAYIKQy4C1Xhn+Fqm/hzh5Tw5vRe1mzEh49w9IA+qEy84pYyxg
	L2efM4F0VN/0oELdvPKef5ulDha+5Ou8qJwUGUZxL8LaxJHweBwALJ3bvO+1DlXJ10cE+CuJwJir4
	HQk8Yq+iPfcjJEvYN53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdj9R-0000000Cwtd-2H0b;
	Sun, 28 Jun 2026 06:37:57 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdj9P-0000000CwtL-03Xf
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 06:37:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c74383c93cso23825805ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jun 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782628673; x=1783233473; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxbfFY4tow/cxVk3DBC5MbGr8rGt7hcXtDQR3cXybbg=;
        b=eYQinHQ81j3rSKDbAJN6jR22fA2BFTIND++efkY6kPTNCYt/qYN/vPu7PmtbvwZk2S
         J0fwu7GfuO2FuDuW0u0msYlY2h9L1Ogxe9Voaz7dwy2JRXTidE2WSXy4mw9uNtVu0liA
         L1smlujibG7FQat1jxA5CmUxjrRGfsD0IXJPV+yZDaSslZOqI3Nw1KWjllrhqTCO3nzu
         MlTT7Qw6kOTRkYJn23ZIm9YFDUgVpBVZ3Xslp+/DTZERzqjL+V1OOXbevzZ/Z8rdHi7F
         EkxjpvapjnFYzY9Q5OTo1ET7pA0DpxoAX9o7mTCRW4Eg3TXXzI6A/ew65K+Vg4Ew6NFg
         qJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782628673; x=1783233473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxbfFY4tow/cxVk3DBC5MbGr8rGt7hcXtDQR3cXybbg=;
        b=WEIAliw5dJgq4K46qyftBJaa03XYFOIi9S0gWktqef3Hd+6PKkoY3MX6uV0nZ26Js8
         OGYydQ4yvOAKUUqKMozmLvOeOpFgaNmatkj9gg6PCR7n93W+VJSNX2KVKYPTkeL1L7xB
         vg9dr3lDxrQ0tc91ojro/jM8AP69ixTqUZtqlpiHYBKE1yb8aoAXoyjD0sY47zf0T6jM
         xomS4nsixmCOcbISJ0SRdJUy0L3Mge8bBEoqW9qzj/aGfPciqlIRVWYShfsYizJqeKdV
         JJSj9fJ4hmQVwPSJek6/FEFy4CKN4zj0CRVkSbnYy7x4ScY/6owPiWo2QmrooX3f9z32
         Pigg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/hMflWSMafMSujOY4uoirPx2WpDCzDfBz1ekT0vUtXT/jnIBtp8KbaqKUufi9cDo4pu+UBDd29cKleQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaQx57xGE9hHMr/m8FD9XniFHnYZM0WpToG1heq06k3rPoflg7
	PPOb2CVrTWypT6haOy9i4Ch9+N3sLRstWqjohnMJS9rtZDmTey807CRl
X-Gm-Gg: AfdE7cm6b/KnixNEIp5drOEqiB/IdDhknOHwUVVy9BB2WlHEUgsQVnxONhZXE0LpGUS
	B5C1DdTeNLMy+z1ReNyc3s7PuAsyJ4e1ZJvi8inmvHI9jS1In+4lHO+BuC9l3WQI6RbUIYDe/ls
	eoFXQgNhsd1j/2rC6kqTaerDbL0NlNaGx4+8k5gp/ZRwY+HYyQOUKzZ25Rxg6vroofSqY0bYTQ0
	z06qTZJ2T90rgQdxaDZUFCctvHd80kOr+rXSOXsS3/0+1wcXQraWG5ZpWBaru71H3RLw0FnE4wl
	ymUnWqm8wiIYtht9CVbJzgpVQOCiEMpRFZUHxRJP80+Qrr+9xq39lIsbmM6NRxwM6rBtamEYnLO
	n3eVF6l033APHwAuztwgOJwjXt7qHLjW7gSeOwFen+otN6u1BidAutl8+/snCjulO860TPyPXfr
	1PUzKKalaE39+UBx3J1DD8ClTDqN67Q3mrcHw8n2U=
X-Received: by 2002:a17:902:e5c9:b0:2c9:97a7:327b with SMTP id d9443c01a7336-2c997a7337dmr51790045ad.44.1782628673499;
        Sat, 27 Jun 2026 23:37:53 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64cfdcbsm68156965ad.62.2026.06.27.23.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 23:37:53 -0700 (PDT)
Date: Sun, 28 Jun 2026 12:07:39 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, bjorn@kernel.org,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	pulehui@huawei.com, puranjay@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Message-ID: <akDBMx45h20In6EP@computer>
References: <20260621144259.288135-3-varunrmallya@gmail.com>
 <950216803ac2380e0537b27c94ff87dd2ae0dc689fe320c51d96b9095cefc614@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <950216803ac2380e0537b27c94ff87dd2ae0dc689fe320c51d96b9095cefc614@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_233755_056362_1BD15092 
X-CRM114-Status: UNSURE (   9.44  )
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

On Sun, Jun 21, 2026 at 03:32:32PM +0000, bot+bpf-ci@kernel.org wrote:
> 
> This isn't a bug, but could the kcfi preamble, fentry-nops loop, and
> TCC-init instruction be emitted once before the exception_boundary /
> exception_cb branch instead of being duplicated? The same three-part
> sequence appears again below in the non-exception path, and the two copies
> must stay byte-for-byte identical since the tail-call epilogue skip offset
> depends on this fixed layout.

Making this part common in the next version. Sensible change I missed.
- Varun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
