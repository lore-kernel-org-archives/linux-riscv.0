Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5208BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1157260EDF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1157260EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21zCnhgktEQ7WNnd6BzCprroD98sa3kcqscFZiudK6Q=; b=W50Xd7ErkUQ+Ub
	7fJoshNxGxdG8ARmdyMZTGit4WZNcsUC+DcukJLEjHoU8l8fwhCGpMChv56PGk0WWPwben94b612t
	dREWSTCcjRY6YvglYBQge7vTlfBsm7Bn3WQxCTHvZ/lLkmNzJ+vA+EGJ+8zMT7WGGHlgffk/OXhnp
	AcCq/g/rhuJYLxFs9Qds6+GK/S3tg3UvNuVTcZWWXino3gK5OZ/s/K4d6AriTNzONbbx94RJC5MAl
	XnsCEk8Vdon5j8zDhUljj7f2i0Lq1SwW+KFEquay/t74YCuyNYiqpvV8pmX4iIZcYuWr2aA6NsCiT
	ohTt0361+mwn2f8iujYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSKe-00EOvE-Vg; Wed, 13 Oct 2021 00:41:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSKb-00EOtu-A3
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 00:41:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBAB261040
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 00:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634085676;
 bh=GH3igafYeytaTpk7zJsmr6w3R02FY4WrWs5BsNlaxL8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DJddNpRTq6rX0axpfO3wXrIFaGPJAYDjvw1SzFbXzZnlzsteFD8MKDZr6T52lzGRi
 9iz308qT2ug/X1K1WECUIMYuZ2bP+Ag4vJNKzWrh7VQcISb+ffZi6hXoZNhJmHJmue
 o4oP+iIPia7NC01wYayfb8NjWcMDSG892tG1sWCpsCbiOirj8dFkfChAMueW141Odc
 TMDj69XJ4UG/dzsWqW/VCYNW/G6DAiibHqQdSg4Nn5nKn82KSkLOkmlzsjtxVfXezw
 FM16VQrqlsTS9z8l5O5NVpxEav+Ypt7LtIFgO2Irs9IEKhx2bc33p2R/TMuGs/2k6a
 xRcgslQzwICLg==
Received: by mail-vk1-f180.google.com with SMTP id t200so811867vkt.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 17:41:16 -0700 (PDT)
X-Gm-Message-State: AOAM531g4uzWPdrfUMmRd7xicy8RWNxgD/JFYWarLrabTrUAaVvjkBcn
 9zjpoPq8LYunlcBvDMhBANcP6jnZ8hWm7n60S0c=
X-Google-Smtp-Source: ABdhPJzXK69p14VG2+bbGVOT4RRVuxqtUe6l0McroQAIodF6h+L0cP/wsTVSk6Fc6K8MDZdPRNuoAfEZF/aSPd6k1Rg=
X-Received: by 2002:a05:6102:32cd:: with SMTP id
 o13mr30558491vss.50.1634085675849; 
 Tue, 12 Oct 2021 17:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211012153432.2817285-1-guoren@kernel.org>
 <3384738.8kAFQ6LgSR@diego>
In-Reply-To: <3384738.8kAFQ6LgSR@diego>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 08:41:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSpVfgOQVjsZ37ZknmU-Kmht5JXc8D3-Oif2i-RWzfFCQ@mail.gmail.com>
Message-ID: <CAJF2gTSpVfgOQVjsZ37ZknmU-Kmht5JXc8D3-Oif2i-RWzfFCQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: update riscv plic compatible string
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_174117_391771_E9EAC84D 
X-CRM114-Status: GOOD (  16.05  )
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

T24gVHVlLCBPY3QgMTIsIDIwMjEgYXQgMTE6NDEgUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBIaSwKPgo+IEFtIERpZW5zdGFnLCAxMi4gT2t0b2JlciAyMDIx
LCAxNzozNDozMSBDRVNUIHNjaHJpZWIgZ3VvcmVuQGtlcm5lbC5vcmc6Cj4gPiBGcm9tOiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gQWRkIHRoZSBjb21wYXRpYmxl
IHN0cmluZyAidGhlYWQsYzl4eC1wbGljIiB0byB0aGUgcmlzY3YgcGxpYwo+ID4gYmluZGluZ3Mg
dG8gc3VwcG9ydCBTT0NzIHdpdGggdGhlYWQsYzl4eCBwcm9jZXNzb3IgY29yZXMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gQ2M6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBh
bG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPiA+IENjOiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgo+ID4gQ2M6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4gLS0t
Cj4gPiAgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4w
LnlhbWwgICAgICAgICB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAu
MC55YW1sCj4gPiBpbmRleCAwOGQ1YTU3Y2UwMGYuLjIwMmViNzY2NmY5YiAxMDA2NDQKPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+
ID4gQEAgLTQ2LDYgKzQ2LDcgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAtIGVudW06Cj4gPiAg
ICAgICAgICAgIC0gc2lmaXZlLGZ1NTQwLWMwMDAtcGxpYwo+ID4gICAgICAgICAgICAtIGNhbmFh
bixrMjEwLXBsaWMKPiA+ICsgICAgICAgICAgLSB0aGVhZCxjOXh4LXBsaWMKPgo+IERldmljZXRy
ZWUgYmluZGluZ3Mgc2hvdWxkbid0IHVzZSBhc3Rlcmlza3MgKHRoZSB4eC1wYXJ0KS4KPiBJbnN0
ZWFkIHlvdSB3YW50IChwcm9iYWJseSkKPgo+ICsgICAgICAgICAgLSB0aGVhZCxjOTA2LXBsaWMK
PiArICAgICAgICAgIC0gdGhlYWQsYzkxMC1wbGljCk9rYXksIHJlbW92ZSB4eC1wYXJ0LiBCdXQg
SSB3aWxsIHVzZSB0aHJlYWQsYzkwMC1wbGljIGZvciBhbGwgb2YgdGhlbS4KCj4KPiB0byBuYW1l
IHRoZSBzcGVjaWZpYyBTb0NzIHRoYXQgcGxpYyBpcyB1c2VkIG9uCj4KPgo+IEhlaWtvCj4KPiA+
ICAgICAgICAtIGNvbnN0OiBzaWZpdmUscGxpYy0xLjAuMAo+ID4KPiA+ICAgIHJlZzoKPiA+Cj4K
Pgo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
