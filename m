Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B750EC5B552
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyX/v+BKpFOY1ewC/luEWIKHxSrn6ArmlgOUrt3w61Y=; b=hycX5WYfPMbD9F
	JElWgil+Ztw/lkAbaKoGqUpTX87t+UG04+V8nVmlgLZdPgad7SOdz9RCs70lN7g9FzAgVhLC2wdGv
	qsrNWu8Xojv16ibg8TJXt0d0W3f1zmv5u47uiIe4Q91RHFW2NYl3OKAF8ZlbMWk15AY1hw5AHHCsJ
	RR6oY0Sih4GHH86g199G/8MBFTSkHg0GwC5InJqu8p/5dWuFLBy7aXKCQhA/qAkz2OjsXYKwavWXT
	OHZHPZ3DhSNDKVBGxHzQV6Scr+2bG1aBwkNkAtJOg84hObbS5DYlQQ32rlNrwpVjFvHGTYU5lw94d
	MHHvFnRbTbGJiORMclyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgkp-0000000GFvz-0eIc;
	Thu, 29 May 2025 17:09:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgih-0000000GFnc-1Sz5
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 17:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748538426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
	b=YTHhVRvlu5NNMnGmkcFiCRMVT2o6IJ6Qkg0Momd9VFRCudLiBfTqZdSUh2qPPtYrLnQurF
	L5+q1LZAFCtKY268kiC1Pb5ADKQFsQHanDZE+o0xcKRdZtdlMeEycyEZcLSRmY5cuIb4j7
	v2mKlVH6/2jCWdQdXQGUSmhyIJg130g=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-OMWGzregMICLg6qvPtSQAw-1; Thu, 29 May 2025 13:05:31 -0400
X-MC-Unique: OMWGzregMICLg6qvPtSQAw-1
X-Mimecast-MFC-AGG-ID: OMWGzregMICLg6qvPtSQAw_1748538330
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dd77fda439so1101975ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 10:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538330; x=1749143130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
        b=kS3j/AXt+6B0KUjLlw1nBrtST3UmsJmfegjd2HDTaR5nMMNEEDUTqNeUj+AQgR3j6f
         f2ydh0s1VENbzks82YdNsvSeCQy/c3M+hwuVZ9spHEfgzj2qNDSH4+7Xmmh+4OV92JZS
         vt7XuPczkEdvJd+10LTQEpKfoHRZJj7Fcw7QBnrKumJhNCzv1cVDb84rzzOaKT6zkH+T
         E29Q4GC+HGNOLOy/Rj3lxcznH4GeANRDvwEh/G6n614fdZ/1aF7P9qCK7jJwjSvIUcKh
         YDBh9ek1sBsYmTYHILJJ+sVLflw50RnoK3A1wWis1EAGmgk0x+rWK+gweYPTdgY+WUG4
         /TSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7ffrErIzybqZkj3v3+SrKhED47y4oVOzQD7o1mkLUD48As86tVsabh7+SXbyL/tR6c6ZDIW7ZR9/1mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyZjXgnkh+7gtVzVR+1TdyTu1w1rpRjKr5isNHssKJMtzCALj/
	Se3AaoiC0CSK3a/NmBY85v3VhN6Wx6wzxxA2uo0p7VuCptXsSbaboc/711n91XX7UxQ6JgGUmdW
	NazzXXpP6qvwosyxWw1ILE1EsOgksrI/Ie+Ci5nt+Y1MVsxef9LYaNgmkY8FLJOA14Pbi3g==
X-Gm-Gg: ASbGncsHs66h3m81m9/9YDrsGc0XbDJ8nLsPGck6q3qpB+4N5Kcg6FdmqlAzrp2SeXO
	ykvrbZSf1WO983WUNZzJg07VUQLYwl+c54SYiIQ9ER2Lon8NZuBvNI4QWrDx3aHZGIH2xMXHwgN
	GO89il9yMUqLA+G80PnB5m7H9WOVZjCWftvoLKLldPr8Bl543I2ATU+eY2dwlz87atNYOuB5l3+
	oWGy9DRxM7ChsX0gIOB+qBv6LrGUV3/RD4pvaIu1tQIHShYUUs1AueKoComHA5fWZAgjfEFz+vg
	hto8RtxHwjry5Js=
X-Received: by 2002:a05:6e02:2789:b0:3dc:7cd7:688 with SMTP id e9e14a558f8ab-3dd99bd0681mr1264875ab.1.1748538329890;
        Thu, 29 May 2025 10:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfF2IypLjTHDTvX90AOSKarc6ttkVaDkLoPGB0d3lYBRme4WFH0Ya+stqq3YBkEYUuHUQECg==
X-Received: by 2002:a05:6e02:2789:b0:3dc:7cd7:688 with SMTP id e9e14a558f8ab-3dd99bd0681mr1264795ab.1.1748538329510;
        Thu, 29 May 2025 10:05:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd935462c8sm3928805ab.36.2025.05.29.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:05:28 -0700 (PDT)
Date: Thu, 29 May 2025 11:05:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library
 instead of shash
Message-ID: <20250529110526.6d2959a9.alex.williamson@redhat.com>
In-Reply-To: <20250428170040.423825-9-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
	<20250428170040.423825-9-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eXLj8QbmPEdg3W5199H-xeQZhelnqUbjNgEh0WLKahM_1748538330
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_100707_457199_FE1D73AC 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, 28 Apr 2025 10:00:33 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.

I can get to the following error after this patch, now merged as commit
b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):

error: the following would cause module name conflict:
  crypto/sha256.ko
  arch/s390/lib/crypto/sha256.ko

Base config file is generated from:

$ CONFIG=$(mktemp)
$ cat << EOF > $CONFIG
CONFIG_MODULES=y
CONFIG_CRYPTO=y
CONFIG_CRYPTO_SHA256=m
EOF

Base config applied to allnoconfig:

$ KCONFIG_ALLCONFIG=$CONFIG make ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- allnoconfig

Resulting in:

$ grep SHA256 .config
CONFIG_CRYPTO_SHA256=m
CONFIG_CRYPTO_LIB_SHA256=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA256_GENERIC=m
CONFIG_CRYPTO_SHA256_S390=m

Thanks,
Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
