Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF8EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pbq9B9Qit99yLqqrECsx7LLj3ud0HNRRIFkFewqRczs=; b=V++uHcx+/JaxxX
	5CHqSDiVLZGLXUIPqGQIkbTZOIQjR89iAMcjmhurZdBkSVwdCD15HiQ9PmgyQ87Cd03Tj8tr8ZoZR
	umhfE5IDeT/xd3PrlOx+eJNXaf64fFGhKkz2Njrqt0NVuGzb+Xawm6iNzBNKcFZb15MoRNYBROdy9
	QKBOwQZoIQ3KJ3hXQO84Lqr5P2JoR4a5QCxSL9RIK/cpBDfnymBXSDEJpyodSMBgwINYVh4n02W04
	RsIQoQFhXpa5T2cXu5tON0mJtRPCgp9Xrj/OdlvEok3QrgDss6sd1CeVj/v7aOKRyXDkGHf0GuRYY
	9xsxytXAdujTxoMr/VZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzsA-005M5j-1G;
	Wed, 19 Jul 2023 05:37:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzs9-005M4k-1v
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z51jEWse09xkkV55FZopIhDy4gD0QyHhDnhthR/flug=; b=IB/m4VtrS4/sUxuh6U5uJqGgEA
	S5KMfyL0IrIh7ut5QqC0qm6IZKnjTBkw0VD4f+dmhz6MFP+YkrRDmFq7G2MOP2/JCltzIT5Nx8ITp
	KrBjYAu15CEcFglc6PbQ/n0aqHSDhbkFmRvASh48CFiAOnmliO49XAlNwdVxMLPOfTCwE7UhTFVyG
	IxyHuJWohFGJotUtHJZbf8qiLOY0qAeeOJo1hNrGiR4MKtb8yEKqJxgEDEkO5dxEZGp7RU8hqoisH
	sYmIgRCji5mIiI8fR1IOlhlRMSmgmMGSDj8GVH25VovQcNbNNP2gvMSawvx7ssUNYcnA+xQV8EMlm
	akhBVXqw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLqU8-00BwNM-1X
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 19:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8420660AFE;
	Tue, 18 Jul 2023 19:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76708C433C7;
	Tue, 18 Jul 2023 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689708939;
	bh=1egJyzR6y/L4MZT/n7f53P/+YJM8/Awvoyio2kgGnUw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K/oKj3a7ep1WSBGY2mbv2PgH66luRF/ngNMoNiW/uza/dMtXC1p+4sW2QI+cZ+DOg
	 gokQCdSZEIOq1q3oXZHYpinwik5G+DjzGn0O6QEYh9NeTJWUp68yVSKac/0KaHaGuA
	 5evK6x4Q7QBL/si/+bmsSGiYMEMN4W9K1lmUcQMMUh6N+hnx2ZkD+cMl+j+P7d0thS
	 PHD7JTFnWfejg2kSJ9Ed1Emjf+zS1h+ipWuEO2PyCU9M7RH9zixsluwUb+Fce5YBhF
	 WYKRf/454lDhmrQxEaHpk2m2vugSaf3suxiZUTlBivzt1m5pl8isTBf0iOC6s41T70
	 Pjv11veAETYog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, =?utf-8?B?QmrDtnJu?=
 =?utf-8?B?IFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2] riscv: entry: set a0 prior to
 syscall_enter_from_user_mode
In-Reply-To: <20230718162940.226118-1-CoelacanthusHex@gmail.com>
References: <20230718162940.226118-1-CoelacanthusHex@gmail.com>
Date: Tue, 18 Jul 2023 21:35:37 +0200
Message-ID: <87pm4p2et2.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_203550_572721_71CE9BBF 
X-CRM114-Status: GOOD (  10.12  )
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

Q2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKCj4gV2hlbiB3
ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMgd3Jvbmcg
dmFsdWUuCj4gSWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRl
ciBmMGJkZGY1MDU4NmQsIHdlIHdpbGwKPiBnZXQgRU5PU1lTIGluc3RlYWQuIFdlIGdvdCBzYW1l
IHJlc3VsdCB3aXRoIDljMjU5OGQ0MzUxMCAoInJpc2N2OiBlbnRyeTogU2F2ZSBhMAo+IHByaW9y
IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSIpLgo+Cj4gQWZ0ZXIgYW5hbHlzaW5nIGNv
ZGUsIHdlIHRoaW5rIHRoYXQgcmVncy0+YTAgPSAtRU5PU1lTIHNob3VsZCBiZSBhZHZhbmNlZCBi
ZWZvcmUKPiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIHRvIGZpeCB0aGlzIHByb2JsZW0u
IEluIF9fc2VjY29tcF9maWx0ZXIsIHdoZW4KPiBzZWNjb21wIHJlamVjdGVkIHRoaXMgc3lzY2Fs
bCB3aXRoIHNwZWNpZmllZCBlcnJubywgdGhleSB3aWxsIHNldCBhMCB0byByZXR1cm4KPiBudW1i
ZXIgYXMgc3lzY2FsbCBBQkksIGFuZCB0aGVuIHJldHVybiAtMS4gVGhpcyByZXR1cm4gbnVtYmVy
IGlzIGZpbmFsbHkgcGFzcwo+IGFzIHJldHVybiBudW1iZXIgb2Ygc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZSwgYW5kIHRoZW4gaXMgY29tcGFyZWQKPiB3aXRoIE5SX3N5c2NhbGxzIGFmdGVy
IGNvbnZlcnRlZCB0byB1bG9uZyAoc28gaXQgd2lsbCBiZSBVTE9OR19NQVgpLgo+IFRoZSBjb25k
aXRpb24gc3lzY2FsbCA8IE5SX3N5c2NhbGxzIHdpbGwgYWx3YXlzIGJlIGZhbHNlLCBzbyByZWdz
LT5hMCA9IC1FTk9TWVMKPiBpcyBhbHdheXMgZXhlY3V0YWJsZS4gSXQgY292ZXJlZCBhMCBzZXQg
Ynkgc2VjY29tcCwgc28gd2UgYWx3YXlzIGdldAo+IEVOT1NZUyB3aGVuIG1hdGNoIHNlY2NvbXAg
UkVUX0VSUk5PIHJ1bGUuCgpJc24ndCBzb21ldGhpbmcgbGlrZS4uLgoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4
IGY5MTBkZmNjYmY1ZC4uMTVhOGI0ODk4YTZjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTI5Nyw3ICsyOTcs
NyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfYnJl
YWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2Vj
dGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAlpZiAo
dXNlcl9tb2RlKHJlZ3MpKSB7Ci0JCXVsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKKwkJbG9uZyBz
eXNjYWxsID0gcmVncy0+YTc7CiAKIAkJcmVncy0+ZXBjICs9IDQ7CiAJCXJlZ3MtPm9yaWdfYTAg
PSByZWdzLT5hMDsKQEAgLTMwNiw3ICszMDYsNyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3Ry
YXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAog
CQlzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsK
IAotCQlpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQorCQlpZiAoc3lzY2FsbCA+IC0xICYmIHN5
c2NhbGwgPCBOUl9zeXNjYWxscykKIAkJCXN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsK
IAkJZWxzZQogCQkJcmVncy0+YTAgPSAtRU5PU1lTOwoKCi4uLmVhc2llciB0byByZWFkPwoKCkJq
w7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
