Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65811C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 17:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/P0Yx5n8BDyHNVzD1iIMsUolO4JrkaRb0T4+78p9no=; b=f7trspss8UGArR
	ip/svOsXn4DG9wGLfDfLSfgIQaDbzayINBZVKdzFUsDzvgLTZKehHwd6mqbHjrzlFGJ4fFOjxLX3f
	Jgvz2DxA2bzSmKwra3Gwi/1lH8HvWMz7EH0w8VuFqy293zF4kcDnFg8rAaDqOXp6TCWSeZyws4YI4
	a67BId6gbTNqrzmArT9ahXLbFnhkRXHXCqPc9u8hOk6eoCTMmjw3VaoHtMA0LcK7zKM+Unu6e6/DJ
	xAbrpJ5Q/ZBN4JlPU2WeFRySQxMdjMITizZDiOxiDJbcs73sbYQP/GFJLTiW5uM8uiJRhxckKjCLO
	JxLpmtZt6+vHyPbLlxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqKN-0000000CMf3-3XdY;
	Thu, 26 Jun 2025 17:23:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUobJ-0000000C8VZ-2GX5;
	Thu, 26 Jun 2025 15:33:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553dceb345eso1130552e87.1;
        Thu, 26 Jun 2025 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750952000; x=1751556800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
        b=YcEgX2nzi1IPZcH72Uo8wHSOVzXb672yfL6QMvQvI4TkXvLVpP5ej+2ghqic50F38c
         arJq3iYwwXGe4XGo57iQmy0zxtMSlDMfl45H6FWm9xZ+Kg5PCba6bndu4ibASAqJV09h
         ysu24tmrAIcNyVmoUK0/P1AOKJGXMr79LNveMU6WyYhL09GxouCIJMRQA+p7oGof63Pd
         gNX/f7JS0ogHYKRwWl9QOtwUXsHS5q4G790hAYQQi1UBbjthC3Onl4nv/NA4uj73njAk
         j+hJ13PIgF4bb2VcSe+Lci7yRs4Mr0TgKfkVOi1EI5lUFyc73z3layqDUG3+CRH7tjTQ
         p/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750952000; x=1751556800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
        b=EuTuVYaEPJ2TyIahvLkvlQp9tnry0OCWsETTseaMcT5OtHlK39CRO9Q4HsgnHrqNkG
         ugqrjmzGb9KRRLce1k3HtWz1jyysQ49CJRLRzYdQ3f0XxM0/vVaWrlyP2kDaGeOYL8lh
         u7ke5LfOSRhhU5eHHyAhgu+b0eNiI8inJijAHqfPEp++sKg4UsnQ16k8SFv4kBIpQmZt
         /j1N6HoZm2k5em/o52uVoSWWLz2AHJSY4K3CDeXOTsEt7xdn5xDcxECEUk0K+cXKCWWE
         EP4r35baz3yY2AgCByA/hfOwxG62ZuT0Qh8BcxZN+9Tm43F9TeVMALCxkIrfNoYDXkqt
         JO9A==
X-Forwarded-Encrypted: i=1; AJvYcCV52Rv0JjYcXtccf7VFf95i9DaUJcxr1DxLzL32lWgRPHOYK09ZsqAJxzqb4nBS/gXS91uKeMiEB0A=@lists.infradead.org, AJvYcCVGKaKzQN72C2Tb+BEgM6NG5VoQI06fC3rf4FGWxXGi6wI4OMzwt7O7cq26kb/AsnkcL48AUJd8urBkgvgbEyVD@lists.infradead.org, AJvYcCWL8UGr2L7hBZ+FILto7ajrZ+XtOPCqBqjfV/ESydzo1iUXMCXUuc+Kj15PTy9dIGMPlmCIa5jP/6i/GHI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrAnKY00RM1Qj8/1UG7/ro5EV2kQkOkpBXebO3xZ96QtlWF07
	JkB4K/Lbq4brBE4niAWsEGG/CWWw3r4hSOR5aLMvLQ06BqmPL617tiIs
