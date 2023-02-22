Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A87C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DvYpEYTsquCF+uOyVkBO7nhXh4eA8EhNxWEW6ev3no=; b=ihUlnYh2RuXzY1
	nZpLjfuUAwotpJ7UgiL/4c2E8E6mkoZew1YIYyLChNhg5ur999m0SuEi+BBA0raZgbuMhGRL/4hA7
	s8X21u0GqeG1ysaMSeBfH8yLpgdDtiwNIBDEUiIP1CJSbJrrWW4aLiGqZOqTk9AxuqFrma2sManGA
	q3Xx0f5fgS79zmzAJvdO+e9lVVE9ZeabN7l/CXlH5slo2pCp0fkHLuL3tD7zD17FW5mCu1Hu4/mgt
	LB/qbsh+T8bZboyhZbNM89UEWl4bt45NCYPEPXNxFa4r438uwSz+DpVzBRv+nTe2OuF+jlryoLEWc
	t2bo0t2wlFSogTfscSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmTS-00Bys2-E6; Wed, 22 Feb 2023 10:35:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUm7h-00Bo6P-8l
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 10:13:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id x34so4835533pjj.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMzkfJKl/NL963MsWeYzJQ+qxR9gSumsB1EsPNTZsUM=;
        b=Cr7MLhjegqppzuX0Hgckm6SVOEOERQT+ZlA8UJxCOWmnfsem3dxr6hS2EJnnZroZCW
         /BtnO+UXQpojmcvxXFSoBoXhjYOo4i0SwW8/WgUCgJ//U3H0EthrM5yYdYsIqp9rHv0Z
         1vi9CTNTdmwCxrjTyysNFD2gn7XqHioFY48jyCR58DW6ZNqXObb8+8iVGWNfuy6sred4
         CjqMGQxanaH1pVvS1s2xQQRf4P21pzMLl1KYfzcXVR09t77Y3gw5coGSJtJLzgMFcy2k
         Hy3mgZGx4CXyhrwJT9HZ2nm4QdH3FmV9UGMbDIXLxAtb5WDX3382d433NQY6HK+K6Vdb
         xZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMzkfJKl/NL963MsWeYzJQ+qxR9gSumsB1EsPNTZsUM=;
        b=4a8nm1jKFhmJeyL5d7zwjwcfd4R+xa6lyymae6Wx3qPmamzsKYrqOafh0/Ui7s6meE
         V1Fk4wony443QgMb4DLAtWanUhWcgpl5hbZhKw538lpXeRDvjQc6T9TFB9ZgZvLtRfZt
         NIbwbNKrPNtLxHlHCimnOUC+jFgSPsf/j/5a/8HuXN8ZnCEqLz245IvQiylP4z3LZ8fv
         YATH//Kktf8zR0Ctg3EL30gFJ45+x+8RUCw7liQPz98UXVGt6Gk1uj0+c1h4U3GSia4B
         1J9656eXipFjffusp964Gw009SwbrsKzg99p7qa+xrig3Kb5pA9MNn5/HaakqhdYWe/g
         Vzqg==
X-Gm-Message-State: AO0yUKUpYvYej98Egxjp5+rUO9nKiHOWMw1iEtTyU5UnjlZ1XS+Yvh/f
	MiYtwTbETGw4aGk/pi0yx8EuoMx5RB35UcEZsgM=
X-Google-Smtp-Source: AK7set/wF/+I6/0cuLQuU4fZYbzunk7ayoJP7gNrNOFrdFcnZU4OyY7gi2nKaAMLLfs6MPmcZnjGmhW3CaWCd2bfu9I=
X-Received: by 2002:a17:90b:1803:b0:234:22cc:ee3b with SMTP id
 lw3-20020a17090b180300b0023422ccee3bmr2057351pjb.87.1677060796113; Wed, 22
 Feb 2023 02:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20230222093730.1826523-1-suagrfillet@gmail.com> <Y/Xl2/pfGYq5e89y@wendy>
