Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDECDC7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyVKdD85jKVSCQFGc72VFAcuMHZlcq+nNuEJadp+Xy0=; b=4Xfm2LDNnYMDVD
	wO1FIygFgMClpiX/EyzT9/Ag5ctb8tQgGkZxFOyxqGvL8ndx+bzFAqjy6Bm56JQNcDYVbQu1jifEM
	jo9hTPm0gjyouiivey9Gzmy3dhXqpH3ll1FSaQdO60fEClJjIGttcy/Ucflw6pl8J66tNq2DMOmMm
	CAWqqOTZmphgV1NxBB2VbfS2MU9dsKJRmVSQa9c4NQcGUK487FXZpY0ZrcxEFDdWFNd/Zi68wtvOQ
	hg3crJmHeOzPqyYhNUmp2Y5LTyRseYa4I9F4E3y9EyMysWGQgwEhR4NytpnFlUfCArrM7WFzUuvIf
	oNdUGqA+OAM1MtbkBdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpKZ-0000000CFF9-0S7c;
	Thu, 26 Jun 2025 16:20:07 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoaC-0000000C7p1-3wCy;
	Thu, 26 Jun 2025 15:32:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-32b5226e6beso9837611fa.2;
        Thu, 26 Jun 2025 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951931; x=1751556731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
        b=R1blt6rwpdLmNSMEiKRtIPzl67s/lqIk89s2iXfTEi1xW7CkAC+57Ij7vnuu6Mahhc
         ZS0btAxPU4+LXCx5UhFMr3imVvXoeLDwzhVOdtZ8Sn7Er8NTGjIfY5n1cTvdXlbSOpbR
         JhBNL33wtjUxrLyyCzObjSCvoLa61B1tWMx/zytUtv9aaTO5Ynuql5VFgHnlfBrmRG37
         u5p2VZzeEXiVraLh829FfeKvAnqyRd1QsaJjRbm142EX/LVmyzIRVh6+DOGJQJnI8lVh
         buF7A0mfpeypNN+zUVBnOk8Ee2aw7FwAipbemgep8rpdtWHzlQuZyVe9WjocemvOGqrp
         DQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951931; x=1751556731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
        b=uzT6hQlpQNwGo1hD+I2dc2XsJqUU8ZBuHvuY5+3uyZQONzZc9Fno8of24u3tKIjyeg
         t0gyDfFnAbfqaNZRoVY5jAXH5peVtfQDBv5tkB11uVHgdaw5jW5+diy46A3Qz1mLfnMv
         kT059aynrMHiqXy97SWkfV39vF3+Ue095rBN8z3+FH+35r1gng0Lrf51XPblplbvZ6MW
         fN7gguRz5rTW0g9fE5SlqAlAlVGelqx6i1UvoDDOQ5+13hzYLPZaoLOg/Yd3fb3m0rGZ
         pkEB34K+cCsPKF0+VSzuQ4/VIXUdVlTdX5iWmJFxd6jxFxpAopf8DlVVPDoC4m7nhA0+
         NyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2iD65hBxn/d6LMHnBUEzYgAl1+xHiKACh3Yz7HOIr6T0UAE3hhChCi7AbJXIwWJuTpyLkvhI57ue1F3Y=@lists.infradead.org, AJvYcCVhwzJfhoDDmGFco2oLP6lSEXbeExnx+C49IANbvRnB9a6ffOshp5lOBzY1ieaqYhCiLAB8Deo92hChyXwt4wYT@lists.infradead.org, AJvYcCW5k4BaBPihaz/652XcUHV3romn5tEvuXzOcSVFlfxDxb37oK0bt3eHTRegDX6XV3A8kD4g5pfhVR0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsvJMreCPldaWK+SdbpPW0jAx1Oe8kI/iBes0mB8Z8VQEs/8EU
	ZX3BxNQHrHEIy5aTrk1zIGoS46PrxF+C8krCqLJJ6UnVB2uwvtcMCl2h
