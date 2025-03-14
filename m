Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D00C35FF7
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rt0omUZ3svyzRK6EV5D2oVwe2q4E9SQgebYRw77znWg=; b=3PS2Mfxat0IR7V
	OMco5SesEfIuIrw7mjgNjbpwwIHr4fMxkadWcWAh3F6PwCF8SfOq6yub+BtLsspt/yfzIqZ9VOH+j
	MgKl33MjS/hO0PVYee3KYpucicZPD9ukjR0dN4d8hPsPQYILYxafcxta9bOkFi3f1/rtv+smLDdyX
	FG48a9TfSxhQAPXk8agTKSjZKwu5x4QzMDyDYLzNONuBeSoUlpCYApOeRudvMom0vx1fop5wgurhm
	Kx3bzzYY2YkwZ0oq5rWepdq3cNlL1kgd12QUCudz62AWb/nVSlxOMEFILJKRR6Y3W02GjfQC/mEYz
	dnI2aWA5FsTpHHON/9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lE-0000000DXFc-1Qtm;
	Fri, 14 Mar 2025 08:51:20 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0PT-0000000DT39-2Ty0
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:28:52 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d4469b35e4so13733545ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940930; x=1742545730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYQ8WklltJ5CnB1F6nWEydwmD/n5vdx4jj1xbKUOGOw=;
        b=hewgc7+C9m7q5DOhBOv5mad4xIO7sm+vssylt95tpsy5Fb1Zikg7ms9/XfOWNe5/Yu
         x+g5blt1QuNgA0c/ykroNXq78W2SE9+q/yiz7s192rvhUYdFoaLnfEkQ5j7vJ7DDzvr2
         9cY+s+xHC1mPMeu2ENabNfyYsdzHgEsk89m4PkDsp5FYfalt9snUOmN6iYwtHRkR5Boo
         BLyVPfvhRLfPGlSsG4bhdiIwThcqapYqclHdra6HDKIZ+miDuzff8gTSCEWoF6lwSqS8
         HjHTnKnK+oAvUuqBuujOuQUilKrCkZBDJ80COv7z03MJXhsr+HNAzx/GSow7bEVvW0PG
         YDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940930; x=1742545730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYQ8WklltJ5CnB1F6nWEydwmD/n5vdx4jj1xbKUOGOw=;
        b=baQmFp2xvjczX/gK+tccAMc9k4h0mGA3ZmbYZErgRE6s673rPolDKnTjwXcDYYeuV5
         z2UbiFDXp3uBgtjUISGCcf6bKjYmktybz8zdFBYL7Z+XhBgB0qd1O2j14MfGWkvjmfWC
         q/1SN45lWdA3KMAbV5E7Bb/LXqNmZEO8Wa1k11a9znlrZWxwhM2KexBEyQc31Vty8TpE
         Jombst92ClVoe8Y3BDhB548zJEKIxBjj3cvSGYs4k6kO17LOvmbbwJZv51imVquqtV92
         bQUUADfMnOH/414qLwKsWCVnQ0F5lQMDDQ5J0JP/QjdHsFBln8wZQiPtpfGu8uDkKwU8
         lR3A==
X-Forwarded-Encrypted: i=1; AJvYcCVvH2G1VWlNZMV02IIqVNORCBrCkRa+n5oKjL8zTlPrkAf/kS9b8gMxMP1FKBvMUBCA8ifuega7nC6FOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhHBiZ3/S1e90qN6TJOLy/ITJHr5X28Pe710LsfbSMkYRMosQa
	Laj7+R0lagNGySEMKVmzI7hLYnyAzWyNLNps8UEfS+aELmidsTAzpM9A3mNyAARor0GtMYHoeA5
	k3mn92EyYIE7a+0HNkdWLSqxjY48TU2zAAn73DA==
X-Gm-Gg: ASbGncvZPB+xJttrzIDl/neqSo5XXDggzcuOvJu5ThYS2zvh1mT1B3USA3tgIZgREq6
	R2rLDND58HrZo3HglPQ1/qenGGa7Dfoo13elCia/ZlKXZ+BDfWtlDU3tHD2tXwv+rKm9OikLkiG
	k1jF9SAzv2jnyv5gk1f4+sC+4qd1ogJpIX9kqYlA==
X-Google-Smtp-Source: AGHT+IG+6oGPXZWI7buI+qLSPhZnhJwwr7Hbk+z7bXsShxCE3wUQfaPagpNJnFiXw0YRZXX1FtMy1so34umJojVa7Qo=
X-Received: by 2002:a05:6e02:370b:b0:3d3:fa8d:be6e with SMTP id
 e9e14a558f8ab-3d483a63d6amr12103875ab.14.1741940930607; Fri, 14 Mar 2025
 01:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-6-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-6-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:28:39 +0800
