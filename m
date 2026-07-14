Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1FAC44508
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXw5fptACL+jSBG6es8GoAPpQIB5eTZIU++eSW8T1F0=; b=eQe7d48dSWRkao
	H5VAgTn1d5R7u7IrkYefvq941bfPUNQF5nrzqTfUoENoAl3U74870NotvecHd9InuKIj20cdaQPz2
	kBTktJBbp2dFu/QPal9UBa3ZNGa6t0Box+enrz+KNn8x6JiPrwyTphcUVO9PkRvs1CVy2TjmHB5LW
	/zVWX1ALX5kwBihr0H5Bumvv0t++9lzPJsRFK0Qcoj8tKLJF85OrHBHP3p8vdsVhBXWrOswnxMo0y
	Fyhp3oGQwlxwunyiKJLlhHqmGsYTAhnqwWvd9IUVGIlDdj1hxxG09Vm3aG+ThLQXJ2lQj6n155Q+2
	rnGfA94VWyKsfx6XMTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeys-0000000CWZM-3fh6;
	Tue, 14 Jul 2026 15:23:34 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeyq-0000000CWYG-08H9
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:23:33 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.105.230])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 58080C2C75;
	Tue, 14 Jul 2026 18:23:15 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 58080C2C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1784042604;
	bh=WOpcFbjQEhRjPrDCcWIUFFBWvc4u//IvEcN3XAtJ46I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NV0vXk8zgJRLB4TtiCBgyeC9r0tDdcneBcb9wPunGxkt0IKYL3V3oFKcGY5VDzgyB
	 Qh/m8oD8LhVi1YOubpwGJCzzpJkvbVs+/C7SpT0eBLs6j2D9LC01WQoJevg+YaxeP7
	 Ch7a6ki6Pr+ZxagiEAWxYNM91lMjUP7v7VU8+VBfhBVCnIyf2AfpbY8o00oq1ARHfx
	 ufS87s6adDnBw8zOd3lwsGeZmOenN4AaIMQm9evAXHQOA28DvO+bDbE0lfPGsOErPt
	 xi2vbdX0VrCsKrlSVW9ZFCkHw3ALvgdXIVgUO0XIk014YkUnKwqRZzed8VzIRlFPzw
	 hWwXWveUqEvoA==
Message-ID: <2a8d25c1645cbc570d9da8dfc3043bc9d2f39cd5.camel@rendec.net>
Subject: Re: [patch 1/4] entry: Rework syscall_audit_enter()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Michael Ellerman
	 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle	
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland	 <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Magnus Lindholm	 <linmag7@gmail.com>, "Mukesh Kumar Chaurasiya (IBM)"
 <mkchauras@gmail.com>,  Jonathan Corbet	 <corbet@lwn.net>
Date: Tue, 14 Jul 2026 11:23:09 -0400
In-Reply-To: <20260712141346.576865340@kernel.org>
References: <20260712134433.549076055@kernel.org>
	 <20260712141346.576865340@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_082332_373788_6CEE2974 
X-CRM114-Status: GOOD (  11.43  )
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

