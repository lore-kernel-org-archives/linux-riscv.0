Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766CC3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QGmtmT1gRFJMpIUq8+Bke22Le1rKepIP/6qKs78fgc=; b=YAZ1GgODh38ybW
	UbfIVxrUEhEpHhusKReESyQVn/EJVn6YDAb1veck0K2kli/nikp/cb1rGsMw0nJo9/Kd23vmGnELk
	bHwJRvrYJUrd0/KXzMARIW2cCj9a+SmruUS8qlzXexlk7BENg1zJiBYCPCquoVWrF+64GQhXm6or7
	LPYE0ZDZDCU2sEgUr9CDOF+YOOkFNLx5So1w7K8Nazs1ChuafHhWU7rLjnYDc0MuuQyrMkI1EOopE
	LvRkL8KodyENG4h0Dl3C/Z5txhpMxuAkioeGTM75Ash5TIb9gSfa+/iebuZyaG35M7NuS7isj3ARe
	Db5WV475hHl43HPs0ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRvPu-0000000ESJM-0wdP;
	Thu, 11 Jul 2024 15:09:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRvPq-0000000ESIk-2WoW
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 15:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720710541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lx31M68JcVzeqU1JzcMQtMpsLglQujw/nqZU81HCxy8=;
	b=PcgsWf2+B5ATvp2XNhEzhcGjMgiUbNa7sz/lY+cNvOfK2+sjLSBwmeNkYwZUKoEFrFffo4
	qp7WZr2+EBReY3npFHhnlQN4xkLPTJ/LsTotbNQGLA0Cw4e8OlweCMb4vKXIOKK/VRvZlE
	MRzVTlp2Z2d0Wfhal7ZQsxeUmbG0Ft0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-CYN0YUZnMFmDMrSsnNyeFA-1; Thu, 11 Jul 2024 11:08:59 -0400
X-MC-Unique: CYN0YUZnMFmDMrSsnNyeFA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44b30403b90so968491cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 08:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720710539; x=1721315339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx31M68JcVzeqU1JzcMQtMpsLglQujw/nqZU81HCxy8=;
        b=j/UyW5B3TRv9sCTCahP5752O1j1B0zaAFPE7xF7JzYdCo7dVRtSLLapbH9goy0m0fZ
         QM3LoBKfGccouKc+bRT3t1i/1kJqEcoiLf/at6X+y6mAsXyF9o5G10EnYzfUoz72mmab
         9O+rS/EEUMtvtS0Z5B0jlgvsP0HWpT60DgvUykQ+4czqTBn7Jjx5pGXraaKaEmcIykfV
         C9dILireXJQJupN0wB+8cQ3NGm6T1q3XGMI2dVhDNq4sD05wZzUORgFeV3JfGtNU7qG7
         7uLwg7xbYNdDDbrnWVXwIOgNOKGdZbi+pvEZQyEd6JGYDv3ceo9YblK3wlZi1mBhuSJC
         G8yA==
X-Forwarded-Encrypted: i=1; AJvYcCWNK5aFJds3vCnqdK5SKRFOQaYEdd6M+II0bLUeZfbEsAAfs/1k2+zV7xoLB21IiSn+ZzAg2DqsLDA4qieCzdhWwaQOnmuNTzqk6kyiocU1
X-Gm-Message-State: AOJu0YySMnn8OwOMBqNMRUyRrFkmSIIIUUHevBTlhrNmZLswISOqHJpY
	jr+fmA4HCePdra/CcUmX5fC5oiu2z7CTds6S7DK5+C87uSXjZQG45nbMVP9y+mEHza6WKEqQ+Qp
	y131q3AIAKbXOfSs52smJdM/jBGeAmUdksZJHFmJlkX5ubcb5A86cZDS3noLZ1Dc/kg==
X-Received: by 2002:a05:6214:20a5:b0:6aa:3158:e8c9 with SMTP id 6a1803df08f44-6b74b0a4acbmr28765836d6.0.1720710539074;
        Thu, 11 Jul 2024 08:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIsQcL1yIiW7RGe3LVC22DOIbQ204xDljkpkS3THeYMpVLfuV4OtwZSXZUMwvTHDEZeGJuxA==
X-Received: by 2002:a05:6214:20a5:b0:6aa:3158:e8c9 with SMTP id 6a1803df08f44-6b74b0a4acbmr28765576d6.0.1720710538544;
        Thu, 11 Jul 2024 08:08:58 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b74263a1c5sm13866906d6.78.2024.07.11.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 08:08:56 -0700 (PDT)
Date: Thu, 11 Jul 2024 11:08:54 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Message-ID: <Zo_1hrOgU4dWnSUV@x1n>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
 <f69941b076bf8fec89b6bec5573fdb79483c2a75.1720597744.git.christophe.leroy@csgroup.eu>
 <Zo6e1ILgDn6nuhGC@x1n>
 <b37a0bb5-ba6f-4db3-af8f-83e06eec086d@cs-soprasteria.com>
 <Zo7Vz_LGUgaf9BGN@x1n>
 <154b60ea-9113-4093-8082-7a471beacfb1@cs-soprasteria.com>
MIME-Version: 1.0
In-Reply-To: <154b60ea-9113-4093-8082-7a471beacfb1@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_080902_749043_D2F90F40 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, Jul 11, 2024 at 01:40:17PM +0000, LEROY Christophe wrote:
> I will wait a bit more to see if robots report anything else then I'll 
> send an update fix.

In case helpful, I normally use this small bunch of scripts to test
cross-compiles (and I keep adding new configs that can fail any of my
trees):

https://gitlab.com/peterx/lkb-harness/

Just FYI.. I think different people use different set of tools.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
