Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3369EC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlk9CCR+3qcFp1045VjZniCrwXm9ybCM+tSyUA3RsFo=; b=aMkeaiqzviyIT2
	qloCeEdjYjdDOyuhm7xdNp4fgF20Q1vxHYmmi+On6MigTJr7ut2aUXmOK1Nu2In74visQ7yV1XOnV
	Z1/X3gXIC7x8zXVApogjWhMcmEcF75Dbi72OgmwGhWIiDofdONM9CuZNX/7g2T6IQXQACauM6kHEy
	wU8r4dbomNffD28voYcHQegcnwio7+VJWhIzemsl2CykXu9Qnf2rwjxSnTka6eaP4ZCGSNcII7ByS
	WVHyx5LAXtTXe8k2Zk0lc5+fSz8a/p/B8AOqH0Ksma+C4Z0j+UZxrtVzNiEbMwSM0ymHCE4aAgdJ+
	w6a7wEDiHKD+BVv9Y8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfboK-00000006mr8-2RwW;
	Fri, 03 Jul 2026 11:11:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfboH-00000006mqD-38U6
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 11:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783077113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJa2AE/q6LxcAJlKRT9Ro3yKfffQf1xa1GooqwuD9kA=;
	b=jDc+zi83uQ1b5vt1xK2Qe9q2lQKpnnSUXrr0xJloutKbURFCDWSvmFCQhn+HCawp/h5/1M
	lWH57vtWKVQ9fifSc40vaN4h9Fglb8uQGpVyJ0a9g+2jV8dIzfC+iO/3Q1+7Oup4GArkiQ
	Zz9q7jxlac9/B7W6G98pEMDLl3o/LsQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-eEXYStd4NVe4MVdw9xtR-A-1; Fri, 03 Jul 2026 07:11:51 -0400
X-MC-Unique: eEXYStd4NVe4MVdw9xtR-A-1
X-Mimecast-MFC-AGG-ID: eEXYStd4NVe4MVdw9xtR-A_1783077111
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1852a86fso5361411cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 04:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077111; x=1783681911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJa2AE/q6LxcAJlKRT9Ro3yKfffQf1xa1GooqwuD9kA=;
        b=Nl0moZDKixqqscK2R2sVXJveyfdo3I7vi8xTrGNMq3o9giZXfkeN5DHJQWLnCyvjOo
         ORqRIjuBEMsX+gIFkm0/1bxPqliOJtjFw2LXg27Z2Iile4NpnvEf2gD3sW0Xu3+GZbD2
         HGeVCF9uin0DnQFSSaie75koCPHW4orjHePvKjkWgUS7JNpADMyVsH0IriiJPGVoyKaU
         3OEuye3Ytgr4h5T7KQeWCUJ3DGSmRqHttireO0+c36QkT3FCFDRwgyqEggkdIpWVvt42
         RG0bD+Wj7ll2mklEFrCCTBCCyMwibLzRV+k/Y2VZrnA41EK9KMDC6wFYO9kGB4BGv9Sz
         T76A==
X-Gm-Message-State: AOJu0YxbicISwuFNYccRzQUiNr1gBgBdf4W5wYhrC+EjFsI6mlDFzEEL
	qtfnIuGBgY1nYEiX8EjuRHc9/sVLJSDhqL8tuXaMTr+ETUw+5N19J7l99pWgo/ivb0HxGCedHWs
	cnSpVnOzE8C5YQPdbwPs6fhrSAV8bdkjj7bu7wRasWs52pU7iAvhZH1Tv9BgtqVNuJy2U3x6XaV
	rnrzll4u8eETVQzRPXOcDqZxKovMJf9Wd0cMgC9k8mYsVk
X-Gm-Gg: AfdE7cl/JOgq/FunEC4rxAti3daP8e8XlEinehPclw6lt2nR4dwit9GoU/VcaIj9pAl
	co9ynDvskg22MyfX2mCW6Jy4uLN6u6lzq2hnYCjIkV7CaAW2mktPy1yLjhXv/BYxp3+9l/VkavE
	OjltqnNb1a5cIPBSYoIPgfValWqXXRo8FW9FgY0AR+5kmW+fs0D+7cfH/0wEBomWSxZg==
X-Received: by 2002:ac8:7d53:0:b0:519:e91a:f4bb with SMTP id d75a77b69052e-51c26a8f88cmr125087421cf.31.1783077110669;
        Fri, 03 Jul 2026 04:11:50 -0700 (PDT)
X-Received: by 2002:ac8:7d53:0:b0:519:e91a:f4bb with SMTP id
 d75a77b69052e-51c26a8f88cmr125086941cf.31.1783077110290; Fri, 03 Jul 2026
 04:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <4b21e0d5-07d1-438b-a6ea-a2be596a3044@web.de>
In-Reply-To: <4b21e0d5-07d1-438b-a6ea-a2be596a3044@web.de>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 3 Jul 2026 23:11:11 +1200
X-Gm-Features: AVVi8Ce5GouoiHvVypy54hHJATfssSZf7IVivve4m9vb8B4fIq_nNJ7KXKAOoB8
Message-ID: <CAO7dBbW_vxnRiq9QrZK0+nuNUkzOG8qrqYhKqzrz3FdRcayVOw@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, kexec@lists.infradead.org, 
	linux-integrity@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Baoquan He <bhe@redhat.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UU2Zup7LWlkbffteFruWlYQQZHkNtXWFt3XxIVWGxlU_1783077111
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_041153_852701_65BEED8F 
X-CRM114-Status: UNSURE (   9.43  )
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

SGkgTWFya3VzLAoKT24gV2VkLCBKdWwgMSwgMjAyNiBhdCA2OjAx4oCvUE0gTWFya3VzIEVsZnJp
bmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGU6Cj4KPiDigKYKPiA+IEZpeCB0aGlzIGJ5
IHNpbXBseSBhZGRpbmcgYSBjaGVjayBiZWZvcmUgY29weS4KPgo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBhIGRhdGEgY29weSBhdHRlbXB0Pwo+Cj4KPgo+ID4g
Rml4ZXM6IGI3ZmI0ZDc4YTZhZCAoIlJJU0MtVjogdXNlIG1lbWNweSBmb3Iga2V4ZWNfZmlsZSBt
b2RlIikKPgo+IFNlZSBhbHNvIG9uY2UgbW9yZToKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0
aW9uL3Byb2Nlc3Mvc3RhYmxlLWtlcm5lbC1ydWxlcy5yc3Q/aD12Ny4yLXJjMSNuMzQKPgo+Cj4g
V291bGQgYSBzdW1tYXJ5IHBocmFzZSBsaWtlIOKAnFByZXZlbnQgbnVsbCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGluIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZSgp4oCdCj4gYmUgbmljZXI/CgpBZ3JlZWQs
IEkgd2lsbCBpbXByb3ZlIGl0IGluIHY0LiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgZ3VpZGFuY2Uh
CgpUaGFua3MsClRhbyBMaXUKCj4KPiBSZWdhcmRzLAo+IE1hcmt1cwo+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
