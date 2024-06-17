Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE07C27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmmM5IDZd1lnEqjLbocrFHl9QCQTloJGAsUxc/Y5dV8=; b=UuW8SD7QaAT2y6
	MQB5CiW9JrBPqWUEHdnpduvrH3ZOQGz+Nuc1Awnsgtosx1fTXE/6qxNVKxBreQUgt4PZi4XaK584k
	QD+9225QLgbsqffc75HBejCH5JreYyG1nXNL0l4cGHQuJCfxgKsom2Nldhw3+8x/EqWBZYrlGA+bK
	LWf1qoi2LaqdtN4lxkhqcM59hMtssE9XDbi9C9hDQKKYieYLj75X9VoahI1GVLC2OPfRDgi9fuLbK
	I1T1dw0FAPSWvpClYi1PQ6s/Ift1nIN46Lyjo1/dMZLzQKxije/s4wJRyjexrgt6I4ApdDQ+opHz+
	r7uiUEQhN8uZVUQYt4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1v4-00000008pZ0-2JwS;
	Mon, 17 Jun 2024 02:16:30 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1v2-00000008pYY-15gi
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:16:29 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7ebe019b9cdso126868839f.0
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2024 19:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718590587; x=1719195387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBe1Lv7+yYIPYv/ejR+qRz6o9xgdFmnLxhO1bvac0Ys=;
        b=CItzS+ne0L7K8jABVZ9BFLZfazqytHahVICCvZkbu5p8DaddGE7mc6uv0H1/dekoQd
         vKzWDbidLu1KEwpehM9B09s5iIDOmZOcmt2uuV+fblE338RgEWyymBiekcsafdy87nUt
         /Qi/41MglMgOBzxwRmWz+ZdPCye9DxnpSUBtOnBMMkAFz9WuFdNnkZlolelXEY5gBf64
         nbsFMT7/FlfPxPiTjuotlQaW3oC/2nexq0ap6DUb4DoAXgE7oicCJZDqgGlxwt5AubVZ
         IMVQacpaRtMW8vUXMdy/F5sZOSc34hLw87XNSNKz0UWoYwn4P4eMJJ3F6HCUajAnf+T7
         XOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718590587; x=1719195387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBe1Lv7+yYIPYv/ejR+qRz6o9xgdFmnLxhO1bvac0Ys=;
        b=UXPZASjaMND+OxIuhmoZE2PSRfe/VNQ9onnYE2IrbeX3kHobKM8tJ36pDGEf6hfh/q
         LzPMDX44/E3It4a59giIjmQcA0IjYRCNs5JxTi1ruuShbysAFAcv+88R0+gcTvfwBxno
         4cM2cSfiEXfWolwkU/fR+I/WCWKrU/uefHtK2UR8r+EBSXiw47hSUWzXJR35b61Pspik
         OnNHo5GbsXdGFfVnkpxr7Yg91wSr/7UC9aepo7w9PdbZhIYHm97ij51WBmiDMvyarC43
         RGH0xqkprJbIPrWbKP4RklEUHQh0UZ8C3K2kZPARCDHX/ijvIhSe32GveQrbsIOW+ayK
         NQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQaw6mgEbYESD4YIfMUWZaBDrHp8sgd4apKccVXLLip530RV756IbB2EbN0vIPF0p70ziee8W2CwIJlCHYgOezyXcZ+bcFzXu+dnvi8Fg2
X-Gm-Message-State: AOJu0Yygfu9lUv2TkTYbOrm3xe0wgF+qrQI1IJMDVqVx8aYrdxyDLPhc
	x79kL5XxeivVZEJxMupj86g0ilZXfmI+CRPwwgC1ghamJ1SI2br4Z/RgifGnxYHCraiMN3KxR7X
	SAxwfrJLEAzLdozExhD3vdHTbbvKZ/l3TQZUsQA==
X-Google-Smtp-Source: AGHT+IGjqStvPzq4eQHVMVjSkHpNaFIElfvbz63p0MeN0p8pMu3otddGU/WtwKbFVYh2nVlV+RVSIco/aX28xZYpEKg=
X-Received: by 2002:a05:6602:3f95:b0:7eb:9697:95c9 with SMTP id
 ca18e2360f4ac-7ebeaef3ee1mr937068239f.0.1718590587407; Sun, 16 Jun 2024
 19:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-9-zong.li@sifive.com>
 <fb252e35-46e1-48ba-b236-a3296922ffdb@linux.intel.com>
In-Reply-To: <fb252e35-46e1-48ba-b236-a3296922ffdb@linux.intel.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 17 Jun 2024 10:16:16 +0800
Message-ID: <CANXhq0pukeeAEde2i2UDOAU3fhwxf4zx6dzbugU=XGrT7kj+3Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/10] iommu/riscv: support nested iommu for
 flushing cache
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgg@ziepe.ca, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191628_323328_F37C3336 
X-CRM114-Status: UNSURE (   9.41  )
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

T24gU2F0LCBKdW4gMTUsIDIwMjQgYXQgMTE6MjTigK9BTSBCYW9sdSBMdSA8YmFvbHUubHVAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIDYvMTQvMjQgMTA6MjEgUE0sIFpvbmcgTGkgd3Jv
dGU6Cj4gPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgY2FjaGVfaW52YWxpZGF0ZV91c2VyIG9wZXJh
dGlvbiBmb3IgdGhlIHVzZXJzcGFjZQo+ID4gdG8gZmx1c2ggdGhlIGhhcmR3YXJlIGNhY2hlcyBm
b3IgYSBuZXN0ZWQgZG9tYWluIHRocm91Z2ggaW9tbXVmZC4KPgo+ICQgZ3JlcCAiVGhpcyBwYXRj
aCIgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QKPgo+IFNhbWUg
dG8gb3RoZXIgY29tbWl0IG1lc3NhZ2VzLgo+CgpUaGFuayB5b3UgZm9yIHlvdXIgdGlwcy4gSSB3
aWxsIG1vZGlmeSB0aGVtIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IEJlc3QgcmVnYXJkcywKPiBi
YW9sdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
