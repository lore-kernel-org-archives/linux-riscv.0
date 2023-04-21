Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3736C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 23:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4LYQh9FZzMmZKcxsrWuRsErLFBYODRqW7cwIbH6Icw=; b=MZK391rNaAmsXS
	N2bPfEO1zbo9yo5/nbBD9jvOt9NdXY4cUxa7bUZMsSNQ9F2hOc5T9ElQUFbtM3IwE+L85+HGbA7Zd
	QAVaBOnR2lXwyOmKMKqNR2Boe/aRn1tbmaXnh0rhBF84L/kFQ46mLtApXPVqg821GaZU1VDynKG7W
	ZAY/NEF/wjJy/oVxEMtZsyi5um+gf7dJdCWciFMYrn3JdIlPyytOv7c76g08oau3H/V73je9SS6EO
	aMpOTCBa9WJ5op5uPKksFucJbd6WerkGq4fj15d4jL3kNv6VuYzSiMdokCgJwZXFOXuorKlkaUDuH
	likNZoW6ulauTbrplb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pq0TF-00C5XA-1D;
	Fri, 21 Apr 2023 23:47:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pq0TC-00C5V6-13
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 23:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682120833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ToPFBZRZwwcbfkNhosaQClC7SiVbXSkZAsqSyiQXGpI=;
	b=hWZbICNL08wbX3v60ZsxOlSyKIVed7fQJMgEKXoJSryTPEcCryokAbYkZW47bY+jvV4whk
	/XEMkVBBhrVmGCICDaWSZNvkpsLCV015GzCowlZgoMpoqqcgHlvnxsFIkWc5z2UuQmUYUx
	wUwZEsT8b2SeVlXokiI0/g75xpndzXU=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-7AYu12quM8iBTzIDxx-U_Q-1; Fri, 21 Apr 2023 19:47:12 -0400
X-MC-Unique: 7AYu12quM8iBTzIDxx-U_Q-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-771bf96c2cdso661725241.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 16:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682120831; x=1684712831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToPFBZRZwwcbfkNhosaQClC7SiVbXSkZAsqSyiQXGpI=;
        b=DS/ghqrFKv0hzR741Z6pp2HWnSt/fNporIcEn4i8XY+BolHDSnZzn6U4vWANpu5Zq2
         TESiX8y2dlUiszxA4Kr8ZqgfJH/Qq5OLR23gHPEfAXfXi+9/mL+4vicEGVbTMZaEoXIu
         r6WpnzYP0kiCRSL8U0NMOBkUme8WUMhO0Zb9fjEJa9ROfySFy+70gYRHN51HR/9QXhX1
         YqJKEi5IKKPv4nRfz+MNlRnrEF8Q5S82Yoc27Taa/5rnPc0Ei9cEsII0MVHYACpxBFib
         yLn4cxq1Xup2EnaEW9F4B9nVY1oXEaPLP41PEv3qoqfL5S2FmOIP1S3s9IV8BePsOyXj
         zQjg==
X-Gm-Message-State: AAQBX9cqaJFB3tPUye/HEZ6VNeSlczwMNYFoSjaVzyQ/RQacSmcG8XnC
	9uQAwCHO35S7R9Lhbbq1q+i6O1KSyb8MNEVuXQFREpFxdaj1cKh1rdj0W10XRISjenFxlK8Yvvz
	vvxK6g0E45jl0v/tMZvxJa4tHZjQwDSJK9Z6mjajH9ktGO5FOA4bUWZs=
X-Received: by 2002:a67:e955:0:b0:42f:e9ec:9d62 with SMTP id p21-20020a67e955000000b0042fe9ec9d62mr3461697vso.29.1682120831277;
        Fri, 21 Apr 2023 16:47:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yblf2VVyW6II6dJHXYr/NY8sU+y8q5t6/7PfCe+EngTirCzVpGdJ7Y1vQYsIu5F+LN1JVDdoU8FK7UOLh3KPk=
X-Received: by 2002:a67:e955:0:b0:42f:e9ec:9d62 with SMTP id
 p21-20020a67e955000000b0042fe9ec9d62mr3461688vso.29.1682120831047; Fri, 21
 Apr 2023 16:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
In-Reply-To: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 22 Apr 2023 01:46:58 +0200
Message-ID: <CABgObfbS7ej9pqmV05DKwq1929QD10EQ9XdkEb_Qhtbm1WrkeQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.4
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_164714_439291_50EEA602 
X-CRM114-Status: UNSURE (   9.10  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgNzozNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+IFBsZWFzZSBub3RlIHRoYXQgdGhlIFppY2JveiBzZXJpZXMgaGFz
IGJlZW4gdGFrZW4gYnkKPiBQYWxtZXIgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgd2hpY2ggcmVz
dWx0cyBpbiBmZXcKPiBtaW5vciBjb25mbGljdHMgaW4gdGhlIGZvbGxvd2luZyBmaWxlczoKPiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmgKPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IGFyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYwo+IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+Cj4gSSBhbSBub3Qgc3VyZSBpZiBh
IHNoYXJlZCB0YWcgY2FuIG1ha2UgdGhpbmdzIGVhc3kgZm9yIHlvdSBvciBQYWxtZXIuCgpJdCdz
IG5vdCBqdXN0IG1ha2luZyBpdCBlYXNpZXIsIGl0IGlzIGEgcmVxdWlyZW1lbnQgYmVjYXVzZSBJ
IHByZWZlcgp0byBrZWVwIGFuIGV5ZSBvbiBjaGFuZ2VzIHRvIHVhcGkuaCBhbmQgZXNwZWNpYWxs
eSB0byBhdm9pZCB0aGF0CmNvbmZsaWN0cyBpbiBLVk0gZmlsZXMgcmVhY2ggTGludXMuCgpUaGUg
Y29uZmxpY3RzIG1heSBiZSBtaW5vciwgYnV0IHRoZXkgYXJlIGEgc3ltcHRvbSBvZiBvdmVybG9v
a2luZwoic29tZXRoaW5nIiBpbiB0aGUgd29ya2Zsb3cuCgpJZiBJIGNhbiBnZXQgdGhlIHNoYXJl
ZCB0YWcgZnJvbSBQYWxtZXIgdGhlbiBnb29kLCBvdGhlcndpc2UgSSBzdXBwb3NlCnRoaXMgUFIg
d2lsbCBhbHNvIGhhdmUgdG8gYmUgZGVsYXllZCB0byB0aGUgc2Vjb25kIHdlZWsgb2YgdGhlIG1l
cmdlCndpbmRvdy4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
