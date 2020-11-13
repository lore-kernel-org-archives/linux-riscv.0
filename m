Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB55C388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 12:42:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41EF2078D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 12:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QwlDHx/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41EF2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NNoJ7t9phN4mbvl+nYQG4MTv4NGEA3RckR9PV1RX3Ac=; b=QwlDHx/lkTjpbagExZ2W4BB5C
	sdnvfgfWSkZfkCQvMeEKI7u9sHHgvC1J/9gy2zjOJ4mtGkxmIURZP6yQkBBpsad7CctM5cstBPF0j
	+Iwr6/rgyPpnqj6kQutIopceIBCeNUGgiCVpZN4x6rb+GRtzEZN//y/cO7d43zmNEfLa2kVVEen3K
	6yuxR40i5scyTUQpgnQZrb4wi2BEQfTL6Yat4qSI5c6Duj8zecYf91XzR7cb+RiFoLOf2Y9b/+dJd
	meNAMw0TRV6ghGDu9tKYdyrGjoTsK2oRN3UElu2NDo+V0X2JKhzjFOp993F37fTM/Ed1optIjbpmc
	XJyWeVF9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYPC-0003IE-BI; Fri, 13 Nov 2020 12:42:18 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYP5-0003DC-WE
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 12:42:13 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kdYOy-0055Pi-RC; Fri, 13 Nov 2020 12:42:04 +0000
Date: Fri, 13 Nov 2020 12:42:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: csum_partial() on different archs (selftest/bpf)
Message-ID: <20201113124204.GI3576660@ZenIV.linux.org.uk>
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_074212_080817_1CC359FB 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 Anders Roxell <anders.roxell@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Tom Herbert <tom@herbertland.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 11:36:08AM +0100, Bj=F6rn T=F6pel wrote:
> I was running the selftest/bpf on riscv, and had a closer look at one
> of the failing cases:
> =

>   #14/p valid read map access into a read-only array 2 FAIL retval
> 65507 !=3D -29 (run 1/1)
> =

> The test does a csum_partial() call via a BPF helper. riscv uses the
> generic implementation. arm64 uses the generic csum_partial() and fail
> in the same way [1]. arm (32-bit) has a arch specfic implementation,
> and fail in another way (FAIL retval 131042 !=3D -29) [2].
> =

> I mimicked the test case in a userland program, comparing the generic
> csum_partial() to the x86 implementation [3], and the generic and x86
> implementation does yield a different result.
> =

> x86     :    -29 : 0xffffffe3
> generic :  65507 : 0x0000ffe3
> arm     : 131042 : 0x0001ffe2
> =

> Who is correct? :-) It would be nice to get rid of this failed case...

Don't expose unfolded csums to *anything* that might care about the
specific bit pattern.   All you are guaranteed is the value mod 0xffff.
Full 32bit value is not just arch-specific - it can change from moving
the area you are giving it by two bytes.  Yes, really.

It's *NOT* suitable for passig to userland.  Or for sending over the
wire.  Or for storing in filesystem metadata (as reiserfs xattrs have
done).

__wsum is purely internal thing; BPF has no business sticking its
fingers there, let alone exposing it as part of any kind of stable ABI.  =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
