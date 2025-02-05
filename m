Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC0C02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RhGrcfXYhShyjH3rrwCvTv/g1ZDduZRXOLqkkICVSg=; b=imU+7BIjsL78xD
	jdS7Z1ozlCxXQmju7geiANLWIlKVNVIG7XYl0e8KiyQCrUbYRvALTzGXSt1rpmh04l/219yGPvY8+
	kCsPFrheeQKZBZBA2kgGqmJdAQ5t+kMI5OLvT/3rkjfnAMI8dutqZ4MI4KjQSoh788vznffRq+df4
	O7kAZJmTGBlIMObcxmVJ7tNxGvsnY418hXXaAuUBJHRT31ZfuXkRz6kHPqZvIUJlo12SBATblB7cX
	MHCJta+Y+OZfrEIsKorWu25bO1cTMN4en7puREU9AEHxqn1qwP1B7IHqGFyys9qSai6kMpEEu0DZJ
	kQmSn1WauKXjOVFChJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfp6K-00000004rzd-38z1;
	Wed, 05 Feb 2025 23:46:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfp6I-00000004ryc-0OK2;
	Wed, 05 Feb 2025 23:46:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso2028225e9.0;
        Wed, 05 Feb 2025 15:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799192; x=1739403992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=splJksFz56TDIrwwM0xZxaI8hN1W91tSLAlTGFboN5c=;
        b=UOEsLiVE+4LtiHkGSJEFVdSw4vC29jajYUYu9NS1kJbFBrCtjJuA3xl9eOuCpEhQxI
         cwR13JFVvGWP18oL50Tkr+G9I4+B5F2/ollN5wl26qfb9TKCF82o/36S2GhbL9XfoU4c
         Azyb4mt7K2scnS8SScB4VpzF+DBYD+uAOXzK+v8r0GLKAntkNZhnNC4my5m169mp/5PN
         8aCXXg8KT+fcBL1nKfG23sGgzyXiHfpnZVL0W2b0EK2QHQOswZ8HXlemOqTeJJOg7A6M
         ok1gnykHrpWKNHvZvlFEP/QUZv7rCnC79s7zz7zDy+JR878a2gY3c0cX9Y0nyzgiJfxN
         UG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799192; x=1739403992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=splJksFz56TDIrwwM0xZxaI8hN1W91tSLAlTGFboN5c=;
        b=kEb/9Dlffuv+8Q/amoh/DKljySCHouI9JL1ukxYEe7UnHAGc+BXaYmMbxw4roop529
         eY+lLpMgbFVo7kU51Ia97mKyHhavF/XmtmszrPpiPibbjxG9tEKzekDH99kRz9Dkjz0z
         6HVku6hqzWc++g1e8kmiYZ8XRXKzcRDJjLXaS6BLxW9G/aOSOHQKIzQd1yyCqWiNNC6G
         /P686QRlJBCi57MOQjTRRGZVyYkclJtN9UDlA8HSccwL9bWzs78yGadMxJ4wovh5/Dtt
         iFpUZzqk88W8oK0jPQUXHWW91oWFJg2IG2Ocr95R2JUzuj92mlD3STb04wE17buVYuSK
         0Nig==
X-Forwarded-Encrypted: i=1; AJvYcCUh/l49Ljad//+RCy8sSNHgFaujlBsw5zhl/8Xz/72Y5uagc+EQ1ONR9RKrkeBWnR6Q6JkV+FDLEeV3pMsTEXli@lists.infradead.org, AJvYcCV4odECu21ILiHPB9ZNQuy6470K9Ew5Ov2yZrnhBLtJn4L5BchnDtJ+U7MG8xilCjpbo9fmyUw2TaZRnrg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaO2Krc75lKluC14hGvNWh/P1wY03YpisoSLZ5ewZ5YkipJjgb
	+VimUfCLlunKGpPTDVaOXl3X4WNBiqhmu/GyHiRe+OVzWQDBKXVbSk8YyLIlozz98Bbvf6HQJWA
	Miu4At5Cp7JZ1dbQIxHaio9PaRYo=
X-Gm-Gg: ASbGncsbB7653WKGNnYkuUAkjGszL28d03Ab2gNLM/ddpCvkX5YI3aF5MpKNh2QLPVO
	bM8uhj/t+KMgfhq7hnoQ2z/DUu0eu+Cz9RtEajziAuOA1hzTwD0JRGhY+SCYOwrmUVvAIvBzVZg
	==
