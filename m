Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D396CA0EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ggPuQpGtdgZtWP6730oHaBeO1oJ+20tgwp0BfO7kZWc=; b=z3J68G6ihG2unPMq1ci0OZ8mus
	ho2GcfzPg4ypG6EOWFEhS/oXHgzxfgMhDICF3Ugwr0PtahftBbCTlMDdzCre9269R616LWWigt/AY
	a7EqdTatDr5MvqRDVN7e7kDKNFt3YBOB62Nq2BLhc60K22LE3R/dzi/Atoj7B8PoD2OEInRn8gRPK
	oAxKb5ju57aY4yIbHCAo5eWqQ+NVYTW0xbNmpq0igyV53ZKAVyCG3kSIdkvaUowhE5tcAFrDaFrfL
	umqhBLO9nTzzb0EU7kkuEzJPoemwaOeP357RCzl5WzeLXxycEgNOqd2IJv6iFq/jqPQdUG86eir1N
	Y8DrXoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxo9-0000000348u-2fJL;
	Fri, 15 Aug 2025 17:01:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umw1m-00000002o67-2FNL
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 15:07:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso1253682b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270454; x=1755875254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=0f7X2Ra7vUeX+bf1SEVRHpWhqVW/SCKhE8jFsD7vlb4wTp6rtIYKpNuj0LLP/arsqg
         XnRCibI7FqQD1N3yyR0G6n91/grOYPoD52g+MiYONGKtgQi+Y2V4VtZpMleWDrUxmkpI
         zKak5RebbHKLZn0JXe5lhq5yIL2vH2KVcTIcB3tCcYv9V+Hg3HSfdvgxE7WIX69f1afN
         R9hNeo4/vayAvR1atXv34J4fx/fjfpI2+LOuMkY3r8fyLkXMQUYJfFD40Lgb5F1SQ2ta
         xM0CShJSdAYn9f7DArDVIHpy47kaGtcc6zJtdppC0cXto/wnJCOhw9LP6irThVlTQzHv
         OR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270454; x=1755875254;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=JCkyjhCZPq/TQQfOLC0rmVt2q4bqrokPLKWhyV3CxHl1JsEdP1xUkPrZMej+hHJqcR
         R6gXp1uzAaRrGtRB/RbexizzP7JaDJULPwrdZ/HHuXA9KrazCtDH5Ja/Uz/768ietSRB
         457KMDU+ayJWXjfvD0cn1Wse33StxLY69FTB0grg506FwDR6fvvA9mPG3FNAB64a0At1
         jb2DUKvTROJ0HZtK2lid9SvIK1XywshoBfjMrmoyRK4EwBj3vmHxooHlWout7OkenHXV
         6RLmYxlLxzZQHY9ozb8Zu5UUYCAdPFoex7Whl5bux00AJTKMLVupo/8f6V+WAUrla6R3
         Q/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmsjJ+ZqLfF7U1c1Vlp0tJgwWR+KvS9kDtCHBANtERZcABO1e3OnqnMLr8e7rTMB7ivBL0Y8LAigCltw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPyfVvkwi4qrs2Cu5a1A0kLisgZJWfWCaAATamTU8yX9+XqX3m
	QDNAuvHMZRScK8W4/zVHobDReKm2D5x7DpjdHhYp4DOQ10aSsnT9oya/hKpAaMw3cWQ=
X-Gm-Gg: ASbGncszKIf5USqUtAYDmpLkSWte4JibM+PhT4NKrgKbI1ZMzpl4cI74LwUlP/YiS3p
	FyLLuCoujtO4YNkdh16kWIRAA4ivF2HHUllPz33q+JsxINwMi+qOMg2gKNlAvzfe54OL+Rjeuwp
	zsAroUdtMP8WM+mSEqVOvDyOzzzLRqvR6TToE+vYAUFi82TDQO4DthBedMkzgW9WTjYyNX7/wro
	KWEKLLikFu6h+TbRua5AtDm/QUJpILl63GxcB6ghaaLf206A+Py0NGS8ct3D3oXzL96mnCxpYT+
	BuIvUyK5F1eJCjM4ihOIFS3vneP8SDX2RP7K+96i4V7hMPPKR4RFizT3mSVTSWRN+X3yoEoPLtB
	lACcMhUjOKQoPmILXERjc9bdsHNpKRb6WrPY=
