Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548C3C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56SEJ/R+ReeBzB5ccAaK60AYWoNlnLLS+4lv+ZYwFSQ=; b=FTCoHYIjIQEPYc
	comdy53iBUgVdw8bNYiodaF1WK0bGI4WZz4vSoonkCYaOi13pdgc4jvylcFVtJdRWbyzyMSY+ngrl
	dGYkYzhbYgeckxpih14Ovsie8avnhv5ekxfCpXCOdt/uWoP4/fDWcKHOr3QmeUBPJvfQSpxN52sRE
	T62K2/wcfM9xB+Ze/C17q9F1gXmE2uChjui7l3e9gaawdgs6hYEPiE9m+/CSpaQ1GF+OHtXLaBo7O
	1LyDh7QRdc5qT+/9cI+nx0qiaNaxGzc74a+6yaYx3Zu+ZAhTyxZxjRyZxmlgHgut+8WT1bpQFDcLD
	I1e9cuLVOzUNFVCe0Byw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZET-00000006DHd-1aYZ;
	Thu, 01 Aug 2024 17:04:53 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZEQ-00000006DGy-1wAb
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 17:04:51 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3993fddea13so338825ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722531888; x=1723136688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVP6X4cx5hMdpcYhPLBw8mfjUpF4ioKmAFgeCcQFeW8=;
        b=I2kPGpI96VYGy57fGzd7uGXUdBotYHCYltsLPQDkZNVhDGguCJKSFVXrM0Ff2GgUdb
         lW+h/r/aQT66gyXWJNv8aQ7Jyru6Et5YS9FMDjBxTDSFWRhFXfPb5LbgofyLCKaH37ID
         92sdR47pqNqnmfEhEx55O7jUZ9BlSOwjyxubDU4H5mLPPGTnK0ndVF5249OBuefsg00b
         TiySdC0FziNv1nKkYgWBFztMLmEWcy2IwArbQwJWKQ0x9ervKrzQfw1Ln7tZ5miK9nB8
         dNKHKtn12KqPFUDaWB+irYYvhGVUJdfRbA99k2zvOWUk02W9kJ3PzIUFUp61EGHLwVoR
         pBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722531888; x=1723136688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVP6X4cx5hMdpcYhPLBw8mfjUpF4ioKmAFgeCcQFeW8=;
        b=TXomqEH6jUTKT4eT2qRE+FxPyNGqno5rImoOp81XTbXo1nrvAzGb+j7X9OWvjuNurJ
         CmIay+b5EgudQE9WS1jy8fq3xMtvJyfc+gMuoy3lOYiw8kwRgKYfVlWiU0xnIBHy7wjp
         6s9vcCNhSAwJMdxBv46i0xashMMdeUvvBYbYxZO7QS6quZ62dJiCi/+WTNQTQYzub18T
         ttA10Z03jlgeRizo8AW9+ir8NheMjg1jXmM0qMi6qoAk1KA1EsamDMd8e/i12/B+aagf
         VqhiAXuWRPk9r5pJyn+XFHShjlhuzLFfHQUUV7+U68rM/xTKbEj/VjE2a3mvfVDRyWNp
         tG6w==
X-Forwarded-Encrypted: i=1; AJvYcCUrtZHIQrjtqmX6whMvopGrCLgmdaYQMXpGiEdIuGYOMq+MXvFCds8xZRdGm1FAkM4FFve03GvmAaoktF4D/3BUexEefOFM1iPSq+vaxdic
X-Gm-Message-State: AOJu0Yzxs5oIyKcSlejLitBcgSKLxsAx1DHwj4M6HYOfMqG6yQAgHFM9
	SPsrtEp1FL73D20Ez1jn4oIYwmHlSXr1A8eksyuI4QBFpmiQtDhMykElsP5ccKkcefC9TFEUvK8
	xPdSa+5YLFhRlbxrT08fyUsZW3veRWBEczy7R
