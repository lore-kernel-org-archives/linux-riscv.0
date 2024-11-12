Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFECDD32D9A
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EEq4yiD5eDwd2ILklOECMeB9QnWEPGBUcumxBlyQBY=; b=BJEuONj318PXsU
	W8pkQxVg6XL+k8ofDh1jubVGdqeksqoCYutccZh0jrsqO4Awn1YOamV/ZJ00FXsK2siftkZPdaBrY
	Bf4b8ZL0+POyt2c2XLgrcWqQN6SfbJwsRtgDaZ3UsRNF84Hhe+tzZ4z9NTwIy21+FYIoGp+JYRUid
	EgkipTN1X/wX1rjYqXp09t5Tn/dqa6ab3q+VyhYEnbqWtHiR1gN6MZIoa0UlxDvYFGN4C1x/O8Af7
	tfFlwnUrcy0urGSmI+tNyHBj9GrBDDeRjcm+f1q1dKqZdzaqeg5c2B1xTR47sJApK8bgeIOoVA+/X
	1fuZl+xazT9/NL6id1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApQY-00000003IJf-10IG;
	Tue, 12 Nov 2024 11:51:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApCa-00000003Fae-2YCZ
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 11:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 524DC5C4A09;
	Tue, 12 Nov 2024 11:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0539BC4CECD;
	Tue, 12 Nov 2024 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731411415;
	bh=+50FJGKdMdt7/QBZZo9VkQ5mGbZlOo68kDdHC+pjOa8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T+jFAjy52Z8t8R5fvwoK+XP6rKli9GFcPqJA38QvFmbllvWaJNkLV+ryiioUi8csq
	 LDr5ctH6/dxkIehO0px6gixHtAdIduiNObraFQPQ8bbOREjhhR0YZRp99dxNDUz7Mc
	 vLtS6pJnK2oKgMagVZwPXWo9s0pRPAmp1+dexz+aY/9rgky/hbq1jj1mKzGte+QyJS
	 +2vmrffmodqalD+QMGHRlz0iW1C0zu1/3MCUmLd2AAIvYYX1Sl2I5rbAioHJHMkbwj
	 oM3PQjwLSdjEsw9e2u6feWrAR8ci6xd7aYSmRtkm7g2p/sRRF5dGEWcJSnpuNIu8ze
	 Zp6cHHT0VMCcg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andreas Schwab <schwab@suse.de>, Alexandre Ghiti <alex@ghiti.fr>, Palmer
 Dabbelt <palmer@dabbelt.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: linux-riscv@lists.infradead.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
In-Reply-To: <mvmbjymxdsc.fsf@suse.de>
References: <mvm5xq44bqh.fsf@suse.de>
 <d380fd10-ebc4-4d66-becb-13995372d41a@ghiti.fr> <mvmfrnyxg2n.fsf@suse.de>
 <26452229-7461-48aa-987a-28444ace4f28@ghiti.fr> <mvmbjymxdsc.fsf@suse.de>
Date: Tue, 12 Nov 2024 12:36:51 +0100
Message-ID: <87h68cu1ik.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033656_706112_8BD2D58A 
X-CRM114-Status: UNSURE (   7.67  )
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

QW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cml0ZXM6Cgo+IE9uIE5vdiAxMSAyMDI0
LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4KPj4gSW5kZWVkLCBCam9ybidzIHBhdGNoZXMgZGlk
IG5vdCBtYWtlIGl0IGludG8gcmM3Li4uCj4KPiBUaGF0IG5lZWRzIHRvIGJlIGZpeGVkIEFTQVAh
CgpPaywgaWYgd2Ugd2FudCB0byB1bmJyZWFrIHRoZSB0b29scyBidWlsZHMsIHR3byBzZXJpZXMg
YXJlIHJlcXVpcmVkIGZvcgo2LjEyLgoKWzFdIHdoaWNoIGFkZHJlc3NlcyB0aGUgYXNtL2ZlbmNl
LmggcGF0aCBpc3N1ZQpbMl0gd2hpY2ggYWRkcmVzc2VzIHRoZSBzYW1lIGlzc3VlLCBidXQgZm9y
IG5vbi1jcm9zcyBidWlsZHMKClsyXSBjYW4gYmUgcHVsbGVkIHRvIFJJU0MtViBmaXhlcywgYnV0
IFsxXSByZXNpZGUgaW4gdGhlIGJwZi1uZXh0IHRyZWUKKHRhcmdldCA2LjEzKS4gRGV0YWlscyBo
ZXJlOiBbM10uCgpUbyByZWl0ZXJhdGUgd2hhdCBJIGFza2VkIEFuZHJpaSwgYnV0IGZvciBSSVND
LVYgZml4ZXM6IFdvdWxkIGl0IGJlCnBvc3NpYmxlIHRvIHB1bGwgdGhlc2UgcGF0Y2hlcyBbMl0g
aW50byB0aGUgUklTQy1WIHRyZWUsIGhhdmluZyBhCmR1cGxpY2F0ZSBzZXQgaW4gYnBmLW5leHQ/
IE9yIGFyZSB3ZSBzdHVjayB3aXRoIHN0YWJsZSBiYWNrcG9ydGluZywgYXMKQW5kcmlpIHN1Z2dl
c3RzPwoKCkJqw7ZybgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MjQwOTI3MTMxMzU1LjM1MDkxOC0xLWJqb3JuQGtlcm5lbC5vcmcvClsyXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MTEwNjE5MzIwOC4yOTAwNjctMS1iam9ybkBrZXJu
ZWwub3JnLwpbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FFZjRCelpi
cTlPd1NHaTRwZGI1X3E4WWtFcmZGaVFGS1lYZzNnMXJqcGRlamFmeCtRQG1haWwuZ21haWwuY29t
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
