Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56348C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fe9kMXoJIMcRMj+Qhk3KDVTiGo97/OTh26or5eTEfWA=; b=tnlM9iefztKKDF
	VXNVhAYPnpZpM3NxWMNTVrBSMrhw2Cn6mcDaDp4moq2nCvUa616iapHbZG6+sKq9N1IGUq13YunCG
	tWD5O1DHO9kbje1kBLDqAIhj7cJYaMF+tNkmkVflZdiJgTMhtG9LiGKse1Mg7JD4+e1d8xSa16GFa
	oyfede5NpeEePuRkspWJ+lou+dj3sfOi6Q1J99SiuOCj/0KR42hJRPiUwTCvCqdzyd9dO4VcZN6AL
	HgCwSg+b6n1NCtPjHZ2cMt9YIeJUXXGFDZCfUQtnWWPgVA3dRiM0PZELoyKPoclwuy/8nnlNomt2v
	27D0pYswLEOx5RBeAEdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSftm-0000000GIH2-18tv;
	Fri, 20 Jun 2025 17:51:34 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfc5-0000000GFLd-35Qx
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 17:33:19 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-70e3980757bso18200837b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750440796; x=1751045596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2abC0SFXgIr7+KzY0H72u6hUC8EwRyPuKIwDFbrFdvA=;
        b=hPMjUdXtzMVD7pdPg1pZDtZNFitb0EG2YzHTCcp3uqwaMu9dHUxACgIHwyZ8HWa5sz
         /9ECR4DuH5R0ypc0A4+tN6yPsttjMnCYM8uA8E+R+IqYeD1GGEvNwkvt9oTu0BW0vD1a
         +5bv8z3AyALH6POoN7Zuk2ySAHWWIzlQr37nizXz2BRpJI1fBJoosxM9ivAMSYEmHyHW
         sUlqsBDwwlW8zkqrZXg+WDTOsKtGXBNOl/nNTfv8aQoNQaB8Y4vNnUlPRqtQcRW3i2ni
         l2o37zvotcixp3qjTZ3GV686s3Ky38zIVmoGrRys7wY6pkV3+d/4LF/gb7EewVI/5sLn
         aFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440796; x=1751045596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2abC0SFXgIr7+KzY0H72u6hUC8EwRyPuKIwDFbrFdvA=;
        b=KoGDf2uSSq5E84FfWt0XuFe7uO3+B0Z+kW9qp0LXHf+BAy7deCpWMLYoVuvCWXhMgB
         LnpfJ5JFHQmbeQjYBzBe2OzmRssosFOMOsMQtlyJL3tTR1gAz/fEAVZ67G+0tFvmbeED
         ZMXsWniCa7A5E2Rh6wiJPyYH2W3eQN7fxWFF/UEdT3QYEK31+oPy6dfWxiCfiGsR7X8d
         DWll3KWyEk6h/vgHGIOCAXtm0BoL3He33LDPJBEU+dAOUmBR4/grz1sda9rRYXOngrng
         xgWJDPBTQAjuvv7Hpi3AnnzPZN/sKi1zxSpX70femB47KLE/BxyMi7vXSNZj8E2Mc//7
         8YNg==
X-Forwarded-Encrypted: i=1; AJvYcCUr8IVD+0Ut0DvXk6l1m1FIx/89o5KG+1V+MPKTfoFk0I+hs2ObJsCpUpF7gnbz4AGeheGWvxQK38jZ/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX1PRcGWry7hex05o6tcofmA6O83rO+DOndEO7vHpBwxWFD/Ji
	aEuK4PgDDWHXKCpJ+EYSpNsqAftEnbkgRlqzUvygmxfn+jjA46HTUNNGs1NfBWwKbbGiV4CwxMQ
	hWdXU3b/zYa8EpzEUb0bdmfotO3P4KhPPN7721P+vAw==
X-Gm-Gg: ASbGncukh/3b8orj3nlEyVLCo3+mCgsQBmHxBmA+OhCASXVnMxLawEd+QX4yiXYZB/Z
	jmddONaVFv0EpYtWU4O4KqeMahWvy6NCgq8Sqefa0uO5s/nZnceN+bfsLjyxy0skVsDlJEBPLqC
	TQ0cXTvkkk/3CEewv8uGi1wdIPK7vFLAubBN5CRjHT4o5x
