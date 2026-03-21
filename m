Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9171099B52
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 00:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E7SEMwp7dHVjxZdqVI2CdD+gqD7HjwImtFFQ0ftWW8=; b=nlGspa7luxM6qXJC5nMN9+Y+vR
	pHAJuaWJu/Usk6Tcg256RM/jUy+a8vNMbTk4pxC2yynFhkXenEgDD0nVKPMIbIDVg6IPbA4Zkwbit
	nGGWEEU4xHqzHSd5KyqMopt22XZeVHUodnDbCo88bvIG7eDENzUzbl1LMNv6OZXwPjYH1IvViEFXa
	mEvywTQfL6R4KEaVLOAbXTyFtG1yR13yq7cRwZ9cpWcOMYWUmC5QmxDP9optaskhiyXdsSn/fPt1h
	piR5GCAtMzbjJDWcAYtufeSBXi7s2jQd4cQS8ZBYtPXhA5wpXZe5ApK1iUQtP0FRMvR/RYsGXtFmM
	mwk7qu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3k8g-0000000Dphm-1cVn;
	Sat, 21 Mar 2026 00:24:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3k8d-0000000DphR-3stj
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 00:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45C1D44381;
	Sat, 21 Mar 2026 00:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177B1C4CEF7;
	Sat, 21 Mar 2026 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774052662;
	bh=+ytOqRXt+LbBlJF9wqh9K/wdcZWmrgyt8sOs0F1yBd8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r+ibVv9MRn8M/2/VPmilVKgMfwqRBUig6VNnI+HcUqUMCp68dfEinlw1gpekw3V/S
	 OfHrpvdBkIfPARc6HtCxxOUYcZxSN8aeDrLCARWbNgj6Kg+6doQzUUgQWMGGU4SQhJ
	 NeSW6Wu6P+w73J1kvIRS0+N7vG25Mutsk5HFTmaWqmUafR1J+4qYvep0wKyr2axiaU
	 zQetrXR666po/oWtJC1eSLx53aRunZjevMdjHf6yVYfTYmiaqZsRdyGk9unul4Tmlx
	 /HA07ZXKpQxE/qJ+WFARbsvekJy70rO3gZYVeEDHsoluDouUyH9dj5IMua59CYADJH
	 FHSplLrgBLzgw==
Date: Fri, 20 Mar 2026 18:24:17 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
In-Reply-To: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
Message-ID: <d79b23d2-f8e8-b92e-cad4-5cbdf7690f12@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-940750529-1774052661=:243157"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_172423_986338_DADDC645 
X-CRM114-Status: UNSURE (   9.91  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-940750529-1774052661=:243157
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> EXPECT_EQ() expands to multiple lines, breaking up one-line if
> statements. This issue was not present in the patch on the mailing list
> but was instead introduced by the maintainer when attempting to fix up
> checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> even though checkpatch suggests them to be removed:
> 
> validate_v_ptrace.c:626:17: error: ‘else’ without a previous ‘if’

That's annoying.  Can't the macro body be wrapped in do { ... } while (0); 
instead, rather than adding these permanent checkpatch warnings?


- Paul
--8323329-940750529-1774052661=:243157
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-940750529-1774052661=:243157--

