Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F92CD3426
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TbF9QLUgBZv6Eo7cNqPUaO62vWvOCy1nRqlzAPBUBwU=; b=1+o
	lde0LkOeaG0zP6KnLRPHQ5HwBiFygRPWfpkA0mrSji+wIID+ScGmoljjOVV5fDS5eyj+FqfZYc8YR
	29/Ba4ZHK1t3Jw1Pqn/yFidJg9A6puMw2aGWdOzoP7PTmaG3Cl5EvNYoLldh0MW3DHjVhbxlj/v22
	uR5C1LYvh5GBfPBTyIRcQAJoDoAKZrogT3DKNyLOPozQa164sXuQxy8+XBsDj5pyr6+TvRG4y8ozd
	uyYTG+CzQn7/gGeAZy60uxpWgCh6H4Jrsj2i4Er1hcphaxyxI6wnVI6WSnaoTMTJnmGXxdGxwsVg4
	vUCYhqJ7lQ3Y1RDTUZCFCSI54K40N2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpk3-00000007Klq-0up8;
	Fri, 01 May 2026 15:25:23 +0000
Received: from prod-mta-13-01.swg-srv.net ([185.255.28.34] helo=prod-mta-13.swg-srv.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJL6-0000000DRws-2P0L
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 16:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=bThlJmxxUEwMDkmEkeCcn8WhERUqlDss+FQhTcgS/jM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=RacTiD1TaqVIfnIPsWwWKPBcYPDsGXR71K7LdaTGK/S8LMgVCdDu85qAMpdtcpjKmn9oLUlOq
 jqmnNmcWg/7s97ejpT5Jv9DzVxXnqkWVd1WRPYXkUcHKDJMEj3YtGJA4slzn74B4LQlhi8CUboo
 q3AAe6YLhOjuH3lVSE4HOS2nd7RXq82PTefdEvWw7iOpy/TApoHaQesyaIt6fPkRLsyOSkUQ01/
 AuqyMgeUXq76PU7PK5S3AurKA9x8+FVZPZFWxcNf6Dz5kL6PCrox0RJc2QFg5/faeEHE3OCUv/0
 2i+w100HS1IC0gFe6e2GN3TaiT+QUMobJbqcB31r6A0w==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 19dc04a777e000f373.008
 for <linux-riscv@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 24 Apr 2026 16:19:58 +0000
X-Zone-Loop: c75bad6442bb56c65407559a9adcceddfd443ef5c051
x-campaign-type: default
x-transaction-id: c2601b71-7ee4-496d-9f1d-769592f41eb0
x-swg-uid: 01-9cda702e-7bb3-4ba7-a1d5-8f688a16ff96
X-Mailer: Sweego
Message-ID: <1777047599.8631fc262581453bbf619ec5b2062170.19dc04a777e000f373@vates.tech>
x-swg-bid: 1777047599.8631fc262581453bbf619ec5b2062170.19dc04a777e000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Received: from [192.168.31.249] (182.136.141.83.rev.sfr.net [83.141.136.182])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id 44B8187251;
	Fri, 24 Apr 2026 18:19:58 +0200 (CEST)
Date: Fri, 24 Apr 2026 18:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: linux-riscv@lists.infradead.org
Cc: anup@brainfault.org, tglx@linutronix.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com
Subject: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on
 IMSIC
X-BM-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777047598450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_092512_909512_89DA8928 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 01 May 2026 08:25:22 -0700
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
Content-Type: multipart/mixed; boundary="===============5516266567117430257=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5516266567117430257==
Content-Language: en-US
Content-Type: multipart/alternative; boundary="-=Part.28a6.c03164922a40ca3b.19dc04a7572.752a36aec411752d=-"

---=Part.28a6.c03164922a40ca3b.19dc04a7572.752a36aec411752d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

While adding Xen/RISC-V support, the guest event channel interrupt is
allocated via irq_of_parse_and_map() against the IMSIC domain and, if
we refer to the ARM implementation, it must
be enabled/disabled per vCPU through enable_percpu_irq() /
disable_percpu_irq() in the CPU hotplug callbacks=2E

With IMSIC using handle_edge_irq (the upstream default),
enable_percpu_irq() never clears IRQD_IRQ_DISABLED=2E That flag is set at
irq_desc allocation time (irqdesc=2Ec) and is only cleared by
irq_startup(), which is called from __setup_irq() only when
irq_settings_can_autoenable() returns true=2E

irq_set_percpu_devid() sets IRQ_NOAUTOEN (via irq_set_percpu_devid_flags),
so irq_startup() is intentionally skipped for percpu-devid IRQs=2E
enable_percpu_irq() calls irq_percpu_enable() which does irq_enable/unmask
on the chip but never touches IRQD_IRQ_DISABLED=2E

Result: handle_edge_irq() hits irq_can_handle_actions() =E2=86=92 checks
irqd_irq_disabled() =E2=86=92 returns false =E2=86=92 IRQ silently dropped=
=2E

This was confirmed by logs:

 =C2=A0 XEN_TRACE irq=3D12 percpu_enable cpu=3D0 IRQD_DISABLED=3D1
 =C2=A0 XEN_TRACE irq=3D12 handle_edge DROP IRQD_DISABLED=3D1 action=3D=2E=
=2E=2E

What we tried
-------------
- request_irq() correctly works with upstream IMSIC which uses=20
handle_edge_irq with no
irq_set_percpu_devid() but it means we only can have one vCPU which will=
=20
always handle the irq,
and we don't want that=2E

- Adding irq_set_percpu_devid() + switching to handle_percpu_devid_irq in
imsic_irq_domain_alloc() fixes the Xen case but breaks all other IMSIC
users (PCI MSI, platform devices) that call request_irq(), since
request_threaded_irq() rejects IRQs marked _IRQ_PER_CPU_DEVID:

 =C2=A0 WARNING: CPU: 0 PID: 1 at kernel/irq/manage=2Ec:2101
 =C2=A0 request_threaded_irq+0x80/0x12c

Therefore, do you have any recommendations on how should I handle this=20
case ?

Thanks,
Baptiste



-- 
Baptiste Le Duc | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.28a6.c03164922a40ca3b.19dc04a7572.752a36aec411752d=---


--===============5516266567117430257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5516266567117430257==--

