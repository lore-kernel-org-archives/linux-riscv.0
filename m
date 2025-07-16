Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B54C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 05:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bE/JkHpclDrOjbRLUTysfSxPCwHZkNlOUMv/lv2USs8=; b=gDzhT4H0V8cizh
	6PMK6RuuIr0a6uwM7uOwqvoIF6U+mgIyjyab7nU2acSM9iZMauOeR0sjNbc2wywmD1yLrLrHlavGw
	N1JIiOcH30eWnbK2Ps1OypQci0uB4G5ZHGfXrTJGdHBSKIYkm/9LEwya/KyoRI4kMasbvd+rJNSQr
	QF7kSrQamq4QmwoMiRPZfww6Y0/7K9ComQs83Ov4awpB7juQkH71v9rPxdu+SrI3PF3rKn9+844wT
	kPweFVcP6ouMdWxuhlpznv3qmy/BCeG5bmBqUo2D7LasIX8o6dn+21Ii033vHbQ5afBe9u5+42Po6
	2zKRl0gjM7gn/jybz0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubukk-00000006nXl-3flw;
	Wed, 16 Jul 2025 05:32:26 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuYz-00000006mbR-2uqn
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 05:20:19 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3df2d111fefso53386015ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752643217; x=1753248017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pr0CgkuBDoCBojEhq3SOwjdkjudDtqxy7ZuiK0Se4o=;
        b=dZtZyP+OlnQeN53F4SIpc+if3dVoo8/6qY38dbX3ONt1+ODwsUsoDXFlVFq7gjFnse
         3NdL8fGKkQiAIyasF1k+FVYa/GP+8JfXScXXW6ETQIWh3AbwCeyvEln4Kf6ESggbq88n
         8XFmFH1zibgmmTrUW0QhFj07VQz3H8X95P/cnxQVPq09rIXL3MpNno1pVSuR4OGbp+kT
         9BfTaIzBgKneUl+u1opbtYVixFaWdkPDOMfsMf2pmyNbbdplGlDNg4+0gkW36CKYDxds
         QKhojbt5yZbIgFaKTgDoC6e6jGz9DDDA+S/mcYTJitVxva/CeT/E9yo2vu9HvfHeB9yE
         F5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752643217; x=1753248017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pr0CgkuBDoCBojEhq3SOwjdkjudDtqxy7ZuiK0Se4o=;
        b=rCH39idOXFGNF2JtvjMlfkqA1X207MLhQ08qGKn439OtCoCEx23HVrhmrWq6KnJiwC
         YD9xgjZR/+ZnjydUBt0x0x2WIsxXCf5SPvPefOFmg6k8ixj6TVrP8V2V188PDd5+Ai9r
         3u+uy9GgtSXEvtqMIysTPUxs8bE/2yRZx6bw96eWt1CaKsCJE+OxzjorO0AGFz82TxHf
         t1PgixBby8D8NN3Q/7yZgNSmjhJ12vovR6FhUQyNHZCAS4NBEPtIzGmrASVWePRp/wgb
         25i56L9m+zBfoyZyo5/kLCTmwIorEb6+ezRzo302MTDRvngbZf7U8qPD1+CZMMt+5JAh
         hnLA==
X-Forwarded-Encrypted: i=1; AJvYcCWGWsJ8tB0AncxyxZ6+PnXHQKdD3MIOaG7dbqUnN/B/urwP41eCtJWVfB0BtJEbIOihj+m7DSvEkoFQew==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZiNtW+C7QfL3aWQpRqkPFrjxujR2lQL/mokQ9Tv4weFJ/FCS1
	K+Som/dqb2+93PzN1KCOuzRRJ/rgSxRy8DhRU3CBg48ntYs3Xf25mNJw5fNtX53Uu/UfDvaS+25
	5xi9ihIt9phHqsvrNKb9/KkCW7geRjWJ199CKW++k4g==
X-Gm-Gg: ASbGncuWjLKU01pNMnBy7R4rYGCy3Xvm8EEbIsriWi2DU4G2BzbqaSa3JBKEahgWsju
	pinFo916bhUluYubsODlY9Rw0VIciIAoS1E35o0sZhv6Q+gHb17zFtP41OxlZe9B7S6cBh0zfyO
	bpaHfgCntBjhJ8BiUrXi2R2MpS+vFrNzb5dckIXWAj8Bd7qHGn0v3+fGitQT1qg4RnrwsN6vYoN
	cEab898qgdVZ+f2
