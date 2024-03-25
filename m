Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADE6C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYaUVftWVKN6xxqfmMgSPntZkN97JU51uwIjYsTwi4A=; b=c+DEq2+tJlH85D
	PliPWU5rHqnSsbhrQDrbB0It7tVo3q5/bYLuzrMFZ5gDWaOfo8x23E9/phKuoKsvTL9Ad4a9s+79n
	MnYLb1mpXgsrgRLZDM9jns6BT/5H2dtAaHrqtSTguBTPFi2rhMbK0BDp1zAyagjJ7ibVuSMz1TIi5
	xEzXXdUFbzEiqmpr21VnClMFksMws434l033GWtOaBoV8WIgUyfO9K2mo6A7gFxOAbHMWKeXvPsgt
	uZF1UbxDC+yhXnv6ffy9QdKqJEdNdQI2qyvkDB8CdGCc8IpQ5lqM7tFfF8wkmOIbvey2YVDh8fP0G
	MHA7+t3wJ3AoRDEjyE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropjr-00000001WkJ-1Egj;
	Mon, 25 Mar 2024 19:12:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropjo-00000001Wj0-17JK
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99EDDCE1C17;
	Mon, 25 Mar 2024 19:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8041BC433F1;
	Mon, 25 Mar 2024 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711393920;
	bh=u7jAwOBoyoEFZf/8d+oD1X/Pe8+N3eKMDolm6R9REw4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=XW1GcPTfA8aKj6N4r9YfSxGEKxNzrNpo397atjIL1ilMDEIKJv+U3Idjo47Lsy2N2
	 RZK5elJCDCFXZZ2nwka9ZBbS7uzk03MBwVuq6RuWAlI1lcRcMwgV8wTUKX1bu3TKnL
	 bzrLk5BVgwpxbeJRmuLOyUePw9FBHif2yq/5LJnpiKuRhDCky3OTZeXlMUMUhkZvEp
	 xJEaJDl4kN4rs7aneTZDDecBbeC8C8IPZ1zUnsT7i/cSyTIDuUYZyHEiRED43Mdt1z
	 c8z3jIM0hWHoVQt3I0CTb7Skq2Lrw7WSRYgU0DkGsAGVW/SGCFlbgPcpoMgNscFagb
	 hE9562rX7NzVw==
Mime-Version: 1.0
Date: Mon, 25 Mar 2024 21:11:56 +0200
Message-Id: <D032IFOPKJI8.3TKDPQQI9I6LG@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Naveen N .
 Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 <linux-trace-kernel@vger.kernel.org>, "Calvin Owens"
 <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <D031SE4QN1CG.18GY6AS20QF1J@kernel.org>
In-Reply-To: <D031SE4QN1CG.18GY6AS20QF1J@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_121204_595921_966A6694 
X-CRM114-Status: UNSURE (   6.05  )
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

On Mon Mar 25, 2024 at 8:37 PM EET, Jarkko Sakkinen wrote:
> > You also should consider using IS_ENABLED(CONFIG_MODULE) in the code to
> > avoid using #ifdefs.

Hmm... I need make a couple of remarks but open for feedback ofc.

First, trace_kprobe_module_exist depends on find_module()

Second, there is a notifier callback that heavily binds to the module
subsystem.

In both cases using IS_ENABLED would emit a lot of compilation errors.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
