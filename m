Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FEBC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jan 2022 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8WavzBiyeiSQDVvg43TRTAI+qvtaLrM1Dg2hpve/qg=; b=XG2VVqmLiGPqEt
	EZQZ6U6CFzY90+OQ0OFPht2lSDwL8o1iGXnmhrg1eqG6gZ8BqwZ1YohwY8kZhY8G6NCYiwyf3mG4U
	xXD2FpxEgoS4ng24BBPIc/RqgKoHXhb1GeChnDYqa/UM1eO0srY5YYae4+9G+sfWRNPwuguvKcvH3
	kuw5j7+RW+Y19ciWYGWUsUGAc1a6uzD/IA4YaQ05+Bt3ShP67BW2KcHmszadcqIigvXeuZTrJinEz
	thG1aenwkgVNCZ5UKTfE+QbZ7YVMSHdk5KX/Rzs9Ioic1yatjDa70sRu4BOMBu96+x+sG/x0CpLLT
	6ROGHMLe5Z3VQFMHBgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n95kc-00CUVY-OS; Sun, 16 Jan 2022 13:39:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n95kP-00CUSV-1g
 for linux-riscv@lists.infradead.org; Sun, 16 Jan 2022 13:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642340343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cp5M2AGP5P4N6b6EQKr0vl4nAKthbkR6iiQTidIywuQ=;
 b=icFUoJGhxD4c6wa25EUnAkuyLgmXfE9zWpy1JSjIxoGEaEtfL4XXnsK+/e2PDC2rMaIo3K
 Jk2cZmcsILLmpZbhYYoNilIyUkcnrGuHAxqwrd97iOCGgfOjBtTd6BcjgiNkKC/lnCE8y3
 OQCZefEKi5ea6AsD7E2671SnTTsBOY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-xbtBAwTnOzqAyXi4zY5DnA-1; Sun, 16 Jan 2022 08:39:00 -0500
X-MC-Unique: xbtBAwTnOzqAyXi4zY5DnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF89802924;
 Sun, 16 Jan 2022 13:38:57 +0000 (UTC)
Received: from localhost (ovpn-12-76.pek2.redhat.com [10.72.12.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9F7105C891;
 Sun, 16 Jan 2022 13:38:51 +0000 (UTC)
Date: Sun, 16 Jan 2022 21:38:47 +0800
From: Baoquan He <bhe@redhat.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Message-ID: <20220116133847.GE2388@MiWiFi-R3L-srv>
References: <20211206160514.2000-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206160514.2000-1-jszhang@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_053905_370364_A138CB8B 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Jisheng,

On 12/07/21 at 12:05am, Jisheng Zhang wrote:
> Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
> and increase compile coverage.

I go through this patchset, You mention the benefits it brings are
1) simplity the code;
2) increase compile coverage;

For benefit 1), it mainly removes the dummy function in x86, arm and
arm64, right?

For benefit 2), increasing compile coverage, could you tell more how it
achieves and why it matters? What if people disables CONFIG_KEXEC_CORE in
purpose? Please forgive my poor compiling knowledge.

Thanks
Baoquan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
