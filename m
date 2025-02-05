Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7ACC02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ApexCeaJ6jyxj62Yrv+BDWP4femiVvRubWxTdr3sSU=; b=bJxIbnPkkvd9jR
	JMHywXchgOyZxmtVJsVQ0nmbJcfMXvSWBx4COoABqqjiaSuH7yH9tPWWCHZKFrrULlgdce+eheSiB
	KJOIZfxMIlrnd6/I3/QtF+thMzlMW3XoXOsuNJMcDm6ZZrobg837N96fe4FM4bOMuH3nP1HpICKjp
	va1Ab6W5VzNSxubQJdqQWULkGCgc6C7dmpNXRWgMMffjM56w+0qtHYqdr2e0ic8xkqvgH6wn/cdVa
	gDVvGVBhaocxPmngY/rbvRmh227Tzipny0444BVtKC1/5qRqCRCWcdefFQvC0nP1nRHpUfd+gvw6o
	xRxqZcPpIkHQ7R1KYPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfp5o-00000004rp0-1QGv;
	Wed, 05 Feb 2025 23:46:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfp5m-00000004roF-02of;
	Wed, 05 Feb 2025 23:46:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38daf09d37fso205867f8f.1;
        Wed, 05 Feb 2025 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799160; x=1739403960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz+V1fDyiTyTkm+6v9/Yshk0vlGrK4aQBew/N8UNm8o=;
        b=PV0UbXHB7uvL5CnlHHHv3o2VRZH/VwzbSbPBpUaK6yejE4+Li7h+tL0vkRvHKKYalE
         5IXxkW+qdZIVNumOwYHbpkovq5IvzmD4gCT4Onn70pVKR8xbMreodsb+/qFucdVF2Y6O
         uTwMM0QFzNgfToyynR2KOX64pRyieDxZ0rrJyrZULsVMCi7tGi9rtf75LTbJsK3Kq+Wu
         tTC1IW0Ks6LxBSgzwnqteUu9kM4qMCxgSJNs1PR3CSRkiCoKHyHRXYPJK2wDxS1gzz72
         VY8HETyCjr3ilJdQTr3rVRTDhUMKYWll0/u8NwJs04v+XJvy5nGdsOK9/v580NHto/yL
         5xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799160; x=1739403960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rz+V1fDyiTyTkm+6v9/Yshk0vlGrK4aQBew/N8UNm8o=;
        b=YK6L3TjzXH185tntqv9l9VpbeAe/LQ9NtNGNrzY8l7gAIKVFP5Z31bISgVQ7EdeP8I
         Z+PU+2naViZqrf15sv/O7MHc5ewG1A928tU+FQqUzO9olQZLoNY0C4fXRn8FD5S7B0oq
         y85XExvikMHX27Y6dPgDHPNwJz06HwXL1KLfOW89ThkdGfYB4M8ezR+m6FDl8bpHaP+i
         w+w898mGH66P11gA5Wo/FCfLc8EV/cPC4qMsYN/5Yonu4kV8uj/gaN2xwFD159PA0uJU
         aemEkYRtorYiHJKub4RyD34tGZBeoAgtxhWIW4mZ4940fGjNKqDnVUaHg79mnT5TjR9Y
         o/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDitOuy0Czn+kkKE3T/BkSKAXjcFysjttQR9e3Y2DTXJ1+hnwCo7dUjPGY0JLH4QekE8iV4WJY4UMPLGI=@lists.infradead.org, AJvYcCWNjq7sFxFm/c5d/cF93mPp0WJUvYvgarX4Fmq10n7FIor2yCSojdAqnf/zLpC1tJBoaVMKH0PEqhyYGznmLntX@lists.infradead.org
X-Gm-Message-State: AOJu0YzkERyRyUZivB45sNAWbh2uiZIwJ4YFCdOiysUkUslth6tJL73o
	/XXoKM6v9rl3Z7FRNlFrSlpTznowm3mOfEiKbA8cqYhEmv3V8vBGOdG7n4Ouh/PEBJXTHsbdYZC
	TPcY7RPx+Mm/xpiq87hGE909ijNI=
X-Gm-Gg: ASbGnctiaVfZOuBBY05ZKcHqaQ1Bs0komTAxek7IH2Iyrt7QfO1Vb2xa1ZQA/I35K/g
	6farjuIQjiM+wvJ5bCXor/dFqfKNEJvthLDYwTLoWrCcWBP85NCe4pmFJxeJnTdlepBZwf9MHfw
	==
