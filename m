Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A30C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 05:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RM82/0c34gDooi3PZlbfiN1rmfGPuwQeGiMo1iyNu6Q=; b=1X03RisOxEkg4W
	4DUWqeAvEjaWzdr8k93N8AQW+ojAMaS7NGDTG/oyX1pi9O9Rj9OLQYOkRd1QBiDup6gw6j2g8rPhq
	R241b49cG/xJVbRNEAXfjAkSgnCXWn0IJeKzsunBVnndcIt3q85zVq4P1iUmFom1Vvw/7FK4Q0+Dp
	gvA/2CjHg4LlTTfBazTj0UwM3s6jZoDSwUP32UdRw9+/3D/o9xUapljbH/+Ii0MhfHe2aBWySZRvD
	qqoW27KM085APzK2R2OZmMXQeXh60qtblDs9BLz1CesCtV5jHUngUxXlt3AFqauuV7T41ORVgmTS5
	WBBw4v0d6cea6gnpae3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtOu-0000000HJpK-0ykj;
	Thu, 08 May 2025 05:02:28 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtOr-0000000HJnr-2KwY
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 05:02:27 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d8dcc7cd17so5865735ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 22:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746680544; x=1747285344; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4O7+nQ6u5XMVEZ9olWj3Ht9QPAgJnl5lq5fX/yAqRY=;
        b=UqarNX5+hFDZp6WyKRY8706EvHfE7VIicdnuO1kn8Od7XJ3ZbUKG12fWYTdRIBoa36
         AK1LSEBLrGkV0kcGqh18knrl1SQOemYxda+mpcmqQIxV3801A2Y5CjdLxnoa9r/T1IFV
         aRQ6WpfJFb8nsHxtebiDIyO+FN08Tj+SJ95BoExgqbcVuW2Q6kYcccTBLmVnZ3NgjfEj
         520UvozzOiz4wq4j8f7hpoBfq6H7x2hk7A5ImkdHmccnAMd8k1DDx1/wdsdXEvPk5N6v
         iGglsyCGfpWluaE7QMw7iM1qmPLdapGyZId+5ldHdhG3hag8PXtV93uVjE3KJxl4qgrM
         h/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746680544; x=1747285344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4O7+nQ6u5XMVEZ9olWj3Ht9QPAgJnl5lq5fX/yAqRY=;
        b=djhBklsd823af7zu9crdeGBdXRWistBXvS4IrYF4J7hEprvB57S/9Hj84PpHysIYGo
         BrFH3fCY2vvKntbDc3hCh7H3PBGJwqacWUs6WewbB6Ss5CrnlDpWn35Is3oukdz16tjc
         6ksvbkKPKW1QnLG4nftdx8mS0AyLcwJmUr3WDOAcA3wt4BO9LjVrv1jn0UyQwgtYuDNq
         1jyoo92L3qE3Dnm3T19xv+sdto+ppoRth6f1S51ahxn/IoZ6e8SZiTW42ADnDWUiQ1yi
         u+ct+dY28yGoXNzJ8LHl4MC1b1SGPzgcMedSZO2W7pWUm5mF9pe24NUfSm372sAyZQ+e
         J1+g==
X-Forwarded-Encrypted: i=1; AJvYcCW52KS3NG4xqn0W9vskhsfY9n59Oa5e6qr9JRlhgcJtaUxEoVCpuTLlxa25BJn1qN8wkLAMgiILlCi4sA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFvbq1Dhd8g+RM3mW30gQYwAw8bEd7IpInhwaT8Yl/N9BSMbTc
	uppUAJD8V4OHFCMz885Vl/IEcooHX7YzHP3Vwq3qOia4pOeldU3AgZ3u0OIeCXqDR4iMNSj011p
	hevVzjIR4A81b6WxDFxrgVr0IP9VhK3N7IaOOvg==
X-Gm-Gg: ASbGncsChWCuIkjOuWucAlL1g2Bf0G66t79R5ZfHnYL1lhSn8AmvWeYpnuWLa4wW6tC
	ZYHBHimMO29uKM+pH11efSjQKnWI/+folxm0KAZpJZ+TvvOqJO2UsDwbcl5AFLNwiThvtInnJoV
	3RwnPAcNuabS7ahhCEgs50
X-Google-Smtp-Source: AGHT+IECR9VWWp5sM9ekT0izdpJvnXGhLFrUYyeXvUgiyjcyi/z8ERS2MGNabEsCST5MXjtN+VKccxirLbFB93wPSAg=
X-Received: by 2002:a05:6e02:33a1:b0:3d2:af0b:6e2a with SMTP id
 e9e14a558f8ab-3da7854d904mr27339085ab.5.1746680543894; Wed, 07 May 2025
 22:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com> <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
 <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
In-Reply-To: <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 May 2025 10:32:13 +0530
X-Gm-Features: ATxdqUHAtn3fdoGp6jzvIyBGtoq6BWz_b3EO39aBJbq4imtAWzXWd7ChbJprOwA
Message-ID: <CAAhSdy0tb5Su_4ydBx1eSt6_1PPpgt1gE=nx53mwum=5DPzMRw@mail.gmail.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_220225_797265_85F1FA04 
X-CRM114-Status: GOOD (  12.91  )
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

T24gV2VkLCBNYXkgNywgMjAyNSBhdCAxMDo1OOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDUtMDdUMTc6MzE6MzMrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gVGh1LCBBcHIgMywgMjAy
NSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+
IHdyb3RlOgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4+IEBAIC01
NSw2ICs1NSw4IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPiA+PiAgdm9pZCBrdm1fcmlzY3ZfdmNw
dV9zYmlfc3lzdGVtX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiA+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHR5cGUsIHU2NCBmbGFncyk7Cj4g
Pj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgcGMsIHVuc2lnbmVkIGxvbmcgYTEpOwo+ID4KPiA+IFVzZSB0YWJzIGZvciBhbGln
bm1lbnQgaW5zdGVhZCBvZiBzcGFjZXMuCj4KPiBPb3BzLCBJIHRvdGFsbHkgZm9yZ290IHRoYXQg
bGludXggdXNlcyB0YWJzIGV2ZW4gZm9yIGFsaWdubWVudC4KPgo+ID4gT3RoZXJ3aXNlLCBpdCBs
b29rcyBnb29kIHRvIG1lLgo+ID4gSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNvbW1l
bnQgYXQgdGhlIHRpbWUKPiA+IG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KPgo+IFRoYW5rcywgSSds
bCBwb3N0IHYyIHdpdGhvdXQgdGhlIHRocmVlIHBhdGNoZXMuCgpCYXNlIHlvdXIgdjIgdXBvbiBy
aXNjdl9rdm1fcXVldWUgYnJhbmNoIGF0Cmh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGlu
dXguZ2l0CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
