Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0DFC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFXKnCOejGQih+WTBLQYrt7tkLz4Ib5jIRcMQ0oovUw=; b=wiSkqkvJTa0tbu
	AeSGUoXls6j8VtL9EASPdTJLW+TC7qUPqpO63MVH3b1+lAgrSCyJ5Hf6CUWjfb+3SfXGjBZmNvTRe
	TxATVQgtAwmNDI8cSxW07znpgy56SX71x6ywwQFaj/XB76incp7w9GuSXXv637FlLdDyvaUXJ5rZt
	liLJQT3qdJE9sSVT6J6lcaT1bH6dCQ2N1SCDwI3tfHags5De2nwkK52wXMu05oNFGc4oXwQtLJmcz
	9NFkhLSu17WfDvFL/0+EMIlNEshOdWfEqkXAid9Jib06Tgh50xN6TSVh/4VsEPFVNp7WhBpo+tCBm
	ad2JrtBB0gye+tMbXYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkN6-0000000Cfek-0WaW;
	Tue, 16 Apr 2024 15:05:20 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkMz-0000000Cfbg-4Ajb
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 15:05:18 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-36a3a4c9d11so140695ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713279907; x=1713884707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApDEEOzWKbr2lAoaPzmlzkmuB1oGm6TlwwUuSX/oB4U=;
        b=Y+NdwHEOMhnKranhDsf50C8FxZKOUGMUFL+0SG/y4Wvu6987+3KDB4YUFVs2Nm+fkH
         gUzTzK736jHwCrhGfv3XmxvBtdUvs7Lz8pXTEYPxBZKprJvKMEaC9Dn1bOh+0oTkd15m
         luIVv4MxTR/yFglS0ENuNOb0sICPidbYIZM6Ry8kKMVAhUfC5idVOL/UWg4wrMlGLCwU
         XL6uk3YXvVmT4V7A8ahYRTGk+159KbMeyF6WTcUdFbnesV85bb9aENxGoVsdB9Vla431
         JGmM4x1Pb6WMwxFTK/EfXEgRk369ppHUIqABdZO3Z0S+SnVKS6iBXCovN9BL+CwmMoeB
         r/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713279907; x=1713884707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApDEEOzWKbr2lAoaPzmlzkmuB1oGm6TlwwUuSX/oB4U=;
        b=RYZGGj6Bo6EYxldhacYOJKZLcYoGWkXadnNsBoRz1fV23F/jcIy24yzdjG2f7UuJUE
         2UVILiKU+mzFA5OWrXjMbEMSj8f8FbnSEkgDPD0Oit5YthfVJryzLRrAZ7E+Jc/79c3C
         tsaPFda8QoTXUcVeR24WpmiU9gDvUXZqx9v0yDed4SjvChVYl4w8lp2w0ljmn6leo0Ue
         OAnBhL4p1hnz/hxpDp8vtFx5DWDKcvua6YO3zNjwpkjIr5uJB+7ZSOPNLShRnp+s9Jns
         kdZlLwGCsXggLAnJWJa+dh+YVHC4V48MoTy/QSYQfsiXwL3lEuZ/DZCkL6PnBX61jfev
         JDZw==
X-Forwarded-Encrypted: i=1; AJvYcCXYLGpJoSRm4expobRdwEh5SHxBrg/SJUDHX9Tp2km13hXHySMOAKosf4l2qFJNxG5mTXYsonrFlP0orPLRufS+GryMAAjkpKVa4IapL7PP
X-Gm-Message-State: AOJu0YzO3D/8flLgfrlBmgXwwOK4O/CBtTAO+o/H/kxCfHE+SVHu1xam
	v6gsn4Z1eA0JNMM3KWJbpMV2KZZD8NkkUmn7Q8qmNEPwoAsYQ21PLMJQnPFxAtfAZDYk/hJip4F
	T5L6a3Xw5aNtpxFlPDGYuLeQfq8mebNgRJGat
X-Google-Smtp-Source: AGHT+IHvWDLJmei1CN4y1/p2zSA/lQX+UTvY0I6sNXRKd7s7bQlKSOTx4dMhC3HH0AIyV6T3oZc3Drm71XkXXTumgbI=
X-Received: by 2002:a92:c5cd:0:b0:36a:fcc9:64ec with SMTP id
 s13-20020a92c5cd000000b0036afcc964ecmr186375ilt.1.1713279907511; Tue, 16 Apr
 2024 08:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240415095532.4930-1-cp0613@linux.alibaba.com>
