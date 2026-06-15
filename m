Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A12CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:Mime-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tyv24vA3HmzaenqaFKCrQtmIie2LVzZvDyzgoO3Oh3s=; b=4Tmaiz0BZezfV8WQyWcJ03NV4e
	r1yLsReWPkpszVptBx+UITzQPpYxWx+JAl0wCumzyr/hY8ISxqNzQ3016nfvF6v/uZn/gc2I41rcF
	6RsCIWgeR2B5CSkpIeMu/2IYLLN0/i1QqSZxbhaZloMqzMM2trYb4Il6G7JZe1+N8zTOgQN9igGex
	mRlMdFCpy0yT//8W2kJJfUEbLs6ExyXKhwFPNsyvlr+TjDjoIRvwnWMNLb4jqbzknI+gmQtUI5iWn
	/vuiiEUUbCpDwb05fXiuvBWJY9KJ+pyU/DgaOIOYENlkWn4iR6QJsLcUuFh/sIGxZcrGedr7JJG7G
	q0voSAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3yt-0000000E0R1-35Ap;
	Mon, 15 Jun 2026 09:51:47 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3yo-0000000E0PT-3hHm
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 09:51:46 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aa7bf3d512so3947042e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 02:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781517100; cv=none;
        d=google.com; s=arc-20240605;
        b=OXqzxR3G4as0AnUswvPdB1DwJs1En4KIF1ZZ2E8q3IZ1oE6E0W1IulnO0DFVOcHlxN
         boMFypjbd2OokXg/E0JEtq8fwCOoR/BEhNtkwv/jwgGblDnue/qTm0E4JWFC5wW8dkwn
         Al6DzpJZXyuT+lA+ODIEc1wq4NFYi5UQmzgJo/dASg7lWMgeustpaj+YOB3czMLmwZ7V
         J4MClHWbFV01X9IfPxv8bjN29exKiNkRfc7tTQEqivdtYeAktIeR5q7vxSVQWcy5tORB
         EZpfjM9UsfIg73JMmVA5+1Cq18JZ4+9CQx9gUXkiOQWYg/jNpKgnoEEcVOaMHkkoCPrC
         X/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:dkim-signature;
        bh=UA7T2VHNwKA5QLV+Q66VmDrOicG/9ucAXSdJXHCm4nM=;
        fh=idQtVZnZRxBtIP3b6QZqOp0LAq8AnUHvkuyvFwgpWRA=;
        b=JUxndA1XmPuKBM0DddUvWZol4dh1IZejlQlJA3PxVSUkPoIv9Nf1hnZNDHYRZomrJG
         L8AjTiWxBxplqKldMZ2t6A3+kx1XrgEMGV5PJGpdeg5DNLusUAeJJWIUMBZUX07gPkk+
         /PpZN+x10PFtETFcY6zeL5OWs6DT7CD6D9H05pwEecfyl7/j47pbc1jWSty0Upjn9RDU
         3FXrKXQABWbagWkYHjc7Pvir9TMXsutpxQYi4DFiIOgCX1VxL+r/SiX0LodNTwuscueQ
         wqcvq6gvaYt8LE8CJVwbwmmeHkAFSH1ow2aYCom//AZexGhEJ25FKHnVy6aVx3Z+BGri
         B2mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781517100; x=1782121900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA7T2VHNwKA5QLV+Q66VmDrOicG/9ucAXSdJXHCm4nM=;
        b=D7aD59zbT9fdf24bI9zz6nN7P2C4tOYiN3rfTeRez484hcP0TEtOKtoZsaTybhulgS
         DnDp3lvaY3XBAEpOaTyh+YvPCEoCzNyHB3WP1Sujae9Wq9A8g5lNdkAMPcJ3eTyE2mde
         DMJU3lopg4/XOK5AM50bTavXvwb75D37Hq9/8s4XC/LzguuquxaXAqX46ujaf0dkQPay
         ieBJMa/1rcpiu4LXOrblLWN6FumMrkzXFJaals0vpUG/gNXRRerWTCmK5u8bvx087OKg
         JSiLjNt7AI/OS2EAzgxLpx+Qz9M4cVI1lEOWONZ/IDSlXfqzyL6GttBpA0RVt7UcTDh3
         s6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517100; x=1782121900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA7T2VHNwKA5QLV+Q66VmDrOicG/9ucAXSdJXHCm4nM=;
        b=oalzRyqL9zd+I2bq7HUKLdSHBQUyTNl1oow1m7lcNMwiZf2rHHqra+lOp6CDMYeALu
         UMZiZVpFINuSQgHptFXzxlPSHd49p6pGqcUhTs4NSiLbJABVhW7iKTGVBRC1aTxR+Skb
         dade3o4AkphXgJEvYYvbbG2FMH6rV4t4Psk+CXnz8qYPUJQw9hXDGV61Z5y0fN1wqDsb
         pPJaH4FICU4lIlZYWJNt/RAZ8whCfyXGft4NA6IjwiFTgbEXbrHzHGARQSMk3S9B/qlO
         oNo0RLaLv7jgYYGtwugSIxmHUSsb/2pNRvQBLc19JJCubvS3KdnSGr3THMsYN8f5fogn
         4wcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XDmOokL0WFI5PZDoCo574mHIZ75ZpoCMdB6D3Qm1huFT2g7mxeg6m3zcB18mzPQ2mO11m3A/NQiuKsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIkJN3lD7JZ/fYaQl30EnAvvFy9I2ZeP2NQ388DdZVJwjPz8k2
	TmSd0jLm+ocnngOu++pyVqE1vgwZSWW2AsJccmRAEaIG7k7JOFO/ORO0d1nh65p6ax+BOo124jy
	TNL5NdXnCE3AKwA86SpG5CwLMmnhbJx4I7KvrFQT8Ww==
