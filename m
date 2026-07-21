Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C5C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5Vll8GuTdwFXmSbtK9yM1+T4/d4dCdfakxY39SyYNk=; b=a3nsd7MJi9HEz3
	Vx8W6gnDYrOlKvKwZSekdkRToG/Yl1Ugip7bE2BHIHVgxhXKV3R70lH2vXTOSm0WaWJ1yom3p7Zu1
	jsapAYCHVe4EEK9zRmAHSSYRlG7eUTZ0ULVTOnFX5hKdkwrAFImrcWxyVb5DJhAg++LmPJHQnVOO6
	mO8HznnbwFo0jZfF7WJPKexS/wB/T4jq4jUtngGB5GLT+Elx9+lZYDrq1OLTRtyfweJ/gWvPQ6hvo
	sl6Eu0/FXEQg4VDRWWGkZ8wMyvQxWK2OLYSNx12kYvBnBKiuRM7JdAR9Iif9nOjsLA084WSgmcOKA
	xesjfQGYxDWeqJYrkmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFA6-0000000ACLj-0awv;
	Tue, 21 Jul 2026 18:25:50 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFA4-0000000ACL5-19l7
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 18:25:49 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-49550b004f9so11885335e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784658346; x=1785263146; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SeQQtojGt29p0HQnBgMK6DLzlAvRjRZawe7OxD4XFCc=;
        b=Pg7LpxEzzSxYQhJQhNYywgrHvJ46tCz2A7npDQXXmFwo3XfXAWHEAcnathhIkiTE2h
         HPLTQgVGzzTlpJUBN7Dmdwb5YijYBIAGGApsfXp+TfoE5w5767vW1UGVGR3tRrQ/ZTY2
         zZoG++zw20DLIBGdOgFIvibx7ZnwxSM1PBo2W8ZNX6Tkq/0IY1kDKwRbysrxaNmVAFoe
         1Yv9gchNKYGpmP1mOAIl07qSeCFBFW5svpuaHB5gxfvGh4HrfuyoUBknLmZTgmzMhzSP
         Jk1ktI+LqYaMkamf6gPVbnGthEH2gnLo03mmURAAwpHOQtkmS8p8BLbT+bwqnZGRflDN
         3hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658346; x=1785263146;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeQQtojGt29p0HQnBgMK6DLzlAvRjRZawe7OxD4XFCc=;
        b=PT6Bv3Zjbi1nZsw1YGsA+yA+gvqie/Y1+2suiaojKH4lnZ6OXoSgkr/nfUnLH5D9AJ
         594oaC54eA9yKLBQLYLOwv6Yb/6D8vUG0U0A2khVW3FzXLPhmxziE995A3V2cQDY13F2
         yA9OGACxKsVwNKiDVRq1tgSLYHDtVaRe8tctderXIzQ1nZRMvJKZzN8pC+woQhSGRLUw
         kVTAt0BQO3U54f09qdx1nMTBjKkXW/SEE2z2VsQZltlTgV5aOZRW3rpAZ8j133fV6R4P
         +kFsibnzI7e87HYnPM92t+hcz3+2xi8B7wCKXHevgKWjaxSHeypBXrdax3R8yeitSoRN
         q+vA==
X-Forwarded-Encrypted: i=1; AHgh+RqPub7p3SjPqB+xlRd4SDVFP4VkY+1NYyeDE8Ut/X1alOrtaxd1s3Oc3jDawXF7n7GUCk9WkkRHB1zyyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5IxMyi3FJ4v5RC+KjiP2vRwdzNunmGueIls/qVZxHY9Ejr/Lt
	K1iT3OtFG337H6DdXwcE7SfGwHMMfHJdJo/GucTwQ2tmc5+8t09My9VF
X-Gm-Gg: AfdE7ckF6UhBzZcOepK7xr+CWGHDPY1D9cylyCnUr+FmBcrYlmGxI/MkhJgNfNYq9DH
	iB53plXajOXgUzPVowUBpoZ31wfLHTykAV5TMEZRb52Cqm5t7mPpNKiaTHILvlLEAheExoku87c
	+gwn+ymfB5QJAdhnWiLFQXQFM0n6EviXLSYOL5M4VBKYbayBg/UM979UvEcvV3D8ZMyJTioVnAB
	WsWURai3MuYQZt3RsMCOl3XXSr4X9QQjyQUYYPykFffHUfOG1EKc7YWvfyHsm9fe5yzm/n4HFMP
	JwfpiEf1V4uMIVwhIYVZhY3pO26WbT0xTsX90E8ZB/RrIuKuA/q3CFseCLvSenEqt0X82PkGLQe
	c47UfLRD4x15u9wja+A/9E59jttbPHIbdAC2dzfLaAzokYDbHTzbbGyE//52dgGbRnZUmhJtOHo
	ljLaq1cw/1RFANgV4BeWz7Awrs3RrHiA9K4br/YdLO0DUbxf4OsdmvXw9fV40kzpln24iuf09Ei
	+zKYNSgvsS5NShAHiWFnDYGQgkV1SfAWiB76EXW9GnH
