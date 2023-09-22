Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96235CE7A81
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 21:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siSFN+eg4S+c30Hp4+058ePljTmxgRem/PmqVh+SM9U=; b=a/TLT9X5mel0nZ
	i+siIgYzF+K29eVVololbEVluByRtr8Mqhm48EUhQXcbJQeiBHCcJxyJaBXi2WrREI0GwASsDS/Pv
	gAehUFMu2OzAG1cozpIK/GeIhZutrEe29U9l4jZd+p/1TPyi6SibCw/mO6mCOfam44wo2eq7sCHYX
	wD3DMUyZ2dnA8ouPYqhRU9QZ1ln/hm95KxHSxgvWngQDZqkQIHFAHGvqDk0HvQrLRMt7Sx3lQvpab
	1M3GcIn3esql/WLPUdLwztSYmWDTfpKo33XOcOV62xXnuoaihW0H8Mx28Ng7k+5DyrRnUPpBPY1d5
	z4c/GvQnn1FTwqi8X/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjnh5-009rCj-2f;
	Fri, 22 Sep 2023 21:28:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjnh3-009rBw-34
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 21:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695418088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YilQ5WpNjmLk9g6RVDu6cjEDNsN7lZeBSR6AfTwYMoc=;
	b=ahPlhr0vh5LvUUYkvHMo/5E1dvVeMrf8wUDLNSudeGIO15QImVe/URjxKoTcxDI/epceHN
	PDFTyvjw1GLD/fXqb8lYnUc617MFwxXAlU8gXGkFshf22YtSClLM87fpQVEYXCWJCMUSge
	36P0PDn0i+godt1D/ZHw6wLxYBfpfqI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-vjBTNHo_Mu6XECYbX21Pyg-1; Fri, 22 Sep 2023 17:28:06 -0400
X-MC-Unique: vjBTNHo_Mu6XECYbX21Pyg-1
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-45281fdfbdcso1256446137.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 14:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695418086; x=1696022886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YilQ5WpNjmLk9g6RVDu6cjEDNsN7lZeBSR6AfTwYMoc=;
        b=KBKOxnUJJTe/nSl0G4GUcKTfEbgMPZ+LpYpmAX22tz8DFCzCQeez0nbTWVCEhasvn3
         G7A8T5pP5BhTIhkVIJVIzKOMDF3xVv67BcKc/wm7aA8+qwSy6yYLFAuJOGaKwDuZQssH
         r7TjAauHW5oX1ot033IhoAzxDtNJ6PTeIfy3/u7/wDo3oWTP+oPfcwP9TkAL4j5F1eNR
         qEaoBMzlHzg3nkvzuALJ2oR4VsPrTIjO0wfOZUH+uVRp6S0gKH3T/vN3OfMXyWvI3pB+
         CYU22fHMnH9mT84QQOAMasuoDoVfNIQbK05jnZo04cYE0VmG+b6tLst3bOgXgfByT1RO
         EzaQ==
X-Gm-Message-State: AOJu0Yx6rlu5PWQjzOo66UlkJozz+Q5cmGhH0Ej/A4SoNQNYlhDY1KPi
	YmeUHgNE5XjUkEpxw1Kbb4178FzPfDpvMJSe+4sNS1fZxkBR52/MflKahyjcxsn2bYr9+uwDyve
	cPEjWTweMsPD+3MQl7+OcF7yLnxljSOt6RbvKxHcv296V
X-Received: by 2002:a67:e3ac:0:b0:452:8953:729e with SMTP id j12-20020a67e3ac000000b004528953729emr682982vsm.13.1695418086004;
        Fri, 22 Sep 2023 14:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ0fIpquBXBNq3l0iEdeQY+FY/SNsrw0iVd0n976vxEoYdNhJwd93x+JRPYPbA7AsDby6xUWMNTwoQTzTR2Tg=
