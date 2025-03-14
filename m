Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD78AC35FF8
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQlLIdofshQ+++xhssDkUtFRKFLDbOwje9rRvjl1d5I=; b=LNBRoZyHqorCLX
	7RhPVGbSc4Tik9CH+vyZ0zva6Af7tOAiQ/+GG/0Pc6p6hPrE+emvmLRkulqEMGteuFiYgc/qTeYDo
	mMPI49wSwFN2bj/j47VnNeSyYtgcRzsNo7vVph7uVf8oZsYwG5WgTm+YBk9RDNSikZYtaMwQwaWd8
	ZNe6p8v6/TGY118iyo8E1pm7baa3NGxPEoxekDW7Ej7ZxKKqpvyVeN3X7vA7nwtqOhRNIm9k3Zlyw
	qu69NHOgv/f0mNlL1ztzCtEFOzo5HHkH9JqkP1YMsp0qIPRZArh7S49wYyN2KUUrKBGZDw7RCD+IU
	7PC7+V6amrC64PgATfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lG-0000000DXID-47S2;
	Fri, 14 Mar 2025 08:51:22 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Qn-0000000DTa5-3XGr
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:30:15 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85dac9728cdso52914939f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941013; x=1742545813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHQAFT19Zq6akViEkHfz6Mh4tV3mef9iqXwpMSCN/RQ=;
        b=YBuKmgvv/DkigJMXW9l/pv+T4Mkp7pDy1Pwlr01V8q1QcjiUf16ijmX4vI//IEzWEZ
         o6EbMXzzNaMQqyAOV+l4aHvUk4RhdqM4csK0xrMmQsc1doFhdk7Z14oqX1QNfmso34NO
         xgOcNWI9V1oJc4AC1q9qBHiWexbhluQKgLv/oPoPb55lN7Sj1ZupG3SYGE2Yz4GJYEhv
         VE/z03v9Y4UrK3L6dZenQ7eBy0PLLNTbiNGr5i2rKxqZRVMBIyYHH6icWOArXRuqflxB
         fbsuf7JgOLAL2C9RpsJ371LVz4W/ytNZagT3Nc7K1/vk8+8RzwYLdd51B0fDWgK77fTK
         i6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941013; x=1742545813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHQAFT19Zq6akViEkHfz6Mh4tV3mef9iqXwpMSCN/RQ=;
        b=TBnlXmpSAA50oHgWeYz1oI7l4gehCuh7e3+AMXUjRuqBit26DQGZhRejTeGFTlps0v
         qB965B6FwVEvYcDBV7VYvkVW1WbWp+owr52fjwYc3P0sB9oLQgGs9Z5Zd6IvoYzZfSzd
         aVIzFNsOeK7IOAYpZgTXB62lUZ8uCqxLbWOP1DLRwTlxkudMKLM8AQn2O9MiAQZLWl5l
         nVfqyp/2TE1N5fbasBjoAhczTYwIY5k9XxqoiH4mG8sP2NuZdR14Ot+DCmXe7YoMkJeG
         Z+xos/FsdK1jbHPesr86TJFRVnSF4mzK9AzIro6FwnLXR+dOuZV34rvoDN+cXG2dv6B8
         N2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW7dIIB60D4duevGVDhzQz7KD6kryOKb/6ti7LGZPv6vjQcpQIgJrzpSeX8QS4uHfZeT+bNOKgTxJ6EZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGHoE/bddiQ7tQ0UEHVaf49LnzgF5FN5HSS6vrQFwqz2q44nlh
	xvGbVr+FLxNyNXAZ6n/ANgb4LSrHKVk+W/PDJ6MPveavSiOwKvNAEryxVKYKiJZ28pyYqPdyK7E
	91yy+YbKxAnjCbeeKq0cQUWK1x5TcZUI7xftPSw==
X-Gm-Gg: ASbGncumNY2zw74z0RG9ruF9+C257XRFVyfN+KMo7Yz3cepGmsKZR2Sj9JecfQH67jI
	U+rxj0gvcSfpANUgrgzSniYtogd6DiCw9a7erAyqWQHCr65q86QvA+9JYgmCAx7+xBm49KKfc6J
	1U6cI6FlWXovMRBi5zOAsOpffUIHacz0QJW4pjlA==
