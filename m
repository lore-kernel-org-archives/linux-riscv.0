Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3419EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpJZbC003KO9uutdTUWdUac3AuZjqFnpMn5OQo26C4I=; b=rn5p90K9x8pA6D
	JJHz5v3OAFz7le9C6OsLGXdH6K2yGs/4EbWq5ZK6XJC2Srj+7l14KwOYRyAaq85Kv/2+NI4akS6GE
	yvW4N8rRSIzQb23SZVDr2bXrt/1uj4s6x9hnN6ClEgn9tFH3F09yrBlWHh/AXIvhJWv3WnNnyWP7+
	RBkoaLZ/OYihq2En7C/WJVQ2N8BOLvTp2NSNYB4CjgG7DUiiFsjfQjfPqh5PiaM8vWHK99SQclbLz
	NEIIQqSoKQyA8TMoYoBBhBdgzh7bwANcYPMIP33uuQtN0F31/s833Vi+6AJJJPQG+UEs5QG7TAZGk
	MY6D+uwzRAjlz5EmyX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXTy-00Bn8t-2L;
	Thu, 20 Jul 2023 17:30:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXTv-00Bn8G-2z
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 17:30:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b895a06484so6941115ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689874225; x=1690479025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jgltx8+AogmPueUJpd1ddvXCoc1LFHFyy2IivtFEuM=;
        b=H7ZOPp6RoPqT7W3PXPM7vGIVlZya6DXsrP6B90e0orSAztWRq7hFyj9YnFrzM9eurj
         gOyeALf31bL4fkfnsd/mssbmc2qNTdZq5fAAQHnXWwHcLlkhwuNJgr5vmPt8I+CysiBB
         kFQnTLadUGn27+HoMEayAIfsPJAsg+rdoFT8xiDfYojFS+yo3RTgpNkdLRSkatLhsjZ0
         mrafv+9VyDbclzhWIwDsbsKDZi+HMalxtGVgmL4Znn3vIK2KrhUSi8NAR39x9jSt1c5q
         WkHlDKqNh9gMoY5fw3wnvfdI4f5mwWfT+EM7YG/63F/vFqAvuxnAp79/BS5Cdo2LgqCa
         quYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689874225; x=1690479025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jgltx8+AogmPueUJpd1ddvXCoc1LFHFyy2IivtFEuM=;
        b=IM9cpkkO4jCdA1LizFhnMmCueY9UsdPWLFwFAVQDWJ+rGlrSokr6Mq6gW0D44a2ttZ
         5P04X1QI5i3L5TSxaKuOyNXl5acx1ckmFeAKi6uf8nnGGX0EFZNQGONF6cB/efUdcRZQ
         K6I3xA/GRncYf46FpSbrWnxqxYFVShxx/4tHQa07+sQbxgM3h9cmRoA26SUuhf3AymBu
         udzYTzvf2vajW8RbOFE5gHKrIFtB4/Ic1rvI4e3XTuYqjoQvJcCRqcSy0Iy3GOaV8spq
         yUjwXswEheBbWfVXw15iFJFGP9K3xgtZz3aESxfOC73+RFuULlW9uWOltu1vMDkJyK7O
         roig==
X-Gm-Message-State: ABy/qLbBgIszMWYujU1+kGVmRuB50lplUluVYtySjjdPjgUPrGdpbmWI
	Gj15H6J/SKIs+LXKFNEockbNf5mcwnNM8kjaU1wKGA==
X-Google-Smtp-Source: APBJJlE+G95QBF6VY00FhWT1XObYtCBMnu+GP3liZNALUzkYUmm8mL+amFnKnovXXWebzCLkWY2Hu5+D3FeScbC5lXY=
X-Received: by 2002:a17:90b:3e8b:b0:267:6c28:17b2 with SMTP id
 rj11-20020a17090b3e8b00b002676c2817b2mr156012pjb.7.1689874224966; Thu, 20 Jul
 2023 10:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <45d32e95-9d57-a424-63bd-b894cf0d3a2b@linux.intel.com>
In-Reply-To: <45d32e95-9d57-a424-63bd-b894cf0d3a2b@linux.intel.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 10:30:14 -0700
Message-ID: <CAH2o1u4q1=cKz7yFxKWrP2goypsxTxusYV_aSD-Os33bDZwepQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu support.
To: Baolu Lu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_103028_182651_DF9933E4 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgNTozMeKAr0FNIEJhb2x1IEx1IDxiYW9sdS5sdUBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy83LzIwIDM6MzMsIFRvbWFzeiBKZXpuYWNo
IHdyb3RlOgo+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvdGxiX3N5bmNfbWFwKHN0cnVj
dCBpb21tdV9kb21haW4gKmlvbW11X2RvbWFpbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlvdmEsIHNpemVfdCBzaXplKQo+ID4gK3sKPiA+
ICsgICAgIHVuc2lnbmVkIGxvbmcgZW5kID0gaW92YSArIHNpemUgLSAxOwo+ID4gKyAgICAgLyoK
PiA+ICsgICAgICAqIEdpdmVuIHdlIGRvbid0IGtub3cgdGhlIHBhZ2Ugc2l6ZSB1c2VkIGJ5IHRo
aXMgcmFuZ2UsIHdlIGFzc3VtZSB0aGUKPiA+ICsgICAgICAqIHNtYWxsZXN0IHBhZ2Ugc2l6ZSB0
byBlbnN1cmUgYWxsIHBvc3NpYmxlIGVudHJpZXMgYXJlIGZsdXNoZWQgZnJvbQo+ID4gKyAgICAg
ICogdGhlIElPQVRDLgo+ID4gKyAgICAgICovCj4gPiArICAgICBzaXplX3QgcGdzaXplID0gUEFH
RV9TSVpFOwo+ID4gKyAgICAgcmlzY3ZfaW9tbXVfZmx1c2hfaW90bGJfcmFuZ2UoaW9tbXVfZG9t
YWluLCAmaW92YSwgJmVuZCwgJnBnc2l6ZSk7Cj4gPiArfQo+Cj4gRG9lcyBSSVNDLVYgSU9NTVUg
cmVxdWlyZSB0byBpbnZhbGlkYXRlIHRoZSBUTEIgY2FjaGUgYWZ0ZXIgbmV3IG1hcHBpbmdzCj4g
YXJlIGNyZWF0ZWQ/Cj4KCk5vLiBPbmx5IG9uIHVubWFwcGluZyAvIHBlcm1pc3Npb24gY2hhbmdl
LgpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LgoKPiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUK
CnJlZ2FyZHMsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
