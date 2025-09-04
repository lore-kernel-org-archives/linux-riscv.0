Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36B2CA1012
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 05:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPLw/6BQvR/HW0vV0ojwx2bW5rOAz1tRY4RV2HyQ/fs=; b=tjP1pujB8SC9Vt
	AfZsEvCbpLs7bz3pwitQaB52K6NJHM3nGF9RfBQdMcB6DdqSFJi6+eiKBaADBhHVawJtpXV+/6XYN
	GYhzXx+Ks0mRzTLIlQRki8eFqkrMZhWqgvyglhWkH+eprAXIW3wVlvCW5Zg5ZKqEwsZaJkghbuFVt
	NfobM6r3PF2Puwf9vUGVHHykLvC6jCg+sNHUrC/P1UFX8zaMUN+68GRvkadXDayL4SdNeCnmmqTuH
	+ZIfwc9wfuptDyar3HqDeBzhx7EpNy+3uCoHkSh1UDONsTginEOV4wJJe+zsBo3O5XMJxFWHcMy86
	VvvV9oZSM1CfLSrQwi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2Z5-00000009G5z-2rIw;
	Thu, 04 Sep 2025 05:31:19 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2Z2-00000009G3S-2tNb
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 05:31:18 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f6f434c96so512673e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756963875; x=1757568675; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUS5HOLhW/VpyZE9onIdkx0oHXwb/D4QXFFEiFH3pRQ=;
        b=kACoaYy7hVDYpj5nF9KMw387wSkQ4ZRE7PV8/MZFJZ4tyD+homnaGIDUHgbpfdH1I6
         idNQMRCMev2cf9UPO4E9whBDsO+aSZL2C28cDllYT3oyvBno2u+11NvwJ7FXDS7R9wg9
         5aaIirZsVD5ltcZXlwMoa8n7u6fBc+922sjlsSfimgsYb9rEFQbQNfwfUBw80hbaW9Qh
         aQizCuZzRTpyL/PO1Fo5h9bzJMiaaxLbeVMu9pgnm2zYQ23AttFkQFXCroXyvG0Gp4Ci
         non110XmJUb3yMosMJl8fYKDrj1Hc8lykuHJFwstXsSsH6UTgQMQOQS/h0SW7rgxSCc9
         n6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756963875; x=1757568675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUS5HOLhW/VpyZE9onIdkx0oHXwb/D4QXFFEiFH3pRQ=;
        b=kOcf/c1y0VVgjAxftpwin6iz0ePiReFVU1NGewqOGo7IXxYhKBuNOl9ONKG7BLL1qr
         6HuUH8sKxkmThUkjDBivPH1yyoqzWMw8IffqVduPTfPh+rXHJuWmYjg/ZM7+e3bj9pBe
         MtWlaab1iHlJMUpxs4xpP9oLefRIiCtC+9kFQnUh6nvSKgOefHh7PHxACt4Im91Cvdp7
         +qWdmz3+KyhKtnexJjLiyEWzXEtxkribAY6inFTk7XB1gy7U/k1B6Vbq3Y2bB9r0Xejf
         Geucxh5Di3GzlFeJ5YPLVb5yrW94tNHeel1a3+P84qUntHq94dtEOfgPaIvn1SmQCTvu
         ALrA==
X-Gm-Message-State: AOJu0YyZqwUvxF2JhyqSnVZ3Om3eSAJ1Db4MuMDHGt/jJJsBPgVedmDT
	60KetgAPQldm8yxS5+WnpGd2IAJ4IknCgxgY0josOnja2Pmw1NbwINmgQjjOvDLMIm9GPcc5mRa
	dWyb5X8CBMBlCTByhK9+Z8FskvHyS6vx3FfeFg+t5VA==
X-Gm-Gg: ASbGnctdoVhLTRrdE7ZROnh+5Ndsp+v9ZkWp20tCF07Zzax9DHLaP1U5mrkDhWTMQKx
	EjsDDwSGzKjYTddnIOjtHlJC1Y1ZEjHMcqm/TZqxu3bXP3Gs5ZdvcRBYzuY7c7DnmgBYU4viS6h
	u5vb+FgFDPs1tcktJwWiubqUNV7ddecIU07/T/NS9pxZI/odE9PS+BSi5m0LFKuaB4Bv+9JmJCS
	jH3DNnpeP1gkqr4Qkw=
X-Google-Smtp-Source: AGHT+IHpG/4DLLscFeJxg9oiSMyrT9Ei4giIfqBu/oq/vW7+cyJh5b4Qc/vs+psL1BC6wQvPjI60Gtk/quL0fGjGJtU=
X-Received: by 2002:a05:6512:1594:b0:55f:6831:6ef4 with SMTP id
 2adb3069b0e04-55f7089c47amr5218029e87.12.1756963874604; Wed, 03 Sep 2025
 22:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250822174715.1269138-1-jesse@rivosinc.com> <20250822174715.1269138-5-jesse@rivosinc.com>