X-Gm-Gg: ASbGnct10ir+Q2KzqnIIKBUxcZUTK9mESIf3n483UAZ/LIK4pd0FfaTUfdSd+RuIya/
	uvfqpT8jW+3Nw2KVLu+0PGJfQtZvT3sTGE+dghI/ElxsrJJYkv2wgJl+vbTXdBb0oFPFXzzh732
	1U8cf3gwIVGDzNaGFxcZg9LRG17PG6tOh9PfLuwpu24THTwrTgxepIOs4U7P5cwe1W21AiECfJR
	Q94pYfCeTO7VXFd4gdUbYTORk+/I/y0DILEHyTap/xpxaAq0qMsux7USIxbHMoh41gTtT3KRc3H
	G7tktLXfrg3yr45GY/r17F6ZOKIzJ5BZOUx1vFaUTnbVO2Z7DLWzzm7mLdJbHQHaPjNZubtZ2cK
	DPkruWOFj8INIs/KmJKiZy2b11fGpkQSstOnfWnc3
X-Google-Smtp-Source: AGHT+IE9GYxLiOYhxIA5Ev3WJWnszBqvgVmZmVZpoI4KzTn4pH5uj6GPwII6Blv/6T015vTzfPK1pQ==
X-Received: by 2002:a05:6512:b91:b0:553:adf7:e740 with SMTP id 2adb3069b0e04-554fdd1d728mr2765576e87.28.1750951930696;
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 01/11] kasan: unify static kasan_flag_enabled across modes
Date: Thu, 26 Jun 2025 20:31:37 +0500
Message-Id: <20250626153147.145312-2-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_083212_974309_7A5F5AC8 
X-CRM114-Status: GOOD (  15.33  )
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

