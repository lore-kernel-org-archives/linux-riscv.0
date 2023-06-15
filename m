Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB175EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 20:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqMCWVMXl23Hs3Qd1pXBosD5AjUj97aukbeeNPOHLrg=; b=iXvpfKFXWhhofy
	BUWQLnzpoee1UHpUywPegQ2udNH+zSDobjqy+FaNnJRPz+HPXANfg0Go7WAe9qTyzgeEdoS8QzS7e
	hyEHv0Bs1nffjSHTGPWf0IT+Af0hA2DjlExYI8i/uFimyYS/J3C9UhVGhfZvZ83n+/JMV7yJen7j6
	V/8TGhDlFXyxAcdoNMwl0HJKTXvg5MgJ6za4R2O1LeEZJG/DpvKN8uhPcgAa4MHljxakVbbBDzpZK
	wWiZCPXL8BbdTAx20IdkDYdx9GLcH+QCtBSdF5d2mab3ekigRtVUPNeEVA2nKFsa4QdoQNgihGVJI
	3KFwafyZFwY1bgnqzuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9trY-00G3X1-0t;
	Thu, 15 Jun 2023 20:46:36 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9trV-00G3WU-0J
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 20:46:34 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3f9d619103dso18001cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686861991; x=1689453991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXkt2ZBGU5jZyQ4WPhoCS7lB4yMdQci0tXI9tZaRrDU=;
        b=VPDs1chprSogpzpFP36IMnSxKMQrt703kO5bMV14QmFX+mMfQWvD6k1MQe9SpXt8JN
         5YltQ9sjq3koyeq+fBA66GSKE7XMlhWNL+JL3RpiE7c4I22f28WhlakVexRJFVME5vM0
         tH95JmlXiERSIWwRGsh5TG3aoAZ0KWRqRcZMjNbj2MKzAilmKL9Ao/wFgQKIWWrcMp8o
         3l9iH6gd4j2gro6IWsBZkixJ9eAl+xG8fbD5hYXfNQoXBRfW8AYYMCljCft5rKqp971P
         59kkTeIwjyg2Vh/PwXI4YjqaPHmwKadAH3OBCn+HyxdfkVc8q2DF2Zbrgtur+LqwbU3r
         kdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686861991; x=1689453991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXkt2ZBGU5jZyQ4WPhoCS7lB4yMdQci0tXI9tZaRrDU=;
        b=d1IIRlENi3fa3AOADPI5CclmEfiNnRpDUHBFghKAfqj4ef38FQ6Upiu1sMMb68P4wx
         wko3Ohc+a5DLCHpBddJM/yQUVa0egVBz+RDGKCrdSJT06P9Ny1bMZkrCvksZ7wHMkOst
         HUkFXuhodNbvWSUc1XGBPVf4oMcqzjz/DM87KtAKViqIdiWI3UKbVmGIo32zZSfqfeMC
         lWiWRBQqodAqNuWM/OMxebZI3wW525dRevoahkjzMhUYS0y59Yr5uRwGf/HuqFDaIspE
         OaQ491fQVlL4rdDoPKR+9PBFhF/ioXECBTJpO25uv+pvND8jw22/2KrgOUCMKjkz7mH+
         +wsQ==
X-Gm-Message-State: AC+VfDxCk/bGY2GH776SYPR3OdJA/P8UBZbTblWIbLQxLejHlwB2XRi+
	TC/v4YZa/QZYt/VKN0yzvdnW4Yk/mp4+7SfX8lGGug==
X-Google-Smtp-Source: ACHHUZ4N/OwMTET2iljPnw6bbFSnqZMbHyS/G+s/58wtd3yW9j+pXrcF30ZUaVJErUv1ftafp7Gv3leEoaxgWev+1RE=
X-Received: by 2002:a05:622a:44:b0:3f9:f877:1129 with SMTP id
 y4-20020a05622a004400b003f9f8771129mr320926qtw.29.1686861991150; Thu, 15 Jun
 2023 13:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-9-apatel@ventanamicro.com> <CAGETcx-hoPNanAwe4++6roqBXwSdc7z6Ei=-r9z6qFG1U7xVXg@mail.gmail.com>
 <20230615-thyself-doornail-f0545ada9176@spud>
