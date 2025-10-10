Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D698CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 04:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hJRJV5xAF4P0jVK2ktwTU96kYcJYzESw+9gGcX3pTY=; b=eTaUSc0FSv+uVp
	Jws1UoS40xfb3mLPdHVq/0eUa4a7VIcByJTyzciUaDnEXgOPZ2nedbjj90yJzw3ZfZqcNVqi2i2i1
	IJ0VsDU1CoY5wJ6akUmZS78ID4/OciWKzTRnFScGJNbNtxfIf3hUx2/1J08/UeXQK4ZrbpazxS/iZ
	9ZRIia3Qi50E+fti90HYU6kawODTNv5OZMRTjOIN/Y+KsUu8Yne+1tg/2+7EXtOvdVkgz06gVO+rB
	JO6AfntBiJWj5yuBospGomsL0KNJfaowHcZVpg229a5EIQ4Bn8iJynUOcYic9+wQmSh/b+FxWHtPE
	rBu1m1NZvuw4D307Kpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75Ca-00000007gK3-2Jzz;
	Fri, 10 Oct 2025 04:58:00 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75CY-00000007gIM-3fF8
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 04:58:00 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1693689d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 21:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760072278; x=1760677078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=byZ6t6wrDWSM3IddaYudPoR6XYlS7rynO3IjgiQPfI2Ml35UyMwNN53dYO102kEBt9
         o6/WD7QMEip9m8poYQsQL/UPW3lnIaf5cfUJa4ET61KFoYrOKqPwiffDvhnzCkSXcLss
         iq+5EM1cXwqvyIsuzbKxPyj6QLqX00yE0YGBqDzAtuWc9Rz10N3BKLQwlxH+U4/Y7OqF
         jOK0+z7HS5oIKUQ+jyFw1NW6eQLbhWBbQ+g8DMB7NzieN1x7xuOwvbe1QGKRRq9WTRrk
         iWpXNqv0vlUHRXEl+/1iuOMv/jMaXN2PiDVXkt1kgubaVjxf1YERjzHdbNofm9AiCjFu
         mmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760072278; x=1760677078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=CVzXCzKy3pe35ZLm2naoRKSQsJp3tKEG9rN4Qo+IDgw4ox8WmcJbG5tupQVIDIWyyE
         vx4ron5dZNS46ryVDttusoR8shw4c+hWALR7zWoN//QiNdXjWangYtFwdGifl45b8kx4
         Hv2BxpDi7ZIISAE2ehvGNYug2FLVMO8n6w+yHN3/DtuvK3WSvEMdovuobH7NU9ExEzTw
         GMIbBps4888YwdBS2an4LtlDc76BATc5m4blDv34KPLasxxvjqkjq2ad7at9tE5nqbr4
         gzEBnzhy+23qe+tma6OwbLOywPJ+jGVFMvKVtrwoy65ylJ+rT9/j104H2YV/zVqnTVJQ
         gZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5PIcX6Q/F0wU23i+OmsfQSM7+iUpEKJ0rvxcrb3h3coN03UesAI6iFpjGZFPZ7PNvx4jpc7ZkwDHUtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0EkYDtXL2Aq2Jstvcucc6ULj5XpUZj0/LD7rSt4SzjNHWTPTX
	zWIMh7e8aAQ9oJR9i7wsqjVLdr2tZGMEAUQyY5R7H4XqFfJXI5cT4qKjAX7Yk49G67Q3rRgX7sP
	jKv6UxHPQxqgBrKyVgJ1nBXa64OEEgw8=
X-Gm-Gg: ASbGnctKu/11eMi1dxZ9cUZa3J2IfqOul2pobq+DeOeAWp0NO0gH7ehD2pNeJ4wGLdL
	bqyhqHhzgyTAc/Cwpo1MIV8Gct4qas9wMUAu0AITVhH+cZlvfuIGZksoYMyU1iCI/j4bexu6zT2
	keCJpm6wCo0yOLMXLE1ROBfB7TVtyXGc8EJkhI58EWOrpHnFWeVzk8K3xnJL9lnCGEomN/a2uCN
	wOB0RMUgZR/BeUe2s8SYQhcng==
X-Google-Smtp-Source: AGHT+IHqDciv7GAPYfMGdKr9Fwuo5GT168N8GcrpsJ5KozP5HqYqg/LDALxuogvzJXgNCm6zrA+DoCqu7lr8uhQrVc0=
X-Received: by 2002:a53:5009:0:b0:636:2420:d3ce with SMTP id
 956f58d0204a3-63ccb93456dmr7466309d50.51.1760072277565; Thu, 09 Oct 2025
 21:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
 <20250925131055.3933381-1-nschichan@freebox.fr>
In-Reply-To: <20250925131055.3933381-1-nschichan@freebox.fr>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:57:21 +0300
X-Gm-Features: AS18NWAQwCKadWHXCZjVUBNaD3TaKIilJiJAQzSbvGFaYuFuE8UDpW1_H3riB-k
Message-ID: <CAPnZJGBPyONjJoM6cskxysDnN4pxWuWJCK5A6TgikR2xHsrN5Q@mail.gmail.com>
Subject: Re: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND
 00/62] initrd: remove classic initrd support).
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_215758_925073_39101705 
X-CRM114-Status: UNSURE (   7.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgNDoxMuKAr1BNIDxuc2NoaWNoYW5AZnJlZWJveC5mcj4g
d3JvdGU6Cj4gLSBkcm9wIHByb21wdF9yYW1kaXNrIGFuZCByYW1kaXNrX3N0YXJ0IGtlcm5lbCBw
YXJhbWV0ZXJzCj4gLSBkcm9wIGNvbXByZXNzaW9uIHN1cHBvcnQKPiAtIGRyb3AgaW1hZ2UgYXV0
b2RldGVjdGlvbiwgdGhlIHdob2xlIC9pbml0cmQuaW1hZ2UgY29udGVudCBpcyBub3cKPiAgIGNv
cGllZCBpbnRvIC9kZXYvcmFtMAo+IC0gcmVtb3ZlIHJkX2xvYWRfZGlzaygpIHdoaWNoIGRvZXNu
J3Qgc2VlbSB0byBiZSB1c2VkIGFueXdoZXJlLgoKSSB3ZWxjb21lIGFueSBpbml0cmQgc2ltcGxp
ZmljYXRpb24hCgo+IEhvcGVmdWxseSBteSBlbWFpbCBjb25maWcgaXMgbm93IGJldHRlciBhbmQg
cmVhY2hlcyBnbWFpbCB1c2Vycwo+IGNvcnJlY3RseS4KClllcywgSSBnb3QgdGhpcyBlbWFpbC4K
Ci0tCkFza2FyIFNhZmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
