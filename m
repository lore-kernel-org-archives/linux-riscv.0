Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B3C35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vduOPvf/eyfV4OBa8MzRj0kN7DCEmCxol+LRqSBgnTg=; b=1t5U21n2yfh3mH
	U9+fkbORN7I1qiAirEYZUFt5c7N28eG9SHC51GeW/vevfSdQxUOkPQpfX3K5NDDBeOKstOgwsWfhz
	US/qQFqqkiUSyuI11/o4k1uOjL5PNoOw1/pbQkfVzVzHloZyJrZcnchIPVHnGXkQtBKZyP+tNEYq6
	uK1IDqkLpzYA1eK80KJ5hPmI/8pvo7AuZPcC15W1k3HNqGrlO83VwWXnUn4zrUV2GnPqdkNOv45EU
	t4Xa2weH8ExQC8E0WekFOvLJIoYYl2nF8i5+q/fiKt/3I7AXFO1PsFoyLEnJMADNd1q5Ce+P3kW/Y
	dm8Il5vO+Wo7fhOVFLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXiX-00000006AQC-3wb6;
	Tue, 17 Sep 2024 12:54:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXiU-00000006APo-3Vfh
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 12:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726577641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aj6D4JWAWCa+K8vQuk1yo6gI/nZb1Gt2a2F+27DHbOc=;
	b=TTIDVelfujO4HsqAvNk9yo1dPXZuvR97MaX9jgUAbgWJHCPrxNFtbJIXk2YhvNYmisJl5p
	y4qxetCfyFIvOu6uZKaSStsvxYNqUJuWnF5ggqyFvJ1GhkHH8R9VECpeCYqwILey2QUtxF
	34Whab0zahvcPy65epk2Bk45M1/pM7g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-zmhLdzkwM9mbYl9vNSnpOw-1; Tue,
 17 Sep 2024 08:52:01 -0400
X-MC-Unique: zmhLdzkwM9mbYl9vNSnpOw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C983D1953963;
	Tue, 17 Sep 2024 12:51:54 +0000 (UTC)
Received: from asgard.redhat.com (unknown [10.45.242.26])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAC8B19560A3;
	Tue, 17 Sep 2024 12:51:45 +0000 (UTC)
Date: Tue, 17 Sep 2024 14:51:41 +0200
From: Eugene Syromiatnikov <esyr@redhat.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	"Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	WANG Xuerui <git@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Yangyu Chen <cyy@cyyself.name>,
	Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
	rsworktech@outlook.com
Subject: Re: [RFC] riscv/entry: issue about a0/orig_a0 register and ENOSYS
Message-ID: <20240917125141.GA14463@asgard.redhat.com>
References: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
 <84ae492a-1995-4fa1-9d3c-78c5bbf9ff71@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84ae492a-1995-4fa1-9d3c-78c5bbf9ff71@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_055403_014936_A6CD4872 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Sep 17, 2024 at 01:59:23PM +0800, Celeste Liu wrote:
> On 2024-09-17 12:09, Celeste Liu wrote:
> [...]
> > Unfortunately, struct user_regs_struct is defined as below:
> > 
> >         struct user_regs_struct {
> >                 unsigned long pc;
> >         ...
> >                 unsigned long t6;
> >         };
> > 
> > It doesn't contain something like reserved[] as padding to leave the
> > space to add more registers from struct pt_regs!
> > The loongarch do the right thing as below:
> > 
> >         struct user_pt_regs {
> >                 /* Main processor registers. */
> >                 unsigned long regs[32];
> >         ...
> >                 unsigned long reserved[10];
> >         } __attribute__((aligned(8)));
> > 
> > RISC-V can't include orig_a0 in user_regs_struct without breaking UABI.
> > 
> > Need a discussion to decide to use which solution, or is there any
> > other better solution?

As another data point, AArch64 has NT_ARM_SYSTEM_CALL (introduced
in v3.19-rc1~59^2~16[3]) for the purposes of syscall number tampering.

> > [1]: https://github.com/strace/strace/issues/315
> > [2]: https://lore.kernel.org/linux-riscv/20240627071422.GA2626@altlinux.org/

[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=766a85d7bc5d7f1ddd6de28bdb844eae45ec63b0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
