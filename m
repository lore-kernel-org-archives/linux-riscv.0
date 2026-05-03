Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CF9CD3424
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjrihsVddJbEFCRDDMkUBOsiwZM5z0+NnmJQOQvoKpM=; b=3HudcxtrK8YvlirxQ2fNVoA3Z3
	hbC3fG6uhPDMlp6+6k81aQ3OfSNK1ZwzK8UmnDfFRWR0pIl8pxyAfApR345Ikz4ZCf3DX8DNjM4j8
	AJi8v4QOP4lOyrNpa64e3HbBcmTi1uH4OMgl3F1ygCVEHNA6bj2tyJ9pD9sHZWVpBcciN6kVBnmNB
	wMR+eq8BFvi9ECDNY9S5PpHOUkouBtvUlVYeqmt1ftYyjDMNVANZlNq/OU97cr1K0VbBNHQy/FNIc
	b/DCpFuFX8F/SuWyWV3eINpPLh4L3k6o956rDUbPdqCEsFXDUA8E9wrXOT9TiREYcpVMPcT5vsGad
	9lAGycWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJVtk-0000000Axp1-2UDj;
	Sun, 03 May 2026 12:26:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJVtj-0000000Axol-39Eq
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 12:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFF856014B;
	Sun,  3 May 2026 12:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5908BC2BCB8;
	Sun,  3 May 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811170;
	bh=wIKZJm+44gbevXVFKTtgRVSh6IKiCNKWi89emtsttCM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NX8VB4/qC3hcyaprRzJbBB8X9QJWmublJVTOGcxgzp33JEbTGhzkql/0XvsAFD9OY
	 nnSs+epqaS5u1YfLZ+2pR5ZIA5miSZ8VpP3os67SIqx+7AiU7JBn5pYAyvMTUNC8gG
	 NcQFUubOy+LSbE8DlouYET+lY1r8MKpDh20WGH6QniJ4zpWsW9sKUKorpqMldFcIX5
	 05g/KnBk/8/a4Wddz4xeBPKiPc5p5XNDiXT54212XGwhEorT24ZNJcVRMEiFgt5Xqm
	 zzq4Zel67W7Fhk90Xhq13FbaiSqFDlcWRFR7ZeMthTPp5YXbmbPesESjdcNV1FfSk4
	 3zwLB4igEB5xw==
Message-ID: <928b68db-4cf4-454c-aa88-3104e689a642@kernel.org>
Date: Sun, 3 May 2026 22:26:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cpuinfo: Fix NULL dereference and inconsistent
 error code
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260502161802.515547-1-mohamedaymanworkspace@gmail.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260502161802.515547-1-mohamedaymanworkspace@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/5/2026 02:17, Mohamed Ayman wrote:
> Fix a potential NULL pointer dereference in c_show() by ensuring
> the device tree node returned by of_get_cpu_node() is checked before use.

Where is the NULL pointer deref?

of_property_read_string() can cope with a NULL np, it just returns an error.

of_node_put() also handles a NULL np.

> Also replace a non-standard return value (-1) in
> riscv_of_parent_hartid() with -ENODEV to follow Linux kernel
> conventions for "not found" error returns.

That should be a separate patch. It does look like a good change. At 
least some of the callers of riscv_of_parent_hartid() pass the return 
value up to their callers, so -1 could be misinterpreted somewhere as EPERM.

cheers


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