X-Gm-Gg: Acq92OG2IqqGxVuFCYTvJq5tBlIW4OrARrcpz1fnYrmzi+AAHLYrQXxaIJecHvrpCNJ
	fYHMjyururLwfK1eL3fKl9KaUoMrVWlHT93wVrUZgaMd3M2QQ7uwaBFCLASdPqZ7JyPbryrp0lG
	+U8ReyRyzsKXbEYWCDpzR2Vkehbr6tXCuqF1/agj1dKCsCR9Xswl9DySOyBzFGQUK6UOH0aSw6g
	8ZrHzHfxj5I3GZzdAlY7YEXOnN323Oyby8twX1qpI3kGjaDed2zfiSQ6OldvdbLheUZ30ETa49T
	wDCVMDU=
X-Received: by 2002:ac2:504d:0:b0:5aa:6d0f:d74e with SMTP id
 2adb3069b0e04-5ad2db2c5c3mr2901982e87.3.1781517099521; Mon, 15 Jun 2026
 02:51:39 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 15 Jun 2026 02:51:38 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 15 Jun 2026 02:51:38 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <mvmik7kz01z.fsf@suse.de>
Mime-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com> <mvmik7kz01z.fsf@suse.de>
Date: Mon, 15 Jun 2026 02:51:38 -0700
X-Gm-Features: AVVi8CcbFKf2lv0-eBabLq4F7xR6J4TrpNcoqeWD2I2x6dzbxo4YYF_SeWHFlP0
Message-ID: <CACnXVnfr9DzKaXkRAP4zkKP61KG7=+iJ6+TZhBJ_vECrTZJpkA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Andreas Schwab <schwab@suse.de>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Lu <luxu.kernel@bytedance.com>, 
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_025144_854683_DC4DA7E8 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

