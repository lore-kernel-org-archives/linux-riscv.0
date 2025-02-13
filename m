Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E68C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eD7Gu3zb9MMq45Kqt51/ujadZAzeIuSz/+VVCzMYZ1g=; b=vt/Y9nugWRV1kQ
	oiAAWS8HcTqrokrqupwRv+Nx2FoOyCa4fANeFcKrGHSk0CvIm2I0167G+hnyj3JhKtESFPUBnUWfq
	1NCv8DXjLhUmCbkhQN3W5PHeEucMqZ43+d7h0paCJ7fTj6uttJvhKieGUkviXHXOzm48NnwWsUNBm
	GDW9SGLgKS+pkRGJPT0JQvxQ51qTvN0wsTtT7C2Qh815viswcLN2Hyjv6XI+lEZIbx70j2A/mMBpb
	p0MQrrf87bOWf5QkM43bIj1izE+4znTVuVY9fjTeqmKlXoRtLc1qRl1noQD4mcV5G9dTjyqozqOjw
	3CGNaBnMRL9mWevNXMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYDo-0000000AzFS-1YhP;
	Thu, 13 Feb 2025 12:21:36 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYCM-0000000Az5I-0X7a;
	Thu, 13 Feb 2025 12:20:07 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yttkn0dgsz9sSd;
	Thu, 13 Feb 2025 12:49:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULQcwcXgFYio; Thu, 13 Feb 2025 12:49:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yttkm6p6Zz9sSL;
	Thu, 13 Feb 2025 12:49:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2E088B770;
	Thu, 13 Feb 2025 12:49:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TnojPLtBnGgu; Thu, 13 Feb 2025 12:49:20 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8115F8B763;
	Thu, 13 Feb 2025 12:49:19 +0100 (CET)
Message-ID: <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
Date: Thu, 13 Feb 2025 12:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Steven Price <steven.price@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_042006_338445_0C67A57D 
X-CRM114-Status: UNSURE (   7.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxMy8wMi8yMDI1IMOgIDEyOjIzLCBTdGV2ZW4gUHJpY2UgYSDDqWNyaXTCoDoKPiBPbiAx
My8wMi8yMDI1IDA0OjA5LCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4gUGxhdGZvcm1zIHN1
YnNjcmliZSBpbnRvIGdlbmVyaWMgcHRkdW1wIGltcGxlbWVudGF0aW9uIHZpYSBHRU5FUklDX1BU
RFVNUC4KPj4gQnV0IGdlbmVyaWMgcHRkdW1wIGdldHMgZW5hYmxlZCB2aWEgUFREVU1QX0NPUkUu
IFRoZXNlIGNvbmZpZ3MgY29tYmluYXRpb24KPj4gaXMgY29uZnVzaW5nIGFzIHRoZXkgc291bmQg
dmVyeSBzaW1pbGFyIGFuZCBkb2VzIG5vdCBkaWZmZXJlbnRpYXRlIGJldHdlZW4KPj4gcGxhdGZv
cm0ncyBmZWF0dXJlIHN1YnNjcmlwdGlvbiBhbmQgZmVhdHVyZSBlbmFibGVtZW50IGZvciBwdGR1
bXAuIFJlbmFtZQo+PiB0aGUgY29uZmlncyBhcyBBUkNIX0hBU19QVERVTVAgYW5kIFBURFVNUCBt
YWtpbmcgaXQgbW9yZSBjbGVhciBhbmQgaW1wcm92ZQo+PiByZWFkYWJpbGl0eS4KPiAKPiBbLi4u
XQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1X2Fkc19kZWZjb25m
aWcgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZwo+PiBpbmRleCA3
NzMwNmJlNjJlOWUuLmRiMDA1NjE4NjkwYiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Nv
bmZpZ3MvbXBjODg1X2Fkc19kZWZjb25maWcKPj4gKysrIGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3Mv
bXBjODg1X2Fkc19kZWZjb25maWcKPj4gQEAgLTc4LDQgKzc4LDQgQEAgQ09ORklHX0RFQlVHX1ZN
X1BHVEFCTEU9eQo+PiAgIENPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKPj4gICBDT05GSUdfQkRJ
X1NXSVRDSD15Cj4+ICAgQ09ORklHX1BQQ19FQVJMWV9ERUJVRz15Cj4+IC1DT05GSUdfR0VORVJJ
Q19QVERVTVA9eQo+PiArQ09ORklHX1BURFVNUD15Cj4gCj4gSSdkIHN1Z2dlc3QgZHJvcHAgdGhp
cyBmcm9tIHRoZSBkZWZjb25maWcgdG9vLCBqdXN0IGxpa2UgcGF0Y2ggMSBkcm9wcGVkCj4gaXQg
ZnJvbSBkZWJ1Zy5jb25maWcuCj4gCgpUaGFua3MgZm9yIHNwb3R0aW5nIHRoYXQuCgpUaGF0IG9u
ZSBpcyB3cm9uZy4gV2FzIGludHJvZHVjZWQgYnkgY29tbWl0IGQyMTBlZTNmZGZlOCAKKCJwb3dl
cnBjL2NvbmZpZ3M6IFVwZGF0ZSBjb25maWcgZmlsZXMgZm9yIHJlbW92ZWQvcmVuYW1lZCBzeW1i
b2xzIikgCndoaWNoIGFpbWVkIGF0IGZpeGluZyBjb21taXQgZTA4NDcyODM5M2E1ICgicG93ZXJw
Yy9wdGR1bXA6IENvbnZlcnQgCnBvd2VycGMgdG8gR0VORVJJQ19QVERVTVAiKSBidXQgaXQgZGlk
IGl0IHdyb25nLgoKSXQgaXMgQ09ORklHX1BURFVNUF9ERUJVR0ZTIHRoYXQgaXMgd2FudGVkLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
