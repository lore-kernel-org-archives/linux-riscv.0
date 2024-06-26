Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C6AC30653
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 00:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiiDEvmMOdNG3YxzQ/dRM+sQqp59XGmotqMPwQmnQKU=; b=QBCiJXXTkJMacH
	+iOQo67je7PR1eAsxGNI4DJAAKMev43KeXEQQ2kCoWHuREZrdVXxN2KQI35yf7Omp2VkdeKGa+X/D
	JCz0AIerRmJtk+okpmqQZmJREgQ1e/AKHhIrGw9gFIfg2hRfm36v6Q2/qboFeyBetmTgY7498yMwM
	Jke7rwyO+iDHgeATY5jGMLAH1Hk8zFLb5SBHF5v6ijc7vy66qEqN23fXwCDQkL5uYRyzdEeWLNmfi
	nJlOj+TgnEcsVJTbXfQH3bJHnDvchmxHwe+8tBlDN+5Wvlz+Jz4lFQmVjp1kreVgDatWNhvBNJX4N
	AoHlq6uXVx6vg3nXkq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMGjp-00000004vHE-3VxS;
	Wed, 26 Jun 2024 00:42:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMGjm-00000004vFZ-2g2s
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 00:42:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso3878a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 17:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719362530; x=1719967330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rsZiF+YKH21/TXG3S46bL21vyEJD44mnnURl//ORSg=;
        b=JMSFZ1imnjuyCM6BsHRBZuRJCNY1Es1NX6wk4YJPVtP9Q8taxuYeYULzQwwnpxUEgA
         FucbfIRN5RBhL2YK7+pywuc4wOCc4tSiBz6evf7GUxxg3bSlzX5QBdPUMtzJ4iN03ZeL
         Cvt6pa+CpHKyhdy3sAutqgq/fKlKUFipSn/AP7QZlPUjmJRPhBHepuWjzyuXpcqnU2fo
         W2RsFjISXhozc++hBIlLVFyqCuuxX/xgtBtEZcJnhkBqzGtEE9NhuMaPRTz6GpXNk3KF
         8du6xi0gWO7QgYSk02SRGsgEnKdpo2hXTvveWpmaWgZ8BiMhcXl4plsN+M7w5hLinofC
         UqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719362530; x=1719967330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rsZiF+YKH21/TXG3S46bL21vyEJD44mnnURl//ORSg=;
        b=LuxypjQz13IrZ0biFUVD69my9hfzR0NldexZDdyjmAJdVSxzMY/HZEXDyFPwlpuM2j
         9+rMNTeOfzgvIc1XHOEEUx1DoxsVVOaLoFdNyAWv5cX7BLopI7WOlRzrXTuo1nNlyNVD
         QlMlmiy7g5RDjUWVBTvLDpLlWlJW2iJPpehkpzSo/fXEfmtG6+vad36bV5ciMRFloY03
         ZxesgPcV3N6Zcml8X2rsQ1tY4vfeSVhjtFWnpWT+Ikk7W7i+xqRnk/GS+mkvhtC37tXk
         q6Oo0BuTUX0jKKmLZBSNGbvN61GoSKUJiJ11wu31xhIE0KW9vSk7s+zwAkei3XJAwDC/
         Zlwg==
X-Forwarded-Encrypted: i=1; AJvYcCXapauKqH7Gr3T/+kAMhwJeuaNhg3e0ajrbD6HSnNBkFmEQknb9BFA1V51jDAuEfgTJPVywn5TyJqkdtWPaEfSfz4VGKa0LIJf635Xa+H7r
X-Gm-Message-State: AOJu0YyaDCIGEc960GCYTdtS5dP7EcNeIjwLyuymHtqHsRvC6dKCmVu2
	0DJGua+7JMUmXyHHtdqM4wba/rkVeb2bCr7PYn2FtmR/tuT+CxTlUt45z8tCee6wU7uV+tnpXPJ
	FRZGs9t7xcplKlindqbYwjU74XuZdFMy4XfQw
X-Google-Smtp-Source: AGHT+IGUXAlcvcMko36NsFRWvk/yokhIRPBWv9q08BRYzOrubTf08XRl+aiyThoXu6xpKOFOPHi5N+LFI2IN9m/bLcI=
X-Received: by 2002:a05:6402:26c7:b0:57c:b712:47b5 with SMTP id
 4fb4d7f45d1cf-583311be705mr113643a12.4.1719362530203; Tue, 25 Jun 2024
 17:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com> <20240625135234.d52ef77c0d84cb19d37dc44f@linux-foundation.org>
 <f975fe76-92f4-4af0-a91d-0f3d8938f6b2@linuxfoundation.org>
In-Reply-To: <f975fe76-92f4-4af0-a91d-0f3d8938f6b2@linuxfoundation.org>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 25 Jun 2024 17:41:42 -0700
Message-ID: <CAG4es9V0XAqe-eqPgjU+sdRS00VOEr0Xda1Dv-gtfEvqsODjiw@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Centralize _GNU_SOURCE definition into lib.mk
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kselftest@vger.kernel.org, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_174214_699090_F2BC5A16 
X-CRM114-Status: GOOD (  16.34  )
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

T24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgNDozNOKAr1BNIFNodWFoIEtoYW4gPHNraGFuQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gNi8yNS8yNCAxNDo1MiwgQW5kcmV3IE1vcnRv
biB3cm90ZToKPiA+IE9uIE1vbiwgMjQgSnVuIDIwMjQgMjM6MjY6MDkgKzAwMDAgRWR3YXJkIExp
YXcgPGVkbGlhd0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPj4gQ2VudHJhbGl6ZXMgdGhlIGRl
ZmluaXRpb24gb2YgX0dOVV9TT1VSQ0UgaW50byBsaWIubWsgYW5kIGFkZHJlc3NlcyBhbGwKPiA+
PiByZXN1bHRpbmcgbWFjcm8gcmVkZWZpbml0aW9uIHdhcm5pbmdzLgo+ID4+Cj4gPj4gVGhlc2Ug
cGF0Y2hlcyB3aWxsIG5lZWQgdG8gYmUgbWVyZ2VkIGluIG9uZSBzaG90IHRvIGF2b2lkIHJlZGVm
aW5pdGlvbgo+ID4+IHdhcm5pbmdzLgo+ID4KPiA+IFllcywgcGxlYXNlIGRvIHRoaXMgYXMgYSBz
aW5nbGUgcGF0Y2ggYW5kIHJlc2VuZD8KPgo+IFNpbmNlIHRoZSBjaGFuZ2UgaXMgbGltaXRlZCB0
byBtYWtlZmlsZXMgYW5kIG9uZSBzb3VyY2UgZmlsZQo+IHdlIGNhbiBtYW5hZ2UgaXQgd2l0aCBv
bmUgcGF0Y2guCj4KPiBQbGVhc2Ugc2VuZCBzaW5nbGUgcGF0Y2ggYW5kIEkgd2lsbCBhcHBseSB0
byBuZXh0IGFuZCB3ZSBjYW4gcmVzb2x2ZQo+IGNvbmZsaWN0cyBpZiBhbnkgYmVmb3JlIHRoZSBt
ZXJnZSB3aW5kb3cgcm9sbHMgYXJvdW5kLgoKU291bmRzIGdvb2QsIEkgc2VudDoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgta3NlbGZ0ZXN0LzIwMjQwNjI1MjIzNDU0LjE1ODYyNTktMS1l
ZGxpYXdAZ29vZ2xlLmNvbQoKPgo+IHRoYW5rcywKPiAtLSBTaHVhaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