SGkgQW5kcmVhcywKCkZvciBhIGdlbmVyaWMga2VybmVsLCB0aGUgZXhwZWN0ZWQgc2V0dGluZyBp
cyB0byBsZWF2ZQpSSVNDVl9JT01NVV8zMkJJVF9BQ0NFU1MgZGlzYWJsZWQuCgpJZiBzdXBwb3J0
aW5nIHN1Y2ggcGxhdGZvcm1zIGZyb20gYSBzaW5nbGUgZ2VuZXJpYyBrZXJuZWwgaXMgcHJlZmVy
cmVkLCBJIGNhbgpsb29rIGludG8gcmVwbGFjaW5nIHRoaXMgYnVpbGQtdGltZSBvcHRpb24gd2l0
aCBhIHJ1bnRpbWUgaW5kaWNhdGlvbi4KClJlZ2FyZHMsClpoYW5wZW5nCgo+IEZyb206ICJBbmRy
ZWFzIFNjaHdhYiI8c2Nod2FiQHN1c2UuZGU+Cj4gRGF0ZTrCoCBNb24sIEp1biAxNSwgMjAyNiwg
MTY6MjIKPiBTdWJqZWN0OsKgIFtFeHRlcm5hbF0gUmU6IFtQQVRDSCB2MV0gaW9tbXUvcmlzY3Y6
IFN1cHBvcnQgMzItYml0IHJlZ2lzdGVyIGFjY2Vzc2VzCj4gVG86ICJaaGFucGVuZyBaaGFuZyI8
emhhbmd6aGFucGVuZy5qYXNwZXJAYnl0ZWRhbmNlLmNvbT4KPiBDYzogIlRvbWFzeiBKZXpuYWNo
Ijx0amV6bmFjaEByaXZvc2luYy5jb20+LCAiSm9lcmcgUm9lZGVsIjxqb3JvQDhieXRlcy5vcmc+
LCAiV2lsbCBEZWFjb24iPHdpbGxAa2VybmVsLm9yZz4sICJSb2JpbiBNdXJwaHkiPHJvYmluLm11
cnBoeUBhcm0uY29tPiwgIlBhdWwgV2FsbXNsZXkiPHBqd0BrZXJuZWwub3JnPiwgIlBhbG1lciBE
YWJiZWx0IjxwYWxtZXJAZGFiYmVsdC5jb20+LCAiQWxiZXJ0IE91Ijxhb3VAZWVjcy5iZXJrZWxl
eS5lZHU+LCAiQWxleGFuZHJlIEdoaXRpIjxhbGV4QGdoaXRpLmZyPiwgPGlvbW11QGxpc3RzLmxp
bnV4LmRldj4sIDxsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnPiwgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+LCAiWHUgTHUiPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+LCA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+LCA8eXVhbnpodUBieXRlZGFuY2UuY29tPgo+IE9uIEp1
biAxNSAyMDI2LCBaaGFucGVuZyBaaGFuZyB3cm90ZToKPgo+ID4gK2NvbmZpZyBSSVNDVl9JT01N
VV8zMkJJVF9BQ0NFU1MKPiA+ICsgwqAgwqAgwqAgwqBib29sICJVc2UgMzItYml0IGFjY2Vzc2Vz
IGZvciBSSVNDLVYgSU9NTVUgcmVnaXN0ZXJzIgo+ID4gKyDCoCDCoCDCoCDCoGRlcGVuZHMgb24g
UklTQ1ZfSU9NTVUKPiA+ICsgwqAgwqAgwqAgwqBoZWxwCj4gPiArIMKgIMKgIMKgIMKgIMKgU2F5
IFkgd2hlbiB0aGUgUklTQy1WIElPTU1VIE1NSU8gd2luZG93IGNhbm5vdCBiZSBhY2Nlc3NlZAo+
ID4gKyDCoCDCoCDCoCDCoCDCoHVzaW5nIG5hdHVyYWxseSBhbGlnbmVkIDY0LWJpdCBsb2FkcyBh
bmQgc3RvcmVzLgo+ID4gKwo+ID4gKyDCoCDCoCDCoCDCoCDCoFdoZW4gZW5hYmxlZCwgNjQtYml0
IElPTU1VIHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQgYXMgcGFpcmVkCj4gPiArIMKgIMKgIMKgIMKg
IMKgMzItYml0IE1NSU8gb3BlcmF0aW9ucy4gVGhpcyBvcHRpb24gZG9lcyBub3QgZGVzY3JpYmUg
YW4gUlYzMgo+ID4gKyDCoCDCoCDCoCDCoCDCoGtlcm5lbCBvciBhIDMyLWJpdCBJT01NVSBhcmNo
aXRlY3R1cmUuCj4KPiBXaGF0IGlzIHRoZSBleHBlY3RlZCBzZXR0aW5nIGluIGEgZ2VuZXJpYyBr
ZXJuZWw/Cj4KPiAtLQo+IEFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMsIHNjaHdhYkBzdXNlLmRl
Cj4gR1BHIEtleSBmaW5nZXJwcmludCA9IDAxOTYgQkFEOCAxQ0U5IDE5NzAgRjRCRSDCoDE3NDgg
RTRENCA4OEUzIDBFRUEgQjlENwo+ICJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBk
aWZmZXJlbnQuIgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
