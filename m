Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930D2C433E9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C049619A9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C049619A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D7aOOEaNTkf5YowUYfYaLt8x0K6U2uuEBSLO+KpFqJ0=; b=nhLUnBeEssxk7Oqa/LSDyg2vI
	JeIWfVhfoOZ7y25q206VYkCc+IIGaEcTH5S7Z6WS9SGj38rM4y5CnJ2lXiNo1RhF7ZTJ6+VSPhaEY
	1ZBYqdQzbnJjcOwoZ4TmrkloEdsqxwrQjIKmzGHeCL1BAqnDAsTu4cjmsap3tPSgv1jhGIb6Hezkg
	MZXqqtDlumX7jBns9d97rd83ydvzOFksDE4wTK5K2LJgRZog/t2Vp6gImIPmIP3/5FpuO+ltQpGDb
	Un6QA6toi+guI1kLd5H0/T8+Eyf0UeJ08RiNPrpF/CovfEkdGz/mUz76OVmZDxxKIYoI/3oYTuJ/z
	Yv1aRHTWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxrF-001Iv9-Vu; Mon, 29 Mar 2021 19:47:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrOK-000f7Y-6K
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 12:53:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 224D96191D
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617022390;
 bh=ZtH+hMquy7Na1NKF/yxIB+LhxXUi37ByQKiTFk9d38U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iy/yWInWB8DBRPxhLE7cb8nnL6SjCZMkWAdqdfKqXrpShBLHbTyVWa0wYkSN/tX5v
 Iu2rpPH80kkfOhq/UaN9/SA2YdB+x9RzSUizC5xp3FbagOGD5b8lWF+eiPxaQmBmsG
 8mQrC67o6eRGU77PTSiyD5FqmWZB/XMtgSQ5Lr9cr8/1EInyzd3Enz3sAFQtKWMDis
 x3GYxZ0FAXmMllpi+MTFzy++LKlizjyA1MYaBsoE2fzmId5Zv5Q27wwu0mWOSFEudJ
 MXKxlcT5oSR+vVk0rlL8s5NVNMSWLEZchX3yY/jaxKeq8CZH6LQBvCanFjA1q171Om
 P1oxZoWMTKRBQ==
Received: by mail-lf1-f43.google.com with SMTP id m12so18231991lfq.10
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 05:53:10 -0700 (PDT)
X-Gm-Message-State: AOAM5333rGxwVu9dPz76LhyymhxfLOndILoBJ0VZgla+TxaNAlUZ29YL
 5WdRtWJiqj2ILh90aw/oYpXLXB85nPp3032ABoA=
X-Google-Smtp-Source: ABdhPJzKyxFt/x88AyNxVA443wYhozA+/lh8xw56UgIWl+92QcqgMI4gEBYMXLqoZdXoDirHF7Uz5bRUqUYJrcU8Gu8=
X-Received: by 2002:a19:f501:: with SMTP id j1mr17188294lfb.231.1617022388450; 
 Mon, 29 Mar 2021 05:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
 <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
 <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
In-Reply-To: <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Mar 2021 20:52:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
Message-ID: <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_135313_275385_6923BD5C 
X-CRM114-Status: GOOD (  13.58  )
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

T24gTW9uLCBNYXIgMjksIDIwMjEgYXQgNzozMSBQTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMjksIDIwMjEgYXQgMDE6MTY6NTNQ
TSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiBBbnl3YXksIGFuIGFkZGl0aW9uYWwg
J2Z1bm55JyBpcyB0aGF0IEkgc3VzcGVjdCB5b3UgY2Fubm90IHByb3ZlIGZ3ZAo+ID4gcHJvZ3Jl
c3Mgb2YgdGhlIGVudGlyZSBwcmltaXRpdmUgd2l0aCBhbnkgb2YgdGhpcyBvbi4gQnV0IHdobyBj
YXJlcwo+ID4gYWJvdXQgZGV0YWlscyBhbnl3YXkuLiA6Lwo+Cj4gV2hhdCdzIHRoZSBhcmNoaXRl
Y3R1cmFsIGd1YXJhbnRlZSBvbiBMTC9TQyBwcm9ncmVzcyBmb3IgUklTQy1WID8KCmZ1bmN0NSAg
ICB8IGFxIHwgcmwgICB8IHJzMiB8ICByczEgIHwgZnVuY3QzIHwgcmQgfCBvcGNvZGUKICAgICA1
ICAgICAgICAgIDEgICAgMSAgICAgIDUgICAgICAgNSAgICAgICAgIDMgICAgICAgIDUgICAgICAg
ICAgNwpMUi5XL0QgIG9yZGVyaW5nICAwICAgICBhZGRyICAgIHdpZHRoICAgZGVzdCAgICBBTU8K
U0MuVy9EICBvcmRlcmluZyAgc3JjICBhZGRyICAgIHdpZHRoICAgZGVzdCAgICBBTU8KCkxSLlcg
bG9hZHMgYSB3b3JkIGZyb20gdGhlIGFkZHJlc3MgaW4gcnMxLCBwbGFjZXMgdGhlIHNpZ24tZXh0
ZW5kZWQKdmFsdWUgaW4gcmQsIGFuZCByZWdpc3RlcnMgYSByZXNlcnZhdGlvbiBzZXTigJRhIHNl
dCBvZiBieXRlcyB0aGF0CnN1YnN1bWVzIHRoZSBieXRlcyBpbiB0aGUgYWRkcmVzc2VkIHdvcmQu
IFNDLlcgY29uZGl0aW9uYWxseSB3cml0ZXMgYQp3b3JkIGluIHJzMiB0byB0aGUgYWRkcmVzcyBp
biByczE6IHRoZSBTQy5XIHN1Y2NlZWRzIG9ubHkgaWYgdGhlCnJlc2VydmF0aW9uIGlzIHN0aWxs
IHZhbGlkIGFuZCB0aGUgcmVzZXJ2YXRpb24gc2V0IGNvbnRhaW5zIHRoZSBieXRlcwpiZWluZyB3
cml0dGVuLiBJZiB0aGUgU0MuVyBzdWNjZWVkcywgdGhlIGluc3RydWN0aW9uIHdyaXRlcyB0aGUg
d29yZAppbiByczIgdG8gbWVtb3J5LCBhbmQgaXQgd3JpdGVzIHplcm8gdG8gcmQuIElmIHRoZSBT
Qy5XIGZhaWxzLCB0aGUKaW5zdHJ1Y3Rpb24gZG9lcyBub3Qgd3JpdGUgdG8gbWVtb3J5LCBhbmQg
aXQgd3JpdGVzIGEgbm9uemVybyB2YWx1ZSB0bwpyZC4gUmVnYXJkbGVzcyBvZiBzdWNjZXNzIG9y
IGZhaWx1cmUsIGV4ZWN1dGluZyBhbiBTQy5XIGluc3RydWN0aW9uCippbnZhbGlkYXRlcyBhbnkg
cmVzZXJ2YXRpb24gaGVsZCBieSB0aGlzIGhhcnQqLgoKTW9yZSBkZXRhaWxzLCByZWY6Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCgo+IEFuZCB3aGF0IGlmIHlvdSBk
b3VibGUgbG9vcCBpdCBsaWtlIGNtcHhjaGcoKSA/CkNhbiB5b3UgZ2l2ZSBhIGNvZGUgc25pcHBl
dD8KCgotLQpCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
