Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTYGH4En8fM3xjsfPQZKQXnCOqOirWCM70F8ecNWbOc=; b=FM5b4pOI1/3sfT
	dL+93F+mA6vrxhMa+8GIjNnaPNx2y+EnUO903WGAPiljuSfDYi6vp3Z1VzFUV/HKat+rVDC8Gs3o3
	rocIg8E68JNO+3/5/85sJ6ZgFjbmDSXn6GEiXr0arSmeozZ50L8KW2/qHfqRDuAl6ic6qycVaxRg9
	c8E+0MD/gI9bAfuZLmAQSFPVCReBcfs/UlyjlhmGzLEwhNfJmW2s+eRKvBZru3l1lOrlo6u/Lxg/H
	RebxeHQ09tbbnikEaWscsGl2bZUn9IZVNXeLGuyJbMKPK6twShseispjBRm6AuHDc1PHSZbTBHyPT
	bxGUdaWy1DQgISqumFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfBh-00CDx1-3o; Mon, 28 Feb 2022 12:31:37 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOejl-00C3E7-Lf
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 12:02:49 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-166-d7SEXvIjOR2492KDyKN4ug-1; Mon, 28 Feb 2022 12:02:41 +0000
X-MC-Unique: d7SEXvIjOR2492KDyKN4ug-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 12:02:38 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 28 Feb 2022 12:02:38 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "anup@brainfault.org" <anup@brainfault.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "liush@allwinnertech.com" <liush@allwinnertech.com>, "wefu@redhat.com"
 <wefu@redhat.com>, "drew@beagleboard.org" <drew@beagleboard.org>,
 "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>, "hch@lst.de"
 <hch@lst.de>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH V7 03/20] compat: consolidate the compat_flock{,64}
 definition
Thread-Topic: [PATCH V7 03/20] compat: consolidate the compat_flock{,64}
 definition
Thread-Index: AQHYK/ctkLOBFN5NzkqkonsQCyvC26yogbZggABZggCAAAIWoA==
Date: Mon, 28 Feb 2022 12:02:38 +0000
Message-ID: <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
 <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
In-Reply-To: <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220228_040246_052048_EB8F0948 
X-CRM114-Status: GOOD (  19.09  )
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

From: Guo Ren
> Sent: 28 February 2022 11:52
> 
> On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
> >
> > From: guoren@kernel.org
> > > Sent: 27 February 2022 16:28
> > >
> > > From: Christoph Hellwig <hch@lst.de>
> > >
> > > Provide a single common definition for the compat_flock and
> > > compat_flock64 structures using the same tricks as for the native
> > > variants.  Another extra define is added for the packing required on
> > > x86.
> > ...
> > > diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
> > ...
> > >  /*
> > > - * IA32 uses 4 byte alignment for 64 bit quantities,
> > > - * so we need to pack this structure.
> > > + * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack the
> > > + * compat flock64 structure.
> > >   */
> > ...
> > > +#define __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > >
> > >  struct compat_statfs {
> > >       int             f_type;
> > > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > > index 1c758b0e0359..a0481fe6c5d5 100644
> > > --- a/include/linux/compat.h
> > > +++ b/include/linux/compat.h
> > > @@ -258,6 +258,37 @@ struct compat_rlimit {
> > >       compat_ulong_t  rlim_max;
> > >  };
> > >
> > > +#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > > +#define __ARCH_COMPAT_FLOCK64_PACK   __attribute__((packed))
> > > +#else
> > > +#define __ARCH_COMPAT_FLOCK64_PACK
> > > +#endif
> > ...
> > > +struct compat_flock64 {
> > > +     short           l_type;
> > > +     short           l_whence;
> > > +     compat_loff_t   l_start;
> > > +     compat_loff_t   l_len;
> > > +     compat_pid_t    l_pid;
> > > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > > +     __ARCH_COMPAT_FLOCK64_PAD
> > > +#endif
> > > +} __ARCH_COMPAT_FLOCK64_PACK;
> > > +
> >
> > Provided compat_loff_t are correctly defined with __aligned__(4)
> See include/asm-generic/compat.h
> 
> typedef s64 compat_loff_t;
> 
> Only:
> #ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
> typedef s64 __attribute__((aligned(4))) compat_s64;
> 
> So how do you think compat_loff_t could be defined with __aligned__(4)?

compat_loff_t should be compat_s64 not s64.

The same should be done for all 64bit 'compat' types.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
