Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84303C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 15:04:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394E0613AC
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 15:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 394E0613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qVPcaSk4p/02JJ7TOq9ebtlJIsnAr1neYZ4FQHAXCsM=; b=miPnNUzY758axhr7nW2+kvTNpi
	2CW+hRyCtbZoNFUikA8dgXekjBjJSPa00HV9p+eODziQbeqJj9ywTgseJ3VLy6vMNGiBUY6RBQwKT
	TpebLrpy6X9EMJeTaLsgcYzRS1GcoYO7Dbi5v9AZ7wLTjX31vMycHxxwdy0KnaJ5m8M7pmHtuVyhI
	C86xAtQYMMtqfi9xYfgC641aS4OcxRaulAmTsLYweNDtpI2g68AZzeajDSufWkS4L/9BCYRPhN8D7
	RqJ/NcR7s+tR7BupUYPC63j5c/bcFbC/YsdII1Lnq4w9GvfH6x3dCjLlbqLcgAvzYP4tVxEq4mMzK
	SalZjw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlzH-00AyKb-15; Tue, 05 Oct 2021 15:04:11 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlzD-00AyJY-By
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 15:04:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id v19so14359336pjh.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Oct 2021 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ezjhWNNLffOxacY2MX3oY+yRcl8+NMzjlUvbMffez5U=;
 b=LUivbkzaoWTjkEdbE8lk8teCg6efdKH8/wjpX2qcvCu/pkS1+s/8i5QyKFTUrnG0VA
 loD6W5+SuCiURjr21bbRCEofY/Poc3L35Mjhbi+LM9Qxd4nnDQEary3T7nRxsz/FuJF8
 Pq0Et8Z6iI3E9YAD0mtjGFlrlCLMgeAC3t4+olrHLrIZss6yBWOUe1hXJ/LElUcrW/Fi
 86A/sDgVYZDFBQIq4KsEubm//oHObpA/iag4xoHXumjUf3OXKCjht6w6rc64DRlhKe4v
 4UHewUCjNfNc+Gzid2a1wkz/K7nBAFuDx5QskA+LQexy72eDh/jgbd1VGRBtqfkwnPNX
 TLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ezjhWNNLffOxacY2MX3oY+yRcl8+NMzjlUvbMffez5U=;
 b=fS9Kaun++xuKpO06z5shOc7k/HCHJ6h0bsewzrskmBd3wnZ42fOC4s0Q4nPK8auG5S
 LTohBBhIM8e5EapOlH0wknDbYXzHv3SwDIjUe4uI+TJx+DatWkwSoRLoEug0NhTLkXn5
 BRt5hCOUgHL0Ozikrq0S8++lrmoyuNKbGA3ibGsWY8q2PnLRlkuZBsBLHB44IKJAAxvF
 PpODi8c7ZoVxbf0v+3tsyuS0IZP/ayuUQX61HebtcOT7YiwFCXgNrZ7ZxyRI8YALil+J
 3+CGjqAmv/MHpRgk+Oodb7wYstdlt8Z1TN2LYeNutCDBXzzabHAIfvVbvX4+QZUsoGiG
 H5MQ==
X-Gm-Message-State: AOAM532jnY6xLmSsWbzNfCS6yHIKC39l2NvJRsNykKOFHvuqZY8uoolJ
 epFqqPRf7KcgyP9UaxnhGoHqcA==
X-Google-Smtp-Source: ABdhPJzne960yQOEugoxpMdT5nmc2Pr8zbT8eorkTZOXrYJHIozaHR2Qh0E83P1AYKMiIlWKARd9xg==
X-Received: by 2002:a17:902:7fcf:b0:13e:c994:ee67 with SMTP id
 t15-20020a1709027fcf00b0013ec994ee67mr5679359plb.12.1633446245936; 
 Tue, 05 Oct 2021 08:04:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 23sm19811865pfw.97.2021.10.05.08.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:04:05 -0700 (PDT)