X-Google-Smtp-Source: AGHT+IFSFHWVEoOQLLmJ+PaOxc/EbVSarQ3d2dwZcdG6PEJNBpkGd7CO8NPniQu76duw1X2UJRbhBv8DnKzYKrkcERY=
X-Received: by 2002:a5d:64af:0:b0:38a:518d:97b with SMTP id
 ffacd0b85a97d-38db4858781mr3265952f8f.11.1738799192252; Wed, 05 Feb 2025
 15:46:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:46:21 +0100
X-Gm-Features: AWEUYZmWa4puMe4djsB8DuAJDHlgw8tfTIgkGA6kMcFx6SJvTthEfUEqJBWFe6Q
Message-ID: <CA+fCnZcG0nv1_ezc+yu3Wj_7iS0r_QfK9OcDnK-MRmJ=BF4iJg@mail.gmail.com>
Subject: Re: [PATCH 15/15] kasan: Add mititgation and debug modes
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_154634_132918_07A1AE00 
X-CRM114-Status: GOOD (  26.07  )
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

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA2OjM34oCvUE0gTWFjaWVqIFdpZWN6b3ItUmV0bWFuCjxt
YWNpZWoud2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPgo+IFdpdGggc21hbGxlciBt
ZW1vcnkgZm9vdHByaW50IEtBU0FOIGNvdWxkIGJlIHVzZWQgaW4gcHJvZHVjdGlvbiBzeXN0ZW1z
Lgo+IE9uZSBwcm9ibGVtIGlzIHRoYXQgc2F2aW5nIHN0YWNrdHJhY2VzIHNsb3dlcyBtZW1vcnkg
YWxsb2NhdGlvbgo+IHN1YnN0YW50aWFsbHkgLSB3aXRoIEtBU0FOIGVuYWJsZWQgdXAgdG8gOTAl
IG9mIHRpbWUgc3BlbnQgb24ga21hbGxvYygpCj4gaXMgc3BlbnQgb24gc2F2aW5nIHRoZSBzdGFj
a3RyYWNlLgo+Cj4gQWRkIG1pdGlnYXRpb24gbW9kZSB0byBhbGxvdyB0aGUgb3B0aW9uIGZvciBy
dW5uaW5nIEtBU0FOIGZvY3VzZWQgb24KPiBwZXJmb3JtYW5jZSBhbmQgc2VjdXJpdHkuIEluIG1p
dGlnYXRpb24gbW9kZSBkaXNhYmxlIHNhdmluZyBzdGFja3RyYWNlcwo+IGFuZCBzZXQgZmF1bHQg
bW9kZSB0byBhbHdheXMgcGFuaWMgb24gS0FTQU4gZXJyb3IgYXMgYSBzZWN1cml0eQo+IG1lY2hh
bmlzbS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBXaWVjem9yLVJldG1hbiA8bWFjaWVqLndp
ZWN6b3ItcmV0bWFuQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL0tjb25maWcua2FzYW4gfCAyOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIG1tL2thc2FuL3JlcG9ydC5jIHwgIDQgKysr
Kwo+ICBtbS9rYXNhbi90YWdzLmMgICB8ICA1ICsrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmthc2FuIGIvbGliL0tj
b25maWcua2FzYW4KPiBpbmRleCBkMDhiNGU5YmY0NzcuLjZkYWE2MmI0MGRlYSAxMDA2NDQKPiAt
LS0gYS9saWIvS2NvbmZpZy5rYXNhbgo+ICsrKyBiL2xpYi9LY29uZmlnLmthc2FuCj4gQEAgLTI0
NCw0ICsyNDQsMzIgQEAgY29uZmlnIEtBU0FOX1NXX1RBR1NfREVOU0UKPiAgICAgICAgICAgQVJD
SF9IQVNfS0FTQU5fU1dfVEFHU19ERU5TRSBpcyBuZWVkZWQgZm9yIHRoaXMgb3B0aW9uIHNpbmNl
IHRoZQo+ICAgICAgICAgICBzcGVjaWFsIHRhZyBtYWNyb3MgbmVlZCB0byBiZSBwcm9wZXJseSBz
ZXQgZm9yIDQtYml0IHdpZGUgdGFncy4KPgo+ICtjaG9pY2UKPiArICAgICAgIHByb21wdCAiS0FT
QU4gb3BlcmF0aW9uIG1vZGUiCj4gKyAgICAgICBkZWZhdWx0IEtBU0FOX09QRVJBVElPTl9ERUJV
Rwo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBDaG9vc2UgYmV0d2VlbiB0aGUgbWl0aWdhdGlv
biBvciBkZWJ1ZyBvcGVyYXRpb24gbW9kZXMuCj4gKwo+ICsgICAgICAgICBUaGUgZmlyc3Qgb25l
IGRpc2FibGVzIHN0YWNrdHJhY2Ugc2F2aW5nIGFuZCBlbmFibGVzIHBhbmljIG9uIGVycm9yLgo+
ICsgICAgICAgICBGYXN0ZXIgbWVtb3J5IGFsbG9jYXRpb24gYnV0IGxlc3MgaW5mb3JtYXRpb24u
IFRoZSBzZWNvbmQgb25lIGlzIHRoZQo+ICsgICAgICAgICBkZWZhdWx0IHdoZXJlIEtBU0FOIG9w
ZXJhdGVzIHdpdGggZnVsbCBmdW5jdGlvbmFsaXR5LgoKVGhpcyBpcyBzb21ldGhpbmcgdGhhdCBJ
IHRob3VnaHQgYWJvdXQgYmVmb3JlIGFuZCBJIHRoaW5rIHdlIHNob3VsZApfbm90XyBhZGQgY29u
ZmlndXJhdGlvbiBvcHRpb25zIGxpa2UgdGhlc2UuIFRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVuCmRl
YnVnIGFuZCBtaXRpZ2F0aW9uIG1vZGVzIGlzIHNvbWV0aGluZyB0aGF0J3Mgc3BlY2lmaWMgdG8g
YQpwYXJ0aWN1bGFyIHVzZXIgb2YgdGhlIGZlYXR1cmUuIFNvbWUgbWlnaHQgcHJlZmVyIHRvIHRh
a2UgdGhlIGltcGFjdApvZiBoYXZpbmcgc3RhY2sgdHJhY2VzIGVuYWJsZWQgaW4gYSBwcm9kdWN0
aW9uIGVudmlyb25tZW50IHRvIGFsbG93CmRlYnVnZ2luZyBpbi10aGUtd2lsZCBleHBsb2l0YXRp
b24gYXR0ZW1wdHMuIEFsc28gYXQgc29tZSBwb2ludCBpbiB0aGUKZnV0dXJlLCB3ZSB3aWxsIGhv
cGVmdWxseSBoYXZlIHByb2R1Y3Rpb24tZ3JhZGUgc3RhY2sgdHJhY2VzIFsxXSwgYW5kCnRoaXMg
d291bGQgdGh1cyBjaGFuZ2UgdGhlIGRlc2lyZWQgYmVoYXZpb3Igb2YKS0FTQU5fT1BFUkFUSU9O
X01JVElHQVRJT04uCgpXZSBhbHJlYWR5IGhhdmUgdGhlIGthc2FuLnN0YWNrdHJhY2UgY29tbWFu
ZC1saW5lIHBhcmFtZXRlciBmb3IKZGlzYWJsaW5nIHN0YWNrIHRyYWNlIGNvbGxlY3Rpb24uIE9u
IHRvcCBvZiB0aGF0LCBpZiB5b3UgcHJlZmVyLCB3ZQpjb3VsZCBhZGQgYSBjb25maWd1cmF0aW9u
IG9wdGlvbiB0aGF0IGNoYW5nZXMgdGhlIGRlZmF1bHQgdmFsdWUgb2YKa2FzYW5fZmxhZ19zdGFj
a3RyYWNlIChidXQgY2FuIHN0aWxsIGJlIG92ZXJyaWRkZW4gdmlhIHRoZQprYXNhbi5zdGFja3Ry
YWNlIGNvbW1hbmQtbGluZSBwYXJhbWV0ZXIpLiBOb3RlIHRob3VnaCB0aGF0IGJ5IGRlZmF1bHQs
CnN0YWNrIHRyYWNlcyBzaG91bGQgYmUgdHVybmVkIG9uLgoKWzFdIGh0dHBzOi8vYnVnemlsbGEu
a2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjExNzg1CgoKPiArCj4gK2NvbmZpZyBLQVNBTl9P
UEVSQVRJT05fREVCVUcKPiArICAgICAgIGJvb2wgIkRlYnVnIG9wZXJhdGlvbiBtb2RlIgo+ICsg
ICAgICAgZGVwZW5kcyBvbiBLQVNBTgo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBUaGUgZGVm
YXVsdCBtb2RlLiBGdWxsIGZ1bmN0aW9uYWxpdHkgYW5kIGFsbCBib290IHBhcmFtZXRlcnMKPiAr
ICAgICAgICAgYXZhaWxhYmxlLgo+ICsKPiArY29uZmlnIEtBU0FOX09QRVJBVElPTl9NSVRJR0FU
SU9OCj4gKyAgICAgICBib29sICJNaXRpZ2F0aW9uIG9wZXJhdGlvbiBtb2RlIgo+ICsgICAgICAg
ZGVwZW5kcyBvbiBLQVNBTgo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBPcGVyYXRpb24gbW9k
ZSBkZWRpY2F0ZWQgYXQgZmFzdGVyIG9wZXJhdGlvbiBhdCB0aGUgY29zdCBvZiBsZXNzCj4gKyAg
ICAgICAgIGluZm9ybWF0aW9uIGNvbGxlY3Rpb24uIERpc2FibGVzIHN0YWNrdHJhY2Ugc2F2aW5n
IGZvciBmYXN0ZXIKPiArICAgICAgICAgYWxsb2NhdGlvbnMgYW5kIGZvcmNlcyBwYW5pYyBvbiBL
QVNBTiBlcnJvciB0byBtaXRpZ2F0ZSBtYWxpY2lvdXMKPiArICAgICAgICAgYXR0YWNrcy4KPiAr
Cj4gK2VuZGNob2ljZQo+ICsKPiAgZW5kaWYgIyBLQVNBTgo+IGRpZmYgLS1naXQgYS9tbS9rYXNh
bi9yZXBvcnQuYyBiL21tL2thc2FuL3JlcG9ydC5jCj4gaW5kZXggZWU5ZTQwNmIwY2RiLi5hZTk4
OWQzYmQ5MTkgMTAwNjQ0Cj4gLS0tIGEvbW0va2FzYW4vcmVwb3J0LmMKPiArKysgYi9tbS9rYXNh
bi9yZXBvcnQuYwo+IEBAIC00Nyw3ICs0NywxMSBAQCBlbnVtIGthc2FuX2FyZ19mYXVsdCB7Cj4g
ICAgICAgICBLQVNBTl9BUkdfRkFVTFRfUEFOSUNfT05fV1JJVEUsCj4gIH07Cj4KPiArI2lmZGVm
IENPTkZJR19LQVNBTl9PUEVSQVRJT05fTUlUSUdBVElPTgo+ICtzdGF0aWMgZW51bSBrYXNhbl9h
cmdfZmF1bHQga2FzYW5fYXJnX2ZhdWx0IF9fcm9fYWZ0ZXJfaW5pdCA9IEtBU0FOX0FSR19GQVVM
VF9QQU5JQzsKPiArI2Vsc2UKPiAgc3RhdGljIGVudW0ga2FzYW5fYXJnX2ZhdWx0IGthc2FuX2Fy
Z19mYXVsdCBfX3JvX2FmdGVyX2luaXQgPSBLQVNBTl9BUkdfRkFVTFRfREVGQVVMVDsKPiArI2Vu
ZGlmCj4KPiAgLyoga2FzYW4uZmF1bHQ9cmVwb3J0L3BhbmljICovCj4gIHN0YXRpYyBpbnQgX19p
bml0IGVhcmx5X2thc2FuX2ZhdWx0KGNoYXIgKmFyZykKPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4v
dGFncy5jIGIvbW0va2FzYW4vdGFncy5jCj4gaW5kZXggYzExMWQ5ODk2MWVkLi4yNDE0Y2RkZWFh
ZjMgMTAwNjQ0Cj4gLS0tIGEvbW0va2FzYW4vdGFncy5jCj4gKysrIGIvbW0va2FzYW4vdGFncy5j
Cj4gQEAgLTc4LDYgKzc4LDExIEBAIGVhcmx5X3BhcmFtKCJrYXNhbi5zdGFja19yaW5nX3NpemUi
LCBlYXJseV9rYXNhbl9mbGFnX3N0YWNrX3Jpbmdfc2l6ZSk7Cj4KPiAgdm9pZCBfX2luaXQga2Fz
YW5faW5pdF90YWdzKHZvaWQpCj4gIHsKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19L
QVNBTl9PUEVSQVRJT05fTUlUSUdBVElPTikpIHsKPiArICAgICAgICAgICAgICAgc3RhdGljX2Jy
YW5jaF9kaXNhYmxlKCZrYXNhbl9mbGFnX3N0YWNrdHJhY2UpOwo+ICsgICAgICAgICAgICAgICBy
ZXR1cm47Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgc3dpdGNoIChrYXNhbl9hcmdfc3RhY2t0
cmFjZSkgewo+ICAgICAgICAgY2FzZSBLQVNBTl9BUkdfU1RBQ0tUUkFDRV9ERUZBVUxUOgo+ICAg
ICAgICAgICAgICAgICAvKiBEZWZhdWx0IGlzIHNwZWNpZmllZCBieSBrYXNhbl9mbGFnX3N0YWNr
dHJhY2UgZGVmaW5pdGlvbi4gKi8KPiAtLQo+IDIuNDcuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
