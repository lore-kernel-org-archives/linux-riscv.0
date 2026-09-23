Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B8BC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYlKJ45P2wn2Q6E7P1Rc25KRfq4ASIkvQ5kU1IfDpno=; b=rka46cv3V4PXIr
	F8iuh/gd5MPQhQXOyPJ0KJetZ/q1WVS8O3U3D4qMpBjbcuJSkCh1dTegEcdztnPP7xDC5QKg7D1qO
	4SftY642W4+XcDDaiQx2N0Md6EEHbh6qEYIDUzF6Ogr+JpYwgdIzkBC6R94GRg2mIG34294+Pl7UP
	MezktKcy/tXYGht1FpDeaQsNH4bZdXJdiW+3GN0y+ZSYHt1Hdb5arMAifuSwlFNllklu/UIjbH+gx
	I5FYNLjp9eX3QeW9mXcjG55WJ2axy6tJunrhvnirYHN3FPP/7JynfrG53mbROSbb7PvM5uY09HZaW
	8oedpe8zojUuJsi6mRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GT3-00000007H0Q-266k;
	Wed, 23 Sep 2026 06:28:33 +0000
Received: from mail-dy2-x28.google.com ([2607:f8b0:4864:36::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GT1-00000007Gyl-0eVe
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 06:28:32 +0000
Received: by mail-dy2-x28.google.com with SMTP id 5a478bee46e88-328664c2da6so319765eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 23:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144910; x=1790749710; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hUFOEJST1qHgvJkQDivOVNilsD3f7PYYgSWMm8/mzk=;
        b=pGn7OnK4ndVKHJViuox84YlQ2U++7NMrG1c9VferxIryZ6iy6U/esBG6KvhoMI5WmE
         45pM/yg2fqfiZBVa5SkvqXI6bJgDWXUbQ9pd0I4LWdBZvswTZKb9kSVeTX19FiHbwo8Z
         /y/6bQQaqRJZwd8w2LHkrznBye2qb69FvsksBEVy6mkNa1xBZPLqH0422zgWua9tKag0
         RqfcAHsr07XPeFTG2guvLhDf0lcBtrt9aqbxu2OO3wkXAb6S0UEWqhVj4r+D5OAcRyqT
         X9tRv6W7rvKL2NdJnwzoI27TgkPp/PlOjMuiPF+o8wEHpzWFfySGTpsYYUnmkNW+dFzp
         tqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144910; x=1790749710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hUFOEJST1qHgvJkQDivOVNilsD3f7PYYgSWMm8/mzk=;
        b=o6DhMo3WLH7LoDjutA8mm6evyL5hHOsPSwuJo6VFrMeXYzyzHc4zl3wFLvKnensePp
         dPUeGmDlMI09smIjAph3/4DL4VkZzILJA4FRyJyQ5gjul8uDbDMqqqhUp49V3kgMk31Y
         xJhq33TdvGj5DNDDU7RlakmQOyL59y8MWeJlc/B8tPi1Tm0ZiX0Zkts4QfClJXYxQg8r
         IzrPDaSAUblxJYH9JyS2jaQck1ymtkioUSHgn/wq104q1+3DGVT+QxjP7OywzCAO7tW7
         2r3nZeqDWdQssVvBPnRkOsoGfgSnL8X2g68jq4qwt9lT7dpNJj0IKGLsb5pV6+RrfZvE
         kqUw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0ENGQijsDOMjVVnIxGs4oyS2kpTTx/hkG4wDncYZbRJec5/vp7z9sVe8ErElOrD/S2EExIFGK/YGsg==@lists.infradead.org
X-Gm-Message-State: AFuF++kPQfMIiY6IoWGH9MYWLVjMR8QaGDVMaBG0DAAqQA6qeV0HJQ1w
	hbh7PJsloCjZyHx96DBz79ms3o8W0quI6T4VwwAydTgG9JanUV5zJGrd
X-Gm-Gg: AYBFou2fWB4xk/JdxYT4cwu5RkPpzwC6Upw4yoq0PL+fqnn9eXekkTRUDMGlO8fSaly
	vSjk1Og2e0QwdAnCC6YgemCR3EpGY0xe69BcLU4rxO/MYeZk22OqDMg69PE5l6OtZ1BZD2z+9OC
	eJ1yTlDjjFzdum1Ke7c6EF64Y1uktj74AzgzW9JV6XHb+MtdtR36LrKS1OeLnQsQMef7TgCflWS
	+K6mmR1rrtOp57No0Bj/kCtAY/6nLbZohgftV4x1zL1CNDuGxXaz3aOnXJdoA7MRsHmT76SWlvx
	JuRc9P5VQRiXm0Ai5ecqQugQ1Yz8AqxKMjhVQ7kzCF22Hr+a4vue+CbK70c1T4YzSaMsmJcS6Tx
	L/8xxbfte8elAAOe8WRdsF8UcksZv4kAFk5E15tRfdqJM24tTIpRziIgnOk56AwZnjIunS/uCEe
	aXaaoCxjMhFMhskwKGA3ld/9sAIO7KerzdHFGwTYNFtazSb4mI53aWclW6EunWYeq4aQULj8QkT
	T0UaKn9TWlP8gsKkI+QSb/sBWyRKAl8RAmX5tEm+E9cgl1eXmOogQ==
X-Received: by 2002:a05:7301:3a86:b0:33e:5c4f:f46e with SMTP id 5a478bee46e88-33e8d8d2598mr1603719eec.30.1790144909601;
        Tue, 22 Sep 2026 23:28:29 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e97236754sm3074867eec.29.2026.09.22.23.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:58:13 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, thuth@redhat.com, 
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232831_192111_FBA0A1E3 
X-CRM114-Status: GOOD (  20.02  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMDg6NDc6MzVBTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTE6MjA6MDBBTSArMDUzMCwgTXVrZXNo
IEt1bWFyIENoYXVyYXNpeWEgKElCTSkgd3JvdGU6Cj4gPiBWZXJpZnkgdGhhdCB0aGUgX19idWdf
dGFibGUgZW50cnkgZW1pdHRlZCBieSBBUkNIX1dBUk5fQVNNIGhhcyBhIGNvcnJlY3QKPiA+IGJ1
Z19hZGRyIGRpc3BsYWNlbWVudCDigJQgaS5lLiB0aGUgYXJjaCdzIHRyYXAgbGFiZWwgcmVmZXJl
bmNlIHJlc29sdmVzIHRvCj4gPiB0aGUgdHJhcCBpbnN0cnVjdGlvbiDigJQgYnkgY2FsbGluZyBm
aW5kX2J1ZygpIHdpdGggdGhlIGV4YWN0IHZpcnR1YWwgYWRkcmVzcwo+ID4gb2YgdGhlIHRyYXAs
IG1pcnJvcmluZyB3aGF0IHRoZSByZWFsIHRyYXAgaGFuZGxlciBkb2VzLgo+ID4gCj4gPiBUbyBz
dXBwb3J0IGFsbCBhcmNoaXRlY3R1cmVzLCBlYWNoIGFyY2ggdGhhdCBpbXBsZW1lbnRzIEFSQ0hf
V0FSTl9BU00gbm93Cj4gPiBkZWZpbmVzIEFSQ0hfV0FSTl9BU01fVFJBUF9MQUJFTCwgYSBzdHJp
bmcgY29uc3RhbnQgbmFtaW5nIHRoZSBsb2NhbCBsYWJlbAo+ID4gYXQgd2hpY2ggdGhlIHRyYXAg
aW5zdHJ1Y3Rpb24gaXMgcGxhY2VkOgo+ID4gCj4gPiAgIHg4NiAgICAgICAiMSIgICAgICh1ZDIg
YXQgbGFiZWwgMTopCj4gPiAgIHBvd2VycGMgICAiMSIgICAgICh0d2kgYXQgbGFiZWwgMTopCj4g
PiAgIHJpc2N2ICAgICAiMSIgICAgIChlYnJlYWsgYXQgbGFiZWwgMTopCj4gPiAgIGFybTY0ICAg
ICAiMTQ0NzEiIChicmsgcGxhY2VkIGF0IDE0NDcxOiBieSBfX0JVR19FTlRSWV9FTkQpCj4gPiAg
IHMzOTAgICAgICAiMCIgICAgIChtYyBhdCBsYWJlbCAwOikKPiA+IAo+ID4gVGhlIGxhYmVsIGlz
IHVzZWQgY29uc2lzdGVudGx5OiBpbiBBUkNIX1dBUk5fQVNNIGl0c2VsZiwgaW4gdGhlCj4gPiBi
dWdfYWRkciBiYWNrLXJlZmVyZW5jZSBpbnNpZGUgX19CVUdfRU5UUlkgLyBfRU1JVF9CVUdfRU5U
UlksIAo+IAo+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmgKPiA+IGluZGV4IDIzYWIwNTQzODI2OS4uNmNjYTg4
ODA2NjBlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmgKPiA+ICsr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oCj4gPiBAQCAtNjIsOCArNjIsOSBAQCBleHRl
cm4gdm9pZCBfX1dBUk5fdHJhcChzdHJ1Y3QgYnVnX2VudHJ5ICpidWcsIC4uLik7Cj4gPiAgI2Rl
ZmluZSBIQVZFX0FSQ0hfQlVHX0ZPUk1BVF9BUkdTCj4gPiAgI2VuZGlmCj4gPiAgCj4gPiArI2Rl
ZmluZSBBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwgIjEiCj4gPiAgI2RlZmluZSBfX0JVR19FTlRS
WShmb3JtYXQsIGZpbGUsIGxpbmUsIGZsYWdzKQkJCQlcCj4gPiAtCSJcdC5sb25nIDFiIC0gLiIJ
Ilx0IyBidWdfZW50cnk6OmJ1Z19hZGRyXG4iCQlcCj4gPiArCSJcdC5sb25nICIgQVJDSF9XQVJO
X0FTTV9UUkFQX0xBQkVMICJiIC0gLiIgIlx0IyBidWdfZW50cnk6OmJ1Z19hZGRyXG4iIFwKPiA+
ICAJX19CVUdfRU5UUllfRk9STUFUKGZvcm1hdCkJCQkJCVwKPiA+ICAJX19CVUdfRU5UUllfVkVS
Qk9TRShmaWxlLCBsaW5lKQkJCQkJXAo+ID4gIAkiXHQud29yZCAiIGZsYWdzCSJcdCMgYnVnX2Vu
dHJ5OjpmbGFnc1xuIgo+ID4gQEAgLTEwMSw3ICsxMDIsNyBAQCBkbyB7CQkJCQkJCQkJXAo+ID4g
IAkiOTk6XG4iCQkJCQkJCQlcCj4gPiAgCSJcdC5zdHJpbmcgXCJcIlxuIgkJCQkJCVwKPiA+ICAJ
Ii5wb3BzZWN0aW9uXG4iCQkJCQkJCVwKPiA+IC0JIjE6XHQgIiBBU01fVUQyICJcbiIJCQkJCQlc
Cj4gPiArCUFSQ0hfV0FSTl9BU01fVFJBUF9MQUJFTCAiOlx0ICIgQVNNX1VEMiAiXG4iCQkJXAo+
ID4gIAlfQlVHX0ZMQUdTX0FTTSgiOTliIiwgZmlsZSwgbGluZSwgZmxhZ3MsIHNpemUsICIiKQo+
ID4gIAo+ID4gICNlbHNlCj4gCj4gTm90IHJlYWxseSBhIGZhbiBvZiB0aGF0LiBBbmQgSSBjYW4n
dCByZWFsbHkgdGVsbCB3aGF0IHlvdSdyZSBkb2luZyB3aXRoCj4gaXQgZWl0aGVyLiBUaGUga3Vu
aXQgaXMgaW4gUnVzdCBhbmQgdGh1cyB1bnJlYWRhYmxlIDotKAo+IAo+IEkgd291bGQgcmF0aGVy
IHlvdSBmaXggdXAgaXNfdmFsaWRfYnVnYWRkcigpLCBzb21lIGFyY2hpdGVjdHVyZXMgc2VlbSB0
bwo+IGhhdmUgYW4gYWx3YXlzIHRydWUgc3R1YiBiZWNhdXNlIG9mIHRoZSBjYWxsY2hhaW5zIGFs
d2F5cyBiZWluZyBmcm9tIHRoZQo+IGJyZWFrIGluc3RydWN0aW9uLgoKSGV5IFBldGVyLAoKdGhh
bmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gSSB3aWxsIGZpeCB1cCB0aGUgaXNfdmFsaWRfYnVnYWRk
ciBmb3IKcG93ZXJwYy4gSSBhbSBub3QgdmVyeSBnb29kIHdpdGggb3RoZXIgYXJjaHMgYXNtIGJ1
dCBpIGNhbiBkbyBpdCBmb3IKcHBjMzIgYW5kIHBwYzY0LgoKUmVnYXJkcywKTXVrZXNoCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
