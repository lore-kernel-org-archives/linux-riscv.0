Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C407EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0DST+HbBGDOqhwqiuZWS0LKM1Hdgq+wsQjnTW8OhL4=; b=UPaF3cffC20fQj
	L7k3BixoVMjgZ5aVeggfrwQ0R8nCtwShxzfczsdvxH4mH3Vo1js4Y622nN5EgSRTrOQf6x5lqkFkm
	g8k0Ex2cM56z5WX3z7RLHV4oIQenlSXULBHPbRtm0D+0208RWlzLoD0/y7bxNmKS5WoQDRBA2MeSP
	gMtTutrTsBlAPheMG8gGSkhRqI8Qygv6nmsJWLN2PVmyWyXsKlD5+UhjxB5oc+6uZwZc+jrgy3gBP
	jGF2z7llKuchQSk5Ygqe34BmI3y0Y0MCmbnt3OEzw09HPNEu8Ph+cIVDLnXOwMcR1VFtE7TgFh/Sk
	SiVsJNw1MHWUvX/k6tQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLR65-004Xuk-2X;
	Mon, 17 Jul 2023 16:29:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLR61-004XtF-1O
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 16:29:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b9ed206018so217585ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689611350; x=1690216150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdC3m+V++Z/viiPrZylihhrytj8yYzk3mKF8HaNWKR8=;
        b=JLAgLws9Ph8sZXiXZU9MF05DdRh4lVloJ4eCxbv6I29WMR5L0rCOLPelFSDEOZhJvt
         64+osbhlLyTLpW/D92uvfSJaEL4sFuEBmrpVS+xj6clTrIc2+bVJGwfbs5n6gHdnEr5B
         YqzqSMwfqaSo3XeFvoWjfbHeM4Cc/MTNc1ecF1B0hr875jx1ozJYDOrdZfwkabhTY752
         2VHpkMBORHmHuzxFkO6mdxouWf2WD6zFkfGAabLUwljGiTe44J/tuB2YOVMzpNsZ9p1i
         sch2dY3rkukgapyWRdaAtY7ju3lclvSIthC+kC+tP83bYfSBV/VxQM9FDLFKyUC+qfpE
         iEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611350; x=1690216150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdC3m+V++Z/viiPrZylihhrytj8yYzk3mKF8HaNWKR8=;
        b=JoGA0itGvdQXBkiPewqmHGD0eEiDtoDJUrUI3QyV0rYz+weXQTQfwCPofxH1jWmvY3
         YjzZpRT1gtHQLfdwbR0fLMdL1d0W7BeRWaXN4RKyT2gksyhhf/13DNDyhR3S4e5EkwAk
         YLK6fHFPHC04yjGeab3gjRx11crRxpS8aJaDao+HzBR5E5ZdJvbmAaGlidvEkvLuXkmf
         Bfn744+Rk+G6AMsgHa+OOgusv342rp5R2q/KkbPXHOma29xTi9/vKEJiELxThyraBAI/
         f5H1Naeo1NkHzOjtjJd6yasqdlS4FxuTnASXvYI0B/kHYE2PbWv9PVfd2QYO/bfBhdtH
         J4MA==
X-Gm-Message-State: ABy/qLZJZuvLNiUMwiZ4qCCdBF2eZUdvocgT29/Z082yt3uzB84ULsNH
	wNHBn64pUf+pWqgSaK06sh8P+UQhSgQufUgnwLF0Dw==
X-Google-Smtp-Source: APBJJlEyymDBpyl7ABeHnCX+wEYEjlMXNDWxLVm6reu3PBE3OUW35nPR5bmepa4Nhj9vtn4nG7ITVPmZXkRqcZH8h0M=
X-Received: by 2002:a17:903:41c4:b0:1b8:5857:ea9a with SMTP id
 u4-20020a17090341c400b001b85857ea9amr1012512ple.23.1689611350208; Mon, 17 Jul
 2023 09:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com> <20230715005405.3689586-3-rananta@google.com>
 <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
In-Reply-To: <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 17 Jul 2023 09:28:58 -0700
Message-ID: <CAJHc60xbPoTeX4oKeg45U6QjBw3CS=ZU0PEVCE1zaoAX4Ex7Vw@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Zenghui Yu <zenghui.yu@linux.dev>, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_092913_687919_58634B8D 
X-CRM114-Status: GOOD (  23.23  )
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