X-Google-Smtp-Source: AGHT+IEQZBAAWQBzkkxA4UVWoIwfMxv3lOX1yAW82xZYAmzoSJt5ME/GJlXO4+fh8gCNW8gq2XMNfQJFOUPdwSXIT8w=
X-Received: by 2002:a05:6602:4a03:b0:85b:4484:182c with SMTP id
 ca18e2360f4ac-85dc4885acbmr152534039f.11.1741941013056; Fri, 14 Mar 2025
 01:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-10-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-10-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:30:02 +0800
X-Gm-Features: AQ5f1JoD01TEQdI5WTe4PSnTnl_zETty75cDetOqvifwsUixI3qGOMOegGkUt3E
Message-ID: <CANXhq0pqoCZXhjMx7DwO6Yc8TMEbG1XE2PUEeF_pOsj8yxLdMQ@mail.gmail.com>
Subject: Re: [PATCH v11 10/27] riscv/mm: Implement map_shadow_stack() syscall
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
X-CRM114-CacheID: sfid-20250314_013013_896138_5660EFFA 
X-CRM114-Status: GOOD (  34.24  )
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
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBcyBkaXNjdXNzZWQgZXh0ZW5zaXZlbHkgaW4gdGhlIGNo
YW5nZWxvZyBmb3IgdGhlIGFkZGl0aW9uIG9mIHRoaXMKPiBzeXNjYWxsIG9uIHg4NiAoIng4Ni9z
aHN0azogSW50cm9kdWNlIG1hcF9zaGFkb3dfc3RhY2sgc3lzY2FsbCIpIHRoZQo+IGV4aXN0aW5n
IG1tYXAoKSBhbmQgbWFkdmlzZSgpIHN5c2NhbGxzIGRvIG5vdCBtYXAgZW50aXJlbHkgd2VsbCBv
bnRvIHRoZQo+IHNlY3VyaXR5IHJlcXVpcmVtZW50cyBmb3Igc2hhZG93IHN0YWNrIG1lbW9yeSBz
aW5jZSB0aGV5IGxlYWQgdG8gd2luZG93cwo+IHdoZXJlIG1lbW9yeSBpcyBhbGxvY2F0ZWQgYnV0
IG5vdCB5ZXQgcHJvdGVjdGVkIG9yIHN0YWNrcyB3aGljaCBhcmUgbm90Cj4gcHJvcGVybHkgYW5k
IHNhZmVseSBpbml0aWFsaXNlZC4gSW5zdGVhZCBhIG5ldyBzeXNjYWxsIG1hcF9zaGFkb3dfc3Rh
Y2soKQo+IGhhcyBiZWVuIGRlZmluZWQgd2hpY2ggYWxsb2NhdGVzIGFuZCBpbml0aWFsaXNlcyBh
IHNoYWRvdyBzdGFjayBwYWdlLgo+Cj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHRoaXMgc3lzY2Fs
bCBmb3IgcmlzY3YuIHJpc2N2IGRvZXNuJ3QgcmVxdWlyZSB0b2tlbgo+IHRvIGJlIHNldHVwIGJ5
IGtlcm5lbCBiZWNhdXNlIHVzZXIgbW9kZSBjYW4gZG8gdGhhdCBieSBpdHNlbGYuIEhvd2V2ZXIg
dG8KPiBwcm92aWRlIGNvbXBhdGliaWxpdHkgYW5kIHBvcnRhYmlsaXR5IHdpdGggb3RoZXIgYXJj
aGl0ZWN0dWVzLCB1c2VyIG1vZGUKPiBjYW4gc3BlY2lmeSB0b2tlbiBzZXQgZmxhZy4KPgo+IFNp
Z25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC91
c2VyY2ZpLmMgfCAxNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUK
PiBpbmRleCA4ZDE4NmJmY2VkNDUuLjNhODYxZDMyMDY1NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4g
QEAgLTEyNSwzICsxMjUsNCBAQCBvYmotJChDT05GSUdfQUNQSSkgICAgICAgICAgKz0gYWNwaS5v
Cj4gIG9iai0kKENPTkZJR19BQ1BJX05VTUEpICAgICAgICArPSBhY3BpX251bWEubwo+Cj4gIG9i
ai0kKENPTkZJR19HRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVMpICs9IGJ1Z3Mubwo+ICtvYmot
JChDT05GSUdfUklTQ1ZfVVNFUl9DRkkpICs9IHVzZXJjZmkubwo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjQwMjI4MDlhN2I1Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+IEBAIC0w
LDAgKzEsMTQ0IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8q
Cj4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBSaXZvcywgSW5jLgo+ICsgKiBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tbWFuLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgo+
ICsjaW5jbHVkZSA8bGludXgvdXNlci5oPgo+ICsjaW5jbHVkZSA8bGludXgvc3lzY2FsbHMuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+Cj4gKyNpbmNsdWRlIDxhc20vY3NyLmg+Cj4gKyNp
bmNsdWRlIDxhc20vdXNlcmNmaS5oPgo+ICsKPiArI2RlZmluZSBTSFNUS19FTlRSWV9TSVpFIHNp
emVvZih2b2lkICopCj4gKwo+ICsvKgo+ICsgKiBXcml0ZXMgb24gc2hhZG93IHN0YWNrIGNhbiBl
aXRoZXIgYmUgYHNzcHVzaGAgb3IgYHNzYW1vc3dhcGAuIGBzc3B1c2hgIGNhbiBoYXBwZW4KPiAr
ICogaW1wbGljaXRseSBvbiBjdXJyZW50IHNoYWRvdyBzdGFjayBwb2ludGVkIHRvIGJ5IENTUl9T
U1AuIGBzc2Ftb3N3YXBgIHRha2VzIHBvaW50ZXIgdG8KPiArICogc2hhZG93IHN0YWNrLiBUbyBr
ZWVwIGl0IHNpbXBsZSwgd2UgcGxhbiB0byB1c2UgYHNzYW1vc3dhcGAgdG8gcGVyZm9ybSB3cml0
ZXMgb24gc2hhZG93Cj4gKyAqIHN0YWNrLgo+ICsgKi8KPiArc3RhdGljIG5vaW5saW5lIHVuc2ln
bmVkIGxvbmcgYW1vX3VzZXJfc2hzdGsodW5zaWduZWQgbG9uZyAqYWRkciwgdW5zaWduZWQgbG9u
ZyB2YWwpCj4gK3sKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBOZXZlciBleHBlY3QgLTEgb24g
c2hhZG93IHN0YWNrLiBFeHBlY3QgcmV0dXJuIGFkZHJlc3NlcyBhbmQgemVybwo+ICsgICAgICAg
ICovCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHN3YXAgPSAtMTsKPiArCj4gKyAgICAgICBfX2Vu
YWJsZV91c2VyX2FjY2VzcygpOwo+ICsgICAgICAgYXNtIGdvdG8oCj4gKyAgICAgICAgICAgICAg
ICIub3B0aW9uIHB1c2hcbiIKPiArICAgICAgICAgICAgICAgIi5vcHRpb24gYXJjaCwgK3ppY2Zp
c3NcbiIKPiArICAgICAgICAgICAgICAgIjE6IHNzYW1vc3dhcC5kICVbc3dhcF0sICVbdmFsXSwg
JVthZGRyXVxuIgo+ICsgICAgICAgICAgICAgICBfQVNNX0VYVEFCTEUoMWIsICVsW2ZhdWx0XSkK
PiArICAgICAgICAgICAgICAgUklTQ1ZfQUNRVUlSRV9CQVJSSUVSCj4gKyAgICAgICAgICAgICAg
ICIub3B0aW9uIHBvcFxuIgo+ICsgICAgICAgICAgICAgICA6IFtzd2FwXSAiPXIiIChzd2FwKSwg
W2FkZHJdICIrQSIgKCphZGRyKQo+ICsgICAgICAgICAgICAgICA6IFt2YWxdICJyIiAodmFsKQo+
ICsgICAgICAgICAgICAgICA6ICJtZW1vcnkiCj4gKyAgICAgICAgICAgICAgIDogZmF1bHQKPiAr
ICAgICAgICAgICAgICAgKTsKPiArICAgICAgIF9fZGlzYWJsZV91c2VyX2FjY2VzcygpOwo+ICsg
ICAgICAgcmV0dXJuIHN3YXA7Cj4gK2ZhdWx0Ogo+ICsgICAgICAgX19kaXNhYmxlX3VzZXJfYWNj
ZXNzKCk7Cj4gKyAgICAgICByZXR1cm4gLTE7Cj4gK30KPiArCj4gKy8qCj4gKyAqIENyZWF0ZSBh
IHJlc3RvcmUgdG9rZW4gb24gdGhlIHNoYWRvdyBzdGFjay4gIEEgdG9rZW4gaXMgYWx3YXlzIFhM
RU4gd2lkZQo+ICsgKiBhbmQgYWxpZ25lZCB0byBYTEVOLgo+ICsgKi8KPiArc3RhdGljIGludCBj
cmVhdGVfcnN0b3JfdG9rZW4odW5zaWduZWQgbG9uZyBzc3AsIHVuc2lnbmVkIGxvbmcgKnRva2Vu
X2FkZHIpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcjsKPiArCj4gKyAgICAgICAv
KiBUb2tlbiBtdXN0IGJlIGFsaWduZWQgKi8KPiArICAgICAgIGlmICghSVNfQUxJR05FRChzc3As
IFNIU1RLX0VOVFJZX1NJWkUpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAr
Cj4gKyAgICAgICAvKiBPbiBSSVNDLVYgd2UncmUgY29uc3RydWN0aW5nIHRva2VuIHRvIGJlIGZ1
bmN0aW9uIG9mIGFkZHJlc3MgaXRzZWxmICovCj4gKyAgICAgICBhZGRyID0gc3NwIC0gU0hTVEtf
RU5UUllfU0laRTsKPiArCj4gKyAgICAgICBpZiAoYW1vX3VzZXJfc2hzdGsoKHVuc2lnbmVkIGxv
bmcgX191c2VyICopYWRkciwgKHVuc2lnbmVkIGxvbmcpc3NwKSA9PSAtMSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+ICsgICAgICAgaWYgKHRva2VuX2FkZHIpCj4gKyAg
ICAgICAgICAgICAgICp0b2tlbl9hZGRyID0gYWRkcjsKPiArCj4gKyAgICAgICByZXR1cm4gMDsK
PiArfQo+ICsKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgYWxsb2NhdGVfc2hhZG93X3N0YWNrKHVu
c2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHRva2VuX29mZnNldCwgYm9v
bCBzZXRfdG9rKQo+ICt7Cj4gKyAgICAgICBpbnQgZmxhZ3MgPSBNQVBfQU5PTllNT1VTIHwgTUFQ
X1BSSVZBVEU7Cj4gKyAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBwb3B1bGF0ZSwgdG9rX2xvYyA9IDA7Cj4gKwo+ICsgICAg
ICAgaWYgKGFkZHIpCj4gKyAgICAgICAgICAgICAgIGZsYWdzIHw9IE1BUF9GSVhFRF9OT1JFUExB
Q0U7Cj4gKwo+ICsgICAgICAgbW1hcF93cml0ZV9sb2NrKG1tKTsKPiArICAgICAgIGFkZHIgPSBk
b19tbWFwKE5VTEwsIGFkZHIsIHNpemUsIFBST1RfUkVBRCwgZmxhZ3MsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICBWTV9TSEFET1dfU1RBQ0sgfCBWTV9XUklURSwgMCwgJnBvcHVsYXRlLCBOVUxM
KTsKPiArICAgICAgIG1tYXBfd3JpdGVfdW5sb2NrKG1tKTsKPiArCj4gKyAgICAgICBpZiAoIXNl
dF90b2sgfHwgSVNfRVJSX1ZBTFVFKGFkZHIpKQo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsK
PiArCj4gKyAgICAgICBpZiAoY3JlYXRlX3JzdG9yX3Rva2VuKGFkZHIgKyB0b2tlbl9vZmZzZXQs
ICZ0b2tfbG9jKSkgewo+ICsgICAgICAgICAgICAgICB2bV9tdW5tYXAoYWRkciwgc2l6ZSk7Cj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAg
IGFkZHIgPSB0b2tfbG9jOwo+ICsKPiArb3V0Ogo+ICsgICAgICAgcmV0dXJuIGFkZHI7Cj4gK30K
PiArCj4gK1NZU0NBTExfREVGSU5FMyhtYXBfc2hhZG93X3N0YWNrLCB1bnNpZ25lZCBsb25nLCBh
ZGRyLCB1bnNpZ25lZCBsb25nLCBzaXplLCB1bnNpZ25lZCBpbnQsIGZsYWdzKQo+ICt7Cj4gKyAg
ICAgICBib29sIHNldF90b2sgPSBmbGFncyAmIFNIQURPV19TVEFDS19TRVRfVE9LRU47Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIGFsaWduZWRfc2l6ZSA9IDA7Cj4gKwo+ICsgICAgICAgaWYgKCFj
cHVfc3VwcG9ydHNfc2hhZG93X3N0YWNrKCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsKPiArCj4gKyAgICAgICAvKiBBbnl0aGluZyBvdGhlciB0aGFuIHNldCB0b2tlbiBz
aG91bGQgcmVzdWx0IGluIGludmFsaWQgcGFyYW0gKi8KPiArICAgICAgIGlmIChmbGFncyAmIH5T
SEFET1dfU1RBQ0tfU0VUX1RPS0VOKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogVW5saWtlIG90aGVyIGFyY2hpdGVjdHVyZXMs
IG9uIFJJU0MtViwgU1NQIHBvaW50ZXIgaXMgaGVsZCBpbiBDU1JfU1NQIGFuZCBpcyBhdmFpbGFi
bGUKPiArICAgICAgICAqIENTUiBpbiBhbGwgbW9kZXMuIENTUiBhY2Nlc3NlcyBhcmUgcGVyZm9y
bWVkIHVzaW5nIDEyYml0IGluZGV4IHByb2dyYW1tZWQgaW4gaW5zdHJ1Y3Rpb24KPiArICAgICAg
ICAqIGl0c2VsZi4gVGhpcyBwcm92aWRlcyBzdGF0aWMgcHJvcGVydHkgb24gcmVnaXN0ZXIgcHJv
Z3JhbW1pbmcgYW5kIHdyaXRlcyB0byBDU1IgY2FuJ3QKPiArICAgICAgICAqIGJlIHVuaW50ZW50
aW9uYWwgZnJvbSBwcm9ncmFtbWVyJ3MgcGVyc3BlY3RpdmUuIEFzIGxvbmcgYXMgcHJvZ3JhbW1l
ciBoYXMgZ3VhcmRlZCBhcmVhcwo+ICsgICAgICAgICogd2hpY2ggcGVyZm9ybSB3cml0ZXMgdG8g
Q1NSX1NTUCBwcm9wZXJseSwgc2hhZG93IHN0YWNrIHBpdm90aW5nIGlzIG5vdCBwb3NzaWJsZS4g
U2luY2UKPiArICAgICAgICAqIENTUl9TU1AgaXMgd3JpdGVhYmxlIGJ5IHVzZXIgbW9kZSwgaXQg
aXRzZWxmIGNhbiBzZXR1cCBhIHNoYWRvdyBzdGFjayB0b2tlbiBzdWJzZXF1ZW50Cj4gKyAgICAg
ICAgKiB0byBhbGxvY2F0aW9uLiBBbHRob3VnaCBpbiBvcmRlciB0byBwcm92aWRlIHBvcnRhYmxp
dHkgd2l0aCBvdGhlciBhcmNoaXRlY3R1cmUgKGJlY2F1c2UKPiArICAgICAgICAqIGBtYXBfc2hh
ZG93X3N0YWNrYCBpcyBhcmNoIGFnbm9zdGljIHN5c2NhbGwpLCBSSVNDLVYgd2lsbCBmb2xsb3cg
ZXhwZWN0YXRpb24gb2YgYSB0b2tlbgo+ICsgICAgICAgICogZmxhZyBpbiBmbGFncyBhbmQgaWYg
cHJvdmlkZWQgaW4gZmxhZ3MsIHNldHVwIGEgdG9rZW4gYXQgdGhlIGJhc2UuCj4gKyAgICAgICAg
Ki8KPiArCj4gKyAgICAgICAvKiBJZiB0aGVyZSBpc24ndCBzcGFjZSBmb3IgYSB0b2tlbiAqLwo+
ICsgICAgICAgaWYgKHNldF90b2sgJiYgc2l6ZSA8IFNIU1RLX0VOVFJZX1NJWkUpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PU1BDOwo+ICsKPiArICAgICAgIGlmIChhZGRyICYmIChhZGRy
ICYgKFBBR0VfU0laRSAtIDEpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
Kwo+ICsgICAgICAgYWxpZ25lZF9zaXplID0gUEFHRV9BTElHTihzaXplKTsKPiArICAgICAgIGlm
IChhbGlnbmVkX3NpemUgPCBzaXplKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVPVkVSRkxP
VzsKPiArCj4gKyAgICAgICByZXR1cm4gYWxsb2NhdGVfc2hhZG93X3N0YWNrKGFkZHIsIGFsaWdu
ZWRfc2l6ZSwgc2l6ZSwgc2V0X3Rvayk7Cj4gK30KPgpMR1RNLgoKUmV2aWV3ZWQtYnk6IFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiAtLQo+IDIuMzQuMQo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
