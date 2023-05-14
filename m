Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A78BC77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0HZ1oXXc9+/wYBzIjrUciJHinu2i3uKu2/0akCvIc8=; b=yXBmVcoUQ9QbXx
	RQGIzYFMFXWDMVpeXmohEeFbDJpYkYdg3z0OrU6GLeo+Vv+LdSKsX1iQLGOHH7UDaRuIzCzIXlG4Z
	fgz60VSpV99fQK7OVUlAl2q8zVh7GWYJpVXN8BfYZ56DyWpmeO8SOoEX5L3Iiq7FuLmWzdC0zpKm3
	PCJamyDaoayvsx4S5gEfvOsqUOP5DF6FtdLWzliygmvi7Aaqj6cIPbETgec3iBk34g2h9xI42oQ5Z
	APZGdYNTBxax0ieSX0RsLKc41duug37s09wCS+53Hup6Z6+9SRylmfenNCvYyGT9n8cwJrq5flg7j
	zDqFSNIwu1zcw4qFsGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyJc1-000Jq3-0G;
	Sun, 14 May 2023 21:50:41 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyJby-000Jp9-1P;
	Sun, 14 May 2023 21:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zygIhDyV8ht+xJs1lmqnA3sy7ZHDhj2x5W8U9MyDTpM=; b=AtfoJ+yRkuDm9gCWovg7bgbFzv
	zvtG8omqD3Ee2e5vtlK1211bbhN7KzcG9ZOV/p9gXghTUS1HF9EaelwoM4SQo/b4sWNMb2wsJsVAh
	ryLGjfB/dL5jQW5LWnI6h4gq4lKj2LKWt1eQxsKNKi4CYTHPi2D+7G5csc6so1Mr3IZqjzYXfvDre
	Wa2IYRFjoBiG9xBoaM3MR/ceTkMFFWkX6SNnbTUn4IT7Xv2Ef1OD3QTBmf65tsdUdiBBhGBc7WMfJ
	YjLmEKzf9bN3ap+iE91yCmvTRvaupsrf+ACH5S2PsgkJyDm/ZJKotc9YiiD6FM6FqFSv7z1nQGLn3
	n3J6H6Qw==;
Received: from [177.189.3.227] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1pyJaT-009SDU-MC; Sun, 14 May 2023 23:49:06 +0200
Message-ID: <b4733705-7014-49c6-57ab-a67459954f28@igalia.com>
Date: Sun, 14 May 2023 18:48:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [patch V4 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
References: <20230512203426.452963764@linutronix.de>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20230512203426.452963764@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_145038_471236_4F7FD442 
X-CRM114-Status: UNSURE (   8.40  )
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

On 12/05/2023 18:06, Thomas Gleixner wrote:
> Hi!
> 
> This is version 4 of the reworked parallel bringup series. Version 3 can be
> found here:
> 
>    https://lore.kernel.org/lkml/20230508181633.089804905@linutronix.de


Hi Thomas, thanks for series! I was able to test it on the Steam Deck
(on top of 6.4-rc2), and everything is working fine; also tested S3
suspend/resume, working as expected.

Some logs from boot time:


Parallel boot
[    0.239764] smp: Bringing up secondary CPUs ...
[...]
[    0.253130] smp: Brought up 1 node, 8 CPUs


Regular boot (with cpuhp.parallel=0)
[    0.240093] smp: Bringing up secondary CPUs ...
[...]
[    0.253475] smp: Brought up 1 node, 8 CPUs


Feel free to add (to the series):

Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com> # Steam Deck

Cheers,


Guilherme

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
