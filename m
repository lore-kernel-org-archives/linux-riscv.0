Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7929EC35FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxkTbQlUlzz5W2cGL1OAgNoHWdeIQMneMnGnyx1KJRE=; b=REq175q5kdEt4e
	l87Ji59EWESjIEnggYP2V6kK2NGMYN7ckE4JrOJK7wCQKZFhEaMDchZiBNBx4Dq/ZcZY8MqHBIUZZ
	2KCd4MUMDz6U0GqDL6/KPXPEJuMXrbfMUeBcc1lLQb37jxZeEZK387oTRX7ifAg4WLcHUM41UsvhA
	IALdqbwCoc9MlbQ6tEoULq0xMeb7zcv78DL8CT7pRHPPfD/+zpJrXx2qmdlQXjiXINsRj1aPY2TId
	XdF2v/sUpN2XH/UlIruUh3n7ro6h+lcOKeAAAj3URPOrEf0MdwX1ca7LK22TQim6ujoIDxfqteB7/
	k90faYlp6P3d3TA/yNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lJ-0000000DXKJ-0QCw;
	Fri, 14 Mar 2025 08:51:25 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0SQ-0000000DU69-0QGD
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:31:55 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso67158639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941113; x=1742545913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wumHTb0kka5JjaRZHTcNujfy6a7p/Uo/SNTAmw90Qd8=;
        b=nLbjzcOzCkQRzYtS/z4/sC2hrkR8+bUjFKZCY4DXRD54iVzWizCUNxFaslgtucTeH8
         605u+tNtZL9BI1l7mvyZ3FKTYud59Z4r+vK9ymfedpNvbAeRf7IRd0c1bP6S22B92nXA
         w2V4SFzK+raMOfNcP/d3PwPglbd8HeLUCmU8K6aVg9AQqp8cSgyYR4WsrIT0fI1wI0YG
         uL93AN+kU7dCoNaxfrxI03aGAvdYaWEUFpayXy4NxVdteYpl4Hn4EmSIwUDwRk8rlD+E
         OBgcV/+DJS3r4F/sROdcHEGtDAIcKLLrTpi9zhQq+CjjbplerFZr7nZ31GHvOZLjRaab
         39ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941113; x=1742545913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wumHTb0kka5JjaRZHTcNujfy6a7p/Uo/SNTAmw90Qd8=;
        b=DK6WBMQ0j5au63VdiVCgPdViZxuHcUdYykM53WV1s0viYXlmOgGdp7sb4fYNswN1e2
         DjREMOiMbVaC0o0p++pltfqWkWB0DxW8cvVBDPaxncQutetCwCTjg9ZmR+RRPHJUEXAp
         a6S/yMfUCrbNSUMeDZIsybkKC9uR14VXeQVsoCWv+5W/y9OnuURhOBFSnWDutm3Ev8xf
         NE8mcCJiBiFiV99+CJlq+nsQJdYArfhe6ulJL0b/zoKlaQWNXcLGtXtzBzs3ygJbO1SO
         vJEbEHCm07IXHGMSXixul/hSBIOFH/GGTqmxYhsV2D/0R/FAChiyBLg4lFSCOt++5F09
         n/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfh9Ru19/j6zd1tpdSttDUnNikmSN1w5gfUONNNeqQpG9pJA3RsFQRDsI6ZBTw1qSHlvKGLW9F3A7adA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Po8MXCLsEOPZ/3BSmpxJzW75QeQM0hgzkPghdHfg7hSzv+aO
	D4bZKGrHvjkhgcJ+1fP20bMUBSfWdVP7riERUo6f2SoWC3yhy6WZOK5blshJUp4/XyDa35G3jf5
	GK1y0rVajAvh+TWj2KI6LntbnNdO1sDYXx+7J/Q==
