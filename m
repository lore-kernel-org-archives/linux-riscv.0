Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A5D41C18
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uZfAu7dJfU0s5U5mUWAZNeopPODSevpfMPqiXdoIUCY=; b=ZLgtqlYGWiR+Rn
	buLLVVE0lEK+C7qYYW81tM9Zji+uOsnux4vWEC17oD9ibSVlzDS+mPGNazdPB+hRwCos+y59d/W++
	OorUgI+s0UnWmWiwxVnIJCvTfpPCCPMln3dlIup3mV3AbSVNK/fQFkCKulo27AcMAAsOPlA1jI21Z
	qjMXSWRlApKvWJiRkAUDNwKRAsFT4CCj9tXVgWvPQOY4TiKq1J6OKiE3YaBYp86KHlP0ckDKlSd6q
	uJISIfcAt8Djx7T5N1eoIgRixQ4jjY1F8c2p2z2wbW8pVWjgmy9n0/ia5pOXBX4Wudp5mYpq0mczF
	JSuYCZJZNyybf8hk63+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB97V-000000069a2-018M;
	Wed, 13 Nov 2024 08:53:01 +0000
Received: from mail.profitix.pl ([94.177.230.231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB96H-000000069Ud-0cat
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 08:51:46 +0000
Received: by mail.profitix.pl (Postfix, from userid 1002)
	id 5C03783249; Wed, 13 Nov 2024 09:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profitix.pl; s=mail;
	t=1731487903; bh=6TDZiAAFZJCkeBY8vRGZ8ogEhxB1fYD0p3QhXI5haxA=;
	h=Date:From:To:Subject:From;
	b=mcEDU7sdJN9LpetpdLzIe4hvA1G4r0mz8nnJMxFlmddNM459MpbxHMG05SUXK0aqy
	 9TiNJANyTPkMfkUzxFoaQ5aa00JGzBPcTe5niITLa+LYkhD5B7PzKz9L4BisOGpn59
	 eRz1RUe/1TsrlTNA32etAGQC/7tBbYrSHzc2rY6ZiNlHkYrycl5JG4/uTlg7V8MiJZ
	 hN0bsq4UrV4EVb1mcXgmSVphmWNiZiwEsU5eYn+ccy1jUQt10ov/oYUbSoFNI90tTU
	 0rj4+eCR/0hsHQsgvXQuAsgTxuzNEmUDX/255yJYfhf3NKMe32fh7xe9eDICtJzrnS
	 kmtmvTbpeuL1w==
Received: by mail.profitix.pl for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 08:50:40 GMT
Message-ID: <20241113084500-0.1.8.125s.0.di9d13fd8s@profitix.pl>
Date: Wed, 13 Nov 2024 08:50:40 GMT
From: "Robert Paczkowski" <robert.paczkowski@profitix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.profitix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005145_330257_A74B7B6D 
X-CRM114-Status: UNSURE (   1.51  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KUm9iZXJ0IFBhY3prb3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
