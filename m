Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B864CA0FFD
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3l9sJlzRFsMi3ng+JdJJhB2xcHZ1r9tCRoNHPydGbY=; b=ub8JCkZU5w3Xvi
	dljHeehzBQBvRBBEoDib8rfCsq7Thcm5FsaXDR2w2MJndQz78htEaRQmr2dNa44Z8AHFC9M4Nfpfv
	lKlmbDIvMxsVOz4u7rCXecq57+oiQT2lirDxlRJI8kL4DRS3/c5UyLeeGCjYj0ATEbK8GerIuDvJH
	Asf07V7W9yhDvRFS/RfFBw6sPnnhPfRo3FUYnKUJyZYy3aPbV7SCmSaPACmCdbjsOP3hf/RLQyuWb
	H4Hl+2XqiiPTQZlcebN3InLK/AOzF2yknanFKTvtZmXSQwPggF2FYFYmG9TEWP9+WdAIvWQHe2fEc
	zKwXJUNbAp9hvbVSLw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usKdk-00000007rVB-0kS7;
	Sat, 30 Aug 2025 12:25:04 +0000
Received: from mx2.inter.hu ([88.99.86.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usKdg-00000007rUb-3EHJ
	for linux-riscv@lists.infradead.org;
	Sat, 30 Aug 2025 12:25:01 +0000
Received: from mx2.inter.hu (localhost [127.0.0.1])
	by mx2.inter.hu (Postfix) with ESMTP id A1309161ED6
	for <linux-riscv@lists.infradead.org>; Sat, 30 Aug 2025 13:57:18 +0200 (CEST)
Received: from [45.138.16.152] (unknown [45.138.16.152])
	(Authenticated sender: vecseii@martonyi.hu)
	by mx2.inter.hu (Postfix) with ESMTPSA id CEACA1810F2
	for <linux-riscv@lists.infradead.org>; Sat, 30 Aug 2025 13:48:59 +0200 (CEST)
From: vecseii@martonyi.hu
To: linux-riscv@lists.infradead.org
Subject: xls
Date: 30 Aug 2025 04:48:59 -0700
Message-ID: <20250830044859.DA1B2286F383D527@martonyi.hu>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_052500_966374_D71497C6 
X-CRM114-Status: UNSURE (  -0.15  )
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
Reply-To: info.superenalotto@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2lyIGZyZXVlbiB1bnMsIElobmVuIG1pdHRlaWxlbiB6dSBrw7ZubmVuLCBkYXNzIFNpZSB6dSBk
ZW4gCkdld2lubmVybiBkZXIgasO8bmdzdGVuIFN1cGVyRW5hbG90dG8tWmllaHVuZyBpbiBadXNh
bW1lbmFyYmVpdCAKbWl0IExvdHRvMjQsIEV1cm9NaWxsaW9ucyB1bmQgUG93ZXJiYWxsIGdlaMO2
cmVuLiBTaWUgaGFiZW4gZWluZW4gCmVpbm1hbGlnZW4gR2V3aW5uIHZvbiDigqwzLjg1MC4wMDAg
IGluIGRlciB6d2VpdGVuIEdld2lubmtsYXNzZSAKZ2V3b25uZW4uIFVtIElocmVuIEdld2lubiBh
Ynp1d2lja2Vsbiwgc2VuZGVuIFNpZSB1bnMgYml0dGUgCmZvbGdlbmRlIEluZm9ybWF0aW9uZW4g
cGVyIEUtTWFpbDoKClZvbGxzdMOkbmRpZ2VyIE5hbWU6IExhbmQ6IFdvaG5hZHJlc3NlOiBBbHRl
cjogR2VzY2hsZWNodDogQmVydWY6IApIYW5keW51bW1lcjogV2hhdHNBcHAtTnVtbWVyLgoKSW0g
TmFtZW4gZGVyIE9ubGluZS1Mb3R0ZXJpZWFidGVpbHVuZ2VuIFN1cGVyRW5hbG90dG8sIApFdXJv
TWlsbGlvbnMgdW5kIFBvd2VyYmFsbCBncmF0dWxpZXJlbiB3aXIgSWhuZW4gaGVyemxpY2ggenUg
CklocmVtIEdld2lubi4KCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4KCkZyYXUgS2F0aGVyaW5l
IEZlZGVyaWNvCkxlaXRlcmluIE9ubGluZS1aYWhsdW5nZW4gLyBWYWxpZGllcnVuZ3NtYW5hZ2Vy
aW4KQ29kZS1OYWNocmljaHQ6IDczN0dIUzk4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
