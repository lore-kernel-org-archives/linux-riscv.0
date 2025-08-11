Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023CEC87FD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPLx9aMzJPhEuNXBba4FcE1yZSt366qrQoMOg5EE2i4=; b=Z45AxQ4dc6R+Mf
	o450QZ97srDDoOsTB6tqsKZEjQqkKvkdV5Qlo9HQ09FZnAfCV2nGVNe7y3EYKzh7qPcxItHk4sLjP
	ajuRdAIO9Y22AxHTYTTXYtpOMu5zXZBF0k7kq+obQx4CLIiu0cBUcNpMniK6n5/O/bX3xN1RfShgm
	3od4vl5lgNJVXgY+93gzwqlo1g6HsasUuae0Q5t6F1TMZRUPc4tM5RuZsu1fCHWGXjqFm4gpblKJY
	qrm6vF7LJbZ0JFlq+pADOTJgumBafDy6VHyTMCIhlIM5zMxI08j0jvuSwATaiDjq83+PSTZXxZ10+
	NY6nsZ/DLx/CrqpB5psA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPD7-00000007EJH-0ESl;
	Mon, 11 Aug 2025 09:52:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulP2D-00000007BT0-0r8T
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 09:41:42 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55b85d01b79so4312278e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Aug 2025 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754905299; x=1755510099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy59ORjyXtIVFFgfYeqm1wmJyEdmnPmaEOXMVqFckn4=;
        b=S9olJIrRPR3L9LBo+31xh4A53BaHIuG9tItJKPp5mo5h7+JYGyeEiPMrGl2X6OF7Lj
         JbHWsUCcKmNHWLG4r7zbwvGD3i9Y7/N4J0QY3792CFdSEiX1teTldk1xnqejz/BDrMTg
         emvjxGYPAT1cQRG6Ni/jZWrLvC/gAyFxqBilqsklpl0BqWL0vqPu7zfNKnG7OcMAvVR8
         fv7srq0JW1VgfvLlvKzaptatw+v9XO3gj6b+u6rvXu5bfRHFYYT6+7Pk42FHMfbUExpa
         0hZF68+/7GcYW4Q3JEivqj/bn/DwRBsJflm3CYlOC/INzsOfzesC++rs7VMFi5c+nECc
         +NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905299; x=1755510099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cy59ORjyXtIVFFgfYeqm1wmJyEdmnPmaEOXMVqFckn4=;
        b=JwXihcvTXt6nOPg5cZbGRIZJPOrTaosrlNcqAgxhXoI6R9Du4UeGl8/dO2adZqpBKe
         0UbuwOERo1D6gUMIGontMPMlbqvAQzvvQ7emBmN4pQWbLnSP6fSfr7C2Sljy84epsuju
         gDRbHaqQ0hGiw9GvvhgfHkaIhpJ0lDO0m5+3z7Hug6MknO6uBCJcZD7EU6NSFSQJYzQe
         gdL76SczHQoAIq8KCOaxYLyM6rfiwTFY5qwit1V3nYQAwehhrrTcwWfJ/1w17tKAhHoi
         ZqeKGp9/3/XHI/xz1AiEH6htjy1XXq5VPVA1ZiW4tJcW4Pzm53O3McQ4eSfjzcf26/sT
         gJxw==
X-Gm-Message-State: AOJu0Yx76T9L1rsVEfy7LDUM308/C/HVjvT7GLHoL9feSSy35gYHicen
	SJrTO0qN9RdlIUx+Om9NCSAzDFtZi34n4G0hfV+Di9/ZSWQ+Csa973BI6jTWAjSNbcIbNGBC4VJ
	+Ncv6mdzFFVF9Al+VtZys0GHbOGTl4gPhAb+dyY02HA==
