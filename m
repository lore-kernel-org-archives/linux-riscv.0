Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4416FCCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hqa1QbYPgvw8OqTvVEshknTEDJMfsr85PqjcP7ecsWs=; b=DRyFZY76H5WcfO
	5hvSM22IFfUjvi2q4DFzDW9d+N9ln1rmjiwPoLPJH3V4MQO3bgEBnbk0BBdzkHxNBDVcB4Yq1gy4l
	eGAuNLsDo0aA5fRILRs8SpSpRAmR0bmB07c1FBsshWQ6k7aaQiqWdLNUJsixAVVCV7SVViSZ+un4f
	dmAIgXGFo9AUR/ZRtwHkEo/ioNb/BOzOYrESTZSawJR9u7HN5qYCowr+1OlCTjamEDGo44pcJU0NK
	7D2Woa+ZtdVQ10rLL1DOMqBJbgc9pjRCry4FsDFs2HZMUZH6p2rNRvoDHGQF1EqKvEgnyWG5cAOGq
	r5wJfXWSsM4PI7bnGXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDE43-0000000D42d-3BKq;
	Mon, 27 Oct 2025 03:38:35 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDE40-0000000D41n-1vfR
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 03:38:34 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-945a33e0d55so50077139f.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 20:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761536311; x=1762141111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLv/abQqhTrjCuxnsZKW6XWrZqaImCMO0bBeDuN7Ur0=;
        b=LhyKsfu3HuYWGgRogHX8HrmAgJVAFN6K0aQ3HHM/yTdW5b2e5gpzDrRD/Ig54yXI8S
         CypLEwoTeZDFdN/x0DtPNf2matMMPY9x1YhvaRzOvUKIUtPU26lk/1vj3ydAFiQnCJeY
         ZXHdO7pT2yC4q2bZNcXrm0Yugz+/TI4OdzlZX/wA/Qe+K99wIIe7trK2Fqax/ghN+wiP
         HE4MncIdTaTel1qTczzdUHoGUTW5QgL6kPVesEDbp7otCvb4feyIH2MWKbZaOQZ9K0bG
         esmymQl0koH7lFlKFZj0UjHYEZleYRwImyqRClFaOUZv+JeMtO6TVbMJZNql7C4iIpvM
         bRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761536311; x=1762141111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLv/abQqhTrjCuxnsZKW6XWrZqaImCMO0bBeDuN7Ur0=;
        b=A5R5chW7T4yOs8x9xoaF8TEW8QX/zDnUvJonbrt/2yXztgVYyIW4/kc2fadsV3UuaF
         BJlyySnFGA2MJfu4Xc/7iVIuLF4xojyqbWmXo+/dHLA0/L6mMsXU1TIPxwtkehBrzG7Z
         WpGrFSWdBM5SIyyTQSdlqSDgGQnJTmBmmNJeFxQKU7deiQ/wzV4RMGNhURZ6ctmtVq4j
         I6EGO1vqlhBYtnxLpKPbkigXH9y5nspdVV2yBQoHgT2v4XLjnxGrp2TYIAuWNdK8HScz
         OQLBiSOQRrayzXABbSbAB8IbnkUKxKbkZbDqzI7bYd3VQPQnSl7sli9sqNab23cbUD43
         IltQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGp463uk9W7Be+vcRW8h4AqUt+/TrVphYZyicRCkdBmhXm/1N8+YVGGQxrH7EASfnvlDio0lhTLEzzcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz24Gf+uAzMFmv7G5+8FlvI9+qx1GgUFXpJmDQWiPE2heRvlpQ
	BK2KnzF3ir5+R7vauOhrQlCzw0AfW8ZguIRegY9pofFk3s+Xl91c8l/wr764UhjwfiBLQ53cjfC
	H98xev7QhwpuNLBAiArHzpUIGUVvJF1braYaaF5NZZg==
