Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E31C04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 00:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5R8zzcL2QXlj7jluftfo9NqRi8ziyoIW4lSONBkQNWo=; b=1Wk5Bhzss+YVhj
	j4zLIvM2z1uAXs/y0fUhb5CyW7y7vOYPhWdPjmJ9VOZk+7R88hJZiALvIW8mhrU6c2qJGUVWnfEPn
	YhyYMe3IiZPt87X/h0kipiBOiLu2jr0OBOUDg8Oh6V9oG2YVQZtr2sPZ2EfUQvfohld3SW3bJwfT9
	+Pg7ZRiwU4n23fT/aYJE27PdoU5ynkRWu5KfC/jvQz0CckHU31Cx28xy8V9AaGNs8bshUsdwN9xXO
	WT3Ri5k1fwH+mxrWCVoQrhWwcfH52UoDFIuLWxQJ1nDH+x1yQ6jYV7F06baKaULv1kYaWXRWypIa4
	rRjLyT2iDzkj+FQ/XqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQdOt-0003Ll-2E;
	Tue, 01 Aug 2023 00:38:11 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQdOq-0003LM-2U
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 00:38:10 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-486c9cd3b6aso498229e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 17:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690850286; x=1691455086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdYmmXRXkB8A9hlXpUOeNCxACpncud2UiXIMN7+uwMg=;
        b=ZsfhB4Qik9M38h7DpsHfzbBtyfKLsOae/fInlFnh4KWn1KPTAqKqfss8bCClXvf2eP
         LO249W9XeMRCI5ZQDk7iioHmflDkF/8oO1bFlerdykVfrI+fCW0PMPYE/Dq91HeVGH+W
         SJ8cooavwfQ0d4fvfgIX9urh0Uyj4gBWn20qm9Fx6bOLk2QVrMD/W1Pf62wFCpGEO0Hs
         LBfuHJZVJm89jiw9SZ51eJWZ89ZUqExRj8UfmSVDM3MRMK/k2GCFJ0YMN/WbG1nfHgZa
         jXvE5ZphKIIOEXRtUmuopZZ5dxlVSaZ9xZiDu8VqGPvPXdKq3mzGVEhzvbGOE/ppCGvY
         P+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690850286; x=1691455086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdYmmXRXkB8A9hlXpUOeNCxACpncud2UiXIMN7+uwMg=;
        b=XHzk1MNUW/EMgnqaGFLZnLACyJtWF+3kbzxLODjflWo4LU/JYmaEhejBQfsCy7QSix
         UhUj4RiFU+lqsnWux7LZQJp8bL1t7vYss+1teYz1wveQOsvXRNKD9eAqJWQGZSLfSRJa
         QQsRt1ZJ1tV37fqRaxNIjcYLULH17uksg1133/vciE/Az8zG+xsIRon7bg4y8Fhjy1v/
         Almy8EUsSn80kkTFPs7go5dQ8EJQiwfgZDF5SHEmxqbnwZK+u+B4bBE2A/MsPpq7fGf4
         86iItJl4vF5VemlKa5Bkgumb9EP2lx0svMuAfzyGYPYTJpTrrMNKvxqN0EhO5Js5FoM7
         qX5A==
X-Gm-Message-State: ABy/qLa1NCtaUUdzDUqIA/8pkGPkHGiYLW6DuexA2KtBW13vXbEmg1Gz
	/7QVszbztgVOtyVfCr4Ca1FRbUsu/ROgTGczNVn2DQ==
X-Google-Smtp-Source: APBJJlFnersDKJEeFzHE4uX3AEe6xNSZtfoqDenYiRn7lbZF/LiOg7O0b5UFQR20Vrygel0Z6Cgmh72uBhl3+ZselsI=
X-Received: by 2002:a1f:5ec6:0:b0:486:42ab:6a46 with SMTP id
 s189-20020a1f5ec6000000b0048642ab6a46mr1469358vkb.13.1690850286296; Mon, 31
 Jul 2023 17:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0pm+1yXuvUGudwNtvNHWV3FytH4VfCnq7_Ws=t-MZP_kQ@mail.gmail.com>
 <3d4d9b22-8451-f4d5-bbd8-117988f3a545@ics.forth.gr> <CANXhq0puxuHA2cEyb2+TobkoFTc=7MQqtv7DYbuZdvf0T8+iUQ@mail.gmail.com>
 <dc3974f0-500c-b7d3-c8ca-df069dbd02a8@ics.forth.gr>
