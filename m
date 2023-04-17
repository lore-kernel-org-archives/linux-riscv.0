Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549D2C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbXTW7gZztLID0P+0FqeoHlmPIBOMbnra01R+VsisGM=; b=31R+WpXoIE6sVh
	y7n4gDEcTcJn9DANV4b4ssxJan9zJQqcHPK/mVsv1hvo8J9GJdfyL9T1G7bcN/gjhnkT9+nl0YMTA
	iNB4YmCEHyO9B2k1ITf5lEJD6a9GpqGhAH0vKnSgXRSiRW6S54dGEHR7UYHdsCaSTvNtz0ZlsQXju
	J6sxPv9u91Cj6wMlwfLlS77RpF79wvZ03Rostx8Gta5Us+nu+q40yKDZ0O/wL0Qcg9jkw++wH93CT
	x0EyaVhMoADNhiYmSwMxJuPH9g46m82GYmGif30hYTqhUWD/+hfPN12OAoObj2nIOVkvTUQxgLJFf
	Ft7wEPFssjXI8gZferkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poQ9u-00Gget-0T;
	Mon, 17 Apr 2023 14:48:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poQ9p-00GgcG-1k;
	Mon, 17 Apr 2023 14:48:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681742915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuH57htx4HoqqPTADyv5r/MQySPN8DmRQYMrJ+PpUgg=;
	b=INb5SzlK5MX/Bq/m0881zfdrzueVbPX5Prz3Xgz2rxss/IDiXaObMBisydQEAC3xunlQOs
	5FoThs8SU4xHlYkNvPHTdHnazGH9MZS0yGJQJLAmwI5D7ZTNc7jYm5HqGNYCHs198vO4Fx
	Z3OtiE3BTc9mB860bA+Z0kx73U3myYwxpdggsQfQrNtW2MsIXh6QqGIKR6eyMV4JP0dPex
	ACDhdDGRvp6HxbcrUCAsTApHuoenv4J1gKFxU7NBHTucKvq6LHYcjtnHCUSe1Q33mLsYAb
	M+FB63wZmlbcOfZKg7GIVobNBFuqhpFRD3yr6B///q6aRnAMLX/Vy4rZO5+ycQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681742915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuH57htx4HoqqPTADyv5r/MQySPN8DmRQYMrJ+PpUgg=;
	b=PyXMLWfIzV3JqDuBaEC9RZdvFmc5btxtvXPM95519mxDIYGaw5KC7da7PccMR5S1yjqMpt
	wr1a07P8ngNdz3AA==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
Date: Mon, 17 Apr 2023 16:48:34 +0200
Message-ID: <87wn2a4la5.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_074841_722882_BF382141 
X-CRM114-Status: UNSURE (   8.08  )
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

UGF1bCEKCk9uIE1vbiwgQXByIDE3IDIwMjMgYXQgMTM6MTksIFBhdWwgTWVuemVsIHdyb3RlOgo+
IEFtIDE1LjA0LjIzIHVtIDAxOjQ0IHNjaHJpZWIgVGhvbWFzIEdsZWl4bmVyOgo+IFsgICAgMC4y
NTgxOTNdIHNtcGJvb3Q6IENQVTA6IEFNRCBBNi02NDAwSyBBUFUgd2l0aCBSYWRlb24odG0pIEhE
IAo+IEdyYXBoaWNzIChmYW1pbHk6IDB4MTUsIG1vZGVsOiAweDEzLCBzdGVwcGluZzogMHgxKQo+
IFvigKZdCj4gWyAgICAwLjI1OTMyOV0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAu
Li4KPiBbICAgIDAuMjU5NTI3XSB4ODY6IEJvb3RpbmcgU01QIGNvbmZpZ3VyYXRpb246Cj4gWyAg
ICAwLjI1OTUyOF0gLi4uLiBub2RlICAjMCwgQ1BVczogICAgICAjMQo+IFsgICAgMC4yNjEwMDdd
IEFmdGVyIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQKPiBbICAgMTAuMjYwOTkwXSBDUFUxIGZh
aWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKCldlaXJkLiBDUFUxIGZhaWxzIHRvIGNvbWUgdXAg
YW5kIHJlcG9ydCB0aGF0IGl0IGhhcyByZWFjaGVkIHRoZQpzeW5jaHJvbml6YXRpb24gcG9pbnQu
CgpEb2VzIGl0IHdvcmsgd2hlbiB5b3UgYWRkIGNwdWhwLnBhcmFsbGVsPW9mZiBvbiB0aGUga2Vy
bmVsIGNvbW1hbmQgbGluZT8KClRoYW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
