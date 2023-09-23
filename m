Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB5CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGe9u6tHhvcQgFrSHoYaohxVNm7JG7Vb7WY0B9yuEgM=; b=jc6AqdJEHqukqp
	wGCKt/uvcbpM0kOjVhPoRZd4mNnjGqEEUHJNmgG5IXGcDkkBcZYCwLndRy3zKP6jJetaE02PrSyBS
	jxmQsSmWgc1SHD5Qcb8SXBw8uy5leGCMd70aaa5+Ib152fxDDNswOZ7ZPAOQht9yP+77uNVfya1hz
	jgKwQmb+Ve6140MePhXTrHo7u15U1nsNKfTAqbxJ801/DB9HU9S2jdIejY4dDUhye50SU3OvDEKR0
	cp7m+5nO1IM4s50Zuq1nMbOXuJ0i13unoiRKUa7/7i5/QgV0sOnC1QrQekMDvVyaV+CJrDRhFHKSu
	4DSL5GwRvG+dSNIQoR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Zu-00BD5R-20;
	Sat, 23 Sep 2023 16:33:58 +0000
Received: from xry111.site ([2001:470:683e::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Zr-00BD4P-0p
	for linux-riscv@lists.infradead.org;
	Sat, 23 Sep 2023 16:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1695486828;
	bh=tW1UN5jHVwKFIWyT0vw1qK7pjftSvUIwdEui3rNfxLQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MTpBgURNlVSGSVUcFrKYPfa1WwaTtCLUyPldQ1iVEPl3Q0Xt/LCoNQLvX20/wUGKc
	 /87cdEmwPCKrPNpMdL3dAsroiPW9JlSCuRq2gJ+j/rz9MPwqhPUDXhmluoN5Sfp9xi
	 W0DEosDlGsa2C8dU/Yb3uSxobuiykb35ImF6dgVM=
Received: from [127.0.0.1] (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D5590659AC;
	Sat, 23 Sep 2023 12:33:43 -0400 (EDT)
Message-ID: <1caa7866e2a557d2da05adee29cb8ab8fe86ea25.camel@xry111.site>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
From: Xi Ruoyao <xry111@xry111.site>
To: Drew Fustini <dfustini@baylibre.com>
Date: Sun, 24 Sep 2023 00:33:41 +0800
In-Reply-To: <ZQ2/eUKbW3wK7kHp@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
	 <c1a4a7ab5c68c00dd8b3bb249c0371dbb8bcb929.camel@xry111.site>
	 <ZQ2/eUKbW3wK7kHp@x1>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_093355_571831_CE2EC5FB 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2023-09-22 at 09:23 -0700, Drew Fustini wrote:
> > I've tested this branch and successfully booted a rootfs on Lichee Pi 4A
> > eMMC with rootdelay=10.
> > 
> > Curiously is there some way to make it work without rootdelay?
> 
> Thank you for testing.
> 
> This is the kernel command line that I am using on both the lpi4 and
> the ahead:
> 
> root=/dev/mmcblk0p3 ro rootfstype=ext4 rootwait console=ttyS0,115200
> 
> I seem to recall that before I used rootwait that there would be a VFS
> oops because mmcblk0p3 didn't exist yet.
> 
> Have you tried rootwait instead of the 10 second delay?

I just tried rootwait several times and it works for me.

(When I tried it yesterday it did not work initially, so I switched to
rootdelay.  I guess I'd mistyped something in the initial attempt).

-- 
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
