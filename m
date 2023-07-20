Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C5CEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4MNMGQBTx6VGXqvc2Qlpjx5PqBTDuOW2Sk8a27wPKM=; b=PmlxhdY+Oc1zE7
	IuHrMN0SVSG+9dXYSAdz49PoseBYiiQCJnqC+WdNtZvC1Ws4uGg3pE0kzrcObjf69C4yAgIbIgeeK
	IfIZ1E4CTMAP5Q2Oeixyl4I919PvRGk9BPeksU62CT7IOsIbTy5Qg/dxMmLNVo8AzT0KJRCYLhKmo
	Rw29/6BbYBWJwYOnbCdHE6urTVMfq+8nUkd+G8XfWeh0J2kRhiNV1pk9m6My0rVChLkT1U0jRtVyI
	+O2gmPwPqi436oHCwGgYASZDkPg1CjpbqLtK1Sx0AKLkmVz4OgLdOQ+8yRkSvvwJXNcHgyKp3LVj2
	dTfUSseca1PjMxAYb5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZGN-00C38B-0n;
	Thu, 20 Jul 2023 19:24:35 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZGK-00C37V-1g
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 19:24:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-666e6541c98so1017009b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689881071; x=1690485871;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Sg8ZUof4litkbVkI93lEgkMdRKQns2dkKRJ6nxytjc=;
        b=GXAmdxeabjwJMPspdMR69ghzU9reliykQR+pO/kFRAHXyaOq2QQWLw2SMbQucFHQV9
         /fVbvWAQ41BINMQURi6E8uv7Nk0OOdnJwRKbmoqdMqtNPWrwXoHgNahv4Sudfu2g967V
         xeSxU0X9vGL+q/Ku+GHYhzRbpjvOi33+dJfyPh6uaTDs1OVKMzpqJ4avBt+prjKpSR/a
         GUUlgRt5y+zwXBi96MzfUvC0HL0GiNAVooaRoJN2FivNvRc29hkgPlOvufo5a1FLju84
         HxxNHZEmaz67C9GqWsm7Y/F+qpZpIRxYDpKT2dJZ9ctLUlh1l+p5Sw6EcGOtVyg99YMW
         R8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881071; x=1690485871;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Sg8ZUof4litkbVkI93lEgkMdRKQns2dkKRJ6nxytjc=;
        b=aD8KZcja5bcYnuNgQW5FNDtkT6ENOxQRKkMkmMiXV4do4sooXSsbZre2ICz4Ghy3t5
         6LO0yF5FRwvx+QN7LhUI8QpDpyFJpIHWnotlqKau51RKh5UAPnb2HZf+XQuGmodC2OpE
         No+t9+3RQgWYziGqouSVg9237FQi+T454/j86ZucUlgDCSbEWwD79cOlBVOglFCzGeo/
         o2e0gpQPpLtiDIgBkioXoY2LHOZzXPMUmryFEDwvy0KJCI5PgrOcrDAVLmXmby3gsIM2
         rMGwE/ELzTWqd3OcxsjzriWcX6rMr7D+oBr21q4KTgSeI5qeNEqQxgfAuQSH6BanfYtT
         BTRg==
X-Gm-Message-State: ABy/qLaGyn6YC1ddyS8o5vhrDc0zgMJziw4OEIsZFHuYgJ0VDhJ18I9z
	scYF7vLanxT9TwCaxG3c2mg=
X-Google-Smtp-Source: APBJJlEXxRdTylJlQuY2HOrK3xarVRbbRI+Vezer9FdTfn9onk2HS5knqaCRsMlHJGB+DcxtGFiX6A==
X-Received: by 2002:a05:6a20:7288:b0:131:a21:9f96 with SMTP id o8-20020a056a20728800b001310a219f96mr510744pzk.6.1689881071203;
        Thu, 20 Jul 2023 12:24:31 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id q18-20020a639812000000b00563709c8647sm1642656pgd.7.2023.07.20.12.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 12:24:30 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 21 Jul 2023 03:24:08 +0800
