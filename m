Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91373CD1284
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 02:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xJzQvzdxqMpN3tzYQBn3RLeCqZH+XDMJvA5xGJsXco=; b=lEFCN/diH9vOB+
	FuNwYLc/rB1X9XvGCR6YYCEL7gR41U03oA2jLRAqEL+zL0ejRLJvd6rNIb1m/Pvgl9aiscx3aX62A
	5QzvfYIf30oJss3q0i1yODJbbC3qiLMcCpQWyp5qcOn2pAHNDeuQWQeyOsU6AFhp64qAxDgrmIF4i
	dyXZt9pSPe8FNVc/2ybvBQ4fjPgM8LN0w7reeZnqhprv1imWU4whpqAf1N0Ytg+QvDm/r1rkJr9U0
	ViZRoJVppMlD5yA09we8i0taIfwVpgoC4hmYOL1H2WhzZ2PKSPsLRIY7Be3zZxA9QsRfXuxoY1H8M
	DSsebzoGQwkPjKa5ddUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtIf8-0000000BXSg-1T0P;
	Sun, 07 Apr 2024 02:53:42 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtIf4-0000000BXRH-2yHN
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 02:53:40 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-516d3776334so2858626e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 06 Apr 2024 19:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712458413; x=1713063213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eg5LJVoCgGpvIy5viIhvb7qyO28VADsvG9BNbWNZpc=;
        b=Yq/XiDHL6Mzd9ovZIIBE3SNIFMFdFvzF7QCH4IcgmStEY0/eY2G4QsV3/YyS/S9FFg
         m09FeDdCttSSWr3Pz+ocd2Io/dpUZE3iJajaBL2B6WRt6cG/Rx1/tW9A3jk0/DqgOuvo
         0oEkMBr9PEhUFFtoiThskgt//0s3s31PQ7S2D92+KiFRZ5nnzziJ5wtKB/L21Sk/H/zT
         W4WmFGW7ihHl3xyegiGByaaoxOH9YbG3eLhECmU9Z4Eyd/R4VKCRyrsISpw+7COJD0Eu
         6Qm7pppPC4nibl1HyBDtyDq3/jl0pR44U2SrNDQ8OaxjC8uXknt4C3EDuIKVOSxQfcdP
         nmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712458413; x=1713063213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eg5LJVoCgGpvIy5viIhvb7qyO28VADsvG9BNbWNZpc=;
        b=vhU7GS4wE9bHoxADUBRoqYYbydqCQAnqfxzp+jHCBoEjT84UYxd2Y4OW0dut0BZ46q
         uWf4YSDi8CVKobPxbRfT2H1Rd3SXzZTsXv5QPM6qGjgvyy0BalF66sj8F+tUrKOgEZxo
         9PF0xfELh47UNzI43mpD2/yH8OWRYIF8nYBMDby1gkc3YicK0lYW1hD44TZMbqCOC3Ro
         MqTBlOqQ0B1sDa6G+V/cHuNvt5Uo3PmOGkSpxWIriNwgOiwLt5lw6wzYPpFWo4yqh49M
         36jTlFsfF+af6OjeidWclueKK1JEsH7lNDlwv7pq052RNpz5iAjvDF47/At4c+dIsOKQ
         Bqkg==
X-Forwarded-Encrypted: i=1; AJvYcCVWEgohLxivOVPA5N7tJ9XTzeHOWRZGGjqFTPZgaDkfIct5I3DDTmvPC9+XZLncLsdQlE/hg/wA/j97+mmMMX41M2QRUbO264Zwbp0l4EHS
X-Gm-Message-State: AOJu0Yx+882uDDfpXL/QEihEvewtLCTmFn5Zi7ppOiCaTDpDQhvGxtIx
	qNja9gwtgnHxVUwhXNwd0BWokUN4sYZ1c8063lp5AesVtdabbnUGZAXbxgdnJhAwetBLoUw6mnQ
	iBp7R5pVaew9tA3k43z4UVpxj0EM=