SGlzdG9yaWNhbGx5LCB0aGUgcnVudGltZSBzdGF0aWMga2V5IGthc2FuX2ZsYWdfZW5hYmxlZCBl
eGlzdGVkIG9ubHkgZm9yCkNPTkZJR19LQVNBTl9IV19UQUdTIG1vZGUuIEdlbmVyaWMgYW5kIFNX
X1RBR1MgbW9kZXMgZWl0aGVyIHJlbGllZCBvbgphcmNoaXRlY3R1cmUtc3BlY2lmaWMga2FzYW5f
YXJjaF9pc19yZWFkeSgpIGltcGxlbWVudGF0aW9ucyBvciBldmFsdWF0ZWQKS0FTQU4gY2hlY2tz
IHVuY29uZGl0aW9uYWxseSwgbGVhZGluZyB0byBjb2RlIGR1cGxpY2F0aW9uLgoKVGhpcyBwYXRj
aCB1bmlmaWVzIHRoZSBhcHByb2FjaCBieToKCjEuIE1vdmluZyBrYXNhbl9mbGFnX2VuYWJsZWQg
ZGVjbGFyYXRpb24gdW5kZXIgQ09ORklHX0tBU0FOIChhbGwgbW9kZXMpCiAgIGluc3RlYWQgb2Yg
b25seSBDT05GSUdfS0FTQU5fSFdfVEFHUwoyLiBNb3ZpbmcgdGhlIHN0YXRpYyBrZXkgZGVmaW5p
dGlvbiB0byBjb21tb24uYyBmb3Igc2hhcmVkIHVzYWdlCjMuIEFkZGluZyBrYXNhbl9pbml0X2dl
bmVyaWMoKSBmdW5jdGlvbiB0aGF0IGVuYWJsZXMgdGhlIHN0YXRpYyBrZXkgYW5kCiAgIGhhbmRs
ZXMgaW5pdGlhbGl6YXRpb24gZm9yIEdlbmVyaWMgbW9kZQo0LiBVcGRhdGluZyBTV19UQUdTIG1v
ZGUgdG8gZW5hYmxlIHRoZSB1bmlmaWVkIHN0YXRpYyBrZXkKNS4gUmVtb3ZpbmcgdGhlIGR1cGxp
Y2F0ZSBzdGF0aWMga2V5IGRlZmluaXRpb24gZnJvbSBIV19UQUdTCgpBZnRlciB0aGlzIGNoYW5n
ZSwgYWxsIEtBU0FOIG1vZGVzIHVzZSB0aGUgc2FtZSB1bmRlcmx5aW5nIHN0YXRpYyBrZXkKaW5m
cmFzdHJ1Y3R1cmUuIFRoZSBrYXNhbl9lbmFibGVkKCkgZnVuY3Rpb24gbm93IHByb3ZpZGVzIGNv
bnNpc3RlbnQKcnVudGltZSBlbmFibGUgYmVoYXZpb3IgYWNyb3NzIEdlbmVyaWMsIFNXX1RBR1Ms
IGFuZCBIV19UQUdTIG1vZGVzLgoKVGhpcyBtYWludGFpbnMgYSBiYWNrd2FyZCBjb21wYXRpYmls
aXR5IC0gZXhpc3RpbmcgYXJjaGl0ZWN0dXJlIGNvZGUKY29udGludWVzIHRvIHdvcmsgdW5jaGFu
Z2VkLCBidXQgbm93IGJlbmVmaXRzIGZyb20gdGhlIHVuaWZpZWQgcnVudGltZQpjb250cm9sIG1l
Y2hhbmlzbS4gVGhlIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBrYXNhbl9hcmNoX2lzX3JlYWR5KCkK
aW1wbGVtZW50YXRpb25zIGNhbiBiZSBncmFkdWFsbHkgcmVwbGFjZWQgd2l0aCBjYWxscyB0byB0
aGUgbmV3Cmthc2FuX2luaXRfZ2VuZXJpYygpIGZ1bmN0aW9uLgoKQ2xvc2VzOiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxODMxNQpTaWduZWQtb2ZmLWJ5OiBT
YWJ5cnpoYW4gVGFzYm9sYXRvdiA8c25vdml0b2xsQGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRlL2xp
bnV4L2thc2FuLWVuYWJsZWQuaCB8IDEwICsrKysrKysrLS0KIGluY2x1ZGUvbGludXgva2FzYW4u
aCAgICAgICAgIHwgIDYgKysrKysrCiBtbS9rYXNhbi9jb21tb24uYyAgICAgICAgICAgICB8ICA3
ICsrKysrKysKIG1tL2thc2FuL2dlbmVyaWMuYyAgICAgICAgICAgIHwgMTEgKysrKysrKysrKysK
IG1tL2thc2FuL2h3X3RhZ3MuYyAgICAgICAgICAgIHwgIDcgLS0tLS0tLQogbW0va2FzYW4vc3df
dGFncy5jICAgICAgICAgICAgfCAgMiArKwogNiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2FzYW4tZW5h
YmxlZC5oIGIvaW5jbHVkZS9saW51eC9rYXNhbi1lbmFibGVkLmgKaW5kZXggNmY2MTJkNjllYTAu
LjJiMTM1MWMzMGM2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2thc2FuLWVuYWJsZWQuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2thc2FuLWVuYWJsZWQuaApAQCAtNCw5ICs0LDE1IEBACiAKICNp
bmNsdWRlIDxsaW51eC9zdGF0aWNfa2V5Lmg+CiAKLSNpZmRlZiBDT05GSUdfS0FTQU5fSFdfVEFH
UwotCisjaWZkZWYgQ09ORklHX0tBU0FOCisvKgorICogR2xvYmFsIHJ1bnRpbWUgZmxhZy4gU3Rh
cnRzIOKAmGZhbHNl4oCZOyBzd2l0Y2hlZCB0byDigJh0cnVl4oCZIGJ5CisgKiB0aGUgYXBwcm9w
cmlhdGUga2FzYW5faW5pdF8qKCkgb25jZSBLQVNBTiBpcyBmdWxseSBpbml0aWFsaXplZC4KKyAq
LwogREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGthc2FuX2ZsYWdfZW5hYmxlZCk7CisjZW5kaWYK
KworI2lmZGVmIENPTkZJR19LQVNBTl9IV19UQUdTCiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
Ym9vbCBrYXNhbl9lbmFibGVkKHZvaWQpCiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2th
c2FuLmggYi9pbmNsdWRlL2xpbnV4L2thc2FuLmgKaW5kZXggODkwMDExMDcxZjIuLjUxYTgyOTNk
MWFmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2thc2FuLmgKKysrIGIvaW5jbHVkZS9saW51
eC9rYXNhbi5oCkBAIC01NDMsNiArNTQzLDEyIEBAIHZvaWQga2FzYW5fcmVwb3J0X2FzeW5jKHZv
aWQpOwogCiAjZW5kaWYgLyogQ09ORklHX0tBU0FOX0hXX1RBR1MgKi8KIAorI2lmZGVmIENPTkZJ
R19LQVNBTl9HRU5FUklDCit2b2lkIF9faW5pdCBrYXNhbl9pbml0X2dlbmVyaWModm9pZCk7Cisj
ZWxzZQorc3RhdGljIGlubGluZSB2b2lkIGthc2FuX2luaXRfZ2VuZXJpYyh2b2lkKSB7IH0KKyNl
bmRpZgorCiAjaWZkZWYgQ09ORklHX0tBU0FOX1NXX1RBR1MKIHZvaWQgX19pbml0IGthc2FuX2lu
aXRfc3dfdGFncyh2b2lkKTsKICNlbHNlCmRpZmYgLS1naXQgYS9tbS9rYXNhbi9jb21tb24uYyBi
L21tL2thc2FuL2NvbW1vbi5jCmluZGV4IGVkNDg3M2UxOGM3Li41MjUxOTRkYTI1ZiAxMDA2NDQK
LS0tIGEvbW0va2FzYW4vY29tbW9uLmMKKysrIGIvbW0va2FzYW4vY29tbW9uLmMKQEAgLTMyLDYg
KzMyLDEzIEBACiAjaW5jbHVkZSAia2FzYW4uaCIKICNpbmNsdWRlICIuLi9zbGFiLmgiCiAKKy8q
CisgKiBEZWZpbml0aW9uIG9mIHRoZSB1bmlmaWVkIHN0YXRpYyBrZXkgZGVjbGFyZWQgaW4ga2Fz
YW4tZW5hYmxlZC5oLgorICogVGhpcyBwcm92aWRlcyBjb25zaXN0ZW50IHJ1bnRpbWUgZW5hYmxl
L2Rpc2FibGUgYWNyb3NzIGFsbCBLQVNBTiBtb2Rlcy4KKyAqLworREVGSU5FX1NUQVRJQ19LRVlf
RkFMU0Uoa2FzYW5fZmxhZ19lbmFibGVkKTsKK0VYUE9SVF9TWU1CT0woa2FzYW5fZmxhZ19lbmFi
bGVkKTsKKwogc3RydWN0IHNsYWIgKmthc2FuX2FkZHJfdG9fc2xhYihjb25zdCB2b2lkICphZGRy
KQogewogCWlmICh2aXJ0X2FkZHJfdmFsaWQoYWRkcikpCmRpZmYgLS1naXQgYS9tbS9rYXNhbi9n
ZW5lcmljLmMgYi9tbS9rYXNhbi9nZW5lcmljLmMKaW5kZXggZDU0ZTg5ZjhjM2UuLjMyYzQzMmRm
MjRhIDEwMDY0NAotLS0gYS9tbS9rYXNhbi9nZW5lcmljLmMKKysrIGIvbW0va2FzYW4vZ2VuZXJp
Yy5jCkBAIC0zNiw2ICszNiwxNyBAQAogI2luY2x1ZGUgImthc2FuLmgiCiAjaW5jbHVkZSAiLi4v
c2xhYi5oIgogCisvKgorICogSW5pdGlhbGl6ZSBHZW5lcmljIEtBU0FOIGFuZCBlbmFibGUgcnVu
dGltZSBjaGVja3MuCisgKiBUaGlzIHNob3VsZCBiZSBjYWxsZWQgZnJvbSBhcmNoIGthc2FuX2lu
aXQoKSBvbmNlIHNoYWRvdyBtZW1vcnkgaXMgcmVhZHkuCisgKi8KK3ZvaWQgX19pbml0IGthc2Fu
X2luaXRfZ2VuZXJpYyh2b2lkKQoreworCXN0YXRpY19icmFuY2hfZW5hYmxlKCZrYXNhbl9mbGFn
X2VuYWJsZWQpOworCisJcHJfaW5mbygiS2VybmVsQWRkcmVzc1Nhbml0aXplciBpbml0aWFsaXpl
ZCAoZ2VuZXJpYylcbiIpOworfQorCiAvKgogICogQWxsIGZ1bmN0aW9ucyBiZWxvdyBhbHdheXMg
aW5saW5lZCBzbyBjb21waWxlciBjb3VsZAogICogcGVyZm9ybSBiZXR0ZXIgb3B0aW1pemF0aW9u
cyBpbiBlYWNoIG9mIF9fYXNhbl9sb2FkWC9fX2Fzc25fc3RvcmVYCmRpZmYgLS1naXQgYS9tbS9r
YXNhbi9od190YWdzLmMgYi9tbS9rYXNhbi9od190YWdzLmMKaW5kZXggOWE2OTI3Mzk0YjUuLjhl
ODE5ZmM0YTI2IDEwMDY0NAotLS0gYS9tbS9rYXNhbi9od190YWdzLmMKKysrIGIvbW0va2FzYW4v
aHdfdGFncy5jCkBAIC00NSwxMyArNDUsNiBAQCBzdGF0aWMgZW51bSBrYXNhbl9hcmcga2FzYW5f
YXJnIF9fcm9fYWZ0ZXJfaW5pdDsKIHN0YXRpYyBlbnVtIGthc2FuX2FyZ19tb2RlIGthc2FuX2Fy
Z19tb2RlIF9fcm9fYWZ0ZXJfaW5pdDsKIHN0YXRpYyBlbnVtIGthc2FuX2FyZ192bWFsbG9jIGth
c2FuX2FyZ192bWFsbG9jIF9faW5pdGRhdGE7CiAKLS8qCi0gKiBXaGV0aGVyIEtBU0FOIGlzIGVu
YWJsZWQgYXQgYWxsLgotICogVGhlIHZhbHVlIHJlbWFpbnMgZmFsc2UgdW50aWwgS0FTQU4gaXMg
aW5pdGlhbGl6ZWQgYnkga2FzYW5faW5pdF9od190YWdzKCkuCi0gKi8KLURFRklORV9TVEFUSUNf
S0VZX0ZBTFNFKGthc2FuX2ZsYWdfZW5hYmxlZCk7Ci1FWFBPUlRfU1lNQk9MKGthc2FuX2ZsYWdf
ZW5hYmxlZCk7Ci0KIC8qCiAgKiBXaGV0aGVyIHRoZSBzZWxlY3RlZCBtb2RlIGlzIHN5bmNocm9u
b3VzLCBhc3luY2hyb25vdXMsIG9yIGFzeW1tZXRyaWMuCiAgKiBEZWZhdWx0cyB0byBLQVNBTl9N
T0RFX1NZTkMuCmRpZmYgLS1naXQgYS9tbS9rYXNhbi9zd190YWdzLmMgYi9tbS9rYXNhbi9zd190
YWdzLmMKaW5kZXggYjkzODJiNWI2YTMuLjUyNWJjOTFlMmZjIDEwMDY0NAotLS0gYS9tbS9rYXNh
bi9zd190YWdzLmMKKysrIGIvbW0va2FzYW4vc3dfdGFncy5jCkBAIC00NSw2ICs0NSw4IEBAIHZv
aWQgX19pbml0IGthc2FuX2luaXRfc3dfdGFncyh2b2lkKQogCiAJa2FzYW5faW5pdF90YWdzKCk7
CiAKKwlzdGF0aWNfYnJhbmNoX2VuYWJsZSgma2FzYW5fZmxhZ19lbmFibGVkKTsKKwogCXByX2lu
Zm8oIktlcm5lbEFkZHJlc3NTYW5pdGl6ZXIgaW5pdGlhbGl6ZWQgKHN3LXRhZ3MsIHN0YWNrdHJh
Y2U9JXMpXG4iLAogCQlzdHJfb25fb2ZmKGthc2FuX3N0YWNrX2NvbGxlY3Rpb25fZW5hYmxlZCgp
KSk7CiB9Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