In-Reply-To: <Y/Xl2/pfGYq5e89y@wendy>
From: Song Shuai <suagrfillet@gmail.com>
Date: Wed, 22 Feb 2023 10:13:04 +0000
Message-ID: <CAAYs2=jvYX2L1uGJs3AWsD6UkmbQ0rCHGsgJXw=7z9HcAvgiFQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] scripts/gdb: add lx_current support for riscv
To: Conor Dooley <conor.dooley@microchip.com>
Cc: jan.kiszka@siemens.com, kbingham@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_021317_385737_B59B4629 
X-CRM114-Status: GOOD (  21.84  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g5LqOMjAyM+W5tDLmnIgy
MuaXpeWRqOS4iSAwOTo1M+WGmemBk++8mgo+Cj4gSGV5IFNvbmcKPgo+IE9uIFdlZCwgRmViIDIy
LCAyMDIzIGF0IDA1OjM3OjMwUE0gKzA4MDAsIFNvbmcgU2h1YWkgd3JvdGU6Cj4gPiBSSVNDLVYg
dXNlcyB0aGUgdHAgcmVnaXN0ZXIgdG8gc2F2ZSB0aGUgY3VycmVudCB0YXNrX3N0cnVjdCBhZGRy
ZXNzCj4gPiBhcyBpdHMgY3VycmVudCgpIGRlZmluZXMuIFNvIGx4X2N1cnJlbnQoKSBvZiByaXNj
diBqdXN0IHJldHVybnMgdGhlCj4gPiBkZXJlZmVyZW5jZSBvZiB0aGUgYWRkcmVzcyBjYXN0IHZp
YSB0YXNrX3B0cl90eXBlLgo+Cj4gRllJLCB0aGVyZSdzIGFscmVhZHkgYmVlbiBzb21lIHBhdGNo
ZXMgcG9zdGVkIGZvciB0aGlzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9taG5nLWJk
Y2Q3NWE1LWU2ZDYtNDA5MC04MjkyLWEzMmViNDZlNDQ2NEBwYWxtZXItcmkteDFjOWEvCj4KRGVl
cGFrJ3MgcGF0Y2ggaXMgbXVjaCBiZXR0ZXIgdGhhbiBtaW5lLCB3aGljaCBhbHNvIHRha2VzIHRo
ZQp1c2Vyc3BhY2UgYW5kIHRyYXAgaGFuZGxlciBpbnRvIGNvdW50LgpTbyBubyBuZWVkIHRvIGNh
cmUgYWJvdXQgdGhpcyBwYXRjaC4KPiBUaGF0IHZlcnNpb24gYWxyZWFkeSBoYXMgcmV2aWV3IGFu
ZCBhY2sgdGFncyBmcm9tIFBhbG1lciBhbmQgb3RoZXJzLgo+IEl0IHNlZW1zIHRvIG1lIHRoYXQg
QW5kcmV3IGlzIHRoZSB1c3VhbCBhcHBsaWVyIG9mIHBhdGNoZXMgZm9yIHRoaXMKPiBzY3JpcHQs
IHNvIEknbSBnb25uYSBhZGQgaGltIHRvIENDIGhlcmUgc28gaGUgaXMgYXdhcmUgLSBidXQgYXMg
aXQgaXMKPiB0aGUgbWlkZGxlIG9mIHRoZSBtZXJnZSB3aW5kb3cgdGhlIGJlc3QgY291cnNlIG9m
IGFjdGlvbiBtaWdodCBqdXN0IGJlCj4gcmVwb3N0aW5nIHRoYXQgcGF0Y2gsIENDaW5nIEFuZHJl
dywgYWZ0ZXIgdjYuMy1yYzEuCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBz
Y3JpcHRzL2dkYi9saW51eC9jcHVzLnB5IHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2RiL2xpbnV4L2NwdXMu
cHkgYi9zY3JpcHRzL2dkYi9saW51eC9jcHVzLnB5Cj4gPiBpbmRleCAxNWZjNDYyNmQyMzYuLjY4
MjVhOTgzNDM5NCAxMDA2NDQKPiA+IC0tLSBhL3NjcmlwdHMvZ2RiL2xpbnV4L2NwdXMucHkKPiA+
ICsrKyBiL3NjcmlwdHMvZ2RiL2xpbnV4L2NwdXMucHkKPiA+IEBAIC0xNzMsNiArMTczLDkgQEAg
ZGVmIGdldF9jdXJyZW50X3Rhc2soY3B1KToKPiA+ICAgICAgICAgICBlbHNlOgo+ID4gICAgICAg
ICAgICAgICByYWlzZSBnZGIuR2RiRXJyb3IoIlNvcnJ5LCBvYnRhaW5pbmcgdGhlIGN1cnJlbnQg
dGFzayBpcyBub3QgYWxsb3dlZCAiCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAid2hpbGUgcnVubmluZyBpbiB1c2Vyc3BhY2UoRUwwKSIpCj4gPiArICAgIGVsaWYgdXRpbHMu
aXNfdGFyZ2V0X2FyY2goInJpc2N2Iik6Cj4gPiArICAgICAgICAgY3VycmVudF90YXNrX2FkZHIg
PSBnZGIucGFyc2VfYW5kX2V2YWwoIiR0cCIpCj4gPiArICAgICAgICAgcmV0dXJuIGN1cnJlbnRf
dGFza19hZGRyLmNhc3QodGFza19wdHJfdHlwZSkuZGVyZWZlcmVuY2UoKQo+ID4gICAgICBlbHNl
Ogo+ID4gICAgICAgICAgcmFpc2UgZ2RiLkdkYkVycm9yKCJTb3JyeSwgb2J0YWluaW5nIHRoZSBj
dXJyZW50IHRhc2sgaXMgbm90IHlldCAiCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InN1cHBvcnRlZCB3aXRoIHRoaXMgYXJjaCIpCj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+ID4KCgoK
LS0gClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
