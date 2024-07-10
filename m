Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD856C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 01:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amLC/1Kt+oHJ2IreeivNys4jMzMXDbmXLaT7pJG1SzA=; b=vWSERy9C9xAH+p
	z5LIwvoUqkvaFOB6ysbihhVVdXsEnt+t6TYn7dJbqj4+5ii5HEHxGwR9kXK51j6ptIj0Z+nxf23DW
	Y7lWyohoMb7Y6YxH7vw8z2KPXh2pOK7Gpg/R5wgL/9IpxwesU1lwE15Vu7I9csc3Rbu4O/iLkskSf
	pPRE7MD0KH5LZst2peSdBKcNsmt+OtchqLqaFKKQy/M0DzkrSG0h3vJo2In7C/18TPqqVn/7MiKXY
	RwpzmtU22p6p156WC5OzpUdnIymFA/sN93+1OUk3Gt8jBxLJbDRZ/FTUQzCBb5Nw341zvVLIMzjy3
	73gq4vEwrp7Y55OC0rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRM4c-000000094jF-3psn;
	Wed, 10 Jul 2024 01:24:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRM4a-000000094io-2fcB
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 01:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7CB56172C
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 01:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC73C4AF0C
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720574683;
	bh=q5dWwx7Hau72uDTD4WM4Gz0XSuFn9V5fFjx9SvVggLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j/GPVjrPSBsWn8n9iuHzCfF+eVrvSmr3jbSyAL5SBMI1IAyWqpOZTy15xzyyszjQs
	 fUmpG4g/zLmeb1brcyybgmMHioElp5LtF+YQkyi+HnzYkCfKDpauB06R40AeAuQQBd
	 ulhj/IBDdxCaHYS6K2glagCEqJuwpYT83VpGzhV2ljbDLSHBSIuRU4M6X2KiQVtZk1
	 Id4pwUSONsGDH5m1OGOS5Vzl/wtilVUnxkQhacdhFa7prsQ6jEgh2B6qDs/ImiOVOl
	 gCjcMlGbETkCiftF+Ko7WiKtf3foQJMUGeae5j+Ij2nkgGXSEGgC45wu4jZ5Zn8n3e
	 8CZEpsjZFsrqg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea952ce70so3886641e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 18:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXN7i/MYOpn7dFtKhCWQSEHg7zVTpnze6XoX+zPz7+v27UmhLrv2apn1WLvRAoWusEMclz1NlxnK2XxoQ6csQ2PvuVid1WRsl9DcrKO9KvX
X-Gm-Message-State: AOJu0YwN56wJH8FqEjula/+ToqevF2tKpdUOu3s21QM4vl9UIRrugVX5
	N2SxrybWNgdmhU3ySIUZD0+IYZY/XdtYEGR4PCtEPgdHIw06U4UJLX18T2wNjLSxDXwFsfL8LRH
	Gc87NL7yVKSaNTZIMgPXqeDjoVKg=
X-Google-Smtp-Source: AGHT+IHuTEPpNnUYONCOpl+IWfuxcUj4f1EvwyV+OdovXyRGZ117REW3NpBuG1nTgBn5sDZOTO2Pr3187olb/f18ADA=
X-Received: by 2002:a05:6512:15a0:b0:52b:c089:4579 with SMTP id
 2adb3069b0e04-52eb99d1504mr2876768e87.49.1720574681757; Tue, 09 Jul 2024
 18:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240705060902.113294-1-alexghiti@rivosinc.com> <20240705060902.113294-3-alexghiti@rivosinc.com>
In-Reply-To: <20240705060902.113294-3-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 10 Jul 2024 09:24:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRPk_1b8gLQn4cmNT62Cdo2sKpXHB7vK2wDo74-NgZSPg@mail.gmail.com>
Message-ID: <CAJF2gTRPk_1b8gLQn4cmNT62Cdo2sKpXHB7vK2wDo74-NgZSPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: Check that vdso does not contain any
 dynamic relocations
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Vladimir Isaev <vladimir.isaev@syntacore.com>, 
	Roman Artemev <roman.artemev@syntacore.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_182444_777049_193B26F5 
X-CRM114-Status: GOOD (  14.29  )
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