X-Gm-Features: AQ5f1Jo6BmeaPVN-BpPNuNRR3aEeI1qJOuvP_eZRv9-j2_Jz5UNXStZ6Qvn-cko
Message-ID: <CANXhq0pE+o4C_mn-Ofkf8uqEUJ+9SCpv5+z8zaSVQi0nW3558Q@mail.gmail.com>
Subject: Re: [PATCH v11 06/27] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
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
X-CRM114-CacheID: sfid-20250314_012851_624762_53DFDDA3 
X-CRM114-Status: GOOD (  27.96  )
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
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBgYXJjaF9jYWxjX3ZtX3Byb3RfYml0c2AgaXMgaW1wbGVt
ZW50ZWQgb24gcmlzYy12IHRvIHJldHVybiBWTV9SRUFEIHwKPiBWTV9XUklURSBpZiBQUk9UX1dS
SVRFIGlzIHNwZWNpZmllZC4gU2ltaWxhcmx5IGByaXNjdl9zeXNfbW1hcGAgaXMKPiB1cGRhdGVk
IHRvIGNvbnZlcnQgYWxsIGluY29taW5nIFBST1RfV1JJVEUgdG8gKFBST1RfV1JJVEUgfCBQUk9U
X1JFQUQpLgo+IFRoaXMgaXMgdG8gbWFrZSBzdXJlIHRoYXQgYW55IGV4aXN0aW5nIGFwcHMgdXNp
bmcgUFJPVF9XUklURSBzdGlsbCB3b3JrLgo+Cj4gRWFybGllciBgcHJvdGVjdGlvbl9tYXBbVk1f
V1JJVEVdYCB1c2VkIHRvIHBpY2sgcmVhZC13cml0ZSBQVEUgZW5jb2RpbmdzLgo+IE5vdyBgcHJv
dGVjdGlvbl9tYXBbVk1fV1JJVEVdYCB3aWxsIGFsd2F5cyBwaWNrIFBBR0VfU0hBRE9XU1RBQ0sg
UFRFCj4gZW5jb2RpbmdzIGZvciBzaGFkb3cgc3RhY2suIEFib3ZlIGNoYW5nZXMgZW5zdXJlIHRo
YXQgZXhpc3RpbmcgYXBwcwo+IGNvbnRpbnVlIHRvIHdvcmsgYmVjYXVzZSB1bmRlcm5lYXRoIGtl
cm5lbCB3aWxsIGJlIHBpY2tpbmcKPiBgcHJvdGVjdGlvbl9tYXBbVk1fV1JJVEV8Vk1fUkVBRF1g
IFBURSBlbmNvZGluZ3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbWFuLmggICAgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICB8IDEwICsr
KysrKysrKysKPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgfCAgMiArLQo+ICA0
IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tYW4uaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vbW1hbi5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjM5MmM5YzJkMmU3OAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL21tYW4uaAo+IEBAIC0wLDAgKzEsMjUgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi8KPiArI2lmbmRlZiBfX0FTTV9NTUFOX0hfXwo+ICsjZGVmaW5lIF9fQVNN
X01NQU5fSF9fCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDx1YXBpL2FzbS9tbWFuLmg+Cj4gKwo+ICtzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJjaF9jYWxjX3ZtX3Byb3RfYml0cyh1bnNpZ25lZCBs
b25nIHByb3QsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBwa2V5IF9fYWx3YXlzX3VudXNlZCkKPiArewo+ICsgICAgICAg
dW5zaWduZWQgbG9uZyByZXQgPSAwOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBJZiBQ
Uk9UX1dSSVRFIHdhcyBzcGVjaWZpZWQsIGZvcmNlIGl0IHRvIFZNX1JFQUQgfCBWTV9XUklURS4K
PiArICAgICAgICAqIE9ubHkgVk1fV1JJVEUgbWVhbnMgc2hhZG93IHN0YWNrLgo+ICsgICAgICAg
ICovCj4gKyAgICAgICBpZiAocHJvdCAmIFBST1RfV1JJVEUpCj4gKyAgICAgICAgICAgICAgIHJl
dCA9IChWTV9SRUFEIHwgVk1fV1JJVEUpOwo+ICsgICAgICAgcmV0dXJuIHJldDsKPiArfQo+ICsK
PiArI2RlZmluZSBhcmNoX2NhbGNfdm1fcHJvdF9iaXRzKHByb3QsIHBrZXkpIGFyY2hfY2FsY192
bV9wcm90X2JpdHMocHJvdCwgcGtleSkKPiArCj4gKyNlbmRpZiAvKiAhIF9fQVNNX01NQU5fSF9f
ICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBpbmRleCAwNTBmZGM0OWI1YWQuLjhjNTI4
Y2Q3MzQ3YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTE3OCw2ICsxNzgs
NyBAQCBleHRlcm4gc3RydWN0IHB0X2FsbG9jX29wcyBwdF9vcHMgX19tZW1pbml0ZGF0YTsKPiAg
I2RlZmluZSBQQUdFX1JFQURfRVhFQyAgICAgICAgIF9fcGdwcm90KF9QQUdFX0JBU0UgfCBfUEFH
RV9SRUFEIHwgX1BBR0VfRVhFQykKPiAgI2RlZmluZSBQQUdFX1dSSVRFX0VYRUMgICAgICAgICAg
ICAgICAgX19wZ3Byb3QoX1BBR0VfQkFTRSB8IF9QQUdFX1JFQUQgfCAgICAgIFwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9QQUdFX0VYRUMgfCBfUEFHRV9XUklU
RSkKPiArI2RlZmluZSBQQUdFX1NIQURPV1NUQUNLICAgICAgIF9fcGdwcm90KF9QQUdFX0JBU0Ug
fCBfUEFHRV9XUklURSkKPgo+ICAjZGVmaW5lIFBBR0VfQ09QWSAgICAgICAgICAgICAgUEFHRV9S
RUFECj4gICNkZWZpbmUgUEFHRV9DT1BZX0VYRUMgICAgICAgICBQQUdFX1JFQURfRVhFQwo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19yaXNjdi5jCj4gaW5kZXggZDc3YWZlMDU1NzhmLi40M2E0NDhiZjI1NGIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfcmlzY3YuYwo+IEBAIC03LDYgKzcsNyBAQAo+Cj4gICNpbmNsdWRlIDxsaW51
eC9zeXNjYWxscy5oPgo+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiArI2luY2x1ZGUg
PGFzbS1nZW5lcmljL21tYW4tY29tbW9uLmg+Cj4KPiAgc3RhdGljIGxvbmcgcmlzY3Zfc3lzX21t
YXAodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHByb3QsIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4g
QEAgLTE2LDYgKzE3LDE1IEBAIHN0YXRpYyBsb25nIHJpc2N2X3N5c19tbWFwKHVuc2lnbmVkIGxv
bmcgYWRkciwgdW5zaWduZWQgbG9uZyBsZW4sCj4gICAgICAgICBpZiAodW5saWtlbHkob2Zmc2V0
ICYgKH5QQUdFX01BU0sgPj4gcGFnZV9zaGlmdF9vZmZzZXQpKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBJZiBQUk9UX1dSSVRF
IGlzIHNwZWNpZmllZCB0aGVuIGV4dGVuZCB0aGF0IHRvIFBST1RfUkVBRAo+ICsgICAgICAgICog
cHJvdGVjdGlvbl9tYXBbVk1fV1JJVEVdIGlzIG5vdyBnb2luZyB0byBzZWxlY3Qgc2hhZG93IHN0
YWNrIGVuY29kaW5ncy4KPiArICAgICAgICAqIFNvIHNwZWNpZnlpbmcgUFJPVF9XUklURSBhY3R1
YWxseSBzaG91bGQgc2VsZWN0IHByb3RlY3Rpb25fbWFwIFtWTV9XUklURSB8IFZNX1JFQURdCj4g
KyAgICAgICAgKiBJZiB1c2VyIHdhbnRzIHRvIGNyZWF0ZSBzaGFkb3cgc3RhY2sgdGhlbiB0aGV5
IHNob3VsZCB1c2UgYG1hcF9zaGFkb3dfc3RhY2tgIHN5c2NhbGwuCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIGlmICh1bmxpa2VseSgocHJvdCAmIFBST1RfV1JJVEUpICYmICEocHJvdCAmIFBST1Rf
UkVBRCkpKQo+ICsgICAgICAgICAgICAgICBwcm90IHw9IFBST1RfUkVBRDsKPiArCj4gICAgICAg
ICByZXR1cm4ga3N5c19tbWFwX3Bnb2ZmKGFkZHIsIGxlbiwgcHJvdCwgZmxhZ3MsIGZkLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZmZzZXQgPj4gKFBBR0VfU0hJRlQgLSBwYWdl
X3NoaWZ0X29mZnNldCkpOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5j
IGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCAxNWIyZWRhNGMzNjQuLjlkNjY2MTYzOGQw
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCj4gQEAgLTM0Miw3ICszNDIsNyBAQCBwZ2RfdCBlYXJseV9wZ19kaXJbUFRSU19Q
RVJfUEdEXSBfX2luaXRkYXRhIF9fYWxpZ25lZChQQUdFX1NJWkUpOwo+ICBzdGF0aWMgY29uc3Qg
cGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdID0gewo+ICAgICAgICAgW1ZNX05PTkVdICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBQQUdFX05PTkUsCj4gICAgICAgICBb
Vk1fUkVBRF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IFBBR0VfUkVB
RCwKPiAtICAgICAgIFtWTV9XUklURV0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgID0gUEFHRV9DT1BZLAo+ICsgICAgICAgW1ZNX1dSSVRFXSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPSBQQUdFX1NIQURPV1NUQUNLLAo+ICAgICAgICAgW1ZNX1dSSVRF
IHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBQQUdFX0NPUFksCj4gICAg
ICAgICBbVk1fRVhFQ10gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IFBB
R0VfRVhFQywKPiAgICAgICAgIFtWTV9FWEVDIHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgID0gUEFHRV9SRUFEX0VYRUMsCj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPgoKPiAtLQo+IDIuMzQuMQo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