X-Google-Smtp-Source: AGHT+IGbg8frwCmtZh2Cq1mQ+7gcdTinnbG3Ybu+Qvbg9VC2A4roSQzA7Y8T7x0Do1hYoZdYgXjogJqzzmDtvH5wZas=
X-Received: by 2002:a05:6000:1786:b0:385:f0dc:c9f4 with SMTP id
 ffacd0b85a97d-38db48bdaecmr3897521f8f.20.1738799160206; Wed, 05 Feb 2025
 15:46:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:45:49 +0100
X-Gm-Features: AWEUYZm-2kNDPAYBLLDAqKKnZZXufvhPekieyoATWEHpiTcF4DB1S0LSkY8umDA
Message-ID: <CA+fCnZfKQwNWbYEhk70ykT1+cnibCBnvZJrhAMvu_b0Y8xZTSg@mail.gmail.com>
Subject: Re: [PATCH 10/15] x86: KASAN raw shadow memory PTE init
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
X-CRM114-CacheID: sfid-20250205_154602_048355_7315FF64 
X-CRM114-Status: GOOD (  28.51  )
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

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA2OjM24oCvUE0gTWFjaWVqIFdpZWN6b3ItUmV0bWFuCjxt
YWNpZWoud2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPgo+IEluIEtBU0FOJ3MgZ2Vu
ZXJpYyBtb2RlIHRoZSBkZWZhdWx0IHZhbHVlIGluIHNoYWRvdyBtZW1vcnkgaXMgemVyby4KPiBE
dXJpbmcgaW5pdGlhbGl6YXRpb24gb2Ygc2hhZG93IG1lbW9yeSBwYWdlcyB0aGV5IGFyZSBhbGxv
Y2F0ZWQgYW5kCj4gemVyb2VkLgo+Cj4gSW4gS0FTQU4ncyB0YWctYmFzZWQgbW9kZSB0aGUgZGVm
YXVsdCB0YWcgZm9yIHRoZSBhcm02NCBhcmNoaXRlY3R1cmUgaXMKPiAweEZFIHdoaWNoIGNvcnJl
c3BvbmRzIHRvIGFueSBtZW1vcnkgdGhhdCBzaG91bGQgbm90IGJlIGFjY2Vzc2VkLiBPbiB4ODYK
PiAod2hlcmUgdGFncyBhcmUgNC1iaXQgd2lkZSBpbnN0ZWFkIG9mIDgtYml0IHdpZGUpIHRoYXQg
dGFnIGlzIDB4RSBzbwo+IGR1cmluZyB0aGUgaW5pdGlhbGl6YXRpb25zIGFsbCB0aGUgYnl0ZXMg
aW4gc2hhZG93IG1lbW9yeSBwYWdlcyBzaG91bGQKPiBiZSBmaWxsZWQgd2l0aCAweEUgb3IgMHhF
RSBpZiB0d28gdGFncyBzaG91bGQgYmUgcGFja2VkIGluIG9uZSBzaGFkb3cKPiBieXRlLgo+Cj4g
VXNlIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRfcmF3KCkgaW5zdGVhZCBvZiBtZW1ibG9ja19hbGxv
Y190cnlfbmlkKCkgdG8KPiBhdm9pZCB6ZXJvaW5nIG91dCB0aGUgbWVtb3J5IHNvIGl0IGNhbiBi
ZSBzZXQgd2l0aCB0aGUgS0FTQU4gaW52YWxpZAo+IHRhZy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1h
Y2llaiBXaWVjem9yLVJldG1hbiA8bWFjaWVqLndpZWN6b3ItcmV0bWFuQGludGVsLmNvbT4KPiAt
LS0KPiAgYXJjaC94ODYvbW0va2FzYW5faW5pdF82NC5jIHwgMTkgKysrKysrKysrKysrKysrKy0t
LQo+ICBpbmNsdWRlL2xpbnV4L2thc2FuLmggICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIG1tL2thc2FuL2thc2FuLmggICAgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMgYi9hcmNoL3g4
Ni9tbS9rYXNhbl9pbml0XzY0LmMKPiBpbmRleCA5ZGRkZjE5YTU1NzEuLjU1ZDQ2OGQ4MzY4MiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKPiArKysgYi9hcmNoL3g4
Ni9tbS9rYXNhbl9pbml0XzY0LmMKPiBAQCAtMzUsNiArMzUsMTggQEAgc3RhdGljIF9faW5pdCB2
b2lkICplYXJseV9hbGxvYyhzaXplX3Qgc2l6ZSwgaW50IG5pZCwgYm9vbCBzaG91bGRfcGFuaWMp
Cj4gICAgICAgICByZXR1cm4gcHRyOwo+ICB9Cj4KPiArc3RhdGljIF9faW5pdCB2b2lkICplYXJs
eV9yYXdfYWxsb2Moc2l6ZV90IHNpemUsIGludCBuaWQsIGJvb2wgc2hvdWxkX3BhbmljKQo+ICt7
Cj4gKyAgICAgICB2b2lkICpwdHIgPSBtZW1ibG9ja19hbGxvY190cnlfbmlkX3JhdyhzaXplLCBz
aXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fcGEoTUFYX0RNQV9BRERSRVNTKSwgTUVN
QkxPQ0tfQUxMT0NfQUNDRVNTSUJMRSwgbmlkKTsKPiArCj4gKyAgICAgICBpZiAoIXB0ciAmJiBz
aG91bGRfcGFuaWMpCj4gKyAgICAgICAgICAgICAgIHBhbmljKCIlcFM6IEZhaWxlZCB0byBhbGxv
Y2F0ZSBwYWdlLCBuaWQ9JWQgZnJvbT0lbHhcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICh2
b2lkICopX1JFVF9JUF8sIG5pZCwgX19wYShNQVhfRE1BX0FERFJFU1MpKTsKPiArCj4gKyAgICAg
ICByZXR1cm4gcHRyOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5fcG9wdWxh
dGVfcG1kKHBtZF90ICpwbWQsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCBpbnQgbmlkKQo+ICB7Cj4g
QEAgLTY0LDggKzc2LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IGthc2FuX3BvcHVsYXRlX3BtZChw
bWRfdCAqcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAgICAgICAgICAgICAgIGlmICghcHRl
X25vbmUoKnB0ZSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAtICAg
ICAgICAgICAgICAgcCA9IGVhcmx5X2FsbG9jKFBBR0VfU0laRSwgbmlkLCB0cnVlKTsKPiAtICAg
ICAgICAgICAgICAgZW50cnkgPSBwZm5fcHRlKFBGTl9ET1dOKF9fcGEocCkpLCBQQUdFX0tFUk5F
TCk7Cj4gKyAgICAgICAgICAgICAgIHAgPSBlYXJseV9yYXdfYWxsb2MoUEFHRV9TSVpFLCBuaWQs
IHRydWUpOwo+ICsgICAgICAgICAgICAgICBtZW1zZXQocCwgUEFHRV9TSVpFLCBrYXNhbl9kZW5z
ZV90YWcoS0FTQU5fU0hBRE9XX0lOSVQpKTsKPiArICAgICAgICAgICAgICAgZW50cnkgPSBwZm5f
cHRlKFBGTl9ET1dOKF9fcGFfbm9kZWJ1ZyhwKSksIFBBR0VfS0VSTkVMKTsKPiAgICAgICAgICAg
ICAgICAgc2V0X3B0ZV9hdCgmaW5pdF9tbSwgYWRkciwgcHRlLCBlbnRyeSk7Cj4gICAgICAgICB9
IHdoaWxlIChwdGUrKywgYWRkciArPSBQQUdFX1NJWkUsIGFkZHIgIT0gZW5kKTsKPiAgfQo+IEBA
IC00MzcsNyArNDUwLDcgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ICAgICAgICAg
ICogaXQgbWF5IGNvbnRhaW4gc29tZSBnYXJiYWdlLiBOb3cgd2UgY2FuIGNsZWFyIGFuZCB3cml0
ZSBwcm90ZWN0IGl0LAo+ICAgICAgICAgICogc2luY2UgYWZ0ZXIgdGhlIFRMQiBmbHVzaCBubyBv
bmUgc2hvdWxkIHdyaXRlIHRvIGl0Lgo+ICAgICAgICAgICovCj4gLSAgICAgICBtZW1zZXQoa2Fz
YW5fZWFybHlfc2hhZG93X3BhZ2UsIDAsIFBBR0VfU0laRSk7Cj4gKyAgICAgICBrYXNhbl9wb2lz
b24oa2FzYW5fZWFybHlfc2hhZG93X3BhZ2UsIFBBR0VfU0laRSwgS0FTQU5fU0hBRE9XX0lOSVQs
IGZhbHNlKTsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBQVFJTX1BFUl9QVEU7IGkrKykgewo+
ICAgICAgICAgICAgICAgICBwdGVfdCBwdGU7Cj4gICAgICAgICAgICAgICAgIHBncHJvdF90IHBy
b3Q7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2FzYW4uaCBiL2luY2x1ZGUvbGludXgv
a2FzYW4uaAo+IGluZGV4IDgzMTQ2MzY3MTcwYS4uYWY4MjcyYzc0NDA5IDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGludXgva2FzYW4uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgva2FzYW4uaAo+IEBA
IC0xNTEsNiArMTUxLDMxIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBrYXNhbl91bnBv
aXNvbl9yYW5nZShjb25zdCB2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSkKPiAgICAgICAgICAgICAg
ICAgX19rYXNhbl91bnBvaXNvbl9yYW5nZShhZGRyLCBzaXplKTsKPiAgfQo+Cj4gKyNpZmRlZiBD
T05GSUdfS0FTQU5fSFdfVEFHUwo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGthc2FuX3BvaXNv
bihjb25zdCB2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSwgdTggdmFsdWUsIGJvb2wgaW5pdCkKPiAr
ewo+ICsgICAgICAgaWYgKFdBUk5fT04oKHVuc2lnbmVkIGxvbmcpYWRkciAmIEtBU0FOX0dSQU5V
TEVfTUFTSykpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIGlmIChXQVJOX09O
KHNpemUgJiBLQVNBTl9HUkFOVUxFX01BU0spKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
Kwo+ICsgICAgICAgaHdfc2V0X21lbV90YWdfcmFuZ2Uoa2FzYW5fcmVzZXRfdGFnKGFkZHIpLCBz
aXplLCB2YWx1ZSwgaW5pdCk7Cj4gK30KPiArCj4gKyNlbHNlIC8qIENPTkZJR19LQVNBTl9IV19U
QUdTICovCj4gKwo+ICsvKioKPiArICoga2FzYW5fcG9pc29uIC0gbWFyayB0aGUgbWVtb3J5IHJh
bmdlIGFzIGluYWNjZXNzaWJsZQo+ICsgKiBAYWRkciAtIHJhbmdlIHN0YXJ0IGFkZHJlc3MsIG11
c3QgYmUgYWxpZ25lZCB0byBLQVNBTl9HUkFOVUxFX1NJWkUKPiArICogQHNpemUgLSByYW5nZSBz
aXplLCBtdXN0IGJlIGFsaWduZWQgdG8gS0FTQU5fR1JBTlVMRV9TSVpFCj4gKyAqIEB2YWx1ZSAt
IHZhbHVlIHRoYXQncyB3cml0dGVuIHRvIG1ldGFkYXRhIGZvciB0aGUgcmFuZ2UKPiArICogQGlu
aXQgLSB3aGV0aGVyIHRvIGluaXRpYWxpemUgdGhlIG1lbW9yeSByYW5nZSAob25seSBmb3IgaGFy
ZHdhcmUgdGFnLWJhc2VkKQo+ICsgKi8KPiArdm9pZCBrYXNhbl9wb2lzb24oY29uc3Qgdm9pZCAq
YWRkciwgc2l6ZV90IHNpemUsIHU4IHZhbHVlLCBib29sIGluaXQpOwo+ICsKPiArI2VuZGlmIC8q
IENPTkZJR19LQVNBTl9IV19UQUdTICovCgpQbGVhc2Uga2VlcCBrYXNhbl9wb2lzb24oKSBhbmQg
a2FzYW5fdW5wb2lzb24oKSBpbiBtbS9rYXNhbi9rYXNhbi5oOgp0aGVzZSBhcmUgaW50ZW5kZWQg
YXMgaW50ZXJuYWwtb25seSBmdW5jdGlvbnMgKHBlcmhhcHMsIHdlIHNob3VsZCBhZGQKdGhpcyBp
bnRvIHRoZSBjb21tZW50KS4gSW5zdGVhZCwgYWRkIGEgcHVycG9zZS1zcGVjaWZpYyB3cmFwcGVy
CnNpbWlsYXIgdG8gdGhlIG9uZXMgaW4gaW5jbHVkZS9saW51eC9rYXNhbi5oLgoKCj4gKwo+ICB2
b2lkIF9fa2FzYW5fcG9pc29uX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQg
b3JkZXIsIGJvb2wgaW5pdCk7Cj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBrYXNhbl9w
b2lzb25fcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyLCBib29sIGluaXQpCj4g
ZGlmZiAtLWdpdCBhL21tL2thc2FuL2thc2FuLmggYi9tbS9rYXNhbi9rYXNhbi5oCj4gaW5kZXgg
YTU2YWFkZDUxNDg1Li4yNDA1NDc3YzU4OTkgMTAwNjQ0Cj4gLS0tIGEvbW0va2FzYW4va2FzYW4u
aAo+ICsrKyBiL21tL2thc2FuL2thc2FuLmgKPiBAQCAtNDY2LDE2ICs0NjYsNiBAQCBzdGF0aWMg
aW5saW5lIHU4IGthc2FuX3JhbmRvbV90YWcodm9pZCkgeyByZXR1cm4gMDsgfQo+Cj4gICNpZmRl
ZiBDT05GSUdfS0FTQU5fSFdfVEFHUwo+Cj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBrYXNhbl9wb2lz
b24oY29uc3Qgdm9pZCAqYWRkciwgc2l6ZV90IHNpemUsIHU4IHZhbHVlLCBib29sIGluaXQpCj4g
LXsKPiAtICAgICAgIGlmIChXQVJOX09OKCh1bnNpZ25lZCBsb25nKWFkZHIgJiBLQVNBTl9HUkFO
VUxFX01BU0spKQo+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gLSAgICAgICBpZiAoV0FSTl9P
TihzaXplICYgS0FTQU5fR1JBTlVMRV9NQVNLKSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+
IC0KPiAtICAgICAgIGh3X3NldF9tZW1fdGFnX3JhbmdlKGthc2FuX3Jlc2V0X3RhZyhhZGRyKSwg
c2l6ZSwgdmFsdWUsIGluaXQpOwo+IC19Cj4gLQo+ICBzdGF0aWMgaW5saW5lIHZvaWQga2FzYW5f
dW5wb2lzb24oY29uc3Qgdm9pZCAqYWRkciwgc2l6ZV90IHNpemUsIGJvb2wgaW5pdCkKPiAgewo+
ICAgICAgICAgdTggdGFnID0gZ2V0X3RhZyhhZGRyKTsKPiBAQCAtNDk3LDE1ICs0ODcsNiBAQCBz
dGF0aWMgaW5saW5lIGJvb2wga2FzYW5fYnl0ZV9hY2Nlc3NpYmxlKGNvbnN0IHZvaWQgKmFkZHIp
Cj4KPiAgI2Vsc2UgLyogQ09ORklHX0tBU0FOX0hXX1RBR1MgKi8KPgo+IC0vKioKPiAtICoga2Fz
YW5fcG9pc29uIC0gbWFyayB0aGUgbWVtb3J5IHJhbmdlIGFzIGluYWNjZXNzaWJsZQo+IC0gKiBA
YWRkciAtIHJhbmdlIHN0YXJ0IGFkZHJlc3MsIG11c3QgYmUgYWxpZ25lZCB0byBLQVNBTl9HUkFO
VUxFX1NJWkUKPiAtICogQHNpemUgLSByYW5nZSBzaXplLCBtdXN0IGJlIGFsaWduZWQgdG8gS0FT
QU5fR1JBTlVMRV9TSVpFCj4gLSAqIEB2YWx1ZSAtIHZhbHVlIHRoYXQncyB3cml0dGVuIHRvIG1l
dGFkYXRhIGZvciB0aGUgcmFuZ2UKPiAtICogQGluaXQgLSB3aGV0aGVyIHRvIGluaXRpYWxpemUg
dGhlIG1lbW9yeSByYW5nZSAob25seSBmb3IgaGFyZHdhcmUgdGFnLWJhc2VkKQo+IC0gKi8KPiAt
dm9pZCBrYXNhbl9wb2lzb24oY29uc3Qgdm9pZCAqYWRkciwgc2l6ZV90IHNpemUsIHU4IHZhbHVl
LCBib29sIGluaXQpOwo+IC0KPiAgLyoqCj4gICAqIGthc2FuX3VucG9pc29uIC0gbWFyayB0aGUg
bWVtb3J5IHJhbmdlIGFzIGFjY2Vzc2libGUKPiAgICogQGFkZHIgLSByYW5nZSBzdGFydCBhZGRy
ZXNzLCBtdXN0IGJlIGFsaWduZWQgdG8gS0FTQU5fR1JBTlVMRV9TSVpFCj4gLS0KPiAyLjQ3LjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
