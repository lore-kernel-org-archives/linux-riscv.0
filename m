Return-Path: <SRS0=eDvz=DK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA427C41604
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 06:38:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68915206A5
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 06:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4nb371d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Wl6L2h2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68915206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtjCjIfG4vpr0MSpd4l5v+QSqEqwdntdWA9/OA8425M=; b=W4nb371dyBjPvONhBTWkypTGM/
	GrLN9UQLpv6H0twKC7uqTbfDl3BzHNScsXVteIE0/OsJERR+xoI/S+73hkKMjG6m5GX6eeIAwZ3CP
	8Ew41iz552x35mxYUumOGYxXyMV7wfwsZTOuuVJXtGFp/m2Rh/P0HayOh6CkConJmm3mjq78+Inol
	G/xhfuD4l7axr3u3h+rF2bOtq/hpNX2DLme+4lbYjLCzNyoJIOoV+2lDIpdiQ+Hhq1IljRpOo46r9
	/q7gMiy3iE/To6jLV22OWlEocXsah6h0dTz0oqJ4QQ3CUaeVLNz5waArmu39rhFWYkcI1G31HAZ3Y
	F/mQO7cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kObBJ-0007zQ-PK; Sat, 03 Oct 2020 06:38:09 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kObBH-0007xe-HL
 for linux-riscv@lists.infradead.org; Sat, 03 Oct 2020 06:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1601707074;
 bh=ZegSKPFynorzf2pHNijeVk4xWnZ06qcsVKppYuZJeIE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Wl6L2h2LSUeIekSLAHG8p3k9MeKhItnHe76V4UmNHlC10PN4m15X08SlX+l5rG65i
 miCaimq6eeYfRnj7PvYDmRFrNbNPXxPn+kXFgnoxSI7Kcwdz3VbVmJD499sruJ1BKP
 OVAQX/ZF9b0K0Q2MF4kCLzHswb9m+wQtBsPHzuYA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([178.202.41.107]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MEFvp-1kHCnX0PBN-00AH4c; Sat, 03
 Oct 2020 08:37:54 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 0/2] docs: admin-guide: EFI Boot Stub
Date: Sat,  3 Oct 2020 08:37:23 +0200
Message-Id: <20201003063725.8698-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:i4NyI44BPR448lQJvY48cLHhTdO9OzbONsVoYMawOm9/qhQtVBH
 6MhreeG89mbVB04RQZCyr3fqiJBsGRb2GRm7c+GLvzhsbXR/BSsPnPynLHd2b05rPT7LUFh
 h9WnbHIh3Orbg1isYlZZkq+3HNPN4h8nNfJlAMRxmiUfRSDAHgFEfZ6VQBIF1eQWtnVyZMy
 wAxsSPWHOs1v6/dROulxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DCCHzUNE040=:EwOaPHUt5//Ko9uVYJMY5Y
 BiF0pXYPl6rWjTtXbZKCJLJQjzA20RgSCY9Uyj6ZQPbbDcOwVWflZDYrSSOr13+q4ZjAV8lM7
 CCBKDniVB8yoRUU2CDfBbHQdHkEWt16km8hM7aCsvN45JG5hLe9xtSXB9L36BE2gHnD2/rnYH
 5kc6kl/9DGbBNBWoqSYhrG64PKBPl9m53o/gfMsejCulEHxKf5IeyN64Z1CfD17gJnxRFRFoZ
 4fJHAa7heVx0rDAuZtPJmft3P3EyTHSmJ/+knXjzZaqn7yRAprF0V+TZ/kVrblyv7sLPMBYSU
 n5i7sPtyRBooCM8qyjOWdqq23UitNoKbmEKFS6tiNhRI1YnlltN2zKO+IDxM3mDHgrl2hcCUO
 /fHMbskIN3uX2CB82TQDhTb7Ys2frh5Tvxd/t9syzKt81t/cNlMp9jwaTFbNXfdPUKiICrd73
 tuRBsspZm1FepTJVWB7rgjtqCWiEdKRUaMdtTzZznt7hmIKXYS2OcP4afr3+gwpqykzNU1Bm4
 7vWWKyq7nY/lLdQzDB/9/oAtE1ytXrtj3NGsCMX/UTz8m1CLAgR0MJ2nsL4JFedfCZ0eEctLK
 WdOgTV+dQBTlottRD47UQvOq4Ztx0FN4fcOtGaWzu/Q2S8xALCRbNeL485nGklJ7YcrPnm419
 ne5Hdm/c7OeONHzpoQykVkysC3Vk9fKTeIguiI7zbGz1kZrX0BATinwSLnff/h+ujve3hKqTs
 sB92TWRb7+JjcyHoV7lQYZhU8HdMWWyazQEY0Nygl7LX4MAQnobP+1W3ZO1JcNV5Nm6GVIjEx
 tdvZusMCrZM3Ix9rotHpDnRRhvfNUeDbTOQWIuhwujUpxS9yv1qUAB3m60eRZ3Tqhl+vpqIrw
 /gijbkcyfh228iLC1qWpsMNEpZdYjuUUCwiZoTpenoTb3dgApDyg5m2zjEe+PwvwTRRyZVE36
 woys6UBhjkqI29k1qR+K0pKjsWYQnfcdl4nC9Qhwuhp5TVznRE6PO3U4IhetpAQ2CjME4aNno
 W/83kbeU1VvW/kfKrOBDNjBrnmi2+RgiOoujbTyJv5EjTTJBpcaPHc9VP6r1YKRnE+zR/i3MT
 QlOVeOqBrSAufl/kqw8T8XFfOwsCWBGnF8RWlhpMQwee/xA/9c65MdVtFgBJA+rcvofYjNzve
 Soua73JBU5bqZ6oeCNlPq3SrXTyrf9NRURHgBq+v03nnrvbAG8uAQFcoSwFKu0kGy3zjGPfIj
 4N9bcNDDAj9WWrTyood2hGeAbqr407l2l5Wv8/g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_023807_781005_0A9E3B4A 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 linux-doc@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Describe the passing of the device tree and the initial RAM disk to the
EFI Boot Stub.

Describe the handoff to the main Linux kernel. The links given here
provide the necessary information about structures like boot_params that
have to be filled by the EFI stub. So we don't have to describe them in
the admin-guide.

Heinrich Schuchardt (2):
  docs: admin-guide: fdt and initrd load in EFI stub
  docs: admin-guide: EFI stub to main Linux handoff

 Documentation/admin-guide/efi-stub.rst | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

--
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
