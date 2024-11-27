Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B827D6ACF4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOplsr2QknvvEVtuixnRcaXcTw8HkS58C7OMmSgrev4=; b=4NF1iXYkqI+Es1
	9vwSVnsBNFC3jn+lsx1xOfyqH3eCzL6PNlyYe3AirtTZjez7vzTqFzfdWHayO5C1mlh0IQz1o3STJ
	CdzdmCWCE8DrcMrL4bNlQryyv+sAKs9Y8vgMsCksohKBB5AeWQ4YBfdX2+PgHka+0enbctiKtStlo
	JmGU+zVnvp+KyxKxM+F8eRBornat3Rc30wGtcCcJlM1l5nk8/NQShsfZMx2NbSgfG1+3Ywf6RZSUj
	jNNtVyjKGx5tjQ9tjk1TGA0MuSbt8lu7GofFgrYbKfCfBfBZSJ5Sl3HNS+yIMNONmElpCq09gyc3a
	fWAEkcQK6Jh/Wp2kcKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL3X-0000000DefC-2qG3;
	Wed, 27 Nov 2024 16:38:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL3T-0000000DeeF-1llX
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 16:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732725497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afE31lUK+/6tVm+DJ+Y3g8/UJ0QVmsOY1tXmRc3zdA8=;
	b=KLqoA6A8uMJODJ6m39jMRntyECzdM3C2iOExcqKommV2RYwyNPq0s5L5NEjB4jGzUIdqre
	c9DQralRFh+XC+dqnlDDZXRFQtMFPOernDy2+FtTaAK4nnLqLvUZI4+jkq7dzFPxPVkAb7
	H39kUh1EQbRK/rP2z2Jb4Yvn2sbArZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-T1SILUEZOSm3efVIwqM6xw-1; Wed, 27 Nov 2024 11:38:16 -0500
X-MC-Unique: T1SILUEZOSm3efVIwqM6xw-1
X-Mimecast-MFC-AGG-ID: T1SILUEZOSm3efVIwqM6xw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-382341057e6so3633060f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 08:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732725495; x=1733330295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afE31lUK+/6tVm+DJ+Y3g8/UJ0QVmsOY1tXmRc3zdA8=;
        b=i4JkOikkmNutwslid3tlKouL2GbdJMLQsZwC1lJnKuaoiypk+9Uo5bokZ1Ja5F2B/S
         iPvfXh1rT13a7T70xc7abwXEzrM0fwf4Iqfty3WB1olslJ5yZTxEBcqNhDH8zwGD6hgn
         hQj9wU4pNhFPomyr+hgbxLGrHrQqkuGWr1HEvnGc0IJe5w/D1qDCinhoqA9vKx4/9fDu
         473J3bJRHUmYnnyX1GLi2g0JhhjPMITG+gIplhdZxN0cAAOq43DiKVZTP1ik/7gtyVj8
         Oq1wemgVnOKNkCVL+8WvBUqa4FWGJj4Eg+Nbfx0ccZp4l1ZWWi56qB1qxXaBBSFJjpL/
         Klmg==
X-Forwarded-Encrypted: i=1; AJvYcCXjXv+2gM2ythrl4nGwDMT5AK8YNOjEsnQrT5EYWY9KoOo8bh+eWH5MFKKsrWEm8p0M2y8dl6clC7TnQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6BAdrXE2h5tQIAzLGeqxcY53okDS6jgwv8gqHNkylRMXQ1HeK
	NAvTxuH/2UFakVpm+/RJP94MNCWimuCNRFRr/w4FlqC7EUyoDyZ7JeKezZ6b4S5S/Jo8q8SiMWl
	Hz0FWAvGHt7mCU7zMCbhLw6FzLSbRCWhwZtygVy4x2q5OTNVmBl9eH4hi8ttXyRLrOdKDaaL84B
	bqMSi+at7uKtuMaMNPlSQl7S6zW3VR0EMvhYVA9n91
X-Gm-Gg: ASbGncukqFaNWABei1OHK86V3RJ7J7QjIMzYXXhKQFo3FZZssSABVY26RaJiJ/QBK5y
	/l47dp6TsDDW7L+FizfHnUsVHXpC2oF2k
X-Received: by 2002:a5d:5f53:0:b0:381:cffc:d40b with SMTP id ffacd0b85a97d-385c6eddb83mr3051305f8f.39.1732725494802;
        Wed, 27 Nov 2024 08:38:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8a3nxjTefB5MHFfWxupT+6qo4a3qig88kkXoZUYfsMcqJnap4vBza1hw0BxDwUCN1o7X13TJ6FB5P8J+GDIQ=