X-Google-Smtp-Source: AGHT+IGQbGMaqUCBVjgHpE03NJ6lUtJGuN0cfMPLFV18k27l43zYHixLrnt22lRnZXhrjts5z9io5w==
X-Received: by 2002:a05:6a20:1611:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-240d3039205mr3462386637.45.1755270453673;
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5e58d0sm1499710a12.23.2025.08.15.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:07:29 PDT (-0700)
Subject: Re: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
In-Reply-To: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-146EE95D-951E-41BB-898C-033437B27EA3@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_080734_578931_1A5E96BC 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBBdWcgMjAyNSAyMjo0NDozMSBQRFQgKC0wNzAwKSwgdGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZSB3cm90ZToKPiBBbGwgdGhlIG90aGVyIGFyY2hpdGVjdHVyZXMgc3Vw
cG9ydGluZyBMVE8gKHg4NiwgYXJtNjQsIGxvb25nYXJjaCkgZG8gbm90Cj4gdXNlIGl0IGZvciB0
aGUgdkRTTy4KPgo+IEl0cyBpcyBwcm9ibGVtYXRpYyBmb3Igc29tZSB1cGNvbWluZyBjb21waWxl
LXRpbWUgdmFsaWRhdGlvbiBvZiB0aGUKPiBnZW5lcmF0ZWQgb2JqZWN0IGNvZGUuCj4gVGhlIExU
TyBvYmplY3QgZmlsZXMgZG8gbm90IGNvbnRhaW4gdGhlIG5lY2Vzc2FyeSByZWxvY2F0aW9uIGlu
Zm9ybWF0aW9uCj4gYW5kIC1mbHRvLWZhdC1vYmplY3RzIGlzIG5vdCBjb21wYXRpYmxlIHdpdGgg
Y2xhbmcgPCAxNi4KPgo+IEZvciBjb25zaXN0ZW5jeSBhbmQgdG8gZW5hYmxlIHRoZSBtZW50aW9u
ZWQgY29tcGlsZS10aW1lIGNoZWNrcywKPiBkaXNhYmxlIExUTyBmb3IgdGhlIHZEU08uCj4gVGhl
IHZEU08gaGVhdmlseSB1c2VzIF9fYWx3YXlzX2lubGluZSBhbnl3YXlzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
Cj4gUmV2aWV3ZWQtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiBU
ZXN0ZWQtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQo+IGlu
ZGV4IGMxOWMzYzc2ZjdjOWY2YjJmNzUyM2E1OTI2OWRlM2I2ODM2NTYzMjMuLjlmMWJmNWJhZTli
ZDQ3M2U0M2Q5ZmQzMDIyZTllMWExODUxMjhiNzMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZp
bGUKPiBAQCAtNDksNyArNDksNyBAQCBDUFBGTEFHU192ZHNvLmxkcyArPSAtREhBU19WR0VUVElN
RU9GREFZCj4gIGVuZGlmCj4KPiAgIyBEaXNhYmxlIC1wZyB0byBwcmV2ZW50IGluc2VydCBjYWxs
IHNpdGUKPiAtQ0ZMQUdTX1JFTU9WRV9WRFNPID0gJChDQ19GTEFHU19GVFJBQ0UpICQoQ0NfRkxB
R1NfU0NTKQo+ICtDRkxBR1NfUkVNT1ZFX1ZEU08gPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19G
TEFHU19TQ1MpICQoQ0NfRkxBR1NfTFRPKQo+ICBDRkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXku
byA9ICQoQ0ZMQUdTX1JFTU9WRV9WRFNPKQo+ICBDRkxBR1NfUkVNT1ZFX2dldHJhbmRvbS5vID0g
JChDRkxBR1NfUkVNT1ZFX1ZEU08pCj4gIENGTEFHU19SRU1PVkVfaHdwcm9iZS5vID0gJChDRkxB
R1NfUkVNT1ZFX1ZEU08pCgpBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0
LmNvbT4KCkFsc28gYXNzdW1pbmcgdGhpcyBnb2VzIHdpdGggdGhlIG90aGVycy4gIFRoYW5rcyEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
