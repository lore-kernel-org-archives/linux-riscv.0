Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B334C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:16:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D87961554
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D87961554
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Gq8+YEKQ1dHlM6f7rrMfB+ZUbReVWf5JbX8L32824E0=; b=g6hBvwBawT02F1+0ZW8EtPzZj
	wQ73wjjGir1zf9tIgREcHvy89Z9+JjhyJBWkwNrtmE92d3jV7pBUcC4O+pzLRqBJ7hIkaeUKw7bLs
	MqzEtjULRNFRL/nW4R135WgrgAhhLQVzXqjHth0Kcc14UYfMf87fMajsgW8p0ey6pEeDTgwrxEEEv
	8qHjq9jA3xfSRs6BkzHNqzw0NmhWRBOhm5LkuOra9GE1xzVDjDT334ZQjkqkxiPiu1Jr8ECxvnREL
	qT4QD2UJHNUykLfEuz5HHZweULhpb2gxTcMZkYSJPU+yk+ookYATqneM7Mcs4iHm0Jly75JQVmQz4
	SZPhNcI7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6jJ-002iw9-1B; Tue, 30 Mar 2021 05:15:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6jD-002ivn-IJ
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:15:49 +0000
Received: by mail-pj1-x1035.google.com with SMTP id ha17so7138553pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KGU2b2S4TWqjVctT9WF9ulJY91oi4SfPgLrc9UL0Gs0=;
 b=N9Qv4o9ZgemN9eifsqaZJ+U+LqHV2eK9jCn8264gdZkb6ICP1eUjjjKFb+90rgDOxW
 wTh5+DC90gRw9T26y93rrb6OdcPfkj9uFCd+LWEI8K3P9VmtMsxPvZ+TpfRGtUq8gcG9
 6vpIKOHbUyVEiK1TlGtx4LXhqhmEij8/MeHYLxUong9HXcepOoTipRMzEiGIpLk5Hz3f
 e0VZYiuJe11c5GOcAps1OwLGMvUAYg20PEosuTi3Fki1wHMjvtbofZuLZMVhUoKuTF6V
 EJShyKJA+nduVZaJxXPr39C/6wLsnckrPEtDRgfx6aaboXSSQnL0y5hzuSg/TXviuR9u
 nCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KGU2b2S4TWqjVctT9WF9ulJY91oi4SfPgLrc9UL0Gs0=;
 b=B310z7/HvFkEJb7JgcnK17yJa1V0pZTWPQ8SbsSiPvoyRwYslabpnJTl3eLTXttjJT
 o7FxnEAbkG0qHvnbypFX6VTF4O2gbHF8xjj7ifuWVm3qLBDFA2uAK2cveRYpycdT8/LH
 Rhi+tx6w6S4IyZYhJvZcVB8QsfWMYbqeI1qrGasgRwq9XLpg+D9mW2g/Y4WLwSPzHRqS
 EtmigPetB1EBsdD8w1wwT28z43pR/PhQ7XEQ5utIILvI/pVMYpIJ07MTwez6bTRCc4c7
 jnZV4WQHfjTeMFbLMzjDaUTg6ilhsCNNgxVP/hJ14lklm3GjhP3u3JVDQSMnLleBAGVY
 hl6w==
X-Gm-Message-State: AOAM531lGz36+y0wgFRInAhCPEfHqORI3BXP7RfO9HBluPG/ehg+lZuY
 geSBb69/nZPlHMnCn7zfnE36mdrZimqmRg==
X-Google-Smtp-Source: ABdhPJyH0mqa8pxP6xRlCp1I4VddqDxe1AkLCxTH3izoo4xcTPGfnZm3kfrJX5euqJew+VoB9o8tzA==
X-Received: by 2002:a17:902:b78a:b029:e4:8ce6:fb64 with SMTP id
 e10-20020a170902b78ab02900e48ce6fb64mr32980699pls.77.1617081345320; 
 Mon, 29 Mar 2021 22:15:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y8sm1320319pjb.11.2021.03.29.22.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:15:44 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:15:44 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:15:32 PDT (-0700)
Subject: Re: [PATCH] riscv: Drop const annotation for sp
In-Reply-To: <ce5b3533-b75d-c31c-4319-9d29769bbbd5@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <Atish.Patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-a94d2d1e-c9f6-47b1-9dbc-0ee1e6be418f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_061547_889734_FB028924 
X-CRM114-Status: GOOD (  23.17  )
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

