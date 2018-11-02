Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B560BC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 02:19:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F54220657
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 02:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtxS8n36";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jwwRHiUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F54220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rrOltgCDT/ezwqtcky+WcFSplyINscsZW8iVjsLR8V8=; b=LtxS8n36JA+Zwx
	gwu15Pmd0hEeE/jYZPWcQkhEfoJt38ZuwwtCIJ4VPALIQVte55yENqq8aJZvy+sFrblxuCKB9Qv7Z
	y+a4QNuRTmWtUinc+3l6q/+QdVlis93G4Pt/YHB41merkqYlZKx78SdnJ9UB/9fBwlhWRPWXsjYST
	4gyrxD2Z8n7k7DO03orS1MhuN2TD0ip6CPlA/cWHpzMmWbF16erqQEiWRY0yeFsiF/MaBLb/h5dvE
	C32/XPZs3EhRMJz4aUauubHii61HQ0y8Wq1/Z/KvAb8bqxpWRKLRNi2Oc7ms4nuGad5Wzf4NUHG7d
	nwn6LPrr1OlRqlQwzIBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIP3X-0000LE-K8; Fri, 02 Nov 2018 02:19:27 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIP3T-0000KH-Bf
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 02:19:25 +0000
Received: by mail-qk1-x742.google.com with SMTP id o125so854953qkf.3
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 19:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=og2f4Mjnq+O5R9oN9TwRI4yCSScumQBGymtGP23YD1M=;
 b=jwwRHiUDCFJyS1J+uGUzMZjMMmvax2KIt1Frrc6BNUZ1D5p36NPZ9M8Kjcj+4ZFGtk
 DWrZK2+2UitfGpEkS6/+oK9RW5P1PyASYkrIZZ9DSOM81cGHoOFtFE7aRkjDR5O2ISPZ
 +hoMQ9C+iwHYLuc8hQ7td+tX9LPQGAfTmNGF9uQsLf3rUAZ7l3PoTM1Nlr5WnPW2E9BK
 4v/FovHxJ7/smjkUjYmTnPf6lAz72tJBPKRFAGI6J2wHhtbOjsl8zkCOpnTA4bFihAWn
 PVpBS+pnVcgiQ5oa7xW+ou0d2enc5eYSZT9PkWUKSAbInKp8XiPxQAUn9Yvfb3m5+OkA
 Gdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=og2f4Mjnq+O5R9oN9TwRI4yCSScumQBGymtGP23YD1M=;
 b=rucyzI3oVg0Z6h4WNei5T9OXfxEehYcj5yM6hNbbLZ8xSv2h+WFlwGd0dP2je+d+Or
 4Z1s3OZC98XAzvLGuJEhC0mPaDJVuIAgsRTE0F6dYTtIEs5SW4UXfx0vQiLe0TEx6hpX
 UbTHuggZwFVpd/WtWamGKhGY1uKC9RClKw3TXjvnBZqoDzBgPKtbziFas07rPgj5Dz3z
 +PTvzWzAuHGJ3I7jcjhg8B8OpYrnICbfsg8VbTJ8iQDuM4Bs2m/5SR16R9qWiLbgiLcO
 BXli6MxbzqbeTCPygqOAj2pk0g7R3iTDV6MIc7H4x7zcFEnPVu/082SVjUrN9oYv2DXC
 igwg==
X-Gm-Message-State: AGRZ1gLcZaqhjENPt45HPmpDmhVYYmuCmFuC1tnV61PToqmwgr7tycGS
 lNPmMVA7quNFABmZWaxW99i6ef3Sny0=
X-Google-Smtp-Source: AJdET5cYNQfhu6O+UDWcXkanAbxASflT4uJv81zRTp0sc3JAjRaPIkG+FEXE4gzB/V78f6tkd/Hl7Q==
X-Received: by 2002:aed:34a6:: with SMTP id
 x35-v6mr8469384qtd.93.1541125151196; 
 Thu, 01 Nov 2018 19:19:11 -0700 (PDT)
Received: from localhost ([199.255.44.5])
 by smtp.gmail.com with ESMTPSA id 5-v6sm23299527qtz.8.2018.11.01.19.19.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 19:19:09 -0700 (PDT)
Date: Thu, 01 Nov 2018 19:19:09 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 19:18:28 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 3
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-cb2ea62c-8d08-467b-bea5-657b42a5acbf@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_191923_411153_81AF5398 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102021909.opudwVFBOWAJOQ0xfUDydik8wzTOi-bWfVad_ipaMw8@z>

The following changes since commit baa888d25ea64d0c59344d474284ca99cfdd449a:

  Merge branch 'next-keys2' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security (2018-11-01 15:23:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw3

for you to fetch changes up to ba1f0d95576902c10930d3467e638bac38f942f1:

  RISC-V: refresh defconfig (2018-11-01 17:04:07 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 3

Sorry for the last minute patches, but it was suggested we try to push
this in before rc1 to make it easier for people to keep their branch
rebases sane.  Since this is just a single defconfig update that is
intended to have no functional change I thought it would be worth
breaking my own PR rules.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: refresh defconfig

 arch/riscv/configs/defconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
