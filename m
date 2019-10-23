Return-Path: <SRS0=37yX=YQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B917CA9EAE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 05:47:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517C921906
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 05:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FB+IxQn/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxgo2Wt/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517C921906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TnmDyxdGyiJGKIukQKJrM9Yef3AGoLkROFF0PttIT4=; b=FB+IxQn/RPa8V3
	zi9zUPPJzi9Sbph4jgMCA4R2dLar069cWz9dGgXKpBdNAM/JlfyyUaNr2shDzYBDWjDyB4BmQ0j10
	7LH6+RBoeGgrRYN2svppAHXT1pxjt2oj7NkhNzz1j9xDNnLmU43YqVJ9kjTmPpa6X7+enMQ0K3HjQ
	Q/5cSuPihPsXtMyGL6BED6yZsJnlYvz0kwhFl5HpXMrV0cxgUd0xu0z+5hrIOmyCmg/AO3OKl6kBg
	JB4VhdqsIqzK8uD9hQ1F+RyBQNBHKHZd9GDw60Rium0Uqc1Me7a2ro7V/bOvH/9yXGn/db92aIYRx
	sC6W6KO4LaxEDINg9BJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iN9UA-00033t-6Z; Wed, 23 Oct 2019 05:47:06 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iN9U7-000330-De
 for linux-riscv@lists.infradead.org; Wed, 23 Oct 2019 05:47:04 +0000
Received: by mail-qt1-x842.google.com with SMTP id u22so30542147qtq.13
 for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2019 22:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f9WOenHv0SsCyblXFz9SFK/8h5V+cleS3WS1obhs2JY=;
 b=gxgo2Wt/VlyBqp8oFAAjLMqC7k6nO1YSO/FNF8dk3j8nQ/EyIVLKI1nKcU4jaQFYuU
 NA+GgyhtaPNe6gPJ70LLC9kx3OcU/3gnBgfGK0MZM9a+5gYDBVXmqoNLVtk0xbQiVFv7
 9DgWISHTNoakaUGNQ5mW2JiN0MB7z/0Nj0axNTWpDRIwxpQi9IqSXpJcM6+kExdpncMd
 C3PeQUmGZQqF+BXLAAtqIxAd9yebkNPNVz/Zc8vGbFjcH30VnzUH6x7eSTxlqUPm2MTT
 wNTBO6b2qK0aD24xtQAV1IKh/FV6VleRo0XzYyJEWFl1ZPi1yEx+gLnXE1tkULKUxz2t
 KvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f9WOenHv0SsCyblXFz9SFK/8h5V+cleS3WS1obhs2JY=;
 b=kn7XMT2u/3dXC0oyx2xzVGMGnFeIEKFp9ylPbSaYZn9+nW6+o8CYcsy6ZKR7h0o6qb
 FyMXlYsYNx7Ux028HF1XbiyhNM0sKI4v0CxASOhfkgtWBnaASoXGiP3yvW8kNAVcLS4n
 85m5EOBbIvuZi9tiCR5gqv+MJgNsZ+9N4PupueSPBq7vMpwIh7Oqy1lBRCksI0TRn9NP
 C90YDDRCiXzRpC8FzRmCN59s1MO8eGcFtUlTxNgz4YYNwwYyS32C24BaEeAZjG7+LkAc
 zUwKt4tnL6b4LkpmyVvuEOVP52gu2Ifx6yAE+DYlyMCfUVpUCcuLHz2RToDDJKRJbLA0
 grCA==
X-Gm-Message-State: APjAAAWACK1+GVdU5wbD0cDrWM4pgPB2UY7Gxtr9LtGTstTcs9Mj3ynP
 accUoaLbhmyjzk4dDcHNd5n219HyDqJdtc2tKC4=
X-Google-Smtp-Source: APXvYqwF3Ej0HdjncpvSi+yzIRxGTr1udcCX4dDn3d3Q9Eb4jGIEwxYSlVQ4eXGb/yYYjy5FM58Xc/XHPIUIPBQLjhU=
X-Received: by 2002:ac8:542:: with SMTP id c2mr7578807qth.338.1571809621155;
 Tue, 22 Oct 2019 22:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191018080841.26712-1-paul.walmsley@sifive.com>
 <20191018080841.26712-6-paul.walmsley@sifive.com>
