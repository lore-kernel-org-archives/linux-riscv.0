Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BCCC46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 23:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5V29nNTVlpeRnOLp+J9Ss7G7glcF7qFODtrAPVqCWw=; b=H8/h1woFdW21BD
	uOsCUfV+/68WfHudGnCVO+bUWjOIxxASvclszz6g04xhB1kMUXk514LKsu8xwcSoLsyDTK06fHKE7
	ALCMU6/cobixM7BMQ6cyrHyGbzaCnf/eqZPmePJBSvfMW1wlACdfnCSwzROiQsDQ00zSpzCR0dIQe
	5Ol//TmwpvOwN4kYK1t7Mi/hubaEJJU5XF51c7Yt9QMfVk7z4nqdoAqacfYir2btLENDaOrkiu4uM
	Od8t/QKkWbEy/DBrTcnHqgK3nyTm9vooeLWfpGoeJk174bRpJVGtiDJIpTfFbAbQ0Z5w7D+JDhQnu
	EC3w3V6bac3Yi1W+pBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGoeB-006zCi-2a;
	Fri, 22 Dec 2023 23:09:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGoe7-006zAq-1g
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 23:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703286572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7QxUgPvjQkB1j5kGIAmIR0AepcZoAE0LvukWZgzWxmA=;
	b=IhwUWsLpJ9SOA8lJUbPrg14Qhu75uNpimRO8LB6ZE/+jPfe7ydyxGhcIQvWxEuj8NJr1TU
	PlNgHivhc3KBpZtm3vch+QO8kTRp3JOxqI69+YS7QgenrU4SP30DF9ddltlV1n1od7VYA9
	pyxorXO2nprImrFkBH52pl7HbwljYuA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-xwVD86PWOYyOBAumCBZzYQ-1; Fri, 22 Dec 2023 18:09:31 -0500
X-MC-Unique: xwVD86PWOYyOBAumCBZzYQ-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dbac6bb6b6so2515537a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 15:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703286567; x=1703891367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QxUgPvjQkB1j5kGIAmIR0AepcZoAE0LvukWZgzWxmA=;
        b=gxJfvS6wYGgIC8w7wpZafkyOVzmnARmPuB8Ug5wts26s1IVw6OWCP/1nkGSTlNg2ZM
         86VbmDG+34PoxXwaWhbxikI0U/uVEl/T7lzNpcfDppNqTq5T4jkkyC7e+qk8QzQ3N33G
         hYW7/VMJxr1gf31H0KLo12Fm+9acxEHMLjhZV72uVrfj4psRbV18QJLMEZKdGX6HqeNF
         RFcQxFMIb5GXsu2booMicWwS/8N6SLEKJnyJgFTYmxsxII4fKIaqZCd71C6LlqExmIUr
         IwH1oZJfBN9EKEAtAcR/iyhZHnPdvpRi1UKb5E9FvXFTbPq5byLnRXBmGrZqEkFUbnOD
         K8Rg==
X-Gm-Message-State: AOJu0Yy0K2Py1OPf9rs+nUg6NQfhArlij0g4lyEI3b9FRarphYyXs/BX
	Y4PkK19Qla5r3JKpgFBspr+sv0I2aN2L7eaJe3++p/ni2pewPP/NnjHRf56sz9jW9K6cRDYQiiP
	gHn1xNtZwg3jHQXDNxVvt/ywiAruKTc7Bo5H528zUH6cER46fJOSX
X-Received: by 2002:a9d:62d9:0:b0:6db:d447:f5bd with SMTP id z25-20020a9d62d9000000b006dbd447f5bdmr185278otk.65.1703286567050;
        Fri, 22 Dec 2023 15:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg9Yq1vo5iEsrWiv/QXqse3NghlwvPYK7/Mb/xVU6UpOEZcBLlscdLZBz2qpkJVWSDtgZNAWhFc0mk5T6/low=
X-Received: by 2002:a9d:62d9:0:b0:6db:d447:f5bd with SMTP id
 z25-20020a9d62d9000000b006dbd447f5bdmr185274otk.65.1703286566842; Fri, 22 Dec
 2023 15:09:26 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy3Rc+vub65qJ4JNngp5qTgm7YpsJCHZy+ff0=TN_ir03g@mail.gmail.com>
In-Reply-To: <CAAhSdy3Rc+vub65qJ4JNngp5qTgm7YpsJCHZy+ff0=TN_ir03g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 23 Dec 2023 00:09:15 +0100
Message-ID: <CABgObfZuK+QcqBMQSU1ReXPBsHJvmXrwu8HxvUNhLVTqR4RWDw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.7, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_150935_629357_62DE101C 
X-CRM114-Status: GOOD (  12.82  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgNjoxNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHR3byBmaXhlcyBmb3Ig
Ni43LiBPdXQgb2YgdGhlc2UsIG9uZSBmaXggaXMgcmVsYXRlZCB0bwo+IHJhY2UgY29uZGl0aW9u
IGluIHVwZGF0aW5nIElNU0lDIHN3ZmlsZSBhbmQgc2Vjb25kIGZpeCBpcwo+IGZvciBkZWZhdWx0
IHByaW50cyBpbiBnZXQtcmVnLWxpc3Qgc2VmbHRlc3QuCj4KPiBQbGVhc2UgcHVsbC4KClB1bGxl
ZCwgdGhhbmtzLgoKUGFvbG8KCj4gUmVnYXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0IGEzOWI2YWMzNzgxZDQ2YmExODE5M2M5ZGJiMjExMGYzMWU5YmZm
ZTk6Cj4KPiAgIExpbnV4IDYuNy1yYzUgKDIwMjMtMTItMTAgMTQ6MzM6NDAgLTA4MDApCj4KPiBh
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRo
dWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNi43LTEKPgo+
IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0YWQ5ODQzZTFlYTA4OGJkMjUyOTI5MDIz
NGM2YzRjNjM3NDgzNmE3Ogo+Cj4gICBSSVNDVjogS1ZNOiB1cGRhdGUgZXh0ZXJuYWwgaW50ZXJy
dXB0IGF0b21pY2FsbHkgZm9yIElNU0lDIHN3ZmlsZQo+ICgyMDIzLTEyLTEzIDExOjU5OjUyICsw
NTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBmaXhlcyBmb3IgNi43LCB0YWtlICMxCj4KPiAt
IEZpeCBhIHJhY2UgY29uZGl0aW9uIGluIHVwZGF0aW5nIGV4dGVybmFsIGludGVycnVwdCBmb3IK
PiAgIHRyYXAtbi1lbXVsYXRlZCBJTVNJQyBzd2ZpbGUKPiAtIEZpeCBwcmludF9yZWcgZGVmYXVs
dHMgaW4gZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQW5kcmV3IEpvbmVzICgx
KToKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEZpeCBnZXQtcmVnLWxpc3QgcHJpbnRf
cmVnIGRlZmF1bHRzCj4KPiBZb25nLVh1YW4gV2FuZyAoMSk6Cj4gICAgICAgUklTQ1Y6IEtWTTog
dXBkYXRlIGV4dGVybmFsIGludGVycnVwdCBhdG9taWNhbGx5IGZvciBJTVNJQyBzd2ZpbGUKPgo+
ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxMyAr
KysrKysrKysrKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVn
LWxpc3QuYyB8IDEwICsrKysrKy0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
