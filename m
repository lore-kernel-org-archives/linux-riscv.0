Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BE606A323
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SAJb4ZCq;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5b68OsS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J+TNBPI756Y57T9OowtAIHw+fdx9PYf84ril06LXXi0=; b=SAJb4ZCqfk07fEGlv3gnrMGvlT
	uZISxfuU113A6MDnFZOOMkkjIR5bUi+iLkxfm/o8Mvv3lor3G/gbUK0Tc/We1tLHTgSQZR+iM0wvJ
	W7vSUUe2qh92pPQfHkiDXjA1dG7koIPIvdZ2+sHdBMVqAv3Phk8OrmpmqCdbzTrLVY+ClKSFmPLdh
	J1B/m2OuHkFoZxGbXN37AnnR4EMc4TNY3FIuXF9cjMcNsLg+JqkIAkkGZnqPAxZtgFUC6R0jHT9Sy
	4NhpeXUiNSrBqahUP68bemhJSZ78vnaY2ZhbyttGNWGsPuN5pJpgr+DC4S4ias71CgPEjrkZvQpgl
	Rr/WYuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNGw-00000000Unb-29Vs;
	Mon, 09 Nov 2026 11:10:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNGs-00000000Umn-3oKr
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 11:10:45 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DBCA83F2C9
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794222638;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l5b68OsSoga1Tc/V2WxA4LnSS//BWiPJpGdA0cGXiFcTBlGnvBHORXTaGLL7XMa4G
	 e+I8VXkaAzbWOnSSroPen36IXqwnm+TL0zSWTo3clnKWBnNIf2IkPjc85sxZKprPM+
	 iXWqANQ6gSUfM7u0VcE0pyu8zt6wNtsQgahvZGl0gr6suip1A+Fbndn+WxWEEWYjQw
	 omWLte5rceEpgUqp42iFM4RbuNdhFrKH4dJyqKJsFLyJLYCwZRHttHHim3azjBepEx
	 F9yhfqUw4hNgVLnlD2lBM3YNh5ok0UdnhoNNh6b7IqIGxi6jwrG4bfxX9p0WUCeVgp
	 ePZqS5u6oPrQaG06VdHWR+dfL5TRnpEK44Z6PFkFgqIyRLrNiimtvVRm3nc5n4ZjvD
	 xb2taZU+25gYSxzTrGkVdYZz9TqYWQBSFIqU+diuZDgbJHUjo2RVtBOSlwaJfomNSu
	 kp/GW6Fu6nFcxlBpRJxoEGAImYW/05j1DK/wSD0drL8wuFasa/w37cct0MJVNatX96
	 LxZXyhB0EHVup6u0ykAfTqIxSbSPNszseSddR8VjdmRZCs+hFZZ/hHTLUihHqqJVU4
	 HmDkjmq2dula8Gg/DGsjhtcIexSsJ757M1KfYP9IP9CqeZMHnT23dYIG4FNdX1asrc
	 hX/zRA2F82eS1qM017KND09U=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25edb54d22so97959866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 03:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222638; cv=none;
        d=google.com; s=arc-20260327;
        b=OYS3Igf4nO6OILOMzawg/WNFEZiJmcbpKXgPCAHwjLMS/SQbjBBRR8yEzHPrDXKWJH
         z5pG4KU3v7V73GK2Rt5JNaXPFfzDIeBtdYkeSHLij7KsJ4GkNiKP5YPC6L50Ya0AA/K/
         5S0D0zlWX4ktLhyePZAa8KBRrL+9AXLKFnBhBSJ+3j/34WgSwV3sy49KOkwyyFJZEvqU
         GpwVOtb6yov1/U2UAaJ2tcneTKcud9EOMr6N5nSHX4b6k/wtGDAUyBN4P/4Pv1a1aPWV
         16+yWY7wB9C8HIGwyKkfEySq7JGX4qm421W2EpyGw16Bf3+jHYGX+JKAEPOt1DQk/r/F
         S29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        fh=+ABvwXG7CevVnaXmTgAY3UEhgcvJ7Kv3Mv+yYCIBLgs=;
        b=WmC3n3lgQzeRAARusladflZeYrV7wtJdIc7gC87Q3sakA228Zzy7FZ7iUNv5jKmraa
         JyxhdbJLeo2Lb1IJGU3fi3Wz3uVcB8h7OQZPbvFNo1yZlyO7mJbUJJHje0w8G45L+tLr
         v36ZzR+6OlZnkGSOOXTCS4QaJcj7AUQ2urAAAsNjfL4bJ9eYjqDtcnWyeJc0xYqOnDzh
         TwJd5IXGndrAO2N8oVUN/m1RIBtn89+YItffZukB8JaMoAHITcqpEwhf+fliiQW5PVD6
         mp/rnB1tKL0xEKAkVQzIPY2hOYUQpksYz/v34WqZulxzT7Ilp01e8alBbk2o+nCgoydb
         /vkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222638; x=1794827438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        b=vyvOFEUOLQkSkhAKkDFFw6DxJiUz5H6GpUADbLaL/uxfbXhZJhgQCsUnuOrPDY4egm
         QKHqEiw+TarYlTq1D+ZzRjlWB92g8FA/CbmaeYJ4w0zb80iDqf1sFr8W66HyPx/Q4mAp
         /zNEE4fsDm8Z9vhv7g/vuP5SRf1ABWwzjSphTTsiC3VamNAwoy3peJPBgprZyRg67ev3
         sxjyOq+05jRHTObDzhTwG7i3kVJuVF8lZ6Fwa1z0MOV9qnE6mIGrnEj7Nu+jvENaQu72
         8MTNWZEYRAn3/2wzbZGRwzWW3GQ4BCr+pqHpYj6m9R9zSyc8HiKbmfV2rTVpph104urX
         Tlyg==