To: =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Andreas Schwab <schwab@suse.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
User-Agent: K-9 Mail for Android
In-Reply-To: <87wmyvq7ai.fsf@all.your.base.are.belong.to.us>
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com> <mvmo7k8cqns.fsf@suse.de> <878rbbkgqo.fsf@all.your.base.are.belong.to.us> <54D8BFF7-C4D2-417E-B18C-62B5DB17B51B@gmail.com> <87wmyvq7ai.fsf@all.your.base.are.belong.to.us>
Message-ID: <A6169D45-D291-40DF-BC78-42AE4F7A5924@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_122432_559032_94BDA4BC 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

T24gSnVseSAyMCwgMjAyMyA1OjA4OjM3IFBNIEdNVCswODowMCwgIkJqw7ZybiBUw7ZwZWwiIDxi
am9ybkBrZXJuZWwub3JnPiB3cm90ZToKPkNlbGVzdGUgTGl1IDxjb2VsYWNhbnRodXNoZXhAZ21h
aWwuY29tPiB3cml0ZXM6Cj4KPj4gT24gSnVseSAyMCwgMjAyMyAxMjoyODo0NyBBTSBHTVQrMDg6
MDAsICJCasO2cm4gVMO2cGVsIiA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+PkFuZHJlYXMg
U2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4gd3JpdGVzOgo+Pj4KPj4+PiBPbiBKdWwgMTkgMjAyMywg
Q2VsZXN0ZSBMaXUgd3JvdGU6Cj4+Pj4KPj4+Pj4gQEAgLTMwOCw3ICszMTIsNyBAQCBhc21saW5r
YWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPj4+Pj4gIAo+Pj4+PiAgCQlpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxz
KQo+Pj4+PiAgCQkJc3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+Pj4+PiAtCQllbHNl
Cj4+Pj4+ICsJCWVsc2UgaWYgKChsb25nKXN5c2NhbGwgIT0gLTFMKQo+Pj4+Cj4+Pj4gWW91IGNh
biBhbHNvIHVzZSBzeXNjYWxsICE9IC0xVUwgb3IgZXZlbiBzeXNjYWxsICE9IC0xLgo+Pj4KPj4+
VGhlIGZvcm1lciBpcyBpbmRlZWQgYmV0dGVyIGZvciB0aGUgZXllcyEgOi0pIFRoZSBsYXR0ZXIg
d2lsbCBnZXQgYQo+Pj4tV3NpZ24tY29tcGFyZSB3YXJuaW5nLCBubz8KPj4+Cj4+Pgo+Pj5CasO2
cm4KPj4KPj4gV2VsbCwgdGhhdCdzIHRydWUuIEFuZCBJIGp1c3QgZm91bmQgb3V0IHRoYXQgYnkg
QyBzdGFuZGFyZHMsIGNvbnZlcnRpbmcKPj4gdWxvbmcgdG8gbG9uZyBpcyBpbXBsZW1lbnRhdGlv
bi1kZWZpbmVkIGJlaGF2aW9yLCB1bmxpa2UgbG9uZyB0byB1bG9uZwo+PiB3aGljaCBpcyB3ZWxs
LWRlZmluZWQuIFNvIGl0IGlzIHJlYWxseSBiZXR0ZXIgdGhhbiAobG9uZylzeXNjYWxsICE9IC0x
TC4KPgo+SWYgeW91J3JlIHJlc3Bpbm5pbmcsIEkgc3VnZ2VzdCB5b3UgdXNlIERhdmlkJ3Mgc3Vn
Z2VzdGlvbjoKPiAqIFJlbW92ZSB0aGUgY29tbWVudCBJIHN1Z2dlc3QgeW91IHRvIGFkZAo+ICog
VXNlIChzaWduZWQpIGxvbmcKPiAqIEFkZCBzeXNjYWxsID49IDAgJiYKPiAqIGVsc2UgaWYgKHN5
c2NhbGwgIT0gLTEpCj4KPldoaWNoIGlzIHRoZSBsZWFzdCBhbW91bnQgb2Ygc3VycHJpc2VzIElN
Ty4KCnY0IGhhcyBzZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
