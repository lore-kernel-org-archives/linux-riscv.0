Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F9DC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GJ9aBgv4iMC52PkNf+idwC+qpQWCMTimrJ3T0ONXcAA=; b=NwW5YhMexXjKTpXJjt6aLk8dWd
	fz/c6Kwd1IO9tgBRlAfP7+hk92yzGgzb9YJg9uWv1m3fDjD2NaMut911IQ8hg9dI6qn2bL4KMDITB
	9xANuLb6AtADjp3cArwDEM8WbWXjEe+CmR4h+gB4wWG/2/KFlLAHnRQHSehVAFwzUG1klr89rapSU
	0zuHSztyGJVLG8gzo7+0RwMan3nJ5am+/xJCBevP3oB3y3XEzfXpVIcmFzGttD79RywgpNYC2fZHs
	Qr5+g34Z8jftIHmD7kcTg/TGj+U4jBsaylQh2/b9fQTY/Z+rSiGH8KzOVPIOxxqzX984wuBY96naZ
	5OB6LedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prjSC-004aiI-34;
	Wed, 26 Apr 2023 18:01:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prjS9-004ahH-24
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 18:01:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso5901850b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682532074; x=1685124074;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/AvOGvFjJZtRiTzQkto3Esn+bIc3Zq2R6q57+PVw+Q=;
        b=zQKXmf3WReCtx/hQXD1AMP3N0rPn0mT3owkWbY1kgGkCFXWeiVEBq415SA37Onj3nm
         G3ilcE3q3WzCzPQ4Y5P9Phqb412l44WqRjAAJXRzS8zkdjubFdPVHdIFIABzQ3UYWumG
         JBNwAKQlOMMxB+0W+MnluCQUT4vL/MoTIEsyd+JsYKIt+//ruimak0HJ1yFb+R1V6Jhg
         TxMLTYghRexf19s+RtMbDj+wMXRg28m8VZroqKGJiB/jHVTpOVmBCNLKozi2rcjhucN2
         de8MGHC6SvOLPiOMilXBWztHQ/TwB5gPoeMuoGvIDFTPHdEvfip6+GWk7yQVkr4Kcw/r
         Yt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682532074; x=1685124074;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/AvOGvFjJZtRiTzQkto3Esn+bIc3Zq2R6q57+PVw+Q=;
        b=T0Zdcc1OEolkJA5V+ziPldUZNE+lZYgFTfCCsA3BBz76zBG4culjoQKN74Vln6Oe8w
         vzv09aCAyA2oG+DjhzVQDV3FGKMBmWuTJXOPekyh71brQkV2NOSzZ8L3KYpe4GTLqs4X
         xFhgjcMMyrTCKRtkFS6gTYRNF8DhV0AknoTpCY5bN2RHI1B0vF2BNACNx2E3DdExBwgq
         U6eoZUs+4eb4OqUc+q1R3+N5caec9uP++cIxrsiavlgDgP7Q6U1c4dbAvZkHwsMvu7Rp
         Pi8nSZJtmE5s/v2HyBGqKGXc4+06UKJqQs23bQrvsdCL71XcCrMbbEN24ct7Sbld/AWA
         4NBg==
X-Gm-Message-State: AAQBX9fWJaqBSYTEfp/Nd1ZSDm03wFY25CQGUVjyRYslEcJbz12zUKBt
	m2B3rFls1wn7hBzR2nJg3C6p7w==
X-Google-Smtp-Source: AKy350bmGfldtggaIFTdKiYkcB67Uuzs3JkDTN59pFUhhlPkYTX7BmvCymTKn87B2FoTzvQen+MlUA==
X-Received: by 2002:a05:6a00:2e0d:b0:63b:1708:10aa with SMTP id fc13-20020a056a002e0d00b0063b170810aamr30661317pfb.34.1682532074471;
        Wed, 26 Apr 2023 11:01:14 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t3-20020a056a00138300b006338e0a9728sm11583929pfg.109.2023.04.26.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:01:13 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:01:13 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 11:00:59 PDT (-0700)
Subject: Re: [PATCH v6 00/13] Add OPTPROBES feature on RISCV
In-Reply-To: <14608847-C2F3-4C5A-9801-34DAC933E895@mails.ucas.ac.cn>
CC: bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, rostedt@goodmis.org, mingo@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, liaochang1@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chenguokai17@mails.ucas.ac.cn
Message-ID: <mhng-00aab15d-560a-4d46-b6c7-ab11eb52a7a7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_110117_899370_F0C5EDF5 
X-CRM114-Status: GOOD (  15.87  )
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

T24gTW9uLCAzMCBKYW4gMjAyMyAwNjozODo0MiBQU1QgKC0wODAwKSwgY2hlbmd1b2thaTE3QG1h
aWxzLnVjYXMuYWMuY24gd3JvdGU6Cj4gSGkgQmrDtnJuLAo+Cj4KPgo+PiAyMDIz5bm0MeaciDMw
5pelIDIwOjMx77yMQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g5YaZ6YGT77yaCj4+
Cj4+IENoZW4gR3Vva2FpIDxjaGVuZ3Vva2FpMTdAbWFpbHMudWNhcy5hYy5jbj4gd3JpdGVzOgo+
Pgo+Pj4gQWRkIGp1bXAgb3B0aW1pemF0aW9uIHN1cHBvcnQgZm9yIFJJU0MtVi4KPj4KPj4gSSdk
IGxpa2UgdG8gdGFrZSB0aGUgc2VyaWVzIGZvciBhIHNwaW4sIGJ1dCBJJ20gaGF2aW5nIHRyb3Vi
bGUgYXBwbHlpbmcKPj4gdGhlIHRoZSBwYXRjaGVzOyBXaGF0IGJhc2UgY29tbWl0IGRpZCB5b3Ug
dXNlPyBPciBwb2ludCBtZSB0byBhIGdpdAo+PiByZXBvLgo+Cj4gSSBnZW5lcmF0ZWQgdGhpcyBw
YXRjaCBzZXJpZXMgYmFzZWQgb24gbmV4dC0yMDIzMDEyNyB0YWcKPgo+Pgo+PiAoSXQncyBuaWNl
IHRvIHVzZSAiLS1iYXNlIiB0byBnaXQtZm9ybWF0LXBhdGNoLikKPgo+IEkgd2lsbCB0YWtlIHRo
aXMgcGFyYW1ldGVyIGluIGFueSBmb2xsb3dpbmcgcmV2aXNpb25zLCB0aGFua3MhCgpKdXN0IGNo
ZWNraW5nIHVwIG9uIHRoaXMgb25lLCBpdCdzIGdvdCBzb21lIGZlZWRiYWNrIHRoYXQgc2VlbXMg
CnJlYXNvbmFibGUuICBTb3JyeSBpZiBJIG1pc3NlZCB0aGUgdjcsIGJ1dCBJJ20gZHJvcHBpbmcg
dGhlIHY2IGZyb20gCnBhdGNod29yay4KCklmIHRoZXJlJ3Mgbm8gdjcgb24gdGhlIGxpc3RzIGl0
J3MgcHJvYmFibHkgdG9vIGxhdGUgZm9yIDYuNCwgc28gbm8gCnJ1c2ggb24gbXkgZW5kLgoKVGhh
bmtzIQoKPgo+Pgo+Pgo+PiBUaGFua3MhCj4+IEJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