X-Received: by 2002:a5d:5f53:0:b0:381:cffc:d40b with SMTP id
 ffacd0b85a97d-385c6eddb83mr3051286f8f.39.1732725494457; Wed, 27 Nov 2024
 08:38:14 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
In-Reply-To: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 17:38:01 +0100
Message-ID: <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13, part #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dk9ishJsj5KtF3aCJZSZ2NcRfcntPULEtciTYW8j0rA_1732725495
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_083819_529663_5DA75A60 
X-CRM114-Status: GOOD (  17.46  )
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

T24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMTo1NeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBBcyBtZW50aW9uZWQgaW4gdGhlIGxh
c3QgUFIsIGhlcmUgYXJlIHRoZSByZW1haW5pbmcgS1ZNIFJJU0MtVgo+IGNoYW5nZXMgZm9yIDYu
MTMgd2hpY2ggbWFpbmx5IGNvbnNpc3RzIG9mIFN2YWRlL1N2YWR1IGV4dGVuc2lvbgo+IHN1cHBv
cnQgZm9yIEhvc3QgYW5kIEd1ZXN0L1ZNLgo+Cj4gUGxlYXNlIG5vdGUgdGhhdCBQYWxtZXIgaGFz
IG5vdCB5ZXQgc2VudCB0aGUgUklTQy1WIFBSIGZvciA2LjEzCj4gc28gdGhlc2UgcGF0Y2hlcyB3
aWxsIGNvbmZsaWN0IHdpdGggdGhlIFJJU0MtViB0cmVlLgoKVGhlIFJJU0MtViBQUiBoYXMgbm90
IGJlZW4gbWVyZ2VkIHlldCAoaGFzIGl0IGJlZW4gc2VudD8pIGFuZCBJIGFtIG5vdApzdXJlIHdo
YXQncyBoYXBwZW5pbmcgaGVyZS4gSWYgdGhlc2UgYXJlIG1lcmdlZCBmaXJzdCwgcHJlc3VtYWJs
eQpMaW51cyB3aWxsIGJ1bXAgdGhlIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBjb25z
dGFudHMgLS0KbGVhdmluZyBTVkFERS9TVkFEVSBhdCA4NyBhbmQgODggYW5kIGFkanVzdGluZyB0
aGUgb3RoZXJzLiBTaG91bGQgSSBkbwp0aGF0IG9yIGlzIGl0IGRlbGF5ZWQgdG8gNi4xNCBhdCB0
aGlzIHBvaW50PwoKUGFvbG8KCj4gUGxlYXNlIHB1bGwuCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+
IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMzMyZmE0YTgwMmIxNmNjYjcyNzE5
OWRhNjg1Mjk0Zjg1Zjk4ODBjYjoKPgo+ICAgcmlzY3Y6IGt2bTogRml4IG91dC1vZi1ib3VuZHMg
YXJyYXkgYWNjZXNzICgyMDI0LTExLTA1IDEzOjI3OjMyICswNTMwKQo+Cj4gYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0t
cmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LTYuMTMtMgo+Cj4gZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIGM3NGJmZTRmZmU4YzFjYTk0ZTNkNjBlYzdhZjA2Y2Y2NzllMjM1ODM6
Cj4KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNp
b24gdG8gZ2V0LXJlZy1saXN0Cj4gdGVzdCAoMjAyNC0xMS0yMSAxNzo0MDoxNiArMDUzMCkKPgo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBLVk0vcmlzY3YgY2hhbmdlcyBmb3IgNi4xMyBwYXJ0ICMyCj4KPiAtIFN2YWRl
IGFuZCBTdmFkdSBleHRlbnNpb24gc3VwcG9ydCBmb3IgSG9zdCBhbmQgR3Vlc3QvVk0KPgo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiBZb25nLVh1YW4gV2FuZyAoNCk6Cj4gICAgICAgUklTQy1WOiBBZGQgU3ZhZGUgYW5k
IFN2YWR1IEV4dGVuc2lvbnMgU3VwcG9ydAo+ICAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRk
IFN2YWRlIGFuZCBTdmFkdSBFbnRyaWVzCj4gICAgICAgUklTQy1WOiBLVk06IEFkZCBTdmFkZSBh
bmQgU3ZhZHUgRXh0ZW5zaW9ucyBTdXBwb3J0IGZvciBHdWVzdC9WTQo+ICAgICAgIEtWTTogcmlz
Y3Y6IHNlbGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNpb24gdG8gZ2V0LXJlZy1s
aXN0IHRlc3QKPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3NyLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysr
KysrLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgICAg
ICB8ICAyICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAg
ICAgICAgIHwgMTIgKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKysKPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgfCAgOCArKysrKysrCj4g
IDEwIGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
