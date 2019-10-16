Return-Path: <SRS0=Ypxe=YJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5F9ECE599
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 19:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A29562064B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 19:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3euDaQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A29562064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Ay8vykpG580aK78+/Cn625PMAT58rS0nZMxC4l+ajlU=; b=o3euDaQPnLPWJjbrQKP2Ys6+1
	5VmaXie3dAJsdxqNTNztD/i3Zif10Se/aFK2ZjmYuRBmDoOLFPWuD/ZWavAL1ZuJpHVTHFzrYiVBY
	pIymk7AxMPP99KrPVFdGhgaNukgUuO20eVuTAzXApTuB8GNG6VeOoP+Eo3fH1z6uniQSajtLVqkG3
	vP82Bimt+zIwSa7MY4YPikr1vVJtfDeHsfJALMfiiMIll8HLjiWYYFq9kX91LVfLJN3tSCsMeGvpr
	jFps3UJt4poIi3E7dg4lf9XjxOGyti6sLD14yKIqSqgn9vcEjXEbEIyfSm0AjiEAX84s/iv91jdY3
	c44+xz/IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKot1-00047I-Qu; Wed, 16 Oct 2019 19:23:07 +0000
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKosz-00045n-Hf
 for linux-riscv@lists.infradead.org; Wed, 16 Oct 2019 19:23:06 +0000
Received: by mail-pg1-f193.google.com with SMTP id 23so14875127pgk.3
 for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2019 12:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yNrX5NxWK+qA1o6LaqqAm41/yReowE+lc1hULeA+iQo=;
 b=LveSd9gW3gHgdfZyX3TSldcUh/P9tX8rGWW6SuoMCwACtL4wcxIMKqrgHqaeN2iFfE
 qRMVkzqD6u38bfkB0FyQWp3XCSTea6EqYDot9EC+wcOS1dMwXcR4O1AwtpX+/3TrNeV6
 Mett6e9V+uVxh7wUeLxbjVF9aouG6tH1qkUCr3unb9Lpk6z/GKDnUTfWeRzBL2J+bgXC
 Jy2CleB1DdYz4ZB7dngMgNLq0enIv+wIePQHoylwFVYGp/dnc9MIjIdMBJFV2E3fCnci
 2mXFC0cZ/TEPa70b+mMHby9xZ1oeIqakmfQEf+wpGZo1Xro20x6A0dO7cJi9ql0yYHX8
 KP9w==
X-Gm-Message-State: APjAAAXM4z8u9iHAgeZANLlFNKC9VPKCtIcrUeycGlLTTChcStRMY3/F
 BmEx9DcWg9dCC8fcLRX0FaSSVA==
X-Google-Smtp-Source: APXvYqxL7QA2f4fhE3Wl5GbWBvWdaQkuQMrMb1TNzwEQ1pCL0mnhlQdr9u9/Zf+Usvn7SVZWcaa+RA==
X-Received: by 2002:a65:500c:: with SMTP id f12mr16812322pgo.233.1571253782761; 
 Wed, 16 Oct 2019 12:23:02 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k6sm26188868pfg.162.2019.10.16.12.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 12:23:02 -0700 (PDT)
Date: Wed, 16 Oct 2019 12:23:02 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Oct 2019 12:22:58 PDT (-0700)
Subject: Re: [PATCH v3 1/3] kasan: Archs don't check memmove if not support it.
In-Reply-To: <c9fa9eb25a5c0b1f733494dfd439f056c6e938fd.1570514544.git.nickhu@andestech.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: nickhu@andestech.com
Message-ID: <mhng-5f3ce9b5-2b64-48d7-a661-7bedf58c50a5@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_122305_584948_80721881 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, nickhu@andestech.com,
 alankao@andestech.com, corbet@lwn.net, Greg KH <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 alexios.zavras@intel.com, glider@google.com, allison@lohutok.net,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 tglx@linutronix.de, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 07 Oct 2019 23:11:51 PDT (-0700), nickhu@andestech.com wrote:
> Skip the memmove checking for those archs who don't support it.
>
> Signed-off-by: Nick Hu <nickhu@andestech.com>
> ---
>  mm/kasan/common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 6814d6d6a023..897f9520bab3 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -107,6 +107,7 @@ void *memset(void *addr, int c, size_t len)
>  	return __memset(addr, c, len);
>  }
>
> +#ifdef __HAVE_ARCH_MEMMOVE
>  #undef memmove
>  void *memmove(void *dest, const void *src, size_t len)
>  {
> @@ -115,6 +116,7 @@ void *memmove(void *dest, const void *src, size_t len)
>
>  	return __memmove(dest, src, len);
>  }
> +#endif
>
>  #undef memcpy
>  void *memcpy(void *dest, const void *src, size_t len)

I think this is backwards: we shouldn't be defining an arch-specific memmove 
symbol when KASAN is enabled.  If we do it this way then we're defeating the 
memmove checks, which doesn't seem like the right way to go.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
