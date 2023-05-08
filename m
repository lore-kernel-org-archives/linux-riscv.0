Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531D4C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lMcOEFnjVWAL45Ud22MRF+LpAdhBvZajVHGN0e5QlcM=; b=f2zxUS3rtPUSAX
	AU7OUIkJCZQlTH+WoKzx6NzntDdFN+bbsLwpqyBSB12PQ0n6vXvHBmFOWZg549AkWJS7k5RKiA0Oo
	WSrt/lJXka1hasekrLik/g4VNikQuT1IbhIoKWsow83Vt8JPz0WVev21jHyPXnrzD2AW965PNeAhL
	saDiXrmaj5uZ9jeo7OOcDdnzFZRgJF9XbdDsp4RbGP0wUsc2rsQ7joGharwtsRvNeKeyllSZ/2dvO
	mAxygfHSnSv7+PfNEQbs1Gye/LJ7Gfy672LURHchJLhoadK/xZWLL+4UosqZVWSnk2DW9Y+vwNfFF
	H3/BEdPUbRhVH2h+Merw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6ll-001Dvv-0Z;
	Mon, 08 May 2023 19:43:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6lg-001DrI-0w;
	Mon, 08 May 2023 19:43:35 +0000
Message-ID: <20230508181633.089804905@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=cSONB8rAwM/DhP8pLyA+5ZPUbC2lOuuQwaVdJRn5WDM=;
	b=TUKnHdyKCm2jhBxD5IlUGRPEG/QaxWUEEk5j+F5TiwGQh75MzfKnWvvga1ogV0FWpqsAk0
	Z/VqPwKzVgozvsmFgeZHc6fKtgAWVGs7xGme4vq54PLJoTakzMDfDNVCbcO2rny0q4HnR6
	qlFXb43Qt1L8lTxJDtVVOKBuzxeXABCLtAFoVNNIdEV1p8ow/ukbkpiR2uIVB/FYpjA6p3
	h6hKX4cZFsqIirm+tNd9G+ACRA1lcKi+gtx7U3umktHuz9juvrtG2mgbwLKrM2SK5QyvS3
	r9jvL2zUpq3y0guhjpTb2zQUgu9MH/0dN+oTlFfspWYXJjDrCu5rao9nchjzhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=cSONB8rAwM/DhP8pLyA+5ZPUbC2lOuuQwaVdJRn5WDM=;
	b=i5YP5va30wPZDaaNSG4+BZNoSkYS91jOjq0F96kx0dzX5lZgVd2tGOGcKaXMK8erIbX4td
	IGoM8wVZMNo8tHAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: [patch v3 00/36] cpu/hotplug, x86: Reworked parallel CPU bringup
Date: Mon,  8 May 2023 21:43:26 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124332_478681_6B382B54 
X-CRM114-Status: UNSURE (   8.44  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi!

This is version 3 of the reworked parallel bringup series. Version 2 can be
found here:

   https://lore.kernel.org/lkml/20230504185733.126511787@linutronix.de

This is just a quick reiteration to address the following details:

  1) Drop the two extended topology leaf patches as they are not longer
     relevant (Andrew Cooper)

  2) Make the announce_cpu() fixup work for real (Micheal Kelley)

Other than that there are no changes and the other details are all the same
as in V2.

Thanks,

	tglx






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
