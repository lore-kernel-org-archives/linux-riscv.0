Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15486E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BN8/FXRY+x/FLzdRLy7EgiMmumv18NNaVSAqK01y7nY=; b=uv4xWCvm0tCgqx
	DIXamh3DrX04wi7GBQ6Hqq0snyG3vl9RVnihvTjFLim/eSm4XeZeJWQn8zFNU87sVvKhGFhTu7R5/
	ZV7n4+DctQ/c4CKbyxwi/JBsWxh4vO/JzxGb82KHNDIOQDK/TIdjLO5kUE57gQmK3EbkqwE5hNvsO
	DepGJvoF/zLXS2yxGbrZ7a08jQkp9XG+I0FJLCF3PJSoNUDZm4dOSH5PWR1BqcBbZTrUBXQcsVdgJ
	9QKOZkh68f7tOlnXNWpPRYQqKONjmWj3+2YrQ4xjW+GKJZSoX29iz8Yz6JrEKPT0Tf1MSwzBP3v56
	YeVEcDzHB8kzZC+f3Kfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsAu-0000000GRbI-0i6v;
	Wed, 18 Dec 2024 11:25:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrAB-0000000GEYK-0mjQ;
	Wed, 18 Dec 2024 10:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y+W7VROJYAKWesW0btuLtsny/5rudGPHx9yR2y+wyzo=; b=qd+WfcHOCwTPnnDR34QoHWF/x7
	ZiOcQ54IhjQN/JspesBSvILNr2BUqBnkndO4OfaEGMgxL4QFiCL8Jvb2vasBi9JsjxzcPa39/OheN
	LnyxvWC3IbHEBDYrLsnetkdGZpVlAViQciR4e+/UUMF53isrmPfqTeJPvsd7rGSnjYUZBtkhvlTx1
	UM2QANC7awSY72XKzfI8IYXeNQhJHHUALyvi6qVE6aza+uVv70ZuCRvUjdLU28QNrPXTQa3CFl/fO
	gSENNHjANgipzu+sYHSNgwCyK6RymWvFMbaVEMR6B8owDOOSwtDiy6EQco1Oc8SZtFloB2in4MT04
	NBmVjblg==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrA8-00000005EXv-0rJ0;
	Wed, 18 Dec 2024 10:20:17 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YCqSD111Vz9sPd;
	Wed, 18 Dec 2024 11:20:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKpioB5BCG2d; Wed, 18 Dec 2024 11:20:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YCqSC6pM5z9rvV;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC0DD8B770;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ffiwrVR0qIrj; Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D2408B763;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Message-ID: <e69b2927-b415-4e16-a346-8d874c9a8b39@csgroup.eu>
Date: Wed, 18 Dec 2024 11:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] powerpc/vdso: Switch to generic storage
 implementation
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-12-f7aed1bdb3b2@linutronix.de>
 <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102016_456631_42685E30 
X-CRM114-Status: GOOD (  11.41  )
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