X-Gm-Gg: ASbGncun9bWzINjryhlJdO/4BZI0yVzncCSSvEpbZKoenOlS/6Ed3+6Xc5aHpsRGWWI
	YrvLghvBrpIa8vLJX+m/5ck5NnU9oWzTg44La75MuX6FtmIuAJ06TnrtD18SJah03Vp0Lvnwjh1
	D/iH6wLk3gUEz1eOr3dfaxK+ppMtd4+oblGG7+2BtOMD22AqYTkQzsPVrOhSyR3GEsKb2NpozBS
	cDgpfb3/rccWExjZvbrbAz5mmzV3LzzNb1RJsGvQt724vNQdIviHY2yqW7muyXXiybOaKPqTR+x
	Tv/QR2QXOB/f8K0vFkYMvCJgT+BBc8nvxpLur0eSgBd4AsgO5QD1Vf681DFv
X-Google-Smtp-Source: AGHT+IFXk1YUaLAdhvo8rgPkIKe5gLo/c+djIhEIA40LWqKcizzRXoBKOFj4cyggO2AuZkgxTRXbB8jToGSbWYc3oMw=
X-Received: by 2002:a05:6e02:190c:b0:42f:9eb7:759b with SMTP id
 e9e14a558f8ab-430c5306894mr466704455ab.28.1761536310727; Sun, 26 Oct 2025
 20:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251017155925.361560-1-apatel@ventanamicro.com>
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Oct 2025 09:08:19 +0530
X-Gm-Features: AWmQ_bleYZ_iePePDvRC5d6Pe5JA_nbAbhQUpFmow4pTKUmpRz54E4-TMp1PLS4
Message-ID: <CAAhSdy1+AFQepjrfKrcQvC8cxDpjOHfF500O6FXTYzf-iksCfw@mail.gmail.com>
Subject: Re: [PATCH 0/4] SBI MPXY support for KVM Guest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_203832_740853_0B0D8E3C 
X-CRM114-Status: GOOD (  12.08  )
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgOToyOeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgU0JJIE1QWFkgc3VwcG9y
dCBmb3IgS1ZNIEd1ZXN0L1ZNIHdoaWNoIHdpbGwKPiBlbmFibGUgUUVNVS1LVk0gb3IgS1ZNVE9P
TCB0byBlbXVsYXRlIFJQTUkgTVBYWSBjaGFubmVscyBmb3IgdGhlCj4gR3Vlc3QvVk0uCj4KPiBU
aGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJlIGZvdW5kIGluIHJpc2N2X2t2bV9zYmlfbXB4eV92MSBi
cmFuY2gKPiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4KPiBBbnVw
IFBhdGVsICg0KToKPiAgIFJJU0MtVjogS1ZNOiBDb252ZXJ0IGt2bV9yaXNjdl92Y3B1X3NiaV9m
b3J3YXJkKCkgaW50byBleHRlbnNpb24KPiAgICAgaGFuZGxlcgo+ICAgUklTQy1WOiBLVk06IEFk
ZCBzZXBhcmF0ZSBzb3VyY2UgZm9yIGZvcndhcmRlZCBTQkkgZXh0ZW5zaW9ucwo+ICAgUklTQy1W
OiBLVk06IEFkZCBTQkkgTVBYWSBleHRlbnNpb24gc3VwcG9ydCBmb3IgR3Vlc3QKPiAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFNCSSBNUFhZIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QK
Pgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oICAgICAgICAgfCAgNSAr
Ky0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgIDEg
Kwo+ICBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgICAgICB8IDEwICsr
KysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9iYXNlLmMgICAgICAgICAgICAgICAgfCAy
OCArLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5jICAg
ICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9yZXBsYWNlLmMgICAgICAgICAgICAgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYyAgICAgICAgICAgICAgfCAgNCArLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgICAgICAgICAgICAgICAgIHwgIDMgKy0KPiAgLi4u
L3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgIDQgKysrCj4gIDEw
IGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5jCj4KClF1ZXVl
ZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xOQoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