X-Google-Smtp-Source: AGHT+IEkgLARqA2KXW+VjQvrt/iHwV+xr0H31M/s+eB4pqd94Voek7Ap4g7bsttqbn0aTqp01MS+cbE/e4BYHevU73o=
X-Received: by 2002:a05:690c:931c:10b0:712:c5f7:1ee9 with SMTP id
 00721157ae682-712ca34ede8mr29381827b3.8.1750440796260; Fri, 20 Jun 2025
 10:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
 <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
 <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com> <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com>
In-Reply-To: <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 20 Jun 2025 10:33:05 -0700
X-Gm-Features: Ac12FXwTNfjkf9IENg9kQWer4J0SFv3v73bubAYv2TNOJ9tzM24JcaWhs9j55A8
Message-ID: <CAKC1njRNatM6bj7+bCbMcwv7UoEfKSTQTGOnFSxuGLoephw0+A@mail.gmail.com>
Subject: Re: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
To: Zong Li <zong.li@sifive.com>
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
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_103318_031793_6C160BA8 
X-CRM114-Status: GOOD (  46.73  )
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

T24gVGh1LCBKdW4gMTksIDIwMjUgYXQgNzoxNuKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNiwgMjAyNSBhdCAzOjMx4oCvUE0gWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1biA1LCAyMDI1
IGF0IDE6MTfigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IHppY2Zpc3MgLyB6aWNmaWxwIGludHJvZHVjZXMgYSBuZXcgZXhjZXB0aW9uIHRv
IHByaXYgaXNhIGBzb2Z0d2FyZSBjaGVjawo+ID4gPiBleGNlcHRpb25gIHdpdGggY2F1c2UgY29k
ZSA9IDE4LiBUaGlzIHBhdGNoIGltcGxlbWVudHMgc29mdHdhcmUgY2hlY2sKPiA+ID4gZXhjZXB0
aW9uLgo+ID4gPgo+ID4gPiBBZGRpdGlvbmFsbHkgaXQgaW1wbGVtZW50cyBhIGNmaSB2aW9sYXRp
b24gaGFuZGxlciB3aGljaCBjaGVja3MgZm9yIGNvZGUKPiA+ID4gaW4geHR2YWwuIElmIHh0dmFs
PTIsIGl0IG1lYW5zIHRoYXQgc3cgY2hlY2sgZXhjZXB0aW9uIGhhcHBlbmVkIGJlY2F1c2Ugb2YK
PiA+ID4gYW4gaW5kaXJlY3QgYnJhbmNoIG5vdCBsYW5kaW5nIG9uIDQgYnl0ZSBhbGlnbmVkIFBD
IG9yIG5vdCBsYW5kaW5nIG9uCj4gPiA+IGBscGFkYCBpbnN0cnVjdGlvbiBvciBsYWJlbCB2YWx1
ZSBlbWJlZGRlZCBpbiBgbHBhZGAgbm90IG1hdGNoaW5nIGxhYmVsCj4gPiA+IHZhbHVlIHNldHVw
IGluIGB4N2AuIElmIHh0dmFsPTMsIGl0IG1lYW5zIHRoYXQgc3cgY2hlY2sgZXhjZXB0aW9uIGhh
cHBlbmVkCj4gPiA+IGJlY2F1c2Ugb2YgbWlzbWF0Y2ggYmV0d2VlbiBsaW5rIHJlZ2lzdGVyICh4
MSBvciB4NSkgYW5kIHRvcCBvZiBzaGFkb3cKPiA+ID4gc3RhY2sgKG9uIGV4ZWN1dGlvbiBvZiBg
c3Nwb3BjaGtgKS4KPiA+ID4KPiA+ID4gSW4gY2FzZSBvZiBjZmkgdmlvbGF0aW9uLCBTSUdTRUdW
IGlzIHJhaXNlZCB3aXRoIGNvZGU9U0VHVl9DUEVSUi4KPiA+ID4gU0VHVl9DUEVSUiB3YXMgaW50
cm9kdWNlZCBieSB4ODYgc2hhZG93IHN0YWNrIHBhdGNoZXMuCj4gPiA+Cj4gPiA+IFRvIGtlZXAg
dXByb2JlcyB3b3JraW5nLCBoYW5kbGUgdGhlIHVwcm9iZSBldmVudCBmaXJzdCBiZWZvcmUgcmVw
b3J0aW5nCj4gPiA+IHRoZSBDRkkgdmlvbGF0aW9uIGluIHNvZnR3YXJlLWNoZWNrIGV4Y2VwdGlv
biBoYW5kbGVyLiBCZWNhdXNlIHdoZW4gdGhlCj4gPiA+IGxhbmRpbmcgcGFkIGlzIGFjdGl2YXRl
ZCwgaWYgdGhlIHVwcm9iZSBwb2ludCBpcyBzZXQgYXQgdGhlIGxwYWQKPiA+ID4gaW5zdHJ1Y3Rp
b24gYXQgdGhlIGJlZ2lubmluZyBvZiBhIGZ1bmN0aW9uLCB0aGUgc3lzdGVtIHRyaWdnZXJzIGEg
c29mdHdhcmUKPiA+ID4gLWNoZWNrIGV4Y2VwdGlvbiBpbnN0ZWFkIG9mIGFuIGVicmVhayBleGNl
cHRpb24gZHVlIHRvIHRoZSBleGNlcHRpb24KPiA+ID4gcHJpb3JpdHksIHRoZW4gdXByb2JlIGNh
bid0IHdvcmsgc3VjY2Vzc2Z1bGx5Lgo+ID4gPgo+ID4gPiBDby1kZXZlbG9wZWQtYnk6IFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcu
bGlAc2lmaXZlLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZp
dmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5j
LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5
cGVzLmggfCAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5o
ICAgfCAgMiArKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAg
IHwgIDMgKysKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICB8
IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCA1NyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fz
bS1wcm90b3R5cGVzLmgKPiA+ID4gaW5kZXggY2Q2MjdlYzI4OWYxLi41YTI3Y2VmZDc4MDUgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+
ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPiA+ID4g
QEAgLTUxLDYgKzUxLDcgQEAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfdSk7
Cj4gPiA+ICBERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9lY2FsbF9zKTsKPiA+ID4gIERF
Q0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX20pOwo+ID4gPiAgREVDTEFSRV9ET19F
UlJPUl9JTkZPKGRvX3RyYXBfYnJlYWspOwo+ID4gPiArREVDTEFSRV9ET19FUlJPUl9JTkZPKGRv
X3RyYXBfc29mdHdhcmVfY2hlY2spOwo+ID4gPgo+ID4gPiAgYXNtbGlua2FnZSB2b2lkIGhhbmRs
ZV9iYWRfc3RhY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ID4gPiAgYXNtbGlua2FnZSB2b2lk
IGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZW50cnktY29tbW9uLmgKPiA+ID4gaW5kZXggYjI4Y2NjNmNkZWVhLi4zNGVkMTQ5YWY1
ZDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9u
LmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+ID4g
PiBAQCAtNDAsNCArNDAsNiBAQCBzdGF0aWMgaW5saW5lIGludCBoYW5kbGVfbWlzYWxpZ25lZF9z
dG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gIH0KPiA+ID4gICNlbmRpZgo+ID4gPgo+
ID4gPiArYm9vbCBoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdz
KTsKPiA+ID4gKwo+ID4gPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfRU5UUllfQ09NTU9OX0ggKi8K
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TCj4gPiA+IGluZGV4IDk3ODExNTU2N2JjYS4uOGQyNTgzN2E5Mzg0IDEw
MDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiA+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+ID4gQEAgLTQ3NCw2ICs0NzQsOSBAQCBTWU1fREFU
QV9TVEFSVF9MT0NBTChleGNwX3ZlY3RfdGFibGUpCj4gPiA+ICAgICAgICAgUklTQ1ZfUFRSIGRv
X3BhZ2VfZmF1bHQgICAvKiBsb2FkIHBhZ2UgZmF1bHQgKi8KPiA+ID4gICAgICAgICBSSVNDVl9Q
VFIgZG9fdHJhcF91bmtub3duCj4gPiA+ICAgICAgICAgUklTQ1ZfUFRSIGRvX3BhZ2VfZmF1bHQg
ICAvKiBzdG9yZSBwYWdlIGZhdWx0ICovCj4gPiA+ICsgICAgICAgUklTQ1ZfUFRSIGRvX3RyYXBf
dW5rbm93biAvKiBjYXVzZT0xNiAqLwo+ID4gPiArICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3Vu
a25vd24gLyogY2F1c2U9MTcgKi8KPiA+ID4gKyAgICAgICBSSVNDVl9QVFIgZG9fdHJhcF9zb2Z0
d2FyZV9jaGVjayAvKiBjYXVzZT0xOCBpcyBzdyBjaGVjayBleGNlcHRpb24gKi8KPiA+ID4gIFNZ
TV9EQVRBX0VORF9MQUJFTChleGNwX3ZlY3RfdGFibGUsIFNZTV9MX0xPQ0FMLCBleGNwX3ZlY3Rf
dGFibGVfZW5kKQo+ID4gPgo+ID4gPiAgI2lmbmRlZiBDT05GSUdfTU1VCj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Ywo+ID4gPiBpbmRleCA4ZmY4ZThiMzY1MjQuLjY0Mzg4MzcwZTFhZCAxMDA2NDQKPiA+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4gPiA+IEBAIC0zNTQsNiArMzU0LDU3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gPgo+ID4gPiAgfQo+ID4gPgo+ID4gPiArI2RlZmlu
ZSBDRklfVFZBTF9GQ0ZJX0NPREUgICAgIDIKPiA+ID4gKyNkZWZpbmUgQ0ZJX1RWQUxfQkNGSV9D
T0RFICAgICAzCj4gPiA+ICsvKiBoYW5kbGUgY2ZpIHZpb2xhdGlvbnMgKi8KPiA+ID4gK2Jvb2wg
aGFuZGxlX3VzZXJfY2ZpX3Zpb2xhdGlvbihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gK3sK
PiA+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIHR2YWwgPSBjc3JfcmVhZChDU1JfVFZBTCk7Cj4g
PiA+ICsgICAgICAgYm9vbCBpc19mY2ZpID0gKHR2YWwgPT0gQ0ZJX1RWQUxfRkNGSV9DT0RFICYm
IGNwdV9zdXBwb3J0c19pbmRpcmVjdF9icl9scF9pbnN0cigpKTsKPiA+ID4gKyAgICAgICBib29s
IGlzX2JjZmkgPSAodHZhbCA9PSBDRklfVFZBTF9CQ0ZJX0NPREUgJiYgY3B1X3N1cHBvcnRzX3No
YWRvd19zdGFjaygpKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIC8qCj4gPiA+ICsgICAgICAgICog
SGFuZGxlIHVwcm9iZSBldmVudCBmaXJzdC4gVGhlIHByb2JlIHBvaW50IGNhbiBiZSBhIHZhbGlk
IHRhcmdldAo+ID4gPiArICAgICAgICAqIG9mIGluZGlyZWN0IGp1bXBzIG9yIGNhbGxzLCBpbiB0
aGlzIGNhc2UsIGZvcndhcmQgY2ZpIHZpb2xhdGlvbgo+ID4gPiArICAgICAgICAqIHdpbGwgYmUg
dHJpZ2dlcmVkIGluc3RlYWQgb2YgYnJlYWtwb2ludCBleGNlcHRpb24uCj4gPiA+ICsgICAgICAg
ICovCj4gPiA+ICsgICAgICAgaWYgKGlzX2ZjZmkgJiYgcHJvYmVfYnJlYWtwb2ludF9oYW5kbGVy
KHJlZ3MpKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPgo+ID4gSGkgIERl
ZXBhaywKPiA+IFNvcnJ5IGZvciBtaXNzaW5nIHNvbWV0aGluZyBlYXJsaWVyLiBJIHRoaW5rIHdl
IHdvdWxkIGxpa2UgdG8gY2xlYXIKPiA+IHNzdGF0dXMuU1BFTFAgaW4gdGhlIHVwcm9iZSBoYW5k
bGluZyBjYXNlLiBGb3IgZXhhbXBsZToKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+IGluZGV4IGMyZWE5
OTljMTE2Ny4uZTg0OTJiYjU3ZTA5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gQEAgLTM0OSw4
ICszNDksMTAgQEAgYm9vbCBoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQo+ID4gICAgICAgICBib29sIGlzX2ZjZmkgPSAodHZhbCA9PSBDRklfVFZBTF9GQ0ZJ
X0NPREUgJiYKPiA+IGNwdV9zdXBwb3J0c19pbmRpcmVjdF9icl9scF9pbnN0cigpKTsKPiA+ICAg
ICAgICAgYm9vbCBpc19iY2ZpID0gKHR2YWwgPT0gQ0ZJX1RWQUxfQkNGSV9DT0RFICYmCj4gPiBj
cHVfc3VwcG9ydHNfc2hhZG93X3N0YWNrKCkpOwo+ID4KPiA+IC0gICAgICAgaWYgKGlzX2ZjZmkg
JiYgcHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKHJlZ3MpKQo+ID4gKyAgICAgICBpZiAoaXNfZmNm
aSAmJiBwcm9iZV9icmVha3BvaW50X2hhbmRsZXIocmVncykpIHsKPiA+ICsgICAgICAgICAgICAg
ICByZWdzLT5zdGF0dXMgPSByZWdzLT5zdGF0dXMgJiB+U1JfRUxQOwo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybiB0cnVlOwo+ID4gKyAgICAgICB9CgpNYWtlIHNlbnNlLiBJJ2xsIHBpY2sgaXQg
dXAgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtzLgoKPiA+Cj4gPiAgICAgICAgIGlmIChpc19m
Y2ZpIHx8IGlzX2JjZmkpIHsKPiA+ICAgICAgICAgICAgICAgICBkb190cmFwX2Vycm9yKHJlZ3Ms
IFNJR1NFR1YsIFNFR1ZfQ1BFUlIsIHJlZ3MtPmVwYywKPiA+Cj4gPgo+ID4gV2hlbiBhIHVzZXIg
bW9kZSBDRkkgdmlvbGF0aW9uIG9jY3VycywgdGhlIEVMUCBzdGF0ZSBzaG91bGQgYmUgMSwgYW5k
Cj4gPiB0aGUgc3lzdGVtIHRyYXBzIGludG8gc3VwZXJ2aXNvciBtb2RlLiBEdXJpbmcgdGhpcyB0
cmFwLCBzc3RhdHVzLlNQRUxQCj4gPiBpcyBzZXQgdG8gMSwgYW5kIHRoZSBFTFAgc3RhdGUgaXMg
cmVzZXQgdG8gMC4gSWYgd2UgZG9u4oCZdCBjbGVhcgo+ID4gc3N0YXR1cy5TUEVMUCwgdGhlIEVM
UCBzdGF0ZSB3aWxsIGJlY29tZSAxIGFnYWluIGFmdGVyIGV4ZWN1dGluZyB0aGUKPiA+IHNyZXQg
aW5zdHJ1Y3Rpb24uIEFzIGEgcmVzdWx0LCB0aGUgc3lzdGVtIG1pZ2h0IHRyaWdnZXIgYW5vdGhl
cgo+ID4gZm9yd2FyZCBDRkkgdmlvbGF0aW9uIHVwb24gZXhlY3V0aW5nIHRoZSBuZXh0IGluc3Ry
dWN0aW9uIGluIHRoZSB1c2VyCj4gPiBwcm9ncmFtLCB1bmxlc3MgaXQgaGFwcGVucyB0byBiZSBh
IGxwYWQgaW5zdHJ1Y3Rpb24uCj4gPgo+ID4gVGhlIHByZXZpb3VzIHBhdGNoIHdhcyB0ZXN0ZWQg
b24gUUVNVSwgYnV0IFFFTVUgZG9lcyBub3Qgc2V0IHRoZQo+ID4gc3N0YXR1cy5TUEVMUCBiaXQg
dG8gMSB3aGVuIGEgZm9yd2FyZCBDRkkgdmlvbGF0aW9uIG9jY3Vycy4gVGhlcmVmb3JlLAo+ID4g
SSBzdXNwZWN0IHRoYXQgUUVNVSBtaWdodCBhbHNvIHJlcXVpcmUgc29tZSBmaXhlcy4KPgo+IEhp
IERlZXBhaywKPiBUaGUgaXNzdWUgd2l0aCBRRU1VIHdhcyB0aGF0IHRoZSBzdy1jaGVjayBleGNl
cHRpb24gYml0IGluIG1lZGVsZWcKPiBjb3VsZG4ndCBiZSBzZXQuIFRoaXMgaGFzIGJlZW4gZml4
ZWQgaW4gdGhlIGxhdGVzdCBRRU1VIG1haW5saW5lLiBJCj4gaGF2ZSByZS10ZXN0ZWQgdGhlIGxh
dGVzdCBRRU1VIHZlcnNpb24sIGFuZCBpdCB3b3Jrcy4KClRoYW5rcyBmb3IgdGhlIGZpeC4KCj4K
PiA+Cj4gPiBUaGFua3MKPiA+Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoaXNfZmNmaSB8fCBp
c19iY2ZpKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR1NF
R1YsIFNFR1ZfQ1BFUlIsIHJlZ3MtPmVwYywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIk9vcHMgLSBjb250cm9sIGZsb3cgdmlvbGF0aW9uIik7Cj4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gKy8qCj4gPiA+ICsgKiBzb2Z0d2Fy
ZSBjaGVjayBleGNlcHRpb24gaXMgZGVmaW5lZCB3aXRoIHJpc2MtdiBjZmkgc3BlYy4gU29mdHdh
cmUgY2hlY2sKPiA+ID4gKyAqIGV4Y2VwdGlvbiBpcyByYWlzZWQgd2hlbjotCj4gPiA+ICsgKiBh
KSBBbiBpbmRpcmVjdCBicmFuY2ggZG9lc24ndCBsYW5kIG9uIDQgYnl0ZSBhbGlnbmVkIFBDIG9y
IGBscGFkYAo+ID4gPiArICogICAgaW5zdHJ1Y3Rpb24gb3IgYGxhYmVsYCB2YWx1ZSBwcm9ncmFt
bWVkIGluIGBscGFkYCBpbnN0ciBkb2Vzbid0Cj4gPiA+ICsgKiAgICBtYXRjaCB3aXRoIHZhbHVl
IHNldHVwIGluIGB4N2AuIHJlcG9ydGVkIGNvZGUgaW4gYHh0dmFsYCBpcyAyLgo+ID4gPiArICog
YikgYHNzcG9wY2hrYCBpbnN0cnVjdGlvbiBmaW5kcyBhIG1pc21hdGNoIGJldHdlZW4gdG9wIG9m
IHNoYWRvdyBzdGFjayAoc3NwKQo+ID4gPiArICogICAgYW5kIHgxL3g1LiByZXBvcnRlZCBjb2Rl
IGluIGB4dHZhbGAgaXMgMy4KPiA+ID4gKyAqLwo+ID4gPiArYXNtbGlua2FnZSBfX3Zpc2libGUg
X190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX3NvZnR3YXJlX2NoZWNrKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQo+ID4gPiArewo+ID4gPiArICAgICAgIGlmICh1c2VyX21vZGUocmVncykpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgIGlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAvKiBub3QgYSBjZmkgdmlvbGF0aW9uLCB0aGVu
IG1lcmdlIGludG8gZmxvdyBvZiB1bmtub3duIHRyYXAgaGFuZGxlciAqLwo+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKCFoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHJlZ3MpKQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBkb190cmFwX3Vua25vd24ocmVncyk7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICAgICAgICAgIGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gPiAr
ICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAvKiBzdyBjaGVjayBleGNlcHRp
b24gY29taW5nIGZyb20ga2VybmVsIGlzIGEgYnVnIGluIGtlcm5lbCAqLwo+ID4gPiArICAgICAg
ICAgICAgICAgZGllKHJlZ3MsICJLZXJuZWwgQlVHIik7Cj4gPiA+ICsgICAgICAgfQo+ID4gPiAr
fQo+ID4gPiArCj4gPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+ID4gPiAgYXNtbGlua2FnZSBfX3Zp
c2libGUgbm9pbnN0ciB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
PiA+ICB7Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuNDMuMAo+ID4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
