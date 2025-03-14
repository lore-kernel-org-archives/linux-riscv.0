Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B578C35FF1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdcyS8KfR+Vpgu+rKS6XKpCQsmEzEYzkRNhi7Jifrjw=; b=vl03HGvnOY7xtV
	7fEBK1UG5XIPm0th105TWwGVHRl0kqYy72rq2nrwKbCQxvJ4spzg9Mb2hHHR32RYeSI62Sf+uPnzg
	165ZTqWYDKRZVLk6aRv4IfXObhLBT/ITrsRTu6luNKqjsWzoPDxU0Ntsh065vD1dTc5zajdz1L7co
	65d+ZnHz6S/3wMOjVwQp/L58ZQ1PrUJp3lcbevhAacWMxEXBwue5YkX8u5Cd0wWiW/UQiYeMKFY+e
	6u+hh6rELelpmVkmTBmWB/k5PG3xRatW9HiHMKv9BTESohvlJDUsLj3NVlYqq1fDGXvBg7P2RltGi
	aRuz6Ze+jw/e+tSqIzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lF-0000000DXGV-08QK;
	Fri, 14 Mar 2025 08:51:21 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Pv-0000000DTCy-3Z2e
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:29:21 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3ce87d31480so10621945ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940959; x=1742545759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxVr83p2rf+5dCw7Lw8LcBlDRmjGebAKjjwwOziVPbk=;
        b=NQcjV4i8n3b3LsGbh0DNqqAhsu/YAkPeI8eWQU0WEMmzOJhYBV63MXkA1GgxbQwIcj
         kyqFspGF/JYfbP2lchhM+RcqaJOvv7pvH8XIt7S8neiXmpoKPthFPKh92XKqGOJV8sxG
         xgFNIXkUYzlo5EfH21Vq0aUTtAyTHm1+m5JkdxN+TXYPilFdFMuXzHIdG14iQ6NV+/Ac
         yXRK2ql44xBqnjGD0Qs9FUrm5ubtqLm3ee+lyxQ+f0RGJWAyiy2DB5xZPc6IENXHLR73
         yep+AEXNA1XRhNia9rCES50GBOXkkGYhsL6GJ04bMS8oP6huCETq5Mz+vp6FJrj162dy
         JaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940959; x=1742545759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxVr83p2rf+5dCw7Lw8LcBlDRmjGebAKjjwwOziVPbk=;
        b=bo/rLReRg2qoSTi2kY9xHbx7ine0b/A9Buaoq+UBISrBhIQ2bli02M99iHN4t5TorV
         pmoEkE3Y3e02xCkle29aq/mmTRquocYihDC6r16CuTVldExE76kOs9jiNFBDFQKlrZYd
         B2gYai0DABV+XaDS16F5VVqVuyhj4GHS/kQdo/EO2ixGFdCSL9QyEgm1ShrUguDDbq8j
         qGGqNsP3XJkI9iEN+k39Q9uZGYkijMSnh0FyFrYWab/NSt8hyzf+NAvBWA44ycdzsk56
         6obZxmYBSzGIm03dqbsy21Vwbbir2aB6QQcpb7eP9aCMGOTEFL/R368I2DbeHbIhbBx3
         ax5A==
X-Forwarded-Encrypted: i=1; AJvYcCWoMj0Y8wfczMrKw6Q8sbsXv71CAFHv5h4i5v6uH7otS63u7FQzNwxXI75gkx8FX4+SRbpQkI8HaaoMmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS8StUYPbdyKjSw56Jih3idraTxsiDArFxm5raqQArYB09ljTU
	3S3MflsFO2XRWZaoZnD4aD8quhgTPF+68sLYqYJK7AqXnmGu6Mz1QJNl1NR9e93RfLn/aW1Fybw
	c8fP2vATWGlb2bGXK261tVqoVWw0rDjNOgvCr7w==
