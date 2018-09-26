Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBA6C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 02:41:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E1FF20833
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 02:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFBvcAcB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR68mwh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E1FF20833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2tA3G8blzYIZD5eqn1xyhbF+6gIGPi7j6qsKSwU9o8=; b=DFBvcAcBLUdo4E
	+nVJ5yEGYkesiuf36bH4x00CDrjqXlnSXAItl8EaVMLdUGUFfVuIXbszEkRi50lgggRI9b1GPZBX5
	DCUb4vcnLXZX1D2f+it5QAc3L7b6zVlGvK8RggGimnynWvCFyYKCDqviorxu8MQwHRbOYUX/E8r96
	JepCTevYBxPIGpVxbnGQqeNf7lfGJ3L8Uf9FG3N5XlVwcKTaf/s6u+/191Ijq0xiz7VALlrO+PXfh
	CmTLqGReQi7pY6cGo0vMeIos6uIWh5KOEI3cvhWL8sr8wz9I7sVIzz9YVN5JfcXahiEWkN28DRmJC
	9ngh3wOC9GnXQgys6Y3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4zlj-0002w8-7M; Wed, 26 Sep 2018 02:41:39 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4zkl-0002MD-H4
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 02:40:51 +0000
Received: by mail-it1-x144.google.com with SMTP id e14-v6so976956itf.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0fVr6k+0xT4506/HxcrTRvbN4wTmpwhjTq9OkiCSL1A=;
 b=MR68mwh0YUZFkxd8gEPCYFydwQ84b4XObKx95PYrGuG9DQcuBZCGpOmCCig4cvJNls
 0v6J6+ZKMIxDCk0GT859wupnjz/pEaoe5IGBYpwP7+I7l42cQK2cznPNN1tploLku0WY
 ZQ199kp0OATM7sTB9FYxyY+twF2Yet/6g80DyvEIkb3hlPydasnm/EsmfhJhf9lt77KY
 CvT0LhCqXcNDsArsMlOiHMcdFOY/XeS9gKgfRhqSMjbNPKS7X2so+v9NpQhT48OoY1mD
 tkDEuquKMGOOI3dectgJqYMd6vuupqj6jDWuu1900M6273aV/NV6V0TsAIRUkFG54Yjr
 4DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0fVr6k+0xT4506/HxcrTRvbN4wTmpwhjTq9OkiCSL1A=;
 b=jtatZk0XVgT0bJrjB3HWQJeAw0vwk2Wk1fpNpezA6/IhmntXGybFHNbG2Qcfn9SeNM
 GzF61lv3dK9BTm0uHTsjozqcKl1XHaM6uhVkc1e/dLBR2O43gVaV5BWjwGqLG9kYvHVn
 BfYnJyOEcEmWucabSphRR9iZbunbLjnRlZmKW/UVZS3DDPg1w29ZV8ZQggIgc6eSs1eu
 EGpUwGL+0VVwXb+e9umgS1NVefuZTsd8BtCs1E6K+ucxjIc+fGxIJyk/zyTFG1JCyFAG
 62WuRUaDW0IQY5t3gah9r5VOSaDhw9Plnqmde+2ad1ikyBO8e/kzJ07L1PJapu9yumox
 6hFQ==
X-Gm-Message-State: ABuFfoiko6GE8JcA5JhD5NM83JVP+0tO+6LfOQsLNwx7KQmYSgETity3
 HXBEdAqrHMESqkLkGSxqKcKLaXBfPaigbMSmN78=
X-Google-Smtp-Source: ACcGV63RlvSg9tuAOK6103JJ2h8Ii1hvG+YsRQj/Kzwz/lyCm4v5ZJO7uwgoqCgaULwDYCMVbQqneWo+Az0FOj6Z0xc=
X-Received: by 2002:a24:5214:: with SMTP id
 d20-v6mr1193105itb.24.1537929614143; 
 Tue, 25 Sep 2018 19:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
 <20180925152508.GA24002@infradead.org>
In-Reply-To: <20180925152508.GA24002@infradead.org>
From: Zong Li <zongbox@gmail.com>
Date: Wed, 26 Sep 2018 10:40:02 +0800
Message-ID:
 <CA+ZOyaiB+eEWUr7J1s4PRB5tYcKQfbTp--hnL7S6H3BtUraizw@mail.gmail.com>
Subject: Re: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_194039_591431_B9D2D659 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong@andestech.com>, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vincent Chen <vincentc@andestech.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926024002.SCu2on_GQedKfXjapU9vdjlpZidZzrV3v0rtqxIXSWM@z>

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiDmlrwgMjAxOOW5tDnmnIgyNeaX
pSDpgLHkuowg5LiL5Y2IMTE6MjXlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgU2VwIDI1LCAyMDE4IGF0
IDEwOjE5OjU1QU0gKzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBUaGUgUlYzMiBuZWVkIHRoZSB1
bW9kZGkzIHRvIGRvIG1vZHVsbyB3aGVuIHRoZSBvcGVyYW5kcyBhcmUgbG9uZyBsb25nCj4gPiB0
eXBlLCBsaWtlIG90aGVyIGxpYnJhcmllcyBpbXBsZW1lbnRhdGlvbiBzdWNoIGFzIHVjbXBkaTIs
IGxzaHJkaTMgYW5kCj4gPiBzbyBvbi4gSSBlbmNvdW50ZXIgdGhlIHVuZGVmaW5lZCByZWZlcmVu
Y2UgJ3Vtb2RkaTMnIHdoZW4gSSB1c2UgdGhlIGluCj4gPiBob3VzZSBkbWEgZHJpdmVyLCBhbHRo
b3VnaCBpdCBpcyBpbiBob3VzZSBkcml2ZXIsIGJ1dCBJIHRoaW5rIHRoYXQKPiA+IHVtb2RkaTMg
aXMgYSBjb21tb24gZnVuY3Rpb24gZm9yIFJWMzIuIFRoZSB1ZGl2bW9kZGk0IGFuZCB1bW9kZGkz
IGFyZQo+ID4gY29waWVzIGZyb20gbGliZ2NjIGluIGdjYy4gVGhlcmUgYXJlIG90aGVyIGZ1bmN0
aW9ucyB1c2UgdGhlCj4gPiB1ZGl2bW9kZGk0IGluIGxpYmdjYywgc28gSSBzZXBhcmF0ZSB0aGUg
dW1vZGRpMyBhbmQgdWRpdm1vZGRpNCBmb3IKPiA+IGZsZXhpYmxlIGV4dGVuc2lvbiBpbiB0aGUg
ZnV0dXJlLgo+Cj4gSSBkb24ndCB0aGluayBsaWJnY2MgaXMgR1BMdjIgbGljZW5zZWQsIGlzIGl0
PyAgQWxzbyBwbGVhc2UgcmV0YWluCj4gdGhlIGNvcHlyaWdodCBub3RpY2VzIGZyb20gbGliZ2Nj
LgoKSSB3aWxsIGdpdmUgbmV4dCB2ZXJzaW9uIHBhdGNoLiBUaGFua3MuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