X-Google-Smtp-Source: AGHT+IGPNaBY7p9jhIbr7kM96+qmULR+lYEMhFuh42Rbxchab60jlMaC+Feq12fbmoMqIEL4NxFEm18CO0ttHSM12Dc=
X-Received: by 2002:ac2:44b7:0:b0:513:cf75:2ccc with SMTP id
 c23-20020ac244b7000000b00513cf752cccmr3762064lfm.0.1712458413059; Sat, 06 Apr
 2024 19:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1709780590.git.haibo1.xu@intel.com> <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
 <Zgpf0rqUSEZcSiAV@sunil-laptop> <CAJve8om9-cTtYKLmB0R=6Wwh5KQ9z+16AFR-tuUkJhJjbn0UEA@mail.gmail.com>
 <SJ1PR11MB6083B43290D216B1568642B0FC3F2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ZgzS7W83iWRII73G@sunil-laptop>
In-Reply-To: <ZgzS7W83iWRII73G@sunil-laptop>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 7 Apr 2024 10:53:21 +0800
Message-ID: <CAJve8o=VMXGwgGKQJvXiBXFLpqt+afFTG0vFvW-bTguzY76KMg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Xu, Haibo1" <haibo1.xu@intel.com>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	"Moore, Robert" <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Zong Li <zong.li@sifive.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Baoquan He <bhe@redhat.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen Jiahao <chenjiahao16@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Evan Green <evan@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Yuntao Wang <ytcoode@gmail.com>, "Schofield, Alison" <alison.schofield@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_195338_775917_0415D4BC 
X-CRM114-Status: GOOD (  20.12  )
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

T24gV2VkLCBBcHIgMywgMjAyNCBhdCAxMTo1NOKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDAxLCAyMDI0IGF0IDA0OjU3OjMw
UE0gKzAwMDAsIEx1Y2ssIFRvbnkgd3JvdGU6Cj4gPiA+PiBJZiB0aGUgZmlybXdhcmUgZGlkbid0
IHByb3ZpZGUgdGhlIFNSQVQvU0xJVCBvbiBBQ1BJIGJhc2VkIHN5c3RlbXMsIHRoZW4KPiA+ID4+
IHRoZXJlIHdpbGwgYmUgYSBtZXNzYWdlICJGYWlsZWQgdG8gaW5pdGlhbGlzZSBmcm9tIGZpcm13
YXJlIiBmcm9tCj4gPiA+PiBhcmNoX2FjcGlfbnVtYV9pbml0KCkuIFRoaXMgaXMgbm90IHNwZWNp
ZmljIHRvIFJJU0MtVi4gQnV0IEkgYW0KPiA+ID4+IHdvbmRlcmluZyB3aHkgc2hvdWxkIGl0IGJl
IHByX2luZm8gaW5zdGVhZCBvZiBwcl9kZWJ1Zy4KPiA+ID4+Cj4gPiA+Cj4gPiA+IE15IHVuZGVy
c3RhbmRpbmcgaXMgbWF5YmUgaXQganVzdCB3YW50cyB0byBleHBvc2UgZXhwbGljaXQgbG9ncyB0
bwo+ID4gPiBhdm9pZCBhbnkgcG90ZW50aWFsIGJ1Z3MgZnJvbSBGVyBvciBLZXJuZWwuCj4gPgo+
ID4gVGhlcmUgYXJlIGxvdHMgb2YgQUNQSSBlbmFibGVkIHN5c3RlbXMgdGhhdCBhcmVuJ3QgTlVN
QSAoc2luZ2xlCj4gPiBzb2NrZXQgc2VydmVycywgZGVza3RvcHMsIGxhcHRvcHMpLiBNYWtpbmcg
dGhpcyAicHJfaW5mbygpIiB3b3VsZCBqdXN0Cj4gPiBhZGQgbm9pc2UgdG8gdGhlIGJvb3Qgb24g
YWxsIG9mIHRob3NlLgo+ID4KPiBFeGFjdGx5LiBCdXQgdGhpcyBpcyBhbiBleGlzdGluZyBwcl9p
bmZvIG1lc3NhZ2UgYWNyb3NzIGFyY2hpdGVjdHVyZXMuCj4gTXkgc3VnZ2VzdGlvbiBpcyB0byBh
ZGQgb25lIG1vcmUgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgdG8gY29udmVydAo+IHRoaXMgdG8gcHJf
ZGVidWcgdW5sZXNzIHNvbWVvbmUgaGFzIHN0cm9uZyByZWFzb24gdG8ga2VlcCBpdCBwcl9pbmZv
Lgo+CgpTdXJlLiBJIHdpbGwgYWRkIGEgcGF0Y2ggdG8gZml4IGl0IGluIHYzLgoKVGhhbmtzLApI
YWlibwoKPiBUaGFua3MsCj4gU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