X-Gm-Gg: ASbGncvrAuEtQ78oJEonOvYSIA3tTj+xqWHL1kd95oE9YxxayK1H3u3JNerrlBPMrt4
	x5DGZqvWgdjYewT9ZhJr0NASvEiTWltC3INhHOGEvcb5tbe3tYej6PxIXLD2vTe1Dm988kXbin6
	FFrvPHPY/jPT3KD9V19jljeBDwxsX9n1NA9Ygt0aJqzc1HMTjszSYYxHo8ZFHMzncIyBAME88EL
	ksOrHx3eu9EL+Lu9ZnAWKopvsjTNOumMYzS51zqKS2F01btvyb9WMsueB7ev7oKHGWgzsouzXMS
	+DC8iVCNiQhNh6HkaEwAsemWUBwIS+yXccoBjExnflaqfA4Vc1dHn+eKM3JZf5BUYvwz7mk59Sg
	eSyEUapDzVYaf2iaFagSVmUAq4ovojg==
X-Google-Smtp-Source: AGHT+IGY311+Wdu3kb/XvX91pk/iQewvyeMEbYN3t0cf6Gst1F46Nt/0GHv4Ja5q8VZUcn9wuGuFjg==
X-Received: by 2002:a05:6512:12c2:b0:553:28f1:66ec with SMTP id 2adb3069b0e04-554fdd47009mr2940330e87.31.1750951999683;
        Thu, 26 Jun 2025 08:33:19 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:18 -0700 (PDT)
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
Subject: [PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled
Date: Thu, 26 Jun 2025 20:31:47 +0500
Message-Id: <20250626153147.145312-12-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_083321_678696_CD913A54 
X-CRM114-Status: GOOD (  15.06  )
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

UmVwbGFjZSB0aGUgZXhpc3Rpbmcga2FzYW5fYXJjaF9pc19yZWFkeSgpIGNhbGxzIHdpdGgga2Fz
YW5fZW5hYmxlZCgpLgpEcm9wIGNoZWNrcyB3aGVyZSB0aGUgY2FsbGVyIGlzIGFscmVhZHkgdW5k
ZXIga2FzYW5fZW5hYmxlZCgpIGNvbmRpdGlvbi4KCkNsb3NlczogaHR0cHM6Ly9idWd6aWxsYS5r
ZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTgzMTUKU2lnbmVkLW9mZi1ieTogU2FieXJ6aGFu
IFRhc2JvbGF0b3YgPHNub3ZpdG9sbEBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rYXNh
bi1lbmFibGVkLmggfCAyMCArKysrKysrKysrKystLS0tLS0tLQogbW0va2FzYW4vY29tbW9uLmMg
ICAgICAgICAgICAgfCAgOCArKysrLS0tLQogbW0va2FzYW4vZ2VuZXJpYy5jICAgICAgICAgICAg
fCAgNiArKystLS0KIG1tL2thc2FuL2thc2FuLmggICAgICAgICAgICAgIHwgIDYgLS0tLS0tCiBt
bS9rYXNhbi9zaGFkb3cuYyAgICAgICAgICAgICB8IDE1ICsrKy0tLS0tLS0tLS0tLQogNSBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2thc2FuLWVuYWJsZWQuaCBiL2luY2x1ZGUvbGludXgva2FzYW4tZW5h
YmxlZC5oCmluZGV4IDJiMTM1MWMzMGM2Li4yNDM2ZWI0NWNmZSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9rYXNhbi1lbmFibGVkLmgKKysrIGIvaW5jbHVkZS9saW51eC9rYXNhbi1lbmFibGVk
LmgKQEAgLTUsMzIgKzUsMzYgQEAKICNpbmNsdWRlIDxsaW51eC9zdGF0aWNfa2V5Lmg+CiAKICNp
ZmRlZiBDT05GSUdfS0FTQU4KKwogLyoKICAqIEdsb2JhbCBydW50aW1lIGZsYWcuIFN0YXJ0cyDi
gJhmYWxzZeKAmTsgc3dpdGNoZWQgdG8g4oCYdHJ1ZeKAmSBieQogICogdGhlIGFwcHJvcHJpYXRl
IGthc2FuX2luaXRfKigpIG9uY2UgS0FTQU4gaXMgZnVsbHkgaW5pdGlhbGl6ZWQuCiAgKi8KIERF
Q0xBUkVfU1RBVElDX0tFWV9GQUxTRShrYXNhbl9mbGFnX2VuYWJsZWQpOwotI2VuZGlmCi0KLSNp
ZmRlZiBDT05GSUdfS0FTQU5fSFdfVEFHUwogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wg
a2FzYW5fZW5hYmxlZCh2b2lkKQogewogCXJldHVybiBzdGF0aWNfYnJhbmNoX2xpa2VseSgma2Fz
YW5fZmxhZ19lbmFibGVkKTsKIH0KIAotc3RhdGljIGlubGluZSBib29sIGthc2FuX2h3X3RhZ3Nf
ZW5hYmxlZCh2b2lkKQorI2Vsc2UgLyogIUNPTkZJR19LQVNBTiAqLworCitzdGF0aWMgX19hbHdh
eXNfaW5saW5lIGJvb2wga2FzYW5fZW5hYmxlZCh2b2lkKQogewotCXJldHVybiBrYXNhbl9lbmFi
bGVkKCk7CisJcmV0dXJuIGZhbHNlOwogfQogCi0jZWxzZSAvKiBDT05GSUdfS0FTQU5fSFdfVEFH
UyAqLworI2VuZGlmIC8qIENPTkZJR19LQVNBTiAqLworCisjaWZkZWYgQ09ORklHX0tBU0FOX0hX
X1RBR1MKIAotc3RhdGljIGlubGluZSBib29sIGthc2FuX2VuYWJsZWQodm9pZCkKK3N0YXRpYyBp
bmxpbmUgYm9vbCBrYXNhbl9od190YWdzX2VuYWJsZWQodm9pZCkKIHsKLQlyZXR1cm4gSVNfRU5B
QkxFRChDT05GSUdfS0FTQU4pOworCXJldHVybiBrYXNhbl9lbmFibGVkKCk7CiB9CiAKKyNlbHNl
IC8qICFDT05GSUdfS0FTQU5fSFdfVEFHUyAqLworCiBzdGF0aWMgaW5saW5lIGJvb2wga2FzYW5f
aHdfdGFnc19lbmFibGVkKHZvaWQpCiB7CiAJcmV0dXJuIGZhbHNlOwpkaWZmIC0tZ2l0IGEvbW0v
a2FzYW4vY29tbW9uLmMgYi9tbS9rYXNhbi9jb21tb24uYwppbmRleCA1MjUxOTRkYTI1Zi4uMGYz
NjQ4MzM1YTYgMTAwNjQ0Ci0tLSBhL21tL2thc2FuL2NvbW1vbi5jCisrKyBiL21tL2thc2FuL2Nv
bW1vbi5jCkBAIC0yNTcsNyArMjU3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBvaXNvbl9zbGFi
X29iamVjdChzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsIHZvaWQgKm9iamVjdCwKIGJvb2wgX19r
YXNhbl9zbGFiX3ByZV9mcmVlKHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwgdm9pZCAqb2JqZWN0
LAogCQkJCXVuc2lnbmVkIGxvbmcgaXApCiB7Ci0JaWYgKCFrYXNhbl9hcmNoX2lzX3JlYWR5KCkg
fHwgaXNfa2ZlbmNlX2FkZHJlc3Mob2JqZWN0KSkKKwlpZiAoIWthc2FuX2VuYWJsZWQoKSB8fCBp
c19rZmVuY2VfYWRkcmVzcyhvYmplY3QpKQogCQlyZXR1cm4gZmFsc2U7CiAJcmV0dXJuIGNoZWNr
X3NsYWJfYWxsb2NhdGlvbihjYWNoZSwgb2JqZWN0LCBpcCk7CiB9CkBAIC0yNjUsNyArMjY1LDcg
QEAgYm9vbCBfX2thc2FuX3NsYWJfcHJlX2ZyZWUoc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLCB2
b2lkICpvYmplY3QsCiBib29sIF9fa2FzYW5fc2xhYl9mcmVlKHN0cnVjdCBrbWVtX2NhY2hlICpj
YWNoZSwgdm9pZCAqb2JqZWN0LCBib29sIGluaXQsCiAJCSAgICAgICBib29sIHN0aWxsX2FjY2Vz
c2libGUpCiB7Ci0JaWYgKCFrYXNhbl9hcmNoX2lzX3JlYWR5KCkgfHwgaXNfa2ZlbmNlX2FkZHJl
c3Mob2JqZWN0KSkKKwlpZiAoIWthc2FuX2VuYWJsZWQoKSB8fCBpc19rZmVuY2VfYWRkcmVzcyhv
YmplY3QpKQogCQlyZXR1cm4gZmFsc2U7CiAKIAlwb2lzb25fc2xhYl9vYmplY3QoY2FjaGUsIG9i
amVjdCwgaW5pdCwgc3RpbGxfYWNjZXNzaWJsZSk7CkBAIC0yODksNyArMjg5LDcgQEAgYm9vbCBf
X2thc2FuX3NsYWJfZnJlZShzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsIHZvaWQgKm9iamVjdCwg
Ym9vbCBpbml0LAogCiBzdGF0aWMgaW5saW5lIGJvb2wgY2hlY2tfcGFnZV9hbGxvY2F0aW9uKHZv
aWQgKnB0ciwgdW5zaWduZWQgbG9uZyBpcCkKIHsKLQlpZiAoIWthc2FuX2FyY2hfaXNfcmVhZHko
KSkKKwlpZiAoIWthc2FuX2VuYWJsZWQoKSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJaWYgKHB0ciAh
PSBwYWdlX2FkZHJlc3ModmlydF90b19oZWFkX3BhZ2UocHRyKSkpIHsKQEAgLTUxOCw3ICs1MTgs
NyBAQCBib29sIF9fa2FzYW5fbWVtcG9vbF9wb2lzb25fb2JqZWN0KHZvaWQgKnB0ciwgdW5zaWdu
ZWQgbG9uZyBpcCkKIAkJcmV0dXJuIHRydWU7CiAJfQogCi0JaWYgKGlzX2tmZW5jZV9hZGRyZXNz
KHB0cikgfHwgIWthc2FuX2FyY2hfaXNfcmVhZHkoKSkKKwlpZiAoaXNfa2ZlbmNlX2FkZHJlc3Mo
cHRyKSB8fCAha2FzYW5fZW5hYmxlZCgpKQogCQlyZXR1cm4gdHJ1ZTsKIAogCXNsYWIgPSBmb2xp
b19zbGFiKGZvbGlvKTsKZGlmZiAtLWdpdCBhL21tL2thc2FuL2dlbmVyaWMuYyBiL21tL2thc2Fu
L2dlbmVyaWMuYwppbmRleCBhYjlhYjMwY2FmNC4uYWYyZjIwNzdhNDUgMTAwNjQ0Ci0tLSBhL21t
L2thc2FuL2dlbmVyaWMuYworKysgYi9tbS9rYXNhbi9nZW5lcmljLmMKQEAgLTE3Niw3ICsxNzYs
NyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgY2hlY2tfcmVnaW9uX2lubGluZShjb25z
dCB2b2lkICphZGRyLAogCQkJCQkJc2l6ZV90IHNpemUsIGJvb2wgd3JpdGUsCiAJCQkJCQl1bnNp
Z25lZCBsb25nIHJldF9pcCkKIHsKLQlpZiAoIWthc2FuX2FyY2hfaXNfcmVhZHkoKSkKKwlpZiAo
IWthc2FuX2VuYWJsZWQoKSkKIAkJcmV0dXJuIHRydWU7CiAKIAlpZiAodW5saWtlbHkoc2l6ZSA9
PSAwKSkKQEAgLTIwNCw3ICsyMDQsNyBAQCBib29sIGthc2FuX2J5dGVfYWNjZXNzaWJsZShjb25z
dCB2b2lkICphZGRyKQogewogCXM4IHNoYWRvd19ieXRlOwogCi0JaWYgKCFrYXNhbl9hcmNoX2lz
X3JlYWR5KCkpCisJaWYgKCFrYXNhbl9lbmFibGVkKCkpCiAJCXJldHVybiB0cnVlOwogCiAJc2hh
ZG93X2J5dGUgPSBSRUFEX09OQ0UoKihzOCAqKWthc2FuX21lbV90b19zaGFkb3coYWRkcikpOwpA
QCAtNTA2LDcgKzUwNiw3IEBAIHN0YXRpYyB2b2lkIHJlbGVhc2VfYWxsb2NfbWV0YShzdHJ1Y3Qg
a2FzYW5fYWxsb2NfbWV0YSAqbWV0YSkKIAogc3RhdGljIHZvaWQgcmVsZWFzZV9mcmVlX21ldGEo
Y29uc3Qgdm9pZCAqb2JqZWN0LCBzdHJ1Y3Qga2FzYW5fZnJlZV9tZXRhICptZXRhKQogewotCWlm
ICgha2FzYW5fYXJjaF9pc19yZWFkeSgpKQorCWlmICgha2FzYW5fZW5hYmxlZCgpKQogCQlyZXR1
cm47CiAKIAkvKiBDaGVjayBpZiBmcmVlIG1ldGEgaXMgdmFsaWQuICovCmRpZmYgLS1naXQgYS9t
bS9rYXNhbi9rYXNhbi5oIGIvbW0va2FzYW4va2FzYW4uaAppbmRleCAxMjkxNzhiZTVlNi4uZTBm
ZmMxNjQ5NWQgMTAwNjQ0Ci0tLSBhL21tL2thc2FuL2thc2FuLmgKKysrIGIvbW0va2FzYW4va2Fz
YW4uaApAQCAtNTQ0LDEyICs1NDQsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQga2FzYW5fcG9pc29u
X2xhc3RfZ3JhbnVsZShjb25zdCB2b2lkICphZGRyZXNzLCBzaXplX3Qgc2l6ZSkgewogCiAjZW5k
aWYgLyogQ09ORklHX0tBU0FOX0dFTkVSSUMgKi8KIAotI2lmbmRlZiBrYXNhbl9hcmNoX2lzX3Jl
YWR5Ci1zdGF0aWMgaW5saW5lIGJvb2wga2FzYW5fYXJjaF9pc19yZWFkeSh2b2lkKQl7IHJldHVy
biB0cnVlOyB9Ci0jZWxpZiAhZGVmaW5lZChDT05GSUdfS0FTQU5fR0VORVJJQykgfHwgIWRlZmlu
ZWQoQ09ORklHX0tBU0FOX09VVExJTkUpCi0jZXJyb3Iga2FzYW5fYXJjaF9pc19yZWFkeSBvbmx5
IHdvcmtzIGluIEtBU0FOIGdlbmVyaWMgb3V0bGluZSBtb2RlIQotI2VuZGlmCi0KICNpZiBJU19F
TkFCTEVEKENPTkZJR19LQVNBTl9LVU5JVF9URVNUKQogCiB2b2lkIGthc2FuX2t1bml0X3Rlc3Rf
c3VpdGVfc3RhcnQodm9pZCk7CmRpZmYgLS1naXQgYS9tbS9rYXNhbi9zaGFkb3cuYyBiL21tL2th
c2FuL3NoYWRvdy5jCmluZGV4IGQyYzcwY2QyYWZiLi45ZGI4NTQ4Y2NiNCAxMDA2NDQKLS0tIGEv
bW0va2FzYW4vc2hhZG93LmMKKysrIGIvbW0va2FzYW4vc2hhZG93LmMKQEAgLTEyNSw3ICsxMjUs
NyBAQCB2b2lkIGthc2FuX3BvaXNvbihjb25zdCB2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSwgdTgg
dmFsdWUsIGJvb2wgaW5pdCkKIHsKIAl2b2lkICpzaGFkb3dfc3RhcnQsICpzaGFkb3dfZW5kOwog
Ci0JaWYgKCFrYXNhbl9hcmNoX2lzX3JlYWR5KCkpCisJaWYgKCFrYXNhbl9lbmFibGVkKCkpCiAJ
CXJldHVybjsKIAogCS8qCkBAIC0xNTAsOSArMTUwLDYgQEAgRVhQT1JUX1NZTUJPTF9HUEwoa2Fz
YW5fcG9pc29uKTsKICNpZmRlZiBDT05GSUdfS0FTQU5fR0VORVJJQwogdm9pZCBrYXNhbl9wb2lz
b25fbGFzdF9ncmFudWxlKGNvbnN0IHZvaWQgKmFkZHIsIHNpemVfdCBzaXplKQogewotCWlmICgh
a2FzYW5fYXJjaF9pc19yZWFkeSgpKQotCQlyZXR1cm47Ci0KIAlpZiAoc2l6ZSAmIEtBU0FOX0dS
QU5VTEVfTUFTSykgewogCQl1OCAqc2hhZG93ID0gKHU4ICopa2FzYW5fbWVtX3RvX3NoYWRvdyhh
ZGRyICsgc2l6ZSk7CiAJCSpzaGFkb3cgPSBzaXplICYgS0FTQU5fR1JBTlVMRV9NQVNLOwpAQCAt
MzkwLDcgKzM4Nyw3IEBAIGludCBrYXNhbl9wb3B1bGF0ZV92bWFsbG9jKHVuc2lnbmVkIGxvbmcg
YWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQogCXVuc2lnbmVkIGxvbmcgc2hhZG93X3N0YXJ0LCBz
aGFkb3dfZW5kOwogCWludCByZXQ7CiAKLQlpZiAoIWthc2FuX2FyY2hfaXNfcmVhZHkoKSkKKwlp
ZiAoIWthc2FuX2VuYWJsZWQoKSkKIAkJcmV0dXJuIDA7CiAKIAlpZiAoIWlzX3ZtYWxsb2Nfb3Jf
bW9kdWxlX2FkZHIoKHZvaWQgKilhZGRyKSkKQEAgLTU2MCw3ICs1NTcsNyBAQCB2b2lkIGthc2Fu
X3JlbGVhc2Vfdm1hbGxvYyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwK
IAl1bnNpZ25lZCBsb25nIHJlZ2lvbl9zdGFydCwgcmVnaW9uX2VuZDsKIAl1bnNpZ25lZCBsb25n
IHNpemU7CiAKLQlpZiAoIWthc2FuX2FyY2hfaXNfcmVhZHkoKSkKKwlpZiAoIWthc2FuX2VuYWJs
ZWQoKSkKIAkJcmV0dXJuOwogCiAJcmVnaW9uX3N0YXJ0ID0gQUxJR04oc3RhcnQsIEtBU0FOX01F
TU9SWV9QRVJfU0hBRE9XX1BBR0UpOwpAQCAtNjExLDkgKzYwOCw2IEBAIHZvaWQgKl9fa2FzYW5f
dW5wb2lzb25fdm1hbGxvYyhjb25zdCB2b2lkICpzdGFydCwgdW5zaWduZWQgbG9uZyBzaXplLAog
CSAqIHdpdGggc2V0dGluZyBtZW1vcnkgdGFncywgc28gdGhlIEtBU0FOX1ZNQUxMT0NfSU5JVCBm
bGFnIGlzIGlnbm9yZWQuCiAJICovCiAKLQlpZiAoIWthc2FuX2FyY2hfaXNfcmVhZHkoKSkKLQkJ
cmV0dXJuICh2b2lkICopc3RhcnQ7Ci0KIAlpZiAoIWlzX3ZtYWxsb2Nfb3JfbW9kdWxlX2FkZHIo
c3RhcnQpKQogCQlyZXR1cm4gKHZvaWQgKilzdGFydDsKIApAQCAtNjM2LDkgKzYzMCw2IEBAIHZv
aWQgKl9fa2FzYW5fdW5wb2lzb25fdm1hbGxvYyhjb25zdCB2b2lkICpzdGFydCwgdW5zaWduZWQg
bG9uZyBzaXplLAogICovCiB2b2lkIF9fa2FzYW5fcG9pc29uX3ZtYWxsb2MoY29uc3Qgdm9pZCAq
c3RhcnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKIHsKLQlpZiAoIWthc2FuX2FyY2hfaXNfcmVhZHko
KSkKLQkJcmV0dXJuOwotCiAJaWYgKCFpc192bWFsbG9jX29yX21vZHVsZV9hZGRyKHN0YXJ0KSkK
IAkJcmV0dXJuOwogCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
