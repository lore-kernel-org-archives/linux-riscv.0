Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F08FF459F6
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfVZQUOQ1SFGV8a6nvpmSmCHB5LM93Wn+VXt1Hj77KM=; b=0CpAnG1wW8J8UV
	PZAYmhWQsBxfbxvZMvw7w8mHl9lQ2QZq7/Ni6eKYyQzT4FGXsYhwbMKgRaAPXxNSk7PRX7QRAZLKt
	bL9tPjvLiZ4XazR/e5kFEa3WxnQfNQDcBrw61ZzhO/KB3jv1Ld51jnCJzvE9lzm8y8SxSVDvtRUbA
	MLYXpL8OkyJYa6znoAX6lSWdu2t6bOdkZiJDIffO4WJzgIlAcV6fruHfrq6HGkcvveoRAfWbpRGnp
	GAAcOJReJ+B2kUMIQoKY6NTMJ2AFrBmrw3hPao2XXmwnhxzmRaLOrwn7XRvTuzFQF1QyJ969q6U6u
	++Y1KeQ2UkzmomGIE23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDqF-0000000CTEe-11q4;
	Fri, 10 Apr 2026 15:32:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDqD-0000000CTEO-2XWi
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Apr 2026 15:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=; b=eCQfkIEBOFHvCn4Tcn1Zyw16nS
	zuRCctOEiFZvSt3dJw7rtH9hnm9IUCT8OXlaIKoYjEJwUN27D9jMBcoPT+FPp5epMnEzK0A0HJo4F
	6W73ItnXMQqvF2CtNOWcfx3FJAFLBatDRuXQqDdNLDWEqW07Dj+mqh9+FzYEUkhnTzzGiAN9BnQgX
	0P+ivJGmYX08Ku+o5zlDxAivjnh6VdSdD1r0K405rNJHtvMXhWRosIqyUxaQHoSJ8/2AzqTGT7RQZ
	6ywYoWlnAm0WwmEuYh0mSXxS3nUk2SaKeu1kNEEJ0C9ip3BJwDtJCB5NNkIIueZxgtwPcl80atqsd
	kD7AmjDA==;
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDq9-0000000Dmb6-37hQ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 15:32:16 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12c1a170a50so2014876c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 08:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=GGE9yUNnQrGWSzVKZ0qpBtHsGXdbbaGrMVxZZ3iJMwp82TLZEEzfdytFVHEWi5a4Z9
         FVLd6+YYmObAk7zkF9GKXRX65+gx1ZEVaUi74qnu80yMgXF+IPkAWvx2kIU7EZEZlJG3
         zIWoL7490w/ROKC3InOf6mCllDCW6ZqEw1AkBL8zaIB1CEGvsr/HIaKbN9WSsAk2tcpW
         z5vh4jExNQ2jeKaL9aLGp9CrebPT9Aqy0FhZP5GhJVlxolQlHl+CKQ8Oww+YYGw/jwDO
         58yq8bNN2aAQkk75sZxcngqTj3WeLXiag3FtsQtqKdd+lBtUfbCOwF+/EQCwKNb5+eB8
         NwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=nSNCda1TJYJ5FKAPT7fe0M0KfSPU1a2DwoxJCJbZGfU=;
        b=aQJkjvuyDytPRFX1G0wtqQAQEdxLz3a7VM4Ln/PTO8aev3+MkrdY4l3d4RfB83+KNU
         wXsA1ULx6A5kX+i60Ucc+UNxpIsfBd32W5fILl8bk3ODa3SYRj9v3AvbJ4RnVktcnFmS
         7vxLqz40eLesRfvRea+b3mHMZ2co70QX8ludXudLcHVWkNPej7yojKblBXTxGhSlueMu
         lAbh03mw1vF38v2tx5HThAvaEhKesveZ3fw+BK+L+1A0OWiItX+u/xozYnswbtcg7K8G
         AKRXFIEH4i8H/XljcqJOsS9lLowCGNEbbYelTKIhTMxoERQoxSMaQa1Y7jMfwOxsQPDm
         VkyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=jKHDXuk8cwOaTKJEoMvEu8qvHBPM5surl9gUdqQgD/TmzJvCc08heD2BELBn1ujsR3
         980y7aAYSlbCW3DsJn4BG3xugV4Rm5Ow96tf/YV+p4sZlYedzjDWwmEzZd/VTes1Akcj
         k6GG+EprI1CiXUjLr5b2KiyNnJtEA5ijNWPMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=OPsJXOnpMotuL2t/NCLXVowgdngHbZBn8rJzZc+2+1Sl37BgWKW7Vh8dQNL8U6IJ9d
         ojr5Qv2DC04MvzkAaeWAxuuzSAIocdSxg8o+2sp8Hz/eRMnrdkJwDdKjp2GqDvVIzdyP
         gFbIE4fFySu8j2EonZXHvqLRSM6V4N+MFB0QxBoXBrjHQWgddyYMjrnB2nm0VAe+S7+g
         Cs2xknnAx7JfKmze2EmH0hXK2t5pV7dQccqaR5dPZNcFD7Pf5HiBR5SXuP8RZBmLYyrI
         X2NPPLcGi+nq5HAxx7m7RqgoFnZ31jue8I/K0wVokGgSiFajZHmNDsRPczhXPlcA4kY8
         holg==
X-Forwarded-Encrypted: i=1; AJvYcCW/TO/Mi/Hltn5hcK0pZSdV00VZMqu/t3bbFLEAJRc/dYdsNWP7tbRRl4AC2hqd2UAiYU+ymS8hoMBxNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Vb98EUqoLeQ2Le9BtsmgUaSpxtwYpmi79l2k45TjcOiTP4xi
	HkeMP6f+P9GT+qTFjcV8YpsmAHgDTxHhdpPZKgxPGhnhdsVmuNkPQC+zExZnM/bKyr2r+d2ZUzC
	ehbxvp4q0P8ySfoxz2lB/CLbmJAptK//VYlvt2wVwHCN/+ldnvChHvAo=
X-Gm-Gg: AeBDiesMA0+WQcAHmiGtkePKMZ2C61mA/JQ9jnlpMX57MRoDfaN84xXWG8RASpwKtqU
	DaAgjTML7hr7G/3rpx9YqYLIidYLZxR4iPUMW6YW2W2athQDdilwT5C3FEpusa8beTeBsslXLcm
	EbVeE2W6EQqfBDzeEQxzIvHkc9r7s+aniv23H2dtAADdV0ikuj6rUmAFPwR1MGHSbRswfkwTdfq
	GWAyleD8SgNX0VzbOuexC+ZRZ+sKB2SHXqM1QquaWDWcCRB1i6Dy47T+402JiDY32iTNFhvC5Ne
	X9pm
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_163214_513905_E9130ED4 
X-CRM114-Status: UNSURE (   8.47  )
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

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
