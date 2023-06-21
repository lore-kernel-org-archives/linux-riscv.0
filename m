Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE450EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AJgQk8KljtKH3CqG1ltfWfdYqfiF7hEQMCZzHHsYfc=; b=47QfwDP6Si/8d1
	ImqPdqv2IQEfMtmr/0HJl+gpYbKxHfCBZ9xUlKTC0Gl2YYyhK1mTYC3ux5Fhyq4U7m31zkVhPEXGz
	hrILKRMmtK4gAD+AKQVMTnf3z3GliT1BenddNOtEudAEKNoeTQBUnOcONjY5WjpJfpyXgp5ODv116
	/2NBnnEyKItDLAClcWQUO+nzUihy9HZGG/Rbz9sdX7uwS1h1xAraX/AUKEzfBPPtmNQ76Ccrv8sqx
	HyHzGQZG7WBQjVVfIjtdwuepHCUQt1pt+0Pen5hV7Zcsu8P0cB2FQ3L8T8IVIND1BL0cAkyAiNro1
	6s7+KjVH4Z9U1Q6jviGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwug-00EXH1-3A;
	Wed, 21 Jun 2023 12:26:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwue-00EXFx-0V
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 12:26:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f766777605so7782980e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687350373; x=1689942373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAxEtrTul+wf3f8dEFp4/Q7FFB8r2eIvIayoUR9g/ZM=;
        b=b9LUq6j+hdbkpoJSBrNH0/KADs7q3gFnZs7RZQATTyniuD4k3QVf26bF1PdrGuwV0P
         lTg7gDPJSZstw6QFsyoCkJzfwnsn1b+Zq9kqYBTd4VL6/xq4Y38F5E4qA1vEaBMDILLG
         6cHmAWXfVpaWBTjLEtPHyaQlmzjW2SV+5OPlRbzGNWTCcvvm4RcxWUb5sn2f5MleyZHK
         wwGyWvXYK+s1YwRjGQEkgJGgzysXfvKdIX8mWxxoqoSc6MDnq4/+K7OlcbQCzuHWuP9j
         z/W96xQ6YkmZHdhJqtKzZYY/3rS7FMTOeBDPni/AJyW6w2z3sQgR1GcW4TRHYMsn5kt8
         5lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687350373; x=1689942373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAxEtrTul+wf3f8dEFp4/Q7FFB8r2eIvIayoUR9g/ZM=;
        b=RwQ7cUql+anHDwiGCMHOmpduP9lWeK3jYo9tplRaYzqmON3aWigTJJ5+/H0GC045NU
         B0HnsfRq2Ilmgfi4FzSeoHdVpgv3BGz0qkxpcEXUnKxyX1QN5iG/iGWXjuaHcvoiNk03
         868c3B8wRhnjrVbJ4tYl4FvZYZwwSM5CNzWKJ1zmhhVehr/+rlL+d7GNGQHmOJBrCyo+
         vQ/Y1Tm0DG3jWOgoWzckATwvw3xKQTmSWr7EsEYMyiTgRdlEjL/243PwVx6g+NedkZna
         xFjS3PTYaFdkj1PJmQ5i0jD6Ol0OEgnaFqm1iw9M0ItFuv9ToObNDuMp9xqb0AJ4BSay
         QqRQ==
X-Gm-Message-State: AC+VfDwhNzFuk4JGm9pA0U8qZ9YGqlQknxXa/HB7HRHcjhBu6FDmN4uX
	7ACAvKl1qiGjKucM8nwWHuGkG2yEt7EYS7v0qG3k6Q==
X-Google-Smtp-Source: ACHHUZ6N3p22LrxTtwaeVDb6/+PRpFjpQi/CKHQ3GAb3Hnbw6nTuPi9Jwf3ZtTj4jRyW/WLvv7JW+bhhMgB3yrYMB/g=
X-Received: by 2002:a05:6512:b84:b0:4f9:5efd:f459 with SMTP id
 b4-20020a0565120b8400b004f95efdf459mr462871lfv.9.1687350373015; Wed, 21 Jun
 2023 05:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230621072234.9900-1-alexghiti@rivosinc.com> <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-attempt-unstirred-567b0352176a@wendy>
In-Reply-To: <20230621-attempt-unstirred-567b0352176a@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 21 Jun 2023 14:26:02 +0200
Message-ID: <CAHVXubhJXUODDnfRJAzAKcutMvz_amP3wAf+4QBKxXzcd_r7Yg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_052616_196479_2A511124 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Song Shuai <songshuaishuai@tinylab.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMjoxNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFsZXgsCj4KPiBPbiBXZWQsIEp1biAy
MSwgMjAyMyBhdCAwOToyMjozM0FNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBU
aGlzIGRvY3VtZW50IGRlc2NyaWJlcyB0aGUgY29uc3RyYWludHMgYW5kIHJlcXVpcmVtZW50cyBv
ZiB0aGUgZWFybHkKPiA+IGJvb3QgcHJvY2VzcyBpbiBhIFJJU0MtViBrZXJuZWwuCj4KPiBUaGFu
a3MgYSBsb3QgZm9yIHdyaXRpbmcgdGhpcyAmIGltcGxlbWVudGluZyB0aGUgZmVlZGJhY2sgOikK
PiBJIGhhZCBvbmUgb3IgdHdvIG1pbm9yIGNvbW1lbnRzIGFib3V0IHJhdGhlciBsb25nIHNlbnRl
bmNlcywgYnV0IHRoZXJlJ3MKCkFyZiwgc29ycnksIHdoaWNoIG9uZT8gU28gdGhhdCBJIGNhbiBm
aXggdGhhdCBpbiBjYXNlIG9mIGEgdjMuCgo+IGxpdHRsZSBwb2ludCBJIHRoaW5rIGluIHJlc3Bp
bm5pbmcgZm9yIHRoYXQsIHNvIEkgaGF2ZSBpZ25vcmVkIHRoZW0uCj4gT3RoZXIgdGhhbiB0aGF0
LCBkaWRuJ3Qgc3BvdCBhbnl0aGluZyBuZXcgb24gdGhpcyBzZWNvbmQgcmVhZGluZy4KPiBSZXZp
ZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IENo
ZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
