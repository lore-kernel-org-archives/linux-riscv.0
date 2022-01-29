Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501CAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsJbxsa/CoHB0ORZUmOJ/zkZyH0wWBcw2c1LuSx5g7c=; b=LvEBOCgQZ06KaO
	CFM5WY/A4TcgCzRX7IekACEG7MpvKYK3Y567aj27hgRT1xvY4bH6txwyQujYtoMiSoHf+if2eey+f
	pVszLrLFFf+KFeheAw6Os8zYuc+3kf5kqDV3m+NMJSMd7kS+oILH4yqaLIXgKD/JXJWQAhE4RjNwa
	UvN3C8AA9o7W6BaCSb1/tCA/i9vPenTrO0anODxf/+cdWjQcQ+e/zoX11Kc7LeGj5EdVb7WGKTEOf
	OJrCmRkxxvH8Fveb5knEgTDN7m9is8i99q/9IQQkI9l/bf0THdCiok0e7ZSPRpzFnQmFSpvfrmJIh
	hocJLwxPdxtkiVgV8okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDnzO-004r8U-N1; Sat, 29 Jan 2022 13:42:02 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDnzL-004r73-Pz
 for linux-riscv@lists.infradead.org; Sat, 29 Jan 2022 13:42:01 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-132-kl2_1KnEM5W2_GB7pgWbZw-1; Sat, 29 Jan 2022 13:41:53 +0000
X-MC-Unique: kl2_1KnEM5W2_GB7pgWbZw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sat, 29 Jan 2022 13:41:52 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sat, 29 Jan 2022 13:41:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'michael@michaelkloos.com'" <michael@michaelkloos.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] riscv: Fixed misaligned memory access. Fixed pointer
 comparison.
Thread-Topic: [PATCH v4] riscv: Fixed misaligned memory access. Fixed pointer
 comparison.
Thread-Index: AQHYFLeJevYJAUdx80uZ5JrJ5hRdzqx5/qSg
Date: Sat, 29 Jan 2022 13:41:52 +0000
Message-ID: <7ef35550b4dd44ffabfd7ca1e0ee27fa@AcuMS.aculab.com>
References: <20220129022448.37483-1-michael@michaelkloos.com>
In-Reply-To: <20220129022448.37483-1-michael@michaelkloos.com>
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
X-CRM114-CacheID: sfid-20220129_054200_139067_92F30F06 
X-CRM114-Status: GOOD (  10.03  )
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

From: michael@michaelkloos.com
...
> [v4]
> 
> I could not resist implementing the optimization I mentioned in
> my v3 notes.  I have implemented the roll over of data by cpu
> register in the misaligned fixup copy loops.  Now, only one load
> from memory is required per iteration of the loop.

I nearly commented...

...
> +	/*
> +	 * Fix Misalignment Copy Loop.
> +	 * load_val1 = load_ptr[0];
> +	 * while (store_ptr != store_ptr_end) {
> +	 *   load_val0 = load_val1;
> +	 *   load_val1 = load_ptr[1];
> +	 *   *store_ptr = (load_val0 >> {a6}) | (load_val1 << {a7});
> +	 *   load_ptr++;
> +	 *   store_ptr++;
> +	 * }
> +	 */
> +	REG_L t0, 0x000(a3)
> +	1:
> +	beq   t3, t6, 2f
> +	mv    t1, t0
> +	REG_L t0, SZREG(a3)
> +	srl   t1, t1, a6
> +	sll   t2, t0, a7
> +	or    t1, t1, t2
> +	REG_S t1, 0x000(t3)
> +	addi  a3, a3, SZREG
> +	addi  t3, t3, SZREG
> +	j 1b

No point jumping to a conditional branch that jumps bak
Make this a:
	bne	t3, t6, 1b
and move 1: down one instruction.
(Or is the 'beq' at the top even possible - there is likely to
be an earlier test for zero length copies.)
> +	2:

I also suspect it is worth unrolling the loop once.
You lose the 'mv t1, t0' and one 'addi' for each word transferred.

I think someone mentioned that there is a few clocks delay before
the data from the memory read (REG_L) is actually available.
On in-order cpu this is likely to be a full pipeline stall.
So move the 'addi' up between the 'REG_L' and 'sll' instructions.
(The offset will need to be -SZREG to match.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