X-Google-Smtp-Source: AGHT+IEAAn0hKKVbU81NKzLk+DGvI/SWRloDwlMO36XLGrZTlziqtRQpW9ug1eZbl5h79og4+RS6qkPngb9XdfFqovg=
X-Received: by 2002:a05:6e02:164d:b0:374:a294:58bf with SMTP id
 e9e14a558f8ab-39b199e49b0mr3466655ab.10.1722531888158; Thu, 01 Aug 2024
 10:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240719115018.27356-1-eric.lin@sifive.com> <172253043753.13740.1828763400860823722.git-patchwork-notify@kernel.org>
In-Reply-To: <172253043753.13740.1828763400860823722.git-patchwork-notify@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Aug 2024 10:04:36 -0700
Message-ID: <CAP-5=fV3NXkKsCP1WH0_qLRNpL+WuP8S3h1=cHaUMH5MFkVHQg@mail.gmail.com>
Subject: Re: [PATCH v2] perf arch events: Fix duplicate RISC-V SBI firmware
 event name
To: acme@kernel.org, namhyung@kernel.org
Cc: Eric Lin <eric.lin@sifive.com>, peterz@infradead.org, mingo@redhat.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, peterlin@andestech.com, dminus@andestech.com, 
	locus84@andestech.com, jisheng.teoh@starfivetech.com, inochiama@outlook.com, 
	n.shubin@yadro.com, linux-kernel@vger.kernel.org, samuel.holland@sifive.com, 
	patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_100450_506690_5521554F 
X-CRM114-Status: GOOD (  13.98  )
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

T24gVGh1LCBBdWcgMSwgMjAyNCBhdCA5OjQw4oCvQU0gPHBhdGNod29yay1ib3QrbGludXgtcmlz
Y3ZAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbzoKPgo+IFRoaXMgcGF0Y2ggd2FzIGFwcGxp
ZWQgdG8gcmlzY3YvbGludXguZ2l0IChmaXhlcykKPiBieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT46Cj4KPiBPbiBGcmksIDE5IEp1bCAyMDI0IDE5OjUwOjE4ICswODAwIHlv
dSB3cm90ZToKPiA+IEN1cnJlbnRseSwgdGhlIFJJU0MtViBmaXJtd2FyZSBKU09OIGZpbGUgaGFz
IGR1cGxpY2F0ZSBldmVudCBuYW1lCj4gPiAiRldfU0ZFTkNFX1ZNQV9SRUNFSVZFRCIuIEFjY29y
ZGluZyB0byB0aGUgUklTQy1WIFNCSSBQTVUgZXh0ZW5zaW9uWzFdLAo+ID4gdGhlIGV2ZW50IG5h
bWUgc2hvdWxkIGJlICJGV19TRkVOQ0VfVk1BX0FTSURfU0VOVCIuCj4gPgo+ID4gQmVmb3JlIHRo
aXMgcGF0Y2g6Cj4gPiAkIHBlcmYgbGlzdAo+ID4KPiA+IFsuLi5dCj4KPiBIZXJlIGlzIHRoZSBz
dW1tYXJ5IHdpdGggbGlua3M6Cj4gICAtIFt2Ml0gcGVyZiBhcmNoIGV2ZW50czogRml4IGR1cGxp
Y2F0ZSBSSVNDLVYgU0JJIGZpcm13YXJlIGV2ZW50IG5hbWUKPiAgICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9yaXNjdi9jLzYzYmE1YjBmYjRmNQo+Cj4gWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5
b3UhCgpGd2l3LCBhcyB0aGlzIGNoYW5nZSBpcyBpbiB0b29scy9wZXJmL3BtdS1ldmVudHMgSSB3
YXMgZXhwZWN0aW5nIGl0IHRvCmdvIHRocm91Z2ggdGhlIHBlcmYtdG9vbHMvcGVyZi10b29scy1u
ZXh0IHRyZWUuCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
