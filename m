Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4835BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNZcVq78MdVGWzt1hSCQiEecyclhGHt6KpEJI9hlAq0=; b=FkiO9Vr/Y2Z5G+
	49IR/nlR/8xm9ajk+JvlxcAvsKCKXsEtHOxkpXkfHm6R5aB5QugL+H4pjs/plx9pSO6ZBasMVMLZv
	bbFThcVI4wWgF8RzxU0Rd8KAxxXWfKdkhPRQAGbJkVW22fRHLggDClPoUX4bY2vHfmLax4BaC6NTI
	7/SIFXxDds1ZlD1xEjiTRULEHXOh8jMLc/Cmr+89HZcBfyHiS3sJeFlj7LEfU1lIwMpCrDdC82l7w
	Ayy09sMWuQ2uHg+p37fH7JS5zjhuWE86I9sUe+YsjVU2XLgRUvMyYzIiAbF1lYMKozutCNPXviT33
	/3V3/vJSt8hsQq3/Lhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T2m-00AOYw-NV; Wed, 29 Jun 2022 08:27:28 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T2j-00AOWS-L1
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 08:27:27 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-87-5EtqUqn2NCqq8mpFHFTvfw-1; Wed, 29 Jun 2022 09:27:20 +0100
X-MC-Unique: 5EtqUqn2NCqq8mpFHFTvfw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Wed, 29 Jun 2022 09:27:19 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Wed, 29 Jun 2022 09:27:19 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'guoren@kernel.org'" <guoren@kernel.org>, "palmer@rivosinc.com"
	<palmer@rivosinc.com>, "arnd@arndb.de" <arnd@arndb.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "will@kernel.org" <will@kernel.org>, "longman@redhat.com"
	<longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>
Subject: RE: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary
 atomic_read
Thread-Topic: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary
 atomic_read
Thread-Index: AQHYispbyiGvvAChcUmlft7kGYjTZ61mDYUQ
Date: Wed, 29 Jun 2022 08:27:19 +0000
Message-ID: <8eaf85d4e4d9401ea187366de12e7269@AcuMS.aculab.com>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-2-guoren@kernel.org>
In-Reply-To: <20220628081707.1997728-2-guoren@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_012726_005294_F501B31F 
X-CRM114-Status: UNSURE (   9.24  )
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

From: guoren@kernel.org
> Sent: 28 June 2022 09:17
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
> because the value has been in lock. This patch could prevent
> arch_spin_value_unlocked contend spin_lock data again.

I'm confused (as usual).
Isn't atomic_read() pretty much free?

..
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index fdfebcb050f4..f1e4fa100f5a 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -84,7 +84,9 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> 
>  static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
>  {
> -	return !arch_spin_is_locked(&lock);
> +	u32 val = lock.counter;
> +
> +	return ((val >> 16) == (val & 0xffff));

That almost certainly needs a READ_ONCE().

The result is also inherently stale.
So the uses must be pretty limited.

	David

>  }
> 
>  #include <asm/qrwlock.h>
> --
> 2.36.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
