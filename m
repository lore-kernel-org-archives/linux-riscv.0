Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3C7C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 18:39:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CEB32070B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 18:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sb50Oliu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ilNoZIos"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CEB32070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zo1OlDbM7K8wmitOz6o2W4nN409IdMqBrbcyde+BlCI=; b=sb50OliuApzXpnKPXTUXrSkCq
	YvgInr4aNaYwrgpZScVUpjlFu69HO3H5xvN+Jcn0viXnmrE9eArrO1gkYFFQYswkrW3isJpLec1NL
	VgdsVeNyq8qvsInZVoLKeohZS4pn+GhVvaoq6Qvuh1DPiJqFKbIyQVK8eghDEisopHc0c9Pz6BEiw
	9K3vg8KhZ3CWD5j7UKG3KzMbjoebfU37+HPlHzlGI4YqdeuPhcknHtumIoIzAbe5n/QjDm4OAjlfA
	JDyMrfFH88tKjEczIrpYwSu6iVj+EYLljHe3BwlzUrwNgjFCP76UX2pLUJnQGxaT462sZtdmXACVw
	dKPJ8n0UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggZnz-0003kU-6O; Mon, 07 Jan 2019 18:39:19 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggZnw-0003je-Hb
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 18:39:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id p8so557056plo.2
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 10:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7lzcH44y+/nY/E67faF6OAg8mbGpBWcOJD83Qjm/b8E=;
 b=ilNoZIosAXFrvHkhIzhsVHs2VdVk20w/lP1R3ZSDAR7YGre7Y6KR2EsWYWn9u2iO+x
 NwrNaLi1zlR/wJLD3P3G9/E8Yu9HKC2Z3JkFM5zLqvI+z7iFR5pxc2IHObm/N8iAoKVA
 uMjCE0qnjQtGA4UThtBtEh5Iy/y26/S97nCRAjHbEKimKUnF4vjl7/VFoqvJIgb0KW90
 lKmNKvDZWMQaML9b355q6mCVnU2x5R/6MVHVflrmhgLUy2RgWjl6Mq2KVYhgwnd+t7Ty
 D8TOXcfGZ0fbCAJMK4D9KbR3WcnygC1hGjdEH1GvS7f2hH0MB0mnRqtXjsp0g1RLkBUo
 0cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7lzcH44y+/nY/E67faF6OAg8mbGpBWcOJD83Qjm/b8E=;
 b=nf6Fra1fYmeLhAlsfJZXsoI/VDttKWFGfRBaMcUigfq0mfO+XRwaegq9ErkIrRlYoP
 sPoYrgEq/ahZRywcMir3mbwFL2XRYwoudQSNm2xmyXAbY8vLstzqZaA2L+XIkWvL64nm
 NmYMZ/b5sdqc3hhqULSUIpWPcr/x+sIawqEG0SD9GRkUqjQTILp0v3vPixXu06rzUHK5
 zZE9+nOih6iO8/6/97sIVKmIuT3IkI4ljEmhf8yk0TNNOKLQH8ec3tWMh25A6OpDhmYo
 YJzibk+q1jeBJbbHuZyE8Gt2bb0u5rNTRWLkVUTSDIacB3hZ/1WIPrTsjFDUK32eJaX+
 5gQg==
X-Gm-Message-State: AJcUukdArCg3U3HjpuXFIb4dGiwS260OXuMtO/L5tioSzhAR8JzaISnF
 ivDMtvGyjaVeQhr9x1gBuWrdAw==
X-Google-Smtp-Source: ALg8bN5Gj1Gxlbv2etzQXbTu/QZ9raG5To1dn+dpau10Cy8b3h8VofdkyZSd1s67H2pbwAPOAFK0Hw==
X-Received: by 2002:a17:902:f20d:: with SMTP id
 gn13mr59954631plb.11.1546886355475; 
 Mon, 07 Jan 2019 10:39:15 -0800 (PST)