SGkgUGhpbGlwcGUsCgpPbiBNb24sIEp1bCAxNywgMjAyMyBhdCAxOjEz4oCvQU0gUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kKPHBoaWxtZEBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpIFJhZ2hhdmVu
ZHJhLCBEYXZpZCwKPgo+IE9uIDE1LzcvMjMgMDI6NTMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEg
d3JvdGU6Cj4gPiBGcm9tOiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+ID4K
PiA+IFVzZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluc3RlYWQgb2YKPiA+IENPTkZJ
R19IQVZFX0tWTV9BUkNIX1RMQl9GTFVTSF9BTEwuIFRoZSB0d28gbWVjaGFuaXNtcyBzb2x2ZSB0
aGUgc2FtZQo+ID4gcHJvYmxlbSwgYWxsb3dpbmcgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGNvZGUg
dG8gcHJvdmlkZSBhIG5vbi1JUEkKPiA+IGltcGxlbWVudGF0aW9uIG9mIHJlbW90ZSBUTEIgZmx1
c2hpbmcuCj4gPgo+ID4gRHJvcHBpbmcgQ09ORklHX0hBVkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FM
TCBhbGxvd3MgS1ZNIHRvIHN0YW5kYXJkaXplCj4gPiBhbGwgYXJjaGl0ZWN0dXJlcyBvbiBrdm1f
YXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluc3RlYWQgb2YgbWFpbnRhaW5pbmcKPiA+IHR3byBt
ZWNoYW5pc21zLgo+ID4KPiA+IE9wdCB0byBzdGFuZGFyZGl6ZSBvbiBrdm1fYXJjaF9mbHVzaF9y
ZW1vdGVfdGxicygpIHNpbmNlIGl0IGF2b2lkcwo+ID4gZHVwbGljYXRpbmcgdGhlIGdlbmVyaWMg
VExCIHN0YXRzIGFjcm9zcyBhcmNoaXRlY3R1cmVzIHRoYXQgaW1wbGVtZW50Cj4gPiB0aGVpciBv
d24gcmVtb3RlIFRMQiBmbHVzaC4KPiA+Cj4gPiBUaGlzIGFkZHMgYW4gZXh0cmEgZnVuY3Rpb24g
Y2FsbCB0byB0aGUgQVJNNjQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkKPiA+IHBhdGgsIGJ1dCB0
aGF0IGlzIGEgc21hbGwgY29zdCBpbiBjb21wYXJpc29uIHRvIGZsdXNoaW5nIHJlbW90ZSBUTEJz
Lgo+ID4KPiA+IEluIGFkZGl0aW9uLCBpbnN0ZWFkIG9mIGp1c3QgaW5jcmVtZW50aW5nIHJlbW90
ZV90bGJfZmx1c2hfcmVxdWVzdHMKPiA+IHN0YXQsIHRoZSBnZW5lcmljIGludGVyZmFjZSB3b3Vs
ZCBhbHNvIGluY3JlbWVudCB0aGUKPiA+IHJlbW90ZV90bGJfZmx1c2ggc3RhdC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50YUBnb29nbGUuY29tPgo+
ID4gUmV2aWV3ZWQtYnk6IFplbmdodWkgWXUgPHplbmdodWkueXVAbGludXguZGV2Pgo+ID4gQWNr
ZWQtYnk6IE9saXZlciBVcHRvbiA8b2xpdmVyLnVwdG9uQGxpbnV4LmRldj4KPiA+IFJldmlld2Vk
LWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDMgKysrCj4gPiAgIGFyY2gvYXJtNjQva3ZtL0tj
b25maWcgICAgICAgICAgICB8IDEgLQo+ID4gICBhcmNoL2FybTY0L2t2bS9tbXUuYyAgICAgICAg
ICAgICAgfCA2ICsrKy0tLQo+ID4gICB2aXJ0L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgICAg
fCAzIC0tLQo+ID4gICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgICAgICAgICAgfCAyIC0tCj4g
PiAgIDUgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4g
WW91IGFyZSBkb2luZyAyIGNoYW5nZXMgaW4gdGhlIHNhbWUgcGF0Y2g6Cj4KPiAtIEhhdmUgQVJN
IHVzZSBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluc3RlYWQgb2YKPiAgICBIQVZFX0tW
TV9BUkNIX1RMQl9GTFVTSF9BTEwsCj4gLSBEcm9wIHRoZSBub3cgdW51c2VkIEhBVkVfS1ZNX0FS
Q0hfVExCX0ZMVVNIX0FMTC4KPgo+IENvbW1pdHMgc2hvdWxkIGJlIGF0b21pYywgdG8gYWxsb3cg
cGFydGlhbAo+IHJldmVydCBvciBjaGVycnktcGljay4KPgo+IFByZWZlcmFibHkgc3BsaXR0aW5n
IHRoaXMgcGF0Y2ggaW4gMjoKPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPgo+ClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEkgZ3Vlc3Mg
dGhhdCBtYWtlcyBzZW5zZS4gSSdsbCBzcGxpdCB0aGUKcGF0Y2ggaW4gdHdvIGZvciB2Ny4KCi0g
UmFnaGF2ZW5kcmEKPiBSZWdhcmRzLAo+Cj4gUGhpbC4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
