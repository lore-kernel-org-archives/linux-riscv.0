Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE61DD6ED0E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwVo2N1vhA0XRo98oCNOvE4VU1u8d/kZ+Rmgtd8YIKE=; b=Di0Cs/sr/u4Aq8
	xf0DvGyNRpMPzK7gu2w957pRU/Hwss4CBGqdAXP5Tmq0kX+R9bXmidtnR0DSPax83iGVxl+Lxtc3A
	rlZQfDi2e8BcxheMIzbDN0bDXoCeb5dlRSnWbf3B0pLu5NbHDneQN6yfET8CYNTgc7WIWzyJq0YDl
	9xZQ1JtVGNGDxgT6ZzDvVUjbDgzqb5m4obRdGPeKxbejIN3KmrpWCooE2TFpvjUT6PRTy/xPLMRX9
	HSjbQulU/MMaLk5xzABOWZkMccwfvN8t6fTdnSXOFq1uMEDG5O3bNgwNhNg8r0kEwOBka3mjWZIYI
	wqxE2MDbBjLiBR0UeV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5Nw-0000000HTtE-2hpG;
	Thu, 21 Nov 2024 11:30:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5Nu-0000000HTsN-0f25
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 11:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 974C8A40567;
	Thu, 21 Nov 2024 11:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5165C4CECC;
	Thu, 21 Nov 2024 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732188604;
	bh=/BU9PGY932wn21LtjDKae9aH7zv26C720CtlUCkyHBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zd4eyciMfSEaozRhA8GrXfvxk/aawYnsgpbdId8ex/F2P5cMSVLEpBJLigXkya97V
	 djqpFuXYoVJerVXHKtA+a865Ns5S8uAZthRmIRWlBkcArma7p7PCJUXXMdfwiNb8q/
	 NvOX3JtOeN4ssfiyvcRW8T0NQC4qRG50bjHIO750IJhA7nyr0Yp1frG95VjXxXg+Em
	 R+LuDdfWhEx4xb7K3ht5h8sebQJs47l28dLF5qc6qfXyDuwOmES3doxI+lr21EzOqI
	 G4iXjnKg6nN4uwHikFbGEG7H0fD4xTpCKkPI6OlZomHEEDAJAqaFiFjynv9MVyrdvq
	 aVyNf7zGd+2kw==
Message-ID: <6a960374-0cd2-4de9-8fc6-c8fe21097b6b@kernel.org>
Date: Thu, 21 Nov 2024 11:29:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Override makefile ARCH variable if defined, but
 empty
To: Namhyung Kim <namhyung@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Abdurachmanov <davidlt@rivosinc.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
References: <20241106193208.290067-1-bjorn@kernel.org>
 <87r076nikd.fsf@all.your.base.are.belong.to.us> <Zz7Ng9CzrF_ciAz-@google.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <Zz7Ng9CzrF_ciAz-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_033006_259683_71C64536 
X-CRM114-Status: GOOD (  13.25  )
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

MjAyNC0xMS0yMCAyMjowNCBVVEMtMDgwMCB+IE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdAa2VybmVs
Lm9yZz4KPiBPbiBXZWQsIE5vdiAyMCwgMjAyNCBhdCAwMjoyNToyMlBNICswMTAwLCBCasO2cm4g
VMO2cGVsIHdyb3RlOgo+PiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6
Cj4+Cj4+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+Pgo+Pj4g
VGhlcmUgYXJlIGEgbnVtYmVyIG9mIHRvb2xzIChicGZ0b29sLCBzZWxmdGVzdHMpLCB0aGF0IHJl
cXVpcmUgYQo+Pj4gImJvb3RzdHJhcCIgYnVpbGQuIEhlcmUsIGEgYm9vdHN0cmFwIGJ1aWxkIGlz
IGEgYnVpbGQgaG9zdCB2YXJpYW50IG9mCj4+PiBhIHRhcmdldC4gRS5nLiwgYXNzdW1lIHRoYXQg
eW91J3JlIHBlcmZvcm1pbmcgYSBicGZ0b29sIGNyb3NzLWJ1aWxkIG9uCj4+PiB4ODYgdG8gcmlz
Y3YsIGEgYm9vdHN0cmFwIGJ1aWxkIHdvdWxkIHRoZW4gYmUgYW4geDg2IHZhcmlhbnQgb2YKPj4+
IGJwZnRvb2wuIFRoZSB0eXBpY2FsIHdheSB0byBwZXJmb3JtIHRoZSBob3N0IGJ1aWxkIHZhcmlh
bnQsIGlzIHRvIHBhc3MKPj4+ICJBUkNIPSIgaW4gYSBzdWItbWFrZS4gSG93ZXZlciwgaWYgYSB2
YXJpYWJsZSBoYXMgYmVlbiBzZXQgd2l0aCBhCj4+PiBjb21tYW5kIGFyZ3VtZW50LCB0aGVuIG9y
ZGluYXJ5IGFzc2lnbm1lbnRzIGluIHRoZSBtYWtlZmlsZSBhcmUKPj4+IGlnbm9yZWQuCj4+Pgo+
Pj4gVGhpcyBzaWRlLWVmZmVjdCByZXN1bHRzIGluIHRoYXQgQVJDSCwgYW5kIHZhcmlhYmxlcyBk
ZXBlbmRpbmcgb24gQVJDSAo+Pj4gYXJlIG5vdCBzZXQuCj4+Pgo+Pj4gV29ya2Fyb3VuZCBieSBv
dmVycmlkaW5nIEFSQ0ggdG8gdGhlIGhvc3QgYXJjaCwgaWYgQVJDSCBpcyBlbXB0eS4KPj4+Cj4+
PiBGaXhlczogODg1OWIwZGE1YWFjICgidG9vbHMvYnBmdG9vbDogRml4IGNyb3NzLWJ1aWxkIikK
Pj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAK
PiBSZXZpZXdlZC1ieTogTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0BrZXJuZWwub3JnPgoKCkFja2Vk
LWJ5OiBRdWVudGluIE1vbm5ldCA8cW1vQGtlcm5lbC5vcmc+CgoKPj4gQXJuYWxkby9QYWxtZXIv
UXVlbnRpbjoKPj4KPj4gQSBiaXQgdW5zdXJlIHdoYXQgdHJlZSB0aGlzIHBhdGNoIHNob3VsZCBn
by4gSXQncyB2ZXJ5IGltcG9ydGFudCBmb3IgdGhlCj4+IFJJU0MtViBidWlsZHMsIHNvIG1heWJl
IHZpYSBQYWxtZXIncyBSSVNDLVYgdHJlZT8KPiAKPiBJIHRoaW5rIGl0J2QgYmUgYmVzdCB0byBy
b3V0ZSB0aGlzIHRocm91Z2ggdGhlIGJwZiB0cmVlIGFzIGl0IHNlZW1zIHRoZQo+IG1haW4gdGFy
Z2V0IGlzIGJwZnRvb2wuICBCdXQgZ2l2ZW4gdGhlIHNpemUgYW5kIHRoZSBzY29wZSBvZiB0aGUg
Y2hhbmdlLAo+IGl0IHNob3VsZCBiZSBmaW5lIHdpdGggcGVyZi10b29scyBvciBSSVNDLVYgdHJl
ZS4KCgpUaGUgYnBmIHRyZWUgd291bGQgbWFrZSBzZW5zZSB0byBtZSBhcyB3ZWxsIChidXQgSSBk
b24ndCBtZXJnZSBwYXRjaGVzCm15c2VsZjsgbGV0IG1lIENjIEJQRiBtYWludGFpbmVycykuCgpR
dWVudGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