Date: Tue, 05 Oct 2021 08:04:05 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Oct 2021 08:04:03 PDT (-0700)
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <ea3a9bab-28f2-48e7-761e-b41d7bc7d0a5@redhat.com>
CC: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, anup@brainfault.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: pbonzini@redhat.com
Message-ID: <mhng-daf7c58d-d8ef-4d68-b387-ba258be48ed3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_080407_440954_EC36049B 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwNSBPY3QgMjAyMSAwMDozNzoyNyBQRFQgKC0wNzAwKSwgcGJvbnppbmlAcmVkaGF0
LmNvbSB3cm90ZToKPiBPbiAwNC8xMC8yMSAyMDowMSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+
IAo+PiBKdXN0IHRvIG1ha2Ugc3VyZSB3ZSdyZSBvbiB0aGUgc2FtZSBwYWdlIGhlcmUsIEkndmUg
Z290Cj4+IAo+PiAgwqDCoCBjb21taXQgNmMzNDFhMjg1OTEyZGRiMjg5NGVmNzkzYTU4YWQ0Zjg0
NjJmMjZmNCAoSEVBRCAtPiBmb3ItbmV4dCkKPj4gIMKgwqAgTWVyZ2U6IDA4ZGExNjA4YTFjYSAz
ZjI0MDFmNDdkMjkKPj4gIMKgwqAgQXV0aG9yOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVs
dEBnb29nbGUuY29tPgo+PiAgwqDCoCBEYXRlOsKgwqAgTW9uIE9jdCA0IDEwOjEyOjQ0IDIwMjEg
LTA3MDAKPj4gIMKgwqDCoMKgwqDCoCBNZXJnZSB0YWcgJ2Zvci1yaXNjdicgb2YgCj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS92aXJ0L2t2bS9rdm0uZ2l0IGludG8gZm9yLW5leHQK
Pj4gIMKgwqDCoMKgwqDCoCBIIGV4dGVuc2lvbiBkZWZpbml0aW9ucywgc2hhcmVkIGJ5IHRoZSBL
Vk0gYW5kIFJJU0MtViB0cmVlcy4KPj4gIMKgwqDCoMKgwqDCoCAqIHRhZyAnZm9yLXJpc2N2JyBv
ZiAKPj4gc3NoOi8vZ2l0b2xpdGUua2VybmVsLm9yZy9wdWIvc2NtL3ZpcnQva3ZtL2t2bTogKDMw
MSBjb21taXRzKQo+PiAgwqDCoMKgwqDCoMKgwqDCoCBSSVNDLVY6IEFkZCBoeXBlcnZpc29yIGV4
dGVuc2lvbiByZWxhdGVkIENTUiBkZWZpbmVzCj4+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogc2Vs
ZnRlc3RzOiBFbnN1cmUgYWxsIG1pZ3JhdGlvbnMgYXJlIHBlcmZvcm1lZCB3aGVuIHRlc3QgCj4+
IGlzIGFmZmluZWQKPj4gIMKgwqDCoMKgwqDCoMKgwqAgS1ZNOiB4ODY6IFN3YXAgb3JkZXIgb2Yg
Q1BVSUQgZW50cnkgImluZGV4IiB2cy4gInNpZ25pZmljYW50IAo+PiBmbGFnIiBjaGVja3MKPj4g
IMKgwqDCoMKgwqDCoMKgwqAgcHRwOiBGaXggcHRwX2t2bV9nZXRjcm9zc3RzdGFtcCBpc3N1ZSBm
b3IgeDg2IHB0cF9rdm0KPj4gIMKgwqDCoMKgwqDCoMKgwqAgeDg2L2t2bWNsb2NrOiBNb3ZlIHRo
aXNfY3B1X3B2dGkgaW50byBrdm1jbG9jay5oCj4+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogczM5
MDogRnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBmaXhlcwo+PiAgwqDCoMKgwqDCoMKgwqDCoCBzZWxm
dGVzdHM6IEtWTTogRG9uJ3QgY2xvYmJlciBYTU0gcmVnaXN0ZXIgd2hlbiByZWFkCj4+ICDCoMKg
wqDCoMKgwqDCoMKgIEtWTTogVk1YOiBGaXggYSBUU1hfQ1RSTF9DUFVJRF9DTEVBUiBmaWVsZCBt
YXNrIGlzc3VlCj4+ICDCoMKgwqDCoMKgwqDCoMKgIHNlbGZ0ZXN0czogS1ZNOiBFeHBsaWNpdGx5
IHVzZSBtb3ZxIHRvIHJlYWQgeG1tIHJlZ2lzdGVycwo+PiAgwqDCoMKgwqDCoMKgwqDCoCBzZWxm
dGVzdHM6IEtWTTogQ2FsbCB1Y2FsbF9pbml0IHdoZW4gc2V0dGluZyB1cCBpbiByc2VxX3Rlc3QK
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgS1ZNOiBSZW1vdmUgdGxic19kaXJ0eQo+PiAgwqDCoMKgwqDC
oMKgwqDCoCBLVk06IFg4NjogU3luY2hyb25pemUgdGhlIHNoYWRvdyBwYWdldGFibGUgYmVmb3Jl
IGxpbmsgaXQKPj4gIMKgwqDCoMKgwqDCoMKgwqAgS1ZNOiBYODY6IEZpeCBtaXNzZWQgcmVtb3Rl
IHRsYiBmbHVzaCBpbiBybWFwX3dyaXRlX3Byb3RlY3QoKQo+PiAgwqDCoMKgwqDCoMKgwqDCoCBL
Vk06IHg4NjogblNWTTogZG9uJ3QgY29weSB2aXJ0X2V4dCBmcm9tIHZtY2IxMgo+PiAgwqDCoMKg
wqDCoMKgwqDCoCBLVk06IHg4NjogblNWTTogdGVzdCBlYXggZm9yIDRLIGFsaWdubWVudCBmb3Ig
R1AgZXJyYXRhIAo+PiB3b3JrYXJvdW5kCj4+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogeDg2OiBz
ZWxmdGVzdHM6IHRlc3Qgc2ltdWx0YW5lb3VzIHVzZXMgb2YgVl9JUlEgZnJvbSBMMSAKPj4gYW5k
IEwwCj4+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogeDg2OiBuU1ZNOiByZXN0b3JlIGludF92ZWN0
b3IgaW4gc3ZtX2NsZWFyX3ZpbnRyCj4+ICDCoMKgwqDCoMKgwqDCoMKgIGt2bTogeDg2OiBBZGQg
QU1EIFBNVSBNU1JzIHRvIG1zcnNfdG9fc2F2ZV9hbGxbXQo+PiAgwqDCoMKgwqDCoMKgwqDCoCBL
Vk06IHg4NjogblZNWDogcmUtZXZhbHVhdGUgZW11bGF0aW9uX3JlcXVpcmVkIG9uIG5lc3RlZCBW
TSBleGl0Cj4+ICDCoMKgwqDCoMKgwqDCoMKgIEtWTTogeDg2OiBuVk1YOiBkb24ndCBmYWlsIG5l
c3RlZCBWTSBlbnRyeSBvbiBpbnZhbGlkIGd1ZXN0IAo+PiBzdGF0ZSBpZiAhZnJvbV92bWVudHJ5
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgIC4uLgo+PiAKPj4gaW50byAKPj4gc3NoOi8vZ2l0QGdpdG9s
aXRlLmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51eC5naXQg
Cj4+IGZvci1uZXh0Cj4+IChJIGtub3cgdGhhdCdzIGtpbmQgb2YgYSBjb25mdXNpbmcgbmFtZSwg
YnV0IGl0J3Mgd2hhdCBJJ3ZlIGJlZW4gdXNpbmcgCj4+IGFzIG15IHNob3J0LXRlcm0gc3RhZ2lu
ZyBicmFuY2ggc28gSSBjYW4gZG8gYWxsIG15IHRlc3RzIGJlZm9yZSBzYXlpbmcgCj4+ICJpdCdz
IG9uIGZvci1uZXh0IikuCj4+IAo+PiBJZiB0aGF0IGxvb2tzIE9LIEkgY2FuIG1ha2UgaXQgYSB0
b3VjaCBtb3JlIG9mZmljaWFsIGJ5IHB1dHRpbmcgaW50byB0aGUgCj4+IFJJU0MtViB0cmVlLgo+
Cj4gWWVzLiAgQWxsIG9mIHRoZSBwYXRjaGVzIGluIHRoZXJlLCBleGNlcHQgdGhlIGxhc3QsIGFy
ZSBhbHJlYWR5IGluIAo+IExpbnVzJ3MgdHJlZS4KCkdyZWF0LCBpdCdzIHVwLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
