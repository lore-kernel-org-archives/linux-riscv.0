Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7995EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 18:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qRFfieJE70JGjhKQnxcKzo7cpyCGVbWDbbAeRKSQTY=; b=31r1YgIq6CxbFG
	K57R//+Z5WaJ9/MK5wgTqY+/KeRunalk9BY1G1OwHUM3dBHNa9FW7xuziblgPR15Zl0sFpxBcyMWN
	DYot3rC3cmf1G0PFHLaeUWweyS4JsxShz3CCXkjZ1/hSCMiQgZ6ilPvB3wJN4rWva6UUR6wnx5jfM
	6tqhouu+FudnKXtWD+JRPnRhOCVyN22tfJYeyA5LA8EipJpH7gj9BCMmnjmmZ/RiD4wd0rEn9FvOj
	0sFH6YCDWk5C5yuvZxHyafDrH0/IHQRpJj2fHBpWE6f0OXnCDRUs16PFXd8JkiAL/yz+NPzFQvJsA
	D5zFEcpcPsJ6B7+vEOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHjb-00FcG4-0s;
	Tue, 11 Jul 2023 18:05:11 +0000
Received: from 5.mo575.mail-out.ovh.net ([46.105.62.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHjY-00FcEo-0u
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 18:05:10 +0000
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.16.8])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id F091226C7A
	for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 18:04:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s87lf (unknown [10.110.115.217])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 971BA1FE3E;
	Tue, 11 Jul 2023 18:04:58 +0000 (UTC)
Received: from courmont.net ([37.59.142.102])
	by ghost-submission-6684bf9d7b-s87lf with ESMTPSA
	id TjgcBcqZrWQtiQEAqDmyAA
	(envelope-from <remi@remlab.net>); Tue, 11 Jul 2023 18:04:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004a6e4188e-14a7-4010-a06c-008f3ac247c2,
                    BD5993DD31A8D185A8BDB9FDB50A3FED214DC06B) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/12] RISC-V: crypto: update perl include with helpers for
 vector (crypto) instructions
Date: Tue, 11 Jul 2023 21:04:57 +0300
Message-ID: <10238181.0Rfz7avHUX@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230711153743.1970625-6-heiko@sntech.de>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-6-heiko@sntech.de>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11081669834400668123
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkfhojghfggfgtgesthhqredttddtjeenucfhrhhomheptformhhiucffvghnihhsqdevohhurhhmohhnthcuoehrvghmihesrhgvmhhlrggsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfegfeefvdefueetleefffduuedvjeefheduueekieeltdetueetueeugfevffenucffohhmrghinheprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_110508_489189_536BC50D 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgdGlpc3RhaW5hIDExLiBoZWluw6RrdXV0YSAyMDIzLCAxOC4zNy4zNiBFRVNUIEhlaWtvIFN0
dWVibmVyIGEgw6ljcml0IDoKPiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJA
dnJ1bGwuZXU+Cj4gCj4gVGhlIG9wZW5TU0wgc2NyaXB0cyB1c2UgYSBudW1iZXIgb2YgaGVscGVy
cyBmb3IgaGFuZGxpbmcgdmVjdG9yCj4gaW5zdHJ1Y3Rpb25zIGFuZCBpbnN0cnVjdGlvbnMgZnJv
bSB0aGUgdmVjdG9yLWNyeXB0by1leHRlbnNpb25zLgoKVWggYnV0IHRoZSBrZXJuZWwgUlZWIGNv
ZGUgcmVxdWlyZXMgYW4gYXNzZW1ibGVyIHRoYXQgc3VwcG9ydHMgdGhlIGAub3B0aW9uIAphcmNo
YCBkaXJlY3RpdmUgYW5kIHRoZSBWIGV4dGVuc2lvbiBhbnl3YXkuCgpJcyB0aGVyZSBhIG5lZWQg
dG8gd3JhcCB2ZWN0b3IgbG9hZC9zdG9yZSBhbmQgQUxVIGluc3RydWN0aW9ucyBmcm9tIHRoZSBW
ZWN0b3IgCnNwZWM/IFRoaXMgdHJpY2sgc2hvdWxkIG9ubHkgYmUgbmVjZXNzYXJ5IGZvciB0aGUg
WnZrKi1zcGVjaWZpYyBzdHVmZiwgQUZBSUNULgoKKEFsc28gRldJVywgdGhpcyBjYW4gYmUgZG9u
ZSBkaXJlY3RseSB3aXRoIC5tYWNybyBpbnNpZGUgYSBoZWFkZXIgZmlsZSwgd2l0aG91dCAKaW52
b2x2aW5nIFBlcmwuKQoKLS0gClLDqW1pIERlbmlzLUNvdXJtb250Cmh0dHA6Ly93d3cucmVtbGFi
Lm5ldC8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