In-Reply-To: <20191018080841.26712-6-paul.walmsley@sifive.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Wed, 23 Oct 2019 13:46:24 +0800
Message-ID: <CAEbi=3dk0R3HMnqsK1mSm2bewecdHm279f9zEq1pHWLPo9tdAg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] riscv: mark some code and data as file-static
To: Paul Walmsley <paul.walmsley@sifive.com>, Mao Han <han_mao@c-sky.com>, 
 Guo Ren <guoren@kernel.org>, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_224703_461117_F347A876 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

UGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiDmlrwgMjAxOeW5tDEw5pyI
MTnml6Ug6YCx5YWtIOS4i+WNiDM6NTjlr6vpgZPvvJoKPgo+IFNldmVyYWwgZnVuY3Rpb25zIGFu
ZCBhcnJheXMgd2hpY2ggYXJlIG9ubHkgdXNlZCBpbiB0aGUgZmlsZXMgaW4gd2hpY2gKPiB0aGV5
IGFyZSBkZWNsYXJlZCBhcmUgbWlzc2luZyAic3RhdGljIiBxdWFsaWZpZXJzLiAgV2FybmluZ3Mg
Zm9yIHRoZXNlCj4gc3ltYm9scyBhcmUgcmVwb3J0ZWQgYnkgc3BhcnNlOgo+Cj4gYXJjaC9yaXNj
di9rZXJuZWwvc3RhY2t0cmFjZS5jOjIyOjE0OiB3YXJuaW5nOiBzeW1ib2wgJ3dhbGtfc3RhY2tm
cmFtZScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiBhcmNoL3Jpc2N2
L2tlcm5lbC92ZHNvLmM6Mjg6MTg6IHdhcm5pbmc6IHN5bWJvbCAndmRzb19kYXRhJyB3YXMgbm90
IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IGFyY2gvcmlzY3YvbW0vaW5pdC5jOjQy
OjY6IHdhcm5pbmc6IHN5bWJvbCAnc2V0dXBfemVyb19wYWdlJyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUgc3RhdGljPwo+IGFyY2gvcmlzY3YvbW0vaW5pdC5jOjE1Mjo3OiB3YXJuaW5n
OiBzeW1ib2wgJ2ZpeG1hcF9wdGUnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0
aWM/Cj4gYXJjaC9yaXNjdi9tbS9pbml0LmM6MjExOjc6IHdhcm5pbmc6IHN5bWJvbCAndHJhbXBv
bGluZV9wbWQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gYXJjaC9y
aXNjdi9tbS9pbml0LmM6MjEyOjc6IHdhcm5pbmc6IHN5bWJvbCAnZml4bWFwX3BtZCcgd2FzIG5v
dCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiBhcmNoL3Jpc2N2L21tL2luaXQuYzoy
MTk6Nzogd2FybmluZzogc3ltYm9sICdlYXJseV9wbWQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/Cj4gYXJjaC9yaXNjdi9tbS9zaWZpdmVfbDJfY2FjaGUuYzoxNDU6MTI6
IHdhcm5pbmc6IHN5bWJvbCAnc2lmaXZlX2wyX2luaXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/Cj4KPiBSZXNvbHZlIHRoZXNlIHdhcm5pbmdzIGJ5IG1hcmtpbmcgdGhl
bSBhcyBzdGF0aWMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyAg
fCAgNiArKysrLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jICAgICAgICB8ICAyICstCj4g
IGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0KPiAgYXJj
aC9yaXNjdi9tbS9zaWZpdmVfbDJfY2FjaGUuYyB8ICAyICstCj4gIDQgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMK
PiBpbmRleCAwOTQwNjgxZDJmNjguLmZkOTA4YmFlZDUxYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3Ry
YWNlLmMKPiBAQCAtMTksOCArMTksMTAgQEAgc3RydWN0IHN0YWNrZnJhbWUgewo+ICAgICAgICAg
dW5zaWduZWQgbG9uZyByYTsKPiAgfTsKPgo+IC12b2lkIG5vdHJhY2Ugd2Fsa19zdGFja2ZyYW1l
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib29sICgqZm4pKHVuc2lnbmVkIGxvbmcsIHZvaWQgKiks
IHZvaWQgKmFyZykKPiArc3RhdGljIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0
IHRhc2tfc3RydWN0ICp0YXNrLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgKCpmbikodW5zaWduZWQgbG9uZywgdm9pZCAqKSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICphcmcpCgpJIHRoaW5rIHdhbGtfc3RhY2tmcmFtZSgp
IGNvdWxkIG5vdCBiZSBzdGF0aWMgYmVjYXVzZSBpdCB3aWxsIGJlIHVzZWQKaW4gcGVyZl9jYWxs
Y2hhaW4uYy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
