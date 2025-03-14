Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1321C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYhagRW3/9WB99zhvPJ6GN4hflkSztqfuH3fBuvg6RU=; b=Bbfn4cqOCB/YbE
	SnDudZIEW2lytVHIP1Dklw4oVRw9fK4X4/tLrC/dnddXk/gGkObAQcEHKE2j+/VP9Tdo/0mqCN23t
	YmT8K2YTH8kYg5gpwXoRb2ftVfjG6jK82uAs4/6pP6sTxNUSE1EppJx+e2v+w673PZ4mRQ58nynEI
	1apmMZ6FxsImXTv4JAmKqtufzsfmbWCrw/S3qFxbFsktAO80H6wls1DRlebN7mc6MYtFJMHwyAQ62
	6RyNovkJX6g/A3q4PiLCxhVECj4tIwcIZrry3bFSW7c8f2hcLplDQb8oKFeNg5b4/a3YDd29iAAP5
	sqtzKvPpGGzwqvpWF8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0B1-0000000DPo6-17P6;
	Fri, 14 Mar 2025 08:13:55 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt07q-0000000DP1M-1Fq8
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:10:40 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso7018855ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741939837; x=1742544637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maat8Z8CQlIo/YQgvM5joGb0bwlzNNQQ5lvrvmfPTnE=;
        b=Xbb0Bphg3scVSfnCNZoPUe2+sBZHzPwiZfg9u9rGrfOa2b3S/IYa3/M25ikRtq7Bia
         cxqDdw6D1s1D/ObXN/71MGVkqDu61Ywzyd3Aw7mhzJTMc6gcrrLxQqTRnc26bki32Ih8
         XmTZ8HrPXHq+15PIHbyPzeq0gAlaQ5VhekVNqTJyqls4a2WmPWGth5rRcuKnenZQeBOS
         D578puACdprjHx9RlFSf+JKAnRB2WMD0fZ5miuD38yPXeP6kUBNaQDhmB/wELmsKX0hR
         ZHx7k0I4jPYQOv8p590gVcWE6y01q5G6pzIRtrElFSZJWIx8V4MbzO32FwLNjFO30PxU
         dB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939837; x=1742544637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maat8Z8CQlIo/YQgvM5joGb0bwlzNNQQ5lvrvmfPTnE=;
        b=MigVQZVNXQ+qZnxhCBE1N/vtsyjCdFsGxTRMafKud8US5hf8Hrm0b52ayxImpUmxwk
         BA8GpB48j2URH7iMBxytxEBEVoIXt9nTmBUbQrCfUlwrGQaPQaGMdVzsl6LPcbX96Nrr
         PDVdgmJyJi02sTN77Gm41G8NOynHs50uTtXd02zyS140Gxa3GD5Bf7+xlLY8kxgPpNvI
         Ofxjlk+eoE1qvTRxw4kqoXs2CWkbPa2RsL3l0EF0ga/64Qgsayoie32fG27oEFOrSP6u
         niq55Uc4fkPiq0zaWRMeeOYOKbT5p+qEYbzNtDSyjh4+Q+rT4648mo9VZ9kBSZAsRbmJ
         rSzw==
X-Forwarded-Encrypted: i=1; AJvYcCV+n75KHSKGIBgbP/yzHT+NaQvIKkjId6CLk6h4aVmuf8AVXg15rJaok4+M28A4MjvehLTy6HgekSwESg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNovvah3Wf48kslBOvnK4p+WiX/g4348EUuGw9i8+AINVC3pJf
	6dc/Vo8AwN1AhMxnQTyV04u8iMbz1aMhB2ClVbr4y+meYQpcun1/8C5zk3Ro1TW9APM5lrPwMa/
	jKq+b+/7gRo/5nx0y5PowPoMqSBpOUzbwsQWuEw==
X-Gm-Gg: ASbGncvo5Y2iYyyLgar3B8P7xgiHATD8+q1Qp8hZ6G4mDmj1TPRnEwvth6C6B50EhYD
	jW7hY26SLw48bkrlCo+dtPoY4gSVjmaNNVmCYZyfuIEGGeS4oWeZ9QDa4LqMpzrrW4tDo6vR5iO
	JqNQXO96g3mkOKOybtof4YaFsn5X1MS0v2l5SQFGA=