T24gU3VuLCAyMDI2LTA3LTEyIGF0IDIzOjI1ICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4gTW92ZSBpdCBvdXQgb2YgbGluZSBhbmQgbGV0IGl0IHJlcmVhZCB0aGUgc3lzY2FsbCBudW1i
ZXIgb24gaXQncyBvd24uIFRoYXQKPiBtYWtlcyB0aGUgbG93IGxldmVsIGVudHJ5IGNvZGUgZGVu
c2VyIGFuZCBhbGxvd3MgdG8gbW92ZSB0aGUgcmVyZWFkIHRvIHRoZQo+IGNhbGwgc2l0ZSBvZiBz
eXNjYWxsX3RyYWNlX2VudGVyKCkgb25jZSB0aGUgdHJhY2VyIGlzIGZpeGVkIHVwLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IC0tLQo+IMKg
aW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaMKgIHzCoMKgIDE0ICsrKy0tLS0tLS0tLS0tCj4g
wqBrZXJuZWwvZW50cnkvc3lzY2FsbC1jb21tb24uYyB8wqDCoCAxMCArKysrKysrKysrCj4gwqAy
IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvZW50cnktY29tbW9uLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2Vu
dHJ5LWNvbW1vbi5oCj4gQEAgLTYwLDE2ICs2MCw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
Ym9vbCBhcmNoX3B0cmFjZV8KPiDCoAo+IMKgbG9uZyB0cmFjZV9zeXNjYWxsX2VudGVyKHN0cnVj
dCBwdF9yZWdzICpyZWdzLCBsb25nIHN5c2NhbGwpOwo+IMKgdm9pZCB0cmFjZV9zeXNjYWxsX2V4
aXQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGxvbmcgcmV0KTsKPiAtCj4gLXN0YXRpYyBpbmxpbmUg
dm9pZCBzeXNjYWxsX2VudGVyX2F1ZGl0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCBsb25nIHN5c2Nh
bGwpCj4gLXsKPiAtCWlmICh1bmxpa2VseShhdWRpdF9jb250ZXh0KCkpKSB7Cj4gLQkJdW5zaWdu
ZWQgbG9uZyBhcmdzWzZdOwo+IC0KPiAtCQlzeXNjYWxsX2dldF9hcmd1bWVudHMoY3VycmVudCwg
cmVncywgYXJncyk7Cj4gLQkJYXVkaXRfc3lzY2FsbF9lbnRyeShzeXNjYWxsLCBhcmdzWzBdLCBh
cmdzWzFdLCBhcmdzWzJdLCBhcmdzWzNdKTsKPiAtCX0KPiAtfQo+ICt2b2lkIHN5c2NhbGxfZW50
ZXJfYXVkaXQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+IMKgCj4gwqBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGxvbmcgc3lzY2FsbF90cmFjZV9lbnRlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5z
aWduZWQgbG9uZyB3b3JrLAo+IMKgCQkJCQkJbG9uZyBzeXNjYWxsKQo+IEBAIC0xMTEsNyArMTAy
LDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBsb25nIHN5c2NhbGxfdHJhYwo+IMKgCWlmICh1
bmxpa2VseSh3b3JrICYgU1lTQ0FMTF9XT1JLX1NZU0NBTExfVFJBQ0VQT0lOVCkpCj4gwqAJCXN5
c2NhbGwgPSB0cmFjZV9zeXNjYWxsX2VudGVyKHJlZ3MsIHN5c2NhbGwpOwo+IMKgCj4gLQlzeXNj
YWxsX2VudGVyX2F1ZGl0KHJlZ3MsIHN5c2NhbGwpOwo+ICsJaWYgKHVubGlrZWx5KGF1ZGl0X2Nv
bnRleHQoKSkpCj4gKwkJc3lzY2FsbF9lbnRlcl9hdWRpdChyZWdzKTsKPiDCoAo+IMKgCXJldHVy
biBzeXNjYWxsOwo+IMKgfQo+IC0tLSBhL2tlcm5lbC9lbnRyeS9zeXNjYWxsLWNvbW1vbi5jCj4g
KysrIGIva2VybmVsL2VudHJ5L3N5c2NhbGwtY29tbW9uLmMKPiBAQCAtMSw1ICsxLDYgQEAKPiDC
oC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gwqAKPiArI2luY2x1ZGUgPGxp
bnV4L2F1ZGl0Lmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvZW50cnktY29tbW9uLmg+Cj4gwqAKPiDC
oCNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUwo+IEBAIC0yMSwzICsyMiwxMiBAQCB2b2lkIHRy
YWNlX3N5c2NhbGxfZXhpdChzdHJ1Y3QgcHRfcmVncyAqCj4gwqB7Cj4gwqAJdHJhY2Vfc3lzX2V4
aXQocmVncywgcmV0KTsKPiDCoH0KPiArCj4gK3ZvaWQgc3lzY2FsbF9lbnRlcl9hdWRpdChzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJbG9uZyBzeXNjYWxsID0gc3lzY2FsbF9nZXRfbnIo
Y3VycmVudCwgcmVncyk7Cj4gKwl1bnNpZ25lZCBsb25nIGFyZ3NbNl07Cj4gKwo+ICsJc3lzY2Fs
bF9nZXRfYXJndW1lbnRzKGN1cnJlbnQsIHJlZ3MsIGFyZ3MpOwo+ICsJX19hdWRpdF9zeXNjYWxs
X2VudHJ5KHN5c2NhbGwsIGFyZ3NbMF0sIGFyZ3NbMV0sIGFyZ3NbMl0sIGFyZ3NbM10pOwo+ICt9
CgpSZXZpZXdlZC1ieTogUmFkdSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