X-Google-Smtp-Source: AGHT+IG8QMvIrF4Nh6TtjPYY/OImrdrVsXWR40Aodp+LssWG0nbwGxcm5vyJpoaN8ajvyQHU4KVCDRQEYdjX4PMmHto=
X-Received: by 2002:a05:6e02:1c07:b0:3df:29c5:2972 with SMTP id
 e9e14a558f8ab-3e282da9cd2mr14405455ab.9.1752643216752; Tue, 15 Jul 2025
 22:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250714094554.89151-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250714094554.89151-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Jul 2025 10:50:05 +0530
X-Gm-Features: Ac12FXys72h69btMJ897A7pa9H69kTczP7dldA--hcTTkswEbCjKDSzqpxxAxFs
Message-ID: <CAAhSdy2XEyphi5K1xk29JXY991aie0LA5YF2zRbgA_8imSjXQQ@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: KVM: Delegate illegal instruction fault to VS mode
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: rkrcmar@ventanamicro.com, cleger@rivosinc.com, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_222017_970224_B0025FFE 
X-CRM114-Status: GOOD (  14.24  )
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

T24gTW9uLCBKdWwgMTQsIDIwMjUgYXQgMzoxNuKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
dG8gVlMgbW9kZSBieSBkZWZhdWx0IHRvIGF2b2lkIHN1Y2gKPiBleGNlcHRpb25zIGJlaW5nIHRy
YXBwZWQgdG8gSFMgYW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPgo+IFRoZSBkZWxlZ2F0aW9u
IG9mIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgaXMgcGFydGljdWxhcmx5IGltcG9ydGFudAo+
IHRvIGd1ZXN0IGFwcGxpY2F0aW9ucyB0aGF0IHVzZSB2ZWN0b3IgaW5zdHJ1Y3Rpb25zIGZyZXF1
ZW50bHkuIEluIHN1Y2gKPiBjYXNlcywgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB3aWxs
IGJlIHJhaXNlZCB3aGVuIGd1ZXN0IHVzZXIgdGhyZWFkCj4gdXNlcyB2ZWN0b3IgaW5zdHJ1Y3Rp
b24gdGhlIGZpcnN0IHRpbWUgYW5kIHRoZW4gZ3Vlc3Qga2VybmVsIHdpbGwgZW5hYmxlCj4gdXNl
ciB0aHJlYWQgdG8gZXhlY3V0ZSBmb2xsb3dpbmcgdmVjdG9yIGluc3RydWN0aW9ucy4KPgo+IFRo
ZSBmdyBwbXUgZXZlbnQgY291bnRlciByZW1haW5zIHVuZGVsZXRlZCBzbyB0aGF0IGd1ZXN0IGNh
biBzdGlsbCBxdWVyeQo+IGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZXZlbnRzIHZpYSBzYmkgY2FsbC4g
R3Vlc3Qgd2lsbCBvbmx5IHNlZSB6ZXJvIGNvdW50Cj4gb24gaWxsZWdhbCBpbnN0cnVjdGlvbiBm
YXVsdHMgYW5kIGtub3cgJ2Zpcm13YXJlJyBoYXMgZGVsZWdhdGVkIGl0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBm
b3IgTGludXgtNi4xNwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggODVjZmViYzMyZTRjZi4uM2Y2Yjky
NzBmMzY2YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtNDQsNiArNDQs
NyBAQAo+ICAjZGVmaW5lIEtWTV9SRVFfU1RFQUxfVVBEQVRFICAgICAgICAgICBLVk1fQVJDSF9S
RVEoNikKPgo+ICAjZGVmaW5lIEtWTV9IRURFTEVHX0RFRkFVTFQgICAgICAgICAgICAoQklUKEVY
Q19JTlNUX01JU0FMSUdORUQpIHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQklUKEVYQ19JTlNUX0lMTEVHQUwpICAgICB8IFwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfQlJFQUtQT0lOVCkgICAgICB8IFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfU1lTQ0FMTCkg
ICAgICAgICB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJ
VChFWENfSU5TVF9QQUdFX0ZBVUxUKSB8IFwKPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
