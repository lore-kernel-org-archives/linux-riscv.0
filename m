Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1AFC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcfkFyGcrIKsOOqRmyeQ91dNNn+J/sxE/ze7076CY0M=; b=gnI/ew42DN3r9p
	sTfm0ekZo277hHGiJbx/iITEiRUgqMJ41PAy19VzId0gP+c1c6OIY2WT2OxNFj1xfCWk0xtCXFSgf
	LAYimfmX21n2zrEGdQAX5rrW32aFJ3YFcZPDx5Xit5PuoMd6jiaIDQQ9vHqgUXBU8QJz6B6QzjQ5x
	tNBlUU5OuAJ2UDupgD8w06PeUGSji/MzXjR3U5PU68y5xmMjoIXaCKF4MBktE4FwqcwrCrhMAMP/J
	gzac0eQzNXU7xQSlZXxEaqynPY0zIDfkVyUijghuXCMbax7NeY3Qk53qN/OVegmDjhTJk558TcCUa
	ncAtCVc4rlziPDxBIg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMfM-00000004wmO-1oiP;
	Tue, 20 Aug 2024 11:04:44 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMfI-00000004wlb-0nXj
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 11:04:43 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-39d2256ee95so22678215ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724151878; x=1724756678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5ENCAJFA6GCGJ4Z5ac9HAe2HQjqebIqvvSZm6oncHk=;
        b=Bts5QNbozCdnGXDvh4JIbzd2FLx2fUV8tuudKKVFLJgEzyTF7Z6PVCQUg5CrDoWOnB
         ax5rtBG70xziu9olsVtP3EswgejwxI2FVqGlFOlUf+G6vfQJR1GK7bg0QPsERx0lnbnQ
         MVARJxZBTTfSC9p/UA3EvLwJDVy0p+yHLWgMoMPSgPeAmPjee0GD46VbdLnrVXpEupOQ
         6FLy8H1ngiANfjHBtRH6/JoLSUqvW7JCNlvZw3aOTUWZLrVaxI9cpnGsX/SY5tXkFauW
         CidbE2clI7MWXcZvSXCh2qElg7jcyS3Z6kas9xKTD/AhmYCyTOIz68Le+PKef/CGl4a/
         l/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724151878; x=1724756678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5ENCAJFA6GCGJ4Z5ac9HAe2HQjqebIqvvSZm6oncHk=;
        b=YO+XueYyoYq95b365prNLZfS2uVBQO4A8dxK243mGQXHETGzcWbpAMVseA8Q/Kn/tA
         HwH4Sd8KyKIBVN3NN2Q99zphHQCFr28zAeuAH7SWdCUzIIxsB3X14YbFG9YP65RcuyBL
         YtJgJeOiOeO39eapH+flLxPT7Nu9wICvs7pqRxoYd3NPIaszoa8Eknyaq3wq7hK78WIe
         ZMnfjRAIx5JPi9dHzefle8opwA5D4xc2m/9j32jZgY8Q18TIv5/Cx898+cKa50NRbl/M
         kB5HjoJLaYPGAAxDmK6fwUBFI8yuxc06/wyMQbamDS4QTE8Ajec3cxSNew1RKObHGZoW
         ONig==
X-Forwarded-Encrypted: i=1; AJvYcCXnvWZMzhquTsomqf8u89oieGyNMk32PJJ4n4ZXkP2hmRH0ACbkpjcdhassESVXKM+slVQI4G7h+FAbvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0zh1BAKxjxIFzUNd8nTmcud5nIC6G0SuqhluzEVg4SNf0lBgV
	0DgTOe969Lerni9CuwOEB/Mxi4BDIhzLbrEQnpo9/tLS30fvqtw/Nrq3n/V3aO1DndnbswkhPub
	Y3iEdah49tKVVZ5b+kQdgtv6ce2FlQErrwYoZTw==
X-Google-Smtp-Source: AGHT+IGXOzRUY68xdnDacWlCjZGggODFihqXqN7thtCn6+Cfy4tu5ddknyhFDAkOod3zmubTNLL56Afi/Zk5FmYsKp4=
X-Received: by 2002:a05:6e02:1fcf:b0:39b:1ed5:4a55 with SMTP id
 e9e14a558f8ab-39d26d64ac5mr165863115ab.24.1724151878424; Tue, 20 Aug 2024
 04:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240820094542.1576537-1-ruanjinjie@huawei.com>
In-Reply-To: <20240820094542.1576537-1-ruanjinjie@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 16:34:26 +0530
Message-ID: <CAAhSdy2Xdh+jYgQ8pz9XewZSUVty0t=XUx8J8ecmHm_joCTOGw@mail.gmail.com>
Subject: Re: [PATCH -next] irqchip/sifive-plic: Fix IS_ERR() vs NULL bug in plic_probe()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: tglx@linutronix.de, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	apatel@ventanamicro.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_040442_196693_95409761 
X-CRM114-Status: GOOD (  14.54  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMzowOeKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gVGhlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZSgpIGZ1bmN0aW9uIHJldHVybnMgZXJyb3IgcG9pbnRlcnMuCj4gSXQgbmV2ZXIgcmV0dXJucyBO
VUxMLiBVcGRhdGUgdGhlIGNoZWNrIGFjY29yZGluZ2x5Lgo+Cj4gRml4ZXM6IGI2OGQwZmY1Mjlh
OSAoImlycWNoaXAvc2lmaXZlLXBsaWM6IFVzZSBkZXZtX3h5eigpIGZvciBtYW5hZ2VkIGFsbG9j
YXRpb24iKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBK
aW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
ZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZp
dmUtcGxpYy5jCj4gaW5kZXggOWUyMmY3ZTM3OGY1Li5jZWE4ZGNhODljNTAgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gQEAgLTUxMSw4ICs1MTEsOCBAQCBzdGF0aWMgaW50IHBs
aWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHByaXYtPm5y
X2lycXMgPSBucl9pcnFzOwo+Cj4gICAgICAgICBwcml2LT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+IC0gICAgICAgaWYgKFdBUk5fT04oIXByaXYtPnJl
Z3MpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPiArICAgICAgIGlmIChXQVJOX09O
KElTX0VSUihwcml2LT5yZWdzKSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBy
aXYtPnJlZ3MpOwo+Cj4gICAgICAgICBwcml2LT5wcmlvX3NhdmUgPSBkZXZtX2JpdG1hcF96YWxs
b2MoZGV2LCBucl9pcnFzLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgIGlmICghcHJpdi0+cHJpb19z
YXZlKQo+IC0tCj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
