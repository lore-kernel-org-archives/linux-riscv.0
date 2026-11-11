Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81839606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u42gSkjF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=NmOYxAAT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W7HoDdOFHFmJKJ63JgfBPlVUmenSvoiVFTn8w2/jYjc=; b=u42gSkjFAa8Ulg5a1uGviCI1+R
	kAtsCJrrUx8w/ecT8N596Apd4hNhniu3s2HFZdtSNXX7heKvuQSgQ5wKGVS5oLp2gJyBLCuQGr9Nf
	VLCl+GMdGr2tWPTM9J/sL0xLPpH+A98T96GBq+zjUXvcd/wZC84tUQFdACESD8LagsksM03rqRcom
	8NBRjXlkWOFOqNpOBhvWx7J5hJpVX/+oC+43I2FvstK/luliaYEjcKvYp/J24o+mQENCP4Bv67YoG
	8/+xc4M/ONkmuECnDCXVGR77D3le6Cbp927gt2s5Hj2POrLFInGEgtQcctbWf+XsyuZpzAyyaoQV1
	pwHNPqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4yO-00000006FY7-2kFB;
	Wed, 11 Nov 2026 09:50:32 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4yM-00000006FXF-29F9
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:50:31 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id CC9EC20DCBFB;
	Wed, 11 Nov 2026 10:50:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id AC12F20D7CEE;
	Wed, 11 Nov 2026 10:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr AC12F20D7CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794390628;
	bh=eLu1xb+NMDTuiY/+RyWofsl80izFbG+riI3quVrTUhk=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=NmOYxAATRQROalXzPOcW+uo9n+nMssOvmsRkXb0DAVG3l/l0deKnvWFOACnKun5VG
	 48J8nouprXrwEg1afhWvj/9D+eI20LY3aQmvTWNmruMmpkozUBvDamHHra9VtgSVoJ
	 Z+IKjNMmcbGLDdNvpe/uvkrz8jEbm/y0yeCVwLBuq7ovTQ/oOWk6mui6WSO8YE10Qt
	 PsNiEe21xUaobr0BRokPdcuPsNKgXW5ULRVE0w84Bjj/dgyUjHIQuwXlzJhpAYnHJw
	 jyZeN5EWurSkn9nHLb5SJ/8rKTTV32s5DQmViMYK5+9MuxZfMlz0WJbATC/e4+PspZ
	 6YVCKjtIUDOpQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id le9kw9Hd74oC; Wed, 11 Nov 2026 10:50:28 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 932AA20DCBFB;
	Wed, 11 Nov 2026 10:50:27 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
Date: Wed, 11 Nov 2026 10:50:01 +0100
Message-ID: <20261111095001.444031-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DMRED3CXA5IJ.3FLQ7UFUTN0R9@linux.spacemit.com>
References: <20261110074607.363918-3-frederic.mahe@cirad.fr> <DMRED3CXA5IJ.3FLQ7UFUTN0R9@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_015030_709955_CE450B77 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMDg6NDQ6MzZBTSArMDAwMCwgVHJveSBNaXRjaGVsbCB3
cm90ZToKPiBQbGVhc2UgYWRkIENMS19TTE9XX1VBUlQyIHRvIGFzc2lnbmVkLWNsb2NrcyBhbmQg
c2V0IGl0IGV4cGxpY2l0bHk6Cj4KPiAJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MD4sIDw0ODAw
MDAwMD47CgpUaGFua3MsIGRvbmUgaW4gdjI6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NjExMTEwOTQ1NTcuNDQzNDgxLTEtZnJlZGVyaWMubWFoZUBjaXJhZC5mcgoKSSBjaGVja2VkIHRo
YXQgdGhlIHJhdGUgaXMgcmVhbGx5IGFwcGxpZWQ6IHdpdGggMjQgTUh6IGluIHRoZSBEVCwKc2xv
d191YXJ0MiBydW5zIGF0IDI0IE1Iejsgd2l0aCA0OCBNSHosIEJsdWV0b290aCB3b3JrcyBhcyBi
ZWZvcmUuCgpGcsOpZMOpcmljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