X-Gm-Gg: ASbGncu24pQvov8+Mg8hWVQOGU5FtZD2n5esRm/4jb+eHgjIwpqxgZz6MkFk24k85AC
	nHiuwjI3+LjzwSDnMLbCVgjL7yiyJqdsfDNcGeAqfY4rfYELN3beQlx6Hj7Z28Bzpmle8idtEN6
	mOuOMwgGNfIQ8c2DoRof3Qht4tNKg=
X-Google-Smtp-Source: AGHT+IGlDdFi6Vpd7s4QLdbvi8Cqhy34taRkBd3D9zjPXIBtVOW0CW6f58wdIjt5/hLNpuPREwmdcymeJrMO3NiULz8=
X-Received: by 2002:a05:6602:474a:b0:85b:3e32:9afb with SMTP id
 ca18e2360f4ac-85dc4886c82mr172686839f.14.1741940958777; Fri, 14 Mar 2025
 01:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-7-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-7-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:29:07 +0800
X-Gm-Features: AQ5f1JoNjzFrXdaav0OHMQixLYEkQuo_9iZghJLJMBKa9dQ7-q72vtSQTfgooYI
Message-ID: <CANXhq0pAwwcKW_0Pxj_M5rtdGwuhrCO1=428y2aHgRBc60N2eQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/27] riscv mm: manufacture shadow stack pte
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
X-CRM114-CacheID: sfid-20250314_012919_896301_23551267 
X-CRM114-Status: GOOD (  16.74  )
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
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgY3JlYXRpbmcgc2hh
ZG93IHN0YWNrIHB0ZSAob24gcmlzY3YpLiBDcmVhdGluZwo+IHNoYWRvdyBzdGFjayBQVEUgb24g
cmlzY3YgbWVhbnMgdGhhdCBjbGVhcmluZyBSV1ggYW5kIHRoZW4gc2V0dGluZyBXPTEuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdl
ZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDEwICsrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
aW5kZXggOGM1MjhjZDczNDdhLi5lZGU0MzE4NWZmZGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAo+IEBAIC00MjEsNiArNDIxLDExIEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX21r
d3JpdGVfbm92bWEocHRlX3QgcHRlKQo+ICAgICAgICAgcmV0dXJuIF9fcHRlKHB0ZV92YWwocHRl
KSB8IF9QQUdFX1dSSVRFKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX21rd3Jp
dGVfc2hzdGsocHRlX3QgcHRlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gX19wdGUoKHB0ZV92YWwo
cHRlKSAmIH4oX1BBR0VfTEVBRikpIHwgX1BBR0VfV1JJVEUpOwo+ICt9Cj4gKwo+ICAvKiBzdGF0
aWMgaW5saW5lIHB0ZV90IHB0ZV9ta2V4ZWMocHRlX3QgcHRlKSAqLwo+Cj4gIHN0YXRpYyBpbmxp
bmUgcHRlX3QgcHRlX21rZGlydHkocHRlX3QgcHRlKQo+IEBAIC03NDksNiArNzU0LDExIEBAIHN0
YXRpYyBpbmxpbmUgcG1kX3QgcG1kX21rd3JpdGVfbm92bWEocG1kX3QgcG1kKQo+ICAgICAgICAg
cmV0dXJuIHB0ZV9wbWQocHRlX21rd3JpdGVfbm92bWEocG1kX3B0ZShwbWQpKSk7Cj4gIH0KPgo+
ICtzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9ta3dyaXRlX3Noc3RrKHBtZF90IHB0ZSkKPiArewo+
ICsgICAgICAgcmV0dXJuIF9fcG1kKChwbWRfdmFsKHB0ZSkgJiB+KF9QQUdFX0xFQUYpKSB8IF9Q
QUdFX1dSSVRFKTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSBwbWRfdCBwbWRfd3Jwcm90ZWN0
KHBtZF90IHBtZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIHB0ZV9wbWQocHRlX3dycHJvdGVjdChw
bWRfcHRlKHBtZCkpKTsKPgoKTEdUTS4KClJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNp
Zml2ZS5jb20+Cgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