X-Google-Smtp-Source: AGHT+IEr06JJWPIe++RWZprx7+sk0G4gmp805oxABOzSJgVtajhlGN2WM+TyYd1zsyGazHwiZ0K31rleVVMRVGbr6R4=
X-Received: by 2002:a92:c246:0:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d4839feb6emr12608625ab.3.1741939837275; Fri, 14 Mar 2025
 01:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-3-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-3-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:10:24 +0800
X-Gm-Features: AQ5f1JpIIk67nxD8XYVlg0yQoGLERm_fNClgnrJ71NE6nAneEkcJbes_9dfQWtA
Message-ID: <CANXhq0p22tsMUBffV4rTu+Txf0ugmpUmUQZWf2EX00Qxhvq2_Q@mail.gmail.com>
Subject: Re: [PATCH v11 03/27] riscv: zicfiss / zicfilp enumeration
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_011038_343389_CEDCE288 
X-CRM114-Status: GOOD (  24.06  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDLigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgZGV0ZWN0
aW5nIHppY2Zpc3MgYW5kIHppY2ZpbHAuIHppY2Zpc3MgYW5kCj4gemljZmlscCBzdGFuZHMgZm9y
IHVucHJpdmxlZ2VkIGludGVnZXIgc3BlYyBleHRlbnNpb24gZm9yIHNoYWRvdyBzdGFjawo+IGFu
ZCBicmFuY2ggdHJhY2tpbmcgb24gaW5kaXJlY3QgYnJhbmNoZXMsIHJlc3BlY3RpdmVseS4KPgo+
IFRoaXMgcGF0Y2ggbG9va3MgZm9yIHppY2Zpc3MgYW5kIHppY2ZpbHAgaW4gZGV2aWNlIHRyZWUg
YW5kIGFjY29yZGlubGd5Cj4gbGlnaHRzIHVwIGJpdCBpbiBjcHUgZmVhdHVyZSBiaXRtYXAuIEZ1
cnRoZXJtb3JlIHRoaXMgcGF0Y2ggYWRkcyBkZXRlY3Rpb24KPiB1dGlsaXR5IGZ1bmN0aW9ucyB0
byByZXR1cm4gd2hldGhlciBzaGFkb3cgc3RhY2sgb3IgbGFuZGluZyBwYWRzIGFyZQo+IHN1cHBv
cnRlZCBieSBjcHUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9z
aW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggfCAx
MyArKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgIHwg
IDIgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgfCAgMSArCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ICA0
IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1
ZmVhdHVyZS5oCj4gaW5kZXggNTY5MTQwZDZlNjM5Li42OTAwN2I4MTAwY2EgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IEBAIC0xMiw2ICsxMiw3IEBACj4gICNpbmNsdWRl
IDxsaW51eC9rY29uZmlnLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wZXJjcHUtZGVmcy5oPgo+ICAj
aW5jbHVkZSA8bGludXgvdGhyZWFkcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4gICNp
bmNsdWRlIDxhc20vaHdjYXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLW1hY3Jvcy5o
Pgo+Cj4gQEAgLTEzNyw0ICsxMzgsMTYgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJp
c2N2X2NwdV9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KGludCBjcHUsIGNvbnN0IHVuc2kKPiAgICAg
ICAgIHJldHVybiBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGhhcnRfaXNhW2NwdV0u
aXNhLCBleHQpOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBib29sIGNwdV9zdXBwb3J0c19zaGFk
b3dfc3RhY2sodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIChJU19FTkFCTEVEKENPTkZJR19S
SVNDVl9VU0VSX0NGSSkgJiYKPiArICAgICAgICAgICAgICAgcmlzY3ZfY3B1X2hhc19leHRlbnNp
b25fdW5saWtlbHkoc21wX3Byb2Nlc3Nvcl9pZCgpLCBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MpKTsK
PiArfQo+ICsKPiArc3RhdGljIGlubGluZSBib29sIGNwdV9zdXBwb3J0c19pbmRpcmVjdF9icl9s
cF9pbnN0cih2b2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gKElTX0VOQUJMRUQoQ09ORklHX1JJ
U0NWX1VTRVJfQ0ZJKSAmJgo+ICsgICAgICAgICAgICAgICByaXNjdl9jcHVfaGFzX2V4dGVuc2lv
bl91bmxpa2VseShzbXBfcHJvY2Vzc29yX2lkKCksIFJJU0NWX0lTQV9FWFRfWklDRklMUCkpOwo+
ICt9Cj4gKwo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggODY5ZGEwODIy
NTJhLi4yZGM0MjMyYmRiM2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTEwMCw2
ICsxMDAsOCBAQAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDQ1JTRSAgICAgICAgICA5MQo+
ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1ZBREUgICAgICAgICAgICA5Mgo+ICAjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfU1ZBRFUgICAgICAgICAgICA5Mwo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WklDRklMUCAgICAgICAgICA5NAo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDRklTUyAgICAg
ICAgICA5NQo+Cj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcgICAgIDEyNwo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gaW5kZXggNWY1NmViOWQxMTRhLi5lM2Fi
YTMzMzZlNjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiBAQCAtMTMsNiAr
MTMsNyBAQAo+ICAjaW5jbHVkZSA8dmRzby9wcm9jZXNzb3IuaD4KPgo+ICAjaW5jbHVkZSA8YXNt
L3B0cmFjZS5oPgo+ICsjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4KPiAgI2RlZmluZSBhcmNoX2dl
dF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKSAgICAgICAgICAgICAgICAgICAgXAo+ICAoeyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IGM2YmE3NTA1MzZjMy4uODIwNjVjYzU1
ODIyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0xNTAsNiArMTUwLDE1IEBAIHN0
YXRpYyBpbnQgcmlzY3ZfZXh0X3N2YWR1X3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2Ff
ZXh0X2RhdGEgKmRhdGEsCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQg
cmlzY3ZfY2ZpX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNh
X2JpdG1hcCkKPiArewo+ICsgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19SSVNDVl9VU0VS
X0NGSSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgICAgIHJl
dHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3prX2J1
bmRsZWRfZXh0c1tdID0gewo+ICAgICAgICAgUklTQ1ZfSVNBX0VYVF9aQktCLAo+ICAgICAgICAg
UklTQ1ZfSVNBX0VYVF9aQktDLAo+IEBAIC0zMzMsNiArMzQyLDEwIEBAIGNvbnN0IHN0cnVjdCBy
aXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX1NVUEVSU0VUX1ZBTElEQVRFKHppY2JveiwgUklTQ1ZfSVNBX0VYVF9aSUNCT1osIHJp
c2N2X3hsaW51eGVudmNmZ19leHRzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEEoemljY3JzZSwgUklTQ1ZfSVNBX0VYVF9aSUNDUlNFKSwKPiArICAgICAgIF9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh6aWNmaWxwLCBSSVNDVl9JU0FfRVhUX1pJ
Q0ZJTFAsIHJpc2N2X3hsaW51eGVudmNmZ19leHRzLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJpc2N2X2NmaV92YWxpZGF0ZSksCj4gKyAgICAgICBfX1JJU0NW
X0lTQV9FWFRfU1VQRVJTRVRfVkFMSURBVEUoemljZmlzcywgUklTQ1ZfSVNBX0VYVF9aSUNGSVNT
LCByaXNjdl94bGludXhlbnZjZmdfZXh0cywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByaXNjdl9jZmlfdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemljbnRyLCBSSVNDVl9JU0FfRVhUX1pJQ05UUiksCj4gICAgICAgICBfX1JJU0NW
X0lTQV9FWFRfREFUQSh6aWNvbmQsIFJJU0NWX0lTQV9FWFRfWklDT05EKSwKPiAgICAgICAgIF9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHppY3NyLCBSSVNDVl9JU0FfRVhUX1pJQ1NSKSwKPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cgo+IC0tCj4gMi4zNC4x
Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