In-Reply-To: <dc3974f0-500c-b7d3-c8ca-df069dbd02a8@ics.forth.gr>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 1 Aug 2023 08:37:56 +0800
Message-ID: <CANXhq0pz5U2i3V7P2qYnhZf5fpcNUrs4J24in2ffMncK7yx6pw@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_173808_878432_938AC0E0 
X-CRM114-Status: GOOD (  19.62  )
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

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCA3OjM14oCvQU0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGlj
cy5mb3J0aC5ncj4gd3JvdGU6Cj4KPiBPbiA3LzMxLzIzIDE2OjE1LCBab25nIExpIHdyb3RlOgo+
ID4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNTozMuKAr1BNIE5pY2sgS29zc2lmaWRpcyA8bWlj
a0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+ID4+Cj4gPj4gT24gNy8yOS8yMyAxNTo1OCwgWm9uZyBM
aSB3cm90ZToKPiA+Pj4gT24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMzozNOKAr0FNIFRvbWFzeiBK
ZXpuYWNoIDx0amV6bmFjaEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Pj4gKyAgICAgICBpb21t
dS0+Y2FwID0gcmlzY3ZfaW9tbXVfcmVhZHEoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19DQVApOwo+
ID4+Pj4gKwo+ID4+Pj4gKyAgICAgICAvKiBGb3Igbm93IHdlIG9ubHkgc3VwcG9ydCBXU0lzIHVu
dGlsIHdlIGhhdmUgQUlBIHN1cHBvcnQgKi8KPiA+Pj4KPiA+Pj4gSSdtIG5vdCBjb21wbGV0ZWx5
IHVuZGVyc3RhbmQgQUlBIHN1cHBvcnQgaGVyZSwgYmVjYXVzZSBJIHNhdyB0aGUgcGNpCj4gPj4+
IGNhc2UgdXNlcyB0aGUgTVNJLCBhbmQga2VybmVsIHNlZW1zIHRvIGhhdmUgdGhlIEFJQSBpbXBs
ZW1lbnRhdGlvbi4KPiA+Pj4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgaXQ/Cj4gPj4+Cj4g
Pj4KPiA+PiBXaGVuIEkgd3JvdGUgdGhpcyB3ZSBkaWRuJ3QgaGF2ZSBBSUEgaW4gdGhlIGtlcm5l
bCwgYW5kIHdpdGhvdXQgSU1TSUMgd2UKPiA+PiBjYW4ndCBoYXZlIE1TSXMgaW4gdGhlIGhhcnQg
KHdlIGNhbiBzdGlsbCBoYXZlIE1TSXMgaW4gdGhlIFBDSWUgY29udHJvbGxlcikuCj4gPgo+ID4g
VGhhbmtzIGZvciB5b3VyIGNsYXJpZmljYXRpb24sIGRvIHdlIHN1cHBvcnQgdGhlIE1TSSBpbiBu
ZXh0IHZlcnNpb24/Cj4gPgo+Cj4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbiBJT01NVSBpbXBs
ZW1lbnRhdGlvbiBvdXQgdGhlcmUgKGVtdWxhdGVkIG9yIGluCj4gaHcpIHRoYXQgY2FuIGRvIE1T
SXMgYW5kIGlzIG5vdCBhIHBjaWUgZGV2aWNlICh0aGUgUUVNVSBpbXBsZW1lbnRhdGlvbgo+IGlz
IGEgcGNpZSBkZXZpY2UpLiBJZiB3ZSBoYXZlIHNvbWV0aGluZyB0byB0ZXN0IHRoaXMgYWdhaW5z
dCwgYW5kIHdlCj4gYWxzbyBoYXZlIGFuIElNU0lDIGV0Yywgd2UgY2FuIHdvcmsgb24gdGhhdC4K
CkkgZ3Vlc3MgSSBjYW4gYXNzaXN0IHdpdGggdGhhdC4gV2UgaGF2ZSBhbiBJT01NVSBoYXJkd2Fy
ZSAobm9uLXBjaWUKZGV2aWNlKSB0aGF0IGhhcyBhbHJlYWR5IGltcGxlbWVudGVkIHRoZSBNU0kg
ZnVuY3Rpb25hbGl0eSwgYW5kIEkgaGF2ZQpjb25kdWN0ZWQgdGVzdGluZyBvbiBpdC4gUGVyaGFw
cyBsZXQgbWUgYWRkIHRoZSByZWxhdGVkIGltcGxlbWVudGF0aW9uCmhlcmUgYWZ0ZXIgdGhpcyBz
ZXJpZXMgaXMgbWVyZ2VkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
