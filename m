Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A0DC25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8j0c9Nf9FBEUAJdNF1c0ukMwYW0s3FZPv8nYk9dFT4=; b=JPkHTxdaBXmmOS
	j25S5cvV+lAle3TJROyche/QJAPgPep8+Jt8TOaq2BM73+qUMbx0BvkLwCvOiXnrmjIV9LPOLC24s
	NLc2CIx9zIhO5KC4L29q0jCFEScBlRX3zS/NpuJT5cliE28sCJUMbRpqK/yqEJkr5g3aww5rq2e7b
	w6iBhib9+JlHhrLGKsUNgAi16kI1LgytnaN5agAoMSpRQfHcLsaex9chAh7XiUB6m2VIPeNuDQpM2
	pirOk26m45NdiPMn1baQKhSA44DHNpC+0HH86x4O1NwxInFiob1jOTshNvJGMYCuprbhgyXZnsnA9
	R5m8fVVT+6n7/zzqnlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF6vG-00000008a4k-0DhA;
	Thu, 06 Jun 2024 06:48:30 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF6vC-00000008a2x-1GVf
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 06:48:28 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-250ac3acc6dso262611fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717656500; x=1718261300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vilLytCpZB8nt5wILPrH9W0JpiXVzx6FOQqaxS4d2XI=;
        b=jD5+Q9qNIx4cqdgN+gGxDkefOhG+FdKbTsZa+BEyO0v8/1P/nFfBR7njtmIj3NiM52
         mMmBWYQH9t/UtfHSU/GBGohvI3II5CaJCOQ4UEHMxyhE9pa4Z3LFt9ZhX5G2Yyb5/3lk
         XhKSz1czvPiFTfNpgSxIPsWicuat5UFnwMV6irVwrHnUZQHrPm1qElUCQuWk6xFbAMe0
         hIJ/cP4y3p+XbLzNDc4CThbKq6tUjLcwufNvrb4Wt3ScOw6/w2MuTfuCNPjlLHjhO6Il
         RuBA0do4aDQrutPMOunLUA6TYrWZgPdjZleOYRZ14YEas2ue5K7S7pmUbmZ+knavwIvz
         ukJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656500; x=1718261300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vilLytCpZB8nt5wILPrH9W0JpiXVzx6FOQqaxS4d2XI=;
        b=bjjXwM1jFXOEd64NPW9Cc1/7sqC57hDbIKfSoRjDk6rtSrtbOcHDKvyS4hIdMKDdQs
         8MSJ8/LfreVEhhK+qRkLfyVOx4u4zp3VuNo80+WGInPi0h4tUReY1Bbh+gQajHjivnnk
         SxAlV9ISlRmWM+Rw8nnGXkUrc3Gf5OPwvFcUV45hYRkFhwx249Uh+3eXli1mUWb/dhX2
         rexbqWHWfgaKSgz4+BH26k9WHGArKqIQTApfXBOWaUfAy7kDHNpSAYeREbBiMC3WNLi3
         ZxWQf/Bk1ZGWGToyV7HAC+138joQUvoWJMT+WF0aMCOL2SKwwn/h/9Ss4+qsmyjoYRvi
         YcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoATfPJkkPspbQqBPZw6mzAojhmLxucwecU7jtfEfvRXcvglONRFjd1TwxYQa+NsvciQdJQ9Gy4jJ0y1I79BJ/H+mIh2lLezx5t6U1PPoZ
X-Gm-Message-State: AOJu0YzCuiW9f/iQiMEejU2LJ7T+AJEdBraEUanw8lMTzFE7v9cjdG/k
	Jw78ZRbIbtNdG8uoT9lTkdpvQEztl19umOX/eL9bfhfXlzNcOxX8bZ/WJzMRJ7TJCrw625DdTWr
	5uOn8s9r6lbtLha3KSOp3pMuDGWJTuhEI4uK5xg==