Cgo+PiDCoCAjaWZkZWYgQ09ORklHX1RJTUVfTlMKPj4gLXN0YXRpYyBfX2Fsd2F5c19pbmxpbmUK
Pj4gLWNvbnN0IHN0cnVjdCB2ZHNvX2RhdGEgKl9fYXJjaF9nZXRfdGltZW5zX3Zkc29fZGF0YShj
b25zdCBzdHJ1Y3QgCj4+IHZkc29fZGF0YSAqdmQpCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5l
IGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAKPj4gKl9fcHBjX2dldF92ZHNvX3VfdGltZW5z
X2RhdGEodm9pZCkKPj4gwqAgewo+PiAtwqDCoMKgIHJldHVybiAodm9pZCAqKXZkICsgKDFVIDw8
IENPTkZJR19QQUdFX1NISUZUKTsKPj4gK8KgwqDCoCBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgKnRp
bWVfZGF0YTsKPj4gKwo+PiArwqDCoMKgIGFzbSgKPj4gK8KgwqDCoMKgwqDCoMKgICLCoMKgwqAg
YmNswqDCoMKgIDIwLCAzMSwgLis0XG4iCj4+ICvCoMKgwqDCoMKgwqDCoCAiMDrCoMKgwqAgbWZs
csKgwqDCoCAlMFxuIgo+PiArwqDCoMKgwqDCoMKgwqAgIsKgwqDCoCBhZGRpc8KgwqDCoCAlMCwg
JTAsICh2ZHNvX3VfdGltZW5zX2RhdGEgLSAwYilAaGFcbiIKPj4gK8KgwqDCoMKgwqDCoMKgICLC
oMKgwqAgYWRkacKgwqDCoCAlMCwgJTAsICh2ZHNvX3VfdGltZW5zX2RhdGEgLSAwYilAbFxuIgo+
PiArwqDCoMKgIDogIj1yIiAodGltZV9kYXRhKSA6OiAibHIiKTsKPj4gKwo+PiArwqDCoMKgIHJl
dHVybiB0aW1lX2RhdGE7Cj4gCj4gUGxlYXNlIGRvbid0IGRvIHRoYXQsIGl0IGtpbGxzIG9wdGlt
aXNhdGlvbiBlZmZvcnRzIGRvbmUgd2hlbiAKPiBpbXBsZW1lbnRpbmcgVkRTTyB0aW1lLiBDb21t
aXQgY2U3ZDgwNTZlMzhiICgicG93ZXJwYy92ZHNvOiBQcmVwYXJlIGZvciAKPiBzd2l0Y2hpbmcg
VkRTTyB0byBnZW5lcmljIEMgaW1wbGVtZW50YXRpb24uIikgZXhwbGFpbnMgd2h5Lgo+IAo+IEZv
ciB0aW1lIGRhdGEsIHRoZSBiY2wvbWZsciBkYW5jZSBpcyBkb25lIGJ5IGdldF9kYXRhcGFnZSBt
YWNybyBjYWxsZWQgCj4gYnkgY3Zkc29fY2FsbCBtYWNybyBpbiBnZXR0aW1lb2ZkYXkuUywgYW5k
IGdpdmVuIHRvIAo+IF9fY3Zkc29fY2xvY2tfZ2V0dGltZV9kYXRhKCkgYnkgX19jX2tlcm5lbF9j
bG9ja19nZXR0aW1lKCkgaW4gCj4gdmdldHRpbWVvZmRheS5jIC4gVXNlIHRoYXQgaW5mb3JtYXRp
b24gYW5kIGRvbid0IHJlZG8gdGhlIGJjbC9tZmxyIAo+IHNlcXVlbmNlLgo+IAo+IFNlZSBmb3Ig
aW5zdGFuY2UgZnVuY3Rpb24gX19jX2tlcm5lbF9jbG9ja19nZXRyZXMoKToKPiAKPiBCZWZvcmUg
eW91ciBzZXJpZXMgaXQgaXMgMzAgaW5zdHJ1Y3Rpb25zLgo+IEFmdGVyIHlvdXIgc2VyaWVzIGl0
IGlzIDU5IGluc3RydWN0aW9ucy4KPiAKCkl0IGlzIGV2ZW4gbW9yZSBvYnZpb3VzIHdpdGggX19j
X2tlcm5lbF90aW1lKCkKCkJlZm9yZSB5b3VyIHNlcmllcyBpdCBoYXMgMTIgaW5zdHJ1Y3Rpb25z
LApBZnRlciB5b3VyIHNlcmllcyBpdCBoYXMgMjYgaW5zdHJ1Y3Rpb25zLgoKQmVmb3JlCgowMDAw
MTQwOCA8X19jX2tlcm5lbF90aW1lPjoKICAgICAxNDA4Ogk4MSA0NCAwMCAwNCAJbHd6ICAgICBy
MTAsNChyNCkKICAgICAxNDBjOgk2ZCA0OSA4MCAwMCAJeG9yaXMgICByOSxyMTAsMzI3NjgKICAg
ICAxNDEwOgkyYyAwOSBmZiBmZiAJY21wd2kgICByOSwtMQogICAgIDE0MTQ6CTQwIDgyIDAwIDA4
IAlibmUgICAgIDE0MWMgPF9fY19rZXJuZWxfdGltZSsweDE0PgogICAgIDE0MTg6CTM4IDg0IDQw
IDAwIAlhZGRpICAgIHI0LHI0LDE2Mzg0CiAgICAgMTQxYzoJMmMgMDMgMDAgMDAgCWNtcHdpICAg
cjMsMAogICAgIDE0MjA6CTgxIDQ0IDAwIDIwIAlsd3ogICAgIHIxMCwzMihyNCkKICAgICAxNDI0
Ogk4MSA2NCAwMCAyNCAJbHd6ICAgICByMTEsMzYocjQpCiAgICAgMTQyODoJNDEgODIgMDAgMDgg
CWJlcSAgICAgMTQzMCA8X19jX2tlcm5lbF90aW1lKzB4Mjg+CiAgICAgMTQyYzoJOTEgNjMgMDAg
MDAgCXN0dyAgICAgcjExLDAocjMpCiAgICAgMTQzMDoJN2QgNjMgNWIgNzggCW1yICAgICAgcjMs
cjExCiAgICAgMTQzNDoJNGUgODAgMDAgMjAgCWJscgoKVmVyc3VzIGFmdGVyCgowMDAwMTUzNCA8
X19jX2tlcm5lbF90aW1lPjoKICAgICAxNTM0Ogk4MSA0NCAwMCAwNCAJbHd6ICAgICByMTAsNChy
NCkKICAgICAxNTM4Ogk2ZCA0OSA4MCAwMCAJeG9yaXMgICByOSxyMTAsMzI3NjgKICAgICAxNTNj
OgkyYyAwOSBmZiBmZiAJY21wd2kgICByOSwtMQogICAgIDE1NDA6CTQxIDgyIDAwIDIwIAliZXEg
ICAgIDE1NjAgPF9fY19rZXJuZWxfdGltZSsweDJjPgogICAgIDE1NDQ6CTJjIDAzIDAwIDAwIAlj
bXB3aSAgIHIzLDAKICAgICAxNTQ4Ogk4MSA0NCAwMCAyMCAJbHd6ICAgICByMTAsMzIocjQpCiAg
ICAgMTU0YzoJODEgNjQgMDAgMjQgCWx3eiAgICAgcjExLDM2KHI0KQogICAgIDE1NTA6CTQxIDgy
IDAwIDA4IAliZXEgICAgIDE1NTggPF9fY19rZXJuZWxfdGltZSsweDI0PgogICAgIDE1NTQ6CTkx
IDYzIDAwIDAwIAlzdHcgICAgIHIxMSwwKHIzKQogICAgIDE1NTg6CTdkIDYzIDViIDc4IAltciAg
ICAgIHIzLHIxMQogICAgIDE1NWM6CTRlIDgwIDAwIDIwIAlibHIKICAgICAxNTYwOgk3YyAwOCAw
MiBhNiAJbWZsciAgICByMAogICAgIDE1NjQ6CTJjIDAzIDAwIDAwIAljbXB3aSAgIHIzLDAKICAg
ICAxNTY4Ogk5MCAwMSAwMCAwNCAJc3R3ICAgICByMCw0KHIxKQogICAgIDE1NmM6CTQyIDlmIDAw
IDA1IAliY2wgICAgIDIwLDQqY3I3K3NvLDE1NzAgPF9fY19rZXJuZWxfdGltZSsweDNjPgogICAg
IDE1NzA6CTdjIDg4IDAyIGE2IAltZmxyICAgIHI0CiAgICAgMTU3NDoJM2MgODQgZmYgZmYgCWFk
ZGlzICAgcjQscjQsLTEKICAgICAxNTc4OgkzOCA4NCAyYSA5MCAJYWRkaSAgICByNCxyNCwxMDg5
NgogICAgIDE1N2M6CTgxIDQ0IDAwIDIwIAlsd3ogICAgIHIxMCwzMihyNCkKICAgICAxNTgwOgk4
MSA2NCAwMCAyNCAJbHd6ICAgICByMTEsMzYocjQpCiAgICAgMTU4NDoJNDEgODIgMDAgMDggCWJl
cSAgICAgMTU4YyA8X19jX2tlcm5lbF90aW1lKzB4NTg+CiAgICAgMTU4ODoJOTEgNjMgMDAgMDAg
CXN0dyAgICAgcjExLDAocjMpCiAgICAgMTU4YzoJODAgMDEgMDAgMDQgCWx3eiAgICAgcjAsNChy
MSkKICAgICAxNTkwOgk3ZCA2MyA1YiA3OCAJbXIgICAgICByMyxyMTEKICAgICAxNTk0Ogk3YyAw
OCAwMyBhNiAJbXRsciAgICByMAogICAgIDE1OTg6CTRlIDgwIDAwIDIwIAlibHIKCkNocmlzdG9w
aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
