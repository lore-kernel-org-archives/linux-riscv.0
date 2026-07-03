Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE8AC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 20:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0luvEKrY/MQiqJ5nEe9Pmvn26NdqiYUsyMZ9kgOJIzw=; b=4wAEcPd15HCsnD
	bO4mQUYQ0dWFC2SqVN/RkvF4D80GJHzNa35XQ4jmimLamQiFZYEoklI7AXxsxD8XQnyVyFJRFPq38
	2X7DydlktF063pMk05Zi1SfTZ5TNS6DefcZpIHPHlZqdZ2vhmZn0NkmHHLS55TU5r8qf58NNSlkCV
	+fGgwOxGb0ETUJULT1lcVKc4IInanFX5IyGrvCQ5fiJ0g22cXXMKbp3OYyZ5uvQNIfISF5jnlPGrs
	8lXb2tOdKljlxBq8bi854wve4mjFje8CHZIb3VfAWEAEcDTumQI0Ckzircf3ZAKs5w3Zef6SqJME2
	fBxrvSIgf+PkwHPp7ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfksU-00000007tQj-1eMS;
	Fri, 03 Jul 2026 20:52:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfksS-00000007tPo-1P2y;
	Fri, 03 Jul 2026 20:52:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A304600B0;
	Fri,  3 Jul 2026 20:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A6E1F00A3E;
	Fri,  3 Jul 2026 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111965;
	bh=qc6RQIMJ3TCgtwMlpFywp2lkPnh2VJAI6hIxptvIyMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=m/AEFhD/QQMVr60LVSSrHBJhZzSHloaCLPk21mBJcgCOInHXk9skqaY/SzJJ84tEX
	 UmT6M2g7SmZe+Xfl7u66KmHjHFowNBAw9iuDKrQPpkA0d+AKOFoNGiI4ScRdGq9tzV
	 5Bw71e6tMbrrNqTc7h68y+P8wFXYypmrKhsg4IoUL3B2t/kFt2ZfrsDK6qF5Axq7m+
	 0X+YpoR5DWk7RItGPbLuh218SieWYIlmdker7qyk9wbsyvgoZgAjV4Uu3czl1MVLAt
	 DcAB4UvUtBhMMozkhoRv21B/k0znEvzlBngIXWCHw9H0yTbipW6aseVsPvTnj3WZDs
	 DRMEjZMu/EqhQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Mark Rutland <mark.rutland@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, geert@linux-m68k.org, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, luto@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 chris@zankel.net, jcmvbkbc@gmail.com, peterz@infradead.org,
 wad@chromium.org, thuth@redhat.com, ada.coupriediaz@arm.com,
 linusw@kernel.org, yeoreum.yun@arm.com, song@kernel.org,
 james.morse@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 liqiang01@kylinos.cn, pengcan@kylinos.cn, ryan.roberts@arm.com,
 yangtiezhu@loongson.cn, sshegde@linux.ibm.com, mchauras@linux.ibm.com,
 austin.kim@lge.com, jchrist@linux.ibm.com, arnd@arndb.de,
 thomas.weissschuh@linutronix.de, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org,
 x86@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to
 return boolean
In-Reply-To: <fa1f5b39-2703-40a1-81d6-3feba87e19b0@arm.com>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <akdp6GAu77-ipsXA@kunlun.suse.cz> <87cxx4mmim.ffs@fw13>
 <akeIK5TRCjlKbzbp@J2N7QTR9R3> <akeOjqMy7HVgRRCr@kunlun.suse.cz>
 <fa1f5b39-2703-40a1-81d6-3feba87e19b0@arm.com>
Date: Fri, 03 Jul 2026 22:52:43 +0200
Message-ID: <87echjlrs4.ffs@fw13>
MIME-Version: 1.0
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

T24gRnJpLCBKdWwgMDMgMjAyNiBhdCAxMzo1OSwgS2V2aW4gQnJvZHNreSB3cm90ZToKPiBPbiAw
My8wNy8yMDI2IDEyOjI3LCBNaWNoYWwgU3VjaMOhbmVrIHdyb3RlOgo+Pj4gSWYgd2UncmUgY2hh
bmdpbmcgdGhlIHJldHVybiB0eXBlLCBpdCBtaWdodCBiZSB3b3J0aCByZW5hbWluZyB0aGUKPj4+
IGZ1bmN0aW9uIHNvbWV0aGluZyBsaWtlOgo+Pj4KPj4+IAlzZWNjb21wX3Blcm1pdHNfc3lzY2Fs
bCgpCj4+IFRoZW4gbm90IG9ubHkgaXQgaXMgY2xlYXIgd2hpY2ggd2F5IHRoZSBib29sZWFuIHZh
bHVlIHNob3VsZCBiZQo+PiBpbnRlcnByZXRlZCwgaXQgYWxzbyBwZXJ2ZW50cyB0aGUgYWNjaWRl
bnRhbCBpbnZlcnNpb24gb2YgZXhpc3RpbmcKPj4gY2FsbHMuIE92ZXJhbGwgZ3JlYXQuCj4KPiBU
b3RhbGx5IGFncmVlZCwgaWYgd2UgaGF2ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIGEgY29t
cGxldGVseQo+IHVuZGVzY3JpcHRpdmUgZnVuY3Rpb24gbmFtZSBsaWtlICJzZWN1cmVfY29tcHV0
aW5nIiB3ZSBzaG91bGQgdGFrZSBpdC4KCkFic29sdXRlbHkgbm8gb2JqZWN0aW9ucyBmcm9tIG15
IHNpZGUgb24gdGhhdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
