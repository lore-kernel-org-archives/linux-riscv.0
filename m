Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2998C5DF81
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 02:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dIeYY+5yhiOK87zwo4O/AabUMKQxllBr6Ok0JK6dLs=; b=u6FzJaeyvbOq+N
	rQwMJom5QbZEn7DQDlFsDFo4tbf8oi2ToW3rXbpQRITlCPoctXiunAuY+iDxl0sdNoSMKthshOe0Z
	LA9Gzy4Bvfih3ribTIkQ0jPLI3yD97eSdDAs6qyfX7KZPFxW0PcLQfA7WrwAXx/HTdIsa8r7z8hCD
	1BT/XmBLQxa+obb85ZDlYvqityyHPsiFaAcS6urPxdggN640VfDAI6KEPcu+QKc7uO/c73u659NaA
	aQRvDgwF3GCtiUofpc9uHDVEMlqHc4IRDwUtuWTPzyV7TyXAAxGU0d/JTWdUsqcNpmKJwmCdpUp1N
	Percn1O2LdiE+1lJAMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEzv-0000000CSO2-2Z2Z;
	Fri, 21 Aug 2026 02:28:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEzt-0000000CSNw-1MZP
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 02:28:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CBDD60A58;
	Fri, 21 Aug 2026 02:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB3D1F000E9;
	Fri, 21 Aug 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787279323;
	bh=nHm5YYqrRRHZSeZOc2nzTdyIuo/3xHKfy+ea7BVrX2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=l7xZzjKTcpZe4QxoCuQxd9B72fdsGOmRpUWDMQkI6PhUOgw2mtyVJJ53+P3UPmI+b
	 aRZVcOP+6rAnILgTBKJ34/pxsu6nGKjz3kJUYmIr2hIZ0N/mWBNvj0uyxUfXh8TsXE
	 0BKml8B4YOd2EotWZN+MEIM0yskFVlayXwXBEqpIpb+8gAW318HckX/fhTEn+LoIDK
	 kbz3XUD0tBXmzj/jbXbESKMSMu6JBWeHfxN2G4a0AeMuSkLYXUA87Ao//ohevbX+jO
	 KuHW887aTi2/5R8KSA2ZRZWX+ruW0RPml9G14OwB1NlhD8sJICGINRTkAniIkUD8z4
	 VVtyLv6o9UZ0Q==
Date: Thu, 20 Aug 2026 20:28:42 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: bug: Make RV32 use
 GENERIC_BUG_RELATIVE_POINTERS
In-Reply-To: <20260221024255.3552-1-jszhang@kernel.org>
Message-ID: <a34a939f-1a6b-8e24-d7af-39e38d6abfd7@kernel.org>
References: <20260221024255.3552-1-jszhang@kernel.org>
MIME-Version: 1.0
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

On Sat, 21 Feb 2026, Jisheng Zhang wrote:

> x86 did this in commit b0a848f4a47a ("x86/bugs: Make i386 use
> GENERIC_BUG_RELATIVE_POINTERS")
> 
> powerpc did this in commit 1baa1f70ef77 ("powerpc: Allow relative
> pointers in bug table entries")
> 
> Similar as x86 and powerpc does, make RV32 use
> GENERIC_BUG_RELATIVE_POINTERS for "there is only one code path." and
> "less #ifdef is more better".
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
