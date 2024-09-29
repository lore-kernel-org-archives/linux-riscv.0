Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C7ACF6495
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 05:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VosaQ5DqNdk/cIke9lOAXiJ3eczR5IxbiYO3I7PeMI0=; b=xIp+IHQ97dp4S1
	U0IMG8MMe9V6X76qhme7Jxb6/SM2BoXyrltV5xnFN6xZxZU1heHwf1wJal0TD/SAIzhnycYNmwLEl
	MyHtoQvuOMOg0MCBENyIk8MZ+/c/oZ9rUcqCCeb1N1xJgJeovG90rPhIHX9tZ1OdeBA4zNaMPE3Qj
	4JNsdVr9UBqXO0MXMmBjqeA/PoOC5vcEq8vN/xXBoI/moxmFeiGHoe72Kx9R3jScyupkDSCXWo3JH
	NpLV2w7MgMC8Ac2+iTmBCu/h2ZD3+xVA2jqV8UNay8ep/Y794LujI6XP0xqKtIBVY1Z+3V3yyDm05
	I5VwaMC805EaHN0kjuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sum6S-0000000E9jo-1tjR;
	Sun, 29 Sep 2024 05:04:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sum6P-0000000E9jI-0gWX
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 05:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727586251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VvGpan+lr/kyQA2vfZpehQOTtK1UoV2nENswdzjhY90=;
	b=SuFqJWkHBoYH5fwrbw0TQQdiyOj3/UDQ0UiBZRlbFyK1phiZzHt054AzfVU+W1UONTNFHY
	RJaH+Ibs8u87Ap6j0Fdx8ws0z4NGlTgUQtZ06r/h400Ss9Pf4kYbhad9ROKzGGql4HfDGT
	bfuBa+WC2j/a6BJN6pVM1pL+xrkC25E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-vX6Gq4RSNq-A1dgSzFJblQ-1; Sun,
 29 Sep 2024 01:04:07 -0400
X-MC-Unique: vX6Gq4RSNq-A1dgSzFJblQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EE4B1954AF4;
	Sun, 29 Sep 2024 05:04:05 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.151])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D70F21979060;
	Sun, 29 Sep 2024 05:04:02 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org,  Jeff Law <jeffreyalaw@gmail.com>,
  Palmer Dabbelt <palmer@rivosinc.com>,  Punit Agrawal
 <punit.agrawal@bytedance.com>,  wangpengcheng.pp@bytedance.com,  Hangjing
 Li <lihangjing@bytedance.com>
Subject: Re: [External] Page sizes supported by RISC-V
In-Reply-To: <CAPYmKFtWPxEvD7v4FfN1n=YGuYCKgFFm7SNer5-GF95OBTMG+Q@mail.gmail.com>
	(Xu Lu's message of "Sun, 29 Sep 2024 11:29:11 +0800")
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
	<CAPYmKFtWPxEvD7v4FfN1n=YGuYCKgFFm7SNer5-GF95OBTMG+Q@mail.gmail.com>
Date: Sun, 29 Sep 2024 07:04:00 +0200
Message-ID: <87o747xd8f.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_220413_303340_AA111030 
X-CRM114-Status: UNSURE (   7.60  )
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

* Xu Lu:

> Thus, we are also trying to call for native 64K MMU in RISC-V
> community. You can find the discussion in link [1]. We hope more
> people can participate in the discussion and provide more data
> support.

If you are seriously considering offering 64K pages as an option, you
need to clarify the specifications and update binutils *today* to
increase the default maximum page size for the binaries the linker
generates.  The transition will only become harder as adoption grows.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
