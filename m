Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF7C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qrqVpaGFuZ5hQ8DaL0xVx5NDA9ErYlsSV/wBZbS1c4=; b=3/xgVa5d5tTHx4
	891gSdfu/Ka0SWfG3clHpWqTMgVydrSkvc4SSA7kBqRAIwbyDYtx4jX3e6i0oZDyaADGz3efpYm85
	udnzFnK/KFulIsigQR+oKc65CdixK3Pj6638FvztfODFgJWL17B8EOe6J33x38svBWNbZgYItinEc
	0qQ29hRDJx5rUG+ZLBXQhHwpLj3xbK0abiKmuzK/CYfpbSQ9N/qzfW91YjfjPDOanFH2Rk6v4VFqG
	DGBPusZDZLIixq3zDIQ7cndFtso25y4noR42rI4xz9YrLmHGZyLTPpHWasI09bPJMThQTr7W/gPWE
	j+04LF00Gm9e7AsuK7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lD-0000000DXDs-07sd;
	Fri, 14 Mar 2025 08:51:19 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0OS-0000000DSet-3dQN
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:27:50 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-85b4277d03fso53917039f.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940868; x=1742545668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8bj5T6m1yE9zyibPVyLAnvEMluIIdsT4MhqvG4OGMI=;
        b=P+8jOrW/VHR9eZNAJRwLQXO+fsC8D9hdMQuazRqOX9AVvfS/YbAa7wMvXTy/asdz8F
         msyCT5QQgB3zZV554x9GyEPz39EoMqxAxfgZGnEsDcOxKcJzVSd/FjAdOBLxpSIMTdGU
         J8c0oaruOMrdAWgC0MZv75+E9ADRXxZWPkEECMQb41+vG0CffC59UakzMvwHD76aGqkT
         ShBVkOM0bHoi/84eVL4ZpJ4ge668SmHgZQc+gdY8b62xdQQy6yqE32A13sn5B4geDP32
         qoLYngsEEflNpwjI5h0EESuCwWjWRLhoacuJaY8OG1yhLnRmn11ZXMJ1fQ5FmXPru7jg
         F3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940868; x=1742545668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8bj5T6m1yE9zyibPVyLAnvEMluIIdsT4MhqvG4OGMI=;
        b=kE55wZObuIMtqILcF7rDSxvVqWbMzmQGYNSNrYjKk80SCVl208hManT2px1LEPM+q6
         UWDlQw0woQ7bzKPnB2Kbn2ulnAeL7qZoeRMFJgfx7gMNU2juIH3a5s7wAdMAYMQgj9sX
         78URkgvRbgeyp4dnwIEaUaam3cYqo9I1a184UxtacylSzjZ6fQqZjTJajuiK23qq5XRA
         53k5odbmEm4Gc9EZ8+G9kCxSti/HvF4UxzpaeUiDom8Jfidh8sdK3Dt01Y9ntchSMR+R
         JtqFeblfBbCU1R7Sx9gVTO39nbiF8AjDS7WAS2BYOfPLCd0b4Lw2AqWY1eH03Aby0+RY
         yS1A==
X-Forwarded-Encrypted: i=1; AJvYcCWYd6h6y8WzeshqdRbSmbYcolyuK5XJ4k8pWhNEb9TMYB5Ho41YNXl5ys9vtSXZQ07Z1arFk/H6gT8jlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3eMZwqKJgJ+jpCZrsMyh43MJaq2+U8w8NzP4GPGTr13lWvEHB
	lad/q32IUWzWFm44PLpuda15rXIA+8Yg9jmSqm9PGjdB10GdabB+rH8hG3a8XllvHYSR8Y7AA29
	ux18Ymf8AEbMoefVGfoAf6rtO/hSf6W/57Mkysg==
X-Gm-Gg: ASbGncvkJB1QDtoGLJnwwUrTZY4gUPsbTW7YywAMyhp1s6HvoMhmtT6xB2etsNdA7fi
	S1hqW59D4C6HvYRyNRW1ela4ooDOdlFsIahgelCAyG+60pIaN8VodUutTR/YiU8HHno460XThuj
	scXDiFE+mI71oo6XHGCW26mDEu9PIF9TPlQraqOA==
X-Google-Smtp-Source: AGHT+IEEDueBTR/qjkseHCu/6hHmmY6d8gCCfHNJAKAWerhJ6BCGW/4G5xYr8+OUgNTAl9wCy3v958LMiQIhsbPcBw4=
X-Received: by 2002:a05:6602:3a0a:b0:85d:b14a:bb56 with SMTP id
 ca18e2360f4ac-85dc4761730mr159183339f.2.1741940868086; Fri, 14 Mar 2025
 01:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-1-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-1-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:27:37 +0800
X-Gm-Features: AQ5f1Jr6EIItMT0M4w7j1TkQMGeFFM7Vn70Ljf5lKdhIMO0pijsGnR7Gg0wOpRc
Message-ID: <CANXhq0rtY_zDcLn4_TH0F083e4K58L-V2ingTwPgyoPBXEnY=g@mail.gmail.com>
Subject: Re: [PATCH v11 01/27] mm: VM_SHADOW_STACK definition for riscv
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
X-CRM114-CacheID: sfid-20250314_012748_903964_B95A6D51 
X-CRM114-Status: GOOD (  16.61  )
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
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBWTV9ISUdIX0FSQ0hfNSBpcyB1c2VkIGZvciByaXNjdgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0t
Cj4gIGluY2x1ZGUvbGludXgvbW0uaCB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVk
ZS9saW51eC9tbS5oCj4gaW5kZXggN2IxMDY4ZGRjYmI3Li4xZWYyMzFjYmM4ZmUgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gQEAg
LTM3OCw2ICszNzgsMTMgQEAgZXh0ZXJuIHVuc2lnbmVkIGludCBrb2Jqc2l6ZShjb25zdCB2b2lk
ICpvYmpwKTsKPiAgIyBkZWZpbmUgVk1fU0hBRE9XX1NUQUNLICAgICAgIFZNX0hJR0hfQVJDSF82
Cj4gICNlbmRpZgo+Cj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9VU0VSX0NGSSkKPiArLyoK
PiArICogRm9sbG93aW5nIHg4NiBhbmQgcGlja2luZyB1cCB0aGUgc2FtZSBiaXRwb3MuCj4gKyAq
Lwo+ICsjIGRlZmluZSBWTV9TSEFET1dfU1RBQ0sgICAgICAgVk1fSElHSF9BUkNIXzUKPiArI2Vu
ZGlmCj4gKwo+ICAjaWZuZGVmIFZNX1NIQURPV19TVEFDSwo+ICAjIGRlZmluZSBWTV9TSEFET1df
U1RBQ0sgICAgICAgVk1fTk9ORQo+ICAjZW5kaWYKPgoKTEdUTS4KClJldmlld2VkLWJ5OiBab25n
IExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
