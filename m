Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC4C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=s5a2U03MkJVqLtvHwH3ThMWj3fTsv9esY7Eam6GoisQ=; b=X0cquNOC2NepleL5pZVTnfxU8X
	k2Powu1TaZYUsF6OhVMoHUoi9/vo+0O1t6F58h1L/4KKVvAHCAjH27oKv0GmtwuzhSUcdAuulyLcx
	PpI9LRvYrjDMBn5xJXcvvEOKYEzb2S13XHP3HfWAc1PC+lQ4nm76ZM5Lei1pWAQ/R2aPeIiJqcMyn
	IRsRO7ULhsPR6+Rtlxcp/XUcGUPzygL711RU7I1+kTZrf50zcA4EXj4FWKLu0VVacfwdXNcPWFqpq
	VoDdzXOM6Vjpe6af1exlNWY1DIqFWHS2hP6wuiRp+PTpQjspSSSd8/mY5sF0oH0p2jbVX7NIil+7N
	YWqGq7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxX4w-00CdFV-1j;
	Fri, 12 May 2023 18:01:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxX4s-00CdEM-1S
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 18:01:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643ac91c51fso6496249b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683914470; x=1686506470;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZurY8vXHDcFG3lomnuGwa9Th7nV7j2iw6HUr38gODtk=;
        b=vHtt9ci3St04ZZOr+gEQeSEy5mhq/rhRTOtX1T+kzcpHlWCA1+iz3BbuqhirFsg6ii
         sMyn0569tAFh8JcyBd+2/DtbLGukQA8IlJCS4ryQsPIOU37FRTfo3lgakMNH73p4bc8/
         yexLh648aEWrLVgaLjZw67933/rzGOsLX+85cgTpwjCxvfnnMhyMwKKPElMpce5G5LZA
         8tCcKvmRjA0dQy4oRkXC+UdFMEP50EVICLxkjLhS7gvjXZJaDosbBR3fbASokRqNKhyq
         5HFLpF5xuTlFr6DjndV/MNlcP33p/+Xnr64VUfKVNrkdWPfkZ8PHIIYzSAVWEYZNdpIE
         gbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683914470; x=1686506470;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZurY8vXHDcFG3lomnuGwa9Th7nV7j2iw6HUr38gODtk=;
        b=ePVXavbQQiUArH3im6MnlE5oib5W298R6AyRVvG8exUTAJXpEA6bby3jjyAPIwM2fq
         WHNCVbnVEpc9jc4aQzxhKUxmg4RJwGTbAw4uatf8kHdq7FE6ocGg97y5vEYiMltMT4UB
         24AJT+eS/eIjXIP5nq2cgazGgQyVVvZsKFTI4miNLCTxF4zC6T88Oh3i0vu0hUwhC5AF
         aEZNTn2+QQZLLSbQo5ChFNnsLe4IUDa6vUnYBiMS8ZELFi7WdC3pg9TSmupsa3pozJAL
         sZekw5w3m8fAKLXP0t3RVE5x6gDQ0K1C6+6f+bajaoHjVZr7/a64rf92ZoPp/KpwIqZJ
         wyUA==
X-Gm-Message-State: AC+VfDw5BHMobsGRzUf35PHCcQ3zKdDpSoNKnEL7QCkbDIWfmhBvXNlQ
	cJca7mRzk7lOtaZn+paGbCdVOw==
X-Google-Smtp-Source: ACHHUZ4x/uTDoBzCxhcEAXA3BDv/D1kaN3kWBr/+lTwvIhR3aqC3/Tj/Huyp9tYh3KnzW7JLYBgsBQ==
X-Received: by 2002:a17:903:11c4:b0:1a9:7365:fc2a with SMTP id q4-20020a17090311c400b001a97365fc2amr33226999plh.26.1683914470398;
        Fri, 12 May 2023 11:01:10 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090270c500b001a641ea111fsm8237394plt.112.2023.05.12.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 11:01:09 -0700 (PDT)
Date: Fri, 12 May 2023 11:01:09 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 11:00:49 PDT (-0700)
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
In-Reply-To: <20230511-occupancy-cleat-06e532e3ea11@spud>
CC: atishp@atishpatra.org, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de, cyy@cyyself.name,
  Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_110114_708027_00A98F71 
X-CRM114-Status: GOOD (  13.68  )
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

T24gVGh1LCAxMSBNYXkgMjAyMyAxNTozODoxMCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDAzOjM0OjI0UE0gLTA3MDAsIEF0aXNoIFBh
dHJhIHdyb3RlOgo+PiBPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAyOjQ34oCvUE0gQ29ub3IgRG9v
bGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4gPiBPbiBUaHUsIE1heSAxMSwgMjAyMyBh
dCAwMjoyNzo0NFBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPgo+PiA+IFRoYXQncyBtb3Jl
IHRoYW4gbGFzdCB5ZWFyIGF0IHRoaXMgcG9pbnQsIGFuZCBub3RoaW5nIGhhcyBjaGFuZ2VkIGlu
IHRoZQo+PiA+IGRvY3VtZW50YXRpb24hIFRhbGsncyBjaGVhcCwgZWhoPwo+PiA+Cj4+IAo+PiBZ
dXAuIEkgd2lsbCBwb2tlIFJWSSBmb2xrcyB0byBjaGVjayBpZiBpdCBzdGlsbCBpcyB0aGUgcGxh
biBvciBjaGFuZ2VkICEhCj4KPiBTb3VuZHMgZ29vZCwgdGhhbmtzIQo+Cj4+IFdlIHdpbGwgbGlr
ZWx5IGhhdmUgYSB2ZW5kb3Igc3BlY2lmaWMgc3RyaW5nIHBhcnNpbmcgbG9naWMuCj4KPiBDb21w
bGljYXRpbmcgdGhlIHBhcnNpbmcgbG9naWMgaXMgdGhlIGV4YWN0IHNvcnQgb2YgY3JhcCB0aGF0
IEkgd2FudAo+IHRvIGF2b2lkLgoKWWEsIEkgdGhpbmsgd2UncmUgcmVhbGxseSBvdmVyY29tcGxp
Y2F0aW5nIHRoaW5ncyB3aXRoIHRoZSBJU0Egc3RyaW5ncy4gIApMZXQncyBqdXN0IGRlcHJlY2F0
ZSB0aGVtIGFuZCBtb3ZlIHRvIHNvbWV0aGluZyB0aGF0IGRvZXNuJ3QgbmVlZCBhbGwgCnRoZSBi
ZXNwb2tlIHN0cmluZyBwYXJzaW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