X-Gm-Gg: ASbGnctuqHb02pJvdF7g3N/aLVZmvPFmIiL8eGYKAkQ3gKnVVtyi3jVrVzIKuR0YozN
	4OlDy9Aixr/GbxuNWDWV+pWF7BUpPSqHUfFYcDFGBo+KTs8bBQELJ3HAJGUIZFOU/kRGFhPb/KI
	0JCA5s4mAWCD9Uf2OpOrtTP4Zhfhz8/AxyoBoUwwCBRqSQnH2UJ21gP4Li7LLGOKR4/502MvYMZ
	myzSLc01rdgnqeBiqk=
X-Google-Smtp-Source: AGHT+IGmUn3ZM7jBX7D1YyhKjvaPN2e4dHa6K9n92Zz8n8QotO81v1sGyRseqSkkKtsFNnDYwv8ehf88vLMTTISTp9c=
X-Received: by 2002:a05:6512:2316:b0:553:3a0a:1892 with SMTP id
 2adb3069b0e04-55cc008637dmr3351518e87.15.1754905298946; Mon, 11 Aug 2025
 02:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250805193955.798277-1-jesse@rivosinc.com> <20250805193955.798277-6-jesse@rivosinc.com>
In-Reply-To: <20250805193955.798277-6-jesse@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Aug 2025 15:11:27 +0530
X-Gm-Features: Ac12FXzX2WBI8Efn8ZEvJJb1ujk-ZIhK3W3ZYl12yeFcZ1SpyaqkJna1l4oNLS8
Message-ID: <CAK9=C2X2J4ROJ7nKB0hcD9dVav7ZMFWw2Qy+GEsmYN_Tt8DxPQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: hw_breakpoint: Use icount for single stepping
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Deepak Gupta <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Evan Green <evan@rivosinc.com>, WangYuli <wangyuli@uniontech.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Nam Cao <namcao@linutronix.de>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Joel Granados <joel.granados@kernel.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Celeste Liu <coelacanthushex@gmail.com>, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Nylon Chen <nylon.chen@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_024141_247283_49AA12E8 
X-CRM114-Status: GOOD (  22.71  )
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