In-Reply-To: <20230615-thyself-doornail-f0545ada9176@spud>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 15 Jun 2023 13:45:55 -0700
Message-ID: <CAGETcx__Qt868abh-F_fu7ijMSWXciLjdjWiWf60e4_p78xb8w@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] irqchip: Add RISC-V advanced PLIC driver
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_134633_141446_65E4CD03 
X-CRM114-Status: GOOD (  38.05  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTI6MzHigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IFNhcmF2YW5hLAo+Cj4gT24gVGh1LCBKdW4gMTUsIDIw
MjMgYXQgMTI6MTc6MDhQTSAtMDcwMCwgU2FyYXZhbmEgS2FubmFuIHdyb3RlOgo+ID4gT24gVHVl
LCBKdW4gMTMsIDIwMjMgYXQgODozNeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWlj
cm8uY29tPiB3cm90ZToKPgo+IGJ0dywgcGxlYXNlIHRyeSB0byBkZWxldGUgdGhlIDEwMHMgb2Yg
bGluZXMgb2YgdW5yZWxhdGVkIGNvbnRleHQgd2hlbgo+IHJlcGx5aW5nCgpJIGFsd2F5cyBmZWVs
IGxpa2Ugc29tZSBwZW9wbGUgbGlrZSBtZSB0byBkbyB0aGlzIGFuZCBvdGhlcnMgZG9uJ3QuCkFs
c28sIGF0IHRpbWVzLCBwZW9wbGUgbWlnaHQgd2FudCB0byByZWZlcmVuY2UgdGhlIG90aGVyIGxp
bmVzIG9mIGNvZGUKd2hlbiByZXBseWluZyB0byBteSBwb2ludC4gVGhhdCdzIHdoeSBJIGdlbmVy
YWxseSBsZWF2ZSB0aGVtIGluLgoKPgo+ID4gPiArc3RhdGljIGludCBfX2luaXQgYXBsaWNfZHRf
aW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQpCj4gPiA+ICt7Cj4gPiA+ICsg
ICAgICAgLyoKPiA+ID4gKyAgICAgICAgKiBUaGUgQVBMSUMgcGxhdGZvcm0gZHJpdmVyIG5lZWRz
IHRvIGJlIHByb2JlZCBlYXJseQo+ID4gPiArICAgICAgICAqIHNvIGZvciBkZXZpY2UgdHJlZToK
PiA+ID4gKyAgICAgICAgKgo+ID4gPiArICAgICAgICAqIDEpIFNldCB0aGUgRldOT0RFX0ZMQUdf
QkVTVF9FRkZPUlQgZmxhZyBpbiBmd25vZGUgd2hpY2gKPiA+ID4gKyAgICAgICAgKiAgICBwcm92
aWRlcyBhIGhpbnQgdG8gdGhlIGRldmljZSBkcml2ZXIgY29yZSB0byBwcm9iZSB0aGUKPiA+ID4g
KyAgICAgICAgKiAgICBwbGF0Zm9ybSBkcml2ZXIgZWFybHkuCj4gPiA+ICsgICAgICAgICogMikg
Q2xlYXIgdGhlIE9GX1BPUFVMQVRFRCBmbGFnIGluIGRldmljZV9ub2RlIGJlY2F1c2UKPiA+ID4g
KyAgICAgICAgKiAgICBvZl9pcnFfaW5pdCgpIHNldHMgaXQgd2hpY2ggcHJldmVudHMgY3JlYXRp
b24gb2YKPiA+ID4gKyAgICAgICAgKiAgICBwbGF0Zm9ybSBkZXZpY2UuCj4gPiA+ICsgICAgICAg
ICovCj4gPiA+ICsgICAgICAgbm9kZS0+Zndub2RlLmZsYWdzIHw9IEZXTk9ERV9GTEFHX0JFU1Rf
RUZGT1JUOwo+ID4KPiA+IE5BQ0suIFlvdSBhcmUgYmxpbmRseSBwbGFzdGVyaW5nIGZsYWdzIHdp
dGhvdXQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQKPiA+IHRoZSByZWFsIGlzc3VlIGFuZCBmaXhpbmcg
dGhpcyBjb3JyZWN0bHkuCj4gPgo+ID4gPiArICAgICAgIG9mX25vZGVfY2xlYXJfZmxhZyhub2Rl
LCBPRl9QT1BVTEFURUQpOwoKQWxzbywgdGhpcyBwYXJ0IGlzIG5vdCBuZWVkZWQgaWYgdGhlIG1h
Y3JvcyBJIG1lbnRpb25lZCBiZWxvdyBhcmUgdXNlZC4KCj4gPiA+ICsgICAgICAgcmV0dXJuIDA7
Cj4gPiA+ICt9Cj4gPiA+ICtJUlFDSElQX0RFQ0xBUkUocmlzY3ZfYXBsaWMsICJyaXNjdixhcGxp
YyIsIGFwbGljX2R0X2luaXQpOwo+ID4KPiA+IFRoaXMgbWFjcm8gcHJldHR5IG11Y2ggc2tpcHMg
dGhlIGVudGlyZSBkcml2ZXIgY29yZSBmcmFtZXdvcmsgdG8gcHJvYmUKPiA+IGFuZCBjYWxscyBp
bml0IGFuZCB5b3UgYXJlIHN1cHBvc2VkIHRvIGluaXRpYWxpemUgdGhlIGRldmljZSB3aGVuIHRo
ZQo+ID4gaW5pdCBmdW5jdGlvbiBpcyBjYWxsZWQuCj4gPgo+ID4gSWYgeW91IHdhbnQgeW91ciBk
ZXZpY2UvZHJpdmVyIHRvIGZvbGxvdyB0aGUgcHJvcGVyIHBsYXRmb3JtIGRyaXZlcgo+ID4gcGF0
aCAod2hpY2ggaXMgcmVjb21tZW5kZWQpLCB0aGVuIHlvdSBuZWVkIHRvIHVzZSB0aGUKPiA+IElS
UUNISVBfUExBVEZPUk1fRFJJVkVSX0JFR0lOKCkgYW5kIHJlbGF0ZWQgbWFjcm9zLiBHcmVwIGZv
ciBwbGVudHkgb2YgZXhhbXBsZXMuCj4gPgo+ID4gSSBvZmZlcmVkIHRvIGhlbHAgeW91IGRlYnVn
IHRoaXMgaXNzdWUgYW5kIEkgYXNrZWQgZm9yIGEgZHRzIGZpbGUgdGhhdAo+ID4gY29ycmVzcG9u
ZHMgdG8gYSBib2FyZCB5b3UgYXJlIHRlc3RpbmcgdGhpcyBvbiBhbmQgc2VlaW5nIGFuIGlzc3Vl
Lgo+Cj4gVGhlcmUgaXNuJ3QgYSBkdHMgZmlsZSBmb3IgdGhpcyBiZWNhdXNlIHRoZXJlJ3Mgbm8g
cHVibGljbHkgYXZhaWxhYmxlCj4gaGFyZHdhcmUgdGhhdCBhY3R1YWxseSBoYXMgYW4gQVBMSUMu
IE1heWJlIFZlbnRhbmEgaGF2ZSBwcmUtcHJvZHVjdGlvbgo+IHNpbGljb24gdGhhdCBoYXMgaXQs
IGJ1dCBvdGhlcndpc2UgaXQncyBhIFFFTVUgam9iLgoKMS4gUUVNVSBleGFtcGxlIGlzIGZpbmUg
dG9vIGlmIGl0IGNhbiBiZSByZXByb2R1Y2VkLiBJIGp1c3QgYXNrZWQgZm9yCmEgZHRzIGZpbGUg
YmVjYXVzZSBJIG5lZWQgdGhlIGZ1bGwgZ2xvYmFsIHZpZXcgb2YgdGhlIGRlcGVuZGVuY2llcy4g
QXQKYSBtaW5pbXVtLCBJJ2QgYXQgbGVhc3QgZXhwZWN0IHRvIHNlZSBzb21lIGV4YW1wbGUgRFQg
YW5kIGV4cGxhbmF0aW9uCm9mIHdoYXQgZGVwZW5kZW5jeSBpcyBjYXVzaW5nIHRoZSBJUlEgZGV2
aWNlIHRvIG5vdCBiZSBpbml0aWFsaXplZCBvbgp0aW1lLCBldGMuIEluc3RlYWQgSSBqdXN0IHNl
ZSByYW5kb20gdXNlcyBvZiBmbGFncyB3aXRoIG5vIGRlc2NyaXB0aW9uCm9mIHRoZSBhY3R1YWwg
aXNzdWUuCgoyLiBJZiBpdCdzIG5vdCBhIGR0cyBhdmFpbGFibGUgdXBzdHJlYW0sIHdoeSBzaG91
bGQgdGhlc2UgZHJpdmVycyBiZQphY2NlcHRlZD8gSSB0aG91Z2h0IHRoZSBub3JtIHdhcyB0byBv
bmx5IGFjY2VwdCBkcml2ZXJzIHRoYXQgY2FuCmFjdHVhbGx5IGJlIHVzZWQuCgotU2FyYXZhbmEK
Cj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+IEJ1dCB5b3UgaGF2ZW4ndCBhbnN3ZXJlZCBteSBx
dWVzdGlvbiBbMV0gYW5kIGFyZSBwb2ludGluZyB0byBzb21lCj4gPiByYW5kb20gY29tbWl0IGFu
ZCBibGFtaW5nIGl0LiBUaGF0IGNvbW1pdCBoYXMgbm8gaW1wYWN0IG9uIGFueQo+ID4gZXhpc3Rp
bmcgZGV2aWNlcy9kcml2ZXJzLgo+ID4KPiA+IEhpIE1hcmMsCj4gPgo+ID4gUGxlYXNlIGNvbnNp
ZGVyIHRoaXMgcGF0Y2ggTmFja2VkIGFzIGxvbmcgYXMgRldOT0RFX0ZMQUdfQkVTVF9FRkZPUlQK
PiA+IGlzIHVzZWQgb3IgdW50aWwgQW51cCBhY3R1YWxseSB3b3JrcyB3aXRoIHVzIHRvIGRlYnVn
IHRoZSByZWFsIGlzc3VlLgo+ID4KPiA+IC1TYXJhdmFuYQo+ID4gWzFdIC0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC9DQUFoU2R5MnA2SzcwZmMyeVpMUGRWR3FFcTYxWThGN1dWVDJKOHN0
NW1RcnpCaTRXSGdAbWFpbC5nbWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