In-Reply-To: <20240415095532.4930-1-cp0613@linux.alibaba.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Apr 2024 08:04:55 -0700
Message-ID: <CAP-5=fWZSPTtk+UjssH4Mhw11CAP0-jZcZAbCesdqrVCnZbu2Q@mail.gmail.com>
Subject: Re: [PATCH] tools/perf: Fix compiling with libelf on rv32
To: cp0613@linux.alibaba.com
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_080514_074019_E1A72477 
X-CRM114-Status: GOOD (  14.50  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMjo1N+KAr0FNIDxjcDA2MTNAbGludXguYWxpYmFiYS5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4K
Pgo+IFdoZW4gY3Jvc3MtY29tcGlsaW5nIHBlcmYgd2l0aCBsaWJlbGYsIHRoZSBmb2xsb3dpbmcg
ZXJyb3Igb2NjdXJyZWQ6Cj4KPiAgICAgICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSB0ZXN0cy9n
ZW5lbGYuYzoxNDoKPiAgICAgICAgIHRlc3RzLy4uL3V0aWwvZ2VuZWxmLmg6NTA6MjogZXJyb3I6
ICNlcnJvciAidW5zdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlIgo+ICAgICAgICAgNTAgfCAjZXJyb3Ig
InVuc3VwcG9ydGVkIGFyY2hpdGVjdHVyZSIKPiAgICAgICAgICAgICAgICAgfCAgXn5+fn4KPiAg
ICAgICAgIHRlc3RzLy4uL3V0aWwvZ2VuZWxmLmg6NTk6NTogd2FybmluZzogIkdFTl9FTEZfQ0xB
U1MiIGlzIG5vdCBkZWZpbmVkLCBldmFsdWF0ZXMgdG8gMCBbLVd1bmRlZl0KPiAgICAgICAgIDU5
IHwgI2lmIEdFTl9FTEZfQ0xBU1MgPT0gRUxGQ0xBU1M2NAo+Cj4gRml4IHRoaXMgYnkgYWRkaW5n
IEdFTi1FTEYtQVJDSCBhbmQgR0VOLUVMRi1DTEFTUyBkZWZpbml0aW9ucyBmb3IgcnYzMi4KPgo+
IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+CgpSZXZp
ZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLApJYW4KCj4g
LS0tCj4gIHRvb2xzL3BlcmYvdXRpbC9nZW5lbGYuaCB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvZ2VuZWxm
LmggYi90b29scy9wZXJmL3V0aWwvZ2VuZWxmLmgKPiBpbmRleCA1ZjE4ZDIwZWE5MDMuLjRlMmU0
ZjQwZTEzNCAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3V0aWwvZ2VuZWxmLmgKPiArKysgYi90
b29scy9wZXJmL3V0aWwvZ2VuZWxmLmgKPiBAQCAtNDMsNiArNDMsOSBAQCBpbnQgaml0X2FkZF9k
ZWJ1Z19pbmZvKEVsZiAqZSwgdWludDY0X3QgY29kZV9hZGRyLCB2b2lkICpkZWJ1ZywgaW50IG5y
X2RlYnVnX2VudAo+ICAjZWxpZiBkZWZpbmVkKF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxlbiA9PSA2
NAo+ICAjZGVmaW5lIEdFTl9FTEZfQVJDSCAgIEVNX1JJU0NWCj4gICNkZWZpbmUgR0VOX0VMRl9D
TEFTUyAgRUxGQ0xBU1M2NAo+ICsjZWxpZiBkZWZpbmVkKF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxl
biA9PSAzMgo+ICsjZGVmaW5lIEdFTl9FTEZfQVJDSCAgIEVNX1JJU0NWCj4gKyNkZWZpbmUgR0VO
X0VMRl9DTEFTUyAgRUxGQ0xBU1MzMgo+ICAjZWxpZiBkZWZpbmVkKF9fbG9vbmdhcmNoX18pCj4g
ICNkZWZpbmUgR0VOX0VMRl9BUkNIICAgRU1fTE9PTkdBUkNICj4gICNkZWZpbmUgR0VOX0VMRl9D
TEFTUyAgRUxGQ0xBU1M2NAo+IC0tCj4gMi4yNS4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
