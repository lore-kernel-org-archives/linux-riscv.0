Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6076C433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 06:29:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5E420936
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 06:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vi8XE1Fr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5E420936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yV22wJFWTA6Qr+qHWphpkR2KopkNiQwRI+Gjj/0CpSU=; b=Vi8XE1FruAcehcKbjEErSH9b7a
	sLS/D7usJvZHrO4UUmUMSSodRWlo+X7RuHWQBXG6dPGkkPH8cKE4lq3u6PbK9vJ4mIse7AzJwzNNV
	iaNav8KqsSpPWfbjsGjwTWEINKt2VEobOTn7A7urMDxHl5VbAXXZ7RU1vY0Kly+CczHyNT5dHP0Md
	nX39X4dRaYZF3rRgfND2MC6lpkTaIzGZD+AABhW8pB+j3o98sxy9tlknsT8dH+BYR7IZX2dQUa0M8
	Jqx7P31i/wyyy+GZikCoW/X0oTcpjGbItLG8y00dqaWD/6QmAJKxJt6GsrDIWDUEv5c30zmwaqTTc
	TSGxVMFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFtbn-000649-Vc; Wed, 09 Sep 2020 06:29:32 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFtbl-00063I-5a
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 06:29:30 +0000
Received: by mail-ej1-f47.google.com with SMTP id z23so1808525ejr.13
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 23:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=so+TjNN/K4Wm4BC+QFW0U44II/XaDLDY9k3oDUXiRNU=;
 b=I7zWEn3v22X5do16mJQkySR5/mFYqnfLHyWNy+GevceqjP7nSv6eSjPjbgL/De0K0W
 OepaA7KeIeT3StNVrWAqWavv2tyAKjNfgnMn4vTDN4GzdbHmafwrYSjxegA/khrJMPI/
 Vr2YLIuHm/5Kq0A1uUxSxPGsCgwJlswRYSPHbp4r4kY90yQK/Vk74ln0wNsQKh82zLP2
 zGh6fkfjcfXfUd6OVbwiEMx7F4ItlEOhhdDOX2Ch+LviCJU4f9bAl0VTyZMcaEYW+3H3
 u8FGDMgb8uE/2UFXqKObbGVv1/HR2bzKyF0rncUvEqyDVEmXF3A0Y2yJGsyuJdn4lpeQ
 2+Eg==
X-Gm-Message-State: AOAM530ytv7pIBMQ9uuf/E/XRX5GTgmgn6Cf/q9IofRf4dYTYgo+wY8l
 8nfOjK/WGsgf5tf1HxcDLj6Ki4xBintgXF4jXdXMbZqj0fyauA==
X-Google-Smtp-Source: ABdhPJza0NCiz7BJJwCSyH/Y6PN16wG2a+vIPq5tgEc8cSWGMK0lriTvtNon36i8XvuyvSKc2Zn18XBfiQ0OR+eJrdA=
X-Received: by 2002:a17:906:868c:: with SMTP id
 g12mr2027927ejx.230.1599632965831; 
 Tue, 08 Sep 2020 23:29:25 -0700 (PDT)
MIME-Version: 1.0
From: Pekka Enberg <penberg@kernel.org>
Date: Wed, 9 Sep 2020 09:29:10 +0300
Message-ID: <CAOJsxLFWbV6FoEgHPHVN3PksrP5mXWbbFUuzH8YEDd1VdvEp7g@mail.gmail.com>
Subject: vmalloc faulting on RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_022929_258824_FECBD6E0 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Joerg Roedel <jroedel@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello!

Why does RISC-V need vmalloc faulting in do_page_fault()? If I
understand correctly, some architectures implement it because process
page tables can get out of sync with "init_mm.pgd". How does that
happen on RISC-V?

I am asking because Joerg Roedel recently switched the x86
architecture to a different approach because apparently vmalloc
faulting is error-prone:

commit 7f0a002b5a21302d9f4b29ba83c96cd433ff3769
Author: Joerg Roedel <jroedel@suse.de>
Date:   Mon Jun 1 21:52:40 2020 -0700

    x86/mm: remove vmalloc faulting

    Remove fault handling on vmalloc areas, as the vmalloc code now takes
    care of synchronizing changes to all page-tables in the system.

If RISC-V has the issue of page tables getting out of sync, I think we
should switch to this approach too.

Regards,

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
