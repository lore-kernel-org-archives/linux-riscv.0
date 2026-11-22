Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B207606A331
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ezTWdGRD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bwLFaKZm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=iR2tK3Y/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2p+pM9X9E5Kxpa8DqWuY3aytKJcJ1TV5PmT9YbYcPb0=; b=ezTWdGRDqTAvfSvflUa7/hInrj
	iP/7207Ap8X4jbBOtxU/Lm4PRNt6ml8KZasBhoOjPsBjoHoIUpwTTwoENG3hKCrLZEW1Z/W+E01Tk
	dqe6kzeqObkyERaULk8IVfAG6nfwaA0N4aMIgYNACyo111cJA/nCtE8kulLFKNvgFphuGdLgv1xKD
	fhJboTAyx5ppHXeqwwOmOfBbp9Xlv/3HOWdp/F/7+X3ZbW53z5j1ZCfdYVFuCgHrGNz42ipKS+aw+
	fWJMzi36w081rVsbTDj+Bz1huy9P9NW+MDZvGcewMlJeas8RYVfrYI4+fQoISqXa83AgrcMdkt6Ph
	IAudAk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYg-00000001YNg-0uCV;
	Sun, 22 Nov 2026 18:45:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYc-00000001YMG-0HG1
	for linux-riscv@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wlw1svGMrjSyOsVhDZN+3pXfMCPyNzszcBB5icjp1ng=; b=bwLFaKZmtLobnHbwbHJlGyjuZ+
	UQd5gz72crcBFESc2aB3eHchsvymb26JksUi1ZCIVo1stLGbWkAzHkc3lDQ4yiMzGGxodcdZeuzJg
	6L78ziK7qbzK2xDaAbNE46ErUD4egYl5zpZJMs5eUFJ7YuZW6jYHLRRNhRYjV0t2g+yxPXWi21/JK
	l96eGxiyhql3A0ZnP3n8EDpsoiFhGJTASQcBsqkbtG0jmovFpbB3l3s3Cn2kKIps5aA7Wi/t8jG5n
	sSWfebhSVU7aOpfI+YijLIQm0iTXd+qnjeLysDhM/qc5eik6ETMNx7nH0PS5yuV8s3J+kLxtzrKL6
	6PtJ4uxg==;
Received: from retz.cirad.fr ([194.199.235.221])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYY-00000002R8D-407k
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 18:44:56 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 93A7E20DD5C1;
	Sun, 22 Nov 2026 19:44:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 65EE120DD202;
	Sun, 22 Nov 2026 19:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 65EE120DD202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795373089;
	bh=Wlw1svGMrjSyOsVhDZN+3pXfMCPyNzszcBB5icjp1ng=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=iR2tK3Y/S2/4lQgIxr70F7/QIwDFHg4OL8p7uqlRv9HZKlbZHOery4Gw5327vbRKz
	 icd6lLGlmLeGgSRburc3EtiE0UFypWelwsQZ+BIoJW6BKIG402/U1wqqQcyA9Y6uoF
	 3D8Qsd3jmYBe00ftVa05RQqFAyec8+On6y3/cRg6riQOOd9+MKa9iidRvpbdkEetsX
	 72e1vjSyFrgH/17PSHbtnnpq4W7X4riDDTs9pMaAWeAlKK7VsqPaUs4WVxMrPxeQVl
	 o+XDqNyursduK4ZN1AKmEIk5aKtlNYbCqbBUJdf/tbzZ/WI0n469kBKFePlhjN5NOy
	 jkEtNSP+qUTBQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id p24HhIr6dker; Sun, 22 Nov 2026 19:44:49 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id D0A3620DD5C1;
	Sun, 22 Nov 2026 19:44:47 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Baihui Liang <liangbaihui@linux.spacemit.com>,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
Date: Sun, 22 Nov 2026 19:44:33 +0100
Message-ID: <20261122184434.545341-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184454_986968_9421260C 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWtlciwKClRlc3RlZCBvbiBhIEJhbmFuYSBQaSBCUEktRjMsIG9uIHY3LjQtcmMxIHBsdXMg
WWl4dW4ncyBDQ1UgcG0tYXV4CnBhdGNoZXMgYW5kIHBtZG9tYWluIHY1IChhbmQgdGhlIHJpc2N2
IHJlYm9vdCBmaXgpLCB3aXRoIHRoZSBmaXJtd2FyZQpmcm9tIHlvdXIgbGluazoKCi0gdGhlIGdw
dSBwb3dlciBkb21haW4gdHVybnMgb24sIGZpcm13YXJlIHYxLjEgKGJ1aWxkIDY5NzY3MDIpIGxv
YWRzLAogIGFuZCBjYXJkMC9yZW5kZXJEMTI4IGFwcGVhci4gVGhlIEdQVSBpbnRlcnJ1cHQgKDc1
KSBmaXJlczsKLSBhIHJlYm9vdCBhZnRlcndhcmRzIGlzIGNsZWFuLgoKVHdvIG5vdGVzOgoKLSBP
biB2Ny40LXJjMSB0aGUgZHJpdmVyIHJlZnVzZXMgdGhlIEdQVSAoIlVua25vd24gR1BVISBTZXQK
ICAnZXhwX2h3X3N1cHBvcnQnIHRvIGJ5cGFzcyB0aGlzIGNoZWNrIik7IHdpdGgKICBwb3dlcnZy
LmV4cF9od19zdXBwb3J0PTEgaXQgd29ya3MgYXMgYWJvdmUuIElzIGEgZHJpdmVyIHBhdGNoCiAg
YWRkaW5nIHRoZSBLMSBHUFUgcGVuZGluZyBzb21ld2hlcmU/Ci0gVGhlIEdQVSBuZXZlciBydW50
aW1lLXN1c3BlbmRzOiBhZnRlciAxNjAgcyBpZGxlLAogIHJ1bnRpbWVfc3VzcGVuZGVkX3RpbWUg
aXMgc3RpbGwgMCBhbmQgdGhlIHBvd2VyIGRvbWFpbiBzdGF5cyBvbgogIChhdXRvc3VzcGVuZCA1
MCBtcykuIFRoYXQgbG9va3MgbGlrZSB3aGF0IEJhaWh1aSdzICJkcm0vaW1hZ2luYXRpb246CiAg
cmUtY2hlY2sgZmlybXdhcmUgaWRsZSBzdGF0ZSBiZWZvcmUgcnVudGltZSBzdXNwZW5kIiBmaXhl
cy4KCkkgY291bGQgbm90IHRlc3QgcmVuZGVyaW5nOiBEZWJpYW4gMTMncyBNZXNhICgyNS4wLjcs
IHJpc2N2NjQpIGhhcyBubwpQb3dlclZSIFZ1bGthbiBkcml2ZXIuCgpUZXN0ZWQtYnk6IEZyw6lk
w6lyaWMgTWFow6kgPGZyZWRlcmljLm1haGVAY2lyYWQuZnI+ICMgQlBJLUYzCgpGcsOpZMOpcmlj
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