X-Google-Smtp-Source: AGHT+IE9l1hb0fFNXM4TPj/1zk1+1sZkZrVriFNUDmWKzdih+CtOnkmEdNr0xFuAptlVFLMK5CzKhMf9J7ne5mRr3iw=
X-Received: by 2002:a05:6871:e015:b0:24f:d159:ea2 with SMTP id
 586e51a60fabf-25121e60d1dmr5176728fac.28.1717656500045; Wed, 05 Jun 2024
 23:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240531100407.282-1-dqfext@gmail.com>
In-Reply-To: <20240531100407.282-1-dqfext@gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 6 Jun 2024 14:48:09 +0800
Message-ID: <CAEEQ3wkKxt-p1339EbXt-1nF_GvMmgYMio3OBHZSNke1kJc5sQ@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: Implement ioremap_wc/wt
To: Qingfang Deng <dqfext@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>, Eric Chan <ericchancf@google.com>, 
	Andrea Parri <parri.andrea@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_234826_367579_99396DE3 
X-CRM114-Status: GOOD (  13.45  )
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

IEhpIFFpbmdmYW5nLAoKCk9uIEZyaSwgTWF5IDMxLCAyMDI0IGF0IDY6MDTigK9QTSBRaW5nZmFu
ZyBEZW5nIDxkcWZleHRAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFFpbmdmYW5nIERlbmcg
PHFpbmdmYW5nLmRlbmdAc2lmbG93ZXIuY29tLmNuPgo+Cj4gQ3VycmVudGx5IG9uIFJJU0MtViwg
aW9yZW1hcF93Yy93dCB1c2VzIHRoZSBkZWZhdWx0IGlvcmVtYXAKPiBpbXBsZW1lbnRhdGlvbiwg
d2hpY2ggbWFwcyB0aGUgbWVtb3J5IGFzIHN0cm9uZ2x5LW9yZGVyZWQgbm9uLWNhY2hlYWJsZQo+
IElPIG1lbW9yeSBvbiBzeXN0ZW1zIHdpdGggU3ZwYm10Lgo+Cj4gVG8gaW1wcm92ZSBwZXJmb3Jt
YW5jZSwgbWFwIHRoZSBtZW1vcnkgYXMgd2Vha2x5LW9yZGVyZWQgbm9uLWNhY2hlYWJsZQo+IG5v
cm1hbCBtZW1vcnkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaW5nZmFuZyBEZW5nIDxxaW5nZmFuZy5k
ZW5nQHNpZmxvd2VyLmNvbS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pby5o
IHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pby5oCj4gaW5kZXggMWM1YzY0MTA3NWQyLi41ODI1MDNlMGY1MDggMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pby5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pby5oCj4gQEAgLTEzMyw2ICsxMzMsMTQgQEAgX19pb193cml0ZXNfb3V0cyhvdXRzLCB1
NjQsIHEsIF9faW9fcGJyKCksIF9faW9fcGF3KCkpCj4gICNkZWZpbmUgb3V0c3EoYWRkciwgYnVm
ZmVyLCBjb3VudCkgX19vdXRzcShQQ0lfSU9CQVNFICsgKGFkZHIpLCBidWZmZXIsIGNvdW50KQo+
ICAjZW5kaWYKPgo+ICsjaWZkZWYgQ09ORklHX01NVQo+ICsjZGVmaW5lIGlvcmVtYXBfd2MoYWRk
ciwgc2l6ZSkgXAo+ICsgICAgICAgaW9yZW1hcF9wcm90KChhZGRyKSwgKHNpemUpLCBcCj4gKyAg
ICAgICAgICAgICAgICAgICAgKF9QQUdFX0tFUk5FTCAmIH5fUEFHRV9NVE1BU0spIHwgX1BBR0Vf
Tk9DQUNIRSkKCj4gKwo+ICsjZGVmaW5lIGlvcmVtYXBfd3QgaW9yZW1hcF93Ywo+ICsjZW5kaWYK
PiArCj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9pby5oPgo+Cj4gICNpZmRlZiBDT05GSUdfTU1V
Cj4gLS0KPiAyLjM0LjEKPgo+CgpDYW4geW91IHByb3ZpZGUgc3BlY2lmaWMgdGVzdCBkYXRhIGZv
ciBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudD8KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