SGkgSmVzc2UsCgpPbiBXZWQsIEF1ZyA2LCAyMDI1IGF0IDE6MTDigK9BTSBKZXNzZSBUYXViZSA8
amVzc2VAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBTZHRyaWcgUklTQy1WIElTQSBleHRl
bnNpb24gZG9lcyBub3QgaGF2ZSBhIHJlc3VtZSBmbGFnIGZvcgo+IHJldHVybmluZyB0byBhbmQg
ZXhlY3V0aW5nIHRoZSBpbnN0cnVjdGlvbiBhdCB0aGUgYnJlYWtwb2ludC4KPiBUbyBhdm9pZCBz
a2lwcGluZyB0aGUgaW5zdHJ1Y3Rpb24gb3IgbG9vcGluZywgaXQgaXMgbmVjZXNzYXJ5IHRvIHJl
bW92ZQo+IHRoZSBoYXJkd2FyZSBicmVha3BvaW50IGFuZCBzaW5nbGUgc3RlcC4gVXNlIHRoZSBp
Y291bnQgZmVhdHVyZSBvZgo+IFNkdHJpZyB0byBhY2NvbXBsaXNoIHRoaXMuIFVzZSBpY291bnQg
YXMgZGVmYXVsdCB3aXRoIGFuIG9wdGlvbiB0byBhbGxvdwo+IHNvZnR3YXJlLWJhc2VkIHNpbmds
ZSBzdGVwcGluZyB3aGVuIGhhcmR3YXJlIG9yIFNCSSBkb2VzIG5vdCBoYXZlCj4gaWNvdW50IGZ1
bmN0aW9uYWxpdHksIGFzIGl0IG1heSBjYXVzZSB1bndhbnRlZCBzaWRlIGVmZmVjdHMgd2hlbiBy
ZWFkaW5nCj4gdGhlIGluc3RydWN0aW9uIGZyb20gbWVtb3J5Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBPcGVuU0JJIGltcGxlbWVu
dGF0aW9uIG9mIHNiaV9kZWJ1Z19yZWFkX3RyaWdnZXJzIGRvZXMgbm90IHJldHVybiB0aGUKPiB1
cGRhdGVkIENTUiB2YWx1ZXMuIFRoZXJlIG5lZWRzIHRvIGJlIGEgY2hlY2sgZm9yIHdvcmtpbmcK
PiBzYmlfZGVidWdfcmVhZF90cmlnZ2VycyBiZWZvcmUgdGhpcyB3b3Jrcy4KPgo+IGh0dHBzOi8v
bGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcnMvbWVzc2FnZS8xNDc2Cj4KPiBSRkMgLT4gVjE6Cj4g
IC0gQWRkIGRidHJfbW9kZSB0byBydl9pbml0X2ljb3VudF90cmlnZ2VyCj4gIC0gQWRkIGljb3Vu
dF90cmlnZ2VyZWQgdG8gY2hlY2sgd2hpY2ggYnJlYWtwb2ludCB3YXMgdHJpZ2dlcmVkCj4gIC0g
Rml4IHR5cG86IHMvYWZmZWN0cy9lZmZlY3RzCj4gIC0gTW92ZSBIV19CUkVBS1BPSU5UX0NPTVBV
VEVfU1RFUCB0byBQbGF0Zm9ybSB0eXBlCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAg
ICAgICAgICAgICB8ICAxMSArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9od19icmVha3BvaW50LmMg
fCAxNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTcyIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IGZkOGI2MmNkYzZmNS4u
MzdmMDFlZDE5OWYzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+IEBAIC01NDYsNiArNTQ2LDE3IEBAIGNvbmZpZyBSSVNDVl9DT01C
T19TUElOTE9DS1MKPgo+ICBlbmRjaG9pY2UKPgo+ICtjb25maWcgSFdfQlJFQUtQT0lOVF9DT01Q
VVRFX1NURVAKPiArICAgICAgIGJvb2wgIkFsbG93IGNvbXB1dGluZyBoYXJkd2FyZSBicmVha3Bv
aW50IHN0ZXAgYWRkcmVzcyIKPiArICAgICAgIGRlZmF1bHQgbgo+ICsgICAgICAgZGVwZW5kcyBv
biBIQVZFX0hXX0JSRUFLUE9JTlQKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgU2VsZWN0IHRo
aXMgb3B0aW9uIGlmIGhhcmR3YXJlIGJyZWFrcG9pbnRzIGFyZSBkZXNpcmVkLCBidXQKPiArICAg
ICAgICAgaGFyZHdhcmUgb3IgU0JJIGRvZXMgbm90IGhhdmUgaWNvdW50IGZ1bmN0aW9uYWxpdHku
IFRoaXMgbWF5IGNhdXNlCj4gKyAgICAgICAgIHVud2FudGVkIHNpZGUgZWZmZWN0cyB3aGVuIHJl
YWRpbmcgdGhlIGluc3RydWN0aW9uIGZyb20gbWVtb3J5Lgo+ICsKPiArICAgICAgICAgSWYgdW5z
dXJlLCBzYXkgTi4KPiArCgpXZSBleHBlY3QgdGhlIHNhbWUga2VybmVsIGltYWdlIHRvIHdvcmsg
b24gYSBwbGF0Zm9ybSB3aXRoCmljb3VudCB0cmlnZ2VycyBhbmQgd2l0aG91dCBpY291bnQgdHJp
Z2dlcnMuCgpQbGVhc2UgZHJvcCB0aGlzIGtjb25maWcgb3B0aW9uLiBUaGUgZGVjaXNpb24gb2Yg
ZmFsbGluZyBiYWNrIHRvCmNvbXB1dGluZyBoYXJkd2FyZSBicmVha3BvaW50IHN0ZXAgYWRkcmVz
cyBzaG91bGQgYmUgYXQKYm9vdC10aW1lIGFuZCBub3QgY29tcGlsZS10aW1lLgoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
