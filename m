Return-Path: <SRS0=pZSk=WK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEF6C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 02:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F349020842
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 02:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p53Qr7m5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mLHWVPc2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F349020842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lkrgXDPiwgt6Jx0NSTY8h27jbGR3S9NlF+peEIZ00s=; b=p53Qr7m528oAkf
	FTJFeQLLAoP5CKgb+zNex0lAXK5Dgq+eBK9XFcinWdoh5x7rrL+v4A0HZvG4sWDglh2xh6tZV7PPY
	y0KDUtSpywkCtX8EVRqDGDmxU/DB3LrnmpGFczDjPcY7O9epa6qb0sixor00xSYjORFXfN90BaTvS
	dcOCWfYpGU91LufYPXwVquoKGIB66HQqJZGLd3NEq13wViWwF2FCgQVgRw56Pl9JEcekK312YUoqy
	sVEeZ7prB+MDj9NJYU3OumN99b0KRg/Wnl6bbGqEdyAjXG5gTapOZkayihVKLPSsazoc1ju7/walS
	vpFq0Sm5WwNJfBWfxa8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxivd-0007vq-NW; Wed, 14 Aug 2019 02:22:21 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxiva-0007vQ-3b
 for linux-riscv@lists.infradead.org; Wed, 14 Aug 2019 02:22:19 +0000
Received: by mail-ot1-x342.google.com with SMTP id m24so25882196otp.12
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8BVuvw3t6MICKGaM59gUM2yEToQKCitDbig7bIPBipc=;
 b=mLHWVPc2XzViL5mr2TusnZ0mnC+7dlsKZVniZcvXdOrbNxLERbn3v/jwLoZeTYqVUn
 5g3/Jq6Aeziwxy0RpUY+5gdXMYhwuv/zlNhSHsK156/UvKGF0KVCRY3CQ3py/oXwYHCk
 113hKC85UTgw8T1FaOQuNFpYni9gBqLm+1DOyxf/sMFiel5z1A9q9t+k9YZ57NPlhJ2d
 +MIyZXqSMVf0ii3HgGKhHV+QM45ABReJ8WUEKavXRKdKIqjomC2lzjgMsIwg+vihBuCy
 8zOiMH0OXm1lKPv9Nu9TAYGR9NDXaJkA6VVW6jsz/0wGx85MZjpj8RjsDvccIK6LQ9b6
 POcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8BVuvw3t6MICKGaM59gUM2yEToQKCitDbig7bIPBipc=;
 b=Yt3yYSj1hT7NvK3/4py8fhDeiSfzUeguS9+KRVhvHfHOFbQlZjtIvRDHRpsAyu797r
 mb46jOa+//vTOJ4eXVtQIKBWXrNPRooJypEklq5kkTtfozH76bcTPEHgpp0epZg+UXBe
 eYZvLoD6FOdWsVy505vdwNYxS2ufgHYVuyn7Za6K4MIZWgvZuBUDizwbDnkR3Tw4od9p
 aPUtrI6VbGb2loyUqJL1YqL2RIgZ7N8XOMuKgF1beSLCLkp5OJEpn2jRQEIKh4qhqvdi
 9bJYRh+ad/kHL5Euvny1oEychvWsokeRMNAvkgnNCPcISjI+g6bEWM5BQzZ4ynWvFghh
 n9qg==
X-Gm-Message-State: APjAAAXHaAIqNVCAOdncm/HbKo0B5CcODoUgrxg5YqxfQTgyFFuRxT5w
 Olc26Ywoj+Z9rhKhaGPqhaPLQA==
X-Google-Smtp-Source: APXvYqwneMyChwem1IZY1SgCchGO2nCncpWJ+r8g6Oc+o8I11BYTdeZNV/bjkZxCWbUx24fPg2ZFVA==
X-Received: by 2002:a5d:9752:: with SMTP id c18mr82018ioo.22.1565749336873;
 Tue, 13 Aug 2019 19:22:16 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e22sm17331071iog.2.2019.08.13.19.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 19:22:16 -0700 (PDT)
Date: Tue, 13 Aug 2019 19:22:15 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 1/2] riscv: Add memmove string operation.
In-Reply-To: <mhng-ba92c635-7087-4783-baa5-2a111e0e2710@palmer-si-x1e>
Message-ID: <alpine.DEB.2.21.9999.1908131921180.19217@viisi.sifive.com>
References: <mhng-ba92c635-7087-4783-baa5-2a111e0e2710@palmer-si-x1e>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_192218_308489_DCBCF9D2 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, nickhu@andestech.com,
 alankao@andestech.com, Atish Patra <Atish.Patra@wdc.com>,
 Greg KH <gregkh@linuxfoundation.org>, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Christoph Hellwig <hch@infradead.org>, alexios.zavras@intel.com,
 glider@google.com, green.hu@gmail.com, aryabinin@virtuozzo.com,
 tglx@linutronix.de, deanbo422@gmail.com, linux-riscv@lists.infradead.org,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 13 Aug 2019, Palmer Dabbelt wrote:

> On Mon, 12 Aug 2019 08:04:46 PDT (-0700), Christoph Hellwig wrote:
> > On Wed, Aug 07, 2019 at 03:19:14PM +0800, Nick Hu wrote:
> > > There are some features which need this string operation for compilation,
> > > like KASAN. So the purpose of this porting is for the features like KASAN
> > > which cannot be compiled without it.
> > > 
> > > KASAN's string operations would replace the original string operations and
> > > call for the architecture defined string operations. Since we don't have
> > > this in current kernel, this patch provides the implementation.
> > > 
> > > This porting refers to the 'arch/nds32/lib/memmove.S'.
> > 
> > This looks sensible to me, although my stringop asm is rather rusty,
> > so just an ack and not a real review-by:
> > 
> > Acked-by: Christoph Hellwig <hch@lst.de>
> 
> FWIW, we just write this in C everywhere else and rely on the compiler to
> unroll the loops.  I always prefer C to assembly when possible, so I'd prefer
> if we just adopt the string code from newlib.  We have a RISC-V-specific
> memcpy in there, but just use the generic memmove.
> 
> Maybe the best bet here would be to adopt the newlib memcpy/memmove as generic
> Linux functions?  They're both in C so they should be fine, and they both look
> faster than what's in lib/string.c.  Then everyone would benefit and we don't
> need this tricky RISC-V assembly.  Also, from the look of it the newlib code
> is faster because the inner loop is unrolled.

There's a generic memmove implementation in the kernel already:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/string.h#n362

Nick, could you tell us more about why the generic memmove() isn't 
suitable?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
