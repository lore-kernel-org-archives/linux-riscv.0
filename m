Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97201CF6493
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 16:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0NDD6Ge2MNyQ8h3RCozR9OQtOn2B8qEBxihUAo0MAw=; b=soAkj/1vf38ajT
	yEDT1DokMYLGvH5J76WT196hGlfdi0rinq5NQ1lmbaX0R4m0NIFm69D9fWAYfG3BCtDoMCnUFFRI4
	e/l5X5H7vV0AN8l8ULE+0Ryrtcdl6AWoZTWoU0af58/5zV4TlZfGOsGmyVuXESlSQOZaEBUMYSxub
	2tHV8RTGBlOaMFqaZyWsC76HXdygvEaFbek4zFl3xVxBkXkM6CsjLoz6kHvGvVhPF+sf3fHUzCLjP
	cHziz1L72KZtEYy5T9Ok3Wk3jrOMC5U3IMFPZbqs3TICrsFLG1oi6HsXUIuzSN4F+bWi9wCFI2ttD
	8pmQFfmNfrBjT8jOxGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suaRr-0000000DLar-25u5;
	Sat, 28 Sep 2024 16:37:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suaRo-0000000DLZk-2NfR
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 16:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727541450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=h4/gbFBDrb64NLayDMO32ddhI+WMxX/5zmMU1f6Mg4E=;
	b=HPA1x/JcwpAsrvpqazhBJu0P3IxsmncCGL16SR+RVLoPcB/Sh/CDN2s4IXwhFt1lL4qPQ8
	/6Z0+xh1zNiefi9AfkQE/AVR/GDvvhb4PMd0dBYVnwuM/iQXtrGOgwa+2N2bHg0p/QJ+YZ
	MNeWZyWb3lmz7kZ/joD2vRryHNFu4/8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-1ApzooA8MguH4gD5oM1cEw-1; Sat,
 28 Sep 2024 12:35:52 -0400
X-MC-Unique: 1ApzooA8MguH4gD5oM1cEw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E30718F4984;
	Sat, 28 Sep 2024 16:35:51 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.151])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 787201944B21;
	Sat, 28 Sep 2024 16:35:49 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: linux-riscv@lists.infradead.org
Cc: Jeff Law <jeffreyalaw@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>
Subject: Page sizes supported by RISC-V
Date: Sat, 28 Sep 2024 18:35:46 +0200
Message-ID: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_093732_700463_81F6EE17 
X-CRM114-Status: UNSURE (   7.03  )
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

I'm working on adding a <sys/pagesize.h> header to glibc, so that
programmers can easily determine the range of possible page sizes for a
particular target, for things like pointer tagging and mapped file
alignment requirements.

Linux currently supports 4 KiB pages only.  I couldn't find anything in
the RISC-V specifications that mandates a specific page size, but of
course the way ELF LOAD segments are constructed necessarily imposes a
maximum page size constraint for particular executables.  Today, the
toolchain assumes the maximum supported page size is 4 KiB, and this is
also reflected in arch/riscv/Kconfig in the Linux sources (as far as I
can read Kconfig).

I found a previous proposal for kernel support of 64 KiB pages:

  [RFC PATCH V1 00/11] riscv: Introduce 64K base page
  <https://lore.kernel.org/linux-riscv/20231123065708.91345-1-luxu.kernel@bytedance.com/>

Is this something we should consider today?

I'm leaning towards teaching glibc that the RISC-V page size is always
4 KiB because given the current toolchain defaults, it's necessary
to rebuild the world anyway if supported page sizes ever change.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