X-Gm-Gg: ASbGnctGB0e8GNDzRrfAo+VblerH6T5fP9jlfNb9Gf8wAG50NlW6NGzFu3mtaF4Wskw
	Fq5A9pO9QW655bdawV6YO3HZ16otdkEAfFqwNvYqNHYv9m43ScJN3dsYuro1GMXFMVPP3PT7gLk
	ixsagRjuO78uHE6F2OvHrVWHBuqVw=
X-Google-Smtp-Source: AGHT+IF3wiq44CuMfBnA+HLDTnOn67gvme9KT+6oA+bhbghqwQ9Ypxqh8gJUB2Og+bw/774omJHZRixeIKKImxlIRS8=
X-Received: by 2002:a05:6602:610c:b0:85b:4ad0:c8cd with SMTP id
 ca18e2360f4ac-85db81eb853mr553667539f.0.1741941113257; Fri, 14 Mar 2025
 01:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-14-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-14-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:31:42 +0800
X-Gm-Features: AQ5f1Jph57H6Q0PgCRIxwT8-PlynROINsKKGDQZtxTGL5mjRpR_T5UPaHa560LA
Message-ID: <CANXhq0r5bgO5CkwwRbN24x66juXGi=5PMi5XkZiv-0mQJRR_Hw@mail.gmail.com>
Subject: Re: [PATCH v11 14/27] riscv/traps: Introduce software check exception
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
X-CRM114-CacheID: sfid-20250314_013154_139706_3312EF6F 
X-CRM114-Status: GOOD (  27.48  )
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
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiB6aWNmaXNzIC8gemljZmlscCBpbnRyb2R1Y2VzIGEgbmV3
IGV4Y2VwdGlvbiB0byBwcml2IGlzYSBgc29mdHdhcmUgY2hlY2sKPiBleGNlcHRpb25gIHdpdGgg
Y2F1c2UgY29kZSA9IDE4LiBUaGlzIHBhdGNoIGltcGxlbWVudHMgc29mdHdhcmUgY2hlY2sKPiBl
eGNlcHRpb24uCj4KPiBBZGRpdGlvbmFsbHkgaXQgaW1wbGVtZW50cyBhIGNmaSB2aW9sYXRpb24g
aGFuZGxlciB3aGljaCBjaGVja3MgZm9yIGNvZGUKPiBpbiB4dHZhbC4gSWYgeHR2YWw9MiwgaXQg
bWVhbnMgdGhhdCBzdyBjaGVjayBleGNlcHRpb24gaGFwcGVuZWQgYmVjYXVzZSBvZgo+IGFuIGlu
ZGlyZWN0IGJyYW5jaCBub3QgbGFuZGluZyBvbiA0IGJ5dGUgYWxpZ25lZCBQQyBvciBub3QgbGFu
ZGluZyBvbgo+IGBscGFkYCBpbnN0cnVjdGlvbiBvciBsYWJlbCB2YWx1ZSBlbWJlZGRlZCBpbiBg
bHBhZGAgbm90IG1hdGNoaW5nIGxhYmVsCj4gdmFsdWUgc2V0dXAgaW4gYHg3YC4gSWYgeHR2YWw9
MywgaXQgbWVhbnMgdGhhdCBzdyBjaGVjayBleGNlcHRpb24gaGFwcGVuZWQKPiBiZWNhdXNlIG9m
IG1pc21hdGNoIGJldHdlZW4gbGluayByZWdpc3RlciAoeDEgb3IgeDUpIGFuZCB0b3Agb2Ygc2hh
ZG93Cj4gc3RhY2sgKG9uIGV4ZWN1dGlvbiBvZiBgc3Nwb3BjaGtgKS4KPgo+IEluIGNhc2Ugb2Yg
Y2ZpIHZpb2xhdGlvbiwgU0lHU0VHViBpcyByYWlzZWQgd2l0aCBjb2RlPVNFR1ZfQ1BFUlIuCj4g
U0VHVl9DUEVSUiB3YXMgaW50cm9kdWNlZCBieSB4ODYgc2hhZG93IHN0YWNrIHBhdGNoZXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIHwgIDEgKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgICAgfCAgMyArKysKPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYyAgICAgICAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+IGluZGV4IGNkNjI3ZWMyODlmMS4uNWEyN2Nl
ZmQ3ODA1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlw
ZXMuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+IEBA
IC01MSw2ICs1MSw3IEBAIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3UpOwo+
ICBERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9lY2FsbF9zKTsKPiAgREVDTEFSRV9ET19F
UlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfbSk7Cj4gIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190
cmFwX2JyZWFrKTsKPiArREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfc29mdHdhcmVfY2hl
Y2spOwo+Cj4gIGFzbWxpbmthZ2Ugdm9pZCBoYW5kbGVfYmFkX3N0YWNrKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKTsKPiAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1v
bi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+IGluZGV4IGIyOGNj
YzZjZGVlYS4uMzRlZDE0OWFmNWQxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZW50cnktY29tbW9uLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNv
bW1vbi5oCj4gQEAgLTQwLDQgKzQwLDYgQEAgc3RhdGljIGlubGluZSBpbnQgaGFuZGxlX21pc2Fs
aWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIH0KPiAgI2VuZGlmCj4KPiArYm9v
bCBoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiArCj4g
ICNlbmRpZiAvKiBfQVNNX1JJU0NWX0VOVFJZX0NPTU1PTl9IICovCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gaW5k
ZXggMDA0OTRiNTRmZjRhLi45YzAwY2FjM2Y2ZjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvZW50cnkuUwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiBAQCAtNDcy
LDYgKzQ3Miw5IEBAIFNZTV9EQVRBX1NUQVJUX0xPQ0FMKGV4Y3BfdmVjdF90YWJsZSkKPiAgICAg
ICAgIFJJU0NWX1BUUiBkb19wYWdlX2ZhdWx0ICAgLyogbG9hZCBwYWdlIGZhdWx0ICovCj4gICAg
ICAgICBSSVNDVl9QVFIgZG9fdHJhcF91bmtub3duCj4gICAgICAgICBSSVNDVl9QVFIgZG9fcGFn
ZV9mYXVsdCAgIC8qIHN0b3JlIHBhZ2UgZmF1bHQgKi8KPiArICAgICAgIFJJU0NWX1BUUiBkb190
cmFwX3Vua25vd24gLyogY2F1c2U9MTYgKi8KPiArICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3Vu
a25vd24gLyogY2F1c2U9MTcgKi8KPiArICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3NvZnR3YXJl
X2NoZWNrIC8qIGNhdXNlPTE4IGlzIHN3IGNoZWNrIGV4Y2VwdGlvbiAqLwo+ICBTWU1fREFUQV9F
TkRfTEFCRUwoZXhjcF92ZWN0X3RhYmxlLCBTWU1fTF9MT0NBTCwgZXhjcF92ZWN0X3RhYmxlX2Vu
ZCkKPgo+ICAjaWZuZGVmIENPTkZJR19NTVUKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCA4ZmY4ZThiMzY1
MjQuLjNmNzcwOWY0NTk1YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC0zNTQsNiArMzU0LDQ5IEBA
IHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Cj4gIH0KPgo+ICsj
ZGVmaW5lIENGSV9UVkFMX0ZDRklfQ09ERSAgICAgMgo+ICsjZGVmaW5lIENGSV9UVkFMX0JDRklf
Q09ERSAgICAgMwo+ICsvKiBoYW5kbGUgY2ZpIHZpb2xhdGlvbnMgKi8KPiArYm9vbCBoYW5kbGVf
dXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICt7Cj4gKyAgICAgICBi
b29sIHJldCA9IGZhbHNlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB0dmFsID0gY3NyX3JlYWQo
Q1NSX1RWQUwpOwo+ICsKPiArICAgICAgIGlmICgodHZhbCA9PSBDRklfVFZBTF9GQ0ZJX0NPREUg
JiYgY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3RyKCkpIHx8Cj4gKyAgICAgICAgICAg
KHR2YWwgPT0gQ0ZJX1RWQUxfQkNGSV9DT0RFICYmIGNwdV9zdXBwb3J0c19zaGFkb3dfc3RhY2so
KSkpIHsKPiArICAgICAgICAgICAgICAgZG9fdHJhcF9lcnJvcihyZWdzLCBTSUdTRUdWLCBTRUdW
X0NQRVJSLCByZWdzLT5lcGMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIk9vcHMg
LSBjb250cm9sIGZsb3cgdmlvbGF0aW9uIik7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IHRydWU7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJldDsKPiArfQo+ICsKPiArLyoKPiAr
ICogc29mdHdhcmUgY2hlY2sgZXhjZXB0aW9uIGlzIGRlZmluZWQgd2l0aCByaXNjLXYgY2ZpIHNw
ZWMuIFNvZnR3YXJlIGNoZWNrCj4gKyAqIGV4Y2VwdGlvbiBpcyByYWlzZWQgd2hlbjotCj4gKyAq
IGEpIEFuIGluZGlyZWN0IGJyYW5jaCBkb2Vzbid0IGxhbmQgb24gNCBieXRlIGFsaWduZWQgUEMg
b3IgYGxwYWRgCj4gKyAqICAgIGluc3RydWN0aW9uIG9yIGBsYWJlbGAgdmFsdWUgcHJvZ3JhbW1l
ZCBpbiBgbHBhZGAgaW5zdHIgZG9lc24ndAo+ICsgKiAgICBtYXRjaCB3aXRoIHZhbHVlIHNldHVw
IGluIGB4N2AuIHJlcG9ydGVkIGNvZGUgaW4gYHh0dmFsYCBpcyAyLgo+ICsgKiBiKSBgc3Nwb3Bj
aGtgIGluc3RydWN0aW9uIGZpbmRzIGEgbWlzbWF0Y2ggYmV0d2VlbiB0b3Agb2Ygc2hhZG93IHN0
YWNrIChzc3ApCj4gKyAqICAgIGFuZCB4MS94NS4gcmVwb3J0ZWQgY29kZSBpbiBgeHR2YWxgIGlz
IDMuCj4gKyAqLwo+ICthc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRv
X3RyYXBfc29mdHdhcmVfY2hlY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gK3sKPiArICAgICAg
IGlmICh1c2VyX21vZGUocmVncykpIHsKPiArICAgICAgICAgICAgICAgaXJxZW50cnlfZW50ZXJf
ZnJvbV91c2VyX21vZGUocmVncyk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBub3QgYSBjZmkg
dmlvbGF0aW9uLCB0aGVuIG1lcmdlIGludG8gZmxvdyBvZiB1bmtub3duIHRyYXAgaGFuZGxlciAq
Lwo+ICsgICAgICAgICAgICAgICBpZiAoIWhhbmRsZV91c2VyX2NmaV92aW9sYXRpb24ocmVncykp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG9fdHJhcF91bmtub3duKHJlZ3MpOwo+ICsKPiAr
ICAgICAgICAgICAgICAgaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4gKyAgICAg
ICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAvKiBzdyBjaGVjayBleGNlcHRpb24gY29taW5n
IGZyb20ga2VybmVsIGlzIGEgYnVnIGluIGtlcm5lbCAqLwo+ICsgICAgICAgICAgICAgICBkaWUo
cmVncywgIktlcm5lbCBCVUciKTsKPiArICAgICAgIH0KPiArfQo+ICsKPiAgI2lmZGVmIENPTkZJ
R19NTVUKPiAgYXNtbGlua2FnZSBfX3Zpc2libGUgbm9pbnN0ciB2b2lkIGRvX3BhZ2VfZmF1bHQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPgoKTEdUTS4KClJldmlld2VkLWJ5OiBab25nIExp
IDx6b25nLmxpQHNpZml2ZS5jb20+Cgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
