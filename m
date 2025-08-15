Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3155CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCFJmKOheCF9BntQAVsuxkFZ7rvj5sVF8Jq0Z5rM7ZY=; b=LXByPu/1JOmMIs
	4fyQ+ao0WHr5mmf1RJQenKLDlfb6yE/+OUFNNeMynqIUGgnnKR5zHZf23L8lIs5v2cWhZYzrBlBkg
	uU1Je1KlTffkjkFfqTYncVhbbEkNAvTTYmanZ1VIPTRNBkBqj2rB3Rxj6hX6TaQcSvhD6iU66geu7
	wSBLJ6Ga39WtV/ks60wZ9g1gDIb1JUrXhnAlNdi8QaPXrTRHzhex1MVIOMF3KGF4mFBnWbw20Fj04
	+YjV1YpCrkpbZTOIzZAjRNCpiHm4ICXMURXaWHAIJYV3Xhyky0kPuI9FzOCEUGzP6W7/rDhtKHVXO
	VC52RduVVTiixAfyu56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsZx-00000002KcD-44ao;
	Fri, 15 Aug 2025 11:26:37 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqLr-00000001yeS-23pM
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 09:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755248606; x=1755853406; i=markus.elfring@web.de;
	bh=5A1pHi5q147zdLtCh1MvpigZUxlgTHZvMdjlqbARl8M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sEz3ybu3jwwAb0XUplW2LhdC6sWAy7uWvqRFxP63436Z6AA3toS3R3yYxIxbauw4
	 tG4QOxNlX3mIl6ymIKXUn7HLjEN/bXRrUqm+ydVf+mg6qC8hC+nCTA/afN59oOIEE
	 Qxvh/5AEerwsyMu89TJ+b+Y9Zb5ujaGZUjEpngykmzHJBt4Ox4OfASCF+vq/11Ufp
	 IZYqq2z8WZl/gWvRTu5xadmuOPvXF2MVSeMWWSX6cXv+/BwkdkzCohzEaNeNen7Za
	 pbr4BMGvAsWjpHDbzPirgXNsYdf9iTzwAsgRBEisc5tQlxqduMAJ/6YCYSfTFjquL
	 y5xdCtY3hTuI2WUGhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.211]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumJF-1uUl811FMx-00r7VW; Fri, 15
 Aug 2025 11:03:26 +0200
Message-ID: <6fa2678f-5c50-4abd-96af-1f6c4039185c@web.de>
Date: Fri, 15 Aug 2025 11:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/riscv: prevent NULL deref in iova_to_phys
To: XianLiang Huang <huangxianliang@lanxincomputing.com>,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Will Deacon <will@kernel.org>
References: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
X-Provags-ID: V03:K1:sTW5AmiB7XhDP3iS9aklFSXqPQEy19gNJKR6cnP5t6/o98sWblq
 eUAfXYIjP90puyqxTD+0qswGmGvsuHu9NQAV6ncw69XGB1BIQ4/Gb4PiqUDOlMryH792zt7
 30UCn2VJOTKEnfmzGbbcxWoa2szMfKir4/vs9Y4vafGTA4SkDfdxbWqPPxnkZnkGSi3E3zZ
 BW2xwFhfW/KtDK74LWz1A==
UI-OutboundReport: notjunk:1;M01:P0:RBNmF5uF59M=;fYcJ2vMRYVFfZsW0pZHMsR3J2+n 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 weIwujT8ZP9eEVW0dXS10zeyXRUZ69K0ca2QF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020355_901481_0AB13DDC 
X-CRM114-Status: UNSURE (   3.75  )
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

4oCmPiByaXNjdl9pb21tdV9pb3ZhX3RvX3BoeXMoKSBmYWlsZWQgdG8gaGFuZGxlIE5VTEwgcmV0
dXJucy4gRml4IGJ5IGFkZGluZyBOVUxMCj4gY2hlY2sgYmVmb3JlIGRlcmVmZXJlbmNpbmcgYW5k
IHJldHVybmluZyAwIGZvciBpbnZhbGlkIGlvdmEuCuKApj4gLS0tCj4gQ2hhbmdlcwo+IHYzOgo+
IC0gUmVtb3ZlIHJlZHVuZGFudCBwdGUgdmFsaWRhdGlvbiBpbiByaXNjdl9pb21tdV9pb3ZhX3Rv
X3BoeXMKPiAtIEltcHJvdmUgc3ViamVjdCBsaW5lIHRvIGVtcGhhc2l6ZSBwcmV2ZW50aW9uCuKA
pgoKUmVwZXRpdGlvbjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9lZmZiMjliZS02ZDE0
LTQ3ZTUtYWI3MS00NTQxMTk0Njc3NTBAd2ViLmRlLwoKV291bGQgYSBzdW1tYXJ5IHBocmFzZSBs
aWtlIOKAnFByZXZlbnQgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIHJpc2N2X2lvbW11X2lv
dmFfdG9fcGh5cygp4oCdCmJlIG5pY2VyIGFueWhvdz8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
