Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA5D7494D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+WX8IZQuQx1N1Px69HXH8wrWrm7upwgCyu7sjNE1xk=; b=y25VdvNsDgZg4h
	cZICnw7R68HvFnUeNn8NUQkqtYUI2COLBoEvh+B6PtZpNzfNlUcj1jSXC/cqqSe6stkX2jiDQ5p3j
	/dvMDkNlzKDbLl5pD1EYFhMY+/g63QbmWwSnh4X5g6mYtoy/MPsePWapCXSY6613f5W8WKGUTzsH3
	ceNvPt6MfunUucGTGb3EM+dk1GxxH7LQBbWBEo3n/rnNPjQqd9KEdG4141LU7wq/V8QSKP/++FwDM
	GBvuDlnV2aFx4vavmg2qYkCWiCgoSbAVgCAKkOiiTo9H1Hg+FlzPIWgY4ajG3VivNU4L5rJiv90vn
	qY5bOIzaRmBe+BUdOC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vun-0000000GEvn-3OdK;
	Tue, 29 Oct 2024 23:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vu6-0000000GEKJ-13UG
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7vRNSIBiNXIf2UJE+KhXd4ECbBBsrxcPJxpg99mApzo=; b=cd4WOkYwBRnTjjb7gxGPmZZhwI
	O6REJxvX+wOli4spdKj8gz9tgTbcnlpNlo4Gzk2yAnC64BnCptEqZMkdYYjBCVmYmIxdGGpl9x8CD
	jCWmTDw6qeWBz+A+d3bQyAhWfffslljBHm8M1Bkq/umz3rYrA1cnNKMk6+ofqnCeld+AhVX5tc7tb
	a6rsNzdXqUpKaOIKVWeABfP/csh+MwgcTqeTfLi9RmammM0kUwhYaU09Z0lm8SqmBQN3K6TvVjJka
	sBUfwRt/4mSaprFbSNBHaAEaG7sdF3ro7L1uwsUBEO5znuT5m6CkBkRVGOTEDN9Czg+tLGXflfR+R
	8g8s0tZw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtu-0000000A1O0-2lpO
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e74900866so4572177b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245524; x=1730850324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vRNSIBiNXIf2UJE+KhXd4ECbBBsrxcPJxpg99mApzo=;
        b=KqxRQ7P7EXkn53JCD8YFGpSFkkKoA2RKxJ6OuYo/OHN9d+LTLtgsoTZrxH+YxhoiLC
         OBvtc6WXA5xMXlrZG2fOqUJhcBTZ/g7CqAgJpO1ziHlU+KWSCk8eypSqhnvNMbcFycC6
         VCXW/PiCCK7nvtgMM6vcrwhYx/7jJ4P4vJo6k48+XGbFhkeA8noweIZJBfIjdioPFp29
         RHzsmQ1ljc1/nA6K3FaWiqpRuO2mU4q4gBQXX4xVNPJ3RqASloawjFKQiD0LNPnMdBpQ
         pLZmkoKnC/gkQDwQ0mBVb3uXDz5Q6GbsA5F+QrxC3WicjOurd6iEy4fmtORuB50y84zs
         hoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245524; x=1730850324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vRNSIBiNXIf2UJE+KhXd4ECbBBsrxcPJxpg99mApzo=;
        b=FmPGlHY3zwRycW1f0gie9gczxyXPXPwEufgzAN7uFPVWw/68XtPxXDg6ePpXa1rWUq
         jnaCSegWwBYFCC3NhA75yYWA8pPKeGLMxhtI+kpwbMLOdy5jMfEKK2DvyITqWdK/x1uR
         cXROOrESZa+/4hYhKUxMcgJaj1/ip3H6kc4Ru6WF+WiO7qZxFrJw9jMG/SOal2FKJuGN
         JnM02LozY60MuvPPrjzKAYMdsyITqsPJQSH8o0Ky3r7bG3F6mVwZQBSm9sIuwZP5Ndpi
         oHqxczvuE3FGaKdU58D0Bs1GSpy1gxTRdMwD3fg6ZNpbNs09ZdzmOpXZLTxpgVAsfNIP
         GV5A==
