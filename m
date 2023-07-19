Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4151CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dabsdr0HqgIqgonHbCKzwJX5mnBHvVkh5zuk9poxsK8=; b=G2nnYB42Iu9gW1
	HBRcW5GrClocEi3pJ+Rx+PctcqhRTU05BoeEMO7Y3FNFL+wsZcrdYKwyrO78ddDeimjcUgn9l2WQK
	9El8k8TCwX41rFSsgegYHy1/y0IHhF5GkOSGo+sCt3NXQGVbylHa2LGpLstiurQGfuluMITMo/PW0
	vSIus8Brr0waZ1Ba9V5hkNx/UbkaVHTSql3RYXK0DwRLnwkqI63g+FzYUlyPAmOfg+38jjb1JNCsE
	teNO07V9yzKo5SnN0bw/V/y4dEmq/8H0VqFUfZFWOuFyB7lcg/8n6ptgoDKZjiJJ6WCdMqCeqjVGd
	BU1zgEZ0RjbZXI8b4vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2e3-006O9L-1H;
	Wed, 19 Jul 2023 08:34:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2e1-006O8m-2v
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F9eL+vRLh2IMmmWxtSCYk4DtifazKKWTBnb901S3j94=; b=Qv9wAuV5zVT6be1czDlbRtLGmE
	eYbr/Jd/gmaaJtSvxy/xntVnwIvr25eXt/AbjJL44vQQtyi4KQ2CyRuWCq87i6A6L09TGMyjHpMAD
	dw8OI685QI0R0R48gelMovoXUzMZUtocw65YyyIF9pj8S5htyR5K09YrTfI3KaSw9acYJHj4QlE5M
	dbFheGahjtiNCOwmNNZk4r4F4YmfdYQvZCj1kTM/rBc4wIv8AZgbyBdWX4lYzLXKNlpu4UdEPRdms
	4hrmsht2A35OX8j3Wx1MZFGyTM7Hk0jJROIpaA1VlUmAeTjl3Bdy2Frt+OFIFHosmE5a4uQJAtJML
	Mwxom0fQ==;
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLwiz-00CUd4-2N
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 02:15:37 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-57a8080e4a7so65736377b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1689732867; x=1692324867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9eL+vRLh2IMmmWxtSCYk4DtifazKKWTBnb901S3j94=;
        b=E0qagBYe20SR0SALzjMEgzAAwWZNBuyNfIuFOB5oHd7/unduwTPDowOXpp+9jaIhsk
         yWWws98rOg0AI15RrkDBVlvYl+q+EWOCtTO4U5wc9SPXFO1NrHsi1lJhfbpMLnVvCYSu
         oaogCqHUw7nH2YLUiLkB73e/lfZwIXPUSJs7W+SWDWF5uZgcQ+XMineDaONtZ9cLz3x6
         qFIwAxqXBML/rim1qQxNWhMp2wpGTXV7YkFVf+0lJR5qbVIjM/GxPwfH1ltdJggyZlow
         mW571RQ0nZa7z2F/9ExiiTsk1vBPkwJLlWHYvCs5k2sRgQGq40SZGqPgHZcShBBgy7hi
         TVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689732867; x=1692324867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9eL+vRLh2IMmmWxtSCYk4DtifazKKWTBnb901S3j94=;
        b=Qxq47M7d5G4EjP8Hn5Qx3QTwPsxjWgURhLD+o8+6Hih0BBHRhSoWLM1med/EuB95F8
         jIGiue0Djzdq4hpDoORnfzJ/loSavfsANJN21XsMMzxlcGao9D7kdyjeSkidCTRpamS3
         yhqe0hP0BkKU/e2AwQSFB42vWiWDRM9IQ9ZvkSRY8axZkZTXZF5C7Uyau+nxmlNUDigI
         fL097CaZtjEnxC3Rl5WFxUm45d1BbYkYhoHhoVerEaIcceSQOpMfvgI48XhFDi3pZhsP
         sdng+oGaGgXtTVxVLb0FARSPppstD56w1zw5WRtiaRXsMuStB2KXo7Y/0jLIZXrtEx8/
         3yAw==
X-Gm-Message-State: ABy/qLaWucAEgMIrgH99aYEOc/4R/VLMNWftPKqMjdDIuShZOX0OBtty
	IquB9zH5Q4U3svu4QiV31CK6I5RxPjqUgIm8UWdF
X-Google-Smtp-Source: APBJJlE6HrXGv8FiBWPESZXA4zS7WdaVXKrmS0y2QVal6eHwFQK9KIQhCzYsyt32AHunSvFteTt6TeRzQof/apGmOO8=
X-Received: by 2002:a0d:e843:0:b0:56d:2ad0:cb45 with SMTP id
 r64-20020a0de843000000b0056d2ad0cb45mr17052519ywe.1.1689732867591; Tue, 18
 Jul 2023 19:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-12-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-12-seanjc@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 18 Jul 2023 22:14:16 -0400
Message-ID: <CAHC9VhSUhthtS9W1QkqFd8Y+VHsGVXt1vZenYpqRtr7Gw51B3A@mail.gmail.com>
Subject: Re: [RFC PATCH v11 11/29] security: Export security_inode_init_security_anon()
 for use by KVM
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_031533_907913_D65DFE87 
X-CRM114-Status: GOOD (  11.07  )
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

T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgNzo0OOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3Bo
ZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICBzZWN1cml0eS9zZWN1cml0eS5jIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQWNrZWQtYnk6IFBhdWwgTW9v
cmUgPHBhdWxAcGF1bC1tb29yZS5jb20+Cgo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9zZWN1cml0
eS5jIGIvc2VjdXJpdHkvc2VjdXJpdHkuYwo+IGluZGV4IGI3MjA0MjRjYTM3ZC4uN2ZjNzhmMGYz
NjIyIDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L3NlY3VyaXR5LmMKPiArKysgYi9zZWN1cml0eS9z
ZWN1cml0eS5jCj4gQEAgLTE2NTQsNiArMTY1NCw3IEBAIGludCBzZWN1cml0eV9pbm9kZV9pbml0
X3NlY3VyaXR5X2Fub24oc3RydWN0IGlub2RlICppbm9kZSwKPiAgICAgICAgIHJldHVybiBjYWxs
X2ludF9ob29rKGlub2RlX2luaXRfc2VjdXJpdHlfYW5vbiwgMCwgaW5vZGUsIG5hbWUsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250ZXh0X2lub2RlKTsKPiAgfQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChzZWN1cml0eV9pbm9kZV9pbml0X3NlY3VyaXR5X2Fub24pOwo+Cj4gICNpZmRl
ZiBDT05GSUdfU0VDVVJJVFlfUEFUSAo+ICAvKioKPiAtLQo+IDIuNDEuMC4yNTUuZzhiMWQwNzFj
NTAtZ29vZwoKLS0KcGF1bC1tb29yZS5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
