Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC2E748E9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkZhGCgqYcv/tit3eVxro28aq1QUYviX9Bpd5tL5LAw=; b=lxedFP6NmS5qVu
	7PoKMhdzCS4vvILcosWnw0VwNLRGDIl9hLKMdO6cM9ij1jdyFc7JNSyHCPwLRTSNyBXchanqZyrKV
	sCE7jhyOjGEjTxPYnGUwdyN81ImrHaf6WLQXtCgQ4ptvB0+tLbxDKvzZImyspCp18LIi+QaNFzX5W
	9FzyGNEqkCnFsSNCtdd9pP4J/diOYAdv67Z/cvXexEQkx3nsNmjJuUVyqCSU3saDXuHyjjMA6QtQJ
	bq8fZySgE5MEKdjjziVqKDyb5e3kQK5FME4h7C6c097kEinttybGHd+1cAfXEJyZyrVICYg0vCeQY
	i2pK0aPpZIujhbzre32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmyEm-00BItG-0f;
	Sun, 01 Oct 2023 15:20:04 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmyEj-00BIrH-19
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 15:20:02 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4935f87ca26so6251787e0c.3
        for <linux-riscv@lists.infradead.org>; Sun, 01 Oct 2023 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696173599; x=1696778399; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlqqAdUK9+XiZ3vr9zfHOEKY61BQKj01sr184YRw5U0=;
        b=WP8FV39fdDj54SqzEd5hYh4nA0xWcWPhVfhMunGMNcaTo4Z/utzfMs29ZL7aDUdwBN
         bC8ImGDIsjpObYSgb711trL3ejuAgxWgOd4atGQky9KL14fKkR/lxmQ245syjp+eXg+4
         9AchLX0urXsG3A5eAG1etnutrSKu4Ua/oZIoU86l4+4BbUqpibPERojxBxKEaHTuBlRs
         hkOMTJ0V2eXkM2GxJV+m1dRnjqpcxCKruPrCPFGbzLFQPMagarxx3jm0ZcpYcpHdmSor
         BNFSidodMuUmXKVF+wJrO7XU8F6S71c3L4Yb9rpR80CwG0xZ9SN4IOB+vy6+QIcqmc22
         OxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696173599; x=1696778399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlqqAdUK9+XiZ3vr9zfHOEKY61BQKj01sr184YRw5U0=;
        b=nL1BYPKVJiGjqsWuW4dwglD4ESEqnFcNisxxFk8DCh90kYijXbIJGflf0Ve0zx5/u8
         LbPq3dARvunIV/ksUVxkP0o5j4tBiKwcZtPpB9N5U11yLl8U7Z7C+vdevYpW45YD+npk
         rbNuzxBCAZ/iIpYd2Bmw8Qp5stjJun0MP8NPTuWOCqLI6CFnzwvI4yBb06w5JPdI7TiH
         4Z7TgRs3foawB5TR3AWfew34u1Xf5Eir5e28Ow5sSf3jRrGqwbVqHDQzHrA4f6Xo9V9u
         w01HvBOLo50eu30d6ENbli/nSoLQBdPXmSEtt9akNCspdhDFjx2sl7vvgvipAqLU1vxN
         iGyQ==
X-Gm-Message-State: AOJu0YyGOskVSlG61+0LbSiyaV5Js7GMzPLzEkXIlV4bmL9LnVcRwdwF
	+ZJ8oJ88EDf7jAIfdjvMvF9xr0SJFUU9RPB0pZ4=
X-Google-Smtp-Source: AGHT+IE4j3gWxMSOq6OvgLxoyzhdOUwDwvHxGddLU/JkAl6FbHrfp+/DN0/951hZIUWzbtcBLYlLKbL/bWmW7iCfKG8=
X-Received: by 2002:a1f:c5c7:0:b0:49a:6dc0:5a89 with SMTP id
 v190-20020a1fc5c7000000b0049a6dc05a89mr6121125vkf.5.1696173598711; Sun, 01
 Oct 2023 08:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com> <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
 <20230930-emporium-share-2bbdf7074e54@spud> <202309301400.4E1AD87@keescook>
In-Reply-To: <202309301400.4E1AD87@keescook>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Sun, 1 Oct 2023 16:19:47 +0100
Message-ID: <CAKbZUD08W9_HB9F7tQqwreYvVapgVMOkS3QokzwHPcBnFnVMig@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
To: Kees Cook <keescook@chromium.org>
Cc: Conor Dooley <conor@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_082001_445014_A43684AA 
X-CRM114-Status: GOOD (  22.58  )
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

