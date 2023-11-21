Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E95BC5ACB3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPkkZ6NSUNvxMt/t1NMsUNi9PNEY52ACdBDxjQMdr8A=; b=cj0I4ripLc5UUe
	2UfEhdQsPICbdvmQVT3WydJHyNSE87V+7i/cTc5aTTDd7TJJa8MFaxIi5FG0i9230M7cf6kCbUw1H
	iVxLpHy629O7Pk7RvtT/TrIfkWB2e78/mzAPOklnn2l8BIYGm1g/gy36Ka/3IObVZcS16wMKrMgiB
	DPVBDLvU6PIgkHOcdfR0gURqkNEYSbS1gOAo1HTQjDIcTlSnBbV75FrYZsxVxfumgfsISZ2qc/zuO
	n0Mm/xp9gd+2U1BHIVfemT0bM+U2SjqxlHMxZyNl7KmkQd0b74h2QehuelXfwQT2uhGNX645Y9ort
	aRwPTk++d6rdgQOIo6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5HBz-00FVKE-2U;
	Tue, 21 Nov 2023 03:12:51 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5HBw-00FVJS-0r
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 03:12:49 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6d67d32adc2so3086976a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 19:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700536365; x=1701141165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLfo76KVf6s+SDhWaQ/ZHrMSfJENNMqp3V5sHcC4r0Q=;
        b=JVX/1ohgvuZ8dr96ZeI7UcNWJEmKn2oRCnOGUXzTBIZLK4zneWIQbbFX27Cfi9698F
         ZWuJlJmWOtQ4sxxch6iwxCJqWC/1nvzCfMhaxkMLM/BZBbXWVO6Oy3nAiJTSupzRLDwt
         uDfAxvSi/2afQcxW4+0Yuo8X+1QVjJX8RULEI4bLem7gkgQgCuYMoTyt8bAUuwv+belR
         5RqdARijsL5g1EeVEJwOnjowqMv/KXBMOVaZFY7t2T/+iG8q4Puh+bpJjJMetfNEFpm4
         yn73pa4r/UogjJYLy3tneHCFfiRE8A0N6Ef1rlykLEitR0+/+xLOwV3MbzCOKKlIZCQF
         zNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700536365; x=1701141165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLfo76KVf6s+SDhWaQ/ZHrMSfJENNMqp3V5sHcC4r0Q=;
        b=s8/D32ajJWdNxykA2w2Q6vjovBnU6QhUlmajx3CzXbjJ+FSuW1JTNmnnyRSEJLXKnk
         frKaup3qT2UP82Zd5wRnctoga1coAZZsWGRxjSzT94jgSzwWO4Lk/dqnwijy2ipQGjeU
         wB2LVqkK+swg7vGkEEOeHOuJLP/nKM7vjruwwPck5taQOPWVJqm3CnQuwdGrrmaT3nXu
         b5kivMZ3GZJGh3cmbLcBTTtuJaecSFHQ5PabbsCRO3WaTHgqWOINlmfOaG5ZdvJZsjY2
         19r79fiDkKPsIzWeeJv59Sl+/o4jthJZOESekZAAhhQywOKHkgqJqmJFVEVipJpgxMI8
         +eQw==
X-Gm-Message-State: AOJu0YxaCWNx+TcwEgKTeW/hd+0DkXMId3qbR+lnGUvC0sChc5utmirK
	q2a0lJGQ/gGOwQExvTk/SDBbbSvorMc+rkeV7qiMWQ==
X-Google-Smtp-Source: AGHT+IEauUf6JqsFtXzvp65reSCfRYt7v7O14oXI2cxcZmocJdAyG/CYx4F5ZraC6Se7lqJ+ho9KIrdXozYX1xIzhSk=
X-Received: by 2002:a9d:7a91:0:b0:6d7:d51f:86f3 with SMTP id
 l17-20020a9d7a91000000b006d7d51f86f3mr5481138otn.10.1700536365636; Mon, 20
 Nov 2023 19:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20231102120129.11261-1-yongxuan.wang@sifive.com> <20231114-herald-cried-9122f8bbb218@squawk>
In-Reply-To: <20231114-herald-cried-9122f8bbb218@squawk>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 21 Nov 2023 11:12:35 +0800
Message-ID: <CAMWQL2iUQDqBj=ei-SzKk0=m3W9qA0ftiJM_kbb2ev-YgaQ93A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add Svadu Extension Support
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com, 
	alex@ghiti.fr, conor.dooley@microchip.com, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_191248_305117_59466684 
X-CRM114-Status: GOOD (  12.91  )
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

T24gVHVlLCBOb3YgMTQsIDIwMjMgYXQgMTE6MznigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMDIsIDIwMjMgYXQgMTI6MDE6MjFQTSAr
MDAwMCwgWW9uZy1YdWFuIFdhbmcgd3JvdGU6Cj4gPiBTdmFkdSBpcyBhIFJJU0MtViBleHRlbnNp
b24gZm9yIGhhcmR3YXJlIHVwZGF0aW5nIG9mIFBURSBBL0QgYml0cy4gVGhpcwo+ID4gcGF0Y2gg
c2V0IGFkZHMgc3VwcG9ydCB0byBlbmFibGUgU3ZhZHUgZXh0ZW5zaW9uIGZvciBib3RoIGhvc3Qg
YW5kIGd1ZXN0Cj4gPiBPUy4KPgo+IEZyb20gcGF0Y2ggb25lIG9ud2FyZHMgZm9yIHJ2MzJfZGVm
Y29uZmlnOgo+ICAgL3RtcC90bXAuVFJ3OGdXSFpDZS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaDo2MzY6OTogZXJyb3I6IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAncmlzY3Zf
aGFzX2V4dGVuc2lvbl91bmxpa2VseSc7IElTTyBDOTkgYW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0
IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KPiAgIC90bXAvdG1wLlRSdzhnV0haQ2UvaW5jbHVkZS9saW51eC9zaWduYWwuaDo5
NzoxMTogd2FybmluZzogYXJyYXkgaW5kZXggMyBpcyBwYXN0IHRoZSBlbmQgb2YgdGhlIGFycmF5
ICh0aGF0IGhhcyB0eXBlICd1bnNpZ25lZCBsb25nWzJdJykgWy1XYXJyYXktYm91bmRzXQo+Cj4g
VGhlcmUgc2VlbSB0byBiZSBxdWl0ZSBhIGZldyBvZiB0aGVzZSAtV2FycmF5LWJvdW5kcyBpc3N1
ZXMsIGFsbCBpbgo+IGNvZGUgaW5jbHVkZWQgZnJvbSBzaWduYWwuaC4gQ291bGQgeW91IHBsZWFz
ZSBkbyBhbiBydjMyIGJ1aWxkIGFuZCBmaXgKPiB1cCB0aGVzZSBidWlsZCBpc3N1ZXM/Cj4KPiBU
aGFua3MsCj4gQ29ub3IuCgpIaSBDb25vciwKClN1cmUhIEkgd2lsbCBmaXggaXQgaW4gcGF0Y2gg
djQuIFRoYW5rIHlvdSEKClJlZ2FyZHMsCllvbmctWHVhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
