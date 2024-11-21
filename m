Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8387D75BBE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 06:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXEGLyVVLFKDwIAuhCw2aO/8y4BS5HTaMwE5q+Q38SI=; b=e3x54g2sRqRJkk
	4ymdXKiy4LRLxCgCutGFpRjizV+hxtYhL5O2BbxD6YxSoemmkWP+BKPv6qBQSozF0ev1+y6M5rpzz
	aD7jQKFpMYqYK5F8Nczn7f3P4Bj22GX7s1LU7WbwtkCiRSY0Lg+4ugQz9MJNUpS/NjnmapR+nr6rO
	KFhEEqbT60W5O2fugimGdH2wX9/hhUdBBUN3nt79jAFZ/a9NAGw+uyPaaNtNraId2gtA9iTTBHTFh
	xks+oskrGyH8XOH6MtbVo8z/FetsS1+uOVBuREbAMQyK9QrViMdMw/0JasK6QiUHSsynpOo0AqV4L
	oOlbAHYneMQpht3aRm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0JG-0000000GtpY-0GwB;
	Thu, 21 Nov 2024 06:04:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0JD-0000000Gtp9-3fBi
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 06:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AAC25A4052A;
	Thu, 21 Nov 2024 06:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4073BC4CECC;
	Thu, 21 Nov 2024 06:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732169094;
	bh=5SzfSvmW6/EPTP4rQKZCAGqAdZ0pvivToAjN8Y2m9VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNTLZfFQdJoBGLUj/Pf2GLZJL1xjs3lT6zJqK68EcV/k1VghZ12lSCUsvVmtpqfkP
	 2vCJXXlH+JFp6qJOxbtoJ1yfY+gXOccwgKWHlo+Tc3KNksHIEUwMDSzrduOqSOxitA
	 /4wwoIV/n4bv4srSwtqkk3//3gXk1ej5lW8qno7wls9MiJkjkpAempHg/VSOZEovc3
	 2+64hp3/lyiYj0ZcIRB5dr5ZcaAsAVNxu6PP+TeEGRAyQWgzgtl94iGePzfGM0v+BZ
	 O1dI2gYBUkCAuVeBHFzC1sksj6Qep33n+ymFBqWN6ZlWCnqs0sUJB5yY1I8+CAE+Pb
	 XPrYDrJfPhQkA==
Date: Wed, 20 Nov 2024 22:04:51 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Quentin Monnet <qmo@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Abdurachmanov <davidlt@rivosinc.com>
Subject: Re: [PATCH] tools: Override makefile ARCH variable if defined, but
 empty
Message-ID: <Zz7Ng9CzrF_ciAz-@google.com>
References: <20241106193208.290067-1-bjorn@kernel.org>
 <87r076nikd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r076nikd.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_220455_976055_DBB0B64E 
X-CRM114-Status: GOOD (  18.28  )
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

T24gV2VkLCBOb3YgMjAsIDIwMjQgYXQgMDI6MjU6MjJQTSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gCj4gPiBG
cm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPgo+ID4gVGhlcmUgYXJl
IGEgbnVtYmVyIG9mIHRvb2xzIChicGZ0b29sLCBzZWxmdGVzdHMpLCB0aGF0IHJlcXVpcmUgYQo+
ID4gImJvb3RzdHJhcCIgYnVpbGQuIEhlcmUsIGEgYm9vdHN0cmFwIGJ1aWxkIGlzIGEgYnVpbGQg
aG9zdCB2YXJpYW50IG9mCj4gPiBhIHRhcmdldC4gRS5nLiwgYXNzdW1lIHRoYXQgeW91J3JlIHBl
cmZvcm1pbmcgYSBicGZ0b29sIGNyb3NzLWJ1aWxkIG9uCj4gPiB4ODYgdG8gcmlzY3YsIGEgYm9v
dHN0cmFwIGJ1aWxkIHdvdWxkIHRoZW4gYmUgYW4geDg2IHZhcmlhbnQgb2YKPiA+IGJwZnRvb2wu
IFRoZSB0eXBpY2FsIHdheSB0byBwZXJmb3JtIHRoZSBob3N0IGJ1aWxkIHZhcmlhbnQsIGlzIHRv
IHBhc3MKPiA+ICJBUkNIPSIgaW4gYSBzdWItbWFrZS4gSG93ZXZlciwgaWYgYSB2YXJpYWJsZSBo
YXMgYmVlbiBzZXQgd2l0aCBhCj4gPiBjb21tYW5kIGFyZ3VtZW50LCB0aGVuIG9yZGluYXJ5IGFz
c2lnbm1lbnRzIGluIHRoZSBtYWtlZmlsZSBhcmUKPiA+IGlnbm9yZWQuCj4gPgo+ID4gVGhpcyBz
aWRlLWVmZmVjdCByZXN1bHRzIGluIHRoYXQgQVJDSCwgYW5kIHZhcmlhYmxlcyBkZXBlbmRpbmcg
b24gQVJDSAo+ID4gYXJlIG5vdCBzZXQuCj4gPgo+ID4gV29ya2Fyb3VuZCBieSBvdmVycmlkaW5n
IEFSQ0ggdG8gdGhlIGhvc3QgYXJjaCwgaWYgQVJDSCBpcyBlbXB0eS4KPiA+Cj4gPiBGaXhlczog
ODg1OWIwZGE1YWFjICgidG9vbHMvYnBmdG9vbDogRml4IGNyb3NzLWJ1aWxkIikKPiA+IFNpZ25l
ZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5
OiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+Cgo+IAo+IEFybmFsZG8vUGFsbWVy
L1F1ZW50aW46Cj4gCj4gQSBiaXQgdW5zdXJlIHdoYXQgdHJlZSB0aGlzIHBhdGNoIHNob3VsZCBn
by4gSXQncyB2ZXJ5IGltcG9ydGFudCBmb3IgdGhlCj4gUklTQy1WIGJ1aWxkcywgc28gbWF5YmUg
dmlhIFBhbG1lcidzIFJJU0MtViB0cmVlPwoKSSB0aGluayBpdCdkIGJlIGJlc3QgdG8gcm91dGUg
dGhpcyB0aHJvdWdoIHRoZSBicGYgdHJlZSBhcyBpdCBzZWVtcyB0aGUKbWFpbiB0YXJnZXQgaXMg
YnBmdG9vbC4gIEJ1dCBnaXZlbiB0aGUgc2l6ZSBhbmQgdGhlIHNjb3BlIG9mIHRoZSBjaGFuZ2Us
Cml0IHNob3VsZCBiZSBmaW5lIHdpdGggcGVyZi10b29scyBvciBSSVNDLVYgdHJlZS4KClRoYW5r
cywKTmFtaHl1bmcKCj4gCj4gT3BpbmlvbnM/IEp1c3Qgd2FudCB0byBtYWtlIHN1cmUgaXQgZG9l
c24ndCBmYWxsIGJldHdlZW4gYW55IGNoYWlycyEKPiA6LSkKPiAKPiAKPiBCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