In-Reply-To: <20250822174715.1269138-5-jesse@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 4 Sep 2025 11:01:02 +0530
X-Gm-Features: Ac12FXz_-ibvebvqMYm5-3Nr_6futqZOiLsqEgz-5uDfiWQDjH2HOgDMSF197Fg
Message-ID: <CAK9=C2X=SmJeYqZtUNHuDBZRrUpONCm6Z=qVPH8C1ckz=r6hCw@mail.gmail.com>
Subject: Re: [PATCH 4/8] riscv: Introduce support for hardware break/watchpoints
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
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
	Ravi Bangoria <ravi.bangoria@amd.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_223116_731693_6A7023DF 
X-CRM114-Status: GOOD (  24.20  )
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

T24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgMTE6MTfigK9QTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEZyb206IEhpbWFuc2h1IENoYXVoYW4gPGhjaGF1aGFuQHZl
bnRhbmFtaWNyby5jb20+Cj4KPiBSSVNDLVYgaGFyZHdhcmUgYnJlYWtwb2ludCBmcmFtZXdvcmsg
aXMgYnVpbHQgb24gdG9wIG9mIHBlcmYgc3Vic3lzdGVtIGFuZCB1c2VzCj4gU0JJIGRlYnVnIHRy
aWdnZXIgZXh0ZW5zaW9uIHRvIGluc3RhbGwvdW5pbnN0YWxsL3VwZGF0ZS9lbmFibGUvZGlzYWJs
ZSBoYXJkd2FyZQo+IHRyaWdnZXJzIGFzIHNwZWNpZmllZCBpbiBTZHRyaWcgSVNBIGV4dGVuc2lv
bi4KPgo+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhjaGF1aGFuQHZlbnRhbmFt
aWNyby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNv
bT4KPiAtLS0KPiBSRkMgLT4gVjE6Cj4gIC0gQWRkIGRidHJfbW9kZSB0byBydl9pbml0X21jb250
cm9sKDYpX3RyaWdnZXIKPiAgLSBBZGQgc2VsZWN0IEhBVkVfTUlYRURfQlJFQUtQT0lOVFNfUkVH
Uwo+ICAtIEFkZCBUREFUQTFfTUNUUkxfU1ogYW5kIFREQVRBMV9NQ1RSTDZfU1oKPiAgLSBDYXBp
dGFsaXplIEYgaW4gRmFsbGJhY2sgY29tbWVudAo+ICAtIEZpeCBpbl9jYWxsYmFjayBjb2RlIHRv
IGFsbG93IG11bHRpcGxlIGJyZWFrcG9pbnRzCj4gIC0gTW92ZSBwZXJmX2JwX2V2ZW50IGFib3Zl
IHNldHVwX3NpbmdsZXN0ZXAgdG8gc2F2ZSB0aGUgY29ycmVjdCBzdGF0ZQo+ICAtIFVzZSBzYmlf
ZXJyX21hcF9saW51eF9lcnJubyBmb3IgYXJjaF9zbXBfdGVhcmRvd24vc2V0dXBfc2JpX3NobWVt
Cj4gVjEgLT4gVjI6Cj4gIC0gTm8gY2hhbmdlCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od19i
cmVha3BvaW50LmggfCAgNTkgKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2RlYnVnLmgg
ICAgICAgIHwgICAzICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgICAgICAg
IHwgICA0ICstCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgIHwgICAx
ICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jICAgICAgfCA2MTQgKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgICAg
ICAgICB8ICAgNiArCj4gIDcgZmlsZXMgY2hhbmdlZCwgNjg3IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
X2JyZWFrcG9pbnQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvaHdf
YnJlYWtwb2ludC5jCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9y
aXNjdi9LY29uZmlnCj4gaW5kZXggYmJlYzg3Yjc5MzA5Li5mZDhiNjJjZGM2ZjUgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAg
LTE2Myw2ICsxNjMsNyBAQCBjb25maWcgUklTQ1YKPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNU
SU9OX0VSUk9SX0lOSkVDVElPTgo+ICAgICAgICAgc2VsZWN0IEhBVkVfR0NDX1BMVUdJTlMKPiAg
ICAgICAgIHNlbGVjdCBIQVZFX0dFTkVSSUNfVkRTTyBpZiBNTVUgJiYgNjRCSVQKPiArICAgICAg
IHNlbGVjdCBIQVZFX0hXX0JSRUFLUE9JTlQgaWYgUEVSRl9FVkVOVFMgJiYgUklTQ1ZfU0JJCj4g
ICAgICAgICBzZWxlY3QgSEFWRV9JUlFfVElNRV9BQ0NPVU5USU5HCj4gICAgICAgICBzZWxlY3Qg
SEFWRV9LRVJORUxfQlpJUDIgaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9aQk9PVAo+ICAgICAgICAg
c2VsZWN0IEhBVkVfS0VSTkVMX0daSVAgaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9aQk9PVAo+IEBA
IC0xNzYsNiArMTc3LDcgQEAgY29uZmlnIFJJU0NWCj4gICAgICAgICBzZWxlY3QgSEFWRV9LUkVU
UFJPQkVTIGlmICFYSVBfS0VSTkVMCj4gICAgICAgICAjIGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFu
Z0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE4ODEKPiAgICAgICAgIHNlbGVjdCBIQVZFX0xEX0RF
QURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OIGlmICFMRF9JU19MTEQKPiArICAgICAgIHNlbGVjdCBI
QVZFX01JWEVEX0JSRUFLUE9JTlRTX1JFR1MKPiAgICAgICAgIHNlbGVjdCBIQVZFX01PVkVfUE1E
Cj4gICAgICAgICBzZWxlY3QgSEFWRV9NT1ZFX1BVRAo+ICAgICAgICAgc2VsZWN0IEhBVkVfUEFH
RV9TSVpFXzRLQgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3X2JyZWFr
cG9pbnQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2ludC5oCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNkZTY2ODhiOTFkMgo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3X2JyZWFrcG9pbnQuaAo+
IEBAIC0wLDAgKzEsNTkgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgVmVudGFuYSBNaWNybyBTeXN0
ZW1zIEluYy4KPiArICovCj4gKwo+ICsjaWZuZGVmIF9fUklTQ1ZfSFdfQlJFQUtQT0lOVF9ICj4g
KyNkZWZpbmUgX19SSVNDVl9IV19CUkVBS1BPSU5UX0gKPiArCj4gK3N0cnVjdCB0YXNrX3N0cnVj
dDsKPiArCj4gKyNpZmRlZiBDT05GSUdfSEFWRV9IV19CUkVBS1BPSU5UCj4gKwo+ICsjaW5jbHVk
ZSA8dWFwaS9saW51eC9od19icmVha3BvaW50Lmg+Cj4gKwo+ICsjaWYgX19yaXNjdl94bGVuID09
IDY0Cj4gKyNkZWZpbmUgY3B1X3RvX2xlIGNwdV90b19sZTY0Cj4gKyNkZWZpbmUgbGVfdG9fY3B1
IGxlNjRfdG9fY3B1Cj4gKyNlbGlmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+ICsjZGVmaW5lIGNwdV90
b19sZSBjcHVfdG9fbGUzMgo+ICsjZGVmaW5lIGxlX3RvX2NwdSBsZTMyX3RvX2NwdQo+ICsjZWxz
ZQo+ICsjZXJyb3IgIlVuZXhwZWN0ZWQgX19yaXNjdl94bGVuIgo+ICsjZW5kaWYKPiArCj4gK3N0
cnVjdCBhcmNoX2h3X2JyZWFrcG9pbnQgewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyZXNz
Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBsZW47Cj4gKwo+ICsgICAgICAgLyogQ2FsbGJhY2sg
aW5mbyAqLwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBuZXh0X2FkZHI7Cj4gKyAgICAgICBib29s
IGluX2NhbGxiYWNrOwo+ICsKPiArICAgICAgIC8qIFRyaWdnZXIgY29uZmlndXJhdGlvbiBkYXRh
ICovCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHRkYXRhMTsKPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgdGRhdGEyOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB0ZGF0YTM7Cj4gK307Cj4gKwo+ICsv
KiBNYXhpbXVtIG51bWJlciBvZiBoYXJkd2FyZSBicmVha3BvaW50cyBzdXBwb3J0ZWQgKi8KPiAr
I2RlZmluZSBSVl9NQVhfVFJJR0dFUlMgMzIKPiArCj4gK3N0cnVjdCBwZXJmX2V2ZW50X2F0dHI7
Cj4gK3N0cnVjdCBub3RpZmllcl9ibG9jazsKPiArc3RydWN0IHBlcmZfZXZlbnQ7Cj4gK3N0cnVj
dCBwdF9yZWdzOwo+ICsKPiAraW50IGh3X2JyZWFrcG9pbnRfc2xvdHMoaW50IHR5cGUpOwo+ICtp
bnQgYXJjaF9jaGVja19icF9pbl9rZXJuZWxzcGFjZShzdHJ1Y3QgYXJjaF9od19icmVha3BvaW50
ICpodyk7Cj4gK2ludCBod19icmVha3BvaW50X2FyY2hfcGFyc2Uoc3RydWN0IHBlcmZfZXZlbnQg
KmJwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBlcmZfZXZl
bnRfYXR0ciAqYXR0ciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhcmNo
X2h3X2JyZWFrcG9pbnQgKmh3KTsKPiAraW50IGh3X2JyZWFrcG9pbnRfZXhjZXB0aW9uc19ub3Rp
Znkoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICp1bnVzZWQsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB2YWwsIHZvaWQgKmRhdGEpOwo+ICtpbnQgYXJj
aF9pbnN0YWxsX2h3X2JyZWFrcG9pbnQoc3RydWN0IHBlcmZfZXZlbnQgKmJwKTsKPiArdm9pZCBh
cmNoX3VuaW5zdGFsbF9od19icmVha3BvaW50KHN0cnVjdCBwZXJmX2V2ZW50ICpicCk7Cj4gK3Zv
aWQgaHdfYnJlYWtwb2ludF9wbXVfcmVhZChzdHJ1Y3QgcGVyZl9ldmVudCAqYnApOwo+ICsKPiAr
I2VuZGlmIC8qIENPTkZJR19IQVZFX0hXX0JSRUFLUE9JTlQgKi8KPiArI2VuZGlmIC8qIF9fUklT
Q1ZfSFdfQlJFQUtQT0lOVF9IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va2RlYnVnLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tkZWJ1Zy5oCj4gaW5kZXggODVh
YzAwNDExZjZlLi41M2U5ODk3ODFhYTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rZGVidWcuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2RlYnVnLmgKPiBA
QCAtNiw3ICs2LDggQEAKPiAgZW51bSBkaWVfdmFsIHsKPiAgICAgICAgIERJRV9VTlVTRUQsCj4g
ICAgICAgICBESUVfVFJBUCwKPiAtICAgICAgIERJRV9PT1BTCj4gKyAgICAgICBESUVfT09QUywK
PiArICAgICAgIERJRV9ERUJVRwo+ICB9Owo+Cj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+
IGluZGV4IGJlMmNhOGU4YTQ5ZS4uNjRmYTdhODJhYTQ1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5o
Cj4gQEAgLTI4Miw3ICsyODIsOSBAQCBzdHJ1Y3Qgc2JpX3N0YV9zdHJ1Y3Qgewo+ICAgICAgICAg
dTggcGFkWzQ3XTsKPiAgfSBfX3BhY2tlZDsKPgo+IC0jZGVmaW5lIFNCSV9TSE1FTV9ESVNBQkxF
ICAgICAgICAgICAgICAtMQo+ICsjZGVmaW5lIFNCSV9TSE1FTV9ESVNBQkxFICAgICAgKC0xVUwp
Cj4gKyNkZWZpbmUgU0JJX1NITUVNX0xPKHBhKSAgICAgICAoKHVuc2lnbmVkIGxvbmcpbG93ZXJf
MzJfYml0cyhwYSkpCj4gKyNkZWZpbmUgU0JJX1NITUVNX0hJKHBhKSAgICAgICAoKHVuc2lnbmVk
IGxvbmcpdXBwZXJfMzJfYml0cyhwYSkpCgpUaGVzZSBkZWZpbml0aW9ucyBvZiBTQklfU0hNRU1f
TE8oKSBhbmQgU0JJX1NITUVNX0hJKCkgYXJlCmJyb2tlbiBmb3IgUlY2NCBwbGF0Zm9ybXMgd2hl
cmUgYSBnb29kIGFtb3VudCBvZiBSQU0gaXMgYmV5b25kCmZpcnN0IDRHQi4KClRoaXMgc2hvdWxk
IGJlOgoKI2lmZGVmIENPTkZJR18zMkJJVAojZGVmaW5lIFNCSV9TSE1FTV9MTyhwYSkgICAgICAg
KCh1bnNpZ25lZCBsb25nKWxvd2VyXzMyX2JpdHMocGEpKQojZGVmaW5lIFNCSV9TSE1FTV9ISShw
YSkgICAgICAgKCh1bnNpZ25lZCBsb25nKXVwcGVyXzMyX2JpdHMocGEpKQojZWxzZQojZGVmaW5l
IFNCSV9TSE1FTV9MTyhwYSkgICAgICAgKCh1bnNpZ25lZCBsb25nKXBhKQojZGVmaW5lIFNCSV9T
SE1FTV9ISShwYSkgICAgICAgMFVMCiNlbmRpZgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