T24gRnJpLCBKdWwgNSwgMjAyNCBhdCAyOjEx4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IExpa2Ugb3RoZXIgYXJjaGl0ZWN0dXJlcywgdXNl
IHRoZSBjb21tb24gY21kX3Zkc29fY2hlY2sgdG8gbWFrZSBzdXJlIG9mCj4gdGhhdC4KPgo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAt
LS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSB8IDkgKysrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28vTWFrZWZpbGUKPiBpbmRleCBjN2U0MGJmMzYzNzEuLmI1YzczMDg0ZTU1NCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby9NYWtlZmlsZQo+IEBAIC00NSw3ICs0NSw3IEBAICQob2JqKS92ZHNvLm86
ICQob2JqKS92ZHNvLnNvCj4KPiAgIyBsaW5rIHJ1bGUgZm9yIHRoZSAuc28gZmlsZSwgLmxkcyBo
YXMgdG8gYmUgZmlyc3QKPiAgJChvYmopL3Zkc28uc28uZGJnOiAkKG9iaikvdmRzby5sZHMgJChv
YmotdmRzbykgRk9SQ0UKPiAtICAgICAgICQoY2FsbCBpZl9jaGFuZ2VkLHZkc29sZCkKPiArICAg
ICAgICQoY2FsbCBpZl9jaGFuZ2VkLHZkc29sZF9hbmRfY2hlY2spCj4gIExERkxBR1NfdmRzby5z
by5kYmcgPSAtc2hhcmVkIC1TIC1zb25hbWU9bGludXgtdmRzby5zby4xIFwKPiAgICAgICAgIC0t
YnVpbGQtaWQ9c2hhMSAtLWhhc2gtc3R5bGU9Ym90aCAtLWVoLWZyYW1lLWhkcgo+Cj4gQEAgLTY1
LDcgKzY1LDggQEAgaW5jbHVkZS9nZW5lcmF0ZWQvdmRzby1vZmZzZXRzLmg6ICQob2JqKS92ZHNv
LnNvLmRiZyBGT1JDRQo+ICAjIGFjdHVhbCBidWlsZCBjb21tYW5kcwo+ICAjIFRoZSBEU08gaW1h
Z2VzIGFyZSBidWlsdCB1c2luZyBhIHNwZWNpYWwgbGlua2VyIHNjcmlwdAo+ICAjIE1ha2Ugc3Vy
ZSBvbmx5IHRvIGV4cG9ydCB0aGUgaW50ZW5kZWQgX192ZHNvX3h4eCBzeW1ib2wgb2Zmc2V0cy4K
PiAtcXVpZXRfY21kX3Zkc29sZCA9IFZEU09MRCAgJEAKPiAtICAgICAgY21kX3Zkc29sZCA9ICQo
TEQpICQobGRfZmxhZ3MpIC1UICQoZmlsdGVyLW91dCBGT1JDRSwkXikgLW8gJEAudG1wICYmIFwK
PiArcXVpZXRfY21kX3Zkc29sZF9hbmRfY2hlY2sgPSBWRFNPTEQgICRACj4gKyAgICAgIGNtZF92
ZHNvbGRfYW5kX2NoZWNrID0gJChMRCkgJChsZF9mbGFncykgLVQgJChmaWx0ZXItb3V0IEZPUkNF
LCReKSAtbyAkQC50bXAgJiYgXAo+ICAgICAgICAgICAgICAgICAgICAgJChPQkpDT1BZKSAkKHBh
dHN1YnN0ICUsIC1HIF9fdmRzb18lLCAkKHZkc28tc3ltcykpICRALnRtcCAkQCAmJiBcCj4gLSAg
ICAgICAgICAgICAgICAgICBybSAkQC50bXAKPiArICAgICAgICAgICAgICAgICAgIHJtICRALnRt
cCAmJiBcCj4gKyAgICAgICAgICAgICAgICAgICAkKGNtZF92ZHNvX2NoZWNrKQpUaGlzIGNoZWNr
IGlzIGhlbHBmdWwgZm9yIGZ1dHVyZSBkZXZlbG9wbWVudCBvbiByaXNjdiB2ZHNvLiBMR1RNIQoK
UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPiAtLQo+IDIuMzkuMgo+
CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