T24gV2VkLCAxNyBNYXIgMjAyMSAwODoyMToyMSBQRFQgKC0wNzAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVy77yMIEkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0
Cj4KPiBjb21taXQgNTJlN2M1MmQyZGVkNTkwOGU2YTRmOGE3MjQ4ZTVmYTZlMGQ2ODA5YQo+IEF1
dGhvcjogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPiBEYXRlOsKg
wqAgVGh1IEZlYiAyNyAxMTowNzoyOCAyMDIwIC0wODAwCj4KPiAgwqDCoMKgIFJJU0MtVjogU3Rv
cCByZWx5aW5nIG9uIEdDQydzIHJlZ2lzdGVyIGFsbG9jYXRvcidzIGh1ZXJpc3RpY3MKPgo+IFdo
eSBkbyB5b3Ugb25seSB1c2Ugc3BfaW5fZ2xvYmFsIGRpcmVjdGx5IHdoZW4gQ09ORklHX0ZSQU1F
X1BPSU5URVIgbm90Cj4gZW5hYmxlZCwKPgo+IGFuZCBrZWVwIHRoZSBjdXJyZW50X3NwIHBhcnQg
d2hlbiBDT05GSUdfRlJBTUVfUE9JTlRFUiBlbmFibGVkPwoKSSB0aGluayBJIGp1c3QgbWlzc2Vk
IHRoYXQgb25lIHdoZW4gY2xlYW5pbmcgdXAgdGhlIG90aGVycy4gIFRoZSAKaW5zdGFuY2VzIG9m
IHVzaW5nIHRoaXMgbG9jYWxseSBhcmUgYWxsIHdyb25nLCBpdCdzIGp1c3QgYSBoaW50IHRvIEdD
Qy4KClRoZSBwYXRjaCBoZXJlIGlzIGNvcnJlY3QuICBBY2NvcmRpbmcgdG8gdGhlIEdDQyBtYW51
YWw6ICJEbyBub3QgdXNlIAp0eXBlIHF1YWxpZmllcnMgc3VjaCBhcyBjb25zdCBhbmQgdm9sYXRp
bGUsIGFzIHRoZSBvdXRjb21lIG1heSBiZSAKY29udHJhcnkgdG8gZXhwZWN0YXRpb25zLiIgIEl0
IGRvZXNuJ3QgbWVudGlvbiBpbiB3aGF0IHdheSAiY29uc3QiIG1heSAKcHJvdmlkZSBhbiB1bmV4
cGVjdGVkIG91dGNvbWUsIGJ1dCB0aGF0J3MgcHJvYmFibHkgd2h5IEkgZGlkbid0IGhhdmUgaXQg
CnRoZSBmaXJzdCB0aW1lIChkZXNwaXRlIHVzIG9ubHkgcmVhZGluZyB0aGUgdmFyaWFibGUpLiAg
SSBtdXN0IGhhdmUgCmZvcmdvdHRlbiBhYm91dCB0aGF0IHdoZW4gSSBzYXcgdGhlIHBhdGNoIGdv
IGJ5LgoKVGhpcyBpcyBvbiBmaXhlcy4KCj4gSWYgdGhlcmUgYXJlIHNwZWNpYWwgcmVhc29uLCBJ
IHRoaW5rIEkgc2hvdWxkIHJldmVydCB0aGUgZGVjODIyNzcxYjAxLAo+IHRoYW5rcy4KPgo+Cj4g
T24gMjAyMS8zLzE3IDIzOjA4LCBLZWZlbmcgV2FuZyB3cm90ZToKPj4gVGhlIGNvbnN0IGFubm90
YXRpb24gc2hvdWxkIG5vdCBiZSB1c2VkIGZvciAnc3AnLCBvciBpdCB3aWxsCj4+IGJlY29tZSBy
ZWFkIG9ubHkgYW5kIGxlYWQgdG8gYmFkIHN0YWNrIG91dHB1dC4KPj4KPj4gRml4ZXM6IGRlYzgy
Mjc3MWIwMSAoInJpc2N2OiBzdGFja3RyYWNlOiBNb3ZlIHJlZ2lzdGVyIGtleXdvcmQgdG8gYmVn
aW5uaW5nIG9mIGRlY2xhcmF0aW9uIikKPj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdh
bmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9z
dGFja3RyYWNlLmMgfCAyICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3Ry
YWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPj4gaW5kZXggM2Y4OTNjOWQ5
ZDg1Li4yYjNlMGNiOTBkNzggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNr
dHJhY2UuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPj4gQEAgLTE0
LDcgKzE0LDcgQEAKPj4KPj4gICAjaW5jbHVkZSA8YXNtL3N0YWNrdHJhY2UuaD4KPj4KPj4gLXJl
Z2lzdGVyIGNvbnN0IHVuc2lnbmVkIGxvbmcgc3BfaW5fZ2xvYmFsIF9fYXNtX18oInNwIik7Cj4+
ICtyZWdpc3RlciB1bnNpZ25lZCBsb25nIHNwX2luX2dsb2JhbCBfX2FzbV9fKCJzcCIpOwo+Pgo+
PiAgICNpZmRlZiBDT05GSUdfRlJBTUVfUE9JTlRFUgo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