X-Forwarded-Encrypted: i=1; AL+hErEAzDjOUsPcAqZolzbHYPQqrROpk7DDWO3G26BxkZCxU2wd+EJUUgidoh5iYZoXvzyYqt17pEXp4iONaA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+JiMjDtW75+KxYFi4TbKIpeyZTK3hTbb+y9ogkZQ5bY5ba/Wt/
	yCKCKuN/Y+4walWB9gBKBgfu+DRskKcwFRRA2pwVW3mLki2JzGgNtmARnoC4EDOM3ob8VOAlRds
	wrE68LXTWl/VyOTQ/NCyHWQhgN8nNPklfVG9rrvO2nkgaNaUZsTJgLrGX/QGfMIYPBk+jfsztVf
	pa94nvJfv+TS01nAVg0wffXA5rq8jeLY70c2FXMlqFV8A9oNGmnsw1osSW3O/e
X-Gm-Gg: AYBFou1PhdYD8uNI2kaV8vvLJzukZMjaQu3LPUXtaqdBJ0FuAXt9xV2jxRGjxWRd5qq
	foIqYdLgWgN17co/xhG9rIwYDULXTHLtjLE57HZAZdXMLASEdrRa/AxknLIfNAC1jvPsmrhsV/9
	C8owcCeH5nS9XBSWk1p6oeXL1vzW0LegTFGj0TVFxYNheptfnVek9JGtw=
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c4d6daf39ccmr262301966b.30.1794222638447;
        Mon, 09 Nov 2026 03:10:38 -0800 (PST)
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c4d6daf39ccmr262300066b.30.1794222638061; Mon, 09 Nov 2026
 03:10:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com> <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
In-Reply-To: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 9 Nov 2026 12:10:10 +0100
X-Gm-Features: AclHuK966um7PTpChOfRAdNHmU0xq_O_8ADd9fyC1m0kLv_yr1nWEQyElP2Eazg
Message-ID: <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_031043_344285_7B956EFF 
X-CRM114-Status: GOOD (  27.87  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 04:39, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
> On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > > I just had a talk with Dong from Spacemit. He tells me the
> > > BS01DCMA is the name of a module similar to the com260, only it has
> > > a different form factor and each module consists of 2 separate K3
> > > nodes. Similar to how the com260 module can be used in a small
> > > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > > (spacemit,k3-com260-tq), I'd expect to see a
> > > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > > module itself, and then an
> > > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > > describes the extra peripherals that can be accessed when the module
> > > is plugged into the server.
> > >
> > > [...]
> >
> > Ah, it's called the Cluster Server RV2768of much
> > https://spacemit.com/community/development-kit/cluster-server-rv2768
>
> Hi Emil,
>
> I've checked with our hardware team. BS01DCMA is indeed a module, so
> the "board" wording in this series is wrong and I'll fix it in the next
> version.
>
> I'd still like to keep a single k3-bs01dcma.dts though. The module is
> only used in the RV2768, and that carrier is essentially just cabling
> to PCIe network cards. Those are found by enumeration and there's
> nothing else on it for the K3 to control, so a
> k3-bs01dcma-rv2768.dts would have nothing to describe.
>
> Does that work for you?

Honestly I'd still rather have the k3-bs01dcma-rv2768.dts. It's hard
to predict the future and I think having the extra file is a very
small price to pay compared to the confusion of having
'spacemit,k3-bs01dcma' describe the RV2768 server and then something
else to describe the module, that's actually called just BS01DCMA if
someone ever makes a different carrier for the module. Also it makes
the physical reality of the RV2768 being a server of multiple BS01DCMA
modules more obvious from just reading the device trees.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