Received: from localhost ([216.9.110.14])
 by smtp.gmail.com with ESMTPSA id o8sm129478106pfa.42.2019.01.07.10.39.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Jan 2019 10:39:14 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Mon, 7 Jan 2019 10:39:13 -0800 (PST)
To: satish kumar <gsatish.ldd@gmail.com>
Subject: Re: [PATCH] RISCV:IRQ: Adds Err column to /proc/interrupts
In-Reply-To: <CAK1XJzUHgkSe9GODaUHH89b4XD0zW0EvO5RMzt5f7hpWiVsfNg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1901071036170.11080@viisi.sifive.com>
References: <1546696272-19152-1-git-send-email-gsatish.ldd@gmail.com>
 <alpine.DEB.2.21.9999.1901062233110.7801@viisi.sifive.com>
 <CAK1XJzUHgkSe9GODaUHH89b4XD0zW0EvO5RMzt5f7hpWiVsfNg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1354535477-1546886353=:11080"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_103916_618747_7A7153B6 
X-CRM114-Status: GOOD (  14.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1354535477-1546886353=:11080
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Jan 2019, satish kumar wrote:

> On Mon, 7 Jan 2019 at 12:04, Paul Walmsley <paul.walmsley@sifive.com> wro=
te:
>       On Sat, 5 Jan 2019, G SatishKumar wrote:
>=20
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0This patch adds extra row showing error=
 count to output of
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0/proc/interrupts using seq_printf().
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf() API is used when printing =
to /proc/ files as a
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0helper functions to return formatted ou=
tput from =E2=80=98proc_read=E2=80=99
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0callback.
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0It adds Err: row to /proc/interrupts
>=20
>       Why?=C2=A0 It's always going to print "0" with this patch.=C2=A0 Do=
es the missing
>       line break something?
>=20
> It adds extra info in the /proc/interrupts which provides=C2=A0 error cou=
nt.
> It is used for printing information.

If this patch kept track of interrupt-related errors, I'd agree.  But if=20
it always prints 0, as it currently does, then there doesn't seem much=20
point?=20

> =C2=A0
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0root@(none):~# cat /proc/interrupts
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU=
0
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 8:=C2=A0 =C2=A0 =C2=A0 =C2=A0 356=C2=
=A0 SiFive PLIC=C2=A0 =C2=A08=C2=A0 virtio0
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A010:=C2=A0 =C2=A0 =C2=A0 =C2=A01717=C2=
=A0 SiFive PLIC=C2=A0 10=C2=A0 ttyS0
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0IPI0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0=C2=A0 Rescheduling interrupts
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0IPI1:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0=C2=A0 Function call interrupts
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0Err:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0
>       >
>       > Signed-off-by: G SatishKumar <gsatish.ldd@gmail.com>
>       > ---
>       >=C2=A0 arch/riscv/kernel/irq.c | 3 +++
>       >=C2=A0 1 file changed, 3 insertions(+)
>       >
>       > diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
>       > index 1d76b60..509c96b 100644
>       > --- a/arch/riscv/kernel/irq.c
>       > +++ b/arch/riscv/kernel/irq.c
>       > @@ -24,9 +24,12 @@
>       >=C2=A0 =C2=A0*/
>       >=C2=A0 #define INTERRUPT_CAUSE_FLAG (1UL << (__riscv_xlen - 1))
>       >=C2=A0
>       > +unsigned long irq_err_count;
>       > +
>       >=C2=A0 int arch_show_interrupts(struct seq_file *p, int prec)
>       >=C2=A0 {
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0show_ipi_stats(p, prec);
>       > +=C2=A0 =C2=A0 =C2=A0seq_printf(p, "%*s: %10lu\n", prec, "Err", i=
rq_err_count);
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>       >=C2=A0 }
>       >=C2=A0
>       > --
>       > 2.7.4
>       >
>       >
>       > _______________________________________________
>       > linux-riscv mailing list
>       > linux-riscv@lists.infradead.org
>       > http://lists.infradead.org/mailman/listinfo/linux-riscv
>       >
>=20
>=20
>=20
--8323329-1354535477-1546886353=:11080
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1354535477-1546886353=:11080--