X-Forwarded-Encrypted: i=1; AJvYcCW850kc5uOIsl6Jj5iafN5dFVvcFpZEvInajbihiKIdQHOtSbVgJim0zTOE0mhJ3nzz6l+38V1lraGAiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRRFKv24F9Ui2MzGTx3M/Heb2M0st7WH3NPiI7VFOamJtMVpq
	fpDPXotv4bzc6iL3pfyX6jYkFWpO68/mrLOTWAJm10FqrIgfuUdHb64N7q+V2Fs=
X-Google-Smtp-Source: AGHT+IEYWYuZ3O/cciBKJ5slqaSkPGyDa205Q6lm+0Ith+W/z7NIQt+rMOIaCZW78WCxle4V1PPCdg==
X-Received: by 2002:a05:6a21:3998:b0:1d9:ab7:a835 with SMTP id adf61e73a8af0-1d9a84d990cmr18634439637.33.1730245523952;
        Tue, 29 Oct 2024 16:45:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:23 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:26 -0700
Subject: [PATCH v7 26/32] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-26-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234530_190739_4D360550 
X-CRM114-Status: GOOD (  11.18  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIG5lY2Vzc2Fy
eSBTQkkgZGVmaW5pdGlvbnMgdG8gdXNlIHRoZSBGV0ZUIGV4dGVuc2lvbi4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDk4ZjYz
MWIwNTFkYi4uNzU0ZTVjZGFiZjQ2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTM0LDYgKzM0LDcg
QEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX1BNVSA9IDB4NTA0RDU1LAogCVNCSV9FWFRf
REJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKKwlTQklfRVhUX0ZX
RlQgPSAweDQ2NTc0NjU0LAogCiAJLyogRXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGll
IHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4
MDAwMDAwLApAQCAtMjgxLDYgKzI4MiwzMiBAQCBzdHJ1Y3Qgc2JpX3N0YV9zdHJ1Y3QgewogCiAj
ZGVmaW5lIFNCSV9TSE1FTV9ESVNBQkxFCQktMQogCisvKiBTQkkgZnVuY3Rpb24gSURzIGZvciBG
VyBmZWF0dXJlIGV4dGVuc2lvbiAqLworI2RlZmluZSBTQklfRVhUX0ZXRlRfU0VUCQkweDAKKyNk
ZWZpbmUgU0JJX0VYVF9GV0ZUX0dFVAkJMHgxCisKK2VudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IHsK
KwlTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRwkJPSAweDAsCisJU0JJX0ZXRlRfTEFORElO
R19QQUQJCQk9IDB4MSwKKwlTQklfRldGVF9TSEFET1dfU1RBQ0sJCQk9IDB4MiwKKwlTQklfRldG
VF9ET1VCTEVfVFJBUAkJCT0gMHgzLAorCVNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORwkJPSAw
eDQsCisJU0JJX0ZXRlRfTE9DQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg1LAorCVNCSV9GV0ZUX0xP
Q0FMX1JFU0VSVkVEX0VORAkJPSAweDNmZmZmZmZmLAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JN
X1NUQVJUCQk9IDB4NDAwMDAwMDAsCisJU0JJX0ZXRlRfTE9DQUxfUExBVEZPUk1fRU5ECQk9IDB4
N2ZmZmZmZmYsCisKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAw
MCwKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfRU5ECQk9IDB4YmZmZmZmZmYsCisJU0JJX0ZX
RlRfR0xPQkFMX1BMQVRGT1JNX1NUQVJUCQk9IDB4YzAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFM
X1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAorfTsKKworI2RlZmluZSBTQklfRldGVF9HTE9C
QUxfRkVBVFVSRV9CSVQJCSgxIDw8IDMxKQorI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFU
VVJFX0JJVAkJKDEgPDwgMzApCisKKyNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwkJCSgx
IDw8IDApCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNCSV9TUEVD
X1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElG
VAkyNAoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