X-Received: by 2002:a05:600c:48aa:b0:495:4589:cea6 with SMTP id 5b1f17b1804b1-4954a516530mr139259715e9.34.1784658345726;
        Tue, 21 Jul 2026 11:25:45 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496ffsm40416461f8f.3.2026.07.21.11.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:25:45 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 21 Jul 2026 20:25:44 +0200
Message-Id: <DK4GL1CICEHY.10XAOFWAEHJCJ@gmail.com>
Cc: =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] bpf, riscv: fix extable handling for arena
 load_acquire
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Feng Jiang"
 <jiangfeng@kylinos.cn>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Pu Lehui" <pulehui@huawei.com>,
 "Puranjay Mohan" <puranjay@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0
References: <20260720-bpf-riscv-fix-extable-v3-1-e9a603882309@kylinos.cn>
 <87h5lsurzn.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87h5lsurzn.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112548_327998_8B007678 
X-CRM114-Status: GOOD (  10.34  )
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

T24gVHVlIEp1bCAyMSwgMjAyNiBhdCA4OjE3IFBNIENFU1QsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6
Cj4gRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyaXRlczoKPgo+PiBlbWl0X2F0
b21pY19sZF9zdCgpIHJldHVybnMgMSB0byBoYXZlIGJ1aWxkX2JvZHkoKSBza2lwIHRoZSB6ZXh0
IGFmdGVyCj4+IGEgc3ViLXdvcmQgbG9hZF9hY3F1aXJlLiBUaGUgY2FsbGVyIGRvZXMgInJldCA9
IHJldCA/Ogo+PiBhZGRfZXhjZXB0aW9uX2hhbmRsZXIoLi4uKSIsIHdoaWNoIHNraXBzIGFkZF9l
eGNlcHRpb25faGFuZGxlcigpIG9uIGFueQo+PiBub24temVybyByZXQsIHNvIHRoZSBleHRhYmxl
IGVudHJ5IGlzIG1pc3NpbmcgYW5kIGEgZmF1bHRpbmcKPj4gUFJPQkVfQVRPTUlDIGxvYWRfYWNx
dWlyZSBvb3BzZXMuCj4+Cj4+IFJFR19ET05UX0NMRUFSX01BUktFUiBsZWF2ZXMgcmQgc3RhbGUg
b24gZmF1bHQsIGFuZCB0aGUgdmVyaWZpZXIgc3RpbGwKPj4gdGhpbmtzIHRoZSBsb2FkIG92ZXJ3
cm90ZSBpdCwgc28gYSBwcm9ncmFtIGNhbiBsZWFrIGl0IHRocm91Z2ggYSBtYXAuCj4+Cj4+IENo
ZWNrIHJldCA+PSAwIGJlZm9yZSBjYWxsaW5nIGFkZF9leGNlcHRpb25faGFuZGxlcigpLCBhbmQg
cGFzcyByZCBmb3IKPj4gTE9BRF9BQ1Egc28gdGhlIGZhdWx0IHplcm9lcyByZCBsaWtlIGEgUFJP
QkVfTUVNIGxvYWQuIFJldHVybiByZXQKPj4gdW5jaGFuZ2VkIGZvciB0aGUgemV4dCBza2lwLgo+
Pgo+PiBGaXhlczogZmI3Y2VmYWJhZTgxICgicmlzY3YsIGJwZjogQWRkIHN1cHBvcnQgYXJlbmEg
YXRvbWljcyBmb3IgUlY2NCIpCj4+IFNpZ25lZC1vZmYtYnk6IEZlbmcgSmlhbmcgPGppYW5nZmVu
Z0BreWxpbm9zLmNuPgo+Cj4gVGhhbmsgeW91IGZvciBzcGlubmluZyBhIG5ldyB2ZXJzaW9uIQo+
Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4gQWNrZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpUaGVyZSB3YXMgYW4gaWRlbnRp
Y2FsIHY0IHJlc2VuZC4gSSBhcHBsaWVkIHRoZSBhY2tzIHRoZXJlIGFuZCBwdXNoZWQuClRoYW5r
cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