T24gU3VuLCBPY3QgMSwgMjAyMyBhdCAyOjUx4oCvQU0gS2VlcyBDb29rIDxrZWVzY29va0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTA6MDI6MzVBTSAr
MDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMDM6
NTI6MjJQTSAtMDcwMCwgU2FtaSBUb2x2YW5lbiB3cm90ZToKPiA+ID4gT24gRnJpLCBTZXAgMjks
IDIwMjMgYXQgMjo1NOKAr1BNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDA5OjExOjU4UE0gKzAw
MDAsIFNhbWkgVG9sdmFuZW4gd3JvdGU6Cj4gPiA+ID4gPiBBUkNIX01NQVBfUk5EX0JJVFNfTUFY
IGlzIGJhc2VkIG9uIFN2MzksIHdoaWNoIGxlYXZlcyBhIGZldwo+ID4gPiA+ID4gcG90ZW50aWFs
IGJpdHMgb2YgbW1hcCByYW5kb21uZXNzIG9uIHRoZSB0YWJsZSBpZiB3ZSBlbmQgdXAgZW5hYmxp
bmcKPiA+ID4gPiA+IDQvNS1sZXZlbCBwYWdpbmcuIFVwZGF0ZSBtbWFwX3JuZF9iaXRzX21heCB0
byB0YWtlIHRoZSBmaW5hbCBhZGRyZXNzCj4gPiA+ID4gPiBzcGFjZSBzaXplIGludG8gYWNjb3Vu
dC4gVGhpcyBpbmNyZWFzZXMgbW1hcF9ybmRfYml0c19tYXggZnJvbSAyNCB0bwo+ID4gPiA+ID4g
MzMgd2l0aCBTdjQ4LzU3Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNhbWkg
VG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29nbGUuY29tPgo+ID4gPiA+Cj4gPiA+ID4gSSBsaWtl
IHRoaXMuIElzIFJJU0NWIHRoZSBvbmx5IGFyY2ggd2hlcmUgdGhlIHBhZ2luZyBsZXZlbCBjYW4g
YmUgY2hvc2VuCj4gPiA+ID4gYXQgYm9vdCB0aW1lPwo+ID4gPgo+ID4gPiBJIGhhdmVuJ3Qgc2Vl
biB0aGlzIGVsc2V3aGVyZSwgYnV0IEkgYWxzbyBoYXZlbid0IGxvb2tlZCBhdCBhbGwgdGhlCj4g
PiA+IG90aGVyIGFyY2hpdGVjdHVyZXMgdGhhdCBjbG9zZWx5LiBhcm02NCBkb2VzIHNvbWV0aGlu
ZyBpbnRlcmVzdGluZwo+ID4gPiB3aXRoIEFSTTY0X1ZBX0JJVFNfNTIsIGJ1dCBJIHRoaW5rIHdl
IGNhbiBzdGlsbCBoYW5kbGUgdGhhdCBpbgo+ID4gPiBLY29uZmlnLgo+ID4KPiA+IEFGQUlVLCB4
ODYtNjQgY2FuIGRvIHRoaXMgYWxzbzoKPiA+Cj4gPiAgICAgICBubzRsdmwgICAgICAgICAgW1JJ
U0NWXSBEaXNhYmxlIDQtbGV2ZWwgYW5kIDUtbGV2ZWwgcGFnaW5nIG1vZGVzLiBGb3JjZXMKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWwgdG8gdXNlIDMtbGV2ZWwgcGFnaW5nIGluc3Rl
YWQuCj4gPgo+ID4gICAgICAgbm81bHZsICAgICAgICAgIFtYODYtNjQsUklTQ1ZdIERpc2FibGUg
NS1sZXZlbCBwYWdpbmcgbW9kZS4gRm9yY2VzCj4gPiAgICAgICAgICAgICAgICAgICAgICAga2Vy
bmVsIHRvIHVzZSA0LWxldmVsIHBhZ2luZyBpbnN0ZWFkLgo+Cj4gQWgtaGEhIE9rYXksIHdlbGws
IHRoZW4gbGV0J3MgdHJhY2sgdGhpcyBpZGVhOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xp
bnV4L2lzc3Vlcy8zNDYKCihSZXBseWluZyBoZXJlIGZvciB2aXNpYmlsaXR5LCB0ZWxsIG1lIGlm
IHlvdSB3YW50IHRvIG1vdmUgdGhpcwpkaXNjdXNzaW9uIHRvIGdpdGh1YikKCkFJVUksIHg4NiBj
YW5ub3QgZG8gdGhpcyBmb3IgY29tcGF0IHJlYXNvbnMuIEV2ZW4gaWYgeW91IGVuYWJsZSBMQTU3
LAptbWFwIG9ubHkgZ2l2ZXMgeW91IDwgNDgtYml0IGFkZHJlc3NlcywgZm9yIGNvbXBhdGliaWxp
dHkgd2l0aCB0aGluZ3MKbGlrZSBKSVRzLCBldGMgdGhhdCBzdGFzaCBpbmZvcm1hdGlvbiBpbiB0
aGUgdXBwZXIgMTYgYml0cy4gWW91IG5lZWQKdG8gcGFzcyBhID4gNDgtYml0IG1tYXAgaGludCB0
byBnZXQgNTctYml0IGFkZHJlc3Nlcy4KCkkgaW1hZ2luZSByaXNjdiBkb2VzIG5vdCBoYXZlIHRo
aXMgaXNzdWUgeWV0LCBkdWUgdG8gbGl0dGxlCmFjY3VtdWxhdGVkIGNydWZ0LCBidXQgaXQgbWF5
IGJlIHdpc2UgdG8gY2hlY2sgYWdhaW5zdCBwb3B1bGFyIEpJVHRlcnMKZm9yIHRoZXNlIHByb2Js
ZW1zIG9uIHJpc2N2IGNvZGUuCgotLSAKUGVkcm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