X-Received: by 2002:a67:e3ac:0:b0:452:8953:729e with SMTP id
 j12-20020a67e3ac000000b004528953729emr682972vsm.13.1695418085766; Fri, 22 Sep
 2023 14:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3dL1JBSsu3yrQtJKavAkqMva=YotoV_y_+-kt0S0oVNA@mail.gmail.com>
In-Reply-To: <CAAhSdy3dL1JBSsu3yrQtJKavAkqMva=YotoV_y_+-kt0S0oVNA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 22 Sep 2023 23:27:54 +0200
Message-ID: <CABgObfa48fkRqyaG0DWB7bkq435zeN3R0NjoY9_JP0BJ+AQCBw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.6, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_142810_062541_7C907C82 
X-CRM114-Status: GOOD (  12.60  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMTE6NDTigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSBmb3VyIE9ORV9SRUcg
cmVsYXRlZCBmaXhlcyBmb3IgNi42LiBPdXQgb2YgdGhlc2UsCj4gdHdvIGFyZSBmb3Iga2VybmVs
IEtWTSBtb2R1bGUgYW5kIG90aGVyIHR3byBhcmUgZm9yIGdldC1yZWctbGlzdAo+IHNlbGZ0ZXN0
Lgo+Cj4gUGxlYXNlIHB1bGwuCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgY2U5ZWNjYTAyMzhiMTQwYjg4ZjQzODU5YjIxMWM5ZmRmZDhl
NWI3MDoKPgo+ICAgTGludXggNi42LXJjMiAoMjAyMy0wOS0xNyAxNDo0MDoyNCAtMDcwMCkKPgo+
IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dp
dGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNjdi1maXhlcy02LjYtMQo+
Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA3MWVmMDcwY2E3N2U2ZGZlMzNmZDc4
YWZhMjkzZTgzNDIyZjA0MTE6Cj4KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU2VsZWN0aXZl
bHkgZmlsdGVyLW91dCBBSUEgcmVnaXN0ZXJzCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiBLVk0vcmlzY3YgZml4ZXMgZm9yIDYuNiwgdGFrZSAjMQo+Cj4gLSBGaXggS1ZNX0dF
VF9SRUdfTElTVCBBUEkgZm9yIElTQV9FWFQgcmVnaXN0ZXJzCj4gLSBGaXggcmVhZGluZyBJU0Ff
RVhUIHJlZ2lzdGVyIG9mIGEgbWlzc2luZyBleHRlbnNpb24KPiAtIEZpeCBJU0FfRVhUIHJlZ2lz
dGVyIGhhbmRsaW5nIGluIGdldC1yZWctbGlzdCB0ZXN0Cj4gLSBGaXggZmlsdGVyaW5nIG9mIEFJ
QSByZWdpc3RlcnMgaW4gZ2V0LXJlZy1saXN0IHRlc3QKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbnVwIFBhdGVs
ICg0KToKPiAgICAgICBSSVNDLVY6IEtWTTogRml4IEtWTV9HRVRfUkVHX0xJU1QgQVBJIGZvciBJ
U0FfRVhUIHJlZ2lzdGVycwo+ICAgICAgIFJJU0MtVjogS1ZNOiBGaXggcmlzY3ZfdmNwdV9nZXRf
aXNhX2V4dF9zaW5nbGUoKSBmb3IgbWlzc2luZyBleHRlbnNpb25zCj4gICAgICAgS1ZNOiByaXNj
djogc2VsZnRlc3RzOiBGaXggSVNBX0VYVCByZWdpc3RlciBoYW5kbGluZyBpbiBnZXQtcmVnLWxp
c3QKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IFNlbGVjdGl2ZWx5IGZpbHRlci1vdXQg
QUlBIHJlZ2lzdGVycwo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAg
ICAgICAgICAgICB8ICA3ICsrLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yv
Z2V0LXJlZy1saXN0LmMgfCA1OCArKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
